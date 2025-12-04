Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5742DEA6B;
	Thu,  4 Dec 2025 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764887862; cv=none; b=Ailb4Pc+0Q0xuDA1jgXzIIH0CSA3lAJFvie5Pmx5+ZeJuXn1gbR+TsJIOe3Yn7wuhFVMlXZtk8+e//RdE64VqNdHlQYMlQwqiYZioAw1c/DUUPVNftMbBSMm6XmZOtVOnQbp0OFnLaWi0PwL1UevaCaXRqnYSWOTD9VWm8IyLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764887862; c=relaxed/simple;
	bh=lfQVCDlVKMtC+BZCoUnjjiSvmLvHmZ63MXDb7WKa/bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxFI5yyUoEj5D9F/cdRd4QgzRvg7MNcX4kNSb99xnoUUFUqY6WwHb2rOHsk41XryRLNwbQDBZicvpaJmDcMPRceopfM183t80VZWheaahZ9DCEWRDHOW5ro5VAo7dU/Bbz1udYx9Aou86XQbSAeJZigZgoAbDiC4r7OWy9+6pDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC6hVdBi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC6hVdBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764887861; x=1796423861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lfQVCDlVKMtC+BZCoUnjjiSvmLvHmZ63MXDb7WKa/bw=;
  b=OC6hVdBiIKGo3z5GeoE52R9jx0Lz5bXC6o62at4I1baFwE+m9FpSDasL
   LFB2BxgBYl4ggs6yjVUq1+XeXb2zhq5uQzlvh8qvbFNwRojgGwj7GarY6
   XF9b6VXdQTGFUZg1RmD2chMT1ep0O9p2tR27Z3llyoFQHiBRL8VDz64nQ
   +KffnJuFrUDwe01A/8SLmHOJ6UvVg9c662BQpHzM8cGk2aKqEHBm7Xray
   ONm7LgVFsq7W7mnbEsasUITSlhDmyPaKbxzH3W3xuLl9/yvDsU4DOD2a0
   AESb1eXSJ9r5aEoPAIV7CtRheVdZyi0B2hgsgV/wL61J+h3nRC15WL+Ms
   w==;
X-CSE-ConnectionGUID: fHkS3ueiQt20u6LY3R5pUQ==
X-CSE-MsgGUID: 0bV+TzXoSmevrKoC2cW+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78030960"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="78030960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 14:37:40 -0800
X-CSE-ConnectionGUID: SqNWRcikRZeisFA/ohUxHQ==
X-CSE-MsgGUID: lPMDu52eRBCEu3sAIiYt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="200232962"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 14:37:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRHxA-00000000EJT-17lF;
	Thu, 04 Dec 2025 22:37:36 +0000
Date: Fri, 5 Dec 2025 06:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	Andi Kleen <ak@linux.intel.com>, ggherdovich@suse.cz,
	Peter Zijlstra <peterz@infradead.org>, rafael.j.wysocki@intel.com
Subject: Re: [PATCH] x86/aperfmperf: Don't disable scheduler APERF/MPERF on
 bad samples
Message-ID: <202512050606.C8pVgbHT-lkp@intel.com>
References: <20251204180914.1855553-1-ak@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204180914.1855553-1-ak@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v6.18 next-20251204]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Kleen/x86-aperfmperf-Don-t-disable-scheduler-APERF-MPERF-on-bad-samples/20251205-021657
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251204180914.1855553-1-ak%40linux.intel.com
patch subject: [PATCH] x86/aperfmperf: Don't disable scheduler APERF/MPERF on bad samples
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512050606.C8pVgbHT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050606.C8pVgbHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050606.C8pVgbHT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/aperfmperf.c:428:6: warning: variable 'freq_scale' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     428 |         if (check_shl_overflow(acnt, 2*SCHED_CAPACITY_SHIFT, &acnt))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:198:37: note: expanded from macro 'check_shl_overflow'
     198 | #define check_shl_overflow(a, s, d) __must_check_overflow(({            \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |         typeof(a) _a = a;                                               \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     200 |         typeof(s) _s = s;                                               \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     201 |         typeof(d) _d = d;                                               \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     202 |         unsigned long long _a_full = _a;                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     203 |         unsigned int _to_shift =                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     204 |                 is_non_negative(_s) && _s < 8 * sizeof(*d) ? _s : 0;    \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     205 |         *_d = (_a_full << _to_shift);                                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     206 |         (_to_shift != _s || is_negative(*_d) || is_negative(_a) ||      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     207 |         (*_d >> _to_shift) != _a);                                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     208 | }))
         | ~~~
   arch/x86/kernel/cpu/aperfmperf.c:449:34: note: uninitialized use occurs here
     449 |         this_cpu_write(arch_freq_scale, freq_scale);
         |                                         ^~~~~~~~~~
   include/linux/percpu-defs.h:500:73: note: expanded from macro 'this_cpu_write'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                                                                ^~~
   include/linux/percpu-defs.h:372:29: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                                           ^~~~~~~~~~~
   arch/x86/include/asm/percpu.h:528:72: note: expanded from macro 'this_cpu_write_8'
     528 | #define this_cpu_write_8(pcp, val)                      __raw_cpu_write(8, volatile, pcp, val)
         |                                                                                           ^~~
   arch/x86/include/asm/percpu.h:165:52: note: expanded from macro '__raw_cpu_write'
     165 |         __pcpu_type_##size pto_val__ = __pcpu_cast_##size(_val);        \
         |                                                           ^~~~
   arch/x86/include/asm/percpu.h:118:35: note: expanded from macro '__pcpu_cast_8'
     118 | #define __pcpu_cast_8(val)      ((u64)(val))
         |                                        ^~~
   arch/x86/kernel/cpu/aperfmperf.c:428:2: note: remove the 'if' if its condition is always false
     428 |         if (check_shl_overflow(acnt, 2*SCHED_CAPACITY_SHIFT, &acnt))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     429 |                 goto out;
         |                 ~~~~~~~~
   arch/x86/kernel/cpu/aperfmperf.c:418:16: note: initialize the variable 'freq_scale' to silence this warning
     418 |         u64 freq_scale, freq_ratio;
         |                       ^
         |                        = 0
   1 warning generated.


