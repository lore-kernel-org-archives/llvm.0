Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7BB6AA0;
	Sat, 22 Apr 2023 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682183398; x=1713719398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQzUTmsl2VNIVf3mJzY+9msqAyvJ2YDvqbBDuDQEUT4=;
  b=TnRxw7wRzcNufd771KWNbvalKbJFk9HTpVQDLS3r4QudUJXk2gTHdHup
   wK/ineGC8vUjnqrkJWok5lixU0zOybpV9A7p7T9rDlY+jCRjg9g1lbyAj
   futtZ1YYbV/O2itBjBOfwjt3Ob5MspghMT8v6GIpIFJ+mDRz6Y5VBXigS
   /+o/0BG6i9iK48jPkxYBM3QUfCgMo7ZCvTrhO01icIH4vL+FZTQW53QA4
   3j3upxSYLl02GcleVeL6PmE1+dpgdkUtWz0qgSrPeeN7NB4dmIUhTV8V4
   QuWh7Y1S8fJskOKhQ8g4Oej/Ge54Ts5G2DwfVu9Wvcla1P5WOv0ekongE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="344926457"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="344926457"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 10:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022210069"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="1022210069"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 10:09:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqGk9-000hPY-0g;
	Sat, 22 Apr 2023 17:09:49 +0000
Date: Sun, 23 Apr 2023 01:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:mm/mremap-pmd-warning-2 1/1] mm/mremap.c:809:18: error: use
 of undeclared identifier 'old_addr'
Message-ID: <202304230141.Q4mJPklv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git mm/mremap-pmd-warning-2
head:   5cacbf1f3489c227cb2e78e0b9ef454a9363d680
commit: 5cacbf1f3489c227cb2e78e0b9ef454a9363d680 [1/1] mremap: Allow backward overlapping moves
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230423/202304230141.Q4mJPklv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=5cacbf1f3489c227cb2e78e0b9ef454a9363d680
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern mm/mremap-pmd-warning-2
        git checkout 5cacbf1f3489c227cb2e78e0b9ef454a9363d680
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230141.Q4mJPklv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mremap.c:809:18: error: use of undeclared identifier 'old_addr'
           if ((new_addr > old_addr) &&
                           ^
   1 error generated.


vim +/old_addr +809 mm/mremap.c

   786	
   787	static unsigned long mremap_to(unsigned long addr, unsigned long old_len,
   788			unsigned long new_addr, unsigned long new_len, bool *locked,
   789			unsigned long flags, struct vm_userfaultfd_ctx *uf,
   790			struct list_head *uf_unmap_early,
   791			struct list_head *uf_unmap)
   792	{
   793		struct mm_struct *mm = current->mm;
   794		struct vm_area_struct *vma;
   795		unsigned long ret = -EINVAL;
   796		unsigned long map_flags = 0;
   797	
   798		if (offset_in_page(new_addr))
   799			goto out;
   800	
   801		if (new_len > TASK_SIZE || new_addr > TASK_SIZE - new_len)
   802			goto out;
   803	
   804		/*
   805		 * Ensure the old/new locations do not overlap for forward moves.
   806		 * Backward overlapping moves are still OK as we do them for the stack
   807		 * during execve() anyway.
   808		 */
 > 809		if ((new_addr > old_addr) &&
   810		    (addr + old_len > new_addr && new_addr + new_len > addr))
   811			goto out;
   812	
   813		/*
   814		 * move_vma() need us to stay 4 maps below the threshold, otherwise
   815		 * it will bail out at the very beginning.
   816		 * That is a problem if we have already unmaped the regions here
   817		 * (new_addr, and old_addr), because userspace will not know the
   818		 * state of the vma's after it gets -ENOMEM.
   819		 * So, to avoid such scenario we can pre-compute if the whole
   820		 * operation has high chances to success map-wise.
   821		 * Worst-scenario case is when both vma's (new_addr and old_addr) get
   822		 * split in 3 before unmapping it.
   823		 * That means 2 more maps (1 for each) to the ones we already hold.
   824		 * Check whether current map count plus 2 still leads us to 4 maps below
   825		 * the threshold, otherwise return -ENOMEM here to be more safe.
   826		 */
   827		if ((mm->map_count + 2) >= sysctl_max_map_count - 3)
   828			return -ENOMEM;
   829	
   830		if (flags & MREMAP_FIXED) {
   831			ret = do_munmap(mm, new_addr, new_len, uf_unmap_early);
   832			if (ret)
   833				goto out;
   834		}
   835	
   836		if (old_len > new_len) {
   837			ret = do_munmap(mm, addr+new_len, old_len - new_len, uf_unmap);
   838			if (ret)
   839				goto out;
   840			old_len = new_len;
   841		}
   842	
   843		vma = vma_to_resize(addr, old_len, new_len, flags);
   844		if (IS_ERR(vma)) {
   845			ret = PTR_ERR(vma);
   846			goto out;
   847		}
   848	
   849		/* MREMAP_DONTUNMAP expands by old_len since old_len == new_len */
   850		if (flags & MREMAP_DONTUNMAP &&
   851			!may_expand_vm(mm, vma->vm_flags, old_len >> PAGE_SHIFT)) {
   852			ret = -ENOMEM;
   853			goto out;
   854		}
   855	
   856		if (flags & MREMAP_FIXED)
   857			map_flags |= MAP_FIXED;
   858	
   859		if (vma->vm_flags & VM_MAYSHARE)
   860			map_flags |= MAP_SHARED;
   861	
   862		ret = get_unmapped_area(vma->vm_file, new_addr, new_len, vma->vm_pgoff +
   863					((addr - vma->vm_start) >> PAGE_SHIFT),
   864					map_flags);
   865		if (IS_ERR_VALUE(ret))
   866			goto out;
   867	
   868		/* We got a new mapping */
   869		if (!(flags & MREMAP_FIXED))
   870			new_addr = ret;
   871	
   872		ret = move_vma(vma, addr, old_len, new_len, new_addr, locked, flags, uf,
   873			       uf_unmap);
   874	
   875	out:
   876		return ret;
   877	}
   878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
