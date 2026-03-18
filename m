Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF581DE3B5;
	Wed, 18 Mar 2026 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773803001; cv=none; b=U6ojXH6t4ebW2RatEaKLlgOfPeoYZqOIfT2SSex1WbdHvVjszbB1aXK6wQn8yfHTv0vP3K520gAMRwITL6hOcGIe+kZzNLj6VJyWDp2fmwPsH8byRxlW3TDWk5eDSXEf/xKGELhr21TmM3Kh1MD2Ao3Rl1s33GKgS4ONRtzqteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773803001; c=relaxed/simple;
	bh=T+PuD/iJCgpgpFBU09fLhlU4G/lWsaPnl7XHVX4n7HQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pr6BgmVwNN95lMBrWCX9CEz4/HDGNtiZDefFgQDNOJ+7CG/oBoUoS+dwye56MRkCugnQSPke99/7oh5+D49BKE3288iQQidsFXCQDM24WNTspzhLgxayY9xkc9Hy+BAdiwAB/g28zRyFN75iMyfuEYbd3xxAd7SfyBH1qTtjG/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNEkPZDK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNEkPZDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773802999; x=1805338999;
  h=date:from:to:cc:subject:message-id;
  bh=T+PuD/iJCgpgpFBU09fLhlU4G/lWsaPnl7XHVX4n7HQ=;
  b=GNEkPZDK/CtQiWcB5n436s4vu9Nt2+ECIV7CLMZuedwQJ4GGO6h04Moy
   GrF/iDjTPAOc9TDwv4gEhD5Q6XS88MsYm2rLVqb0/9PcCpwJ41H29bj5i
   ELG6LzvQRdGVVp6bopEnDkwcwSCj99Fl9JwiB2Z16D85OKxa6VWlHPnEl
   X6o5BlJF5kTchdW7uubLQY8YIv8yOHnB6yMZLNZR1503FxkkbYRcD7g11
   8z/wW0IGZlxUWbOtK0AJW/m0crCU1mTWUyC4z4/AmzpFDspAcY05rM27r
   uEs9OB0sjjGyMYj3TpRCJzxaV6yr9deFSKRGvRahZuR5+HXKSsC0kD6sT
   w==;
X-CSE-ConnectionGUID: DOYlLjc6RbCKQ+tq5kUNhw==
X-CSE-MsgGUID: OmVlOqvlTZ+vCnDLf5sEfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="62415544"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="62415544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 20:03:18 -0700
X-CSE-ConnectionGUID: DHeuI9yTR2C5qwzMthEMEQ==
X-CSE-MsgGUID: DoovEQVXS+i4m+TSJDsWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222440615"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2026 20:03:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2hBh-000000002Or-1uId;
	Wed, 18 Mar 2026 03:03:13 +0000
Date: Wed, 18 Mar 2026 11:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 5/5] include/trace/events/f2fs.h:2657:3:
 warning: format specifies type 'long long' but the argument has type
 'unsigned long'
Message-ID: <202603181033.3cNS58LP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   c85deae607667bb160a277e75324a45879161285
commit: c85deae607667bb160a277e75324a45879161285 [5/5] f2fs: introduce trace_f2fs_map_lock()
config: i386-buildonly-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181033.3cNS58LP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181033.3cNS58LP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181033.3cNS58LP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:41:
   In file included from include/trace/events/f2fs.h:2665:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/f2fs.h:2657:3: warning: format specifies type 'long long' but the argument has type 'unsigned long' [-Wformat]
    2633 |         ),
         |         ~~
    2634 | 
    2635 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
    2636 |                 __entry->dev            = inode->i_sb->s_dev;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2637 |                 __entry->ino            = inode->i_ino;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2638 |                 __entry->index          = index;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2639 |                 __entry->flag           = flag;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2640 |                 __entry->string         = string;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2641 |         ),
         |         ~~
    2642 | 
    2643 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      %lu
    2644 |                 show_dev_ino(__entry),
         |                 ~~~~~~~~~~~~~~~~~~~~~~
    2645 |                 __entry->index,
         |                 ^~~~~~~~~~~~~~~
    2646 |                 __entry->flag,
         |                 ~~~~~~~~~~~~~~
    2647 |                 __entry->string)
         |                 ~~~~~~~~~~~~~~~~
    2648 | );
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
   include/linux/tracepoint.h:140:25: note: expanded from macro 'PARAMS'
     140 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:219:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   1 warning generated.


vim +2657 include/trace/events/f2fs.h

  2634	
  2635		TP_PROTO(struct inode *inode, pgoff_t index, int flag, char *string),
  2636	
  2637		TP_ARGS(inode, index, flag, string),
  2638	
  2639		TP_STRUCT__entry(
  2640			__field(dev_t, dev)
  2641			__field(ino_t, ino)
  2642			__field(pgoff_t, index)
  2643			__field(int, flag)
  2644			__field(char *, string)
  2645		),
  2646	
  2647		TP_fast_assign(
  2648			__entry->dev		= inode->i_sb->s_dev;
  2649			__entry->ino		= inode->i_ino;
  2650			__entry->index		= index;
  2651			__entry->flag		= flag;
  2652			__entry->string		= string;
  2653		),
  2654	
  2655		TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
  2656			show_dev_ino(__entry),
> 2657			__entry->index,
  2658			__entry->flag,
  2659			__entry->string)
  2660	);
  2661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
