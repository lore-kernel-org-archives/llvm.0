Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA862C80
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 12:05:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="235995347"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="235995347"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 04:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="675784750"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2021 04:05:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqwSi-0009SZ-5p; Sat, 27 Nov 2021 12:05:48 +0000
Date: Sat, 27 Nov 2021 20:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/btrfs-live-lock-fix 2/4] mm/gup.c:1679:7: error:
 implicit declaration of function 'probe_subpage_user_writeable'
Message-ID: <202111271919.5wQ5tok2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/btrfs-live-lock-fix
head:   eade0a26bad9d83117f472f6eebd84b90cef0dae
commit: 01859d53b56e5d9eafe838c11532d072e40d4f53 [2/4] mm: Probe for sub-page faults in fault_in_writeable()
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/archive/20211127/202111271919.5wQ5tok2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=01859d53b56e5d9eafe838c11532d072e40d4f53
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/btrfs-live-lock-fix
        git checkout 01859d53b56e5d9eafe838c11532d072e40d4f53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/gup.c:1679:7: error: implicit declaration of function 'probe_subpage_user_writeable' [-Werror,-Wimplicit-function-declaration]
           if (!probe_subpage_user_writeable(uaddr, size))
                ^
   mm/gup.c:1679:7: note: did you mean 'probe_subpage_user_writable'?
   include/linux/uaccess.h:291:20: note: 'probe_subpage_user_writable' declared here
   static inline bool probe_subpage_user_writable(void __user *uaddr, size_t size)
                      ^
   1 error generated.


vim +/probe_subpage_user_writeable +1679 mm/gup.c

  1660	
  1661	/**
  1662	 * fault_in_writeable - fault in userspace address range for writing
  1663	 * @uaddr: start of address range
  1664	 * @size: size of address range
  1665	 *
  1666	 * Returns the number of bytes not faulted in (like copy_to_user() and
  1667	 * copy_from_user()).
  1668	 */
  1669	size_t fault_in_writeable(char __user *uaddr, size_t size)
  1670	{
  1671		char __user *start = uaddr, *end;
  1672	
  1673		if (unlikely(size == 0))
  1674			return 0;
  1675		/*
  1676		 * Probe the beginning of the buffer for sub-page faults within the
  1677		 * error margin of the corresponding uaccess.
  1678		 */
> 1679		if (!probe_subpage_user_writeable(uaddr, size))
  1680			return size;
  1681		if (!PAGE_ALIGNED(uaddr)) {
  1682			if (unlikely(__put_user(0, uaddr) != 0))
  1683				return size;
  1684			uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
  1685		}
  1686		end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
  1687		if (unlikely(end < start))
  1688			end = NULL;
  1689		while (uaddr != end) {
  1690			if (unlikely(__put_user(0, uaddr) != 0))
  1691				goto out;
  1692			uaddr += PAGE_SIZE;
  1693		}
  1694	
  1695	out:
  1696		if (size > uaddr - start)
  1697			return size - (uaddr - start);
  1698		return 0;
  1699	}
  1700	EXPORT_SYMBOL(fault_in_writeable);
  1701	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
