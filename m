Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D115C9;
	Sat, 25 May 2024 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716604766; cv=none; b=XVppyj0q3zWl6qjBa3ijGHLS8Y8a0Wec4znzvanduTeCakSTCF7ADOGw/Fzb/YnmkFet3EGKjH3JWRaKskOKo9a1XHHr5D56csDP2LIeHUdDYEtV9y2MMDtgk09H+ZTC2MH7Pumiwq18dYCkSZMCAEVRDSWv/6NVBAtAh9+1ZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716604766; c=relaxed/simple;
	bh=iuqX6BdRUTDa0FjlTIl7ac0cMbwDA2wZzH+x3PjT4Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHQVPcOF8VOjqF9bFsGfWMx5kPUaH3qrg4vWKK7xu2qgA3xM3/rZQXoLI0azuzYRCaU3XsZ/HsJwy0XYLz6B3JGvnGyfYGG1ubOMk5SPIhylScNyUGop1jJ0Z77tOnN++yvXtqC1NNPyYWlcpQn0kjX3d642nNbDYtQSRilZkGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miwSA8ZP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miwSA8ZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716604764; x=1748140764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuqX6BdRUTDa0FjlTIl7ac0cMbwDA2wZzH+x3PjT4Qs=;
  b=miwSA8ZPDukxtv2SPrumkJN9qaZCKJM51IGD+6Yakw6awnWUtk1cjnb8
   rjN6ugs1RFnN4H/12r4v2WeUyRoYvWv/+4zpi1ubaMNPLu0lsjQM2HF7e
   PC6fv05jEVPpWMLieV3A8Ww9GZAMlW2vXtbQIi9v8JhSFQrskSuAena6d
   +k+ySuHdxWSO74ahrTl2TrewF0VYV8RrbW45FwSkIq/E0EeC8jGDHFkfB
   1KPxjEHYd5RgPuCDFaJg8xjpXyu9vfsBL1KByVBUcmH0IzE2GCPLCjAE5
   RN4eHrHEmfX8fODt0vgZKG1XFwQ8jozsFJhYx0uoWD70tZMkv6l2KwpmT
   g==;
X-CSE-ConnectionGUID: iaWm3qDTQwin6P71Vn5+nw==
X-CSE-MsgGUID: DI9IRxL7QLOoNa3aDCShZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23599098"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="23599098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 19:39:21 -0700
X-CSE-ConnectionGUID: ZaOClT0DQjKoZtE+9QRbBg==
X-CSE-MsgGUID: cBlV+JG/T/ShkCBbWG/c3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="39053539"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2024 19:39:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAhJV-0006Np-1a;
	Sat, 25 May 2024 02:39:17 +0000
Date: Sat, 25 May 2024 10:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] kernel/fork.c:2815:9: warning:
 incompatible integer to pointer conversion assigning to 'int *' from 'int'
Message-ID: <202405251037.WDBJpiSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 745009dc796e56fc87e911138d801679ecd3576e [2/2] test
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240525/202405251037.WDBJpiSc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251037.WDBJpiSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251037.WDBJpiSc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c:2815:11: error: implicit declaration of function 'klp_shadow_get_or_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
                    ^
>> kernel/fork.c:2815:9: warning: incompatible integer to pointer conversion assigning to 'int *' from 'int' [-Wint-conversion]
           newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   fs/proc/array.c:408:11: error: implicit declaration of function 'klp_shadow_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           newpid = klp_shadow_get(p, 0);
                    ^
