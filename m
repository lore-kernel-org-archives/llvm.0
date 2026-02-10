Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641F18C933;
	Tue, 10 Feb 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758343; cv=none; b=lWDsu+R03obN3CioEL1qpyFtLsO+AqkP0thB+VanoO543Sgbdg0pfWKsDCVMjeQAGYQOXS1601cUbI3vI5Ar9Iu5h41j/wVQDeH7ZoMEYcog2tWYZCE8dO4yKm2cNX78UZsFiYj63badyJBs0KXwPIzsBuW1f2P/iQdePbgGAq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758343; c=relaxed/simple;
	bh=OBgKMhwigoL+mWRvWVpWuBIwheh3zOpnuyAHc3OGnJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HOslolpm/4KAJ3K2e8w/+BGXGwBWor5B9wY0DlYubxLmj15m5D5GTbWgVkjO+Z0oncGGAxiN2/901k9/Tim4yTELrZgaOWkMJAcwbnZedU40eSs+jWIS3KXgVtG+0DJcXEsM9yIwPx0z9rk6okDKbkzPv+crrU1RMf+beFphknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiytlxMI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiytlxMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770758341; x=1802294341;
  h=date:from:to:cc:subject:message-id;
  bh=OBgKMhwigoL+mWRvWVpWuBIwheh3zOpnuyAHc3OGnJw=;
  b=QiytlxMIQrtUdaQFT7KidxQV/gjS6+p448IDY83yAQyoDEigN/f5ZG53
   ETs4/U4Oy1s3QSypP5lthzLqTqhV6OUUD2Uy5eSHq7S8BG42pYrWfZJwd
   WDQ3BzOl452dsnyE5uuk8xhH3cOm3cynJkYcd2XJciO++IacStSM8yszu
   RRmLOsTLCJ8nIO2vahTmwoKPno1d/Gne0A+0hWZxUXibM/h1vgYgGuGMz
   iH0BK82lxHOTQSdcPTHOwH2QcqRfyHlZIxsQP26uJtCfvOKT9OqXgIJ2o
   Eq2cVbDVALyJ5M51ZhxygAjOLocMktNzCvnRQe5YPXOnQM3iWKf39ch9k
   g==;
X-CSE-ConnectionGUID: AQ2R2SUEQtGf3EeT80Oiag==
X-CSE-MsgGUID: c1W236x1S8CMTvAwO0xJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75526128"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75526128"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 13:19:00 -0800
X-CSE-ConnectionGUID: TkSPWfzXTMySQrokhjGXrg==
X-CSE-MsgGUID: 7k5nyF97SDquwjEiZbEwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211492545"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 13:18:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpv8K-00000000pQS-33Z6;
	Tue, 10 Feb 2026 21:18:56 +0000
Date: Wed, 11 Feb 2026 05:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:svctcp-next 1/8] include/trace/events/sunrpc.h:1945:1:
 error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean
 'XPT_PEER_VALID'?
