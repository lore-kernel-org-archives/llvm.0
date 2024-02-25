Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F415DDC9;
	Sun, 25 Feb 2024 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708849023; cv=none; b=oZQbwYCI9ngc/xsbS6YuJY9+y2uOC+dBpEwLFP33pKqmJ4y7s4fIyOolJuTxYRZZIpT0m8Jgv5QSNY7F5idbyqdYEyOHmQ2JI+qa5igecjM5rf17fg+MuadXqzVM92R6rMBzRISd97C3nh/RaM17doyjW5VbuegGx02IoJqIbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708849023; c=relaxed/simple;
	bh=BgUhjwTsrZs2hpbc6ZjJeqddUX7JNybdOpRkAvVm3+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=je0vFjwCAvlvdpvGLfZSVjxLaNZuJoLF6TR/gqPk1MDTB4LBqdwVDiS5xqMoLPl276yASFammk5vFy5Xs6+NPhMQ0Djc0KvthTAl5e2bC4knsCxpkX+c/vf845UUOgGo2FpqgEAqcHrAGaiCjXfeNSc+ojgPyPxWceSi2rdut94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM2drpXp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM2drpXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708849021; x=1740385021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BgUhjwTsrZs2hpbc6ZjJeqddUX7JNybdOpRkAvVm3+k=;
  b=BM2drpXpblLwPpqfHvjeLZrRaVtx+ad5JjS71hNErtSqSWlq0hI2BNbb
   aPSZUokIZUtCADP8uWT/3d3qW8SZPlG6iWsbdAvDwGYgtcMvU/VpbtuIc
   dmC0FQpsVV3krzUCGo+6Gx5P0sruDxWmdudJ+k6tMeM/p90wY//zfigrk
   BnWnoCuWckwDviZLJ7obNlCug6WineieBVMaLzvicGLuDCrPi24aPfe8q
   mX7LF6jlhtTd1wNNz01nmn2WfZzI2z/wavSWSyD1Zv/8+uXLJpVqFtaaq
   lwBs883Maa4o+H5afwT9DkYAoX4jYIWEWzrTT0jNNj4I0zsyFve+kNku1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3298657"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3298657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 00:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6487977"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Feb 2024 00:16:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re9gQ-0009Pg-1p;
	Sun, 25 Feb 2024 08:16:33 +0000
Date: Sun, 25 Feb 2024 16:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:tick/keep-tick-on-hrt 13/15]
 include/trace/events/timer.h:445:33: warning: format specifies type
 'unsigned long' but the argument has type 'long long'
Message-ID: <202402251657.1rYDQZAN-lkp@intel.com>
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
commit: 30beac287e56cba2668a905e56b9879f23972ae2 [13/15] trace: tick: Trace the restarting of tick (split)
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240225/202402251657.1rYDQZAN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251657.1rYDQZAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251657.1rYDQZAN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/timer.c:58:
   In file included from include/trace/events/timer.h:474:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> include/trace/events/timer.h:445:33: warning: format specifies type 'unsigned long' but the argument has type 'long long' [-Wformat]
                           __entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from kernel/time/timer.c:58:
   In file included from include/trace/events/timer.h:474:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
   include/trace/events/timer.h:466:33: warning: format specifies type 'unsigned long' but the argument has type 'long long' [-Wformat]
                           __entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from kernel/time/timer.c:58:
   In file included from include/trace/events/timer.h:474:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
   include/trace/events/timer.h:467:36: warning: format specifies type 'unsigned long' but the argument has type 'long long' [-Wformat]
                           __entry->expiry / NSEC_PER_SEC, (__entry->expiry % NSEC_PER_SEC) / NSEC_PER_USEC)
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   3 warnings generated.


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
