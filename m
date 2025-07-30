Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF29A92E;
	Wed, 30 Jul 2025 00:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753835436; cv=none; b=bbSrp+6zuWDcyy4+idRdYqLXYzk9oy0gmZRzDowyUFwd7MIiDnaX8BXVPCkTG+t0ZceLCZd5nxSAMTH2+yKTQ/nUXJZ3pUbHa1RTbbcj1ex7cEUE6X06MBjmdG5iaX4oPltTXU/a03F2xPZqVwrDRvZC61yudxwJyr9v0zEK/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753835436; c=relaxed/simple;
	bh=JUpM6k3V3ApluVvc1ONxMzfk4GZiTa5iBdmLsA/JRyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEgr60b7VOpu5jILiJwSPHEwDeY/J7lF6KBOUK42Agz7xCTtemu9Og77sy9pbdqnrOVk/E7OpFVti5ir+P2RKJcAbYTfRHp3RqF1yMz2+RUKFiXwcRT3Di7KndsMZWR3Fvdgn9HKXyJ5Sm2SPH5nGNZaU0csKnMM3NgmnbE/R6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SklNPCn+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SklNPCn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753835434; x=1785371434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JUpM6k3V3ApluVvc1ONxMzfk4GZiTa5iBdmLsA/JRyM=;
  b=SklNPCn+E/JTL+Ok+QF4+LM7NUhUDOwJns2ZFqNBoPGNEUT6qDVroyPj
   oYNcGbO78kKLAd4Yen6Pgiez7Msg7cZPXGKY5pT8dpq2dmKUKYo/a19M3
   sxJB4B4NewA++1GOJ1YqNVG6Z7uekzj8CGoR/uJT8WaCnASioXtfvul1p
   zoyZiS92q2oLbYU8nEBRuV2rs6j74oG1rSuJPYFTUBkQQ+unMWq7HGc4Q
   G5MgaI8VbJ2O5iso5JmGYpX6uBif4AA1sAmCBNQJb/1CFzWJOZ6gKgmh/
   mhyrfOBRYPneBUvr5Lsa9jS7wfjGo07JPSKgW1dVBa05fT+Mr7vZy+B9r
   g==;
X-CSE-ConnectionGUID: 9fkfmqS5QHieiF0+1zNngA==
X-CSE-MsgGUID: 3R0ecQ5bRnyxVOeQ1juNAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56061015"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56061015"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 17:30:33 -0700
X-CSE-ConnectionGUID: 5d3X3a88ROqORfSDMrBHOw==
X-CSE-MsgGUID: Y1Gj32wiR26yrWXbwbwRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="200022132"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2025 17:30:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uguiD-0001nv-2o;
	Wed, 30 Jul 2025 00:30:29 +0000
Date: Wed, 30 Jul 2025 08:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 03/10] ftrace: Add unregister_ftrace_direct_hash function
Message-ID: <202507300838.AgG0zE7b-lkp@intel.com>
References: <20250729102813.1531457-4-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729102813.1531457-4-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on bpf-next/net bpf-next/master bpf/master linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-Make-alloc_and_copy_ftrace_hash-direct-friendly/20250729-183143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250729102813.1531457-4-jolsa%40kernel.org
patch subject: [RFC 03/10] ftrace: Add unregister_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-003-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300838.AgG0zE7b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300838.AgG0zE7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300838.AgG0zE7b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/events/callchain.c:11:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   2 warnings generated.
--
   In file included from kernel/events/core.c:34:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   kernel/events/core.c:215:20: warning: unused function 'class_perf_ctx_lock_destructor' [-Wunused-function]
     215 | static inline void class_perf_ctx_lock_destructor(class_perf_ctx_lock_t *_T)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:219:1: warning: unused function 'class_perf_ctx_lock_constructor' [-Wunused-function]
     219 | class_perf_ctx_lock_constructor(struct perf_cpu_context *cpuctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/unregister_ftrace_direct_hash +563 include/linux/ftrace.h

   557	
 > 558	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   559	{
   560		return -ENODEV;
   561	}
   562	
 > 563	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
