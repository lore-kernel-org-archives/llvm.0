Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B037BE93;
	Mon, 29 Jun 2026 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754428; cv=none; b=qMu6vM3WRG75zsRjUVfJDR7GHLTLw/vwwAtoKs8vi/Cqk3AHguxHGvDB9tHEPlWsufO4w7YP5eWoAZ4lc+raCClSGrOyqxtOLNbA8vdt863nC/Dl84g00B78AZhu5biUUBxyyfur3j+x99thD1KYaNcAeI70AIw7Dl1Xe7lA2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754428; c=relaxed/simple;
	bh=iexQEktwNxKTZpkTLY/CJXpc5ouKWsuW5I4iOzsUGQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WwHPcTXGmqQrNDnt6Ua5isOFhkboIkKeZb3ppHuEu8sW0yj5iYme55qK9LCytVbJ0q1mju7qzK8hQuJsR/PF0BD3sjYnmxXufCl1sA+umccpK2+teKnBEkVEAbFS8Zv4rPp01zBC1wUVUdR2Zsk3EaptoXcwveJOA/cQ8y9x+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPyzND3f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPyzND3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782754427; x=1814290427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iexQEktwNxKTZpkTLY/CJXpc5ouKWsuW5I4iOzsUGQQ=;
  b=BPyzND3f8f5R4L8+BUAreVNOTzUmTZ5Lhf+ICyocjZK3qYNrFP0NzRFQ
   d8H07x3yQ9Nl1/oWRyFLNGHx7F8pgAlQXaGQtYP9Wp2PcW4a3bLD+UVM1
   uPP+m6sKeTxOzvIwm1GQPA3sBsmefObQvd62ZY2a55R13OOLf/TIrCHw4
   pYdJ4WoTUgCeIs3IQ++W8JtLkTDsscLz61WV7tkUvaONsmkF6eSCFhqfM
   Encq7EiGUh4vMMDlzUmVf3Aoj3skedxOnfptH47kc/SFt2jiI5eDNdxXv
   /bureE1UpQ7O8OkZM4wDP8lzxfq1I4D6M3sieyKGcwOlSc6XUTu5IKLZz
   Q==;
X-CSE-ConnectionGUID: IUnWOYEWS7qxB8yQO6mC5w==
X-CSE-MsgGUID: jL1LwsbxSXmYEGvb8YGAzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83229367"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83229367"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:33:46 -0700
X-CSE-ConnectionGUID: +3NBFjHFQBO4zSAEkx1Log==
X-CSE-MsgGUID: coInL/lOTQGXHxDN1mI2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="253928514"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jun 2026 10:33:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weFrY-000000007cT-3NCI;
	Mon, 29 Jun 2026 17:33:40 +0000
Date: Tue, 30 Jun 2026 01:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 15/123]
 arch/arm/kernel/head.S:129:2: error: instruction requires: armv6t2
Message-ID: <202606300131.TBc3BzVY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   657e76ed3917dff420bac3ef896d1a908149e32b
commit: 399bfdc95092f5133ca4e79e592f3e9689bba02d [15/123] ARM: zte: HACK: Set up GICv3.
config: arm-randconfig-002-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300131.TBc3BzVY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300131.TBc3BzVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300131.TBc3BzVY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/head.S:129:2: error: instruction requires: armv6t2
    mov r3, #0x131 @ non-secure
    ^


vim +129 arch/arm/kernel/head.S

   105	
   106		@ FIXME: This needs to go into the bootloader, it has no business being here.
   107		@ zx297520v3 has essentially an ARMv8 CPU with a GICv3 and secure mode support, but there's
   108		@ no ARM TrustZone firmware. So we have to set up the CPU and GIC according to arm64 boot
   109		@ requirements specified in Documentation/arch/arm64/booting.rst.
   110		@ Leave r0, r1 and r2 alone to preserve the DTB pointer.
   111	
   112		@ This allows EL1 to handle ints hat are normally handled by EL2/3.
   113		@ Detect sane bootloaders and skip the hack
   114		ldr	r3, =0xf2000000
   115		ldr	r3, [r3]
   116		ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
   117		cmp	r3, r4
   118		beq	skip_zx_hack
   119		ldr	r3, =0xf2000000
   120		str	r4, [r3]
   121	
   122		cps	#MON_MODE
   123	
   124		@ Work in non-secure physical addres space: SCR_EL3.NS = 1. At least the UART seems to
   125		@ respond only to non-secure addresses. I have taken insipiration from Raspberry pi's
   126		@ armstub7.S here.
   127		@
   128		@ ARM docs say modify this bit in monitor mode only...
 > 129		mov	r3, #0x131			@ non-secure
   130		mcr	p15, 0, r3, c1, c1, 0
   131	
   132		@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
   133		ldr	r3, =0xF22020a8
   134		ldr	r4, =0x50
   135		str	r4, [r3]
   136		ldr	r3, =0xF22020ac
   137		ldr	r4, =0x14
   138		str	r4, [r3]
   139	
   140		@ Enable EL access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg access to
   141		@ GICv3 registers (bit 0, ICC_SRE_EL3.SRE).
   142		mrc	p15, 6, r3, c12, c12, 5		@ ICC_SRE_EL3
   143		orr	r3, #0x9			@ FIXME: No defines for SRE_EL3 values?
   144		mcr	p15, 6, r3, c12, c12, 5
   145		mrc	p15, 0, r3, c12, c12, 5		@ ICC_SRE_EL1
   146		orr	r3, #(ICC_SRE_EL1_SRE)
   147		mcr	p15, 0, r3, c12, c12, 5
   148	
   149		@ Like ICC_SRE_EL3, enable non-secure access and allow register based access.
   150		mrc	p15, 4, r3, c12, c9, 5		@ ICC_SRE_EL2 aka ICC_HSRE
   151		orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
   152		mcr	p15, 4, r3, c12, c9, 5
   153		isb
   154	
   155		@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
   156		cps	#SVC_MODE
   157	skip_zx_hack:
   158	
   159		@ ensure svc mode and all interrupts masked
   160		safe_svcmode_maskall r9
   161	
   162		mrc	p15, 0, r9, c0, c0		@ get processor id
   163		bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
   164		movs	r10, r5				@ invalid processor (r5=0)?
   165	 THUMB( it	eq )		@ force fixup-able long branch encoding
   166		beq	__error_p			@ yes, error 'p'
   167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
