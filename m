Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1017E16062E;
	Thu, 29 Feb 2024 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709228549; cv=none; b=SvWbWgd4DXsl0OzVHWjf4a9M2YhxNpDH+Zipjt9twuTG2FfLbfzJEf3GPDipAjFtiEyY5H0B44AqnFkXCIzMQY2izYsyIgrKJAtJzF03u6y4Jme8/J11Z4u8eCNTGpOtl1OukmMI8/NgTky+gVyMjjiPIWg0dO20egsUfCAvnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709228549; c=relaxed/simple;
	bh=8h6+BbDamnLu3DlrLrM73+9CLCVTfR+UcbDCMaXntvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FtOKNlS6WnuN4OevkTfJsvuJTpJwZXxCPDabUD19/Ci5oQzm3ExGLxJWjfAaBLg6u2QH6qWJKpp8vNLooMqpLPjhpimpMOi42FHhtPuc87fiEbsg3k99/EbyM6m6h8mLF0ZTA/wf4ZoNgLcyNA3GFXPgAAGv7gkJI8rGgleHirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3esKzXj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3esKzXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709228547; x=1740764547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h6+BbDamnLu3DlrLrM73+9CLCVTfR+UcbDCMaXntvA=;
  b=d3esKzXjNpH+0tLVEoroe4O6cVmy/AwIJfnHHj/fyvfilrznNmNCicGf
   rjXRmF7wfqHgv1kd2MVXEXnTtWvX0yPwKv57Ycfv6xvZPLnd7+x9QIWir
   vnLPfpsVOPWY9Gx+t5t5yMob15cWu2WfBsAXfjE0BHVfIryzMhQ6cLw0N
   ActK/cyT54xKwTqlH6onSWhvSrxpzlnqgEa2oTn18lWpxQw/moHDzl+zZ
   NkeoX9uhNHlQxJ6HrW26d/zx2QGorAyET9dr1eNRByHH+LWAuJtdVqiRh
   6+3GMjtbCLldPeTh9bx9PnxUIo91pJ2WiJNu5L9dkPpPq27JEB7HWha6S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15135472"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="15135472"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12588074"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 09:42:24 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfkQH-000D9z-0M;
	Thu, 29 Feb 2024 17:42:21 +0000
Date: Fri, 1 Mar 2024 01:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:trace/for-next 28/29] net/batman-adv/trace.h:44:7: warning:
 result of comparison against a string literal is unspecified (use an
 explicit string comparison function instead)
