Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED737AA6F;
	Sun, 24 May 2026 05:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779600697; cv=none; b=QtJ5Tkw9QJZqBu33cHXiOW0If9FXXDSae5Y4+z3/PrhVPfOLK3q5tByi4bFqfifErMQS6VFWoJRgatLJtnTFN4Z+3VlvpQwmcj9gPVL90Hls5C0/FkKzdtTVNDE/0afcjdJrgsYLYMg8CLYK2dccHpD1Nu9mTLmIiocjmNBaJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779600697; c=relaxed/simple;
	bh=tef8Fhqg5PDYEhXsa0buNm94XQhG70Xn+hp2NSsotBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Evnzoadxs7KGnExpio4jA8drNDjeYn+3cIFuHnHqqOc1WuCrMqVgTjvVwyyh4taqlhrDx6tqmiSr+kpu/vM9s4l5aCfiAPGJe26RGFmSOm1Az+cy1DkY90CKedAiZF5AFEWnu7KK20Am1/3xUaVnqpRss2RhrN/2YFAC4mzAcf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEeL/hSI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEeL/hSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779600694; x=1811136694;
  h=date:from:to:cc:subject:message-id;
  bh=tef8Fhqg5PDYEhXsa0buNm94XQhG70Xn+hp2NSsotBU=;
  b=UEeL/hSIUR5JXjuF0FLblW9CV6vNhQxDKu+pUO6oPGmE7Fq4Wo7oS7Z8
   x57V5DZe52lmkDssiq0QbhLCABtufV66z3soCoxBq/oURD91gu5rWOGBd
   7WG/i5A8V4L4xgwaSLpdmvbDQLxqAYKN6L4oHvBo7XpTsbCGUL7Z2/6JJ
   NQPhng9C3TxuO2mtG9RQsdTjVjq5PM3gDoK09OKB06rP9YhQrgUkly3gZ
   3+j9976X2Pw31DMrYUophKq0BaQgbefL5be4APkBVUlBAJUKLRQikhxlG
   H/vjb8J86iRbGgQtcm4r/vwdiRIJm8CFsTZehANXcvXkyRC41L8Br2bsc
   A==;
X-CSE-ConnectionGUID: n1xB3kRGRh+jmU1CVeY2RA==
X-CSE-MsgGUID: aoeZSGKpSCGoKQ/OM9taVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103143094"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="103143094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 22:31:30 -0700
X-CSE-ConnectionGUID: dfhsoL/aTOCAS1PlpxM5RQ==
X-CSE-MsgGUID: gio5DOujQyuMiTbxXyUYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="245328395"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2026 22:31:28 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR1Qq-000000000k3-28K2;
	Sun, 24 May 2026 05:31:24 +0000
Date: Sun, 24 May 2026 13:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 135/138] fs/nfsd/trace.h:1399:13: error:
 no member named 'i_ino' in 'struct trace_event_raw_nfsd_handle_dir_event'
Message-ID: <202605241348.lDmpAIuh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   cb6655f508cb28f992a1bc31ccdf76e1af8fa021
commit: 04cc256388df5d2d284f4d9d3e9f22ebf974f806 [135/138] nfsd: fix ino_t format specifier in nfsd_handle_dir_event tracepoint
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605241348.lDmpAIuh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241348.lDmpAIuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241348.lDmpAIuh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:2781:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> fs/nfsd/trace.h:1399:13: error: no member named 'i_ino' in 'struct trace_event_raw_nfsd_handle_dir_event'
    1399 |                         __entry->i_ino, show_fsnotify_mask(__entry->mask),
         |                         ~~~~~~~  ^
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
       9 | #define TP_printk(fmt, args...) fmt "\n", args
         |                                           ^~~~
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
      45 |                              PARAMS(print));                   \
         |                                     ^~~~~
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:219:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:2781:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
   fs/nfsd/trace.h:1394:12: error: no member named 'i_ino' in 'struct trace_event_raw_nfsd_handle_dir_event'
    1394 |                 __entry->i_ino = dir ? dir->i_ino : 0;
         |                 ~~~~~~~  ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:435:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:427:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:2781:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
   fs/nfsd/trace.h:1394:12: error: no member named 'i_ino' in 'struct trace_event_raw_nfsd_handle_dir_event'
    1394 |                 __entry->i_ino = dir ? dir->i_ino : 0;
         |                 ~~~~~~~  ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   3 errors generated.


vim +1399 fs/nfsd/trace.h

65294c1f2c5e72 Jeff Layton 2019-08-18  1380  
cc1687d186b054 Jeff Layton 2026-05-22  1381  TRACE_EVENT(nfsd_handle_dir_event,
cc1687d186b054 Jeff Layton 2026-05-22  1382  	TP_PROTO(u32 mask, const struct inode *dir, const struct qstr *name),
cc1687d186b054 Jeff Layton 2026-05-22  1383  	TP_ARGS(mask, dir, name),
cc1687d186b054 Jeff Layton 2026-05-22  1384  	TP_STRUCT__entry(
cc1687d186b054 Jeff Layton 2026-05-22  1385  		__field(u32, mask)
cc1687d186b054 Jeff Layton 2026-05-22  1386  		__field(dev_t, s_dev)
04cc256388df5d Jeff Layton 2026-05-23  1387  		__field(ino_t, u64)
cc1687d186b054 Jeff Layton 2026-05-22  1388  		__string_len(name, name ? name->name : NULL,
cc1687d186b054 Jeff Layton 2026-05-22  1389  				   name ? name->len : 0)
cc1687d186b054 Jeff Layton 2026-05-22  1390  	),
cc1687d186b054 Jeff Layton 2026-05-22  1391  	TP_fast_assign(
cc1687d186b054 Jeff Layton 2026-05-22  1392  		__entry->mask = mask;
cc1687d186b054 Jeff Layton 2026-05-22  1393  		__entry->s_dev = dir ? dir->i_sb->s_dev : 0;
cc1687d186b054 Jeff Layton 2026-05-22  1394  		__entry->i_ino = dir ? dir->i_ino : 0;
cc1687d186b054 Jeff Layton 2026-05-22  1395  		__assign_str(name);
cc1687d186b054 Jeff Layton 2026-05-22  1396  	),
04cc256388df5d Jeff Layton 2026-05-23  1397  	TP_printk("inode=0x%x:0x%x:0x%llx mask=%s name=%s",
cc1687d186b054 Jeff Layton 2026-05-22  1398  			MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
cc1687d186b054 Jeff Layton 2026-05-22 @1399  			__entry->i_ino, show_fsnotify_mask(__entry->mask),
cc1687d186b054 Jeff Layton 2026-05-22  1400  			__get_str(name))
cc1687d186b054 Jeff Layton 2026-05-22  1401  );
cc1687d186b054 Jeff Layton 2026-05-22  1402  

:::::: The code at line 1399 was first introduced by commit
:::::: cc1687d186b0542390badca86c6a87e17c95b378 nfsd: add tracepoint to dir_event handler

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
