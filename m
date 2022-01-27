Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD296168
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643269309; x=1674805309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q+YYg765jhbrMqorIDPszNldXSyDLG9au7ISD3M6E9w=;
  b=f4FpJPkQQMrATyxoEZq7f0hdAk6OWrJOFyvL9jG/13CexGRKahcq/szp
   67KQIwQr8Gj0jU0MM+02++l4JmHnIGzI5EsjggmShlZW+7RTUAy+eEbju
   Pk+p4eLEOdsU0iYz9uLeYfq8GfXxygi9+dVK2ePpQ5/2tdEjAYck/Ib2f
   iAD99gHkCQlBheIvnvm67xekYjzQXvMLBp4xMZCmsuxZ4MqbC7nEmeX1g
   Kyg5SgJSQ7YwF82B6+NXy1qXQs/hdHPpuQ/jMfGJvVRq038NwEG7z4die
   5+Osej0KXt3U78WI49hypKqSesQBvTcWlxOpFTSEN/Jv1oMsW7q4BbAb2
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="307492039"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="307492039"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 23:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="521115157"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Jan 2022 23:41:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCzPe-000MJ6-S3; Thu, 27 Jan 2022 07:41:46 +0000
Date: Thu, 27 Jan 2022 15:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Stephane Eranian <eranian@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 08/13] ACPI: add perf low power callback
Message-ID: <202201271501.7zuL3YEw-lkp@intel.com>
References: <20220126233454.3362047-9-eranian@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126233454.3362047-9-eranian@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stephane,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220125]
[cannot apply to tip/x86/core rafael-pm/linux-next tip/perf/core v5.17-rc1 v5.16 v5.16-rc8 v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
base:    d25ee88530253138d0b20d43511ca5acbda4e9f7
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220127/202201271501.7zuL3YEw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fe7943af61c65b96cff36b8388246531402e7f26
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
        git checkout fe7943af61c65b96cff36b8388246531402e7f26
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/acpi/acpi_pad.c:168:4: error: implicit declaration of function 'perf_lopwr_cb' [-Werror,-Wimplicit-function-declaration]
                           perf_lopwr_cb(true);
                           ^
   1 error generated.


vim +/perf_lopwr_cb +168 drivers/acpi/acpi_pad.c

   135	
   136	static unsigned int idle_pct = 5; /* percentage */
   137	static unsigned int round_robin_time = 1; /* second */
   138	static int power_saving_thread(void *data)
   139	{
   140		int do_sleep;
   141		unsigned int tsk_index = (unsigned long)data;
   142		u64 last_jiffies = 0;
   143	
   144		sched_set_fifo_low(current);
   145	
   146		while (!kthread_should_stop()) {
   147			unsigned long expire_time;
   148	
   149			/* round robin to cpus */
   150			expire_time = last_jiffies + round_robin_time * HZ;
   151			if (time_before(expire_time, jiffies)) {
   152				last_jiffies = jiffies;
   153				round_robin_cpu(tsk_index);
   154			}
   155	
   156			do_sleep = 0;
   157	
   158			expire_time = jiffies + HZ * (100 - idle_pct) / 100;
   159	
   160			while (!need_resched()) {
   161				if (tsc_detected_unstable && !tsc_marked_unstable) {
   162					/* TSC could halt in idle, so notify users */
   163					mark_tsc_unstable("TSC halts in idle");
   164					tsc_marked_unstable = 1;
   165				}
   166				local_irq_disable();
   167	
 > 168				perf_lopwr_cb(true);
   169	
   170				tick_broadcast_enable();
   171				tick_broadcast_enter();
   172				stop_critical_timings();
   173	
   174				mwait_idle_with_hints(power_saving_mwait_eax, 1);
   175	
   176				start_critical_timings();
   177				tick_broadcast_exit();
   178	
   179				perf_lopwr_cb(false);
   180	
   181				local_irq_enable();
   182	
   183				if (time_before(expire_time, jiffies)) {
   184					do_sleep = 1;
   185					break;
   186				}
   187			}
   188	
   189			/*
   190			 * current sched_rt has threshold for rt task running time.
   191			 * When a rt task uses 95% CPU time, the rt thread will be
   192			 * scheduled out for 5% CPU time to not starve other tasks. But
   193			 * the mechanism only works when all CPUs have RT task running,
   194			 * as if one CPU hasn't RT task, RT task from other CPUs will
   195			 * borrow CPU time from this CPU and cause RT task use > 95%
   196			 * CPU time. To make 'avoid starvation' work, takes a nap here.
   197			 */
   198			if (unlikely(do_sleep))
   199				schedule_timeout_killable(HZ * idle_pct / 100);
   200	
   201			/* If an external event has set the need_resched flag, then
   202			 * we need to deal with it, or this loop will continue to
   203			 * spin without calling __mwait().
   204			 */
   205			if (unlikely(need_resched()))
   206				schedule();
   207		}
   208	
   209		exit_round_robin(tsk_index);
   210		return 0;
   211	}
   212	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
