Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46702C80
	for <llvm@lists.linux.dev>; Sun, 28 Nov 2021 09:56:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="235637357"
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="235637357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 01:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="458746387"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Nov 2021 01:56:19 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mrGuw-000AYO-SN; Sun, 28 Nov 2021 09:56:18 +0000
Date: Sun, 28 Nov 2021 17:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3421/3897] mm/kasan/shadow.c:528:19: error: use
 of undeclared identifier 'VM_DELAY_KMEMLEAK'
Message-ID: <202111281723.9B8pkVb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: f61bc9ffcab1688372969e3cbb36cab83f045c22 [3421/3897] mm: defer kmemleak object creation of module_alloc()
config: arm64-buildonly-randconfig-r005-20211128 (https://download.01.org/0day-ci/archive/20211128/202111281723.9B8pkVb8-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f61bc9ffcab1688372969e3cbb36cab83f045c22
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f61bc9ffcab1688372969e3cbb36cab83f045c22
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD f30a24ed97b401416118756fa35fbe5d28f999e3 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> mm/kasan/shadow.c:528:19: error: use of undeclared identifier 'VM_DELAY_KMEMLEAK'
                   if (vm->flags & VM_DELAY_KMEMLEAK)
                                   ^
   1 error generated.


vim +/VM_DELAY_KMEMLEAK +528 mm/kasan/shadow.c

   500	
   501	int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask)
   502	{
   503		void *ret;
   504		size_t scaled_size;
   505		size_t shadow_size;
   506		unsigned long shadow_start;
   507	
   508		shadow_start = (unsigned long)kasan_mem_to_shadow(addr);
   509		scaled_size = (size + KASAN_GRANULE_SIZE - 1) >>
   510					KASAN_SHADOW_SCALE_SHIFT;
   511		shadow_size = round_up(scaled_size, PAGE_SIZE);
   512	
   513		if (WARN_ON(!PAGE_ALIGNED(shadow_start)))
   514			return -EINVAL;
   515	
   516		ret = __vmalloc_node_range(shadow_size, 1, shadow_start,
   517				shadow_start + shadow_size,
   518				GFP_KERNEL,
   519				PAGE_KERNEL, VM_NO_GUARD, NUMA_NO_NODE,
   520				__builtin_return_address(0));
   521	
   522		if (ret) {
   523			struct vm_struct *vm = find_vm_area(addr);
   524			__memset(ret, KASAN_SHADOW_INIT, shadow_size);
   525			vm->flags |= VM_KASAN;
   526			kmemleak_ignore(ret);
   527	
 > 528			if (vm->flags & VM_DELAY_KMEMLEAK)
   529				kmemleak_vmalloc(vm, size, gfp_mask);
   530	
   531			return 0;
   532		}
   533	
   534		return -ENOMEM;
   535	}
   536	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
