Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEBCDDA8;
	Fri, 15 Mar 2024 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710472619; cv=none; b=WjN2ukb8sFG91OgScYQdRlIrDRUgLTtoJzxCTWj0V2RJiidrdVafuzjdobpbbXqgbfDPT5kU2jlhlVvYc0EBJxLYojOO4ROLqC6IxIjZ1iY8cLBhcP6+WbV6XIzwSCEPtObKIIoUXtM0i1tXyQbTDa8c24GgqmG2MlOfrhabDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710472619; c=relaxed/simple;
	bh=8JzaVk9gruOujD2r0aXlTG/Ms4WOQ1J0AdeBljiacwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tb1ZhOdePoqTqhzMtYqW8eRphheekk+bVbhQH/jGX+UrIiJuJZDOC0HFJFQio8tX3a6W54RWLYvGmHPqZnLZ5Q+FXOOOEKSCt/XcoKQOgY/iBToQc9/PaScxg30I4ipnOBmS/uQCrcYvYcX5JZa1XT0YcQWj52SGVBmkX2uc+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHkyFwXx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHkyFwXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710472617; x=1742008617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JzaVk9gruOujD2r0aXlTG/Ms4WOQ1J0AdeBljiacwQ=;
  b=QHkyFwXxPZ9yYycTCoa7rRMB3XchkSrcIH7b9yROBAas4QMcjixFum9H
   Z0OlpEQO6Nrsu5o5RZSbtLdWjDWF3NNUNUsFCkHDPidBcx63bA0Q7PqG1
   e3j/YU/agLsm09sri+9qRplU91UWL8U27hYbfDWr9L1n7ABMwCkw5h3bd
   wUjR5dM0AxyRbRkqNtm8EoEuAl6mENvCUfqKR/lEt1FL3IhMNNoXKuDOA
   /bvP5xEbVma8K1jOihAPr12zm9V3xRn0Z8Qqcmb8F5AF/2+RCNZPr3A7a
   6AcibOkR9G6NVb8w3RTWbC+g7dq2ae0bJ0xql1ksWGr6nL6/JjYQPuYHr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5456792"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5456792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 20:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17113525"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2024 20:16:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rky3v-000E2T-2f;
	Fri, 15 Mar 2024 03:16:51 +0000
Date: Fri, 15 Mar 2024 11:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 37/37] include/trace/events/qdisc.h:91:3:
 error: incompatible pointer types passing 'struct net_device *' to parameter
 of type 'const char *'
Message-ID: <202403151109.KpRssux5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   eb871b9424cba3ba1466bb4db2a064d606430541
commit: eb871b9424cba3ba1466bb4db2a064d606430541 [37/37] tracing: Use strcmp() in __assign_str() WARN_ON() check
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240315/202403151109.KpRssux5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151109.KpRssux5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151109.KpRssux5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/net-traces.c:37:
   In file included from include/trace/events/qdisc.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> include/trace/events/qdisc.h:91:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
                   __assign_str(dev, qdisc_dev(q));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:39:16: note: expanded from macro '__assign_str'
                                strcmp((src), __data_offsets.dst##_ptr_) : \
                                       ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   include/linux/string.h:86:31: note: passing argument to parameter here
   extern int strcmp(const char *,const char *);
                                 ^
   In file included from net/core/net-traces.c:37:
   In file included from include/trace/events/qdisc.h:153:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/qdisc.h:116:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
                   __assign_str(dev, qdisc_dev(q));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:39:16: note: expanded from macro '__assign_str'
                                strcmp((src), __data_offsets.dst##_ptr_) : \
                                       ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   include/linux/string.h:86:31: note: passing argument to parameter here
   extern int strcmp(const char *,const char *);
                                 ^
   In file included from net/core/net-traces.c:37:
   In file included from include/trace/events/qdisc.h:153:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/qdisc.h:91:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
                   __assign_str(dev, qdisc_dev(q));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:39:16: note: expanded from macro '__assign_str'
                                strcmp((src), __data_offsets.dst##_ptr_) : \
                                       ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   include/linux/string.h:86:31: note: passing argument to parameter here
   extern int strcmp(const char *,const char *);
                                 ^
   In file included from net/core/net-traces.c:37:
   In file included from include/trace/events/qdisc.h:153:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/qdisc.h:116:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
                   __assign_str(dev, qdisc_dev(q));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:39:16: note: expanded from macro '__assign_str'
                                strcmp((src), __data_offsets.dst##_ptr_) : \
                                       ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   include/linux/string.h:86:31: note: passing argument to parameter here
   extern int strcmp(const char *,const char *);
                                 ^
   4 errors generated.


vim +91 include/trace/events/qdisc.h

a34dac0b905520 Cong Wang 2020-05-26   78  
a34dac0b905520 Cong Wang 2020-05-26   79  	TP_PROTO(struct Qdisc *q),
a34dac0b905520 Cong Wang 2020-05-26   80  
a34dac0b905520 Cong Wang 2020-05-26   81  	TP_ARGS(q),
a34dac0b905520 Cong Wang 2020-05-26   82  
a34dac0b905520 Cong Wang 2020-05-26   83  	TP_STRUCT__entry(
a34dac0b905520 Cong Wang 2020-05-26   84  		__string(	dev,		qdisc_dev(q)	)
a34dac0b905520 Cong Wang 2020-05-26   85  		__string(	kind,		q->ops->id	)
a34dac0b905520 Cong Wang 2020-05-26   86  		__field(	u32,		parent		)
a34dac0b905520 Cong Wang 2020-05-26   87  		__field(	u32,		handle		)
a34dac0b905520 Cong Wang 2020-05-26   88  	),
a34dac0b905520 Cong Wang 2020-05-26   89  
a34dac0b905520 Cong Wang 2020-05-26   90  	TP_fast_assign(
a34dac0b905520 Cong Wang 2020-05-26  @91  		__assign_str(dev, qdisc_dev(q));
a34dac0b905520 Cong Wang 2020-05-26   92  		__assign_str(kind, q->ops->id);
a34dac0b905520 Cong Wang 2020-05-26   93  		__entry->parent = q->parent;
a34dac0b905520 Cong Wang 2020-05-26   94  		__entry->handle = q->handle;
a34dac0b905520 Cong Wang 2020-05-26   95  	),
a34dac0b905520 Cong Wang 2020-05-26   96  
a34dac0b905520 Cong Wang 2020-05-26   97  	TP_printk("dev=%s kind=%s parent=%x:%x handle=%x:%x", __get_str(dev),
a34dac0b905520 Cong Wang 2020-05-26   98  		  __get_str(kind), TC_H_MAJ(__entry->parent) >> 16, TC_H_MIN(__entry->parent),
a34dac0b905520 Cong Wang 2020-05-26   99  		  TC_H_MAJ(__entry->handle) >> 16, TC_H_MIN(__entry->handle))
a34dac0b905520 Cong Wang 2020-05-26  100  );
a34dac0b905520 Cong Wang 2020-05-26  101  

:::::: The code at line 91 was first introduced by commit
:::::: a34dac0b9055202cf9c64e08d8d8dc5e23029d3a net_sched: add tracepoints for qdisc_reset() and qdisc_destroy()

:::::: TO: Cong Wang <xiyou.wangcong@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
