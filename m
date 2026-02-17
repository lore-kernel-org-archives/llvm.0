Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BB1A08BC;
	Tue, 17 Feb 2026 02:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295591; cv=none; b=nSx1thKfv09YzYBmTx/PZSilgafEL1x0EkR5vQmiHrR6BklPpaDF3pWskbVpdV68kOVamQDGJkaC42M7BE+N9/LKa6CKMJht/fckQ8OJ5f0LpF/DiJ5dx/Pi3mEQ5C7guGglH9sKc+T4R6VtSboOppNuC8NHvxMCpgiZkfAHjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295591; c=relaxed/simple;
	bh=m98On/y/+3mgXKykpamKcdrnKcGD5thdn60Opua2CsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xg8Tq6J37CpCiHjhewdeNyHnkbu+HRr7LYUbbNp7/vcaSpwVj7ouicuu7DOmr8mbTQiXk+0J2Kwip0xgqLnEMyXKESWMm0l2htzupErAlTn+arfhHe+maT5htkIzxpiCsUg4WyjHLjvQqlkzPrbH7H/w/BGUgm7rpggXxIaQUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpNWm6qQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpNWm6qQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771295590; x=1802831590;
  h=date:from:to:cc:subject:message-id;
  bh=m98On/y/+3mgXKykpamKcdrnKcGD5thdn60Opua2CsM=;
  b=fpNWm6qQIlJRqacOUn3Vu4WCXmiR157A9WS5H1MJO0W6qJl8P8iKbIky
   rb1eYGTGGSvUnLyMKGpM+CFDGZktzMCzd4bWyUTrkUWgOukE9h6Y0aFnd
   DR0/pSaITWLMjkx3FjOquVKoeWH2omX0+uLxSBBiAfYuCHVMCFLlxyNdL
   jnbkxkml/arujegCHh/d2UYKsqOdnxuDKahcfVVARaNWIREDGP4XUBmdo
   d2EqAh0BPiTN8qe24yUUldKc8w7kiVmEJXhgJK130VpFOkrVoHpALtfTH
   cvTKvMWZoJoZYBKLtmvIjRQlDkX/ZO6xoJLJWh0/TuYZb7DB6ChwVXnqF
   A==;
X-CSE-ConnectionGUID: uWoJxoKGQlOYfGVw1v5Pgw==
X-CSE-MsgGUID: ntfgJ2Q7T3C4idmhK/C0og==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83466324"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83466324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:33:10 -0800
X-CSE-ConnectionGUID: LVtwsj1QQdajW7EQnkT11A==
X-CSE-MsgGUID: pvwhlNLtS56K4JLd96v/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212688111"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2026 18:33:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAte-000000010Xs-1PKo;
	Tue, 17 Feb 2026 02:33:06 +0000
Date: Tue, 17 Feb 2026 10:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 38/41]
 arch/hexagon/kernel/setup.c:125:3: warning: format specifies type 'unsigned
 long' but the argument has type 'int'
