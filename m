Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F92DDC1;
	Sun, 25 Feb 2024 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708844070; cv=none; b=WRSdCCmFHCms2KSo27VmrWwMriNoIXK4bVaeNXi+7oSHotHgfjXpnuTDdLaX2r8iNkzUyt1chrwPUINEC3LVzgk+8c8EtLCPHybp3ZlbEZsL8LGiq3FInaiBlbd9bhNu/aNBV1y91LBHGvsKNZ3ONDGP3CzggcfvPbkxlbkdmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708844070; c=relaxed/simple;
	bh=8PCnQ8dMyefylBQzxvxk3sU3yg/tUtFWEKrEEf8ezbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eia+agCLkRP0lKC7yBS4wPSiKv58+fNetDzaUefm7/IL2s7wb/WWpTKVs+cPcxDZKo8TYUT6RaK0Bmz4v0DNSV5jZ4M9s00GvgsOHtZh4OEvpxfTkRwWVAOiEEDB5eS2LbcAKvij3nESY1rrrPvyifKOuQ6tup1iwozLfzvv7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvKdl/Pm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvKdl/Pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708844067; x=1740380067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PCnQ8dMyefylBQzxvxk3sU3yg/tUtFWEKrEEf8ezbg=;
  b=FvKdl/PmODNvUDfigMQJ4vji58awxbz+5z6jKnW/PQjP6EGkzFPamCdC
   KmOS4fEwZS3deyRHQDI8ejN1O/F91vivE6RYOOG4jgFwZFWOqwFf2kk0R
   Lb34gfRfbu0KDGNoptUImOQd0nXhblCXJOKeVV+1eYgXb1wFBbaTiT1HN
   2mXZFrhaClaufxdVjG+CFYfFn4JWJxzs6oQ8vYwNvaaBYjYpHZYotxQUt
   z70hr1KrFiegfv3Z6m4x2vRGxjztWAFnDuDhGebE9iQ4m0Ay1w+i/ZRob
   KF/PFY2RGiR+uWksHwIokVkxD2W/5/IKsUFxlPX2mh6M0tRvaX1TNt2tH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3291642"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3291642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 22:54:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="11007238"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2024 22:54:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re8Oy-0009Ng-3B;
	Sun, 25 Feb 2024 06:54:20 +0000
Date: Sun, 25 Feb 2024 14:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:tick/keep-tick-on-hrt 12/13]
 include/trace/events/timer.h:445:33: warning: format specifies type
 'unsigned long' but the argument has type 's64' (aka 'long long')
Message-ID: <202402251414.eLUf0bsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git tick/keep-tick-on-hrt
head:   9a7f9b220850f08cf58f16872c84b08bc461a806
commit: f0b7e48995407d4df5a145fafc9940953a34006c [12/13] trace: tick: Trace the restarting of tick (split)
config: i386-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251414.eLUf0bsU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251414.eLUf0bsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251414.eLUf0bsU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/timer.c:58:
   In file included from include/trace/events/timer.h:474:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> include/trace/events/timer.h:445:33: warning: format specifies type 'unsigned long' but the argument has type 's64' (aka 'long long') [-Wformat]
     426 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     427 |                 __field( int ,          success )
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     428 |                 __field( int ,          dependency )
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     429 |                 __field( s64,           now     )
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |         ),
         |         ~~
     431 | 
     432 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     433 |                 __entry->success        = success;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     434 |                 __entry->dependency     = dependency;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     435 |                 __entry->now            = ktime_get();  // TODO: Look into using ktime_get_ts64 however this is not what tick-sched does.
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     436 |         ),
         |         ~~
     437 | 
     438 |         TP_printk("now=%llu.%06lu success=%d dependency=%s",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             %06lld
     439 |                         __entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     440 |                         __entry->success, show_tick_dep_name(__entry->dependency))
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 | );
         | ~
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
       9 | #define TP_printk(fmt, args...) fmt "\n", args
         |                                 ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   In file included from kernel/time/timer.c:58:
   In file included from include/trace/events/timer.h:474:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
   include/trace/events/timer.h:466:33: warning: format specifies type 'unsigned long' but the argument has type 's64' (aka 'long long') [-Wformat]
     449 |         TP_ARGS(expiry),
         |         ~~~~~~~~~~~~~~~~
     450 | 
     451 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     452 |                 __field( s64,           now     )
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     453 |                 __field( s64,           expiry  )
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     454 |         ),
         |         ~~
     455 | 
     456 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     457 |                 __entry->now    = ktime_get();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     458 |                 __entry->expiry = expiry;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     459 |         ),
         |         ~~
     460 | 
     461 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             %06lld
     462 |                         __entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     463 |                         __entry->expiry / NSEC_PER_SEC, (__entry->expiry % NSEC_PER_SEC) / NSEC_PER_USEC)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     464 | );
         | ~
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
       9 | #define TP_printk(fmt, args...) fmt "\n", args
         |                                 ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +445 include/trace/events/timer.h

   427	
   428		TP_PROTO(int success, int dependency),
   429	
   430		TP_ARGS(success, dependency),
   431	
   432		TP_STRUCT__entry(
   433			__field( int ,		success	)
   434			__field( int ,		dependency )
   435			__field( s64,		now	)
   436		),
   437	
   438		TP_fast_assign(
   439			__entry->success	= success;
   440			__entry->dependency	= dependency;
   441			__entry->now		= ktime_get();	// TODO: Look into using ktime_get_ts64 however this is not what tick-sched does.
   442		),
   443	
   444		TP_printk("now=%llu.%06lu success=%d dependency=%s",
 > 445				__entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
   446				__entry->success, show_tick_dep_name(__entry->dependency))
   447	);
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
