Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA231632F3;
	Sat, 11 Jan 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590293; cv=none; b=lAnaPWku4Z6j+NYJEZk8Z3mweR1POIGuUUdD4czSTFnITsD+klDfmTHrKY+B6KatNgZQyr5lrbiv/RL74A7S62ml2D24YQYWGN6nCce1qX4yKUF3R42q4TYHBaiG8G+6+UmwLBkf+mjiA3DmNF4jXne80CnOewtPnONYO5lDHkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590293; c=relaxed/simple;
	bh=ISWB2mLK42iOVD+gNQv+Tr9tvjWE9t1s+wUZnQ4tS+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r59A4DOLe8joaA/U7Vw/NAAqBrq7TcN/NQ4lAkWdZbP76/nSmKgmlNzjaTcmlgmy+UwJTVal0sruZEufplOwL8IHciXHBg/5Y4JOCiruNf5KU+xHNZ4JgYfhZEG7vBimlY+GbZ7G/oZp0HdWtIuI/9JpbdCAtGL02M0MqEdVXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxzuZsee; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxzuZsee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736590291; x=1768126291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISWB2mLK42iOVD+gNQv+Tr9tvjWE9t1s+wUZnQ4tS+U=;
  b=LxzuZseeme42LX+zLW2pWfmrg0Y8qLQ3Lrkwi+BNQJ5g6O7Y7wXk9Y/c
   m5Y692rkifGJjV0I4lTTwegex2oHaU98qTZH48s0wcW4KSUIw/dzvUiKY
   jN3rCKOCrV+GD7BQjuEbmh5zhjnsLTz845Kcf/VJriTzgq+F4y+if9dx3
   He1CLdA4ZzEMMqw7MHAv3RD7LvEVJv8HFM0yx4gesWSEvw31hVCqiLRlo
   lz2a8dIumGQuRBfiGqN3C/LILj6HHAB6rS73fvZrGTImXeQejDJqSbKbi
   s7crng9nTqeBj9feaFgc5kU7EKmONsV4kpgpTdjcAaKKti/u10EeNqOUc
   Q==;
X-CSE-ConnectionGUID: dWxWQu47QKmGKPGa6+ynSw==
X-CSE-MsgGUID: gxBDhfJhTQy0/xKRPqVvzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24488182"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="24488182"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:11:31 -0800
X-CSE-ConnectionGUID: 796Yn37bRzeTFdiuL4iOkQ==
X-CSE-MsgGUID: sdmfv2L7SmujnHGwVYlBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108996034"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 02:11:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYSl-000KTP-0f;
	Sat, 11 Jan 2025 10:11:27 +0000
Date: Sat, 11 Jan 2025 18:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Oxana Kharitonova <oxana@cloudflare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH resend] hung_task: add task->flags, blocked by coredump
 to log
Message-ID: <202501111752.UjvzAplN-lkp@intel.com>
References: <20250110160328.64947-1-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110160328.64947-1-oxana@cloudflare.com>

Hi Oxana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/sched/core brauner-vfs/vfs.all linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oxana-Kharitonova/hung_task-add-task-flags-blocked-by-coredump-to-log/20250111-000505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250110160328.64947-1-oxana%40cloudflare.com
patch subject: [PATCH resend] hung_task: add task->flags, blocked by coredump to log
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250111/202501111752.UjvzAplN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111752.UjvzAplN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111752.UjvzAplN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7706:9: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    7704 |         pr_cont(" stack:%-5lu pid:%-5d tgid:%-5d ppid:%-6d task_flags:0x%08lx flags:0x%08lx\n",
         |                                                                         ~~~~~
         |                                                                         %08x
    7705 |                 free, task_pid_nr(p), task_tgid_nr(p),
    7706 |                 ppid, p->flags, read_task_thread_flags(p));
         |                       ^~~~~~~~
   include/linux/printk.h:586:26: note: expanded from macro 'pr_cont'
     586 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   kernel/sched/core.c:3642:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    3642 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5816:20: warning: unused function 'sched_tick_start' [-Wunused-function]
    5816 | static inline void sched_tick_start(int cpu) { }
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:5817:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5817 | static inline void sched_tick_stop(int cpu) { }
         |                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6535:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
    6535 | static inline void sched_core_cpu_starting(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6536:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6536 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6537:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6537 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +7706 kernel/sched/core.c

  7685	
  7686	void sched_show_task(struct task_struct *p)
  7687	{
  7688		unsigned long free;
  7689		int ppid;
  7690	
  7691		if (!try_get_task_stack(p))
  7692			return;
  7693	
  7694		pr_info("task:%-15.15s state:%c", p->comm, task_state_to_char(p));
  7695	
  7696		if (task_is_running(p))
  7697			pr_cont("  running task    ");
  7698		free = stack_not_used(p);
  7699		ppid = 0;
  7700		rcu_read_lock();
  7701		if (pid_alive(p))
  7702			ppid = task_pid_nr(rcu_dereference(p->real_parent));
  7703		rcu_read_unlock();
  7704		pr_cont(" stack:%-5lu pid:%-5d tgid:%-5d ppid:%-6d task_flags:0x%08lx flags:0x%08lx\n",
  7705			free, task_pid_nr(p), task_tgid_nr(p),
> 7706			ppid, p->flags, read_task_thread_flags(p));
  7707	
  7708		print_worker_info(KERN_INFO, p);
  7709		print_stop_info(KERN_INFO, p);
  7710		print_scx_info(KERN_INFO, p);
  7711		show_stack(p, NULL, KERN_INFO);
  7712		put_task_stack(p);
  7713	}
  7714	EXPORT_SYMBOL_GPL(sched_show_task);
  7715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
