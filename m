Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16499214A90;
	Fri, 28 Mar 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162735; cv=none; b=i0XmPtN1ldL0X3M0Jy/YGuqxF+pT87ayRENhg6njW05Q834LKMwWJsQT3q89AXtwZ5FadrilYQZ0Y0lF5Js0YFmX4AuM3Pl68vUx9GamW+SdvpTY9gKO9a2X1NMYfcq9vq7VyB1DjwNIIy9GfDluo6/Tj506xCARYjVlNYD2Xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162735; c=relaxed/simple;
	bh=og9me2UIjvz1buLK89o91k+q4riorp3hweBNmsCxNi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mzm1dIfumEsnjMnVclSrV1hggHEQOF9bj4GYYqIPHZfg2Z4k2/6jnkL14U/FLlcRR48SBxQDMgAV6/t9brTZAapPfjTNSw+/IFQIQ1B8Tia2nQAhlbPGP6rP//ihMx4aXpOIfpDIMovH0rm7Du++E7FIOj9ceFs9Uud8ODS219E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZdWU3PX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZdWU3PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743162734; x=1774698734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=og9me2UIjvz1buLK89o91k+q4riorp3hweBNmsCxNi8=;
  b=kZdWU3PXwpbgZixVgR+w6VD8w6zYyxrdhXbydTC1Q8ul8pmZQa55II8S
   0f4Pdp0nJWQ3s67BXHNFotKdz/RmNQtYZHbbH4s84GQxqW6+fnvgx2gvQ
   gpam2E+C09wv2Zeq9HH+IMpYQyezkTGSAlMj6kyK4XPab2yCO+jUTheAN
   6C3escjCYHASQKvD8+a1sjrJyp1hCGPe3q240YWNJKSIiP9d1IvahK6j0
   YQ2zOidD0xs/YVw4xANtGhnIjK6OP9e2joWHHeLUn7gwPILRpAQcBsyUs
   6/CpihVxh+J4mHjTnRE6YCCoMu/wqEv7MAi1Lhwt3N3YtVMPGuYlC7h25
   Q==;
X-CSE-ConnectionGUID: 6ChJb29HQWaqjXrGODCO3w==
X-CSE-MsgGUID: pEugY33zTtuTazuUG8E0Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66993891"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="66993891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:52:11 -0700
X-CSE-ConnectionGUID: ooAZ/oguQEu6yml4c1rpfQ==
X-CSE-MsgGUID: 9FMHMzzDRzKdDsgOcZI2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125428401"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2025 04:52:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8Fq-0007Pu-36;
	Fri, 28 Mar 2025 11:52:06 +0000
Date: Fri, 28 Mar 2025 19:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17] include/linux/interrupt.h:130:2:
 error: expected member name or ';' after declaration specifiers
Message-ID: <202503281921.2bXEpvLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   e9141d0584201dc14a70533175804e111ab53f36
commit: e9141d0584201dc14a70533175804e111ab53f36 [17/17] WIP
config: hexagon-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281921.2bXEpvLm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281921.2bXEpvLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281921.2bXEpvLm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:15:
>> include/linux/interrupt.h:130:2: error: expected member name or ';' after declaration specifiers
     129 |         cpumask_t               *valid_mask,
         |         ~~~~~~~~~
     130 |         struct irqaction        *next;
         |         ^
>> include/linux/interrupt.h:129:25: error: expected ';' at end of declaration list
     129 |         cpumask_t               *valid_mask,
         |                                             ^
         |                                             ;
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/hexagon/kernel/asm-offsets.s] Error 1 shuffle=1775872522
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare0] Error 2 shuffle=1775872522
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1775872522
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1775872522
   make: Target 'prepare' not remade because of errors.


vim +130 include/linux/interrupt.h

da482792a6d1a3 David Howells   2006-10-05  105  
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  106  /**
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  107   * struct irqaction - per interrupt action descriptor
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  108   * @handler:	interrupt handler function
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  109   * @name:	name of the device
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  110   * @dev_id:	cookie to identify the device
31d9d9b6d83030 Marc Zyngier    2011-09-23  111   * @percpu_dev_id:	cookie to identify the device
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  112   * @next:	pointer to the next irqaction for shared interrupts
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  113   * @irq:	interrupt number
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  114   * @flags:	flags (see IRQF_* above)
25985edcedea63 Lucas De Marchi 2011-03-30  115   * @thread_fn:	interrupt handler function for threaded interrupts
3aa551c9b4c400 Thomas Gleixner 2009-03-23  116   * @thread:	thread pointer for threaded interrupts
2a1d3ab8986d1b Thomas Gleixner 2015-09-21  117   * @secondary:	pointer to secondary irqaction (force threading)
3aa551c9b4c400 Thomas Gleixner 2009-03-23  118   * @thread_flags:	flags related to @thread
b5faba21a6805c Thomas Gleixner 2011-02-23  119   * @thread_mask:	bitmask for keeping track of @thread activity
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  120   * @dir:	pointer to the proc/irq/NN/name entry
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  121   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  122  struct irqaction {
da482792a6d1a3 David Howells   2006-10-05  123  	irq_handler_t		handler;
e9141d0584201d Marc Zyngier    2025-03-26  124  	union {
^1da177e4c3f41 Linus Torvalds  2005-04-16  125  		void		*dev_id;
31d9d9b6d83030 Marc Zyngier    2011-09-23  126  		void __percpu	*percpu_dev_id;
e9141d0584201d Marc Zyngier    2025-03-26  127  		void __percpu	**part_percpu_dev_id;
e9141d0584201d Marc Zyngier    2025-03-26  128  	};
e9141d0584201d Marc Zyngier    2025-03-26 @129  	cpumask_t		*valid_mask,
^1da177e4c3f41 Linus Torvalds  2005-04-16 @130  	struct irqaction	*next;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  131  	irq_handler_t		thread_fn;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  132  	struct task_struct	*thread;
2a1d3ab8986d1b Thomas Gleixner 2015-09-21  133  	struct irqaction	*secondary;
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  134  	unsigned int		irq;
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  135  	unsigned int		flags;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  136  	unsigned long		thread_flags;
b5faba21a6805c Thomas Gleixner 2011-02-23  137  	unsigned long		thread_mask;
f6cd24777513fc Eric Dumazet    2010-11-04  138  	const char		*name;
f6cd24777513fc Eric Dumazet    2010-11-04  139  	struct proc_dir_entry	*dir;
f6cd24777513fc Eric Dumazet    2010-11-04  140  } ____cacheline_internodealigned_in_smp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  141  

:::::: The code at line 130 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
