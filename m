Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B622361
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661144072; x=1692680072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fCz5QbltH6KtfNc+34Ba0Esmq+hpNHQ6ULWrYhcnmPA=;
  b=ClMxzapBZBKGKX72YDrwe1LY1AhqArWg1bsjjXwLXZ2Ow3IpdHtIlYIf
   9V6hZ+SlJ6aUx7pjLkLEPcS4D/UaC3cnGeuYn/g5PDqbzjpTLOmalaM83
   qdg0yRAQocSnd0hg+caSAmg64vWpNjPJgONh7ZkC0wMxGLttajJ+5fjx2
   3kdsFgTY9VU+kEruLgA0Yae1OB4uYkBXOiJRJb05u9Ff/7xDrvtKgS2Mm
   Ng4dIvlKtf8h6wTNLgQN9UHEgOuIAKEfDfSOqafw+F6h2DewGInzVkm0U
   SvN3u4ex70EO+Yu59dpjPMtK/Nhe8T+kKzKQ6lPn3+GE+5YzBHVVCT7hC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="273075602"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="273075602"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2022 21:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="559595426"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2022 21:54:30 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPzSH-0004wN-2m;
	Mon, 22 Aug 2022 04:54:29 +0000
Date: Mon, 22 Aug 2022 12:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <kernelfans@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 06/10] rcu/hotplug: Make rcutree_dead_cpu() parallel
Message-ID: <202208221246.L4LUk5u8-lkp@intel.com>
References: <20220822021520.6996-7-kernelfans@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822021520.6996-7-kernelfans@gmail.com>

