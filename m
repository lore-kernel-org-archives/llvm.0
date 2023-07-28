Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C7125B3;
	Fri, 28 Jul 2023 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690533058; x=1722069058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29/niJndPeZ3E+e15le0HpMBhvjA0mlq6ZWEZErA8H4=;
  b=C02DccZeg6BaO5wnZlePuVZpolqxCm6//8b57FHJDDCuvJuBNyHPUko5
   DCfyeu/txkb0tvbTY9zDgWbBB9PpEon6rz+V2+QGFY9JXgNuKpBiMbaUM
   CGGPTeLpYaKeXBqQOfjyI5J7SWOeaA9ee99hTQzdV9gDDGrRWcgWnQRJh
   uUE+MZPceLJQWPnutRNHmBjm83L3IpcdsqqT5aWcLmI5TwWwZk9FHiU3R
   h7gitO24mGUH4UjNJ8QX1UIS1qboQ8HUUNch9zmdbb215dELfD4wnxVi8
   s2Jyj8oxgQkTElIMLiX3jLGL85lUwA4D2M287g7Zpvi3GapXGgRyhtwzQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365999505"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="365999505"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 01:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817415413"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817415413"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2023 01:30:55 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPIqs-00032F-1K;
	Fri, 28 Jul 2023 08:30:03 +0000
Date: Fri, 28 Jul 2023 16:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5015/5284] arch/powerpc/mm/init_64.c:201:15:
 error: no previous prototype for function '__vmemmap_populate'
Message-ID: <202307281617.OxcXz84j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 5d1acc0d9b24e48fde5297a6a40cb9c1a682d740 [5015/5284] powerpc/book3s64/radix: remove mmu_vmemmap_psize
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20230728/202307281617.OxcXz84j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281617.OxcXz84j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281617.OxcXz84j-lkp@intel.com/

All errors (new ones prefixed by >>):

                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:231:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/init_64.c:27:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:233:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/init_64.c:27:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:235:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/init_64.c:27:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:237:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/init_64.c:27:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:239:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/init_64.c:201:15: error: no previous prototype for function '__vmemmap_populate' [-Werror,-Wmissing-prototypes]
   int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
                 ^
   arch/powerpc/mm/init_64.c:201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
   ^
   static 
   13 errors generated.


vim +/__vmemmap_populate +201 arch/powerpc/mm/init_64.c

   200	
 > 201	int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
   202					 struct vmem_altmap *altmap)
   203	{
   204		bool altmap_alloc;
   205		unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
   206	
   207		/* Align to the page size of the linear mapping. */
   208		start = ALIGN_DOWN(start, page_size);
   209	
   210		pr_debug("vmemmap_populate %lx..%lx, node %d\n", start, end, node);
   211	
   212		for (; start < end; start += page_size) {
   213			void *p = NULL;
   214			int rc;
   215	
   216			/*
   217			 * This vmemmap range is backing different subsections. If any
   218			 * of that subsection is marked valid, that means we already
   219			 * have initialized a page table covering this range and hence
   220			 * the vmemmap range is populated.
   221			 */
   222			if (vmemmap_populated(start, page_size))
   223				continue;
   224	
   225			/*
   226			 * Allocate from the altmap first if we have one. This may
   227			 * fail due to alignment issues when using 16MB hugepages, so
   228			 * fall back to system memory if the altmap allocation fail.
   229			 */
   230			if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
   231				p = vmemmap_alloc_block_buf(page_size, node, altmap);
   232				if (!p)
   233					pr_debug("altmap block allocation failed, falling back to system memory");
   234				else
   235					altmap_alloc = true;
   236			}
   237			if (!p) {
   238				p = vmemmap_alloc_block_buf(page_size, node, NULL);
   239				altmap_alloc = false;
   240			}
   241			if (!p)
   242				return -ENOMEM;
   243	
   244			if (vmemmap_list_populate(__pa(p), start, node)) {
   245				/*
   246				 * If we don't populate vmemap list, we don't have
   247				 * the ability to free the allocated vmemmap
   248				 * pages in section_deactivate. Hence free them
   249				 * here.
   250				 */
   251				int nr_pfns = page_size >> PAGE_SHIFT;
   252				unsigned long page_order = get_order(page_size);
   253	
   254				if (altmap_alloc)
   255					vmem_altmap_free(altmap, nr_pfns);
   256				else
   257					free_pages((unsigned long)p, page_order);
   258				return -ENOMEM;
   259			}
   260	
   261			pr_debug("      * %016lx..%016lx allocated at %p\n",
   262				 start, start + page_size, p);
   263	
   264			rc = vmemmap_create_mapping(start, page_size, __pa(p));
   265			if (rc < 0) {
   266				pr_warn("%s: Unable to create vmemmap mapping: %d\n",
   267					__func__, rc);
   268				return -EFAULT;
   269			}
   270		}
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
