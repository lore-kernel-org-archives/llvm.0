Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3C2701CC;
	Mon, 13 Oct 2025 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358444; cv=none; b=Xb6ZJwkaFXoL8C+JBkp2jIycFRNj3s2qzH/0yFZ6prah66oxfhwee1yYh96UzYAIgoBS5GF8IXYpjwwT0T9V582I+mvkSC5DsNO8VXiMpinXY+dORnq0UHPM1MoSCKXX8w9Wxf6aTJfDF3EJnL2/rYTOHMhfkzgxi3ONunVHwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358444; c=relaxed/simple;
	bh=f4i4kgLx91USSgrSS+pKbeuayuqHZ1/EVFNhJN42mTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Els44ttCk9KaRgoA4uQmToJBp4HzxrrNDU28J29nlN4vclObekn8w6DpJ2we2IM5a04/UT1ZBg4Sqi6lzScNWeuRCFLhmvLj+ik0nv0iXh/7VAAp0JnrK0HWqJ/5CvxzAZfq/9Gkq9Waw36OQoenY/QRg4nCvmOimcfOi0qKFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jH8JgKlV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jH8JgKlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358442; x=1791894442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4i4kgLx91USSgrSS+pKbeuayuqHZ1/EVFNhJN42mTo=;
  b=jH8JgKlVN4uTHVpptP61qwZ71l36FevVR7w2KZAATsWtKuWnbzttKf+2
   NRkknMq0enjLnRCpr0cqhpEQD3X1v50eFsbEhXmyYf4tyu/E2WLKVg9Qr
   bXnAgPSegNPxq4Uap9fyjyx4uHaJUXOmMN6719iu1rlRO2Ha+aKCrY8Tg
   r5UNK4vrkDMkG43lVuUsj/I4rAmHS3xuGD97eI3M634crEQdGIPavQ0lV
   CW5RG7+2gk4oQQrwAL6EmGNrbOXPOb+oL7N+v+KfhUgy+jORLcRdNN6iH
   eKbDj1+Fj1zRZePuzHG4RH860xvXX4NRvTNhmC7kKVpO855yG03dBpSXr
   g==;
X-CSE-ConnectionGUID: G3zSds2GQXCmEDBm3MM+Ag==
X-CSE-MsgGUID: svFYz3TYTU6HZoCfpyc+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62384054"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62384054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:20 -0700
X-CSE-ConnectionGUID: fUuFLJ/rR8yuqYYPloprWA==
X-CSE-MsgGUID: 5HTn8yBETQSvZqI00J2xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="185849826"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008sO-2JIM;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:47 +0200
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:faultable-syscalls 6/10] kernel/trace/trace.c:11430:32:
 error: use of undeclared identifier 'CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT'
Message-ID: <202510120515.CJNYu2FQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace faultable-syscalls
head:   66d20821bfc64b78f00866e06d9b297c9c616413
commit: 6834549be2989daee79e249f4cd481ea0b657dc7 [6/10] tracing: Add syscall_user_buf_size to limit amount written
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251012/202510120515.CJNYu2FQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120515.CJNYu2FQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120515.CJNYu2FQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:11430:32: error: use of undeclared identifier 'CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT'
    11430 |         global_trace.syscall_buf_sz = CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT;
          |                                       ^
   1 error generated.


vim +/CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT +11430 kernel/trace/trace.c

 11412	
 11413		init_trace_flags_index(&global_trace);
 11414	
 11415		register_tracer(&nop_trace);
 11416	
 11417		/* Function tracing may start here (via kernel command line) */
 11418		init_function_trace();
 11419	
 11420		/* All seems OK, enable tracing */
 11421		tracing_disabled = 0;
 11422	
 11423		atomic_notifier_chain_register(&panic_notifier_list,
 11424					       &trace_panic_notifier);
 11425	
 11426		register_die_notifier(&trace_die_notifier);
 11427	
 11428		global_trace.flags = TRACE_ARRAY_FL_GLOBAL;
 11429	
 11430		global_trace.syscall_buf_sz = CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT;
 11431	
 11432		INIT_LIST_HEAD(&global_trace.systems);
 11433		INIT_LIST_HEAD(&global_trace.events);
 11434		INIT_LIST_HEAD(&global_trace.hist_vars);
 11435		INIT_LIST_HEAD(&global_trace.err_log);
 11436		list_add(&global_trace.marker_list, &marker_copies);
 11437		list_add(&global_trace.list, &ftrace_trace_arrays);
 11438	
 11439		apply_trace_boot_options();
 11440	
 11441		register_snapshot_cmd();
 11442	
 11443		return 0;
 11444	
 11445	out_free_pipe_cpumask:
 11446		free_cpumask_var(global_trace.pipe_cpumask);
 11447	out_free_savedcmd:
 11448		trace_free_saved_cmdlines_buffer();
 11449	out_free_temp_buffer:
 11450		ring_buffer_free(temp_buffer);
 11451	out_rm_hp_state:
 11452		cpuhp_remove_multi_state(CPUHP_TRACE_RB_PREPARE);
 11453	out_free_cpumask:
 11454		free_cpumask_var(global_trace.tracing_cpumask);
 11455	out_free_buffer_mask:
 11456		free_cpumask_var(tracing_buffer_mask);
 11457		return ret;
 11458	}
 11459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
