Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3C2459D0;
	Wed, 12 Mar 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741787841; cv=none; b=ZbwC7sldYiQbnuBimBNSQX664VTuLOFEDClN9JMc9EYdArva563lC3B4tU28Lqn2e9dJBICdPBSfN/ZbM/24aEZlS8hh1gEzXdrCLLsjHFyBhl8zZgbKE6OAjkqY8M4kDITgfPuFOP2Aa5IIyAJ29dWsUz8gHKsX4TcGV1UAUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741787841; c=relaxed/simple;
	bh=T241Suqgt0T6c17tGqiZew6lZtKA4CHhOKGwwEc8QZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixEM3MY/nkme3LvIIUUHkRdpqO750ngD9pZwwsZcKT8PGBodHbIWFM/1G/xwY0plBZvJFEAks9KmDllj3+Rw+eAzBCzSLDBZvVZ1QHTo5KDPhO8HNTtIRitmirJ/8GE5uLT+rZ4epFKsVpwzf1NC2MZpL+hYIYO8n8triKAhP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxBcfsAx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxBcfsAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741787840; x=1773323840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T241Suqgt0T6c17tGqiZew6lZtKA4CHhOKGwwEc8QZY=;
  b=cxBcfsAxy15/Qdrnx8rUE7DDxiDE7cY9Sjtd5XnFySqxBWTk2mPNHEK8
   LpbiSeAncNf65hWcp3Mu/WJ2gXqB000wGeThtzW82jIDslYUNZefu+VWt
   cZLrDlzRGbmHeDIupCulJvjk83JFGgobKqDAEQP9F77eI0pFazsZzdyNr
   Vxo/ZMsUIMEQBgnKl6H5vQQNo0dagb6adg5bUI0a/e4t+KoqPAZHZJkhG
   THb/F4Dw/zMesQDB0sgwXRp3UtIo1WQUACYpEYWoYGEKzGrWQjAy9HnLq
   V//lAAXi33Z9aLtOdHVTQAsHoEqoDUYIHqy1cte/7R0nvqF0spAIw6wil
   A==;
X-CSE-ConnectionGUID: NO5m2StSQv6pzZl7bCAg4w==
X-CSE-MsgGUID: zPOlNcJYQMqk0dYfduhrMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53858354"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53858354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:57:17 -0700
X-CSE-ConnectionGUID: oaYccqkYT3mUjn9w2uH67g==
X-CSE-MsgGUID: HTt65qVsSjuAHTzSX5kXNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="124803478"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 06:57:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsMa9-0008am-0H;
	Wed, 12 Mar 2025 13:57:13 +0000
Date: Wed, 12 Mar 2025 21:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 37/53] kernel/irq/manage.c:2308:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202503130042.qOd4b2Bi-lkp@intel.com>
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
head:   369c4f7fd7564a8952129a147cacf88cb4697c79
commit: 1281dce4094964cbfdeb58e04881f04fc2d97c58 [37/53] genirq/manage: Convert to lock guards
config: s390-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130042.qOd4b2Bi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130042.qOd4b2Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130042.qOd4b2Bi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:2308:3: error: cannot jump from this goto statement to its label
                   goto err_irq_setup;
                   ^
   kernel/irq/manage.c:2310:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           guard(raw_spinlock_irqsave)(&desc->lock);
           ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:69:1: note: expanded from here
   __UNIQUE_ID_guard587
   ^
   kernel/irq/manage.c:2304:3: error: cannot jump from this goto statement to its label
                   goto err_out;
                   ^
   kernel/irq/manage.c:2310:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           guard(raw_spinlock_irqsave)(&desc->lock);
           ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:69:1: note: expanded from here
   __UNIQUE_ID_guard587
   ^
   kernel/irq/manage.c:2649:3: error: cannot jump from this goto statement to its label
                   goto err_irq_setup;
                   ^
   kernel/irq/manage.c:2651:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           guard(raw_spinlock_irqsave)(&desc->lock);
           ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:12:1: note: expanded from here
   __UNIQUE_ID_guard594
   ^
   kernel/irq/manage.c:2645:3: error: cannot jump from this goto statement to its label
                   goto err_out;
                   ^
   kernel/irq/manage.c:2651:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           guard(raw_spinlock_irqsave)(&desc->lock);
           ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:12:1: note: expanded from here
   __UNIQUE_ID_guard594
   ^
   4 errors generated.


vim +2308 kernel/irq/manage.c

