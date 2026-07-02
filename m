Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A12D3725;
	Thu,  2 Jul 2026 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956854; cv=none; b=FoU2v5KsTh4HwmdZ14+5wfXQFT6Zv8/3/truDlAZ1zyiKVRuHa6APLqKvnxA9hF3a5wTnoWahIrta682CVNsTVCLlapGpUqt0v/qC7EKDJocovqEKFvTUfUdyvloTA//BEHKd5R7BdivKa1DfiQaFYGnQAY33ti/wa9pUKSini4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956854; c=relaxed/simple;
	bh=4mPBMXuL34W4zZpQApyW6quzYUVVkB/951xz2nfrou4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7efxcxDUu1drO9gBNkx0H5bZ2wo2p8fWzdLpx4r/PSjtuhTqPrGeoh0g40V/DVDmKzQiuUspByZJsMp/pZwUN0R5QuulPbOfyr0zXpAs1GxwRCgZ98XGTPn2DK9b1eo3paXmyJalDDgpYK2VbwC/Db5Hyzt39VtimakQTIznt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrX55lCz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrX55lCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782956852; x=1814492852;
  h=date:from:to:cc:subject:message-id;
  bh=4mPBMXuL34W4zZpQApyW6quzYUVVkB/951xz2nfrou4=;
  b=nrX55lCzV86YyV+oMgB7+1GWnoWbkhLn6UV7KB96WIep9F3Buicyybwc
   oNPP7bVlCETLOtW3ct0c9WWjrMqRFZxkkb7rg3+8lg+5l3jR7nzPjcNaY
   GTJUXA33wF9MJoYtZ7+pr2fIPUX21mBGDx2qhIXzWQH8IFo2fMebGDsc8
   CzaY4uq2aKX7KAHgbqXidzYeDT7HdPcGfaU9wLwpQB7g3lV56PlQfeiGC
   Bdag6Oz03DL2M35hip+Zll4aC1YtpuVUut7kbvb4iUyd6Kf8rVuJfoIYm
   btJeQJlCo5Lhl5c0/Anc4pGNV7ZYXGhUW6G/ugcVvzPtdjUTxxnZy4vof
   Q==;
X-CSE-ConnectionGUID: l7u4XJ1IQJ+/MmM0LXUmlQ==
X-CSE-MsgGUID: O1xSRXPrTJmNvyZpSlV4VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94298299"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94298299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:47:32 -0700
X-CSE-ConnectionGUID: eoWq4utOSQ2zuEndqwj5fA==
X-CSE-MsgGUID: jkZmHq5dTISUxnHulBarGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248742955"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 18:47:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6WD-000000009qb-1SgL;
	Thu, 02 Jul 2026 01:47:14 +0000
Date: Thu, 02 Jul 2026 09:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [davidhildenbrand:ptval_print 2/2]
 include/asm-generic/pgtable-nop4d.h:35:29: error: function cannot return
 array type 'pgd_t' (aka 'unsigned long[2]')
Message-ID: <202607020926.X3vSXV4v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux ptval_print
head:   dc3342ef64ac75a436edc8bfec8e3826e15f0a91
commit: dc3342ef64ac75a436edc8bfec8e3826e15f0a91 [2/2] mm: optimize pmdp_get() and friends for folded pagetable levels
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607020926.X3vSXV4v-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020926.X3vSXV4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020926.X3vSXV4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:13:
   In file included from include/asm-generic/pgtable-nopud.h:7:
>> include/asm-generic/pgtable-nop4d.h:35:29: error: function cannot return array type 'pgd_t' (aka 'unsigned long[2]')
      35 | static inline pgd_t pgdp_get(pgd_t *p4dp)
         |                             ^
>> include/asm-generic/pgtable-nop4d.h:39:9: error: incompatible pointer to integer conversion returning 'pgd_t' (aka 'unsigned long[2]') from a function with result type 'int' [-Wint-conversion]
      39 |         return dummy;
         |                ^~~~~
   include/asm-generic/pgtable-nop4d.h:39:9: warning: address of stack memory associated with local variable 'dummy' returned [-Wreturn-stack-address]
      39 |         return dummy;
         |                ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \


vim +35 include/asm-generic/pgtable-nop4d.h

    34	
  > 35	static inline pgd_t pgdp_get(pgd_t *p4dp)
    36	{
    37		pgd_t dummy = { 0 };
    38	
  > 39		return dummy;
    40	}
    41	#define pgdp_get pgdp_get
    42	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
