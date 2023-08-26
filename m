Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB34BA34;
	Sat, 26 Aug 2023 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693083227; x=1724619227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8v4e3xzweK3QD9FHJAbcqx6mAxB8dUf3nH7Y9DYd6U=;
  b=l6uQs92EvNvmSB1VQXyJJPQMquJIYujzTDJg/sBm6qOBqNu+Ze+En6Qh
   F6ifo+DK6mRwE+CEDz9SrQbMCiXL53onXx+xbPhFv0g9YBBrFZQzIpMdz
   Ig4IB99+2dEJhOmIxkSLNQXXQ2Rgv4uQrbx2kbMICCR5s6XDzNqe9EoiX
   1sx3XHYlTR58deunMyTdaVmW7qMHOMNWm1KjCAgSqQTvdX1m9t/himkEw
   aKHApU/VcD/BfrlnXfWpF4QGJstFDC4NqFgHaM3vQ+4qnDH9WB8G3bVYs
   7w1x5davJHRjlNXx47KwiKAebfk9eOpqDemWN7Iv5L+LG1b4fBXi74G0o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="354422916"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="354422916"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 13:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="737828653"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="737828653"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Aug 2023 13:53:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa0HB-00054J-0A;
	Sat, 26 Aug 2023 20:53:03 +0000
Date: Sun, 27 Aug 2023 04:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/11]
 kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of
 declaration
Message-ID: <202308270422.p5AK6N1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   ee8dbca703c8d81200c2be455c377bab893206c4
commit: ee8dbca703c8d81200c2be455c377bab893206c4 [11/11] kthread: Provide a mechanism to control kthread sched_attr
config: arm-randconfig-001-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270422.p5AK6N1L-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270422.p5AK6N1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270422.p5AK6N1L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
   8 errors generated.
--
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
    1359 |         cd->qthread = kthread_run(qthread_fn, cd, dev_name(dev));
         |                                                   ^
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
>> drivers/staging/fieldbus/anybuss/host.c:1359:44: error: expected ';' at end of declaration
   8 errors generated.


vim +155 kernel/trace/preemptirq_delay_test.c

f96e8577da1026 Joel Fernandes (Google  2018-07-12  146) 
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  147) static int preemptirq_run_test(void)
f96e8577da1026 Joel Fernandes (Google  2018-07-12  148) {
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  149) 	struct task_struct *task;
f96e8577da1026 Joel Fernandes (Google  2018-07-12  150) 	char task_name[50];
f96e8577da1026 Joel Fernandes (Google  2018-07-12  151) 
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  152) 	init_completion(&done);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  153) 
f96e8577da1026 Joel Fernandes (Google  2018-07-12  154) 	snprintf(task_name, sizeof(task_name), "%s_test", test_mode);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06 @155) 	task =  kthread_run(preemptirq_delay_run, NULL, task_name);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  156) 	if (IS_ERR(task))
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  157) 		return PTR_ERR(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  158) 	if (task) {
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  159) 		wait_for_completion(&done);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  160) 		kthread_stop(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  161) 	}
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  162) 	return 0;
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  163) }
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  164) 

:::::: The code at line 155 was first introduced by commit
:::::: d16a8c31077e75ecb9427fbfea59b74eed00f698 tracing: Wait for preempt irq delay thread to finish

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
