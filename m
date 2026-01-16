Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32F2EB860;
	Fri, 16 Jan 2026 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596926; cv=none; b=mhtW2DFB20yNXwA9hjyjhZH9V0WqMONU3hQA1FVCPNbNCsZdjfdkb3mynY5T4Un09fVbknn4hiWDifj2aFluFQWN7vkUbeYr5W6V+hjuMQ4qqLW+OA533u9Fwi3xzKlujWGrRb31migGhG+A0MsN/Pz0eW6/0a7Sa+9NXAYCdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596926; c=relaxed/simple;
	bh=oUsj61TPPR2qhw8TophZShlUQW0pZ04zsPFDafOjCmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lUOcGe/f1xyF1UfgIppw1NXwPIB1mJKuln6p/0rxm0r0wjPuByrG8dqXh78xA+tLCupeNyqPRSC6/a72DR5mzmZFoctKD+E6shPuoBTlc6hzs6U12YpGLiIoA2QInqyI8pn9fbZjBL5aqgC3spWbX7SRRQcrxgRYtCgvWCYpb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbgUeZhJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbgUeZhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768596925; x=1800132925;
  h=date:from:to:cc:subject:message-id;
  bh=oUsj61TPPR2qhw8TophZShlUQW0pZ04zsPFDafOjCmA=;
  b=JbgUeZhJLdxy5SNih2PNAhH4CZeDKfmR1WaakZYMp2kUtg2RJQbm0k5p
   BiYRhZDiSH0l7REq0Lav3Hxu6kdzYhq4HG1JBKuW7LeQSO/U196O7N0Xp
   nO9aQkO5hlCxu0VrguJ4NLbVBPvp10Gs8VyP8JZQAee4y0jIASNahyUB9
   lApiZWncpEJGJ8TuDjm+wC3nxYZGkCl0tbOqcSkp4Um33ImocZbe92yDF
   uhC89383PSHHLmzqfV6n5VeM+7UWMS2QSurY7dFm8paxk3m1WiFMbt/Ry
   xHAA+S0rlfh+io2rppYbWZpphpBEXBOxTInYOMZ5IUw+Jf/4kWK0o0uPy
   w==;
X-CSE-ConnectionGUID: TaKemvf4SE6pPpsyNc6v8g==
X-CSE-MsgGUID: 64RD0NEKQc21UF+zZl5TCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87490333"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87490333"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:55:22 -0800
X-CSE-ConnectionGUID: YKVKRrUNTXCKAoGu+xzNJg==
X-CSE-MsgGUID: hEBWOpWYTI2dDLhNtvtKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236024686"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 12:55:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgqqj-00000000LFE-3Jof;
	Fri, 16 Jan 2026 20:55:17 +0000
Date: Sat, 17 Jan 2026 04:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 6/6] include/trace/events/f2fs.h:2600:3:
 warning: format specifies type 'long long' but the argument has type
 'unsigned long'
Message-ID: <202601170448.57ndwsSr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   79db93f970fef44c4e01ed7a3d247ed65375a3ab
commit: 79db93f970fef44c4e01ed7a3d247ed65375a3ab [6/6] f2fs: trace_f2fs_map_lock()
config: arm-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170448.57ndwsSr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170448.57ndwsSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170448.57ndwsSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:41:
   In file included from include/trace/events/f2fs.h:2608:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/f2fs.h:2600:3: warning: format specifies type 'long long' but the argument has type 'unsigned long' [-Wformat]
    2576 |         ),
         |         ~~
    2577 | 
    2578 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
    2579 |                 __entry->dev            = inode->i_sb->s_dev;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2580 |                 __entry->ino            = inode->i_ino;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2581 |                 __entry->index          = index;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2582 |                 __entry->flag           = flag;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2583 |                 __entry->string         = string;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2584 |         ),
         |         ~~
    2585 | 
    2586 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      %lu
    2587 |                 show_dev_ino(__entry),
         |                 ~~~~~~~~~~~~~~~~~~~~~~
    2588 |                 __entry->index,
         |                 ^~~~~~~~~~~~~~~
    2589 |                 __entry->flag,
         |                 ~~~~~~~~~~~~~~
    2590 |                 __entry->string)
         |                 ~~~~~~~~~~~~~~~~
    2591 | );
         | ~
   include/trace/stages/stage3_trace_output.h:6:17: note: expanded from macro '__entry'
       6 | #define __entry field
         |                 ^
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
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:219:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   1 warning generated.


vim +2600 include/trace/events/f2fs.h

  2577	
  2578		TP_PROTO(struct inode *inode, pgoff_t index, int flag, char *string),
  2579	
  2580		TP_ARGS(inode, index, flag, string),
  2581	
  2582		TP_STRUCT__entry(
  2583			__field(dev_t, dev)
  2584			__field(ino_t, ino)
  2585			__field(pgoff_t, index)
  2586			__field(int, flag)
  2587			__field(char *, string)
  2588		),
  2589	
  2590		TP_fast_assign(
  2591			__entry->dev		= inode->i_sb->s_dev;
  2592			__entry->ino		= inode->i_ino;
  2593			__entry->index		= index;
  2594			__entry->flag		= flag;
  2595			__entry->string		= string;
  2596		),
  2597	
  2598		TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
  2599			show_dev_ino(__entry),
> 2600			__entry->index,
  2601			__entry->flag,
  2602			__entry->string)
  2603	);
  2604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
