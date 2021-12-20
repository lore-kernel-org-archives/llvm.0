Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036BE2C82
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640009550; x=1671545550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqvsOpIixW7RTGrdUz0Xm3qC62qrpABj6D5TeHDs8B0=;
  b=E38Mruo3QdHsnrqCiOWm5xNdZ0Ivc8S51rFG3xExZnk0QMBAsVCfLew7
   MiEJ7GBMNi9lt5VST+B74x5sEJ2OFiKiJ5xTfW9ilcGG38359b05r6aWv
   7hbCW7Xdxeh5ET93w6zLE+9eakmGeFa7E1KokyesXjJSeR9TWFQjoSu+I
   +YoLuzEdnfm0cHEsTcJZxiXzCoe6mI4p8Gd1cLCcFcf5Mz/i+mfTW6xjZ
   OUQ3pgBLMKlLcQ+HKYvlU8Tskm9UNYDvoVNzKQEbQBP9kpQtFwqozJODG
   yXhN2H4okpkG4kI7rc2/EtI1oO1XngwpNquyG9wuSTqUJleQUEOoJGBwi
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="227027320"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="227027320"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="755370719"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Dec 2021 06:07:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzJJj-0007pY-NB; Mon, 20 Dec 2021 14:07:07 +0000
Date: Mon, 20 Dec 2021 22:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [chao:feature/dax 4/9] fs/f2fs/file.c:584:7: error: implicit
 declaration of function 'daxdev_mapping_supported'
Message-ID: <202112202110.sW5LQCPm-lkp@intel.com>
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
commit: f154828642167c70161576b977082361123a5768 [4/9] f2fs: support dax page fault
config: mips-randconfig-r002-20211220 (https://download.01.org/0day-ci/archive/20211220/202112202110.sW5LQCPm-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 683cbc12b33e5c8dc8d29bf5ed79fbf45763aadd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=f154828642167c70161576b977082361123a5768
        git remote add chao https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
        git fetch --no-tags chao feature/dax
        git checkout f154828642167c70161576b977082361123a5768
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/file.c:584:7: error: implicit declaration of function 'daxdev_mapping_supported' [-Werror,-Wimplicit-function-declaration]
           if (!daxdev_mapping_supported(vma, F2FS_I_SB(inode)->s_daxdev))
                ^
   1 error generated.


vim +/daxdev_mapping_supported +584 fs/f2fs/file.c

   569	
   570	static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
   571	{
   572		struct inode *inode = file_inode(file);
   573	
   574		if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
   575			return -EIO;
   576	
   577		if (!f2fs_is_compress_backend_ready(inode))
   578			return -EOPNOTSUPP;
   579	
   580		/*
   581		 * We don't support synchronous mappings for non-DAX files and
   582		 * for DAX files if underneath dax_device is not synchronous.
   583		 */
 > 584		if (!daxdev_mapping_supported(vma, F2FS_I_SB(inode)->s_daxdev))
   585			return -EOPNOTSUPP;
   586	
   587		file_accessed(file);
   588	
   589		if (IS_DAX(inode)) {
   590			vma->vm_ops = &f2fs_dax_vm_ops;
   591			vma->vm_flags |= VM_HUGEPAGE;
   592		} else {
   593			vma->vm_ops = &f2fs_file_vm_ops;
   594		}
   595	
   596		set_inode_flag(inode, FI_MMAP_FILE);
   597		return 0;
   598	}
   599	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
