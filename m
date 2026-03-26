Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5034405AC1;
	Thu, 26 Mar 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547098; cv=none; b=sonOJzam4xvgrDRna5i2kbKJJ3BjhlK8c2stC1L/xB/WY73O0JafJu8OaFhT19IaUIeKtKP8nVYH+omOIO2o2n/+ioKtyPJIZVQfGwQKuvRDf0u1yIcqoxFlVium5pnsX7yNWreBkJ9uQJsJ17maWpnZSy3WC+QR3xXcV0JNRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547098; c=relaxed/simple;
	bh=N48O+VJuVyeYbIA1zLz14U+1OYf0Z+vKaFljbngpqSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mc2LKf2XGN4R/BsER8RW2LvQ91VEoGf/g829XLFNp00pqCGXuVHUUfoilxNo/8Fh5rFdgA4UcNKFBjmiVJvQ5W8BuRqQDToKqqkSQs6U2OPvwj9lnNEV2ayw2MGTnm+BF7dUV/rIRE8Rfcx/w9AKMhMBhEFGZtLsXP4sArazurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a011wp32; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a011wp32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774547094; x=1806083094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N48O+VJuVyeYbIA1zLz14U+1OYf0Z+vKaFljbngpqSE=;
  b=a011wp325i2WIWBjdY2eQghrnzXmxPvi0GkJ43jBTw/gIMcocoi4zTgP
   ccs3MIsxfMgW8VRgwELaYZN5BZ5Faj2ZZ3A8a35ZL5Zwmq9DZ75lnm7nJ
   htVPJNvL9giBMn5aLWOHFinPXVzm/mfF+7+bHsHU6LhaU59FlraumAXE6
   ymiaM3RPWEGwQdIWDlegrvASksNjIyOvKS2TJUwtKqL1X0tGaJDjK22Sq
   Zge2kWlEPR3VTgwtawUzenJlJdoyF53Zr6WvyvfFq1wGrhxWH/e+g2464
   vmHimsAHOBNxaVxNnoAGbvydFPabmE77OT34MMWQXMgVUStaT/WCA8ivQ
   Q==;
X-CSE-ConnectionGUID: 36BhH6PlRoGBEsWKoMsQfw==
X-CSE-MsgGUID: L23Z+cMhStCMwDnecDaQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98234740"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="98234740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:44:50 -0700
X-CSE-ConnectionGUID: es1pv1CMRImtKQ9jUngWjQ==
X-CSE-MsgGUID: 89StwfooSZ2IyzlqHZoqFg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2026 10:44:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5olB-0000000099P-110G;
	Thu, 26 Mar 2026 17:44:45 +0000
Date: Fri, 27 Mar 2026 01:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18]
 samples/trace_events/trace-events-sample.h:306:3: error: diagnostic behavior
 may be improved by adding the 'format(printf, 7, 0)' attribute to the
 declaration of 'trace_event_get_offsets_foo_bar'
Message-ID: <202603270156.zDpTyfwX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   fb40de0a3d3ef218f63b2eb7698903d2328f3593
commit: 972c95c4ea353a5734cab4fc9a9308b05ceeefe8 [3/18] run-tests
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270156.zDpTyfwX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270156.zDpTyfwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270156.zDpTyfwX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/trace_events/trace-events-sample.c:12:
   In file included from samples/trace_events/trace-events-sample.h:640:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:293:
