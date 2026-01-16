Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85626320A37;
	Fri, 16 Jan 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544985; cv=none; b=JJ7Zgjz/UQviIOhGNwYV5UKsNI+FrIxsTGVziOyBeEFkdUfUKh1BUW5Wjn7moq/7aQF9lZBVZNWVilkk8aRm5dDxqDUDHB67+qpiFbgBlIqisP7sYhBQS3fN8MCASjRZ/apfb0uUiH9sUj54EbG2ieD14oDibqwg8YWEb7klpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544985; c=relaxed/simple;
	bh=oYMZo73cl9wqu4qXJf+lkeCvYASdMDke1F+hbAl4Dm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLwzXX3JWX1RaU9cpVrcGfxXifp0F4isF96MZJom/EfRPb0MB1qpxwXiGEzsfj6xhvpOiYlcd2tCXhz+VuExg11MccITKExOh+bnftunihWD1Xxx6opk2zzEN85bNIco6IqXEWfioFQUMFfZmkVCvKsH/Exe6fF/b+MEtLqamb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiOu1xJa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiOu1xJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544984; x=1800080984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oYMZo73cl9wqu4qXJf+lkeCvYASdMDke1F+hbAl4Dm8=;
  b=hiOu1xJajTGUQ5i1RgG4YSPkfzo5V5ObsYCg8bQZ6zwSPMwuos/MRd15
   ewFdOTEnOdXaUsfkVX4Mb43gAEVgJXZv61NnEn1Fg1mcApT87gWD8PYt+
   fSv4t1TIr7HhMHwO7M6rVirqs1BZpmVjelitS3dM0tsNnjcv3um0iwtqS
   I4X8xj+clZBiy7n6mlmjWSZlW6YsHGlTU773V08r0Pei1FZ9bAep40SlF
   nXp0gAEnNVsO2OU/V9+vILuncyYKEQRfqDF5/O6wRUpDyCR0quchv2MH+
   fRhJSkLkiLngc/h+UdckEuPrAh8XlhnLtW9Y5ilwLc9UiziaArOZFRGqk
   w==;
X-CSE-ConnectionGUID: ySQM+qr/Qs2KoMWQKk3saA==
X-CSE-MsgGUID: KB8LIfSSQFWQUQQYAiGd6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95336416"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="95336416"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:29:43 -0800
X-CSE-ConnectionGUID: 0RU6yg9HRvW/jKl991eJXg==
X-CSE-MsgGUID: cnRYGYkvRLu2IwI15bO38w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205437728"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 22:29:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdL1-00000000KTo-1P9q;
	Fri, 16 Jan 2026 06:29:39 +0000
Date: Fri, 16 Jan 2026 14:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU
 pages for lruvec lock
Message-ID: <202601161444.lDjWS5Wf-lkp@intel.com>
References: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260115]
[cannot apply to akpm-mm/mm-everything brauner-vfs/vfs.all trace/for-next linus/master dennis-percpu/for-next v6.19-rc5 v6.19-rc4 v6.19-rc3 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-remove-dead-code-of-checking-parent-memory-cgroup/20260115-224607
base:   next-20260115
patch link:    https://lore.kernel.org/r/0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601161444.lDjWS5Wf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161444.lDjWS5Wf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161444.lDjWS5Wf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:16:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   include/linux/memcontrol.h:772:14: error: use of undeclared identifier 'lruvec'
     772 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:773:13: error: use of undeclared identifier 'rcu'
     773 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:775:14: error: use of undeclared identifier 'lruvec'
     775 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:776:13: error: use of undeclared identifier 'rcu'
     776 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:779:14: error: use of undeclared identifier 'lruvec'
     779 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:780:13: error: use of undeclared identifier 'rcu'
     780 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
    1507 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
    1515 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
    1523 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
    1532 |         __releases(rcu)
         |                    ^~~
   In file included from kernel/sched/core.c:83:
   In file included from arch/sparc/include/asm/tlb.h:5:
   In file included from arch/sparc/include/asm/tlb_64.h:5:
   include/linux/swap.h:333:14: error: use of undeclared identifier 'rcu'
     333 |                 __releases(rcu)
         |                            ^~~
>> kernel/sched/core.c:7772:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7772 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7747:1: note: array 'preempt_modes' declared here
    7747 | const char *preempt_modes[] = {
         | ^
   1 warning and 11 errors generated.


vim +7772 kernel/sched/core.c

8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7750  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7751  const char *preempt_model_str(void)
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7752  {
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7753  	bool brace = IS_ENABLED(CONFIG_PREEMPT_RT) &&
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7754  		(IS_ENABLED(CONFIG_PREEMPT_DYNAMIC) ||
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7755  		 IS_ENABLED(CONFIG_PREEMPT_LAZY));
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7756  	static char buf[128];
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7757  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7758  	if (IS_ENABLED(CONFIG_PREEMPT_BUILD)) {
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7759  		struct seq_buf s;
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7760  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7761  		seq_buf_init(&s, buf, sizeof(buf));
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7762  		seq_buf_puts(&s, "PREEMPT");
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7763  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7764  		if (IS_ENABLED(CONFIG_PREEMPT_RT))
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7765  			seq_buf_printf(&s, "%sRT%s",
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7766  				       brace ? "_{" : "_",
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7767  				       brace ? "," : "");
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7768  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7769  		if (IS_ENABLED(CONFIG_PREEMPT_DYNAMIC)) {
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7770  			seq_buf_printf(&s, "(%s)%s",
3ebb1b6522392f6 Thomas Weißschuh          2025-06-26  7771  				       preempt_dynamic_mode >= 0 ?
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14 @7772  				       preempt_modes[preempt_dynamic_mode] : "undef",
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7773  				       brace ? "}" : "");
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7774  			return seq_buf_str(&s);
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7775  		}
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7776  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7777  		if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7778  			seq_buf_printf(&s, "LAZY%s",
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7779  				       brace ? "}" : "");
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7780  			return seq_buf_str(&s);
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7781  		}
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7782  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7783  		return seq_buf_str(&s);
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7784  	}
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7785  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7786  	if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BUILD))
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7787  		return "VOLUNTARY";
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7788  
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7789  	return "NONE";
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7790  }
8bdc5daaa01e305 Sebastian Andrzej Siewior 2025-03-14  7791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
