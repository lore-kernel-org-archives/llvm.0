Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB33267B71;
	Thu, 13 Mar 2025 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868934; cv=none; b=DcHiS88cGH1tXS5R8hM9ALfCjDwNSg1PVeFnG6S7z9F8WEuni/EB8ie+QCL1FdtsKAFkjXkgN6g4FFNLagF361hDmdI5fK/JRkBX/DGQVXlLnqHuKcph2zDLWKvOd2Kmg46/rtrzmnSxhpkU1GA0vDVbSRjWogUEV90vEp2cfGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868934; c=relaxed/simple;
	bh=KnrNAN1zplTRyIklzLBlAolAIQBsF6s85zMQ77do7YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxmGTbM36xoRUnfnYqUKcKJx0ha69sa3lw/QW8mM3QyLV745BORqpFVUofY3MtJX0ehrO/MYzR2blvRJC4KEyMVkKbLojb8naATiqjv74bKJ51HMO30udFv7mlxw10U/Ojtc5V2fsA8TSEly/n4aNhoTNbgq51ntclHmvllC6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3Rm89F0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3Rm89F0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741868931; x=1773404931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnrNAN1zplTRyIklzLBlAolAIQBsF6s85zMQ77do7YA=;
  b=N3Rm89F012zKEAo/AUHHaJIZHx7IR8SVqWA88ytMtho3rn1cdyJMhVxo
   7rHLvl8KKHG6v1jKlRixpddsdbc9+Ph4CCzeConuVgzAJ3KpmbHocrcJ4
   P9YqBWf+zAhfrBQYZ0khNEDPYUBS4+vW/xg1T9aGHmvtEY6fqBYIicQ5B
   O1R6lq+P73P7M8bkVDLpFQOUvYrN6lZognicJyfKBu3A28teiBZI3KW1P
   vf1QJQtO5vyvemRr72bVERZHolv7KDA0f/Q1P1TUNyrWzv/c+fhy/3xV6
   y1mHI2dupvvGEmJXUFd1VgRrGY9WFBBFNWxFLZArPN/KZiE7OxD7gKd7A
   g==;
X-CSE-ConnectionGUID: segjVzcORpab2QR2QuvaLA==
X-CSE-MsgGUID: MI493x+eQ027fa0FkP0Ktg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43160194"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43160194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:28:51 -0700
X-CSE-ConnectionGUID: qL7e/12yS8+qsWGHb8Fgmg==
X-CSE-MsgGUID: w+j40nzWTxukUgu4d2vpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125825796"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Mar 2025 05:28:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tshg6-0009Ok-25;
	Thu, 13 Mar 2025 12:28:46 +0000
Date: Thu, 13 Mar 2025 20:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christopher S M Hall <christopher.s.hall@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tglx-devel:timers/ptp/tkntp 30/30] drivers/ptp/ptp_clock.c:257:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202503132040.dIZACOtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   6d854257fc06d461325c3fe67f8cae7d7e4483c7
commit: 6d854257fc06d461325c3fe67f8cae7d7e4483c7 [30/30] ptp: Support PTP POSIX clock IDs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250313/202503132040.dIZACOtH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503132040.dIZACOtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503132040.dIZACOtH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_clock.c:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ptp/ptp_clock.c:257:3: error: cannot jump from this goto statement to its label
     257 |                 goto no_memory;
         |                 ^
   drivers/ptp/ptp_clock.c:260:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     260 |         guard(mutex)(&ptp_clock_mutex);
         |         ^
   include/linux/cleanup.h:315:15: note: expanded from macro 'guard'
     315 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:47:1: note: expanded from here
      47 | __UNIQUE_ID_guard687
         | ^
   4 warnings and 1 error generated.


vim +257 drivers/ptp/ptp_clock.c

