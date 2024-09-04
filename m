Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CC1CCEC2;
	Wed,  4 Sep 2024 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438904; cv=none; b=E7q4eJ3ItY5zTMvKqsfdOkkxHPKJGh41zV8lvUnyslXF26CMfgn9HF388/g5HOJOj7U3VNpofK6YSr1sXqzbBLSr78hFb6aWAqJ/qzeHwJL3LgMcCy2Ummom/QwWNR4LWsw7nhT6BbNQ5b37D1OQ7abWr8OZbH2l/SVw0IOejbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438904; c=relaxed/simple;
	bh=R3wVcA9VHYHoeglK9f9HjbBFuZQCz+14TtUM16JKt48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRkgh5776xcm8SNaFwjIk7bLVJrbM97OMG8cZdtI9gxBLvBuxwiMmL7N52kvZfkn2R9g2ZFTZBp3gA6FBAmCuhwEsQoZgbQCiKBTCRGtv9XjxWPr0VaqiNGMKkYUiEJpxvJKmx6RDbqJeg4f/3r6dg55xj3/ASF9SyflC5WuCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL+Yg4NB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL+Yg4NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725438902; x=1756974902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3wVcA9VHYHoeglK9f9HjbBFuZQCz+14TtUM16JKt48=;
  b=GL+Yg4NBrsvlDUE42rBtCGbHyIX7+6KO5GERbZ9yAiUhYcIEe0YIFCsG
   pMDsbpjVVZwUsmOGthrPqASFCV2J+2NqGarO0XBFtdcn0tFcSKmFW7FRG
   YG8pGk7xHaiNfFyPHXRJhKe7b+UAFNYX2fiFnbZ+4KwM8Mh42aqOnyvIL
   2rzW5g3ro2WRGEmDO4svk5uYphpFBLHB7Zd6q1eJ5vzFM9Xzb1Q9KRr5y
   ++QlBU6/6tgV5f+n8NdG/cZ6YoRNn81+ShBx0/kU5GKjlaPaJ5Xp/ahri
   +gtYNtqeL+PlY68UhRL2qWrcBo2xX8Ah9mw9q1OoyLP2RymMTsUCG9SFL
   g==;
X-CSE-ConnectionGUID: +pdPCbN9TuykHuaYBGImbQ==
X-CSE-MsgGUID: Ba5dqRkiTZag3ufxzGp+pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24236102"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24236102"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 01:35:01 -0700
X-CSE-ConnectionGUID: H1kCEl9mQAGNrmexilwP1w==
X-CSE-MsgGUID: 63BFkn3gQUqU46GqoJ59Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65718197"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2024 01:35:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sllTe-0007is-0K;
	Wed, 04 Sep 2024 08:34:58 +0000
Date: Wed, 4 Sep 2024 16:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/cleanup_smp_nmi_shootdown 1/2]
 arch/x86/kernel/reboot.c:596:34: error: use of undeclared identifier
 'crash_ipi_issued'
Message-ID: <202409041652.pnFsMUJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/cleanup_smp_nmi_shootdown
head:   2d66e97505d0772d0ae26174538d4368541dfec7
commit: c7de2d2c0cab7d890294b5437faf1bccb6bc978d [1/2] x86/reboot: Open code nmi_shootdown_cpus_on_restart() into its sole user
config: i386-buildonly-randconfig-001-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041652.pnFsMUJ8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041652.pnFsMUJ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041652.pnFsMUJ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/reboot.c:596:34: error: use of undeclared identifier 'crash_ipi_issued'
     596 |                 if (IS_ENABLED(CONFIG_SMP) && !crash_ipi_issued)
         |                                                ^
   1 error generated.


vim +/crash_ipi_issued +596 arch/x86/kernel/reboot.c

   576	
   577	static void emergency_reboot_disable_virtualization(void)
   578	{
   579		local_irq_disable();
   580	
   581		/*
   582		 * Disable virtualization on all CPUs before rebooting to avoid hanging
   583		 * the system, as VMX and SVM block INIT when running in the host.
   584		 *
   585		 * We can't take any locks and we may be on an inconsistent state, so
   586		 * use NMIs as IPIs to tell the other CPUs to disable VMX/SVM and halt.
   587		 *
   588		 * Do the NMI shootdown even if virtualization is off on _this_ CPU, as
   589		 * other CPUs may have virtualization enabled.
   590		 */
   591		if (rcu_access_pointer(cpu_emergency_virt_callback)) {
   592			/* Safely force _this_ CPU out of VMX/SVM operation. */
   593			cpu_emergency_disable_virtualization();
   594	
   595			/* Disable VMX/SVM and halt on other CPUs. */
 > 596			if (IS_ENABLED(CONFIG_SMP) && !crash_ipi_issued)
   597				nmi_shootdown_cpus(NULL);
   598		}
   599	}
   600	#else
   601	static void emergency_reboot_disable_virtualization(void) { }
   602	#endif /* CONFIG_KVM_INTEL || CONFIG_KVM_AMD */
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