Message-ID: <202602110548.KZOeWFeZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux svctcp-next
head:   c718461befe42db474143734b2ab32df318f9fd4
commit: bf126e1cd573edafc55b7ec7d6d23f641007d71f [1/8] sunrpc: Add XPT flags missing from SVC_XPRT_FLAG_LIST
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110548.KZOeWFeZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110548.KZOeWFeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110548.KZOeWFeZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/sunrpc.h:1945:1: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    1945 | SVC_XPRT_FLAG_LIST
         | ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1942:44: note: expanded from macro 'svc_xprt_flag'
    1942 | #define svc_xprt_flag(x)        TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^
   <scratch space>:162:1: note: expanded from here
     162 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/sunrpc.h:1945:1: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    1945 | SVC_XPRT_FLAG_LIST
         | ^
   include/trace/events/sunrpc.h:1938:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1938 |         svc_xprt_flag_end(XPT_RPCB_UNREG)
         |         ^
   include/trace/events/sunrpc.h:1943:48: note: expanded from macro 'svc_xprt_flag_end'
    1943 | #define svc_xprt_flag_end(x)    TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^
   <scratch space>:174:1: note: expanded from here
     174 | XPT_XPT_RPCB_UNREG
         | ^
   include/linux/sunrpc/svc_xprt.h:107:2: note: 'XPT_RPCB_UNREG' declared here
     107 |         XPT_RPCB_UNREG,         /* transport that needs unregistering
         |         ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2029:38: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    2029 |         TP_printk(SVC_XPRT_ENDPOINT_FORMAT, SVC_XPRT_ENDPOINT_VARARGS)
         |                                             ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1949:32: note: expanded from macro 'svc_xprt_flag'
    1949 | #define svc_xprt_flag(x)        { BIT(XPT_##x), #x },
         |                                       ^
   <scratch space>:90:1: note: expanded from here
      90 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2029:38: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    2029 |         TP_printk(SVC_XPRT_ENDPOINT_FORMAT, SVC_XPRT_ENDPOINT_VARARGS)
         |                                             ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1938:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1938 |         svc_xprt_flag_end(XPT_RPCB_UNREG)
         |         ^
   include/trace/events/sunrpc.h:1950:36: note: expanded from macro 'svc_xprt_flag_end'
    1950 | #define svc_xprt_flag_end(x)    { BIT(XPT_##x), #x }
         |                                       ^
   <scratch space>:93:1: note: expanded from here
      93 | XPT_XPT_RPCB_UNREG
         | ^
   include/linux/sunrpc/svc_xprt.h:107:2: note: 'XPT_RPCB_UNREG' declared here
     107 |         XPT_RPCB_UNREG,         /* transport that needs unregistering
         |         ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2054:3: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    2054 |                 SVC_XPRT_ENDPOINT_VARARGS, __entry->wakeup, __entry->qtime)
         |                 ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1949:32: note: expanded from macro 'svc_xprt_flag'
    1949 | #define svc_xprt_flag(x)        { BIT(XPT_##x), #x },
         |                                       ^
   <scratch space>:155:1: note: expanded from here
     155 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2054:3: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    2054 |                 SVC_XPRT_ENDPOINT_VARARGS, __entry->wakeup, __entry->qtime)
         |                 ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
--
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/sunrpc.h:1945:1: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    1945 | SVC_XPRT_FLAG_LIST
         | ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1942:44: note: expanded from macro 'svc_xprt_flag'
    1942 | #define svc_xprt_flag(x)        TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^
   <scratch space>:186:1: note: expanded from here
     186 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/sunrpc.h:1945:1: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    1945 | SVC_XPRT_FLAG_LIST
         | ^
   include/trace/events/sunrpc.h:1938:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1938 |         svc_xprt_flag_end(XPT_RPCB_UNREG)
         |         ^
   include/trace/events/sunrpc.h:1943:48: note: expanded from macro 'svc_xprt_flag_end'
    1943 | #define svc_xprt_flag_end(x)    TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^
   <scratch space>:198:1: note: expanded from here
     198 | XPT_XPT_RPCB_UNREG
         | ^
   include/linux/sunrpc/svc_xprt.h:107:2: note: 'XPT_RPCB_UNREG' declared here
     107 |         XPT_RPCB_UNREG,         /* transport that needs unregistering
         |         ^
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2029:38: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    2029 |         TP_printk(SVC_XPRT_ENDPOINT_FORMAT, SVC_XPRT_ENDPOINT_VARARGS)
         |                                             ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1949:32: note: expanded from macro 'svc_xprt_flag'
    1949 | #define svc_xprt_flag(x)        { BIT(XPT_##x), #x },
         |                                       ^
   <scratch space>:108:1: note: expanded from here
     108 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2029:38: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    2029 |         TP_printk(SVC_XPRT_ENDPOINT_FORMAT, SVC_XPRT_ENDPOINT_VARARGS)
         |                                             ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1938:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1938 |         svc_xprt_flag_end(XPT_RPCB_UNREG)
         |         ^
   include/trace/events/sunrpc.h:1950:36: note: expanded from macro 'svc_xprt_flag_end'
    1950 | #define svc_xprt_flag_end(x)    { BIT(XPT_##x), #x }
         |                                       ^
   <scratch space>:111:1: note: expanded from here
     111 | XPT_XPT_RPCB_UNREG
         | ^
   include/linux/sunrpc/svc_xprt.h:107:2: note: 'XPT_RPCB_UNREG' declared here
     107 |         XPT_RPCB_UNREG,         /* transport that needs unregistering
         |         ^
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2054:3: error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean 'XPT_PEER_VALID'?
    2054 |                 SVC_XPRT_ENDPOINT_VARARGS, __entry->wakeup, __entry->qtime)
         |                 ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'
    1953 |         __print_flags(flags, "|", SVC_XPRT_FLAG_LIST)
         |                                   ^
   include/trace/events/sunrpc.h:1937:2: note: expanded from macro 'SVC_XPRT_FLAG_LIST'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^
   include/trace/events/sunrpc.h:1949:32: note: expanded from macro 'svc_xprt_flag'
    1949 | #define svc_xprt_flag(x)        { BIT(XPT_##x), #x },
         |                                       ^
   <scratch space>:173:1: note: expanded from here
     173 | XPT_XPT_PEER_VALID
         | ^
   include/linux/sunrpc/svc_xprt.h:103:2: note: 'XPT_PEER_VALID' declared here
     103 |         XPT_PEER_VALID,         /* peer has presented a filehandle that
         |         ^
   In file included from sched.c:31:
   In file included from include/trace/events/sunrpc.h:2530:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/sunrpc.h:2054:3: error: use of undeclared identifier 'XPT_XPT_RPCB_UNREG'; did you mean 'XPT_RPCB_UNREG'?
    2054 |                 SVC_XPRT_ENDPOINT_VARARGS, __entry->wakeup, __entry->qtime)
         |                 ^
   include/trace/events/sunrpc.h:2006:3: note: expanded from macro 'SVC_XPRT_ENDPOINT_VARARGS'
    2006 |                 show_svc_xprt_flags(__entry->flags)
         |                 ^
   include/trace/events/sunrpc.h:1953:28: note: expanded from macro 'show_svc_xprt_flags'


vim +1945 include/trace/events/sunrpc.h

d75e490f35601aa Chuck Lever 2023-07-29  1944  
d75e490f35601aa Chuck Lever 2023-07-29 @1945  SVC_XPRT_FLAG_LIST
d75e490f35601aa Chuck Lever 2023-07-29  1946  

:::::: The code at line 1945 was first introduced by commit
:::::: d75e490f35601aae12c7284d3c22684c65fb8354 SUNRPC: change svc_xprt::xpt_flags bits to enum

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
