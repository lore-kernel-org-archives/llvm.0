Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724744D8D8E;
	Mon, 11 May 2026 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534419; cv=none; b=GMkZ19AzRTwKrpra/ydb/Lz8Cm5aUwKDWLbT6eIiastK6enrJk+Rg7/iSbnnB7KJrr9Ro6fvVJS6ogqp3UzX80ABZYmO8gU1XTjHZhATXSYaUOHgLo8A0ZzCdHQ9BtWSd6Eat5dpw3htnGHFYAdrjXFnivv68TwwY045wrGonkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534419; c=relaxed/simple;
	bh=jEtbJMYnoWpDeqvpXCwko4/lyiMveC6sVp7QWkat4qc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uE+hzDbPmQ3hVW4sTaQwyqaUVKk7LFj/0p5WVU18KfH22VlLKnipO38J3H3ek/MTskJjNGXoh+r5GPzsitltiSNL+DzcJiJCQQGUo2ZJ7F2plYyLwA+I/Kz0SoZ0yhPr54C624yHIP7btlkJJs5dIf3qOf6EX5ieidc2rwufld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGd97AHu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGd97AHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778534416; x=1810070416;
  h=date:from:to:cc:subject:message-id;
  bh=jEtbJMYnoWpDeqvpXCwko4/lyiMveC6sVp7QWkat4qc=;
  b=jGd97AHuy5paO0H7DfKSNrFqTagL6Hge7KhhZchb1OYQ0Iiit7Giqfte
   uWrqourg0w/hjkYyNYgkS3BkaMnYKSzjwBWLVGzKwC2fxmCz0Hn648B2x
   fJqH6/rUDIsWt44RqExtIoSXPQxIaiqahYz0PLg6XRbRGPtfXXOKTPHa2
   2iE+nrUUEsHlEYBoIakKwvjCoFU5KOFUsgILphp0Ibn02gKGaPFoLdoNT
   rykuSleEde7fUlCSPSbfHRj/oPhT+r4XjJ0S2WgIxrDeR7m/hY+PRpxsI
   VMHgM00zvT7N5M5jsfCGGHmNmxAO1/45++HyKONmAXQYLhSUXV2EPhqwR
   Q==;
X-CSE-ConnectionGUID: y6MmgxOORA+Izm/M+LLsUQ==
X-CSE-MsgGUID: 27LmSehNQPanNRchI+5Agw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83049241"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83049241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 14:20:15 -0700
X-CSE-ConnectionGUID: QzGgs6u/RQauV4eghYWqdw==
X-CSE-MsgGUID: P8jZZHJ6QkGNTiFaL3ve/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237663270"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2026 14:20:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMY2t-00000000833-3tQG;
	Mon, 11 May 2026 21:20:11 +0000
Date: Mon, 11 May 2026 23:19:58 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 6/12]
 include/trace/events/f2fs.h:2669:3: warning: format specifies type 'unsigned
 long' but the argument has type 'unsigned long long'
Message-ID: <202605112338.ugeto5En-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   3fc276f79bae89d43863f797bc4ca48965917be8
commit: ca5a91e342cd920d4857741392251ebfb4f235b6 [6/12] f2fs: introduce trace_f2fs_map_lock()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260511/202605112338.ugeto5En-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112338.ugeto5En-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112338.ugeto5En-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2678:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/f2fs.h:2669:3: warning: format specifies type 'unsigned long' but the argument has type 'unsigned long long' [-Wformat]
    2646 |         ),
         |         ~~
    2647 | 
    2648 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
    2649 |                 __entry->dev            = inode->i_sb->s_dev;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2650 |                 __entry->ino            = inode->i_ino;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2651 |                 __entry->index          = index;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2652 |                 __entry->flag           = flag;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2653 |                 __entry->string         = string;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2654 |         ),
         |         ~~
    2655 | 
    2656 |         TP_printk("dev = (%d,%d), ino = %lu, index = %ld, flag = %d, %s",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         %llu
    2657 |                 show_dev_ino(__entry),
         |                 ^~~~~~~~~~~~~~~~~~~~~~
    2658 |                 __entry->index,
         |                 ~~~~~~~~~~~~~~~
    2659 |                 __entry->flag,
         |                 ~~~~~~~~~~~~~~
    2660 |                 __entry->string)
         |                 ~~~~~~~~~~~~~~~~
    2661 | );
         | ~
   include/trace/events/f2fs.h:12:51: note: expanded from macro 'show_dev_ino'
      12 | #define show_dev_ino(entry)     show_dev(entry->dev), (unsigned long long)entry->ino
         |                                                       ^
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
   include/linux/tracepoint.h:160:25: note: expanded from macro 'PARAMS'
     160 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:219:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   1 warning generated.


vim +2669 include/trace/events/f2fs.h

  2647	
  2648		TP_PROTO(struct inode *inode, pgoff_t index, int flag, char *string),
  2649	
  2650		TP_ARGS(inode, index, flag, string),
  2651	
  2652		TP_STRUCT__entry(
  2653			__field(dev_t, dev)
  2654			__field(ino_t, ino)
  2655			__field(pgoff_t, index)
  2656			__field(int, flag)
  2657			__field(char *, string)
  2658		),
  2659	
  2660		TP_fast_assign(
  2661			__entry->dev		= inode->i_sb->s_dev;
  2662			__entry->ino		= inode->i_ino;
  2663			__entry->index		= index;
  2664			__entry->flag		= flag;
  2665			__entry->string		= string;
  2666		),
  2667	
  2668		TP_printk("dev = (%d,%d), ino = %lu, index = %ld, flag = %d, %s",
> 2669			show_dev_ino(__entry),
  2670			__entry->index,
  2671			__entry->flag,
  2672			__entry->string)
  2673	);
  2674	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