d94ba80ebbea17f Richard Cochran      2011-04-22  240  
1ef761582c07444 Richard Cochran      2012-09-22  241  struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
1ef761582c07444 Richard Cochran      2012-09-22  242  				     struct device *parent)
d94ba80ebbea17f Richard Cochran      2011-04-22  243  {
d94ba80ebbea17f Richard Cochran      2011-04-22  244  	struct ptp_clock *ptp;
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  245  	struct timestamp_event_queue *queue = NULL;
f095fefacdd35b4 Kory Maincent        2024-03-11  246  	int err, index, major = MAJOR(ptp_devt);
75a384ceda93df0 Dan Carpenter        2023-10-18  247  	char debugfsname[16];
44c494c8e30e357 Yangbo Lu            2021-06-30  248  	size_t size;
d94ba80ebbea17f Richard Cochran      2011-04-22  249  
d94ba80ebbea17f Richard Cochran      2011-04-22  250  	if (info->n_alarm > PTP_MAX_ALARMS)
d94ba80ebbea17f Richard Cochran      2011-04-22  251  		return ERR_PTR(-EINVAL);
d94ba80ebbea17f Richard Cochran      2011-04-22  252  
d94ba80ebbea17f Richard Cochran      2011-04-22  253  	/* Initialize a clock structure. */
d94ba80ebbea17f Richard Cochran      2011-04-22  254  	ptp = kzalloc(sizeof(struct ptp_clock), GFP_KERNEL);
f095fefacdd35b4 Kory Maincent        2024-03-11  255  	if (!ptp) {
f095fefacdd35b4 Kory Maincent        2024-03-11  256  		err = -ENOMEM;
d94ba80ebbea17f Richard Cochran      2011-04-22 @257  		goto no_memory;
f095fefacdd35b4 Kory Maincent        2024-03-11  258  	}
d94ba80ebbea17f Richard Cochran      2011-04-22  259  
6d854257fc06d46 Christopher S M Hall 2025-03-12  260  	guard(mutex)(&ptp_clock_mutex);
f095fefacdd35b4 Kory Maincent        2024-03-11  261  	err = xa_alloc(&ptp_clocks_map, &index, ptp, xa_limit_31b,
f095fefacdd35b4 Kory Maincent        2024-03-11  262  		       GFP_KERNEL);
f095fefacdd35b4 Kory Maincent        2024-03-11  263  	if (err)
7356a764cd76e15 Jiri Benc            2013-04-12  264  		goto no_slot;
7356a764cd76e15 Jiri Benc            2013-04-12  265  
d94ba80ebbea17f Richard Cochran      2011-04-22  266  	ptp->clock.ops = ptp_clock_ops;
d94ba80ebbea17f Richard Cochran      2011-04-22  267  	ptp->info = info;
d94ba80ebbea17f Richard Cochran      2011-04-22  268  	ptp->devid = MKDEV(major, index);
d94ba80ebbea17f Richard Cochran      2011-04-22  269  	ptp->index = index;
d50fd3f4cb8c885 Christopher S M Hall 2025-03-12  270  	ptp->ptp_clockid = PTP_CLOCK_NONE;
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  271  	INIT_LIST_HEAD(&ptp->tsevqs);
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  272  	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
f095fefacdd35b4 Kory Maincent        2024-03-11  273  	if (!queue) {
f095fefacdd35b4 Kory Maincent        2024-03-11  274  		err = -ENOMEM;
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  275  		goto no_memory_queue;
f095fefacdd35b4 Kory Maincent        2024-03-11  276  	}
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  277  	list_add_tail(&queue->qlist, &ptp->tsevqs);
1bea2c3e6df8caf Edward Adam Davis    2023-11-07  278  	spin_lock_init(&ptp->tsevqs_lock);
c5a445b1e9347b1 Xabier Marquiegui    2023-10-12  279  	queue->mask = bitmap_alloc(PTP_MAX_CHANNELS, GFP_KERNEL);
f095fefacdd35b4 Kory Maincent        2024-03-11  280  	if (!queue->mask) {
f095fefacdd35b4 Kory Maincent        2024-03-11  281  		err = -ENOMEM;
c5a445b1e9347b1 Xabier Marquiegui    2023-10-12  282  		goto no_memory_bitmap;
f095fefacdd35b4 Kory Maincent        2024-03-11  283  	}
c5a445b1e9347b1 Xabier Marquiegui    2023-10-12  284  	bitmap_set(queue->mask, 0, PTP_MAX_CHANNELS);
8f5de6fb2453267 Xabier Marquiegui    2023-10-12  285  	spin_lock_init(&queue->lock);
6092315dfdec518 Richard Cochran      2014-03-20  286  	mutex_init(&ptp->pincfg_mux);
73f37068d540eba Yangbo Lu            2021-06-30  287  	mutex_init(&ptp->n_vclocks_mux);
d94ba80ebbea17f Richard Cochran      2011-04-22  288  	init_waitqueue_head(&ptp->tsev_wq);
d94ba80ebbea17f Richard Cochran      2011-04-22  289  
42704b26b0f1d89 Gerhard Engleder     2022-05-06  290  	if (ptp->info->getcycles64 || ptp->info->getcyclesx64) {
42704b26b0f1d89 Gerhard Engleder     2022-05-06  291  		ptp->has_cycles = true;
42704b26b0f1d89 Gerhard Engleder     2022-05-06  292  		if (!ptp->info->getcycles64 && ptp->info->getcyclesx64)
42704b26b0f1d89 Gerhard Engleder     2022-05-06  293  			ptp->info->getcycles64 = ptp_getcycles64;
42704b26b0f1d89 Gerhard Engleder     2022-05-06  294  	} else {
42704b26b0f1d89 Gerhard Engleder     2022-05-06  295  		/* Free running cycle counter not supported, use time. */
42704b26b0f1d89 Gerhard Engleder     2022-05-06  296  		ptp->info->getcycles64 = ptp_getcycles64;
42704b26b0f1d89 Gerhard Engleder     2022-05-06  297  
42704b26b0f1d89 Gerhard Engleder     2022-05-06  298  		if (ptp->info->gettimex64)
42704b26b0f1d89 Gerhard Engleder     2022-05-06  299  			ptp->info->getcyclesx64 = ptp->info->gettimex64;
42704b26b0f1d89 Gerhard Engleder     2022-05-06  300  
42704b26b0f1d89 Gerhard Engleder     2022-05-06  301  		if (ptp->info->getcrosststamp)
42704b26b0f1d89 Gerhard Engleder     2022-05-06  302  			ptp->info->getcrosscycles = ptp->info->getcrosststamp;
42704b26b0f1d89 Gerhard Engleder     2022-05-06  303  	}
42704b26b0f1d89 Gerhard Engleder     2022-05-06  304  
d9535cb7b7603ae Grygorii Strashko    2017-07-28  305  	if (ptp->info->do_aux_work) {
d9535cb7b7603ae Grygorii Strashko    2017-07-28  306  		kthread_init_delayed_work(&ptp->aux_work, ptp_aux_kworker);
822c5f7341366be Rasmus Villemoes     2018-10-26  307  		ptp->kworker = kthread_create_worker(0, "ptp%d", ptp->index);
d9535cb7b7603ae Grygorii Strashko    2017-07-28  308  		if (IS_ERR(ptp->kworker)) {
d9535cb7b7603ae Grygorii Strashko    2017-07-28  309  			err = PTR_ERR(ptp->kworker);
d9535cb7b7603ae Grygorii Strashko    2017-07-28  310  			pr_err("failed to create ptp aux_worker %d\n", err);
d9535cb7b7603ae Grygorii Strashko    2017-07-28  311  			goto kworker_err;
d9535cb7b7603ae Grygorii Strashko    2017-07-28  312  		}
d9535cb7b7603ae Grygorii Strashko    2017-07-28  313  	}
d9535cb7b7603ae Grygorii Strashko    2017-07-28  314  
73f37068d540eba Yangbo Lu            2021-06-30  315  	/* PTP virtual clock is being registered under physical clock */
55eac20617ca841 Yangbo Lu            2021-07-05  316  	if (parent && parent->class && parent->class->name &&
73f37068d540eba Yangbo Lu            2021-06-30  317  	    strcmp(parent->class->name, "ptp") == 0)
73f37068d540eba Yangbo Lu            2021-06-30  318  		ptp->is_virtual_clock = true;
73f37068d540eba Yangbo Lu            2021-06-30  319  
44c494c8e30e357 Yangbo Lu            2021-06-30  320  	if (!ptp->is_virtual_clock) {
73f37068d540eba Yangbo Lu            2021-06-30  321  		ptp->max_vclocks = PTP_DEFAULT_MAX_VCLOCKS;
73f37068d540eba Yangbo Lu            2021-06-30  322  
44c494c8e30e357 Yangbo Lu            2021-06-30  323  		size = sizeof(int) * ptp->max_vclocks;
44c494c8e30e357 Yangbo Lu            2021-06-30  324  		ptp->vclock_index = kzalloc(size, GFP_KERNEL);
44c494c8e30e357 Yangbo Lu            2021-06-30  325  		if (!ptp->vclock_index) {
44c494c8e30e357 Yangbo Lu            2021-06-30  326  			err = -ENOMEM;
44c494c8e30e357 Yangbo Lu            2021-06-30  327  			goto no_mem_for_vclocks;
44c494c8e30e357 Yangbo Lu            2021-06-30  328  		}
44c494c8e30e357 Yangbo Lu            2021-06-30  329  	}
44c494c8e30e357 Yangbo Lu            2021-06-30  330  
85a66e55019583d Dmitry Torokhov      2017-02-14  331  	err = ptp_populate_pin_groups(ptp);
85a66e55019583d Dmitry Torokhov      2017-02-14  332  	if (err)
85a66e55019583d Dmitry Torokhov      2017-02-14  333  		goto no_pin_groups;
85a66e55019583d Dmitry Torokhov      2017-02-14  334  
d94ba80ebbea17f Richard Cochran      2011-04-22  335  	/* Register a new PPS source. */
d94ba80ebbea17f Richard Cochran      2011-04-22  336  	if (info->pps) {
d94ba80ebbea17f Richard Cochran      2011-04-22  337  		struct pps_source_info pps;
d94ba80ebbea17f Richard Cochran      2011-04-22  338  		memset(&pps, 0, sizeof(pps));
d94ba80ebbea17f Richard Cochran      2011-04-22  339  		snprintf(pps.name, PPS_MAX_NAME_LEN, "ptp%d", index);
d94ba80ebbea17f Richard Cochran      2011-04-22  340  		pps.mode = PTP_PPS_MODE;
d94ba80ebbea17f Richard Cochran      2011-04-22  341  		pps.owner = info->owner;
d94ba80ebbea17f Richard Cochran      2011-04-22  342  		ptp->pps_source = pps_register_source(&pps, PTP_PPS_DEFAULTS);
b9d93594c7679c1 Dan Carpenter        2018-12-07  343  		if (IS_ERR(ptp->pps_source)) {
b9d93594c7679c1 Dan Carpenter        2018-12-07  344  			err = PTR_ERR(ptp->pps_source);
d94ba80ebbea17f Richard Cochran      2011-04-22  345  			pr_err("failed to register pps source\n");
d94ba80ebbea17f Richard Cochran      2011-04-22  346  			goto no_pps;
d94ba80ebbea17f Richard Cochran      2011-04-22  347  		}
debdd8e31895fdd Jonathan Lemon       2021-07-08  348  		ptp->pps_source->lookup_cookie = ptp;
d94ba80ebbea17f Richard Cochran      2011-04-22  349  	}
d94ba80ebbea17f Richard Cochran      2011-04-22  350  
a33121e5487b424 Vladis Dronov        2019-12-27  351  	/* Initialize a new device of our class in our clock structure. */
a33121e5487b424 Vladis Dronov        2019-12-27  352  	device_initialize(&ptp->dev);
a33121e5487b424 Vladis Dronov        2019-12-27  353  	ptp->dev.devt = ptp->devid;
c057eddcb45ac13 Ricardo B. Marliere  2024-03-05  354  	ptp->dev.class = &ptp_class;
a33121e5487b424 Vladis Dronov        2019-12-27  355  	ptp->dev.parent = parent;
a33121e5487b424 Vladis Dronov        2019-12-27  356  	ptp->dev.groups = ptp->pin_attr_groups;
a33121e5487b424 Vladis Dronov        2019-12-27  357  	ptp->dev.release = ptp_clock_release;
a33121e5487b424 Vladis Dronov        2019-12-27  358  	dev_set_drvdata(&ptp->dev, ptp);
a33121e5487b424 Vladis Dronov        2019-12-27  359  	dev_set_name(&ptp->dev, "ptp%d", ptp->index);
a33121e5487b424 Vladis Dronov        2019-12-27  360  
a33121e5487b424 Vladis Dronov        2019-12-27  361  	/* Create a posix clock and link it to the device. */
a33121e5487b424 Vladis Dronov        2019-12-27  362  	err = posix_clock_register(&ptp->clock, &ptp->dev);
d94ba80ebbea17f Richard Cochran      2011-04-22  363  	if (err) {
4225fea1cb28370 Yang Yingliang       2021-10-20  364  		if (ptp->pps_source)
4225fea1cb28370 Yang Yingliang       2021-10-20  365  			pps_unregister_source(ptp->pps_source);
4225fea1cb28370 Yang Yingliang       2021-10-20  366  
4225fea1cb28370 Yang Yingliang       2021-10-20  367  		if (ptp->kworker)
4225fea1cb28370 Yang Yingliang       2021-10-20  368  			kthread_destroy_worker(ptp->kworker);
4225fea1cb28370 Yang Yingliang       2021-10-20  369  
4225fea1cb28370 Yang Yingliang       2021-10-20  370  		put_device(&ptp->dev);
4225fea1cb28370 Yang Yingliang       2021-10-20  371  
d94ba80ebbea17f Richard Cochran      2011-04-22  372  		pr_err("failed to create posix clock\n");
4225fea1cb28370 Yang Yingliang       2021-10-20  373  		return ERR_PTR(err);
d94ba80ebbea17f Richard Cochran      2011-04-22  374  	}
d94ba80ebbea17f Richard Cochran      2011-04-22  375  
403376ddb4221be Xabier Marquiegui    2023-10-12  376  	/* Debugfs initialization */
75a384ceda93df0 Dan Carpenter        2023-10-18  377  	snprintf(debugfsname, sizeof(debugfsname), "ptp%d", ptp->index);
403376ddb4221be Xabier Marquiegui    2023-10-12  378  	ptp->debugfs_root = debugfs_create_dir(debugfsname, NULL);
403376ddb4221be Xabier Marquiegui    2023-10-12  379  
d94ba80ebbea17f Richard Cochran      2011-04-22  380  	return ptp;
d94ba80ebbea17f Richard Cochran      2011-04-22  381  
d94ba80ebbea17f Richard Cochran      2011-04-22  382  no_pps:
85a66e55019583d Dmitry Torokhov      2017-02-14  383  	ptp_cleanup_pin_groups(ptp);
85a66e55019583d Dmitry Torokhov      2017-02-14  384  no_pin_groups:
44c494c8e30e357 Yangbo Lu            2021-06-30  385  	kfree(ptp->vclock_index);
44c494c8e30e357 Yangbo Lu            2021-06-30  386  no_mem_for_vclocks:
d9535cb7b7603ae Grygorii Strashko    2017-07-28  387  	if (ptp->kworker)
d9535cb7b7603ae Grygorii Strashko    2017-07-28  388  		kthread_destroy_worker(ptp->kworker);
d9535cb7b7603ae Grygorii Strashko    2017-07-28  389  kworker_err:
6092315dfdec518 Richard Cochran      2014-03-20  390  	mutex_destroy(&ptp->pincfg_mux);
73f37068d540eba Yangbo Lu            2021-06-30  391  	mutex_destroy(&ptp->n_vclocks_mux);
c5a445b1e9347b1 Xabier Marquiegui    2023-10-12  392  	bitmap_free(queue->mask);
c5a445b1e9347b1 Xabier Marquiegui    2023-10-12  393  no_memory_bitmap:
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  394  	list_del(&queue->qlist);
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  395  	kfree(queue);
d26ab5a35ad9920 Xabier Marquiegui    2023-10-12  396  no_memory_queue:
f095fefacdd35b4 Kory Maincent        2024-03-11  397  	xa_erase(&ptp_clocks_map, index);
7356a764cd76e15 Jiri Benc            2013-04-12  398  no_slot:
d94ba80ebbea17f Richard Cochran      2011-04-22  399  	kfree(ptp);
d94ba80ebbea17f Richard Cochran      2011-04-22  400  no_memory:
d94ba80ebbea17f Richard Cochran      2011-04-22  401  	return ERR_PTR(err);
d94ba80ebbea17f Richard Cochran      2011-04-22  402  }
d94ba80ebbea17f Richard Cochran      2011-04-22  403  EXPORT_SYMBOL(ptp_clock_register);
d94ba80ebbea17f Richard Cochran      2011-04-22  404  

:::::: The code at line 257 was first introduced by commit
:::::: d94ba80ebbea17f036cecb104398fbcd788aa742 ptp: Added a brand new class driver for ptp clocks.

:::::: TO: Richard Cochran <richardcochran@gmail.com>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
