Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4116244EAB;
	Wed, 12 Mar 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785986; cv=none; b=cygEPbrPuZyr7l51oyNxfX0livBMONRQ08OLzR7N4xtYKCdi8gLQJ/xRGuGz7AjCYCPRYh1krjUYsVVg5gmed5jvDbGFHa8m/uR6g0mrKOub0tQ7+aC8UcxR0n7lH9zOmEAoc3t7Bz8D87ieeN4WvwAh84f8y4aouXqqa2SsL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785986; c=relaxed/simple;
	bh=HYG0OrNgK9QS19BrXhbN3n68WunZ0lOvuSX0oimImZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPmakHuV2HzF8pWBO3d7fCfrs7qzYrMZqHScjaFlZ0dXp6UFFlqH0/BtGj5dZ8iUz/eoN4YWiT7aUz/RNLmoL160YP/bSA5OqBu9Jl9UHZbGdX7s5yGNpdJWlzSdRxnWndWOIu4XEvc19O/+huy2KfO1jdmL95reqAS3tkugFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atudLA+v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atudLA+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741785984; x=1773321984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYG0OrNgK9QS19BrXhbN3n68WunZ0lOvuSX0oimImZk=;
  b=atudLA+vayiYnPeZCkfsBOZYVpc71t2uAv2UJj+xltqQ88ljQY4AjkGP
   ljClz4zfVri+bCxhwQEl5sUfJZA670PyV/96kZ7bZUpuWa28+hY4wkOAT
   Q6JPc9JvY16C5EXre9ZDRQbTk0Yvwhdz+E7LSj6piMO6Zhc4uhVnWFAYB
   lH3gGFby/8cQFRqGGrf8H73GOJwkYA94FhrXAM6fkqCbvY0mNogBDsirG
   Yp1h2PNuwcJn7APwxHgIi0Qdtqrj0XbuR6yXDoFCIhAWeNrWKKrcoY2YT
   u4ePtr6C6bZhP8NB2lgslokmX+8Cjx4NaUO6d7MbdMOU3d90QuB44Q6Cq
   w==;
X-CSE-ConnectionGUID: wfZI0vywR6yy89r9pY4FxQ==
X-CSE-MsgGUID: aHxbPxcbSQarET/Uczgqeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53067977"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53067977"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:26:22 -0700
X-CSE-ConnectionGUID: LsOUwknqS9ClMPKtRAwtMg==
X-CSE-MsgGUID: gQKTqsUkR0SfiIUh2KwCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121545055"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2025 06:26:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsM6D-0008Z6-26;
	Wed, 12 Mar 2025 13:26:17 +0000
Date: Wed, 12 Mar 2025 21:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 2/53] kernel/irq/generic-chip.c:451:16:
 warning: unused variable 'flags'
Message-ID: <202503122120.fnHjXarc-lkp@intel.com>
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
commit: 6a70c4233a0c6345cca75e6dfa32ae8ebdfab00f [2/53] genirq/generic-chip: Convert core code to lock guards
config: riscv-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122120.fnHjXarc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122120.fnHjXarc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122120.fnHjXarc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/generic-chip.c:451:16: warning: unused variable 'flags' [-Wunused-variable]
     451 |         unsigned long flags;
         |                       ^~~~~
   1 warning generated.


vim +/flags +451 kernel/irq/generic-chip.c