>> fs/proc/array.c:408:9: warning: incompatible integer to pointer conversion assigning to 'int *' from 'int' [-Wint-conversion]
           newpid = klp_shadow_get(p, 0);
                  ^ ~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +2815 kernel/fork.c

  2756	
  2757	/*
  2758	 *  Ok, this is the main fork-routine.
  2759	 *
  2760	 * It copies the process, and if successful kick-starts
  2761	 * it and waits for it to finish using the VM if required.
  2762	 *
  2763	 * args->exit_signal is expected to be checked for sanity by the caller.
  2764	 */
  2765	#include <linux/livepatch.h>
  2766	pid_t kernel_clone(struct kernel_clone_args *args)
  2767	{
  2768		u64 clone_flags = args->flags;
  2769		struct completion vfork;
  2770		struct pid *pid;
  2771		struct task_struct *p;
  2772		int trace = 0;
  2773		pid_t nr;
  2774		int *newpid;
  2775		static int ctr = 0;
  2776	
  2777		/*
  2778		 * For legacy clone() calls, CLONE_PIDFD uses the parent_tid argument
  2779		 * to return the pidfd. Hence, CLONE_PIDFD and CLONE_PARENT_SETTID are
  2780		 * mutually exclusive. With clone3() CLONE_PIDFD has grown a separate
  2781		 * field in struct clone_args and it still doesn't make sense to have
  2782		 * them both point at the same memory location. Performing this check
  2783		 * here has the advantage that we don't need to have a separate helper
  2784		 * to check for legacy clone().
  2785		 */
  2786		if ((clone_flags & CLONE_PIDFD) &&
  2787		    (clone_flags & CLONE_PARENT_SETTID) &&
  2788		    (args->pidfd == args->parent_tid))
  2789			return -EINVAL;
  2790	
  2791		/*
  2792		 * Determine whether and which event to report to ptracer.  When
  2793		 * called from kernel_thread or CLONE_UNTRACED is explicitly
  2794		 * requested, no event is reported; otherwise, report if the event
  2795		 * for the type of forking is enabled.
  2796		 */
  2797		if (!(clone_flags & CLONE_UNTRACED)) {
  2798			if (clone_flags & CLONE_VFORK)
  2799				trace = PTRACE_EVENT_VFORK;
  2800			else if (args->exit_signal != SIGCHLD)
  2801				trace = PTRACE_EVENT_CLONE;
  2802			else
  2803				trace = PTRACE_EVENT_FORK;
  2804	
  2805			if (likely(!ptrace_event_enabled(current, trace)))
  2806				trace = 0;
  2807		}
  2808	
  2809		p = copy_process(NULL, trace, NUMA_NO_NODE, args);
  2810		add_latent_entropy();
  2811	
  2812		if (IS_ERR(p))
  2813			return PTR_ERR(p);
  2814	
> 2815		newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
  2816						 NULL, NULL);
  2817		if (newpid)
  2818			*newpid = ctr++;
  2819	
  2820		/*
  2821		 * Do this prior waking up the new thread - the thread pointer
  2822		 * might get invalid after that point, if the thread exits quickly.
  2823		 */
  2824		trace_sched_process_fork(current, p);
  2825	
  2826		pid = get_task_pid(p, PIDTYPE_PID);
  2827		nr = pid_vnr(pid);
  2828	
  2829		if (clone_flags & CLONE_PARENT_SETTID)
  2830			put_user(nr, args->parent_tid);
  2831	
  2832		if (clone_flags & CLONE_VFORK) {
  2833			p->vfork_done = &vfork;
  2834			init_completion(&vfork);
  2835			get_task_struct(p);
  2836		}
  2837	
  2838		if (IS_ENABLED(CONFIG_LRU_GEN_WALKS_MMU) && !(clone_flags & CLONE_VM)) {
  2839			/* lock the task to synchronize with memcg migration */
  2840			task_lock(p);
  2841			lru_gen_add_mm(p->mm);
  2842			task_unlock(p);
  2843		}
  2844	
  2845		wake_up_new_task(p);
  2846	
  2847		/* forking complete and child started to run, tell ptracer */
  2848		if (unlikely(trace))
  2849			ptrace_event_pid(trace, pid);
  2850	
  2851		if (clone_flags & CLONE_VFORK) {
  2852			if (!wait_for_vfork_done(p, &vfork))
  2853				ptrace_event_pid(PTRACE_EVENT_VFORK_DONE, pid);
  2854		}
  2855	
  2856		put_pid(pid);
  2857		return nr;
  2858	}
  2859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
