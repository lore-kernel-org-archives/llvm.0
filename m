Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23262C9D
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 05:11:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="223502700"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="223502700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 21:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="609840142"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Dec 2021 21:11:06 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mseN7-000FtV-Lm; Thu, 02 Dec 2021 05:11:05 +0000
Date: Thu, 2 Dec 2021 13:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/4] mm: Probe for sub-page faults in fault_in_*()
Message-ID: <202112021346.8kPeV8ve-lkp@intel.com>
References: <20211201193750.2097885-3-catalin.marinas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201193750.2097885-3-catalin.marinas@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Catalin,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on arm64/for-next/core linus/master v5.16-rc3]
[cannot apply to hnaz-mm/master kdave/for-next next-20211201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Catalin-Marinas/Avoid-live-lock-in-fault-in-uaccess-loops-with-sub-page-faults/20211202-034030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: hexagon-randconfig-r045-20211129 (https://download.01.org/0day-ci/archive/20211202/202112021346.8kPeV8ve-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a25817805b46cbc8d2d7e9d36dfa91e5f8dbf5df
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Catalin-Marinas/Avoid-live-lock-in-fault-in-uaccess-loops-with-sub-page-faults/20211202-034030
        git checkout a25817805b46cbc8d2d7e9d36dfa91e5f8dbf5df
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/gup.c:1764:48: error: passing 'const char *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
               (min_size && probe_subpage_safe_writeable(uaddr, min_size)))
                                                         ^~~~~
   include/linux/uaccess.h:306:64: note: passing argument to parameter 'uaddr' here
   static inline size_t probe_subpage_safe_writeable(void __user *uaddr,
                                                                  ^
   mm/gup.c:1807:42: error: passing 'const char *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
               (min_size && probe_subpage_readable(start, min_size)))
                                                   ^~~~~
   include/linux/uaccess.h:320:58: note: passing argument to parameter 'uaddr' here
   static inline size_t probe_subpage_readable(void __user *uaddr, size_t size)
                                                            ^
   2 errors generated.


vim +1764 mm/gup.c

  1700	
  1701	/*
  1702	 * fault_in_safe_writeable - fault in an address range for writing
  1703	 * @uaddr: start of address range
  1704	 * @size: length of address range
  1705	 * @min_size: minimum size to be faulted in
  1706	 *
  1707	 * Faults in an address range using get_user_pages, i.e., without triggering
  1708	 * hardware page faults.  This is primarily useful when we already know that
  1709	 * some or all of the pages in the address range aren't in memory.
  1710	 *
  1711	 * Other than fault_in_writeable(), this function is non-destructive.
  1712	 *
  1713	 * Note that we don't pin or otherwise hold the pages referenced that we fault
  1714	 * in.  There's no guarantee that they'll stay in memory for any duration of
  1715	 * time.
  1716	 *
  1717	 * Returns the number of bytes not faulted in, like copy_to_user() and
  1718	 * copy_from_user().
  1719	 */
  1720	size_t fault_in_safe_writeable(const char __user *uaddr, size_t size,
  1721				       size_t min_size)
  1722	{
  1723		unsigned long start = (unsigned long)untagged_addr(uaddr);
  1724		unsigned long end, nstart, nend;
  1725		struct mm_struct *mm = current->mm;
  1726		struct vm_area_struct *vma = NULL;
  1727		int locked = 0;
  1728		size_t faulted_in = size;
  1729	
  1730		nstart = start & PAGE_MASK;
  1731		end = PAGE_ALIGN(start + size);
  1732		if (end < nstart)
  1733			end = 0;
  1734		for (; nstart != end; nstart = nend) {
  1735			unsigned long nr_pages;
  1736			long ret;
  1737	
  1738			if (!locked) {
  1739				locked = 1;
  1740				mmap_read_lock(mm);
  1741				vma = find_vma(mm, nstart);
  1742			} else if (nstart >= vma->vm_end)
  1743				vma = vma->vm_next;
  1744			if (!vma || vma->vm_start >= end)
  1745				break;
  1746			nend = end ? min(end, vma->vm_end) : vma->vm_end;
  1747			if (vma->vm_flags & (VM_IO | VM_PFNMAP))
  1748				continue;
  1749			if (nstart < vma->vm_start)
  1750				nstart = vma->vm_start;
  1751			nr_pages = (nend - nstart) / PAGE_SIZE;
  1752			ret = __get_user_pages_locked(mm, nstart, nr_pages,
  1753						      NULL, NULL, &locked,
  1754						      FOLL_TOUCH | FOLL_WRITE);
  1755			if (ret <= 0)
  1756				break;
  1757			nend = nstart + ret * PAGE_SIZE;
  1758		}
  1759		if (locked)
  1760			mmap_read_unlock(mm);
  1761		if (nstart != end)
  1762			faulted_in = min_t(size_t, nstart - start, size);
  1763		if (faulted_in < min_size ||
> 1764		    (min_size && probe_subpage_safe_writeable(uaddr, min_size)))
  1765			return size;
  1766		return size - faulted_in;
  1767	}
  1768	EXPORT_SYMBOL(fault_in_safe_writeable);
  1769	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
