Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC942EAFF;
	Thu, 19 Oct 2023 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVCyLCsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697745571; x=1729281571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kqe67uRvu2IwQQgejNjoiziKr0XZYQQ4fkgtkOWJGBQ=;
  b=VVCyLCszzRO3xkh6XcQSX3Fg774V+gM9DDXL86WnLKf7o1J2NFnZJ6Ek
   04mzksw17bpDgeS656RMEIHXkjywDFETSnzHZsnaSyrw5tx0uVU+L5KFZ
   oZ5ZHLSxeqnWo0lQiHWX1kdmCijKoCVMAqX3kVe6N72/8z/xJIO1vMQZj
   EyT6KNzOnXBy41aNCR1BwDQS0KtdZ0Rn3e6cPv/FW9h+GQfOCJHQeX0is
   OwoAhZsEDXbhcQS2lA3wPdPyZQjifqfjpDRQeq36Vj+iqItW4IzyNrWw8
   QC3jRlGKvyyOnlBJ8L/AxxABjStfZCn5fAEF2xN0nTvN+esRJ/Gy0N10e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386178723"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386178723"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 12:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750650656"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="750650656"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 12:59:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtZAz-0002Xs-20;
	Thu, 19 Oct 2023 19:59:25 +0000
Date: Fri, 20 Oct 2023 03:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:host-upstream-wip 21/24] drivers/acpi/sleep.c:600:8:
 error: use of undeclared identifier 'acpi_suspend_lowlevel'; did you mean
 'acpi_set_suspend_lowlevel'?
Message-ID: <202310200316.MHNJkSlG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kai,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/tdx.git host-upstream-wip
head:   4a933b5b72651711967d2a5b3cfeca8d19cc9935
commit: d7d589a0625432361e8b952682ee2177d0dad677 [21/24] x86/acpi: Add a helper to override ACPI lowlevel suspend function
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231020/202310200316.MHNJkSlG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200316.MHNJkSlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200316.MHNJkSlG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/sleep.c:600:8: error: use of undeclared identifier 'acpi_suspend_lowlevel'; did you mean 'acpi_set_suspend_lowlevel'?
                   if (!acpi_suspend_lowlevel)
                        ^~~~~~~~~~~~~~~~~~~~~
                        acpi_set_suspend_lowlevel
   arch/x86/include/asm/acpi.h:64:6: note: 'acpi_set_suspend_lowlevel' declared here
   void acpi_set_suspend_lowlevel(int (*suspend_lowlevel)(void));
        ^
   drivers/acpi/sleep.c:600:8: warning: address of function 'acpi_set_suspend_lowlevel' will always evaluate to 'true' [-Wpointer-bool-conversion]
                   if (!acpi_suspend_lowlevel)
                       ~^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/sleep.c:600:8: note: prefix with the address-of operator to silence this warning
                   if (!acpi_suspend_lowlevel)
                        ^
                        &
>> drivers/acpi/sleep.c:602:11: error: call to undeclared function 'acpi_suspend_lowlevel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   error = acpi_suspend_lowlevel();
                           ^
   drivers/acpi/sleep.c:602:11: note: did you mean 'acpi_set_suspend_lowlevel'?
   arch/x86/include/asm/acpi.h:64:6: note: 'acpi_set_suspend_lowlevel' declared here
   void acpi_set_suspend_lowlevel(int (*suspend_lowlevel)(void));
        ^
   1 warning and 2 errors generated.


vim +600 drivers/acpi/sleep.c

