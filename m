Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8A14E2E8;
	Tue, 11 Jun 2024 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718086859; cv=none; b=fOBMcZ3Pagj7HtHJ636Uxu2nTiiuDUtZJ8RrjSwRZ+QVpWoU8sq/Iozfq6lZMcgFlNepk6+2M5pDPO1IDkLRg22Zx6TtpE1UAiRyQZAb5ZXOTkivDwH2fBcQmOGHtFJOI9nxedNQ9Ttzo3sq3/XB1/oe4AJq7rXzMXoFqJ8/ujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718086859; c=relaxed/simple;
	bh=Nd05OUT3V2sUavL7zEUCpk3iulnLesmiRKr0GbHNDyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ex5HyHWYnEnvAe24BH7zS0wJUZmm9asGZDASuDCnobiFqA/5u/NCXlP2JLMElVFLzwWjuJbllwfdkXVklAAfTuLL2OImz3aFIkSZtOZKbC8q3Yyp25w708nwxgMhD1Re4N6LbE0SvmPIop+0kJCzGPEJuFQdGO32VTdaQrAHyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA09E6q+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA09E6q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718086857; x=1749622857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nd05OUT3V2sUavL7zEUCpk3iulnLesmiRKr0GbHNDyM=;
  b=dA09E6q+V+jm3RiLJxmF1O3Eway5uypG/V4roT9zbSqCpy7glSbhXZs1
   7GkA8kZQT1RljmGbiIBqd6UY5Lg9sZQLhhujlowLWIDB5h1Ba59HuXgZu
   jrMlwGhtVgkMk6tQEfPjVWBlT9a6xsOt3TQ4OFa3H7ZFT1YgiFSPdeEZV
   i3VD2RmLAdTGV/GlMZvA1Qxkzi2lyUGQyI39E5+LxECNQ1G2LCQY8Z1yc
   50XUXu1eQa97bDJZiLyqjcdOeV5jfAMphsX//S5cXz3LWqkyuD+MZIWKA
   SpOameLeh01nltxfjbA8FGMP4Az7A27NwctOpze0LKfl7MrfUVGMUbuOq
   w==;
X-CSE-ConnectionGUID: 60AWcfn+S8udgIv3A76QmA==
X-CSE-MsgGUID: +CdUjoJPT9aDpgQ00NM8YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12012084"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="12012084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 23:20:55 -0700
X-CSE-ConnectionGUID: q4CMuWawTna/8b17bgcr4Q==
X-CSE-MsgGUID: CvDuFV1MSbqevXwIkfYNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="40000696"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 23:20:53 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGusF-00007I-1E;
	Tue, 11 Jun 2024 06:20:51 +0000
Date: Tue, 11 Jun 2024 14:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 7/11] include/trace/events/timestamp.h:30:17:
 warning: incompatible pointer to integer conversion assigning to 'ktime_t'
 (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with *
Message-ID: <202406111429.zWmWFpjy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   be51a9b4d34b1383cf39064988562665bed1b954
commit: 748dc0feb518a69ac526fedfc5436478d68320d3 [7/11] fs: add tracepoints around multigrain timestamp changes
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240611/202406111429.zWmWFpjy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111429.zWmWFpjy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111429.zWmWFpjy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
   include/trace/events/timestamp.h:47:1: error: expected expression
   TRACE_EVENT(ctime_inode_update,
   ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_EVENT_CLASS(name,                              \
           ^
   include/trace/trace_events.h:203:32: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                         ^
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> include/trace/events/timestamp.h:30:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->old            = old;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/timestamp.h:31:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->new            = new;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/timestamp.h:32:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->cur            = cur;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/timestamp.h:30:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->old            = old;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/timestamp.h:31:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->new            = new;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from fs/inode.c:26:
   In file included from include/trace/events/timestamp.h:153:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/timestamp.h:32:17: warning: incompatible pointer to integer conversion assigning to 'ktime_t' (aka 'long long') from 'ktime_t *' (aka 'long long *'); dereference with * [-Wint-conversion]
                   __entry->cur            = cur;
                                           ^ ~~~
                                             *
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
>> fs/inode.c:2618:35: warning: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
                   trace_ctime_floor_update(inode, floor, now, old);
                                                   ^~~~~
                                                   &
   include/trace/events/timestamp.h:13:13: note: passing argument to parameter 'old' here
                    ktime_t *old,
                             ^
   fs/inode.c:2618:42: warning: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
                   trace_ctime_floor_update(inode, floor, now, old);
                                                          ^~~
                                                          &
   include/trace/events/timestamp.h:14:13: note: passing argument to parameter 'new' here
                    ktime_t *new,
                             ^
   fs/inode.c:2618:47: warning: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
                   trace_ctime_floor_update(inode, floor, now, old);
                                                               ^~~
                                                               &
   include/trace/events/timestamp.h:15:13: note: passing argument to parameter 'cur' here
                    ktime_t *cur),
                             ^
   fs/inode.c:2630:49: error: too few arguments to function call, expected 6, have 4
           trace_ctime_inode_update(inode, ctime, sav, now);
           ~~~~~~~~~~~~~~~~~~~~~~~~                       ^
   include/trace/events/timestamp.h:47:1: note: 'trace_ctime_inode_update' declared here
   TRACE_EVENT(ctime_inode_update,
   ^
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:256:21: note: expanded from macro '__DECLARE_TRACE'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:73:1: note: expanded from here
   trace_ctime_inode_update
   ^
   9 warnings and 2 errors generated.


vim +30 include/trace/events/timestamp.h

    10	
    11	TRACE_EVENT(ctime_floor_update,
    12		TP_PROTO(struct inode *inode,
    13			 ktime_t *old,
    14			 ktime_t *new,
    15			 ktime_t *cur),
    16	
    17		TP_ARGS(inode, old, new, cur),
    18	
    19		TP_STRUCT__entry(
    20			__field(dev_t,				dev)
    21			__field(ino_t,				ino)
    22			__field(ktime_t,			old)
    23			__field(ktime_t,			new)
    24			__field(ktime_t,			cur)
    25		),
    26	
    27		TP_fast_assign(
    28			__entry->dev		= inode->i_sb->s_dev;
    29			__entry->ino		= inode->i_ino;
  > 30			__entry->old		= old;
    31			__entry->new		= new;
    32			__entry->cur		= cur;
    33		),
    34	
    35		TP_printk("ino=%d:%d:%lu old=%llu.%lu new=%llu.%lu cur=%llu.%lu swp=%c",
    36			MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
    37			ktime_to_timespec64(__entry->old).tv_sec,
    38			ktime_to_timespec64(__entry->old).tv_nsec,
    39			ktime_to_timespec64(__entry->new).tv_sec,
    40			ktime_to_timespec64(__entry->new).tv_nsec,
    41			ktime_to_timespec64(__entry->cur).tv_sec,
    42			ktime_to_timespec64(__entry->cur).tv_nsec,
    43			(__entry->old == __entry->cur) ? 'Y' : 'N'
    44		)
    45	);
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
