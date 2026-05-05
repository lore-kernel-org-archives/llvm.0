Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA093D16EA;
	Tue,  5 May 2026 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008838; cv=none; b=PuHB2r45A6PpKPl+i2pcOAdc2lsYNJNfoNfMiKEUWu016TeNPsOL8hSKJqpiXg+PcYUC2W67d/UqwGnT+TDkRqcTekuGiM0AQoKNcMbTp+56YvrrBvP8VaCcEz0QoWsMD0Zcc9fKUYLKG1aWctdZfWVIAz3jlmGgv0hEejMytck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008838; c=relaxed/simple;
	bh=n/UUnUHw5Iof8AByhtnrwA+TqjlvfowV9+9J1FsvFvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b8jDrhsCuPxRN/sg4viEAi7zYOmNGgBF8Jfa2wEVjgpCQ+31tacMSZ4I1Y3ciO9iOF71YeuwwiShebcqwXIJ2zYtKkDKrYFhmtcl/Y1Tej7Ns5+M1oLJR0fswFxdAFrHgZqL3Z5SCNr0W/OwKm+evq7JvezbaWMYh16c2N8zgjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkfBAxh6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkfBAxh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778008836; x=1809544836;
  h=date:from:to:cc:subject:message-id;
  bh=n/UUnUHw5Iof8AByhtnrwA+TqjlvfowV9+9J1FsvFvA=;
  b=OkfBAxh6vfqYt1MVaDVGJM+Ogr8kIKqwCQVJzY1mfvYjhTHvsJZiVyOw
   JYuTSuSVWkCjoHruW+G2Qk4z/P/GITXtxdfyFDLlC95O1kRgLZcBL/JfG
   gAqiSAB0SjFw5YTIPO9cgABcdrdJo3sG96sRfGun7SvKr7U7qRRHW0Dbo
   h6mqQpVNIaY3UGSXztAOVrGFrhjLlo9Edt6D4a5RQHP9Uc+IbQVDDbaCB
   s1HB6d9BOSP1rIfeN0FilHLSeVZjmBnrjf4DCATp3jTaZzooj5S3G3e+V
   y6hFzs05VwQtXLj0Aj8+rXDunS6AFCIHbeT6r0yL2EKpu7IRM5w3xgeb6
   A==;
X-CSE-ConnectionGUID: jHZGN0AvSTKMWqbAcZ04zg==
X-CSE-MsgGUID: 1Pvh+t9SQeeQxZPpG02VrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90349654"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="90349654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:20:34 -0700
X-CSE-ConnectionGUID: ix4uy7kISli1j/KzGtTffQ==
X-CSE-MsgGUID: ZfrCVjRgTi2dUrPxduwoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="235029866"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2026 12:20:29 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKLJi-000000000Oj-1GM1;
	Tue, 05 May 2026 19:20:26 +0000
Date: Wed, 06 May 2026 03:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] arch/arm64/kernel/acpi.c:413:2:
 warning: unused variable 'nesting'
