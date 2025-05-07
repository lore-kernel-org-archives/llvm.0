Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535620F09A;
	Wed,  7 May 2025 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607138; cv=none; b=iMzLAlJEoVzxDDi/1Q3X8PoHq+hhX53aRxUXOa/l4GDMqNjQdId4neWm9ADLkrpsTKzuntgW30syPuAbAeXdI+xvMQfyj1OePYS/qL6FKQcIw3JXqVm+JPdw2y2kMOCcFK+AJdcinQLOzFBSa8mNtzPclvwLfBw2ShbXB4imW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607138; c=relaxed/simple;
	bh=Snd0wkSnZnhVXjWzUJSbm+GuJ/pgit7McFGo4WJceXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pIQ11SpIxkPOmrJlpGy/SWe7DniUDrjskui/RXK656FpzXCpDmdLjQKgqfKslju1pPl+CUOErF3tR/82rco7/wxRNFQKgvGmYlOYkASB5yJb7TS6RjmOfyD+lTzFe3U9aioSy2guE1HsRR/8gn9+kUryn2j36+KUdEITCDK3ND0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApJGjHeY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApJGjHeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746607136; x=1778143136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Snd0wkSnZnhVXjWzUJSbm+GuJ/pgit7McFGo4WJceXo=;
  b=ApJGjHeYfW3zXM6ndeYhqcRQGDvliTXYAw8LM1QjOxnfAmmbvEdToCSt
   JBNGQjGrWhhp32Nj0MVelvPID9j30Ed0n625qkTHEQlIIpNyl6aBNQtVT
   icX3qJLFtr0Wg1Z2AcxkqjaXJu1ZFifTpv/P32N6SuT71VqAci6z2VAPW
   r7B9fxuacVKMGz/R/F/VUpTL+1Ajv78d0BaMJsE4ZKzTIlDUqDzB0taa6
   /oVpUnDPrPvVeAkqdeDG4X9S11XT3IPcUiM8730tTlurX+c07G6gTDWWg
   rXfWvE7hxhI5JIsb3NIXl2xY8XCPZEMGq/f/+HHkMgyTDxLYPN70AiZFB
   g==;
X-CSE-ConnectionGUID: 8aqDKkm4SW2XHJcTgKIKtA==
X-CSE-MsgGUID: 02DLg2EkQPyjIJX3PGA1jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48335016"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48335016"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:38:55 -0700
X-CSE-ConnectionGUID: koY5pgF3RoW5D+Psn0n7Jw==
X-CSE-MsgGUID: WmNkc8cwQUGr7JGL7Td2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="141007273"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 01:38:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaIl-0007QR-19;
	Wed, 07 May 2025 08:38:51 +0000
Date: Wed, 7 May 2025 16:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 31/47] kernel/irq/manage.c:2651:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202505071620.Cn0x5EZu-lkp@intel.com>
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
commit: 936031eb6f97c198231aa2de74c052c5c06b3177 [31/47] genirq/manage: Convert to lock guards
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071620.Cn0x5EZu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071620.Cn0x5EZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071620.Cn0x5EZu-lkp@intel.com/

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
   <scratch space>:96:1: note: expanded from here
      96 | __UNIQUE_ID_guard270
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
   <scratch space>:96:1: note: expanded from here
      96 | __UNIQUE_ID_guard270
         | ^
   2 errors generated.


vim +2651 kernel/irq/manage.c

