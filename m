Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FD30CDBB;
	Tue, 26 Aug 2025 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756237493; cv=none; b=UEBA17owx0edcxVf5UEidH/Dvhpd/0UhdJ889oersMFAGiBUzjsck8KWG8FndgXMjEFyoBQzVfrf9JEV0zgFINLuSQKXof5cwUfLtLHzfuw2noOf9wdxqEJUtMwcVt6nalxdXqCY5b/HpOM47dwhsnVuSmfRqCJhIQeq7clqT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756237493; c=relaxed/simple;
	bh=VKw4BgDEQyKwKTM6j7IGL5GIiDaIXWa7ZkotB2Dukzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReTfbeFsmyc/1ZPBQqCaBjdO7p3LvtDimliIjuVDMML5FUr4UMDSBRCCZ540CNDSHeqB+dLhaD0VhonhCejrx9p8E7i5PuAR75JHQUI1356Nm+8ZptGdAaVh8iEk6hB/QrVUKsgmFLwCwfA8bjTXutY2Wqb4qmyGTCzkw8hTnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0JGAXs2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0JGAXs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756237493; x=1787773493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKw4BgDEQyKwKTM6j7IGL5GIiDaIXWa7ZkotB2Dukzs=;
  b=j0JGAXs2hFMtw3Yw3NsIYa92cUNT5zm7VcQGL5vGWmJnH2hjvQmjKwE2
   WvjrFOQbzZIR2777En67t7G23EfbZk/iNbGJub+rLOq51CZlNylm+xMQh
   19ix67HRRY3iC/JVFq5cmYyZnmDY0MiKD2jP9xwmNUcCoKbFGienMdjnu
   OI7C5gtsfJTXO7bdEq+TNeleMvWTpOoAQMTSYrnR1dJttE4VFf2nlhsN+
   KKAyAV7Mzp+pXRDrWyozBqlST5qWOsNhSVktNZ1ShJiQGCSjkjmuZAFzK
   nFXQclahSRlOPg3qcutjeceTCZzmbdD72J5GyNA5PH8czIWJT89FLDk8o
   A==;
X-CSE-ConnectionGUID: KvC9JnfOTEKSh5TRM3YSgw==
X-CSE-MsgGUID: pkMt8RYDSjm2yiOwcf3TgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58196650"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58196650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 12:44:52 -0700
X-CSE-ConnectionGUID: f73lg6zjQ2yo0dh1YiGlqw==
X-CSE-MsgGUID: Hm4oMGHeRlm2lc6MuQ0yrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200613591"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2025 12:44:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqzaV-000SL7-1R;
	Tue, 26 Aug 2025 19:44:24 +0000
Date: Wed, 27 Aug 2025 03:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v2 35/35]
 kernel/irq/manage.c:1411:46: error: no member named 'affinity' in 'struct
 irq_common_data'
Message-ID: <202508270331.tMyrfknq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   6bcb15d1aebd50828a313a2ec927dea9d0ab9b8f
commit: 6bcb15d1aebd50828a313a2ec927dea9d0ab9b8f [35/35] genirq: Correctly handle preferred kthreads affinity
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250827/202508270331.tMyrfknq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270331.tMyrfknq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270331.tMyrfknq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:1411:46: error: no member named 'affinity' in 'struct irq_common_data'
    1411 |         if (cpumask_available(desc->irq_common_data.affinity))
         |                               ~~~~~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +1411 kernel/irq/manage.c

  1385	
  1386	static int
  1387	setup_irq_thread(struct irqaction *new, struct irq_desc *desc,
  1388			 unsigned int irq, bool secondary)
  1389	{
  1390		const struct cpumask *mask;
  1391		struct task_struct *t;
  1392	
  1393		if (!secondary) {
  1394			t = kthread_create(irq_thread, new, "irq/%d-%s", irq,
  1395					   new->name);
  1396		} else {
  1397			t = kthread_create(irq_thread, new, "irq/%d-s-%s", irq,
  1398					   new->name);
  1399		}
  1400	
  1401		if (IS_ERR(t))
  1402			return PTR_ERR(t);
  1403	
  1404		/*
  1405		 * We keep the reference to the task struct even if
  1406		 * the thread dies to avoid that the interrupt code
  1407		 * references an already freed task_struct.
  1408		 */
  1409		new->thread = get_task_struct(t);
  1410	
> 1411		if (cpumask_available(desc->irq_common_data.affinity))
  1412			mask = irq_data_get_effective_affinity_mask(&desc->irq_data);
  1413		else
  1414			mask = cpu_possible_mask;
  1415	
  1416		kthread_affine_preferred(t, mask);
  1417	
  1418		return 0;
  1419	}
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
