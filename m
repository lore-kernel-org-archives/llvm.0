Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3E353EF2;
	Fri, 20 Mar 2026 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050423; cv=none; b=UgreIvBX1veYCFuqyRBQcynuXwpqRVHfaNgRLGuZMlpXlwiZNwcEEU2v0d/dOVq1002A7XD5en3gBBcShHV1fXH8sEb1p744+uqBHEt0/gS+AgGX/rxNN5NusMiW+HOjSdVwP48G2qgZSXsr3JrC6udZ9u0Vo7iY9A3AoQL98+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050423; c=relaxed/simple;
	bh=gWfK1b8BdWEr4pCPlbKH9YVWO0Dv5ituchaZxQS8RBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BjHHUkyzvlTITOXNVvdixbN/sqZQ95dXog5GUApV2ifStwB1ZtUjsqGgcSH8CQIvq3RZUFN+Th+/kQEB3l3OBFDcFuZsgFJFaHS1QyVsnZm1GPww8sEyQdVDpbm9MGAGmQYKziAcmHYxGernaaP8n+t1Bk47GIdL410pMZyNfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv/QexHe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv/QexHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774050422; x=1805586422;
  h=date:from:to:cc:subject:message-id;
  bh=gWfK1b8BdWEr4pCPlbKH9YVWO0Dv5ituchaZxQS8RBg=;
  b=mv/QexHedBj1AJllrwyD7vBCaFnl0jQkWbTi4Ov9/dR9/EWfyFq3QMj2
   8ZC88BWrXp0aSw6jVnspRsMsLPoOZ/K/sujVYBk+8BlxsvgjpX/gvZxFY
   pvu8DDMSz1Y8SS6GFMb546luwBxtIp0Mer9CAIASPDnUCUjWmUenEjoIf
   vxwE/8mc2AbrmXb2iblLJduqeFij5E7a+zv06D3h88uc6uoYoCV85NG+2
   Syxo8dkIL8Hcxg+AfDlUsS/lx4w8XfuqhngsTpbqnRbzFCufdSv+i6BG3
   vSNaIuQFZ5t0vHvSLJ8bVm14uZaeABudYmtWK51CogJ6Mt8u0xYCyR2rt
   w==;
X-CSE-ConnectionGUID: euvboLamTnKwokNWOFaWDw==
X-CSE-MsgGUID: OBPDakI6TvWs3oH6iKtSiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="62703932"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="62703932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 16:47:01 -0700
X-CSE-ConnectionGUID: D5l3viYoS/arEX0lS7JogQ==
X-CSE-MsgGUID: Bj2A6bLER+KBGg5KAfUxSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="219178474"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2026 16:46:59 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3jYP-0000000001P-1p65;
	Fri, 20 Mar 2026 23:46:57 +0000
Date: Sat, 21 Mar 2026 07:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14] arch/x86/kernel/irq.c:138:17:
 error: use of undeclared identifier 'IRQ_COUNT_X86_POSTED_MSI'
Message-ID: <202603210703.cFdqbWnR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e85c64195f3479abcad77115c7d5626e6905546
commit: d5debb2dd149e388fe3fdc1660437d2362579d28 [4/14] x86/irq: Make irqstats array based
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260321/202603210703.cFdqbWnR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210703.cFdqbWnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210703.cFdqbWnR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/irq.c:138:17: error: use of undeclared identifier 'IRQ_COUNT_X86_POSTED_MSI'
     138 |                 irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
         |                               ^
   1 error generated.


vim +/IRQ_COUNT_X86_POSTED_MSI +138 arch/x86/kernel/irq.c

   123	
   124	void __init irq_init_stats(void)
   125	{
   126		struct irq_stat_info *info = irq_stat_info;
   127	
   128		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
   129			if (info->skip_vector && test_bit(info->skip_vector, system_vectors))
   130				info->skip_vector = 0;
   131		}
   132	
   133		if (!x86_platform_ipi_callback)
   134			irq_stat_info[IRQ_COUNT_X86_PLATFORM_IPI].skip_vector = 1;
   135	
   136	#ifdef CONFIG_X86_POSTED_MSI
   137		if (!posted_msi_enabled())
 > 138			irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
   139	#endif
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
