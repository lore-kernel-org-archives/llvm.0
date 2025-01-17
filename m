Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A401E1C22;
	Fri, 17 Jan 2025 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737091917; cv=none; b=ZcgKno8FblpVxUD7WQj9i/8PjMG1BJ8xFpc3NcvHEE5tibFO/dqK8tVFKELtaUrT8AUJfSJ8a0sUdXhYiSGyTmDU9UghBYwJMnqFW1SAnFHqgm7ZSyyw/Zz0GwtWAstYNHNllwobPlPESJp8TT8HbzR2uXM6KFJkoRyDKtYXNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737091917; c=relaxed/simple;
	bh=x0KbJApOqcvL/zlnb3n6sDkxuoizuTyMMCoeoZFyZI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8CqMt6XTw6HXnSsYPhPggGI+1VYPr2zVhnhRS1xZjj9r62Ro/deW5U7EznRNJyWjag0O9urRCouDeNQjvyMxF9OxtwFGrOXYo21f0zW+SNRyalzk9KcCnKl3C6J95hUbi+XsRUeMMzb4b8StXLZ2Lt4BBJCAytXa451kFprFWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceWXKS5d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceWXKS5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737091916; x=1768627916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0KbJApOqcvL/zlnb3n6sDkxuoizuTyMMCoeoZFyZI4=;
  b=ceWXKS5daIC0SNb0fBLH827rvt2m/BqZmYIdaVQzIkUD83iDx1E8rlYG
   5oL9r8IKtgrkSX5Y2dnHFm/G/VErYaUl0TjKuy4c3zyOjvsCzpF+lK5dW
   jFlWxqbFYHqHrD9/cE5LpMwhZ4WQ/QacOZPdZyZ9BhailpzBXSTtm7Csw
   BTlQ1ZwaFw10JUcEX9AFS1YORoZgUcvuOJe+oCupQmH0OjRPcaPvfvL/B
   fePy3CfGrZ7Q9YfpbHuPADkRUD0lcp+pugVuUgrnBHoZecf82dlc5yWlD
   BpRbmFgv4MR6NGTaHiXwet0SxIia/YSBMAj5wKMhiE/dL57lFhVC4iSU2
   g==;
X-CSE-ConnectionGUID: mKKDSlzkQPObSqG2+/icyQ==
X-CSE-MsgGUID: CJ8R3zX0STiuOaisFZel7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="40322987"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="40322987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 21:31:53 -0800
X-CSE-ConnectionGUID: Vr1AnNCPRryB1qG1iho4jQ==
X-CSE-MsgGUID: vonOs7/HTs2pCqbpS/flTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110818140"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2025 21:31:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYexR-000SoH-2C;
	Fri, 17 Jan 2025 05:31:49 +0000
Date: Fri, 17 Jan 2025 13:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 32/36] include/linux/unwind_user_types.h:6:10:
 fatal error: 'asm/unwind_user_types.h' file not found
Message-ID: <202501171356.C7tHJLzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   dc92bc7c1009e5d80cd83d21ead7228bc6887c23
commit: 82462df3cdc83217ffda76a7c0a81b38636321d0 [32/36] perf: Add deferred user callchains
config: hexagon-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171356.C7tHJLzT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171356.C7tHJLzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171356.C7tHJLzT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/binfmt_misc.c:23:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/binfmt_misc.c:27:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:65:
   In file included from include/linux/unwind_deferred.h:6:
   In file included from include/linux/unwind_user.h:5:
>> include/linux/unwind_user_types.h:6:10: fatal error: 'asm/unwind_user_types.h' file not found
       6 | #include <asm/unwind_user_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from fs/splice.c:21:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/splice.c:27:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from fs/splice.c:31:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:65:
   In file included from include/linux/unwind_deferred.h:6:
   In file included from include/linux/unwind_user.h:5:
>> include/linux/unwind_user_types.h:6:10: fatal error: 'asm/unwind_user_types.h' file not found
       6 | #include <asm/unwind_user_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +6 include/linux/unwind_user_types.h

62613e4ee5ae23 Josh Poimboeuf 2024-12-21  4  
62613e4ee5ae23 Josh Poimboeuf 2024-12-21  5  #include <linux/types.h>
b839ed46824490 Josh Poimboeuf 2024-12-21 @6  #include <asm/unwind_user_types.h>
62613e4ee5ae23 Josh Poimboeuf 2024-12-21  7  

:::::: The code at line 6 was first introduced by commit
:::::: b839ed46824490a55787cf07b8788a462901b0ac unwind: Add support for userspace compat mode

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
