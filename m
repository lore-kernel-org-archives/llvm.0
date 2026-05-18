Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C72F1FEA;
	Tue, 19 May 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156797; cv=none; b=TllMCKLoawIiTAcaCj0MxCX/ePPCLruY+wSava8lUr7OLT3OoZ1m9MlkMC/6WQ7UYq4tModOwDLU681xdr6kUOfh7/v0X7n6jS4HXuSvXKW8uq4slZJOMs0hlqwnvRKqlpelHjOnGTvAQtNR2r+2LGuEu8qHPT9gKFvCq46jzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156797; c=relaxed/simple;
	bh=FuP1CeX8DstvW9VjNUtg8ctoan8Q6ACetcYdBQi91ow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/HgrywzTMIlAUU4kRH26KEKvtlrNBUIQVdSUfiifm93wczjcYypeE0ghLKn5c+6x6TPnWowYXt+QM+MgD60KnAZm8pY9bZuejf9eLG3W9aB427d4/1Y/ZG0x/IDkYwhhDWtOw56iA0JCmhVP+RYy9vjFp6etnC/5ykzpqpUBn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klawrafy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klawrafy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156796; x=1810692796;
  h=date:from:to:cc:subject:message-id;
  bh=FuP1CeX8DstvW9VjNUtg8ctoan8Q6ACetcYdBQi91ow=;
  b=klawrafyQyXhPuBAvHBkgXDKBBoZZcW806ZpGPiFhsNr2TPDzLBsPIRH
   wXK0w0kvTwXx9CwBqeRXbKtf+e3WzCdSO4QT+nlZwSTMSEjR1LjLuJ90B
   bLLCgH2O4E6rSYqyaVN3nVxBijqRyqggTQ+MVy+V+Ii04wppsMnUrUAvJ
   Tn11X2PU5AMSP+mzRbBlaLn86H8YTuxlodaSdImnywKRxcaAD5g63WYiQ
   DYFvdf69lpS00cOnmXCQaYDngNKEOnX4jiRHT8GPdCosHkz3nnb9bGOsF
   wEgdvZ5jzA0FzkirLvDCere99dXtFbZUAhZQlDuHEtIgQTxstwabrgrcN
   A==;
X-CSE-ConnectionGUID: TYNT5LV5Rc2z9ErE7+sQ5A==
X-CSE-MsgGUID: POX+BhhARg6DZTXdF+UgJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876121"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:14 -0700
X-CSE-ConnectionGUID: ytxOCDKrQuiogAn4VJe38g==
X-CSE-MsgGUID: htp2cHwHTXCWdmVrFwm3cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167826"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:12 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xG-0000000001J-0lH2;
	Tue, 19 May 2026 02:13:10 +0000
Date: Tue, 19 May 2026 06:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] kernel/time/ntp_internal.h:18:26:
 warning: declaration of 'struct audit_ntp_data' will not be visible outside
 of this function
Message-ID: <202605190528.ToAWmVmo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: um-randconfig-002-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190528.ToAWmVmo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190528.ToAWmVmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190528.ToAWmVmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/vmclock_host.c:19:
>> kernel/time/ntp_internal.h:18:26: warning: declaration of 'struct audit_ntp_data' will not be visible outside of this function [-Wvisibility]
      18 |                         s32 *time_tai, struct audit_ntp_data *ad);
         |                                               ^
   kernel/time/vmclock_host.c:48:1: warning: '/*' within block comment [-Wcomment]
      48 | /*
         | ^
   kernel/time/vmclock_host.c:65:19: warning: unused variable 'need' [-Wunused-variable]
      65 |         int bits_so_far, need;
         |                          ^~~~
   3 warnings generated.


vim +18 kernel/time/ntp_internal.h

aa6f9c595d8573 John Stultz     2013-03-22   4  
aa6f9c595d8573 John Stultz     2013-03-22   5  extern void ntp_init(void);
123146665ac942 David Woodhouse 2026-05-17   6  extern int ntp_get_status(void);
123146665ac942 David Woodhouse 2026-05-17   7  extern int ntp_get_time_state(void);
5ffa25f573cf52 Thomas Gleixner 2025-05-19   8  extern void ntp_clear(unsigned int tkid);
aa6f9c595d8573 John Stultz     2013-03-22   9  /* Returns how long ticks are at present, in ns / 2^NTP_SCALE_SHIFT. */
5ffa25f573cf52 Thomas Gleixner 2025-05-19  10  extern u64 ntp_tick_length(unsigned int tkid);
62941377ae6950 David Woodhouse 2026-05-18  11  extern s64 ntp_get_skew_delta(unsigned int tkid);
62941377ae6950 David Woodhouse 2026-05-18  12  extern s64 ntp_drain_time_offset(unsigned int tkid, s64 amount);
3bb3f3d284811d David Woodhouse 2026-05-18  13  extern void ntp_set_time_offset(unsigned int tkid, s64 offset_ns);
8f592fb554b22b David Woodhouse 2026-05-15  14  extern void ntp_set_tick_length(unsigned int tkid, u64 tick_length);
5ffa25f573cf52 Thomas Gleixner 2025-05-19  15  extern ktime_t ntp_get_next_leap(unsigned int tkid);
5ffa25f573cf52 Thomas Gleixner 2025-05-19  16  extern int second_overflow(unsigned int tkid, time64_t secs);
c7ebfbc440151a Thomas Gleixner 2025-05-19  17  extern int ntp_adjtimex(unsigned int tkid, struct __kernel_timex *txc, const struct timespec64 *ts,
7e8eda734d30de Ondrej Mosnacek 2019-04-10 @18  			s32 *time_tai, struct audit_ntp_data *ad);
985e695074d357 Ondrej Mosnacek 2018-07-13  19  extern void __hardpps(const struct timespec64 *phase_ts, const struct timespec64 *raw_ts);
c9e6189fb03123 Thomas Gleixner 2020-12-06  20  

:::::: The code at line 18 was first introduced by commit
:::::: 7e8eda734d30de81d06a949c9bf9853c445ede4e ntp: Audit NTP parameters adjustment

:::::: TO: Ondrej Mosnacek <omosnace@redhat.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