Message-ID: <202602171029.dIuQvGZc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: 9121b2b3bb709a1cbac9ab005cf55cfd195768fb [38/41] hexagon: add hwcap
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602171029.dIuQvGZc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171029.dIuQvGZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171029.dIuQvGZc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/setup.c:125:3: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     122 |         printk(KERN_INFO "Hexagon hwcap: 0x%08lx (ISA enum %lu = v%lx%s%s%s%s%s)\n",
         |                                                                   ~~~
         |                                                                   %x
     123 |                 elf_hwcap,
     124 |                 elf_hwcap & HWCAP_HEXAGON_ISA_MASK,
     125 |                 rev.isa,
         |                 ^~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/hexagon/kernel/setup.c:141:15: error: use of undeclared identifier '__dtb_start'; did you mean '__bss_start'?
     141 |         void *dtb = &__dtb_start;
         |                      ^~~~~~~~~~~
         |                      __bss_start
   include/asm-generic/sections.h:37:13: note: '__bss_start' declared here
      37 | extern char __bss_start[], __bss_stop[];
         |             ^
   1 warning and 1 error generated.


vim +125 arch/hexagon/kernel/setup.c

    47	
    48	/*
    49	 * populate hardware capabilities using vmgetinfo
    50	 */
    51	static void __init setup_hwcap(void)
    52	{
    53		struct vm_rev rev;
    54		unsigned long hvx_vlength;
    55	
    56		elf_hwcap = 0;
    57	
    58		/* Get revision information for ISA version */
    59		rev.raw = __vmgetinfo(vm_info_rev);
    60	
    61		/* Set ISA version using enumeration values in 7-bit field (bits 0-6) */
    62		switch (rev.isa) {
    63		case 0x79:
    64			elf_hwcap |= HWCAP_HEXAGON_ISA_V79;
    65			break;
    66		case 0x73:
    67			elf_hwcap |= HWCAP_HEXAGON_ISA_V73;
    68			break;
    69		case 0x71:
    70			elf_hwcap |= HWCAP_HEXAGON_ISA_V71;
    71			break;
    72		case 0x69:
    73			elf_hwcap |= HWCAP_HEXAGON_ISA_V69;
    74			break;
    75		case 0x68:
    76			elf_hwcap |= HWCAP_HEXAGON_ISA_V68;
    77			break;
    78		case 0x67:
    79			elf_hwcap |= HWCAP_HEXAGON_ISA_V67;
    80			break;
    81		case 0x66:
    82			elf_hwcap |= HWCAP_HEXAGON_ISA_V66;
    83			break;
    84		case 0x65:
    85			elf_hwcap |= HWCAP_HEXAGON_ISA_V65;
    86			break;
    87		case 0x62:
    88			elf_hwcap |= HWCAP_HEXAGON_ISA_V62;
    89			break;
    90		case 0x60:
    91			elf_hwcap |= HWCAP_HEXAGON_ISA_V60;
    92			break;
    93		case 0x55:
    94			elf_hwcap |= HWCAP_HEXAGON_ISA_V55;
    95			break;
    96		case 5:
    97			elf_hwcap |= HWCAP_HEXAGON_ISA_V5;
    98			break;
    99		case 4:
   100			elf_hwcap |= HWCAP_HEXAGON_ISA_V4;
   101			break;
   102		case 3:
   103			elf_hwcap |= HWCAP_HEXAGON_ISA_V3;
   104			break;
   105		case 2:
   106			elf_hwcap |= HWCAP_HEXAGON_ISA_V2;
   107			break;
   108		default:
   109			/* Unknown ISA version - leave ISA field as 0 */
   110			break;
   111		}
   112	
   113		/* Check for HVX support */
   114		hvx_vlength = __vmgetinfo(vm_info_hvx_vlength);
   115		if (hvx_vlength) {
   116			elf_hwcap |= HWCAP_HEXAGON_HVX;
   117	
   118			if (hvx_vlength >= 128)
   119				elf_hwcap |= HWCAP_HEXAGON_HVX_LENGTH_128B;
   120		}
   121	
   122		printk(KERN_INFO "Hexagon hwcap: 0x%08lx (ISA enum %lu = v%lx%s%s%s%s%s)\n",
   123			elf_hwcap,
   124			elf_hwcap & HWCAP_HEXAGON_ISA_MASK,
 > 125			rev.isa,
   126			(elf_hwcap & HWCAP_HEXAGON_HVX) ? ", HVX" : "",
   127			(elf_hwcap & HWCAP_HEXAGON_HVX_LENGTH_128B) ? ", HVX-128B" : "",
   128			(elf_hwcap & HWCAP_HEXAGON_HVX_IEEE_FP) ? ", HVX-IEEE-FP" : "",
   129			(elf_hwcap & HWCAP_HEXAGON_AUDIO) ? ", Audio" : "",
   130			(elf_hwcap & HWCAP_HEXAGON_CABAC) ? ", CABAC" : "");
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