vim +428 arch/x86/kernel/cpu/aperfmperf.c

5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  415  
73a5fa7d51366a5 Thomas Gleixner   2022-04-15  416  static void scale_freq_tick(u64 acnt, u64 mcnt)
55cb0b70749361d Thomas Gleixner   2022-04-15  417  {
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  418  	u64 freq_scale, freq_ratio;
55cb0b70749361d Thomas Gleixner   2022-04-15  419  
bb6e89df9028b2f Thomas Gleixner   2022-04-15  420  	if (!arch_scale_freq_invariant())
bb6e89df9028b2f Thomas Gleixner   2022-04-15  421  		return;
bb6e89df9028b2f Thomas Gleixner   2022-04-15  422  
b4366dd91793d58 Andi Kleen        2025-12-04  423  	/*
b4366dd91793d58 Andi Kleen        2025-12-04  424  	 * On any over/underflow just ignore the sample. It could
b4366dd91793d58 Andi Kleen        2025-12-04  425  	 * be due to an unlucky NMI or similar between the
b4366dd91793d58 Andi Kleen        2025-12-04  426  	 * APERF and MPERF reads.
b4366dd91793d58 Andi Kleen        2025-12-04  427  	 */
55cb0b70749361d Thomas Gleixner   2022-04-15 @428  	if (check_shl_overflow(acnt, 2*SCHED_CAPACITY_SHIFT, &acnt))
b4366dd91793d58 Andi Kleen        2025-12-04  429  		goto out;
55cb0b70749361d Thomas Gleixner   2022-04-15  430  
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  431  	if (static_branch_unlikely(&arch_hybrid_cap_scale_key))
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  432  		freq_ratio = READ_ONCE(this_cpu_ptr(arch_cpu_scale)->freq_ratio);
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  433  	else
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  434  		freq_ratio = arch_max_freq_ratio;
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  435  
b4366dd91793d58 Andi Kleen        2025-12-04  436  	freq_scale = SCHED_CAPACITY_SCALE;
b4366dd91793d58 Andi Kleen        2025-12-04  437  
5a9d10145a54f7a Rafael J. Wysocki 2024-08-28  438  	if (check_mul_overflow(mcnt, freq_ratio, &mcnt) || !mcnt)
b4366dd91793d58 Andi Kleen        2025-12-04  439  		goto out;
55cb0b70749361d Thomas Gleixner   2022-04-15  440  
55cb0b70749361d Thomas Gleixner   2022-04-15  441  	freq_scale = div64_u64(acnt, mcnt);
55cb0b70749361d Thomas Gleixner   2022-04-15  442  	if (!freq_scale)
b4366dd91793d58 Andi Kleen        2025-12-04  443  		goto out;
55cb0b70749361d Thomas Gleixner   2022-04-15  444  
55cb0b70749361d Thomas Gleixner   2022-04-15  445  	if (freq_scale > SCHED_CAPACITY_SCALE)
55cb0b70749361d Thomas Gleixner   2022-04-15  446  		freq_scale = SCHED_CAPACITY_SCALE;
55cb0b70749361d Thomas Gleixner   2022-04-15  447  
b4366dd91793d58 Andi Kleen        2025-12-04  448  out:
55cb0b70749361d Thomas Gleixner   2022-04-15  449  	this_cpu_write(arch_freq_scale, freq_scale);
55cb0b70749361d Thomas Gleixner   2022-04-15  450  }
bb6e89df9028b2f Thomas Gleixner   2022-04-15  451  #else
bb6e89df9028b2f Thomas Gleixner   2022-04-15  452  static inline void bp_init_freq_invariance(void) { }
bb6e89df9028b2f Thomas Gleixner   2022-04-15  453  static inline void scale_freq_tick(u64 acnt, u64 mcnt) { }
bb6e89df9028b2f Thomas Gleixner   2022-04-15  454  #endif /* CONFIG_X86_64 && CONFIG_SMP */
73a5fa7d51366a5 Thomas Gleixner   2022-04-15  455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
