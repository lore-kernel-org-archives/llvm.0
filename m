Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C749BD90;
	Thu, 10 Sep 2026 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049718; cv=none; b=AKmxKtBm0wYiRNLruP7YhgyzUO4N9hloOLhu1s0HdNse9qPY/WOzV5umKOS/EYua4AIpziNL1xHzB3QgOwWvgZE96eb3x6mx00TxyCprKs/uWajQh1mA7tSQpZ6eTHjcTtibF0RT0PlMRjy6EFoI3BAAXeAv2vKCief+J1l5Lj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049718; c=relaxed/simple;
	bh=mDVnyyipZwiMq6Elf6ansEdymEt5Z0wVe/0clwdH0gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmqAr75sDIQlQxgovNQVR873tm+AWGGR9WTfTE/oWfmVIOzXp++Uy8URsCAS9vrT493+4G3ZjmnAVOdIoFiqG2q2KSb6fcG1L4hO0TIKZGebc6p8gBzvlj5NknZAUnJw3UZyDblP+iMPTKT34/sgWOYdNWkYXQfvIIG6Z8Cehqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeLekPf1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeLekPf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789049716; x=1820585716;
  h=date:from:to:cc:subject:message-id;
  bh=mDVnyyipZwiMq6Elf6ansEdymEt5Z0wVe/0clwdH0gg=;
  b=PeLekPf1WAa05VXp9m+H3sE/vIlopb0PWKadGlT7KegSSF4pDSWPGdQs
   F+deOmqC4Rc+zcAlMfxhEaAVWYwjRULr+JPSbI0A3hbA65vQrdrcc6G8r
   v/qcCmzstFD6P2QquGM992yWvLejeV9PXlyRcxIqVJU+YywScQt0OpevJ
   UKZymk+oFrB22vlAXd0R5Y2LaCQ5AWqV+/Oqrrcq2g2pRJOJs1oVUkvxh
   Jk1Mv6fZoEXoOF2VP9cQ0iWMGaLvo+0DFoLZejw+3sNq1dABjqloNRdCm
   E5MxBRN8hFSlM+Q2qQSoJmO7OWRJuRxgf84NmEB3iqTM46q13QSDxbUjK
   g==;
X-CSE-ConnectionGUID: W1FwzGwfT76e43aPMiG/mw==
X-CSE-MsgGUID: pTB83w/eRTOIw2QdltqlSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93325334"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93325334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:15:15 -0700
X-CSE-ConnectionGUID: Z0i0xx0oQI6Mo+h5LnHqRw==
X-CSE-MsgGUID: H6DA+yGmQo6Pzez7K+Wexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301549453"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 07:15:13 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4fWw-00000000061-0SPW;
	Thu, 10 Sep 2026 14:14:02 +0000
Date: Thu, 10 Sep 2026 22:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.09.03a 43/55]
 drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an
 rvalue of type 'dma_addr_t' (aka 'unsigned long long')
Message-ID: <202609101926.cc5w6bhk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.03a
head:   6c5c244f4b239bc4d284e58a2f79a143648557cb
commit: afda2321e6e93a5bcc28bfb4717fbc3a1768446c [43/55] EXP drivers/usb/mtu3: Work around mtu3_log_ep double-indirection issue
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101926.cc5w6bhk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101926.cc5w6bhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101926.cc5w6bhk-lkp@intel.com/

Note: the paulmck-rcu/dev.2026.09.03a HEAD 6c5c244f4b239bc4d284e58a2f79a143648557cb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/usb/mtu3/mtu3_trace.c:12:
   In file included from drivers/usb/mtu3/mtu3_trace.h:279:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:489:
   drivers/usb/mtu3/./mtu3_trace.h:239:41: error: member reference type 'struct mtu3_gpd_ring' is not a pointer; did you mean to use '.'?
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                          ~~~~~~~~~~~~~^~
         |                                                       .
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:456:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
     161 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:448:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from drivers/usb/mtu3/mtu3_trace.c:12:
   In file included from drivers/usb/mtu3/mtu3_trace.h:279:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:489:
>> drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an rvalue of type 'dma_addr_t' (aka 'unsigned long long')
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:456:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
     161 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:448:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from drivers/usb/mtu3/mtu3_trace.c:12:
   In file included from drivers/usb/mtu3/mtu3_trace.h:279:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
   drivers/usb/mtu3/./mtu3_trace.h:239:41: error: member reference type 'struct mtu3_gpd_ring' is not a pointer; did you mean to use '.'?
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                          ~~~~~~~~~~~~~^~
         |                                                       .
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
     161 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from drivers/usb/mtu3/mtu3_trace.c:12:
   In file included from drivers/usb/mtu3/mtu3_trace.h:279:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an rvalue of type 'dma_addr_t' (aka 'unsigned long long')
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
     161 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   4 errors generated.


vim +239 drivers/usb/mtu3/./mtu3_trace.h

   213	
   214	DECLARE_EVENT_CLASS(mtu3_log_ep,
   215		TP_PROTO(struct mtu3_ep *mep),
   216		TP_ARGS(mep),
   217		TP_STRUCT__entry(
   218			__string(name, mep->name)
   219			__field(unsigned int, type)
   220			__field(unsigned int, slot)
   221			__field(unsigned int, maxp)
   222			__field(unsigned int, mult)
   223			__field(unsigned int, maxburst)
   224			__field(unsigned int, flags)
   225			__field(unsigned int, direction)
   226			__field(struct mtu3_gpd_ring *, gpd_ring)
   227			__field(dma_addr_t *, gpd_ring_dma)
   228		),
   229		TP_fast_assign(
   230			__assign_str(name);
   231			__entry->type = mep->type;
   232			__entry->slot = mep->slot;
   233			__entry->maxp = mep->ep.maxpacket;
   234			__entry->mult = mep->ep.mult;
   235			__entry->maxburst = mep->ep.maxburst;
   236			__entry->flags = mep->flags;
   237			__entry->direction = mep->is_in;
   238			__entry->gpd_ring = &mep->gpd_ring;
 > 239			__entry->gpd_ring_dma = &mep->gpd_ring->dma;
   240		),
   241		TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
   242			__get_str(name), usb_ep_type_string(__entry->type),
   243			__entry->maxp, __entry->slot,
   244			__entry->mult, __entry->maxburst,
   245			__entry->gpd_ring, __entry->gpd_ring_dma,
   246			__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
   247			__entry->flags & MTU3_EP_STALL ? 'S' : 's',
   248			__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
   249			__entry->flags & MTU3_EP_BUSY ? 'B' : 'b',
   250			__entry->direction ? '<' : '>'
   251		)
   252	);
   253	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
