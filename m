Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4516A956;
	Tue, 14 Apr 2026 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192726; cv=none; b=oE6abq1g8P20hGC9PxRRnfK8hh7zSwaev0y54xyuwS8Vp5DEtAYBhIfxMr0BZT0ha9jIqBTx7GzmJXgiIFKiEcoIA5DN+UEcH53Y05lmFJwUJZucVJ30dxg9c7Lk/Wmxt1GokrHMSJGP7fhorUG73RVJhiutQcWa80RHMRX1bME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192726; c=relaxed/simple;
	bh=mAAcEir6uWvCRmq1qR0ota4DCjw5hbFaNC1DgWR2g88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AM9vHUF/uz9C4/cZd6FSVi77iBgPltF0fPucdRcf6cbbNksCgTBl1lymYcY9zrDSzu0KkgTiir8GLcp4zvX6+igOQ/g/GLZf60K5R9hIqO9poau+q/H1og9IJYn3z3DNwG8xdWCPhT4mE8MHsiazJJ5G/rnbyHbv2dGr9K7ksns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmNKeMZz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmNKeMZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776192725; x=1807728725;
  h=date:from:to:cc:subject:message-id;
  bh=mAAcEir6uWvCRmq1qR0ota4DCjw5hbFaNC1DgWR2g88=;
  b=TmNKeMZzs5MIHrN662+3dYa2BebBfiS5JTemep3uMe9DuRM3Y9NJeln9
   isqc5kuFjMCD6UJqVUVLKokXcRBRZfsdWzF+pq7HZquizM3XaRrmSMJVy
   efUGHLwiFu1jV1UD63aRrF4nd4A4jOxwzFZehk2XtpRtSu3p412EaM5Ws
   w6S/7GLXSiu6J1B9SJkq9grCCZ+1DbdxNOSwNd07GB01FMsuT/o+UIH8u
   +Fcok0n6uqpvDeND02QTT51vm1CiW1MM6CfUqzX31/8wpHJq65pLFQu88
   Av+api6xKf8JwqFiY6TNHUBE13rffTpMf5tBpL6pPrFl6gn7EyZlEPDBV
   w==;
X-CSE-ConnectionGUID: H9VXz+jgTuqSFkeam+TB+Q==
X-CSE-MsgGUID: cwMJfwjRQhyn7rRYcKP4qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102620822"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102620822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:52:04 -0700
X-CSE-ConnectionGUID: CE8+u6FPRn6utFW0nuA1ew==
X-CSE-MsgGUID: A+lAiz67TXmXGKuZ+7QQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230040297"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2026 11:52:03 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCirg-000000001lf-3xYj;
	Tue, 14 Apr 2026 18:52:00 +0000
Date: Wed, 15 Apr 2026 02:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:testing/v7.0 2/2] arch/arm64/kernel/process.c:704:31:
 error: expected readable system register
Message-ID: <202604150245.612s77Tr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git testing/v7.0
head:   7fff2e6809aed878aa2aedf9a46091e2f8d0b379
commit: 7fff2e6809aed878aa2aedf9a46091e2f8d0b379 [2/2] HACK: arm64: Check CPU state at task-switch time
config: arm64-randconfig-003-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150245.612s77Tr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150245.612s77Tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150245.612s77Tr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:704:31: error: expected readable system register
           if (system_uses_hw_pan() && !read_sysreg(PAN))
                                        ^
   arch/arm64/include/asm/sysreg.h:1164:15: note: expanded from macro 'read_sysreg'
           asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
                        ^
   <inline asm>:1:10: note: instantiated into assembly here
           mrs x8, PAN
                   ^
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
