Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD39740DFB9;
	Sat, 21 Mar 2026 02:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774058837; cv=none; b=qLCiKEqc6eajZ68x3iailF97F2yO3/iXoUD93+DnHFKV/79HLsqRAUm5mdONUCJVvxb7rV+bY7Et8dFtWM3Px7Zk2W0+LLmN0FU0TS47cq7Be+FiPrenPl9B2p1CvKYyMoW8LGWouB99EKV1ZtKJj7lpSybZ7rHrv6HLfnV4SqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774058837; c=relaxed/simple;
	bh=CJXQgjxTdfI89/PlGwbmUCHBQ5qHgBLJcbbTD0YcvEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfFg7AtGGNupOL610Pa3LEwgsqFXoSTRPmBdMQKKz1mDcp3VVIa8YWJ1S141qVcwMA4HFK5wpxNNyzDbPtT6xEzaj5NW81b98kjlGSyetRzncISZJ7eHLGDIC3JTKa76YpGB2Iv0i7vFQKHd5lULNRt9usgBStSMbo9ebd+xdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CayOowf1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CayOowf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774058835; x=1805594835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CJXQgjxTdfI89/PlGwbmUCHBQ5qHgBLJcbbTD0YcvEs=;
  b=CayOowf1EqHvXm2rtP1/BLEuG4POyLZ7KFlLrPdi1l7eHTZiJw6bU/qK
   AN+EBbm/TJ1HL6b0bLTWizD82WO9zw/50V8n8UBs08BEn3b88Yo3jKS0R
   rXHzsp25U/DWvrms7zZSOqkiFLqpYBv78GZi07qs2htvp3Cq/pUvfmYy5
   IZ5Wv17YRmONcOlwtjiTxY44CWFfjsB/T7+3TUvDrpcBLH/ab1mL5NqMw
   0ezIK/MlY+uyknr6wcFswydvNGwqjXMBCpQtUkm8hzN7Kctfs+rqAfsTA
   jk4HuEGgIUACW1RVsSZXn983ObRK1Dyo0b4nqI2/VTGTDGUwzessGxU0f
   w==;
X-CSE-ConnectionGUID: /XfOSkhCSzSqTKaCV0Gq8g==
X-CSE-MsgGUID: pFAJrfK0SRi71tA+XGosLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74169564"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74169564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 19:07:14 -0700
X-CSE-ConnectionGUID: 3k5cdpCZRCabfhJMFheOnA==
X-CSE-MsgGUID: R5tB/UUXSfeixiY9YZO0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="219200287"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2026 19:07:07 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3lga-000000000BN-32yA;
	Sat, 21 Mar 2026 02:04:10 +0000
Date: Sat, 21 Mar 2026 10:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v9 4/7] x86/acpi: Add acpi_get_cpu_uid() implementation
 and update Xen users
Message-ID: <202603210907.zP8613EA-lkp@intel.com>
References: <20260319065735.45954-5-fengchengwen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319065735.45954-5-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/x86/core pci/next pci/for-linus linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/arm64-acpi-Add-acpi_get_cpu_uid-and-switch-arm_cspmu-to-use-it/20260320-194713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260319065735.45954-5-fengchengwen%40huawei.com
patch subject: [PATCH v9 4/7] x86/acpi: Add acpi_get_cpu_uid() implementation and update Xen users
config: x86_64-buildonly-randconfig-005-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210907.zP8613EA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210907.zP8613EA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210907.zP8613EA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/enlighten_hvm.c:165:6: error: call to undeclared function 'acpi_get_cpu_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     165 |         if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
         |             ^
   1 error generated.


vim +/acpi_get_cpu_uid +165 arch/x86/xen/enlighten_hvm.c

   151	
   152	static int xen_cpu_up_prepare_hvm(unsigned int cpu)
   153	{
   154		u32 cpu_uid;
   155		int rc = 0;
   156	
   157		/*
   158		 * If a CPU was offlined earlier and offlining timed out then the
   159		 * lock mechanism is still initialized. Uninit it unconditionally
   160		 * as it's safe to call even if already uninited. Interrupts and
   161		 * timer have already been handled in xen_cpu_dead_hvm().
   162		 */
   163		xen_uninit_lock_cpu(cpu);
   164	
 > 165		if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
   166			per_cpu(xen_vcpu_id, cpu) = cpu_uid;
   167		else
   168			per_cpu(xen_vcpu_id, cpu) = cpu;
   169		xen_vcpu_setup(cpu);
   170		if (!xen_have_vector_callback)
   171			return 0;
   172	
   173		if (xen_percpu_upcall) {
   174			rc = xen_set_upcall_vector(cpu);
   175			if (rc) {
   176				WARN(1, "HVMOP_set_evtchn_upcall_vector"
   177				     " for CPU %d failed: %d\n", cpu, rc);
   178				return rc;
   179			}
   180		}
   181	
   182		if (xen_feature(XENFEAT_hvm_safe_pvclock))
   183			xen_setup_timer(cpu);
   184	
   185		rc = xen_smp_intr_init(cpu);
   186		if (rc) {
   187			WARN(1, "xen_smp_intr_init() for CPU %d failed: %d\n",
   188			     cpu, rc);
   189		}
   190		return rc;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