Hi Pingfan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc2 next-20220819]
[cannot apply to arm64/for-next/core soc/for-next arm/for-next kvmarm/next xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/arm64-riscv-Introduce-fast-kexec-reboot/20220822-101854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1c23f9e627a7b412978b4e852793c5e3c3efc555
config: i386-randconfig-a001-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221246.L4LUk5u8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/28c1ad168af1fe0412af126f49213f44664175ed
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pingfan-Liu/arm64-riscv-Introduce-fast-kexec-reboot/20220822-101854
        git checkout 28c1ad168af1fe0412af126f49213f44664175ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/cpu.c:1875:4: error: field designator 'support_kexec_parallel' does not refer to any field in type 'struct cpuhp_step'
                   .support_kexec_parallel = true,
                    ^
   1 error generated.


vim +1875 kernel/cpu.c

  1821	
  1822	/* Boot processor state steps */
  1823	static struct cpuhp_step cpuhp_hp_states[] = {
  1824		[CPUHP_OFFLINE] = {
  1825			.name			= "offline",
  1826			.startup.single		= NULL,
  1827			.teardown.single	= NULL,
  1828		},
  1829	#ifdef CONFIG_SMP
  1830		[CPUHP_CREATE_THREADS]= {
  1831			.name			= "threads:prepare",
  1832			.startup.single		= smpboot_create_threads,
  1833			.teardown.single	= NULL,
  1834			.cant_stop		= true,
  1835		},
  1836		[CPUHP_PERF_PREPARE] = {
  1837			.name			= "perf:prepare",
  1838			.startup.single		= perf_event_init_cpu,
  1839			.teardown.single	= perf_event_exit_cpu,
  1840		},
  1841		[CPUHP_RANDOM_PREPARE] = {
  1842			.name			= "random:prepare",
  1843			.startup.single		= random_prepare_cpu,
  1844			.teardown.single	= NULL,
  1845		},
  1846		[CPUHP_WORKQUEUE_PREP] = {
  1847			.name			= "workqueue:prepare",
  1848			.startup.single		= workqueue_prepare_cpu,
  1849			.teardown.single	= NULL,
  1850		},
  1851		[CPUHP_HRTIMERS_PREPARE] = {
  1852			.name			= "hrtimers:prepare",
  1853			.startup.single		= hrtimers_prepare_cpu,
  1854			.teardown.single	= hrtimers_dead_cpu,
  1855		},
  1856		[CPUHP_SMPCFD_PREPARE] = {
  1857			.name			= "smpcfd:prepare",
  1858			.startup.single		= smpcfd_prepare_cpu,
  1859			.teardown.single	= smpcfd_dead_cpu,
  1860		},
  1861		[CPUHP_RELAY_PREPARE] = {
  1862			.name			= "relay:prepare",
  1863			.startup.single		= relay_prepare_cpu,
  1864			.teardown.single	= NULL,
  1865		},
  1866		[CPUHP_SLAB_PREPARE] = {
  1867			.name			= "slab:prepare",
  1868			.startup.single		= slab_prepare_cpu,
  1869			.teardown.single	= slab_dead_cpu,
  1870		},
  1871		[CPUHP_RCUTREE_PREP] = {
  1872			.name			= "RCU/tree:prepare",
  1873			.startup.single		= rcutree_prepare_cpu,
  1874			.teardown.single	= rcutree_dead_cpu,
> 1875			.support_kexec_parallel	= true,
  1876		},
  1877		/*
  1878		 * On the tear-down path, timers_dead_cpu() must be invoked
  1879		 * before blk_mq_queue_reinit_notify() from notify_dead(),
  1880		 * otherwise a RCU stall occurs.
  1881		 */
  1882		[CPUHP_TIMERS_PREPARE] = {
  1883			.name			= "timers:prepare",
  1884			.startup.single		= timers_prepare_cpu,
  1885			.teardown.single	= timers_dead_cpu,
  1886		},
  1887		/* Kicks the plugged cpu into life */
  1888		[CPUHP_BRINGUP_CPU] = {
  1889			.name			= "cpu:bringup",
  1890			.startup.single		= bringup_cpu,
  1891			.teardown.single	= finish_cpu,
  1892			.cant_stop		= true,
  1893		},
  1894		/* Final state before CPU kills itself */
  1895		[CPUHP_AP_IDLE_DEAD] = {
  1896			.name			= "idle:dead",
  1897		},
  1898		/*
  1899		 * Last state before CPU enters the idle loop to die. Transient state
  1900		 * for synchronization.
  1901		 */
  1902		[CPUHP_AP_OFFLINE] = {
  1903			.name			= "ap:offline",
  1904			.cant_stop		= true,
  1905		},
  1906		/* First state is scheduler control. Interrupts are disabled */
  1907		[CPUHP_AP_SCHED_STARTING] = {
  1908			.name			= "sched:starting",
  1909			.startup.single		= sched_cpu_starting,
  1910			.teardown.single	= sched_cpu_dying,
  1911		},
  1912		[CPUHP_AP_RCUTREE_DYING] = {
  1913			.name			= "RCU/tree:dying",
  1914			.startup.single		= NULL,
  1915			.teardown.single	= rcutree_dying_cpu,
  1916		},
  1917		[CPUHP_AP_SMPCFD_DYING] = {
  1918			.name			= "smpcfd:dying",
  1919			.startup.single		= NULL,
  1920			.teardown.single	= smpcfd_dying_cpu,
  1921		},
  1922		/* Entry state on starting. Interrupts enabled from here on. Transient
  1923		 * state for synchronsization */
  1924		[CPUHP_AP_ONLINE] = {
  1925			.name			= "ap:online",
  1926		},
  1927		/*
  1928		 * Handled on control processor until the plugged processor manages
  1929		 * this itself.
  1930		 */
  1931		[CPUHP_TEARDOWN_CPU] = {
  1932			.name			= "cpu:teardown",
  1933			.startup.single		= NULL,
  1934			.teardown.single	= takedown_cpu,
  1935			.cant_stop		= true,
  1936		},
  1937	
  1938		[CPUHP_AP_SCHED_WAIT_EMPTY] = {
  1939			.name			= "sched:waitempty",
  1940			.startup.single		= NULL,
  1941			.teardown.single	= sched_cpu_wait_empty,
  1942		},
  1943	
  1944		/* Handle smpboot threads park/unpark */
  1945		[CPUHP_AP_SMPBOOT_THREADS] = {
  1946			.name			= "smpboot/threads:online",
  1947			.startup.single		= smpboot_unpark_threads,
  1948			.teardown.single	= smpboot_park_threads,
  1949		},
  1950		[CPUHP_AP_IRQ_AFFINITY_ONLINE] = {
  1951			.name			= "irq/affinity:online",
  1952			.startup.single		= irq_affinity_online_cpu,
  1953			.teardown.single	= NULL,
  1954		},
  1955		[CPUHP_AP_PERF_ONLINE] = {
  1956			.name			= "perf:online",
  1957			.startup.single		= perf_event_init_cpu,
  1958			.teardown.single	= perf_event_exit_cpu,
  1959		},
  1960		[CPUHP_AP_WATCHDOG_ONLINE] = {
  1961			.name			= "lockup_detector:online",
  1962			.startup.single		= lockup_detector_online_cpu,
  1963			.teardown.single	= lockup_detector_offline_cpu,
  1964		},
  1965		[CPUHP_AP_WORKQUEUE_ONLINE] = {
  1966			.name			= "workqueue:online",
  1967			.startup.single		= workqueue_online_cpu,
  1968			.teardown.single	= workqueue_offline_cpu,
  1969		},
  1970		[CPUHP_AP_RANDOM_ONLINE] = {
  1971			.name			= "random:online",
  1972			.startup.single		= random_online_cpu,
  1973			.teardown.single	= NULL,
  1974		},
  1975		[CPUHP_AP_RCUTREE_ONLINE] = {
  1976			.name			= "RCU/tree:online",
  1977			.startup.single		= rcutree_online_cpu,
  1978			.teardown.single	= rcutree_offline_cpu,
  1979		},
  1980	#endif
  1981		/*
  1982		 * The dynamically registered state space is here
  1983		 */
  1984	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
