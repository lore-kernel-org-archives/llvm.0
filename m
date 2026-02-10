Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF21C5D5E;
	Tue, 10 Feb 2026 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770760103; cv=none; b=Nqk2Mkilz7ljsROey+G+pRorVvI735A0srqfHwscYtih/09IIg7E99K5ZHoiM+I7AP/BDNEhpI93A/iIbuaKCMDKipPKu9eNTNz7948E6uuRr2eqywAbuZRFdKa6TFKWGpaen4Jej2Zh9ru10dB3RAdmCXGOMZGZiSz1cC6aC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770760103; c=relaxed/simple;
	bh=7sMJ0rndG9ntB3cSg7snjLej01lpwRWRwKEdPUQ57eQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RcxxAG9ZN/qO1lziO+TIIpcTigqGbOncbJRgkil0SHkPVNnwyh5Nje1zwKHaA60I09/S25DCLYQLL4/pzJc8e4vrOLmkiAx1avdAPSY7WQ6ROC0e3j79/+hnaatxifduuM24TX3mgQsj46AR76wzuy4O/6/X8B1KT5MrRpA6gDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF/xg60v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF/xg60v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770760101; x=1802296101;
  h=date:from:to:cc:subject:message-id;
  bh=7sMJ0rndG9ntB3cSg7snjLej01lpwRWRwKEdPUQ57eQ=;
  b=GF/xg60vZ5ppN/QgaOHQ5r0olYjbI+Q1ttcR8RB4uvFHVnhemoGxuWu5
   pErnixhCNTnSzoZnnWTOOK7fm7sKtjmchhTye9ai/0rkiXQkegtK9R1gH
   6/XAgkSgZ9+mYGE9jLNkOsogWDzEkb6svJ5nz3t2irQQ9gMuB2jVNordm
   dgy2Kq/FtZDBnMCF6qj8KuaL4B0r/eUd315A0ArrxjRddLtsyhqn3zbmL
   Wx4bMJrCDzvtIX24HlLOsImjvpR8fOqTkuB6uKNm5BE3WiwN9eapuZM8s
   STAVMIg0mLA5RTslyxicm3IPFfOQsua+Kt1pAlm11g5j2l2/qtj/5dWnb
   Q==;
X-CSE-ConnectionGUID: cZlEoeAIQ2OpozY4zJI0Qg==
X-CSE-MsgGUID: gma1wKySRday8i7Jb7Ypbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82537671"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82537671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 13:48:21 -0800
X-CSE-ConnectionGUID: jwKA2BMBQuWcoBzXEv1EVw==
X-CSE-MsgGUID: bcjPt67aQdSwlEcdLKPAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211051003"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 13:48:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpvaj-000000000w1-1Bmr;
	Tue, 10 Feb 2026 21:48:17 +0000
Date: Tue, 10 Feb 2026 22:48:16 +0100
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:svctcp-next 1/8] include/trace/events/sunrpc.h:1945:1:
 error: use of undeclared identifier 'XPT_XPT_PEER_VALID'; did you mean
 'XPT_PEER_VALID'?
Message-ID: <202602102246.StBm8t5U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux svctcp-next
head:   c718461befe42db474143734b2ab32df318f9fd4
commit: bf126e1cd573edafc55b7ec7d6d23f641007d71f [1/8] sunrpc: Add XPT flags missing from SVC_XPRT_FLAG_LIST
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602102246.StBm8t5U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102246.StBm8t5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102246.StBm8t5U-lkp@intel.com/

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
   <scratch space>:70:1: note: expanded from here
      70 | XPT_XPT_PEER_VALID
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
   <scratch space>:82:1: note: expanded from here
      82 | XPT_XPT_RPCB_UNREG
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
   <scratch space>:207:1: note: expanded from here
     207 | XPT_XPT_PEER_VALID
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
   <scratch space>:210:1: note: expanded from here
     210 | XPT_XPT_RPCB_UNREG
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
   <scratch space>:32:1: note: expanded from here
      32 | XPT_XPT_PEER_VALID
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


vim +1945 include/trace/events/sunrpc.h

d75e490f35601a Chuck Lever 2023-07-29  1944  
d75e490f35601a Chuck Lever 2023-07-29 @1945  SVC_XPRT_FLAG_LIST
d75e490f35601a Chuck Lever 2023-07-29  1946  

:::::: The code at line 1945 was first introduced by commit
:::::: d75e490f35601aae12c7284d3c22684c65fb8354 SUNRPC: change svc_xprt::xpt_flags bits to enum

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
