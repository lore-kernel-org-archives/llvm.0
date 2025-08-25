Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94C298994;
	Mon, 25 Aug 2025 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111654; cv=none; b=dgJQf2eJL1QOpMTcRUKyY5uM8RS2THoB6K9Chpve/nhuJbT15/+TBGU1W4i+PjWxgmBW2Q+Fau8Cgzm1CdmVQ34XHhTSniz53sCK2WZjwUY1vcT458+VgvkuGhAt4MZwk/iO1BtNYcRxkWysy6TpuIBgGAIM2b4TTYtSOSxEtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111654; c=relaxed/simple;
	bh=myRCeTvxawajwk6mq1JjQrSHPOgouZjsTXSjcz0l9II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/kPbpxPnqXVtkxkKtCtUeiT7M8WBZnVWBGLdX3lqn/6o+TdZvXu14MDjWaMzXSWlfspul8/qsTki4eu56QcmUmCoOwCV72hur3avo/KYQhAeQOCdSWWfAkcjw0f9dJbC2lEAdkFS0Zm9X5yKKNPXTTC57otnrKZn7Ch7WxDTDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlaI0btW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlaI0btW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756111653; x=1787647653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myRCeTvxawajwk6mq1JjQrSHPOgouZjsTXSjcz0l9II=;
  b=jlaI0btW+YKCJ2Id5p9uu0fOXdfNqp5j/fBDWuUY6Omo4vdChPHZxQUW
   d6Z4fks9RV4ldOzRgD+gM4qbnahB3B8IMiMMa8oKeA6uaCFXX+ZPsGkvR
   bIO4uM9K4ZgHvVGqSBLP7xJ7nCqOhL6LN5Yg2CIuHO/MRNNeQD8cq8Mpa
   lhoPbfFUgjUywxdFlIm+6++QDo5LydztRFB9E/Xf7UU1bZsOqEHpQWcTQ
   0eF/moMWYHDUtbOAzS0dqbxcTjNLANN8imdhwEHeK+WsJyhuYBDbDSJc9
   cKt1YXzNpK0t2t8f4MCEGZC2OGpXF1Omh1qboNTKhQYy/pd0qt8ohpOLZ
   Q==;
X-CSE-ConnectionGUID: U1atoYABRwyOHuQp7hk2QA==
X-CSE-MsgGUID: PZLBCJMNTPSNp5q2m8vYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="62133711"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62133711"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 01:47:32 -0700
X-CSE-ConnectionGUID: C2CRIJaVQh6BRgFpiHmxGw==
X-CSE-MsgGUID: EpVgtyxDQw+AhyRFP3wI4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169133597"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 01:47:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqSrN-000NWz-32;
	Mon, 25 Aug 2025 08:47:28 +0000
Date: Mon, 25 Aug 2025 16:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rohan McLure <rmclure@linux.ibm.com>
Subject: [akpm-mm:mm-unstable 137/202]
 arch/riscv/include/asm/pgtable.h:951:42: error: too many arguments to
 function call, expected 2, have 3
Message-ID: <202508251910.y6khnd73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   20ada06259f5ba9c657c3098a15deec1f4c5687d
commit: 3b71766a08b70797f43fe9ea3e4eef1c2665ac8b [137/202] mm-page_table_check-reinstate-address-parameter-in-page_table_check_pud_set-fix
config: riscv-randconfig-001-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251910.y6khnd73-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251910.y6khnd73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251910.y6khnd73-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:951:42: error: too many arguments to function call, expected 2, have 3
     951 |         page_table_check_pud_clear(mm, address, pud);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~              ^~~
   include/linux/page_table_check.h:125:20: note: 'page_table_check_pud_clear' declared here
     125 | static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
         |                    ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +951 arch/riscv/include/asm/pgtable.h

   944	
   945	#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
   946	static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
   947						    unsigned long address, pud_t *pudp)
   948	{
   949		pud_t pud = __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
   950	
 > 951		page_table_check_pud_clear(mm, address, pud);
   952	
   953		return pud;
   954	}
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
