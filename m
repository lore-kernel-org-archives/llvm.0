Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF380034;
	Thu,  8 May 2025 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664486; cv=none; b=GLBqhKqRXd4RASj4w2YLabNAmANUFO/Rp/6w9808J8jxYNzo4clxo0Ng0Km15R3uSW4pF+zwlDmZYPuxY7usQinT6Q820i2uAC2xjSSqgXgI9/ceBjnQUkK54NWiGHb+5xhHmEqShRvR/JoxRty5pcRyWd3otxDELAH6hRzDZIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664486; c=relaxed/simple;
	bh=gk34XnYMgcArhs7pZjYIsvB4hZxx1N6kM+gBpjDB/Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltQ/vqpT1j+goZB3+oZXPET0DG6w8gDsv/M9Oy2bq2T4NQJ2vzOvV7nbciTrQHWtv5pqNUOw7MK295DdjZsvVcbdqPx91LdM5Z+yjohEhJCdZqTxHrn6isgGbI0xuu+BLpHxiFYTl1xDhoE1p+DXh6zCZdfjINsskuJOChGhQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJ2gKVig; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJ2gKVig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746664485; x=1778200485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gk34XnYMgcArhs7pZjYIsvB4hZxx1N6kM+gBpjDB/Jw=;
  b=XJ2gKVigyTiGFiSDvB5wqw3kOkKe4WxPsM0yuNWnkGEhDmf4P2Z9YDvd
   8+uLLOje8gS7bDVAqh+9hHzr0s6l7RdJVPGTXhA6mQp30hH5A0YtBxToY
   MB8vIHgLmDP+3rUFv0HehJMt2ZpQgNOPknuhf/X066fuhXLIRWfG4ssYy
   YgJJqFjempTgrR3RnHIIdyVikpj1oammcGSVfk/HJ/HXzt/iNNajuzJtU
   Loc2X/2fqRQBbCBqvDmYw3lBYbpwgUPeyf56QyOO/gOd9ZZXFv3xNb3KK
   cAhPHvt+UN09kuXFA0/3uLe2RSKifGgTxueavEi+i4uIYXDwCKI6TS9j1
   g==;
X-CSE-ConnectionGUID: 4nh9e9g1SimYdllXXVLlGw==
X-CSE-MsgGUID: RHANog7eTKiHHEjrHUJkdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58622069"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="58622069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 17:34:42 -0700
X-CSE-ConnectionGUID: 79neI2KmRLSupSh4rDoMrg==
X-CSE-MsgGUID: DmSJc4fwSsuEOp52G5o1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="167072139"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 17:34:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCpDi-00099d-0m;
	Thu, 08 May 2025 00:34:38 +0000
Date: Thu, 8 May 2025 08:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 8/9] perf/x86: Enable NMI-source reporting for perfmon
Message-ID: <202505080852.kP4Yt4yq-lkp@intel.com>
References: <20250507012145.2998143-9-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507012145.2998143-9-sohil.mehta@intel.com>

Hi Sohil,

kernel test robot noticed the following build errors:

[auto build test ERROR on f2e01dcf6df2d12e86c363ea9c37d53994d89dd6]

url:    https://github.com/intel-lab-lkp/linux/commits/Sohil-Mehta/x86-fred-KVM-VMX-Pass-event-data-to-the-FRED-entry-point-from-KVM/20250507-092905
base:   f2e01dcf6df2d12e86c363ea9c37d53994d89dd6
patch link:    https://lore.kernel.org/r/20250507012145.2998143-9-sohil.mehta%40intel.com
patch subject: [PATCH v5 8/9] perf/x86: Enable NMI-source reporting for perfmon
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505080852.kP4Yt4yq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080852.kP4Yt4yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080852.kP4Yt4yq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/core.c:3205:26: error: use of undeclared identifier 'NMIS_VECTOR_PMI'
    3205 |                 apic_write(APIC_LVTPC, PERF_NMI);
         |                                        ^
   arch/x86/include/asm/apic.h:32:34: note: expanded from macro 'PERF_NMI'
      32 | #define PERF_NMI                (APIC_DM_NMI | NMIS_VECTOR_PMI)
         |                                                ^
   arch/x86/events/intel/core.c:3242:26: error: use of undeclared identifier 'NMIS_VECTOR_PMI'
    3242 |                 apic_write(APIC_LVTPC, PERF_NMI);
         |                                        ^
   arch/x86/include/asm/apic.h:32:34: note: expanded from macro 'PERF_NMI'
      32 | #define PERF_NMI                (APIC_DM_NMI | NMIS_VECTOR_PMI)
         |                                                ^
   arch/x86/events/intel/core.c:3255:26: error: use of undeclared identifier 'NMIS_VECTOR_PMI'
    3255 |                 apic_write(APIC_LVTPC, PERF_NMI);
         |                                        ^
   arch/x86/include/asm/apic.h:32:34: note: expanded from macro 'PERF_NMI'
      32 | #define PERF_NMI                (APIC_DM_NMI | NMIS_VECTOR_PMI)
         |                                                ^
   3 errors generated.


