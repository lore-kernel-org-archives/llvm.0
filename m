Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6530D40C;
	Sat,  1 Aug 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785577385; cv=none; b=e7N57QPhaQfPPK/r2JC6cJvmEf1nK2B4UTO3iGiOK5HfLbWfUFgitvjMDDWPDw2IUaVi2hnWJJCzekEHoKhmLXTdvVsVDN47uMGUYJvU+sgsprNVWzpuOvjk89geUjOyk1OVQ9EuoCcPpLfvxVorLKzr4weqPps7zcP5tiYP3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785577385; c=relaxed/simple;
	bh=+Xvf6igBQ8GaBD5ci323lpeKwR7B9Ao7dcW/eUIfU3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ryaQyuNu/TzB5ILnMuv1s0oxYKQztvnQdlAoUr5PjXmqeJixwbrjGuzsg4ES5Ty0iX+lKmhHWeqmjDH2iCbpHki6gQNyb3P+JjqvjT69aWUohCQgMuGSpid/VgI6UyNPg2OJFiFvh+43iQ5h9l6z8UCRtepMnRRNgollMW2NSp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFPJRJTB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFPJRJTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785577383; x=1817113383;
  h=date:from:to:cc:subject:message-id;
  bh=+Xvf6igBQ8GaBD5ci323lpeKwR7B9Ao7dcW/eUIfU3E=;
  b=RFPJRJTBxgdTYwLM4T8twAYCTsMa1cVhS2ayvd2dxEPwk8+uiyeokCgU
   4xzfqGOQ/O5PYNQpsIriLeeYWiK1+4Cr+hSro8G7Gwp+8ideBYPy0ADTb
   tvsiwHoKRqx753x3EBvFBKHurGwuEpuewYzG6shrtmPTkAMhI+nfr3q+B
   mNt4KvLHDhn94G0oEu0sNaSQME/MF6P4C8dnEyKsCCEI+lbcEwqUT9lq7
   gosj7xgyVo6qzWBjq52LlCzpD+ushQN00uBJ9ywrlY23nFGODFatq7EJs
   5RhBf3NUTCRc8K6vKfrigAHQLK5d2fMOsq7XLP9RB1WyxrSe+GQj0cV3C
   g==;
X-CSE-ConnectionGUID: A+TdTx3qSUeI+4zxCQJ2Wg==
X-CSE-MsgGUID: 5Z82rGnXSh+E5+fK5N1Hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86395124"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86395124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 02:42:57 -0700
X-CSE-ConnectionGUID: 91rLRuCCS4u3WZ7nR6L/lg==
X-CSE-MsgGUID: oT/1ysHNQc2fpkatXl3Qog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="260215071"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 02:42:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq6F4-0000000037F-1118;
	Sat, 01 Aug 2026 09:42:54 +0000
Date: Sat, 01 Aug 2026 17:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 11/17]
 kernel/trace/ftrace.c:8628:3: warning: implicit conversion from 'unsigned
 long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615
 to 4294967295
Message-ID: <202608011724.JXBk8TD5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   f14d3c444eacd9a722e55ff59e30cce2b1ac8985
commit: 55cddf3387a963a59fa5f7e0df28d64fc2d8aa51 [11/17] arm64: percpu: Implement preemptible read/write ops
config: arm64-randconfig-002-20260801 (https://download.01.org/0day-ci/archive/20260801/202608011724.JXBk8TD5-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011724.JXBk8TD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011724.JXBk8TD5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ftrace.c:8628:3: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8629 |                                FTRACE_PID_IGNORE);
         |                                ~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:34: note: expanded from macro 'this_cpu_write'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:371:11: note: expanded from macro '__pcpu_size_call'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:66:1: note: expanded from here
      66 | this_cpu_write_4
         | ^
   arch/arm64/include/asm/percpu.h:282:36: note: expanded from macro 'this_cpu_write_4'
     282 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/percpu.h:260:13: note: expanded from macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |         ~~         ^~~~~~~~~~~
   kernel/trace/ftrace.c:8898:3: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8899 |                                FTRACE_PID_IGNORE);
         |                                ~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:34: note: expanded from macro 'this_cpu_write'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:371:11: note: expanded from macro '__pcpu_size_call'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:154:1: note: expanded from here
     154 | this_cpu_write_4
         | ^
   arch/arm64/include/asm/percpu.h:282:36: note: expanded from macro 'this_cpu_write_4'
     282 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/percpu.h:260:13: note: expanded from macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |         ~~         ^~~~~~~~~~~
   2 warnings generated.


vim +8628 kernel/trace/ftrace.c

87354059881ce9 Steven Rostedt (Red Hat  2014-07-22  8613) 
345ddcc882d889 Steven Rostedt (Red Hat  2016-04-22  8614) static void
345ddcc882d889 Steven Rostedt (Red Hat  2016-04-22  8615) ftrace_filter_pid_sched_switch_probe(void *data, bool preempt,
fa2c3254d7cfff Valentin Schneider       2022-01-20  8616  				     struct task_struct *prev,
9c2136be0878c8 Delyan Kratunov          2022-05-11  8617  				     struct task_struct *next,
9c2136be0878c8 Delyan Kratunov          2022-05-11  8618  				     unsigned int prev_state)
978f3a45d9499c Steven Rostedt           2008-12-04  8619  {
345ddcc882d889 Steven Rostedt (Red Hat  2016-04-22  8620) 	struct trace_array *tr = data;
345ddcc882d889 Steven Rostedt (Red Hat  2016-04-22  8621) 	struct trace_pid_list *pid_list;
b3b1e6ededa433 Steven Rostedt (VMware   2020-03-19  8622) 	struct trace_pid_list *no_pid_list;
978f3a45d9499c Steven Rostedt           2008-12-04  8623  
345ddcc882d889 Steven Rostedt (Red Hat  2016-04-22  8624) 	pid_list = rcu_dereference_sched(tr->function_pids);
b3b1e6ededa433 Steven Rostedt (VMware   2020-03-19  8625) 	no_pid_list = rcu_dereference_sched(tr->function_no_pids);
978f3a45d9499c Steven Rostedt           2008-12-04  8626  
b3b1e6ededa433 Steven Rostedt (VMware   2020-03-19  8627) 	if (trace_ignore_this_task(pid_list, no_pid_list, next))
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09 @8628) 		this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
717e3f5ebc823e Steven Rostedt (VMware   2020-03-19  8629) 			       FTRACE_PID_IGNORE);
717e3f5ebc823e Steven Rostedt (VMware   2020-03-19  8630) 	else
717e3f5ebc823e Steven Rostedt (VMware   2020-03-19  8631) 		this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
717e3f5ebc823e Steven Rostedt (VMware   2020-03-19  8632) 			       next->pid);
978f3a45d9499c Steven Rostedt           2008-12-04  8633  }
978f3a45d9499c Steven Rostedt           2008-12-04  8634  

:::::: The code at line 8628 was first introduced by commit
:::::: 1c5eb4481e0151d579f738175497f998840f7bbc tracing: Rename trace_buffer to array_buffer

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