>> samples/trace_events/trace-events-sample.h:306:3: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 0)' attribute to the declaration of 'trace_event_get_offsets_foo_bar' [-Werror,-Wmissing-format-attribute]
     291 | TRACE_EVENT(foo_bar,
         | __attribute__((format(printf, 7, 0))) 
     292 | 
     293 |         TP_PROTO(const char *foo, int bar, const int *lst,
     294 |                  const char *string, const struct cpumask *mask,
     295 |                  const char *fmt, va_list *va),
     296 | 
     297 |         TP_ARGS(foo, bar, lst, string, mask, fmt, va),
     298 | 
     299 |         TP_STRUCT__entry(
     300 |                 __array(        char,   foo,    10              )
     301 |                 __field(        int,    bar                     )
     302 |                 __dynamic_array(int,    list,   __length_of(lst))
     303 |                 __string(       str,    string                  )
     304 |                 __bitmask(      cpus,   num_possible_cpus()     )
     305 |                 __cpumask(      cpum                            )
     306 |                 __vstring(      vstr,   fmt,    va              )
         |                 ^
   include/trace/stages/stage5_get_offsets.h:69:9: note: expanded from macro '__vstring'
      69 |                       __trace_event_vstr_len(fmt, ap))
         |                       ^
   include/linux/trace_events.h:956:38: note: expanded from macro '__trace_event_vstr_len'
     956 |         __ret = vsnprintf(NULL, 0, fmt, __ap) + 1;      \
         |                                             ^
   include/trace/stages/stage5_get_offsets.h:52:19: note: expanded from macro '__dynamic_array'
      52 |         __item_length = (len) * sizeof(type);                           \
         |                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:43:16: note: expanded from macro 'TRACE_EVENT'
      43 |                              PARAMS(tstruct),                  \
         |                                     ^
   include/linux/tracepoint.h:140:25: note: expanded from macro 'PARAMS'
     140 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:285:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^
   samples/trace_events/trace-events-sample.h:291:1: note: 'trace_event_get_offsets_foo_bar' declared here
     291 | TRACE_EVENT(foo_bar,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:278:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     278 | static inline notrace int trace_event_get_offsets_##call(               \
         |                           ^
   <scratch space>:50:1: note: expanded from here
      50 | trace_event_get_offsets_foo_bar
         | ^
   In file included from samples/trace_events/trace-events-sample.c:12:
   In file included from samples/trace_events/trace-events-sample.h:640:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
>> samples/trace_events/trace-events-sample.h:291:1: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 0)' attribute to the declaration of 'do_trace_event_raw_event_foo_bar' [-Werror,-Wmissing-format-attribute]
     291 | TRACE_EVENT(foo_bar,
         | ^
         | __attribute__((format(printf, 7, 0))) 
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:433:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
     433 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/trace_events.h:417:68: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     417 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                           ^
   samples/trace_events/trace-events-sample.h:291:1: note: 'do_trace_event_raw_event_foo_bar' declared here
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:433:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
     433 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/trace_events.h:405:27: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     405 | static notrace void                                                     \
         |                                                                         ^
   <scratch space>:127:1: note: expanded from here
     127 | do_trace_event_raw_event_foo_bar
         | ^
   In file included from samples/trace_events/trace-events-sample.c:12:
   In file included from samples/trace_events/trace-events-sample.h:640:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
>> samples/trace_events/trace-events-sample.h:291:1: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 0)' attribute to the declaration of 'trace_event_raw_event_foo_bar' [-Werror,-Wmissing-format-attribute]
     291 | TRACE_EVENT(foo_bar,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:440:46: note: expanded from macro 'DECLARE_EVENT_CLASS'
     440 |         do_trace_event_raw_event_##call(__data, args);                  \
         |                                                     ^
   samples/trace_events/trace-events-sample.h:291:1: note: 'trace_event_raw_event_foo_bar' declared here
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:436:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     436 | static notrace void                                                     \
         |                                                                         ^
   <scratch space>:131:1: note: expanded from here
     131 | trace_event_raw_event_foo_bar
         | ^
   In file included from samples/trace_events/trace-events-sample.c:12:
   In file included from samples/trace_events/trace-events-sample.h:640:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> samples/trace_events/trace-events-sample.h:291:1: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 0)' attribute to the declaration of 'do_perf_trace_foo_bar' [-Werror,-Wmissing-format-attribute]
     291 | TRACE_EVENT(foo_bar,
         | ^
         | __attribute__((format(printf, 7, 0))) 
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/perf.h:65:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
      65 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/perf.h:31:68: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      31 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                           ^
   samples/trace_events/trace-events-sample.h:291:1: note: 'do_perf_trace_foo_bar' declared here
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/perf.h:65:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
      65 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/perf.h:17:27: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      17 | static notrace void                                                     \
         |                                                                         ^
   <scratch space>:112:1: note: expanded from here
     112 | do_perf_trace_foo_bar
         | ^
   In file included from samples/trace_events/trace-events-sample.c:12:
   In file included from samples/trace_events/trace-events-sample.h:640:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> samples/trace_events/trace-events-sample.h:291:1: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 0)' attribute to the declaration of 'perf_trace_foo_bar' [-Werror,-Wmissing-format-attribute]
     291 | TRACE_EVENT(foo_bar,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/perf.h:75:35: note: expanded from macro 'DECLARE_EVENT_CLASS'
      75 |         do_perf_trace_##call(__data, args);                             \
         |                                          ^
   samples/trace_events/trace-events-sample.h:291:1: note: 'perf_trace_foo_bar' declared here
     291 | TRACE_EVENT(foo_bar,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:475:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
     475 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/trace_events.h:390:2: note: expanded from macro '\
   _TRACE_PERF_PROTO'
     390 |         perf_trace_##call(void *__data, proto);
         |         ^
   <scratch space>:96:1: note: expanded from here
      96 | perf_trace_foo_bar
         | ^
   5 errors generated.
--
>> arch/sparc/kernel/uprobes.c:284:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
     284 |         default:
         |         ^
   arch/sparc/kernel/uprobes.c:284:2: note: insert 'break;' to avoid fall-through
     284 |         default:
         |         ^
         |         break; 
   1 error generated.
--
>> drivers/clk/clk-qoriq.c:925:39: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 8)' attribute to the declaration of 'create_mux_common' [-Werror,-Wmissing-format-attribute]
     910 | static struct clk * __init create_mux_common(struct clockgen *cg,
         | __attribute__((format(printf, 7, 8))) 
     911 |                                              struct mux_hwclock *hwc,
     912 |                                              const struct clk_ops *ops,
     913 |                                              unsigned long min_rate,
     914 |                                              unsigned long max_rate,
     915 |                                              unsigned long pct80_rate,
     916 |                                              const char *fmt, int idx)
     917 | {
     918 |         struct clk_init_data init = {};
     919 |         struct clk *clk;
     920 |         const struct clockgen_pll_div *div;
     921 |         const char *parent_names[NUM_MUX_PARENTS];
     922 |         char name[32];
     923 |         int i, j;
     924 | 
     925 |         snprintf(name, sizeof(name), fmt, idx);
         |                                              ^
   drivers/clk/clk-qoriq.c:910:28: note: 'create_mux_common' declared here
     910 | static struct clk * __init create_mux_common(struct clockgen *cg,
         |                            ^
   1 error generated.
--
>> drivers/cpufreq/sparc-us2e-cpufreq.c:247:26: error: variable 'new_freq' set but not used [-Werror,-Wunused-but-set-variable]
     247 |         unsigned long new_bits, new_freq;
         |                                 ^
   1 error generated.
--
>> drivers/scsi/esas2r/esas2r_log.c:160:50: error: diagnostic behavior may be improved by adding the 'format(printf, 3, 0)' attribute to the declaration of 'esas2r_log_master' [-Werror,-Wmissing-format-attribute]
     121 |                 retval = vsnprintf(buffer, buflen, format, args);
         |                                                                ^
   drivers/scsi/esas2r/esas2r_log.c:121:12: note: 'esas2r_log_master' declared here
     121 | static int esas2r_log_master(const long level,
         |            ^
   1 error generated.
--
>> drivers/infiniband/hw/ionic/ionic_datapath.c:902:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     902 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:905:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     905 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:909:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     909 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_INV);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:946:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     946 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:949:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     949 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:978:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     978 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_READ);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:983:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     983 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:986:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
     986 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1023:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
    1023 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_CS);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1031:18: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
    1031 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_FA);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1066:17: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
    1066 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, LOCAL_INV);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1101:17: error: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Werror,-Wenum-compare-conditional]
    1101 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, REG_MR);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   12 errors generated.