31d9d9b6d83030f Marc Zyngier    2011-09-23  2238  
b525903c254dab2 Julien Thierry  2019-01-31  2239  /**
b525903c254dab2 Julien Thierry  2019-01-31  2240   * request_nmi - allocate an interrupt line for NMI delivery
b525903c254dab2 Julien Thierry  2019-01-31  2241   * @irq:	Interrupt line to allocate
b525903c254dab2 Julien Thierry  2019-01-31  2242   * @handler:	Function to be called when the IRQ occurs.
b525903c254dab2 Julien Thierry  2019-01-31  2243   *		Threaded handler for threaded interrupts.
b525903c254dab2 Julien Thierry  2019-01-31  2244   * @irqflags:	Interrupt type flags
b525903c254dab2 Julien Thierry  2019-01-31  2245   * @name:	An ascii name for the claiming device
b525903c254dab2 Julien Thierry  2019-01-31  2246   * @dev_id:	A cookie passed back to the handler function
b525903c254dab2 Julien Thierry  2019-01-31  2247   *
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2248   * This call allocates interrupt resources and enables the interrupt line
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2249   * and IRQ handling. It sets up the IRQ line to be handled as an NMI.
b525903c254dab2 Julien Thierry  2019-01-31  2250   *
b525903c254dab2 Julien Thierry  2019-01-31  2251   * An interrupt line delivering NMIs cannot be shared and IRQ handling
b525903c254dab2 Julien Thierry  2019-01-31  2252   * cannot be threaded.
b525903c254dab2 Julien Thierry  2019-01-31  2253   *
b525903c254dab2 Julien Thierry  2019-01-31  2254   * Interrupt lines requested for NMI delivering must produce per cpu
b525903c254dab2 Julien Thierry  2019-01-31  2255   * interrupts and have auto enabling setting disabled.
b525903c254dab2 Julien Thierry  2019-01-31  2256   *
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2257   * @dev_id must be globally unique. Normally the address of the device data
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2258   * structure is used as the cookie. Since the handler receives this value
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2259   * it makes sense to use it.
b525903c254dab2 Julien Thierry  2019-01-31  2260   *
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2261   * If the interrupt line cannot be used to deliver NMIs, function will fail
80e8fd5021f6afb Thomas Gleixner 2025-03-11  2262   * and return a negative value.
b525903c254dab2 Julien Thierry  2019-01-31  2263   */
b525903c254dab2 Julien Thierry  2019-01-31  2264  int request_nmi(unsigned int irq, irq_handler_t handler,
b525903c254dab2 Julien Thierry  2019-01-31  2265  		unsigned long irqflags, const char *name, void *dev_id)
b525903c254dab2 Julien Thierry  2019-01-31  2266  {
b525903c254dab2 Julien Thierry  2019-01-31  2267  	struct irqaction *action;
b525903c254dab2 Julien Thierry  2019-01-31  2268  	struct irq_desc *desc;
b525903c254dab2 Julien Thierry  2019-01-31  2269  	int retval;
b525903c254dab2 Julien Thierry  2019-01-31  2270  
b525903c254dab2 Julien Thierry  2019-01-31  2271  	if (irq == IRQ_NOTCONNECTED)
b525903c254dab2 Julien Thierry  2019-01-31  2272  		return -ENOTCONN;
b525903c254dab2 Julien Thierry  2019-01-31  2273  
b525903c254dab2 Julien Thierry  2019-01-31  2274  	/* NMI cannot be shared, used for Polling */
b525903c254dab2 Julien Thierry  2019-01-31  2275  	if (irqflags & (IRQF_SHARED | IRQF_COND_SUSPEND | IRQF_IRQPOLL))
b525903c254dab2 Julien Thierry  2019-01-31  2276  		return -EINVAL;
b525903c254dab2 Julien Thierry  2019-01-31  2277  
b525903c254dab2 Julien Thierry  2019-01-31  2278  	if (!(irqflags & IRQF_PERCPU))
b525903c254dab2 Julien Thierry  2019-01-31  2279  		return -EINVAL;
b525903c254dab2 Julien Thierry  2019-01-31  2280  
b525903c254dab2 Julien Thierry  2019-01-31  2281  	if (!handler)
b525903c254dab2 Julien Thierry  2019-01-31  2282  		return -EINVAL;
b525903c254dab2 Julien Thierry  2019-01-31  2283  
b525903c254dab2 Julien Thierry  2019-01-31  2284  	desc = irq_to_desc(irq);
b525903c254dab2 Julien Thierry  2019-01-31  2285  
cbe16f35bee6880 Barry Song      2021-03-03  2286  	if (!desc || (irq_settings_can_autoenable(desc) &&
cbe16f35bee6880 Barry Song      2021-03-03  2287  	    !(irqflags & IRQF_NO_AUTOEN)) ||
b525903c254dab2 Julien Thierry  2019-01-31  2288  	    !irq_settings_can_request(desc) ||
b525903c254dab2 Julien Thierry  2019-01-31  2289  	    WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
b525903c254dab2 Julien Thierry  2019-01-31  2290  	    !irq_supports_nmi(desc))
b525903c254dab2 Julien Thierry  2019-01-31  2291  		return -EINVAL;
b525903c254dab2 Julien Thierry  2019-01-31  2292  
b525903c254dab2 Julien Thierry  2019-01-31  2293  	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
b525903c254dab2 Julien Thierry  2019-01-31  2294  	if (!action)
b525903c254dab2 Julien Thierry  2019-01-31  2295  		return -ENOMEM;
b525903c254dab2 Julien Thierry  2019-01-31  2296  
b525903c254dab2 Julien Thierry  2019-01-31  2297  	action->handler = handler;
b525903c254dab2 Julien Thierry  2019-01-31  2298  	action->flags = irqflags | IRQF_NO_THREAD | IRQF_NOBALANCING;
b525903c254dab2 Julien Thierry  2019-01-31  2299  	action->name = name;
b525903c254dab2 Julien Thierry  2019-01-31  2300  	action->dev_id = dev_id;
b525903c254dab2 Julien Thierry  2019-01-31  2301  
b525903c254dab2 Julien Thierry  2019-01-31  2302  	retval = irq_chip_pm_get(&desc->irq_data);
b525903c254dab2 Julien Thierry  2019-01-31  2303  	if (retval < 0)
b525903c254dab2 Julien Thierry  2019-01-31  2304  		goto err_out;
b525903c254dab2 Julien Thierry  2019-01-31  2305  
b525903c254dab2 Julien Thierry  2019-01-31  2306  	retval = __setup_irq(irq, desc, action);
b525903c254dab2 Julien Thierry  2019-01-31  2307  	if (retval)
b525903c254dab2 Julien Thierry  2019-01-31 @2308  		goto err_irq_setup;
b525903c254dab2 Julien Thierry  2019-01-31  2309  
1281dce4094964c Thomas Gleixner 2025-03-11  2310  	guard(raw_spinlock_irqsave)(&desc->lock);
b525903c254dab2 Julien Thierry  2019-01-31  2311  
b525903c254dab2 Julien Thierry  2019-01-31  2312  	/* Setup NMI state */
b525903c254dab2 Julien Thierry  2019-01-31  2313  	desc->istate |= IRQS_NMI;
b525903c254dab2 Julien Thierry  2019-01-31  2314  	retval = irq_nmi_setup(desc);
b525903c254dab2 Julien Thierry  2019-01-31  2315  	if (retval) {
b525903c254dab2 Julien Thierry  2019-01-31  2316  		__cleanup_nmi(irq, desc);
b525903c254dab2 Julien Thierry  2019-01-31  2317  		return -EINVAL;
b525903c254dab2 Julien Thierry  2019-01-31  2318  	}
b525903c254dab2 Julien Thierry  2019-01-31  2319  	return 0;
b525903c254dab2 Julien Thierry  2019-01-31  2320  
b525903c254dab2 Julien Thierry  2019-01-31  2321  err_irq_setup:
b525903c254dab2 Julien Thierry  2019-01-31  2322  	irq_chip_pm_put(&desc->irq_data);
b525903c254dab2 Julien Thierry  2019-01-31  2323  err_out:
b525903c254dab2 Julien Thierry  2019-01-31  2324  	kfree(action);
b525903c254dab2 Julien Thierry  2019-01-31  2325  
b525903c254dab2 Julien Thierry  2019-01-31  2326  	return retval;
b525903c254dab2 Julien Thierry  2019-01-31  2327  }
b525903c254dab2 Julien Thierry  2019-01-31  2328  

:::::: The code at line 2308 was first introduced by commit
:::::: b525903c254dab2491410f0f23707691b7c2c317 genirq: Provide basic NMI management for interrupt lines

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