vim +/NMIS_VECTOR_PMI +3205 arch/x86/events/intel/core.c

  3176	
  3177	/*
  3178	 * This handler is triggered by the local APIC, so the APIC IRQ handling
  3179	 * rules apply:
  3180	 */
  3181	static int intel_pmu_handle_irq(struct pt_regs *regs)
  3182	{
  3183		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
  3184		bool late_ack = hybrid_bit(cpuc->pmu, late_ack);
  3185		bool mid_ack = hybrid_bit(cpuc->pmu, mid_ack);
  3186		int loops;
  3187		u64 status;
  3188		int handled;
  3189		int pmu_enabled;
  3190	
  3191		/*
  3192		 * Save the PMU state.
  3193		 * It needs to be restored when leaving the handler.
  3194		 */
  3195		pmu_enabled = cpuc->enabled;
  3196		/*
  3197		 * In general, the early ACK is only applied for old platforms.
  3198		 * For the big core starts from Haswell, the late ACK should be
  3199		 * applied.
  3200		 * For the small core after Tremont, we have to do the ACK right
  3201		 * before re-enabling counters, which is in the middle of the
  3202		 * NMI handler.
  3203		 */
  3204		if (!late_ack && !mid_ack)
> 3205			apic_write(APIC_LVTPC, PERF_NMI);
  3206		intel_bts_disable_local();
  3207		cpuc->enabled = 0;
  3208		__intel_pmu_disable_all(true);
  3209		handled = intel_pmu_drain_bts_buffer();
  3210		handled += intel_bts_interrupt();
  3211		status = intel_pmu_get_status();
  3212		if (!status)
  3213			goto done;
  3214	
  3215		loops = 0;
  3216	again:
  3217		intel_pmu_lbr_read();
  3218		intel_pmu_ack_status(status);
  3219		if (++loops > 100) {
  3220			static bool warned;
  3221	
  3222			if (!warned) {
  3223				WARN(1, "perfevents: irq loop stuck!\n");
  3224				perf_event_print_debug();
  3225				warned = true;
  3226			}
  3227			intel_pmu_reset();
  3228			goto done;
  3229		}
  3230	
  3231		handled += handle_pmi_common(regs, status);
  3232	
  3233		/*
  3234		 * Repeat if there is more work to be done:
  3235		 */
  3236		status = intel_pmu_get_status();
  3237		if (status)
  3238			goto again;
  3239	
  3240	done:
  3241		if (mid_ack)
  3242			apic_write(APIC_LVTPC, PERF_NMI);
  3243		/* Only restore PMU state when it's active. See x86_pmu_disable(). */
  3244		cpuc->enabled = pmu_enabled;
  3245		if (pmu_enabled)
  3246			__intel_pmu_enable_all(0, true);
  3247		intel_bts_enable_local();
  3248	
  3249		/*
  3250		 * Only unmask the NMI after the overflow counters
  3251		 * have been reset. This avoids spurious NMIs on
  3252		 * Haswell CPUs.
  3253		 */
  3254		if (late_ack)
  3255			apic_write(APIC_LVTPC, PERF_NMI);
  3256		return handled;
  3257	}
  3258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
