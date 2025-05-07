Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A6038F9C;
	Wed,  7 May 2025 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612646; cv=none; b=IxETBMVuZ1P7K5UPvQT4AsinVTy1nunVdvDhTzm3bnicyb6gGnq9dzK/y4nMjt4AY49UifL9/LVQVNpFNCuAiJnTxXBxXD32KUTUkULe5so8dtcHJXLW2odjfvkQEQGMLPSfRRGGvY05BsXHxNfJr6KaVGvJ1ocgaWPpvS23LII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612646; c=relaxed/simple;
	bh=QQuveKrdIvX29dkM3sz/2QYrmyxDqNTRLbzhCXA+7K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STGW9Iojx5kg/wyq6TnQnPahd4ZvBmhaaauaGIGmCa/rS+lTLXdbsF4ofbGtOv1AzqwVP0MzA2gDs/5d4OCwFpOlzl6MfeZyKR/8CFS0XGrK+89BGnMcHfE52Chtp0Qwr5MtLC8AhBCcDDT500eo2bwbkUArzrX7QNZE24w0kgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3lXRI/1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3lXRI/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612645; x=1778148645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQuveKrdIvX29dkM3sz/2QYrmyxDqNTRLbzhCXA+7K8=;
  b=k3lXRI/1TX450EjZEThbqjRa2OkUfBTk/Qq97kBk9kBflWOqP3qx4kPT
   kpDNdSLtNpdIiyReuZMpNKSflFnpqdEX2+F54OYbo0pmrucnzpT173+4G
   OUf9TsuiRkpOdb9sVBHUs00PzIVc3N9B4LEqB7YTFa4xWHmIYW9UTr+2u
   1Pafa8+N2rDU87+Qgx4WgdA0fcwUX7w2XQgAJeqrONyobGm+5eIOIdVJY
   1pfMGrpzhlNqfKYQGMxLYzS/T4s95XfHWXnTv6rlVsPtUHmCZ1JIQHHNg
   Wy6e5Qmoq0z3HxGCaQHmz3nD3Bf9d3dS48eUxUgtOJCxsbb7KxRyXEn8B
   g==;
X-CSE-ConnectionGUID: Ov1OsEAHSwWayVTR8saEdg==
X-CSE-MsgGUID: j5L8FJgcQGei6PivmkFgkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59685705"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59685705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:10:44 -0700
X-CSE-ConnectionGUID: iRYjX5/AQNGPjGzmGyDFtw==
X-CSE-MsgGUID: 5EiSBSp1SGKSgZ+zHKssUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="139962334"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 03:10:43 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbjc-00009O-1N;
	Wed, 07 May 2025 10:10:40 +0000
