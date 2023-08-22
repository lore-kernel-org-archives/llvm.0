Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C55257;
	Tue, 22 Aug 2023 00:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692664276; x=1724200276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0TOSE7NZYjmKE9HB0o4H1ffQJCmAyQugHMVXs0ipOM=;
  b=L6vLm2/R6Hq89swSVrtQekYTdCxGThERl56tW5s6bk79bnuPZ+xPuc1f
   Ao63Bk531oDaLHs7Si5+jjtWuEfAeOGOi9TQvaIUtAMWAktVeDdOGRc2X
   ha+WbBIpU30HBWhKifGw1dWsY/tUuI0dB7pPYeX4ycjI4foqB22sxH6hz
   c10A90Bp1zJsnDo8uhvpQGbDnMKTtg9C1bGc5kD2HVxejXBqAENp/5wcx
   wOVxLgziulXrbg7mZLJKcB38OQdqS+bzVWNhRHwNarbn6esMhXjvkKSLT
   lZcxrH4JCPilU7G7cZKoGIG6wtIVxznogLdHZbALOSxATp7oG7T5e8EAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354067090"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="354067090"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806098132"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="806098132"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 17:31:13 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYFIe-00016o-1k;
	Tue, 22 Aug 2023 00:31:12 +0000
Date: Tue, 22 Aug 2023 08:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 9/109] arch/powerpc/include/asm/paca.h:291:36:
 warning: declaration of 'struct mm_struct' will not be visible outside of
 this function
Message-ID: <202308220857.uFq2oAxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d
commit: 3a24ea0df83e32355d897a18bbd82e05986dcdc3 [9/109] powerpc/kuap: Use ASM feature fixups instead of static branches
config: powerpc64-randconfig-r012-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220857.uFq2oAxM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220857.uFq2oAxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220857.uFq2oAxM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/mm/nohash/kup.c:11:
   In file included from arch/powerpc/include/asm/kup.h:24:
   In file included from arch/powerpc/include/asm/nohash/kup-booke.h:6:
   In file included from arch/powerpc/include/asm/mmu.h:148:
   In file included from arch/powerpc/include/asm/percpu.h:20:
   arch/powerpc/include/asm/paca.h:155:23: error: field has incomplete type 'struct tlb_core_data'
     155 |         struct tlb_core_data tcd;
         |                              ^
   arch/powerpc/include/asm/paca.h:139:9: note: forward declaration of 'struct tlb_core_data'
     139 |         struct tlb_core_data *tcd_ptr;
         |                ^
>> arch/powerpc/include/asm/paca.h:291:36: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     291 | extern void copy_mm_to_paca(struct mm_struct *mm);
         |                                    ^
   1 warning and 1 error generated.


vim +291 arch/powerpc/include/asm/paca.h

^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds   2005-04-16  290  
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman 2018-10-02 @291  extern void copy_mm_to_paca(struct mm_struct *mm);
d2e60075a3d442 arch/powerpc/include/asm/paca.h Nicholas Piggin  2018-02-14  292  extern struct paca_struct **paca_ptrs;
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman 2010-01-28  293  extern void initialise_paca(struct paca_struct *new_paca, int cpu);
fc53b4202e61c7 arch/powerpc/include/asm/paca.h Matt Evans       2010-07-07  294  extern void setup_paca(struct paca_struct *new_paca);
59f577743d71bf arch/powerpc/include/asm/paca.h Nicholas Piggin  2018-02-14  295  extern void allocate_paca_ptrs(void);
59f577743d71bf arch/powerpc/include/asm/paca.h Nicholas Piggin  2018-02-14  296  extern void allocate_paca(int cpu);
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman 2010-01-28  297  extern void free_unused_pacas(void);
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman 2010-01-28  298  

:::::: The code at line 291 was first introduced by commit
:::::: 54be0b9c7c9888ebe63b89a31a17ee3df6a68d61 Revert "convert SLB miss handlers to C" and subsequent commits

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
