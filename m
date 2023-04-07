Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79D7B;
	Fri,  7 Apr 2023 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680847897; x=1712383897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzAlK0ivIggH2wn9zvrYSrovXixKAq2wiQzJo8CUZUU=;
  b=AL2USQF6pXIAtwJhf6n04f+iIhikypkHhNnv/5Xm6F+Im2qhcHdbqyUZ
   O3TYNIShXGt96Yt+62bSan2P0nk7X/7Tq0Z2OfjyvbvAVb/vKn7ScnZIJ
   bGxAiJaanhVWlbpvG4SjUdf/ynCiRnn/bHdzjD0Vf0dZkEzZ1ujRXkMHe
   vH+W/Jmp+FVIqi06MMgWKDaAqkis23pPDYqriswwjPw4X32M/NNwiNLGD
   QEEsmNUVgfvo2oNyBWoF9cyKACBc8RaQpeeJk+CKqRETYnAthDOZUSwMO
   kU8ZBx4Azi4jVK6ahspkYMlWYYHVfobKHXXqQgDQqvm+N+T4Lc8Xfu138
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429220904"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="429220904"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 23:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689962882"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="689962882"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 23:11:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkfJq-000SBS-0p;
	Fri, 07 Apr 2023 06:11:30 +0000
Date: Fri, 7 Apr 2023 14:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 24/43] kernel/cpu.c:1296:2: error: call to
 undeclared function 'cpuhp_bp_sync_dead'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202304071432.tXvtpDvx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug
head:   3675258f0132b4f3fd39917e9d5a53f5e23094b5
commit: ff7f55f1e7002f73f7f233062dca4e5f1f47c931 [24/43] cpu/hotplug: Add CPU state tracking and synchronization
config: riscv-randconfig-r012-20230406 (https://download.01.org/0day-ci/archive/20230407/202304071432.tXvtpDvx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=ff7f55f1e7002f73f7f233062dca4e5f1f47c931
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout ff7f55f1e7002f73f7f233062dca4e5f1f47c931
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071432.tXvtpDvx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cpu.c:1296:2: error: call to undeclared function 'cpuhp_bp_sync_dead'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cpuhp_bp_sync_dead(cpu);
           ^
   kernel/cpu.c:1296:2: note: did you mean 'cpuhp_bp_sync_alive'?
   kernel/cpu.c:452:19: note: 'cpuhp_bp_sync_alive' declared here
   static inline int cpuhp_bp_sync_alive(unsigned int cpu) { return 0; }
                     ^
   1 error generated.


vim +/cpuhp_bp_sync_dead +1296 kernel/cpu.c

  1251	
  1252	static int takedown_cpu(unsigned int cpu)
  1253	{
  1254		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
  1255		int err;
  1256	
  1257		/* Park the smpboot threads */
  1258		kthread_park(st->thread);
  1259	
  1260		/*
  1261		 * Prevent irq alloc/free while the dying cpu reorganizes the
  1262		 * interrupt affinities.
  1263		 */
  1264		irq_lock_sparse();
  1265	
  1266		/*
  1267		 * So now all preempt/rcu users must observe !cpu_active().
  1268		 */
  1269		err = stop_machine_cpuslocked(take_cpu_down, NULL, cpumask_of(cpu));
  1270		if (err) {
  1271			/* CPU refused to die */
  1272			irq_unlock_sparse();
  1273			/* Unpark the hotplug thread so we can rollback there */
  1274			kthread_unpark(st->thread);
  1275			return err;
  1276		}
  1277		BUG_ON(cpu_online(cpu));
  1278	
  1279		/*
  1280		 * The teardown callback for CPUHP_AP_SCHED_STARTING will have removed
  1281		 * all runnable tasks from the CPU, there's only the idle task left now
  1282		 * that the migration thread is done doing the stop_machine thing.
  1283		 *
  1284		 * Wait for the stop thread to go away.
  1285		 */
  1286		wait_for_ap_thread(st, false);
  1287		BUG_ON(st->state != CPUHP_AP_IDLE_DEAD);
  1288	
  1289		/* Interrupts are moved away from the dying cpu, reenable alloc/free */
  1290		irq_unlock_sparse();
  1291	
  1292		hotplug_cpu__broadcast_tick_pull(cpu);
  1293		/* This actually kills the CPU. */
  1294		__cpu_die(cpu);
  1295	
> 1296		cpuhp_bp_sync_dead(cpu);
  1297	
  1298		tick_cleanup_dead_cpu(cpu);
  1299		rcutree_migrate_callbacks(cpu);
  1300		return 0;
  1301	}
  1302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