7d8280624797bbe Thomas Gleixner 2011-04-03  439  
ccc414f83914178 Thomas Gleixner 2013-06-28  440  /*
088f40b7b027dad Thomas Gleixner 2013-05-06  441   * irq_map_generic_chip - Map a generic chip for an irq domain
088f40b7b027dad Thomas Gleixner 2013-05-06  442   */
a5152c8a125da3c Boris Brezillon 2014-07-10  443  int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
088f40b7b027dad Thomas Gleixner 2013-05-06  444  			 irq_hw_number_t hw_irq)
088f40b7b027dad Thomas Gleixner 2013-05-06  445  {
c5863484c16b37a Stefan Agner    2015-05-16  446  	struct irq_data *data = irq_domain_get_irq_data(d, virq);
088f40b7b027dad Thomas Gleixner 2013-05-06  447  	struct irq_domain_chip_generic *dgc = d->gc;
088f40b7b027dad Thomas Gleixner 2013-05-06  448  	struct irq_chip_generic *gc;
088f40b7b027dad Thomas Gleixner 2013-05-06  449  	struct irq_chip_type *ct;
088f40b7b027dad Thomas Gleixner 2013-05-06  450  	struct irq_chip *chip;
088f40b7b027dad Thomas Gleixner 2013-05-06 @451  	unsigned long flags;
088f40b7b027dad Thomas Gleixner 2013-05-06  452  	int idx;
088f40b7b027dad Thomas Gleixner 2013-05-06  453  
f0c450eaa364cb7 Sebastian Frias 2016-08-01  454  	gc = __irq_get_domain_generic_chip(d, hw_irq);
f0c450eaa364cb7 Sebastian Frias 2016-08-01  455  	if (IS_ERR(gc))
f0c450eaa364cb7 Sebastian Frias 2016-08-01  456  		return PTR_ERR(gc);
088f40b7b027dad Thomas Gleixner 2013-05-06  457  
088f40b7b027dad Thomas Gleixner 2013-05-06  458  	idx = hw_irq % dgc->irqs_per_chip;
088f40b7b027dad Thomas Gleixner 2013-05-06  459  
e8bd834f7371437 Grant Likely    2013-05-29  460  	if (test_bit(idx, &gc->unused))
e8bd834f7371437 Grant Likely    2013-05-29  461  		return -ENOTSUPP;
e8bd834f7371437 Grant Likely    2013-05-29  462  
088f40b7b027dad Thomas Gleixner 2013-05-06  463  	if (test_bit(idx, &gc->installed))
088f40b7b027dad Thomas Gleixner 2013-05-06  464  		return -EBUSY;
088f40b7b027dad Thomas Gleixner 2013-05-06  465  
088f40b7b027dad Thomas Gleixner 2013-05-06  466  	ct = gc->chip_types;
088f40b7b027dad Thomas Gleixner 2013-05-06  467  	chip = &ct->chip;
088f40b7b027dad Thomas Gleixner 2013-05-06  468  
088f40b7b027dad Thomas Gleixner 2013-05-06  469  	/* We only init the cache for the first mapping of a generic chip */
088f40b7b027dad Thomas Gleixner 2013-05-06  470  	if (!gc->installed) {
6a70c4233a0c634 Thomas Gleixner 2025-03-11  471  		guard(raw_spinlock_irq)(&gc->lock);
088f40b7b027dad Thomas Gleixner 2013-05-06  472  		irq_gc_init_mask_cache(gc, dgc->gc_flags);
088f40b7b027dad Thomas Gleixner 2013-05-06  473  	}
088f40b7b027dad Thomas Gleixner 2013-05-06  474  
088f40b7b027dad Thomas Gleixner 2013-05-06  475  	/* Mark the interrupt as installed */
088f40b7b027dad Thomas Gleixner 2013-05-06  476  	set_bit(idx, &gc->installed);
088f40b7b027dad Thomas Gleixner 2013-05-06  477  
088f40b7b027dad Thomas Gleixner 2013-05-06  478  	if (dgc->gc_flags & IRQ_GC_INIT_NESTED_LOCK)
39c3fd58952d759 Andrew Lunn     2017-12-02  479  		irq_set_lockdep_class(virq, &irq_nested_lock_class,
39c3fd58952d759 Andrew Lunn     2017-12-02  480  				      &irq_nested_request_class);
088f40b7b027dad Thomas Gleixner 2013-05-06  481  
088f40b7b027dad Thomas Gleixner 2013-05-06  482  	if (chip->irq_calc_mask)
088f40b7b027dad Thomas Gleixner 2013-05-06  483  		chip->irq_calc_mask(data);
088f40b7b027dad Thomas Gleixner 2013-05-06  484  	else
088f40b7b027dad Thomas Gleixner 2013-05-06  485  		data->mask = 1 << idx;
088f40b7b027dad Thomas Gleixner 2013-05-06  486  
c5863484c16b37a Stefan Agner    2015-05-16  487  	irq_domain_set_info(d, virq, hw_irq, chip, gc, ct->handler, NULL, NULL);
088f40b7b027dad Thomas Gleixner 2013-05-06  488  	irq_modify_status(virq, dgc->irq_flags_to_clear, dgc->irq_flags_to_set);
088f40b7b027dad Thomas Gleixner 2013-05-06  489  	return 0;
088f40b7b027dad Thomas Gleixner 2013-05-06  490  }
088f40b7b027dad Thomas Gleixner 2013-05-06  491  

:::::: The code at line 451 was first introduced by commit
:::::: 088f40b7b027dad6519712ff224a5798dd62a204 genirq: Generic chip: Add linear irq domain support

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
