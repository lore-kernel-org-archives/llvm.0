Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDE1C8FB9;
	Tue, 20 Aug 2024 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195700; cv=none; b=NVSZ/B/YCbibBbsV10TRyS5RKFOpA6YJfOpAH0vcB1Fazpip5vVzCH1LTjguJog0+7VyRBvXzDngudg/LM88JCVL30eFUUGaUDRXyvMTqrqbthio9iMkRtV7BwLAYV5lbAKwWWRrZTzsbknFQwNFrZGXlYbWpSOXrFw6hL0HUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195700; c=relaxed/simple;
	bh=I+wmVZinqwNjQ3xPnYXg1SY9KnAkH3wI0DKkrVE4V6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gpGcW6pHTBVuKksY9GRQyPg12mAj42vvSd6mh6g1b1GDcBYFt0i4Y9FQMpK5lqjnZf79EwdpR7VRIK8C7n+vjzdUn1+ghk9ioHulhI7p6Eq2QN3Yh28GNOLBVVLL66F/1z6+PvKO3UJ1/n9OCOtyw6J+HKneiIwoyoorpjCw60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLBATEe7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLBATEe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724195699; x=1755731699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+wmVZinqwNjQ3xPnYXg1SY9KnAkH3wI0DKkrVE4V6U=;
  b=gLBATEe7HREZHHh4hJMbykvXW3rdfw5vwqhRDGtNFBKJEFyP82Q4xa6G
   ul0GxPlgilxXxcXYUN6NFfkOhQoP7r7g3VS8VrfEqlRoH/SuHLYQCnMU6
   0YaMHsuLkgBeoskSWcwj4z8MIH5V9L6ti5VvOqSTx5CJ9bcz4Vz+yJjyV
   Tz5d2otx5Juc+rHV8fDFxjQ/NGZs95ppe7moQruY3mYAYTOkp+bQfL+j3
   whChPgRLdUYESZBYRzZ9f5TmT+AhBUHIEVYu7GVgCtOFLXeps80MKVNGd
   gjCqRW81DFl0IvmoUdvKCMWNUHFJyONHKEfNVFgoTcgG6zud/LXPGt+kB
   Q==;
X-CSE-ConnectionGUID: FoqyHZgGQrq0T8qCvLGu3g==
X-CSE-MsgGUID: bp72VNCXS2mWCS9PNkMw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22394446"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22394446"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 16:14:59 -0700
X-CSE-ConnectionGUID: XQPLXe1IRimJsgRZAqyAkQ==
X-CSE-MsgGUID: Df4JRpUPQ8+NMShJxHN3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60850865"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2024 16:14:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgY3y-000Agq-2M;
	Tue, 20 Aug 2024 23:14:54 +0000
Date: Wed, 21 Aug 2024 07:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk:for-next 1/2] arch/arm/kernel/entry-armv.S:1074:2: error:
 unexpected token at start of statement
Message-ID: <202408210701.GDRXhJZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   2ba94d53af55eff22021d9d6c9db02bc7fba5029
commit: 471fc0d32ab5095d941634de2bb1a7672048557f [1/2] ARM: 9413/1: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20240821/202408210701.GDRXhJZr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210701.GDRXhJZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210701.GDRXhJZr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/entry-armv.S:1074:2: error: unexpected token at start of statement
    (.reloc .text, R_ARM_NONE, .)
    ^


