Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389A1C8607;
	Sat, 15 Mar 2025 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742082709; cv=none; b=jRVsDWnSBgXjpHCMShxfNlom1yoM6hzBwx1YMJo+ugNlnuGdpkWUY0GYryXm9ebmzS6mXkZtwnWlr/G3SACxHkSxbJ0ZSJAk+xXHIYh9m9139kqYIiQMNmLAyN4BqhxpGDq8fd3IrRuDBxStDfaGLWmu0wbSe8E2zx1F4LygOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742082709; c=relaxed/simple;
	bh=FT26bfZ8vN5ufmcpCV5KQhxXMg3utTZ9eOrqzjH2+T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHv9VO8XhPcHVhNw/KFQ1ukjSU3pU9MkOkpwHgCUkPZ/nRT7PCK+rWLI2J18WRWgoY64NKeN3PkUpSbkNtK/Oy8kEjO1rWu29vnDm7OP0WvSHpPZci03ITXovtRiGenQ/e1eXkdz7NIf9M/cwa33BnzO+SZgI0+oFbseh+d9G/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEwAr83g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEwAr83g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742082704; x=1773618704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FT26bfZ8vN5ufmcpCV5KQhxXMg3utTZ9eOrqzjH2+T4=;
  b=YEwAr83gPyGGA+MGLm6mja+Dg9Z3UQ8gy6W0bap2E1gMZZd5Eec2jJK/
   FFOJn0+LkRN1ycygBjTmTEhYH+OdiK6CXtLxKCZQEnc2Bk1IlhhznYDoL
   mnTKLIdZeU6do1GPgocYyANM1olF3lHKJJImpMzZibCVk1pAjMVaLtkPk
   cC1Os0fd/eY7MyhGMGFJ7laZFZR9jMXRPN4kKVQOzQ4CS5MfvGsuzC/9A
   6aQk13IrOZ6m729LAkSmMMePOLolSE6chuv/KCgfUxlemhedyYnc+/Lhk
   BqzE0uLsLbCUsMXJg34Y0QrVaR2alZW0cUNccNc9opKxR0xZwZsnmG72F
   Q==;
X-CSE-ConnectionGUID: Kyu45iFmRiSE05C2e83XGg==
X-CSE-MsgGUID: c8eQp8J4T++ku7yRuKL1Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53416684"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="53416684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 16:51:43 -0700
X-CSE-ConnectionGUID: SwcuRti5TVKMoqAxn6T7kw==
X-CSE-MsgGUID: v/TU6OkeSkKkaz3QKp7eKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="122094295"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2025 16:51:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttbHx-000Bid-1r;
	Sat, 15 Mar 2025 23:51:33 +0000
Date: Sun, 16 Mar 2025 07:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de,
	bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
Message-ID: <202503160700.upkL1tck-lkp@intel.com>
References: <20250315001931.631210-12-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-12-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9608f6dc3e3229a40e1db1dab573d6882f38c2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detecting-hypervisor-presence/20250315-082319
base:   d9608f6dc3e3229a40e1db1dab573d6882f38c2a
patch link:    https://lore.kernel.org/r/20250315001931.631210-12-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain from DeviceTree
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250316/202503160700.upkL1tck-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160700.upkL1tck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160700.upkL1tck-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pci-hyperv.c:921:21: warning: unused variable 'domain' [-Wunused-variable]
     921 |         struct irq_domain *domain;
         |                            ^~~~~~
   1 warning generated.


vim +/domain +921 drivers/pci/controller/pci-hyperv.c

   918	
   919	static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
   920	{
 > 921		struct irq_domain *domain;
   922		acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
   923	
   924		if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
   925			return NULL;
   926		gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
   927		if (!gsi_domain_disp_fn)
   928			return NULL;
   929		return irq_find_matching_fwnode(gsi_domain_disp_fn(0),
   930					     DOMAIN_BUS_ANY);
   931	}
   932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