--
>> drivers/net/ethernet/sfc/ethtool_common.c:274:60: error: diagnostic behavior may be improved by adding the 'format(printf, 7, 8)' attribute to the declaration of 'efx_fill_test' [-Werror,-Wmissing-format-attribute]
     257 |                 snprintf(test_str, sizeof(test_str), test_format, test_id);
         |                                                                          ^
   drivers/net/ethernet/sfc/ethtool_common.c:257:13: note: 'efx_fill_test' declared here
     257 | static void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
         |             ^
>> drivers/net/ethernet/sfc/ethtool_common.c:352:28: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     352 |                       "phy", 0, "alive", NULL);
         |                                 ~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:354:29: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     354 |                       "core", 0, "nvram", NULL);
         |                                  ~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:356:33: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     356 |                       "core", 0, "interrupt", NULL);
         |                                  ~~~~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:363:24: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     363 |                               "eventq.dma", NULL);
         |                               ~~~~~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:367:24: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     367 |                               "eventq.int", NULL);
         |                               ~~~~~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:371:30: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     371 |                       "core", 0, "memory", NULL);
         |                                  ~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/sfc/ethtool_common.c:373:33: error: data argument not used by format string [-Werror,-Wformat-extra-args]
     373 |                       "core", 0, "registers", NULL);
         |                                  ~~~~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   8 errors generated.