Message-ID: <202605060326.PBJuOKXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   082cc4c201e4450ff9456c9bd093fd70d103595a
commit: 40c3e04e2248c0e5d78d23e6767a1c58d5678eac [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605060326.PBJuOKXs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060326.PBJuOKXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060326.PBJuOKXs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/acpi.c:413:2: warning: unused variable 'nesting' [-Wunused-variable]
     413 |         nmi_exit();
         |         ^~~~~~~~~~
   include/linux/hardirq.h:164:3: note: expanded from macro 'nmi_exit'
     164 |                 __nmi_exit();                                   \
         |                 ^~~~~~~~~~~~
   include/linux/hardirq.h:150:16: note: expanded from macro '__nmi_exit'
     150 |                 unsigned int nesting;                           \
         |                              ^~~~~~~
   1 warning generated.


vim +/nesting +413 arch/arm64/kernel/acpi.c

1583052d111f8ea Ard Biesheuvel   2020-06-26  382  
d44f1b8dd7e66d8 James Morse      2019-01-29  383  /*
d44f1b8dd7e66d8 James Morse      2019-01-29  384   * Claim Synchronous External Aborts as a firmware first notification.
d44f1b8dd7e66d8 James Morse      2019-01-29  385   *
d44f1b8dd7e66d8 James Morse      2019-01-29  386   * Used by KVM and the arch do_sea handler.
d44f1b8dd7e66d8 James Morse      2019-01-29  387   * @regs may be NULL when called from process context.
d44f1b8dd7e66d8 James Morse      2019-01-29  388   */
d44f1b8dd7e66d8 James Morse      2019-01-29  389  int apei_claim_sea(struct pt_regs *regs)
d44f1b8dd7e66d8 James Morse      2019-01-29  390  {
d44f1b8dd7e66d8 James Morse      2019-01-29  391  	int err = -ENOENT;
8fcc4ae6faf8b45 James Morse      2020-05-01  392  	bool return_to_irqs_enabled;
d44f1b8dd7e66d8 James Morse      2019-01-29  393  	unsigned long current_flags;
d44f1b8dd7e66d8 James Morse      2019-01-29  394  
d44f1b8dd7e66d8 James Morse      2019-01-29  395  	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
d44f1b8dd7e66d8 James Morse      2019-01-29  396  		return err;
d44f1b8dd7e66d8 James Morse      2019-01-29  397  
e533dbe9dcb199b Mark Rutland     2020-01-22  398  	current_flags = local_daif_save_flags();
d44f1b8dd7e66d8 James Morse      2019-01-29  399  
8fcc4ae6faf8b45 James Morse      2020-05-01  400  	/* current_flags isn't useful here as daif doesn't tell us about pNMI */
8fcc4ae6faf8b45 James Morse      2020-05-01  401  	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
8fcc4ae6faf8b45 James Morse      2020-05-01  402  
8fcc4ae6faf8b45 James Morse      2020-05-01  403  	if (regs)
788b8f6af60b22f Jinjie Ruan      2025-08-15  404  		return_to_irqs_enabled = !regs_irqs_disabled(regs);
8fcc4ae6faf8b45 James Morse      2020-05-01  405  
d44f1b8dd7e66d8 James Morse      2019-01-29  406  	/*
d44f1b8dd7e66d8 James Morse      2019-01-29  407  	 * SEA can interrupt SError, mask it and describe this as an NMI so
d44f1b8dd7e66d8 James Morse      2019-01-29  408  	 * that APEI defers the handling.
d44f1b8dd7e66d8 James Morse      2019-01-29  409  	 */
d44f1b8dd7e66d8 James Morse      2019-01-29  410  	local_daif_restore(DAIF_ERRCTX);
d44f1b8dd7e66d8 James Morse      2019-01-29  411  	nmi_enter();
d44f1b8dd7e66d8 James Morse      2019-01-29  412  	err = ghes_notify_sea();
d44f1b8dd7e66d8 James Morse      2019-01-29 @413  	nmi_exit();
8fcc4ae6faf8b45 James Morse      2020-05-01  414  
8fcc4ae6faf8b45 James Morse      2020-05-01  415  	/*
8fcc4ae6faf8b45 James Morse      2020-05-01  416  	 * APEI NMI-like notifications are deferred to irq_work. Unless
8fcc4ae6faf8b45 James Morse      2020-05-01  417  	 * we interrupted irqs-masked code, we can do that now.
8fcc4ae6faf8b45 James Morse      2020-05-01  418  	 */
8fcc4ae6faf8b45 James Morse      2020-05-01  419  	if (!err) {
8fcc4ae6faf8b45 James Morse      2020-05-01  420  		if (return_to_irqs_enabled) {
8fcc4ae6faf8b45 James Morse      2020-05-01  421  			local_daif_restore(DAIF_PROCCTX_NOIRQ);
8fcc4ae6faf8b45 James Morse      2020-05-01  422  			__irq_enter();
8fcc4ae6faf8b45 James Morse      2020-05-01  423  			irq_work_run();
8fcc4ae6faf8b45 James Morse      2020-05-01  424  			__irq_exit();
8fcc4ae6faf8b45 James Morse      2020-05-01  425  		} else {
420cab0155033c1 Osama Abdelkader 2025-11-10  426  			pr_warn_ratelimited("APEI work queued but not completed\n");
8fcc4ae6faf8b45 James Morse      2020-05-01  427  			err = -EINPROGRESS;
8fcc4ae6faf8b45 James Morse      2020-05-01  428  		}
8fcc4ae6faf8b45 James Morse      2020-05-01  429  	}
8fcc4ae6faf8b45 James Morse      2020-05-01  430  
d44f1b8dd7e66d8 James Morse      2019-01-29  431  	local_daif_restore(current_flags);
d44f1b8dd7e66d8 James Morse      2019-01-29  432  
d44f1b8dd7e66d8 James Morse      2019-01-29  433  	return err;
d44f1b8dd7e66d8 James Morse      2019-01-29  434  }
a509a66a9d0d4f4 Ard Biesheuvel   2020-09-29  435  

:::::: The code at line 413 was first introduced by commit
:::::: d44f1b8dd7e66d80cc4205809e5ace866bd851da arm64: KVM/mm: Move SEA handling behind a single 'claim' interface

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
