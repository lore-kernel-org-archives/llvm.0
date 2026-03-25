Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354D28CF6F;
	Wed, 25 Mar 2026 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407047; cv=none; b=l8PpYvQ5dbz3YOxNMxZ142lETFYXdnGcjyjBNjjTy4hkV39tyBCcgmdlWmln8BO8rtK+O97GjUt9Sc1QJfKBGEcUql2wUaa5h4cOMfusq2V0WI1FZ5ckQBEkCCSKZKEbGXTLQjmrvPiOjANMuNExTDTJGRQWhVF/6x1pdS/ugv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407047; c=relaxed/simple;
	bh=/z2mwH1jc1ViXGJqbjAwde3q4g9MJx2WxSYSffEiyG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GxhvQNAy3REgvNMpsJC9M6MFt6U0F7GlAMycp4qSxICQ0foVibCPuKGdBrxIkM7cBwCmH89AeaxDQW5ju1/aY/prPp6f0OVOq4qwyJjwt5M4B5iSJ6xiaJH2vgbhkzNHx9XLliC9rph6/FzSbCRWmOOkHpZpsNDgWUKI2W6mwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmN99dYv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmN99dYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774407046; x=1805943046;
  h=date:from:to:cc:subject:message-id;
  bh=/z2mwH1jc1ViXGJqbjAwde3q4g9MJx2WxSYSffEiyG0=;
  b=HmN99dYvxHRyAKXrR3mFWjxfiaQulYgIUvLRulpYF33Yg3fGRvAhT3Rs
   IE/R69Xv+ApmGcTDKPakJApm3UPxBzyiR0ASJuB87U8HRFjGcfa5rd/iO
   nsBb6GL2nEYIUTZMKIKjJuLrdXWcggon5IDh60SlN2tzvWEvkKxCwioJz
   VKudDjkGOaboO2Vh9Pe1vB9Pb4vqKrR1GKokOR/B0vY/FKJyMMDV2m7Ch
   r1oDMUI/9h7hwduG1Ogi/mJBJtieNYNpeCLDFr0T+TUA12ZXFcO6hOVLS
   Q5Unwk3a+XeCE/lPYsYF9CIbhXWRREJEueX40WOv3jSQFrrrY2UvbOu1R
   Q==;
X-CSE-ConnectionGUID: 6hV0qJfmTyWsWLomsBEz6Q==
X-CSE-MsgGUID: RC+Yor7XQt+fr46F2kTRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75463633"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75463633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:50:44 -0700
X-CSE-ConnectionGUID: V2i23nECRbSgBTpHW9CWWw==
X-CSE-MsgGUID: UOLWMasMSquOgp3Qnj1E8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="248087074"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2026 19:50:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5EKO-000000005oB-3znE;
	Wed, 25 Mar 2026 02:50:40 +0000
Date: Wed, 25 Mar 2026 10:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:testing/v7.0-rc5 2/2]
 arch/arm64/kernel/process.c:704:31: error: expected readable system register
Message-ID: <202603251009.SO6yPDZX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git testing/v7.0-rc5
head:   53a91f2f4a3dd7bb262b669780eea2fff13f4e37
commit: 53a91f2f4a3dd7bb262b669780eea2fff13f4e37 [2/2] HACK: arm64: Check CPU state at task-switch time
config: arm64-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251009.SO6yPDZX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251009.SO6yPDZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251009.SO6yPDZX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:704:31: error: expected readable system register
     704 |         if (system_uses_hw_pan() && !read_sysreg(PAN))
         |                                      ^
   arch/arm64/include/asm/sysreg.h:1164:15: note: expanded from macro 'read_sysreg'
    1164 |         asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
         |                      ^
   <inline asm>:1:10: note: instantiated into assembly here
       1 |         mrs x8, PAN
         |                 ^
   1 error generated.


vim +704 arch/arm64/kernel/process.c

   701	
   702	static inline void debug_switch_state(void)
   703	{
 > 704		if (system_uses_hw_pan() && !read_sysreg(PAN))
   705			WARN_ONCE(1, "PSTATE.PAN clear unexpectedly at task-switch\n");
   706	
   707		if (system_uses_irq_prio_masking()) {
   708			unsigned long daif_expected = 0;
   709			unsigned long daif_actual = read_sysreg(daif);
   710			unsigned long pmr_expected = GIC_PRIO_IRQOFF;
   711			unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
   712	
   713			WARN_ONCE(daif_actual != daif_expected ||
   714				  pmr_actual != pmr_expected,
   715				  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
   716				  daif_actual, pmr_actual,
   717				  daif_expected, pmr_expected);
   718		} else {
   719			unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
   720			unsigned long daif_actual = read_sysreg(daif);
   721	
   722			WARN_ONCE(daif_actual != daif_expected,
   723				  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
   724				  daif_actual, daif_expected);
   725		}
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
