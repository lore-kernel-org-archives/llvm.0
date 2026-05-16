Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98173D410B;
	Sat, 16 May 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935713; cv=none; b=uYtBCUaXsJ+yEXu6/LSQi0Rmds0Mt6r6WAPVrp3vXi6U0tQWiO1eRoU4eGFWOVyp9NqWjH2h41KhpF19Oy9MuaIz7rSc4uq0IK6R29ZzeJ5CMLmwyHIdt5FFs+HA0DT98GswjpIu6WCwzwZmcg19f3bvestt/4TkSvNKozkkcgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935713; c=relaxed/simple;
	bh=2BTUo8szt4DjZleM7Hj+ucVqOrxD+W1MnmrDumkDoXk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hmPaILDxlsPCP/lLbtuweroqSgP3GMbRGWI9b3QnTbj2k+m39SELHEsNF2blmRAUNXUOWdmW4lilWKieSASaUESSmZY3qrj7e47lKJiEmdhScSSE6JZ6EENsUz8PYQnthzCAEvJZXvH2VAVYuBcl4v0CiiMGQkGiYLG+T4AgMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuq6wevW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuq6wevW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778935712; x=1810471712;
  h=date:from:to:cc:subject:message-id;
  bh=2BTUo8szt4DjZleM7Hj+ucVqOrxD+W1MnmrDumkDoXk=;
  b=fuq6wevWsAcdNRA9xlwWNCCaoHjO6udNtvk4HaMhJv1TuUw27iaOBpuC
   fZfmY+vDI3GIGVPXm9TL3gMSGDEl6S5knOMD+q7k1JJIhD8K75Cx6JzsH
   5CW5xQC4m8LM2s6L01yPqh+M9EIK18xMUfX+nqB4npbrTlBUdsqt53qVj
   mSQekg8HtQNlfWM30bSInyKIxR7yQOFEyL+eo3SMLSE2e0ffhxkWCUPfo
   goGqouVnnG7kfYLfbsPTn0ZShTPSq2RLCes37QpX//60T2LeeuWqaakDx
   2BDYmN9JEuuzxRvRiNotE4K6rK8UbO9oFddcA6Of/Kqs2bheaW/mPdNwS
   A==;
X-CSE-ConnectionGUID: PYRPbNI/TVyMIyaGxXOYLw==
X-CSE-MsgGUID: lDzknDwaQzCyfBiRFIaXyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90445803"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90445803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 05:48:31 -0700
X-CSE-ConnectionGUID: pcSf5gqgTquzr8T7Mqkc8w==
X-CSE-MsgGUID: A8V2sJszTby/nslOotfgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="239069026"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2026 05:48:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOERP-000000009Kj-0E1o;
	Sat, 16 May 2026 12:48:27 +0000
Date: Sat, 16 May 2026 14:48:24 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 39/39] drivers/ptp/ptp_vmclock.c:347:6:
 warning: variable 'diff' set but not used
Message-ID: <202605161448.8UKNxgIE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   4d04890e42f4f8a0651ffae982f1da9bc2fe2948
commit: 4d04890e42f4f8a0651ffae982f1da9bc2fe2948 [39/39] timekeeping: Unify ntp_error and time_offset into phase_error
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260516/202605161448.8UKNxgIE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161448.8UKNxgIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161448.8UKNxgIE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_vmclock.c:347:6: warning: variable 'diff' set but not used [-Wunused-but-set-variable]
     347 |         s64 diff;
         |             ^
   1 warning generated.
--
>> Warning: kernel/time/ntp.c:89 struct member 'ntp_err_mult_hi' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:89 struct member 'phase_error_pending' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:89 struct member 'ntp_err_mult_hi' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:89 struct member 'phase_error_pending' not described in 'ntp_data'


vim +/diff +347 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse 2024-10-06  338  
4d04890e42f4f8 David Woodhouse 2026-05-15  339  static void vmclock_set_tk_reference(struct vmclock_state *st);
df750b53c373b3 David Woodhouse 2026-05-13  340  static void vmclock_cmp_timer_fn(struct timer_list *t)
df750b53c373b3 David Woodhouse 2026-05-13  341  {
df750b53c373b3 David Woodhouse 2026-05-13  342  	struct vmclock_state *st = container_of(t, struct vmclock_state, cmp_timer);
df750b53c373b3 David Woodhouse 2026-05-13  343  	volatile struct vmclock_abi *clk = st->clk;
df750b53c373b3 David Woodhouse 2026-05-13  344  	struct system_time_snapshot snap;
df750b53c373b3 David Woodhouse 2026-05-13  345  	unsigned __int128 product;
df750b53c373b3 David Woodhouse 2026-05-13  346  	u64 delta, ref_frac, ref_ns, sys_ns;
df750b53c373b3 David Woodhouse 2026-05-13 @347  	s64 diff;
df750b53c373b3 David Woodhouse 2026-05-13  348  
df750b53c373b3 David Woodhouse 2026-05-13  349  	ktime_get_snapshot(&snap);
df750b53c373b3 David Woodhouse 2026-05-13  350  	if (snap.cs_id != st->cs_id)
df750b53c373b3 David Woodhouse 2026-05-13  351  		goto rearm;
df750b53c373b3 David Woodhouse 2026-05-13  352  
df750b53c373b3 David Woodhouse 2026-05-13  353  	delta = snap.cycles - le64_to_cpu(clk->counter_value);
df750b53c373b3 David Woodhouse 2026-05-13  354  	product = (unsigned __int128)delta * le64_to_cpu(clk->counter_period_frac_sec);
df750b53c373b3 David Woodhouse 2026-05-13  355  	product >>= clk->counter_period_shift;
df750b53c373b3 David Woodhouse 2026-05-13  356  	product += le64_to_cpu(clk->time_frac_sec);
df750b53c373b3 David Woodhouse 2026-05-13  357  	ref_frac = (u64)product;
df750b53c373b3 David Woodhouse 2026-05-13  358  	ref_ns = mul_u64_u64_shr(ref_frac, NSEC_PER_SEC, 64);
df750b53c373b3 David Woodhouse 2026-05-13  359  	ref_ns += (le64_to_cpu(clk->time_sec) + (u64)(product >> 64)) * NSEC_PER_SEC;
df750b53c373b3 David Woodhouse 2026-05-13  360  
df750b53c373b3 David Woodhouse 2026-05-13  361  	sys_ns = ktime_to_ns(snap.real) - (s64)(int16_t)le16_to_cpu(clk->tai_offset_sec) * NSEC_PER_SEC;
df750b53c373b3 David Woodhouse 2026-05-13  362  	diff = (s64)(ref_ns - sys_ns);
df750b53c373b3 David Woodhouse 2026-05-13  363  
df750b53c373b3 David Woodhouse 2026-05-13  364  rearm:
df750b53c373b3 David Woodhouse 2026-05-13  365  	mod_timer(&st->cmp_timer, jiffies + msecs_to_jiffies(500));
df750b53c373b3 David Woodhouse 2026-05-13  366  }
df750b53c373b3 David Woodhouse 2026-05-13  367  

:::::: The code at line 347 was first introduced by commit
:::::: df750b53c373b3ddedbf4746625776cf5d3187a5 ptp_vmclock: Feed reference to timekeeping for feed-forward discipline

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
