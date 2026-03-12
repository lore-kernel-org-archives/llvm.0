Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D92ECE93;
	Thu, 12 Mar 2026 00:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276694; cv=none; b=Dt7GcmBGkSjd0NhR2MZqLTlpEiUOe5EAm4qdd+/AuAZtcvmnx3gynvJMKda8/92xOyH/TeB3SRL24yv3fwdtlvvgVxlxCbH1X5cbbbpKaF0EwZ61v22sN5ySRSuT+hRI5SkfuLvNY3gay/oChK2v2VX79b19NnPeFr1zx0PIP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276694; c=relaxed/simple;
	bh=OIivAlJbfTNF6eqWO920PK2q7jOW/uaE2fq/mTsdxPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eZjZEbajU9jM95blp+XXd+T3r6DvvaJxuQ+aIS/wb1AYAL6RuZXxx04i8uQh43WXheg8DLIQ+rvP9BISg9gswMaTQEwVnlIqpQvNOT8M9VcHXT7DCQDR/1mEyUHaUGjzqxT3Sr8s7HEWMIZIjGUioSmF+sKbZ4V093Qga1m59Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgQpXUi4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgQpXUi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773276693; x=1804812693;
  h=date:from:to:cc:subject:message-id;
  bh=OIivAlJbfTNF6eqWO920PK2q7jOW/uaE2fq/mTsdxPk=;
  b=kgQpXUi47YpfpZV8OIGSp2V0ckx54Dnq6aKWxNapvWamAgQQOGK5HfjM
   v5McdfB36lHJ7Lr3ftdvD55U9qzmzTUKu+UdVY/JFhZcv+KJoNfxBLfmI
   fSLDkPL2/M/FltGdNaXNj3OhWeFlC0dJu9rRuRlHluYehmnWGALZJ4XOr
   i3eIQPV0NFua48ToL6dx6VG/YMCUCqX5ym1U9Vd/me8d1SJanK+oyXGub
   JKBIbkOam4rHtzLfSKuE6UTq1+GXPrwAXTMkgtGxBMBlqc4H4ysetX1iV
   5YxXSbHeUVhGR1BnvgW2JrrrPAkkJ2zd4mG7/tS4OYe6wU0aTGrt21dxM
   Q==;
X-CSE-ConnectionGUID: 2cj+XN9FTRuhdBuCudh9Lg==
X-CSE-MsgGUID: bHLv+T0JQzS9Ni/iOOHmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="76970263"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="76970263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 17:51:30 -0700
X-CSE-ConnectionGUID: Noy6a1MaRAWlusONmBetSA==
X-CSE-MsgGUID: PlcgqFohSuerNqe5D4O6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="224786140"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 17:51:28 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0UGr-000000001s3-2pRr;
	Thu, 12 Mar 2026 00:51:25 +0000
Date: Thu, 12 Mar 2026 08:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:testing/v7.0-rc3 2/2]
 arch/arm64/kernel/process.c:704:31: error: expected readable system register
Message-ID: <202603120806.BDmj16Xq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git testing/v7.0-rc3
head:   661b491963fb7aa62905612f758376933435bba9
commit: 2df151af23926ce5e8053052b5ff6b8455b4cdc6 [2/2] HACK: arm64: Check CPU state at task-switch time
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120806.BDmj16Xq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120806.BDmj16Xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120806.BDmj16Xq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:704:31: error: expected readable system register
     704 |         if (system_uses_hw_pan() && !read_sysreg(PAN))
         |                                      ^
   arch/arm64/include/asm/sysreg.h:1164:15: note: expanded from macro 'read_sysreg'
    1164 |         asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
         |                      ^
   <inline asm>:1:11: note: instantiated into assembly here
       1 |         mrs x21, PAN
         |                  ^
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
   723				  "Unexpected DAIF value: 0x%lx (expected %lx)\n",
   724				  daif_actual, daif_expected);
   725		}
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