..


vim +306 samples/trace_events/trace-events-sample.h

32eb3d0d09943ab Steven Rostedt (Red Hat  2015-04-01  290) 
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14 @291  TRACE_EVENT(foo_bar,
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  292  
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  293) 	TP_PROTO(const char *foo, int bar, const int *lst,
fea6ac554d9dea8 Steven Rostedt (Google   2022-07-15  294) 		 const char *string, const struct cpumask *mask,
fea6ac554d9dea8 Steven Rostedt (Google   2022-07-15  295) 		 const char *fmt, va_list *va),
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  296  
fea6ac554d9dea8 Steven Rostedt (Google   2022-07-15  297) 	TP_ARGS(foo, bar, lst, string, mask, fmt, va),
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  298  
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  299  	TP_STRUCT__entry(
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  300  		__array(	char,	foo,    10		)
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  301  		__field(	int,	bar			)
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  302) 		__dynamic_array(int,	list,   __length_of(lst))
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  303) 		__string(	str,	string			)
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  304) 		__bitmask(	cpus,	num_possible_cpus()	)
8230f27b1ccc4b8 Steven Rostedt (Google   2022-10-14  305) 		__cpumask(	cpum				)
fea6ac554d9dea8 Steven Rostedt (Google   2022-07-15 @306) 		__vstring(	vstr,	fmt,	va		)
dd6ae6d90a84d4b Steven Rostedt (Google   2024-02-23  307) 		__string_len(	lstr,	foo,	bar / 2 < strlen(foo) ? bar / 2 : strlen(foo) )
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  308  	),
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  309  
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  310  	TP_fast_assign(
40b2519d7566266 Kees Cook                2023-11-16  311  		strscpy(__entry->foo, foo, 10);
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  312  		__entry->bar	= bar;
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  313) 		memcpy(__get_dynamic_array(list), lst,
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  314) 		       __length_of(lst) * sizeof(int));
2c92ca849fcc6ee Steven Rostedt (Google   2024-05-16  315) 		__assign_str(str);
2c92ca849fcc6ee Steven Rostedt (Google   2024-05-16  316) 		__assign_str(lstr);
fea6ac554d9dea8 Steven Rostedt (Google   2022-07-15  317) 		__assign_vstr(vstr, fmt, va);
4e20e3a60b57efa Steven Rostedt (Red Hat  2015-02-09  318) 		__assign_bitmask(cpus, cpumask_bits(mask), num_possible_cpus());
8230f27b1ccc4b8 Steven Rostedt (Google   2022-10-14  319) 		__assign_cpumask(cpum, cpumask_bits(mask));
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  320  	),
9cfe06f8cd5c8c3 Steven Rostedt           2009-04-14  321  
ea8d7647f9ddf1f Steven Rostedt           2025-03-27  322  	TP_printk("foo %s %d %s %s %s %s %s %s (%s) (%s) %s [%d] %*pbl",
ea8d7647f9ddf1f Steven Rostedt           2025-03-27  323  		  __entry->foo, __entry->bar,
32eb3d0d09943ab Steven Rostedt (Red Hat  2015-04-01  324) 

:::::: The code at line 306 was first introduced by commit
:::::: fea6ac554d9dea849e2517284b17f99fb9be423a tracing: Add example and documentation for new __vstring() macro

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
