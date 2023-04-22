Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA56AA0;
	Sat, 22 Apr 2023 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682182133; x=1713718133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBtpCfl7jwwf2Hod0CS9/vbbY2YMj6u70vaS2+dkucc=;
  b=WV4TkS3QgrP9K9SK+mPsxpSW2aoZcXY05wdqKNh2SglsG01ONy+l9Arp
   v40pkGfcDfhvKgRWcWmrnWbRH+jl3y4v0WkZTfjuz9XfXW3Y6RV7ehp5k
   O7T4TgH7wNMpl+D0P8PduOpOtod30owgonx2wLpjTjBg1CtllVr2ddOcz
   8f3dyrd8Fg0A/yFNRk9MnhBR1igKsIwCHrLDPp9Jlj6UTY40rQHB5DyH/
   isAKztaNptg4Z919sw3fvGUSB5fpnRh6qAOI0YANcYGKBgW+jG+UAofwW
   sHjsG+qNieDFtG5IE4s6JUJOxqt+4dzAu1fIqsdFQMvRLNaS5fljAnUDW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330382973"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="330382973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 09:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="692585539"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="692585539"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Apr 2023 09:48:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqGPo-000hPA-3B;
	Sat, 22 Apr 2023 16:48:48 +0000
Date: Sun, 23 Apr 2023 00:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:mm/mremap-pmd-warning-2 1/1] mm/mremap.c:809:18: error: use
 of undeclared identifier 'old_addr'; did you mean 'new_addr'?
Message-ID: <202304230008.dleNKiqY-lkp@intel.com>
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
config: riscv-randconfig-r042-20230421 (https://download.01.org/0day-ci/archive/20230423/202304230008.dleNKiqY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=5cacbf1f3489c227cb2e78e0b9ef454a9363d680
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern mm/mremap-pmd-warning-2
        git checkout 5cacbf1f3489c227cb2e78e0b9ef454a9363d680
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230008.dleNKiqY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mremap.c:809:18: error: use of undeclared identifier 'old_addr'; did you mean 'new_addr'?
           if ((new_addr > old_addr) &&
                           ^~~~~~~~
                           new_addr
   mm/mremap.c:788:17: note: 'new_addr' declared here
                   unsigned long new_addr, unsigned long new_len, bool *locked,
                                 ^
   1 error generated.


vim +809 mm/mremap.c

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
