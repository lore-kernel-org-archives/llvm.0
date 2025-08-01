Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524C26ACB;
	Fri,  1 Aug 2025 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022926; cv=none; b=L10WQnY8gG/dRJpe2ESD7QkXVugKjflRUJHJfCo+uHmcyCPFDt6GemULea6EhhZUFh0OGbCmq/A9TXFi/wf1StcgbARapiDfBL/zBUypXg+fKTDF04Kx7l1Z2xyPpE7YMuu0uanbAiCYWYnyzjRLyI42mCH6JsFei5zjg0TT2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022926; c=relaxed/simple;
	bh=xTLT1dq7i2qzp0hHgS3vNWQnXKcncg8giv7jdsQgm8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sC26ZSQ4p9KqIoMdO+NvABC7xFwiwr2KUMxVUOuzme7o1Za+84HOEEHV6FQyWQ0qx13o6vbURYm+a+r3FCyb4WK2oqI3X1266rJ54brp3gOZNLSx0h4TCnP4mgsk5zVHiB/fAZz3wS+vdRqrI1UaffNFJJb5bdshlWxydecy3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILb/YtsZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILb/YtsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754022924; x=1785558924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTLT1dq7i2qzp0hHgS3vNWQnXKcncg8giv7jdsQgm8I=;
  b=ILb/YtsZhxmrpTkbsnfME+S3XnDDG9LECZKr+aRBElATuZZ/AxNQm7ii
   nGxsl6X+LXU6Rt4iTrmbDFAFrXa+AePJVJaqGiPcBZpo2ukiKekMcFMxe
   U1pBTbDELEuhmTdkbwped+hO8qK7qWtJcKagoFRCLTvV7cEIiSCfSPvVQ
   osn2ZQnCcqijUOATMoePiDyWbSi5sMgR5von1j0bHVDUykPAI+ZwRPiQn
   Xu9mWk10m2xUUfiiGJ1ppVb/qqP3vJ4QTn62Gm01aW5w5JdXxivusbQYM
   Vn5PqUxtEKYbNKLLkjrqs54IdqC5/Z9w3kp3PRkIbxuxtfvDHpFHRzaoE
   A==;
X-CSE-ConnectionGUID: Q/4GVRF5SQiFXshXay6iMg==
X-CSE-MsgGUID: IEd3vkPJRYe6M1/jIWOdsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66930943"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="66930943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 21:35:24 -0700
X-CSE-ConnectionGUID: 1VncATKzQOquOek9KfYVww==
X-CSE-MsgGUID: 4GwLvG45RfyrhOp2lOwc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163373909"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2025 21:35:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhhUG-0004M8-2O;
	Fri, 01 Aug 2025 04:35:20 +0000
Date: Fri, 1 Aug 2025 12:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 25/25] kernel/irq/manage.c:2453:5: warning:
 no previous prototype for function 'add_percpu_irq_target'
Message-ID: <202508011211.XM88eJmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   8a3b504aca25e8c9a274cb563d63a6b9454b2780
commit: 8a3b504aca25e8c9a274cb563d63a6b9454b2780 [25/25] WIP
config: i386-buildonly-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011211.XM88eJmr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011211.XM88eJmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011211.XM88eJmr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/manage.c:2466:27: error: incompatible pointer types initializing 'struct irq_action *' with an expression of type 'struct irqaction **' [-Werror,-Wincompatible-pointer-types]
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                         ^     ~~~~~~~~~~~~~
   kernel/irq/manage.c:2466:62: error: incomplete definition of type 'struct irq_action'
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                                                         ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2467:48: error: incomplete definition of type 'struct irq_action'
    2467 |                         if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
         |                                                                  ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2470:11: error: incomplete definition of type 'struct irq_action'
    2470 |                         if (tmp->percpu_dev_id == dev_id)
         |                             ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2474:45: error: incomplete definition of type 'struct irq_action'
    2474 |                 cpumask_set_cpu(smp_processor_id(), action->affinity);
         |                                                     ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2477:28: error: incomplete definition of type 'struct irq_action'
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                    ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2477:43: error: call to undeclared function 'nr_possible_cpus'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                                         ^
   kernel/irq/manage.c:2478:10: error: incomplete definition of type 'struct irq_action'
    2478 |                         action->flags &= ~IRQF_SHARED;
         |                         ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
>> kernel/irq/manage.c:2453:5: warning: no previous prototype for function 'add_percpu_irq_target' [-Wmissing-prototypes]
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         |     ^
   kernel/irq/manage.c:2453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         | ^
         | static 
   kernel/irq/manage.c:2495:27: error: incompatible pointer types initializing 'struct irq_action *' with an expression of type 'struct irqaction **' [-Werror,-Wincompatible-pointer-types]
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                         ^     ~~~~~~~~~~~~~
   kernel/irq/manage.c:2495:62: error: incomplete definition of type 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                                                         ~~~^
   kernel/irq/manage.c:2495:15: note: forward declaration of 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                             ^
   kernel/irq/manage.c:2496:58: error: incomplete definition of type 'struct irq_action'
    2496 |                         if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
         |                                                                            ~~~^
   kernel/irq/manage.c:2495:15: note: forward declaration of 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                             ^
   kernel/irq/manage.c:2497:44: error: call to undeclared function 'nr_possible_cpus'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                                        ^
   kernel/irq/manage.c:2497:24: error: use of undeclared identifier 'action'
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                    ^
   kernel/irq/manage.c:2498:6: error: use of undeclared identifier 'action'
    2498 |                                         action->flags |= IRQF_SHARED;
         |                                         ^
>> kernel/irq/manage.c:2484:5: warning: no previous prototype for function 'remove_percpu_irq_target' [-Wmissing-prototypes]
    2484 | int remove_percpu_irq_target(unsigned int irq)
         |     ^
   kernel/irq/manage.c:2484:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2484 | int remove_percpu_irq_target(unsigned int irq)
         | ^
         | static 
   2 warnings and 14 errors generated.


vim +/add_percpu_irq_target +2453 kernel/irq/manage.c

  2452	
> 2453	int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
  2454	{
  2455		struct irq_desc *desc = irq_to_desc(irq);
  2456	
  2457		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2458			return -EINVAL;
  2459	
  2460		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2461			struct irq_action *action = NULL;
  2462	
  2463			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2464				return -EINVAL;
  2465	
  2466			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
  2467				if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
  2468					return -EINVAL;
  2469	
  2470				if (tmp->percpu_dev_id == dev_id)
  2471					action = tmp;
  2472			}
  2473	
  2474			cpumask_set_cpu(smp_processor_id(), action->affinity);
  2475	
  2476			/* If we have a full house, indicate we can't share anymore */
> 2477			if (cpumask_weight(action->affinity) == nr_possible_cpus())
  2478				action->flags &= ~IRQF_SHARED;
  2479		}
  2480	
  2481		return 0;
  2482	}
  2483	
> 2484	int remove_percpu_irq_target(unsigned int irq)
  2485	{
  2486		struct irq_desc *desc = irq_to_desc(irq);
  2487	
  2488		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2489			return -EINVAL;
  2490	
  2491		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2492			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2493				return -EINVAL;
  2494	
  2495			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
  2496				if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
> 2497					if (cpumask_weight(action->affinity) < nr_possible_cpus())
  2498						action->flags |= IRQF_SHARED;
  2499	
  2500					return 0;
  2501				}
  2502		}
  2503	
  2504		return -ENOENT;
  2505	}
  2506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