1b7047edfcfb257 Marc Zyngier    2015-03-18  2591  
4b078c3f1a26487 Julien Thierry  2019-01-31  2592  /**
4b078c3f1a26487 Julien Thierry  2019-01-31  2593   * request_percpu_nmi - allocate a percpu interrupt line for NMI delivery
4b078c3f1a26487 Julien Thierry  2019-01-31  2594   * @irq:	Interrupt line to allocate
4b078c3f1a26487 Julien Thierry  2019-01-31  2595   * @handler:	Function to be called when the IRQ occurs.
4b078c3f1a26487 Julien Thierry  2019-01-31  2596   * @name:	An ascii name for the claiming device
4b078c3f1a26487 Julien Thierry  2019-01-31  2597   * @dev_id:	A percpu cookie passed back to the handler function
4b078c3f1a26487 Julien Thierry  2019-01-31  2598   *
4b078c3f1a26487 Julien Thierry  2019-01-31  2599   * This call allocates interrupt resources for a per CPU NMI. Per CPU NMIs
a51866946c0aa0b Julien Thierry  2019-02-13  2600   * have to be setup on each CPU by calling prepare_percpu_nmi() before
a51866946c0aa0b Julien Thierry  2019-02-13  2601   * being enabled on the same CPU by using enable_percpu_nmi().
4b078c3f1a26487 Julien Thierry  2019-01-31  2602   *
38caf05690922d5 Thomas Gleixner 2025-03-13  2603   * @dev_id must be globally unique. It is a per-cpu variable, and the
38caf05690922d5 Thomas Gleixner 2025-03-13  2604   * handler gets called with the interrupted CPU's instance of that
38caf05690922d5 Thomas Gleixner 2025-03-13  2605   * variable.
4b078c3f1a26487 Julien Thierry  2019-01-31  2606   *
4b078c3f1a26487 Julien Thierry  2019-01-31  2607   * Interrupt lines requested for NMI delivering should have auto enabling
4b078c3f1a26487 Julien Thierry  2019-01-31  2608   * setting disabled.
4b078c3f1a26487 Julien Thierry  2019-01-31  2609   *
4b078c3f1a26487 Julien Thierry  2019-01-31  2610   * If the interrupt line cannot be used to deliver NMIs, function
4b078c3f1a26487 Julien Thierry  2019-01-31  2611   * will fail returning a negative value.
4b078c3f1a26487 Julien Thierry  2019-01-31  2612   */
4b078c3f1a26487 Julien Thierry  2019-01-31  2613  int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
4b078c3f1a26487 Julien Thierry  2019-01-31  2614  		       const char *name, void __percpu *dev_id)
4b078c3f1a26487 Julien Thierry  2019-01-31  2615  {
4b078c3f1a26487 Julien Thierry  2019-01-31  2616  	struct irqaction *action;
4b078c3f1a26487 Julien Thierry  2019-01-31  2617  	struct irq_desc *desc;
4b078c3f1a26487 Julien Thierry  2019-01-31  2618  	int retval;
4b078c3f1a26487 Julien Thierry  2019-01-31  2619  
4b078c3f1a26487 Julien Thierry  2019-01-31  2620  	if (!handler)
4b078c3f1a26487 Julien Thierry  2019-01-31  2621  		return -EINVAL;
4b078c3f1a26487 Julien Thierry  2019-01-31  2622  
4b078c3f1a26487 Julien Thierry  2019-01-31  2623  	desc = irq_to_desc(irq);
4b078c3f1a26487 Julien Thierry  2019-01-31  2624  
4b078c3f1a26487 Julien Thierry  2019-01-31  2625  	if (!desc || !irq_settings_can_request(desc) ||
4b078c3f1a26487 Julien Thierry  2019-01-31  2626  	    !irq_settings_is_per_cpu_devid(desc) ||
4b078c3f1a26487 Julien Thierry  2019-01-31  2627  	    irq_settings_can_autoenable(desc) ||
4b078c3f1a26487 Julien Thierry  2019-01-31  2628  	    !irq_supports_nmi(desc))
4b078c3f1a26487 Julien Thierry  2019-01-31  2629  		return -EINVAL;
4b078c3f1a26487 Julien Thierry  2019-01-31  2630  
4b078c3f1a26487 Julien Thierry  2019-01-31  2631  	/* The line cannot already be NMI */
6678ae1918ff554 Jinjie Ruan     2024-04-23  2632  	if (irq_is_nmi(desc))
4b078c3f1a26487 Julien Thierry  2019-01-31  2633  		return -EINVAL;
4b078c3f1a26487 Julien Thierry  2019-01-31  2634  
4b078c3f1a26487 Julien Thierry  2019-01-31  2635  	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
4b078c3f1a26487 Julien Thierry  2019-01-31  2636  	if (!action)
4b078c3f1a26487 Julien Thierry  2019-01-31  2637  		return -ENOMEM;
4b078c3f1a26487 Julien Thierry  2019-01-31  2638  
4b078c3f1a26487 Julien Thierry  2019-01-31  2639  	action->handler = handler;
4b078c3f1a26487 Julien Thierry  2019-01-31  2640  	action->flags = IRQF_PERCPU | IRQF_NO_SUSPEND | IRQF_NO_THREAD
4b078c3f1a26487 Julien Thierry  2019-01-31  2641  		| IRQF_NOBALANCING;
4b078c3f1a26487 Julien Thierry  2019-01-31  2642  	action->name = name;
4b078c3f1a26487 Julien Thierry  2019-01-31  2643  	action->percpu_dev_id = dev_id;
4b078c3f1a26487 Julien Thierry  2019-01-31  2644  
4b078c3f1a26487 Julien Thierry  2019-01-31  2645  	retval = irq_chip_pm_get(&desc->irq_data);
4b078c3f1a26487 Julien Thierry  2019-01-31  2646  	if (retval < 0)
4b078c3f1a26487 Julien Thierry  2019-01-31  2647  		goto err_out;
4b078c3f1a26487 Julien Thierry  2019-01-31  2648  
4b078c3f1a26487 Julien Thierry  2019-01-31  2649  	retval = __setup_irq(irq, desc, action);
4b078c3f1a26487 Julien Thierry  2019-01-31  2650  	if (retval)
4b078c3f1a26487 Julien Thierry  2019-01-31 @2651  		goto err_irq_setup;
4b078c3f1a26487 Julien Thierry  2019-01-31  2652  
936031eb6f97c19 Thomas Gleixner 2025-03-13  2653  	guard(raw_spinlock_irqsave)(&desc->lock);
4b078c3f1a26487 Julien Thierry  2019-01-31  2654  	desc->istate |= IRQS_NMI;
4b078c3f1a26487 Julien Thierry  2019-01-31  2655  	return 0;
4b078c3f1a26487 Julien Thierry  2019-01-31  2656  
4b078c3f1a26487 Julien Thierry  2019-01-31  2657  err_irq_setup:
4b078c3f1a26487 Julien Thierry  2019-01-31  2658  	irq_chip_pm_put(&desc->irq_data);
4b078c3f1a26487 Julien Thierry  2019-01-31  2659  err_out:
4b078c3f1a26487 Julien Thierry  2019-01-31  2660  	kfree(action);
4b078c3f1a26487 Julien Thierry  2019-01-31  2661  
4b078c3f1a26487 Julien Thierry  2019-01-31  2662  	return retval;
4b078c3f1a26487 Julien Thierry  2019-01-31  2663  }
4b078c3f1a26487 Julien Thierry  2019-01-31  2664  

:::::: The code at line 2651 was first introduced by commit
:::::: 4b078c3f1a26487c39363089ba0d5c6b09f2a89f genirq: Provide NMI management for percpu_devid interrupts

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
