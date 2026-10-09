Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793442AA9;
	Fri,  9 Oct 2026 01:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508445; cv=none; b=Aqbf/SlRH6Ws6AUQ7YKz/MtdVpWDiqZU/q4EO/3bHvgiXuakXAyG+S/FkxYZWWoqHnPhGCvaSzY+4AgwtbAyTa3vpWHPtcRnX3LcpyVbjP2hol0kb7kTL2cxYFGQQZv8dBKOSXnvkmL/+JWeBxTcI8gNsf8RHZFDVMuFYFBe5+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508445; c=relaxed/simple;
	bh=WRP8wfySnMMIoXZLEo1e5ePdgi8q++dELZY14r2YO+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yg3zzvbATkzGCtIqB3XpVLV/pbNNjsr5Mh7XdDAmmYRQedsiFPLTLcHE/h0eQoRy6fTzTZZaH0xoEfXueUibjczO+vLzNANvQOcn0FgR8JG00XJB8Wv2/L4QhQ5UGnQNyfQ21DQrnjY6e0AxCQpPR5gmDy5RPd/Vq5EsKwZUDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWembBtg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWembBtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791508443; x=1823044443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRP8wfySnMMIoXZLEo1e5ePdgi8q++dELZY14r2YO+o=;
  b=dWembBtgjM28JTUfB6rCk8hblEb8+x1P+VbTyIKYtdgDwVPh1VNWbVD0
   OcV7cPnn1AvLCr1IsD0hX7BbHuzKN1SJ/ohoZHnkPIgA1edpBXYalCTe/
   63H6+8gvLHLs15K0DqfPV3530bdNdNdhPLaGq/e2MVElrC+clDnyLqxYE
   aXtvaTn+bTkMykrw4Jadw9nj+jcYXCvn/IcVIzlALkWCX/5vOEkzgjguI
   dicMEtVorPwahaktDN8L1j6c729i7Mf3IUrhQtK4tdQ2JuetZ1b44QNWg
   68wIu0nAIe90E8S8S4Dzb7ggw3mRc5rLpfeH2MbxjqLeetuCL28gqS5jy
   Q==;
X-CSE-ConnectionGUID: K8DLBsFPQpaR1ThI4kGPpA==
X-CSE-MsgGUID: YQK4sv9FSRGMo5C9h3ydJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="314034"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="314034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 18:14:02 -0700
X-CSE-ConnectionGUID: UboS+KvQQk6oBvzb2JG7ow==
X-CSE-MsgGUID: YJEN0onEQ0OoXNmccfl4/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="269551"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 18:14:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzBO-0000000058C-37cq;
	Fri, 09 Oct 2026 01:13:58 +0000
Date: Fri, 09 Oct 2026 09:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 23/142]
 arch/arm/kernel/head.S:129:2: error: invalid instruction, any one of the
 following would fix this:
Message-ID: <202610090931.MTCqZgr1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 43b934983d6f2811702f80419b92a1c62988fb7e [23/142] ARM: zte: HACK: Set up GICv3.
config: arm-spear3xx_defconfig (https://download.01.org/0day-ci/archive/20261009/202610090931.MTCqZgr1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090931.MTCqZgr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090931.MTCqZgr1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/head.S:129:2: error: invalid instruction, any one of the following would fix this:
    mov r3, #0x131 @ non-secure
    ^
   arch/arm/kernel/head.S:129:11: note: invalid operand for instruction
    mov r3, #0x131 @ non-secure
             ^
   arch/arm/kernel/head.S:129:11: note: operand must be a register in range [r0, r15]
    mov r3, #0x131 @ non-secure
             ^
   arch/arm/kernel/head.S:129:2: note: instruction requires: armv6t2
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