vim +1074 arch/arm/kernel/entry-armv.S

   934	
   935	vector_rst:
   936	 ARM(	swi	SYS_ERROR0	)
   937	 THUMB(	svc	#0		)
   938	 THUMB(	nop			)
   939		b	vector_und
   940	
   941	/*
   942	 * Interrupt dispatcher
   943	 */
   944		vector_stub	irq, IRQ_MODE, 4
   945	
   946		.long	__irq_usr			@  0  (USR_26 / USR_32)
   947		.long	__irq_invalid			@  1  (FIQ_26 / FIQ_32)
   948		.long	__irq_invalid			@  2  (IRQ_26 / IRQ_32)
   949		.long	__irq_svc			@  3  (SVC_26 / SVC_32)
   950		.long	__irq_invalid			@  4
   951		.long	__irq_invalid			@  5
   952		.long	__irq_invalid			@  6
   953		.long	__irq_invalid			@  7
   954		.long	__irq_invalid			@  8
   955		.long	__irq_invalid			@  9
   956		.long	__irq_invalid			@  a
   957		.long	__irq_invalid			@  b
   958		.long	__irq_invalid			@  c
   959		.long	__irq_invalid			@  d
   960		.long	__irq_invalid			@  e
   961		.long	__irq_invalid			@  f
   962	
   963	/*
   964	 * Data abort dispatcher
   965	 * Enter in ABT mode, spsr = USR CPSR, lr = USR PC
   966	 */
   967		vector_stub	dabt, ABT_MODE, 8
   968	
   969		.long	__dabt_usr			@  0  (USR_26 / USR_32)
   970		.long	__dabt_invalid			@  1  (FIQ_26 / FIQ_32)
   971		.long	__dabt_invalid			@  2  (IRQ_26 / IRQ_32)
   972		.long	__dabt_svc			@  3  (SVC_26 / SVC_32)
   973		.long	__dabt_invalid			@  4
   974		.long	__dabt_invalid			@  5
   975		.long	__dabt_invalid			@  6
   976		.long	__dabt_invalid			@  7
   977		.long	__dabt_invalid			@  8
   978		.long	__dabt_invalid			@  9
   979		.long	__dabt_invalid			@  a
   980		.long	__dabt_invalid			@  b
   981		.long	__dabt_invalid			@  c
   982		.long	__dabt_invalid			@  d
   983		.long	__dabt_invalid			@  e
   984		.long	__dabt_invalid			@  f
   985	
   986	/*
   987	 * Prefetch abort dispatcher
   988	 * Enter in ABT mode, spsr = USR CPSR, lr = USR PC
   989	 */
   990		vector_stub	pabt, ABT_MODE, 4
   991	
   992		.long	__pabt_usr			@  0 (USR_26 / USR_32)
   993		.long	__pabt_invalid			@  1 (FIQ_26 / FIQ_32)
   994		.long	__pabt_invalid			@  2 (IRQ_26 / IRQ_32)
   995		.long	__pabt_svc			@  3 (SVC_26 / SVC_32)
   996		.long	__pabt_invalid			@  4
   997		.long	__pabt_invalid			@  5
   998		.long	__pabt_invalid			@  6
   999		.long	__pabt_invalid			@  7
  1000		.long	__pabt_invalid			@  8
  1001		.long	__pabt_invalid			@  9
  1002		.long	__pabt_invalid			@  a
  1003		.long	__pabt_invalid			@  b
  1004		.long	__pabt_invalid			@  c
  1005		.long	__pabt_invalid			@  d
  1006		.long	__pabt_invalid			@  e
  1007		.long	__pabt_invalid			@  f
  1008	
  1009	/*
  1010	 * Undef instr entry dispatcher
  1011	 * Enter in UND mode, spsr = SVC/USR CPSR, lr = SVC/USR PC
  1012	 */
  1013		vector_stub	und, UND_MODE
  1014	
  1015		.long	__und_usr			@  0 (USR_26 / USR_32)
  1016		.long	__und_invalid			@  1 (FIQ_26 / FIQ_32)
  1017		.long	__und_invalid			@  2 (IRQ_26 / IRQ_32)
  1018		.long	__und_svc			@  3 (SVC_26 / SVC_32)
  1019		.long	__und_invalid			@  4
  1020		.long	__und_invalid			@  5
  1021		.long	__und_invalid			@  6
  1022		.long	__und_invalid			@  7
  1023		.long	__und_invalid			@  8
  1024		.long	__und_invalid			@  9
  1025		.long	__und_invalid			@  a
  1026		.long	__und_invalid			@  b
  1027		.long	__und_invalid			@  c
  1028		.long	__und_invalid			@  d
  1029		.long	__und_invalid			@  e
  1030		.long	__und_invalid			@  f
  1031	
  1032		.align	5
  1033	
  1034	/*=============================================================================
  1035	 * Address exception handler
  1036	 *-----------------------------------------------------------------------------
  1037	 * These aren't too critical.
  1038	 * (they're not supposed to happen, and won't happen in 32-bit data mode).
  1039	 */
  1040	
  1041	vector_addrexcptn:
  1042		b	vector_addrexcptn
  1043	
  1044	/*=============================================================================
  1045	 * FIQ "NMI" handler
  1046	 *-----------------------------------------------------------------------------
  1047	 * Handle a FIQ using the SVC stack allowing FIQ act like NMI on x86
  1048	 * systems. This must be the last vector stub, so lets place it in its own
  1049	 * subsection.
  1050	 */
  1051		.subsection 2
  1052		vector_stub	fiq, FIQ_MODE, 4
  1053	
  1054		.long	__fiq_usr			@  0  (USR_26 / USR_32)
  1055		.long	__fiq_svc			@  1  (FIQ_26 / FIQ_32)
  1056		.long	__fiq_svc			@  2  (IRQ_26 / IRQ_32)
  1057		.long	__fiq_svc			@  3  (SVC_26 / SVC_32)
  1058		.long	__fiq_svc			@  4
  1059		.long	__fiq_svc			@  5
  1060		.long	__fiq_svc			@  6
  1061		.long	__fiq_abt			@  7
  1062		.long	__fiq_svc			@  8
  1063		.long	__fiq_svc			@  9
  1064		.long	__fiq_svc			@  a
  1065		.long	__fiq_svc			@  b
  1066		.long	__fiq_svc			@  c
  1067		.long	__fiq_svc			@  d
  1068		.long	__fiq_svc			@  e
  1069		.long	__fiq_svc			@  f
  1070	
  1071		.globl	vector_fiq
  1072	
  1073		.section .vectors, "ax", %progbits
> 1074		RELOC_TEXT_NONE
  1075		W(b)	vector_rst
  1076		W(b)	vector_und
  1077	ARM(	.reloc	., R_ARM_LDR_PC_G0, .L__vector_swi		)
  1078	THUMB(	.reloc	., R_ARM_THM_PC12, .L__vector_swi		)
  1079		W(ldr)	pc, .
  1080		W(b)	vector_pabt
  1081		W(b)	vector_dabt
  1082		W(b)	vector_addrexcptn
  1083		W(b)	vector_irq
  1084		W(b)	vector_fiq
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