Date: Wed, 7 May 2025 18:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 31/47] kernel/irq/manage.c:2651:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202505071809.ajpPxfoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   b8203edb7846253466282425b6009c20a4c85eb8
commit: 7db00b4a32292d301893cacde7226830d9aae6d6 [31/47] genirq/manage: Convert to lock guards
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250507/202505071809.ajpPxfoZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071809.ajpPxfoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071809.ajpPxfoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:2651:3: error: cannot jump from this goto statement to its label
    2651 |                 goto err_irq_setup;
         |                 ^
   kernel/irq/manage.c:2653:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2653 |         guard(raw_spinlock_irqsave)(&desc->lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:122:1: note: expanded from here
     122 | __UNIQUE_ID_guard575
         | ^
   kernel/irq/manage.c:2647:3: error: cannot jump from this goto statement to its label
    2647 |                 goto err_out;
         |                 ^
   kernel/irq/manage.c:2653:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2653 |         guard(raw_spinlock_irqsave)(&desc->lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:122:1: note: expanded from here
     122 | __UNIQUE_ID_guard575
         | ^
   2 errors generated.


vim +2651 kernel/irq/manage.c

1b7047edfcfb25 Marc Zyngier    2015-03-18  2591  
4b078c3f1a2648 Julien Thierry  2019-01-31  2592  /**
4b078c3f1a2648 Julien Thierry  2019-01-31  2593   * request_percpu_nmi - allocate a percpu interrupt line for NMI delivery
4b078c3f1a2648 Julien Thierry  2019-01-31  2594   * @irq:	Interrupt line to allocate
4b078c3f1a2648 Julien Thierry  2019-01-31  2595   * @handler:	Function to be called when the IRQ occurs.
4b078c3f1a2648 Julien Thierry  2019-01-31  2596   * @name:	An ascii name for the claiming device
4b078c3f1a2648 Julien Thierry  2019-01-31  2597   * @dev_id:	A percpu cookie passed back to the handler function
4b078c3f1a2648 Julien Thierry  2019-01-31  2598   *
4b078c3f1a2648 Julien Thierry  2019-01-31  2599   * This call allocates interrupt resources for a per CPU NMI. Per CPU NMIs
a51866946c0aa0 Julien Thierry  2019-02-13  2600   * have to be setup on each CPU by calling prepare_percpu_nmi() before
a51866946c0aa0 Julien Thierry  2019-02-13  2601   * being enabled on the same CPU by using enable_percpu_nmi().
4b078c3f1a2648 Julien Thierry  2019-01-31  2602   *
ee62e6fda10079 Thomas Gleixner 2025-03-13  2603   * @dev_id must be globally unique. It is a per-cpu variable, and the
ee62e6fda10079 Thomas Gleixner 2025-03-13  2604   * handler gets called with the interrupted CPU's instance of that
ee62e6fda10079 Thomas Gleixner 2025-03-13  2605   * variable.
4b078c3f1a2648 Julien Thierry  2019-01-31  2606   *
4b078c3f1a2648 Julien Thierry  2019-01-31  2607   * Interrupt lines requested for NMI delivering should have auto enabling
4b078c3f1a2648 Julien Thierry  2019-01-31  2608   * setting disabled.
4b078c3f1a2648 Julien Thierry  2019-01-31  2609   *
4b078c3f1a2648 Julien Thierry  2019-01-31  2610   * If the interrupt line cannot be used to deliver NMIs, function
4b078c3f1a2648 Julien Thierry  2019-01-31  2611   * will fail returning a negative value.
4b078c3f1a2648 Julien Thierry  2019-01-31  2612   */
4b078c3f1a2648 Julien Thierry  2019-01-31  2613  int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
4b078c3f1a2648 Julien Thierry  2019-01-31  2614  		       const char *name, void __percpu *dev_id)
4b078c3f1a2648 Julien Thierry  2019-01-31  2615  {
4b078c3f1a2648 Julien Thierry  2019-01-31  2616  	struct irqaction *action;
4b078c3f1a2648 Julien Thierry  2019-01-31  2617  	struct irq_desc *desc;
4b078c3f1a2648 Julien Thierry  2019-01-31  2618  	int retval;
4b078c3f1a2648 Julien Thierry  2019-01-31  2619  
4b078c3f1a2648 Julien Thierry  2019-01-31  2620  	if (!handler)
4b078c3f1a2648 Julien Thierry  2019-01-31  2621  		return -EINVAL;
4b078c3f1a2648 Julien Thierry  2019-01-31  2622  
4b078c3f1a2648 Julien Thierry  2019-01-31  2623  	desc = irq_to_desc(irq);
4b078c3f1a2648 Julien Thierry  2019-01-31  2624  
4b078c3f1a2648 Julien Thierry  2019-01-31  2625  	if (!desc || !irq_settings_can_request(desc) ||
4b078c3f1a2648 Julien Thierry  2019-01-31  2626  	    !irq_settings_is_per_cpu_devid(desc) ||
4b078c3f1a2648 Julien Thierry  2019-01-31  2627  	    irq_settings_can_autoenable(desc) ||
4b078c3f1a2648 Julien Thierry  2019-01-31  2628  	    !irq_supports_nmi(desc))
4b078c3f1a2648 Julien Thierry  2019-01-31  2629  		return -EINVAL;
4b078c3f1a2648 Julien Thierry  2019-01-31  2630  
4b078c3f1a2648 Julien Thierry  2019-01-31  2631  	/* The line cannot already be NMI */
6678ae1918ff55 Jinjie Ruan     2024-04-23  2632  	if (irq_is_nmi(desc))
4b078c3f1a2648 Julien Thierry  2019-01-31  2633  		return -EINVAL;
4b078c3f1a2648 Julien Thierry  2019-01-31  2634  
4b078c3f1a2648 Julien Thierry  2019-01-31  2635  	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
4b078c3f1a2648 Julien Thierry  2019-01-31  2636  	if (!action)
4b078c3f1a2648 Julien Thierry  2019-01-31  2637  		return -ENOMEM;
4b078c3f1a2648 Julien Thierry  2019-01-31  2638  
4b078c3f1a2648 Julien Thierry  2019-01-31  2639  	action->handler = handler;
4b078c3f1a2648 Julien Thierry  2019-01-31  2640  	action->flags = IRQF_PERCPU | IRQF_NO_SUSPEND | IRQF_NO_THREAD
4b078c3f1a2648 Julien Thierry  2019-01-31  2641  		| IRQF_NOBALANCING;
4b078c3f1a2648 Julien Thierry  2019-01-31  2642  	action->name = name;
4b078c3f1a2648 Julien Thierry  2019-01-31  2643  	action->percpu_dev_id = dev_id;
4b078c3f1a2648 Julien Thierry  2019-01-31  2644  
4b078c3f1a2648 Julien Thierry  2019-01-31  2645  	retval = irq_chip_pm_get(&desc->irq_data);
4b078c3f1a2648 Julien Thierry  2019-01-31  2646  	if (retval < 0)
4b078c3f1a2648 Julien Thierry  2019-01-31  2647  		goto err_out;
4b078c3f1a2648 Julien Thierry  2019-01-31  2648  
4b078c3f1a2648 Julien Thierry  2019-01-31  2649  	retval = __setup_irq(irq, desc, action);
4b078c3f1a2648 Julien Thierry  2019-01-31  2650  	if (retval)
4b078c3f1a2648 Julien Thierry  2019-01-31 @2651  		goto err_irq_setup;
4b078c3f1a2648 Julien Thierry  2019-01-31  2652  
7db00b4a32292d Thomas Gleixner 2025-03-13  2653  	guard(raw_spinlock_irqsave)(&desc->lock);
4b078c3f1a2648 Julien Thierry  2019-01-31  2654  	desc->istate |= IRQS_NMI;
4b078c3f1a2648 Julien Thierry  2019-01-31  2655  	return 0;
4b078c3f1a2648 Julien Thierry  2019-01-31  2656  
4b078c3f1a2648 Julien Thierry  2019-01-31  2657  err_irq_setup:
4b078c3f1a2648 Julien Thierry  2019-01-31  2658  	irq_chip_pm_put(&desc->irq_data);
4b078c3f1a2648 Julien Thierry  2019-01-31  2659  err_out:
4b078c3f1a2648 Julien Thierry  2019-01-31  2660  	kfree(action);
4b078c3f1a2648 Julien Thierry  2019-01-31  2661  
4b078c3f1a2648 Julien Thierry  2019-01-31  2662  	return retval;
4b078c3f1a2648 Julien Thierry  2019-01-31  2663  }
4b078c3f1a2648 Julien Thierry  2019-01-31  2664  

:::::: The code at line 2651 was first introduced by commit
:::::: 4b078c3f1a26487c39363089ba0d5c6b09f2a89f genirq: Provide NMI management for percpu_devid interrupts

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
