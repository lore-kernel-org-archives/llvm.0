Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78DB173
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640017934; x=1671553934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmeYQ2+C1rq8NgcMuvBbnlKuOlgOSEfDw7amnUjKDY8=;
  b=mxm3f7f7oNGGfz/jqfvZbE2hPq3/0v5wJFAGn0DP96TJnMnJHt8m9Xm+
   zgUBYadVO1tntVbEav6XA6wf/JXqJFtdkrkZrgQaDqtNCyUMCTiBzUgIN
   Dx0J7xzAKuHfV8qG4/cuN52xzR+rIuUBePP1JbHY+5BHTG34bO6ISOAPP
   uITav3bomzttzl8RqyMDJQ4bUwun9rrUbbMjYAy35JLVmjDI53fMLpH1j
   SgcgIds+yQzYjw6byttG32uH6a0h3vRtkXMlpASRV+5fD0mh1XEDBbQGk
   ChaXKoUWNS8O55broocVQMN0tfwPNeu8oVQjy4GL1n9ItWc+gwhTIy4Pe
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220893177"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="220893177"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 08:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="569903457"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2021 08:32:12 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzLa7-0007zD-H4; Mon, 20 Dec 2021 16:32:11 +0000
Date: Tue, 21 Dec 2021 00:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [chao:feature/dax 8/9] fs/f2fs/file.c:1106:10: error: implicit
 declaration of function 'dax_layout_busy_page'
Message-ID: <202112210031.prMeKhRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/dax
head:   d08999836fd60ab725eee1f5a5fb3b00f7bcefd3
commit: ddf2be0f55254d0a1a8bc51f2c1597c09b1dd2aa [8/9] f2fs: handle layout changes to pinned DAX mappings
config: mips-randconfig-r002-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210031.prMeKhRK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 683cbc12b33e5c8dc8d29bf5ed79fbf45763aadd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=ddf2be0f55254d0a1a8bc51f2c1597c09b1dd2aa
        git remote add chao https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
        git fetch --no-tags chao feature/dax
        git checkout ddf2be0f55254d0a1a8bc51f2c1597c09b1dd2aa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   fs/f2fs/file.c:584:7: error: implicit declaration of function 'daxdev_mapping_supported' [-Werror,-Wimplicit-function-declaration]
           if (!daxdev_mapping_supported(vma, F2FS_I_SB(inode)->s_daxdev))
                ^
>> fs/f2fs/file.c:1106:10: error: implicit declaration of function 'dax_layout_busy_page' [-Werror,-Wimplicit-function-declaration]
                   page = dax_layout_busy_page(inode->i_mapping);
                          ^
>> fs/f2fs/file.c:1106:8: warning: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
                   page = dax_layout_busy_page(inode->i_mapping);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/dax_layout_busy_page +1106 fs/f2fs/file.c

  1096	
  1097	int f2fs_break_layouts(struct inode *inode)
  1098	{
  1099		struct page *page;
  1100		int error;
  1101	
  1102		if (WARN_ON_ONCE(!rwsem_is_locked(&inode->i_mapping->invalidate_lock)))
  1103			return -EINVAL;
  1104	
  1105		do {
> 1106			page = dax_layout_busy_page(inode->i_mapping);
  1107			if (!page)
  1108				return 0;
  1109	
  1110			error = ___wait_var_event(&page->_refcount,
  1111					atomic_read(&page->_refcount) == 1,
  1112					TASK_INTERRUPTIBLE, 0, 0,
  1113					f2fs_wait_dax_page(inode));
  1114		} while (error == 0);
  1115	
  1116		return error;
  1117	}
  1118	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