Message-ID: <202403010156.O6QWmq3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   eb1533d156d307c2125943eaf1925e268094d984
commit: 433e1d88a3be93222989e52fa99594fe9eb93622 [28/29] tracing: Add warning if string in __assign_str() does not match __string()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010156.O6QWmq3X-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010156.O6QWmq3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010156.O6QWmq3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/batman-adv/trace.c:8:
   In file included from net/batman-adv/trace.h:64:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> net/batman-adv/trace.h:44:7: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
      29 |                     __string(device, bat_priv->soft_iface->name)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      30 |                     __string(driver, KBUILD_MODNAME)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                     __vstring(msg, vaf->fmt, vaf->va)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |             ),
         |             ~~
      33 | 
      34 |             TP_fast_assign(
         |             ~~~~~~~~~~~~~~~
      35 |                     __assign_str(device, bat_priv->soft_iface->name);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      36 |                     __assign_str(driver, KBUILD_MODNAME);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                     __assign_vstr(msg, vaf->fmt, vaf->va);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      38 |             ),
         |             ~~
      39 | 
      40 |             TP_printk(
         |             ~~~~~~~~~~
      41 |                     "%s %s %s",
         |                     ~~~~~~~~~~~
      42 |                     __get_str(driver),
         |                     ~~~~~~~~~~~~~~~~~~
      43 |                     __get_str(device),
         |                     ~~~~~~~~~~~~~~~~~~
      44 |                     __get_str(msg)
         |                     ~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from net/batman-adv/trace.c:8:
   In file included from net/batman-adv/trace.h:64:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> net/batman-adv/trace.h:44:7: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
      29 |                     __string(device, bat_priv->soft_iface->name)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      30 |                     __string(driver, KBUILD_MODNAME)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                     __vstring(msg, vaf->fmt, vaf->va)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |             ),
         |             ~~
      33 | 
      34 |             TP_fast_assign(
         |             ~~~~~~~~~~~~~~~
      35 |                     __assign_str(device, bat_priv->soft_iface->name);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      36 |                     __assign_str(driver, KBUILD_MODNAME);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                     __assign_vstr(msg, vaf->fmt, vaf->va);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      38 |             ),
         |             ~~
      39 | 
      40 |             TP_printk(
         |             ~~~~~~~~~~
      41 |                     "%s %s %s",
         |                     ~~~~~~~~~~~
      42 |                     __get_str(driver),
         |                     ~~~~~~~~~~~~~~~~~~
      43 |                     __get_str(device),
         |                     ~~~~~~~~~~~~~~~~~~
      44 |                     __get_str(msg)
         |                     ~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   2 warnings generated.
--
   In file included from drivers/net/wireless/ath/trace.c:20:
   In file included from drivers/net/wireless/ath/trace.h:68:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/net/wireless/ath/trace.h:48:7: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
      33 |                     __string(device, wiphy_name(wiphy))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      34 |                     __string(driver, KBUILD_MODNAME)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      35 |                     __vstring(msg, vaf->fmt, vaf->va)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      36 |             ),
         |             ~~
      37 | 
      38 |             TP_fast_assign(
         |             ~~~~~~~~~~~~~~~
      39 |                     __assign_str(device, wiphy_name(wiphy));
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                     __assign_str(driver, KBUILD_MODNAME);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                     __assign_vstr(msg, vaf->fmt, vaf->va);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |             ),
         |             ~~
      43 | 
      44 |             TP_printk(
         |             ~~~~~~~~~~
      45 |                     "%s %s %s",
         |                     ~~~~~~~~~~~
      46 |                     __get_str(driver),
         |                     ~~~~~~~~~~~~~~~~~~
      47 |                     __get_str(device),
         |                     ~~~~~~~~~~~~~~~~~~
      48 |                     __get_str(msg)
         |                     ~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from drivers/net/wireless/ath/trace.c:20:
   In file included from drivers/net/wireless/ath/trace.h:68:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> drivers/net/wireless/ath/trace.h:48:7: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
      33 |                     __string(device, wiphy_name(wiphy))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      34 |                     __string(driver, KBUILD_MODNAME)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      35 |                     __vstring(msg, vaf->fmt, vaf->va)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      36 |             ),
         |             ~~
      37 | 
      38 |             TP_fast_assign(
         |             ~~~~~~~~~~~~~~~
      39 |                     __assign_str(device, wiphy_name(wiphy));
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                     __assign_str(driver, KBUILD_MODNAME);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                     __assign_vstr(msg, vaf->fmt, vaf->va);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |             ),
         |             ~~
      43 | 
      44 |             TP_printk(
         |             ~~~~~~~~~~
      45 |                     "%s %s %s",
         |                     ~~~~~~~~~~~
      46 |                     __get_str(driver),
         |                     ~~~~~~~~~~~~~~~~~~
      47 |                     __get_str(device),
         |                     ~~~~~~~~~~~~~~~~~~
      48 |                     __get_str(msg)
         |                     ~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   2 warnings generated.


vim +44 net/batman-adv/trace.h

d331a739949992 Sven Eckelmann          2018-08-10  30  
d331a739949992 Sven Eckelmann          2018-08-10  31  	    TP_PROTO(struct batadv_priv *bat_priv,
d331a739949992 Sven Eckelmann          2018-08-10  32  		     struct va_format *vaf),
d331a739949992 Sven Eckelmann          2018-08-10  33  
d331a739949992 Sven Eckelmann          2018-08-10  34  	    TP_ARGS(bat_priv, vaf),
d331a739949992 Sven Eckelmann          2018-08-10  35  
d331a739949992 Sven Eckelmann          2018-08-10  36  	    TP_STRUCT__entry(
d331a739949992 Sven Eckelmann          2018-08-10  37  		    __string(device, bat_priv->soft_iface->name)
d331a739949992 Sven Eckelmann          2018-08-10  38  		    __string(driver, KBUILD_MODNAME)
9abc291812d784 Steven Rostedt (Google  2022-07-24  39) 		    __vstring(msg, vaf->fmt, vaf->va)
d331a739949992 Sven Eckelmann          2018-08-10  40  	    ),
d331a739949992 Sven Eckelmann          2018-08-10  41  
d331a739949992 Sven Eckelmann          2018-08-10  42  	    TP_fast_assign(
d331a739949992 Sven Eckelmann          2018-08-10  43  		    __assign_str(device, bat_priv->soft_iface->name);
d331a739949992 Sven Eckelmann          2018-08-10 @44  		    __assign_str(driver, KBUILD_MODNAME);
9abc291812d784 Steven Rostedt (Google  2022-07-24  45) 		    __assign_vstr(msg, vaf->fmt, vaf->va);
d331a739949992 Sven Eckelmann          2018-08-10  46  	    ),
d331a739949992 Sven Eckelmann          2018-08-10  47  
d331a739949992 Sven Eckelmann          2018-08-10  48  	    TP_printk(
d331a739949992 Sven Eckelmann          2018-08-10  49  		    "%s %s %s",
d331a739949992 Sven Eckelmann          2018-08-10  50  		    __get_str(driver),
d331a739949992 Sven Eckelmann          2018-08-10  51  		    __get_str(device),
d331a739949992 Sven Eckelmann          2018-08-10  52  		    __get_str(msg)
d331a739949992 Sven Eckelmann          2018-08-10  53  	    )
d331a739949992 Sven Eckelmann          2018-08-10  54  );
d331a739949992 Sven Eckelmann          2018-08-10  55  
d331a739949992 Sven Eckelmann          2018-08-10  56  #endif /* _NET_BATMAN_ADV_TRACE_H_ || TRACE_HEADER_MULTI_READ */
d331a739949992 Sven Eckelmann          2018-08-10  57  
d331a739949992 Sven Eckelmann          2018-08-10  58  #undef TRACE_INCLUDE_PATH
d331a739949992 Sven Eckelmann          2018-08-10  59  #define TRACE_INCLUDE_PATH .
d331a739949992 Sven Eckelmann          2018-08-10  60  #undef TRACE_INCLUDE_FILE
d331a739949992 Sven Eckelmann          2018-08-10  61  #define TRACE_INCLUDE_FILE trace
d331a739949992 Sven Eckelmann          2018-08-10  62  
d331a739949992 Sven Eckelmann          2018-08-10  63  /* This part must be outside protection */
d331a739949992 Sven Eckelmann          2018-08-10 @64  #include <trace/define_trace.h>

:::::: The code at line 44 was first introduced by commit
:::::: d331a739949992043b135fcfba649196b397ec3b batman-adv: Provide debug messages as trace events

:::::: TO: Sven Eckelmann <sven@narfation.org>
:::::: CC: Simon Wunderlich <sw@simonwunderlich.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