e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  577  
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  578  /**
2c6e33c366bff2 drivers/acpi/sleep/main.c Len Brown             2008-04-23  579   *	acpi_suspend_enter - Actually enter a sleep state.
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  580   *	@pm_state: ignored
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  581   *
50ad147aa09c82 drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-24  582   *	Flush caches and go to sleep. For STR we have to call arch-specific
50ad147aa09c82 drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-24  583   *	assembly, which in turn call acpi_enter_sleep_state().
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  584   *	It's unfortunate, but it works. Please fix if you're feeling frisky.
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  585   */
2c6e33c366bff2 drivers/acpi/sleep/main.c Len Brown             2008-04-23  586  static int acpi_suspend_enter(suspend_state_t pm_state)
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  587  {
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  588  	acpi_status status = AE_OK;
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  589  	u32 acpi_state = acpi_target_sleep_state;
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  590  	int error;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  591  
bb3632c6101b2f drivers/acpi/sleep.c      Todd E Brandt         2014-06-06  592  	trace_suspend_resume(TPS("acpi_suspend"), acpi_state, true);
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  593  	switch (acpi_state) {
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  594  	case ACPI_STATE_S1:
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  595  		barrier();
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  596  		status = acpi_enter_sleep_state(acpi_state);
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  597  		break;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  598  
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  599  	case ACPI_STATE_S3:
d6a77ead21b69c drivers/acpi/sleep.c      Konrad Rzeszutek Wilk 2013-05-14 @600  		if (!acpi_suspend_lowlevel)
d6a77ead21b69c drivers/acpi/sleep.c      Konrad Rzeszutek Wilk 2013-05-14  601  			return -ENOSYS;
f1a2003e22f6b5 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08 @602  		error = acpi_suspend_lowlevel();
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  603  		if (error)
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  604  			return error;
f5ee87df7a4dab drivers/acpi/sleep.c      Hanjun Guo            2021-06-02  605  		pr_info("Low-level resume complete\n");
ef25ba04760159 drivers/acpi/sleep.c      Rafael J. Wysocki     2015-10-07  606  		pm_set_resume_via_firmware();
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  607  		break;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  608  	}
bb3632c6101b2f drivers/acpi/sleep.c      Todd E Brandt         2014-06-06  609  	trace_suspend_resume(TPS("acpi_suspend"), acpi_state, false);
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  610  
b6dacf63e9fb2e drivers/acpi/sleep.c      Matthew Garrett       2010-05-11  611  	/* This violates the spec but is required for bug compatibility. */
50ffba1bd3120b drivers/acpi/sleep.c      Bob Moore             2009-02-23  612  	acpi_write_bit_register(ACPI_BITREG_SCI_ENABLE, 1);
65df78473ffbf3 drivers/acpi/sleep/main.c Rafael J. Wysocki     2008-11-26  613  
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  614  	/* Reprogram control registers */
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  615  	acpi_leave_sleep_state_prep(acpi_state);
c95d47a868f35c drivers/acpi/sleep/main.c Rafael J. Wysocki     2008-01-08  616  
23b168d425ca0c drivers/acpi/sleep/main.c Pavel Machek          2008-02-05  617  	/* ACPI 3.0 specs (P62) says that it's the responsibility
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  618  	 * of the OSPM to clear the status bit [ implying that the
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  619  	 * POWER_BUTTON event should not reach userspace ]
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  620  	 *
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  621  	 * However, we do generate a small hint for userspace in the form of
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  622  	 * a wakeup event. We flag this condition for now and generate the
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  623  	 * event later, as we're currently too early in resume to be able to
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  624  	 * generate wakeup events.
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  625  	 */
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  626  	if (ACPI_SUCCESS(status) && (acpi_state == ACPI_STATE_S3)) {
51468a9d3a8024 drivers/acpi/sleep.c      Al Stone              2013-11-20  627  		acpi_event_status pwr_btn_status = ACPI_EVENT_FLAG_DISABLED;
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  628  
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  629  		acpi_get_event_status(ACPI_EVENT_POWER_BUTTON, &pwr_btn_status);
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  630  
18864cc4892d20 drivers/acpi/sleep.c      Lv Zheng              2016-08-04  631  		if (pwr_btn_status & ACPI_EVENT_FLAG_STATUS_SET) {
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  632  			acpi_clear_event(ACPI_EVENT_POWER_BUTTON);
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  633  			/* Flag for later */
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  634  			pwr_btn_event_pending = true;
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  635  		}
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  636  	}
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  637  
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  638  	/*
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  639  	 * Disable all GPE and clear their status bits before interrupts are
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  640  	 * enabled. Some GPEs (like wakeup GPEs) have no handlers and this can
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  641  	 * prevent them from producing spurious interrups.
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  642  	 *
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  643  	 * acpi_leave_sleep_state() will reenable specific GPEs later.
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  644  	 *
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  645  	 * Because this code runs on one CPU with disabled interrupts (all of
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  646  	 * the other CPUs are offline at this time), it need not acquire any
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  647  	 * sleeping locks which may trigger an implicit preemption point even
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  648  	 * if there is no contention, so avoid doing that by using a low-level
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  649  	 * library routine here.
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  650  	 */
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  651  	acpi_hw_disable_all_gpes();
d5a64513c6a171 drivers/acpi/sleep.c      Rafael J. Wysocki     2010-04-09  652  	/* Allow EC transactions to happen. */
c2b46d679b30c5 drivers/acpi/sleep.c      Lv Zheng              2016-08-03  653  	acpi_ec_unblock_transactions();
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  654  
2a6b69765ad794 drivers/acpi/sleep.c      Matthew Garrett       2010-05-28  655  	suspend_nvs_restore();
2a6b69765ad794 drivers/acpi/sleep.c      Matthew Garrett       2010-05-28  656  
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  657  	return ACPI_SUCCESS(status) ? 0 : -EFAULT;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  658  }
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  659  

:::::: The code at line 600 was first introduced by commit
:::::: d6a77ead21b69c395ca6d09a066ededfac601bcc x86 / ACPI / sleep: Provide registration for acpi_suspend_lowlevel.

:::::: TO: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
