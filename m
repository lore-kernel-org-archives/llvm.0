Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31D487AE;
	Wed, 11 Sep 2024 04:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726030234; cv=none; b=j3c/RGQHqXQqlHAjIGOH3v/poPNe1QFuGyubC9Q5vyh5ooRlCUZ49CjyEJo+a+Af/RMkcGbIcZV/dATh8F9UkL8ZtrPaNHMNypm9EzFd3epXYNoeIj6q/i12YGMuG6aQviYFbl5tXOgz4YDpHGZb/ZMIW7Fxn7ZYIAZD20Rb33g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726030234; c=relaxed/simple;
	bh=kmoLlgPmYqrXTL8aQLXCyX4fC2c3/0as7B6s/TsEvb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0DRn7e/l5SXUqQcj4SqhOWS4/IhRSCKgKbZ8SijAdAmdmiC6sRCaXMyZtU5l3Z3ijBf8yysjQOgythAi4/7k6bWC6SKbzMikrokjbkxIau3xur+CY3ilY9hV/G2OElnqnwFthtkBNNLy8pHJEqTgSLScEbmUaUOlftWcxmQkX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msxkV/VU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msxkV/VU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726030232; x=1757566232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmoLlgPmYqrXTL8aQLXCyX4fC2c3/0as7B6s/TsEvb0=;
  b=msxkV/VUsl814EG0Gu1tCkx0xZoxmHnbfy2wN6DCXIvMdMopeFwjH5At
   KTMqmxx54BgX6tN+KCs9TE9L24QIh5g/yP2piKmzfzMv4SHK+zqt0jQNQ
   BolTWlEHOsjuKiHQj60Fx6j+eJik1K4zR1zcU8AO30i7VKst6VVxAReUD
   cS8R/VpBIBvETNzQ9ULVWLcnsYPaFyLhK1kycB6xZlIfdRyjvOh0GQTes
   +Apfxakhu1VVb52YVDS/28eTZKKS2twfCQdpZ7xrZ3I9XYHWYYjGTmajh
   bdpAinhGfJgTmN8FLa2kz/NoA7uZEqofRMfNykaskZL4re/KzgHJWU6Us
   w==;
X-CSE-ConnectionGUID: IDQ+nitHSFyKRQlFQ2Lfkg==
X-CSE-MsgGUID: AP3LhrziRT22tvrBU38rJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36163020"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="36163020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 21:50:31 -0700
X-CSE-ConnectionGUID: uWjQwaHZRE2XuPmuDbJISg==
X-CSE-MsgGUID: O6Ms0PgHQkyZb22rr4eL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="72010805"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 21:50:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soFJD-00033K-24;
	Wed, 11 Sep 2024 04:50:27 +0000
Date: Wed, 11 Sep 2024 12:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/7] xen: allow mapping ACPI data using a different
 physical address
Message-ID: <202409111258.p9Pz516o-lkp@intel.com>
References: <20240910103932.7634-7-jgross@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910103932.7634-7-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.11-rc7 next-20240910]
[cannot apply to xen-tip/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xen-use-correct-end-address-of-kernel-for-conflict-checking/20240910-184510
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240910103932.7634-7-jgross%40suse.com
patch subject: [PATCH v3 6/7] xen: allow mapping ACPI data using a different physical address
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240911/202409111258.p9Pz516o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111258.p9Pz516o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111258.p9Pz516o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/x86_init.c:123:23: error: use of undeclared identifier 'x86_default_set_root_pointer'
     123 |                 .set_root_pointer       = x86_default_set_root_pointer,
         |                                           ^
>> arch/x86/kernel/x86_init.c:124:23: error: use of undeclared identifier 'x86_default_get_root_pointer'
     124 |                 .get_root_pointer       = x86_default_get_root_pointer,
         |                                           ^
>> arch/x86/kernel/x86_init.c:125:28: error: use of undeclared identifier 'acpi_generic_reduced_hw_init'
     125 |                 .reduced_hw_early_init  = acpi_generic_reduced_hw_init,
         |                                           ^
   3 errors generated.


vim +/x86_default_set_root_pointer +123 arch/x86/kernel/x86_init.c

f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   65  
f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   66  	.resources = {
5d94e81f69d4b1 Dan Williams    2011-03-08   67  		.probe_roms		= probe_roms,
8fee697d990c54 Thomas Gleixner 2009-08-19   68  		.reserve_resources	= reserve_standard_io_resources,
103e206309639b Ingo Molnar     2017-01-28   69  		.memory_setup		= e820__memory_setup_default,
0f4a1e80989aca Kevin Loughlin  2024-03-13   70  		.dmi_setup		= dmi_setup,
f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   71  	},
f4848472cd9948 Thomas Gleixner 2009-08-20   72  
f4848472cd9948 Thomas Gleixner 2009-08-20   73  	.mpparse = {
de93410310952f Thomas Gleixner 2009-08-20   74  		.setup_ioapic_ids	= x86_init_noop,
e061c7ae0830ff Thomas Gleixner 2024-02-13   75  		.find_mptable		= mpparse_find_mptable,
dcb7600849ce9b Thomas Gleixner 2024-02-13   76  		.early_parse_smp_cfg	= mpparse_parse_early_smp_config,
dcb7600849ce9b Thomas Gleixner 2024-02-13   77  		.parse_smp_cfg		= mpparse_parse_smp_config,
f4848472cd9948 Thomas Gleixner 2009-08-20   78  	},
d9112f43021554 Thomas Gleixner 2009-08-20   79  
d9112f43021554 Thomas Gleixner 2009-08-20   80  	.irqs = {
d9112f43021554 Thomas Gleixner 2009-08-20   81  		.pre_vector_init	= init_ISA_irqs,
66bcaf0bde100a Thomas Gleixner 2009-08-20   82  		.intr_init		= native_init_IRQ,
979923871f69a4 Thomas Gleixner 2020-01-23   83  		.intr_mode_select	= apic_intr_mode_select,
6b15ffa07dc325 Thomas Gleixner 2020-08-26   84  		.intr_mode_init		= apic_intr_mode_init,
6b15ffa07dc325 Thomas Gleixner 2020-08-26   85  		.create_pci_msi_domain	= native_create_pci_msi_domain,
d9112f43021554 Thomas Gleixner 2009-08-20   86  	},
42bbdb43b16d23 Thomas Gleixner 2009-08-20   87  
42bbdb43b16d23 Thomas Gleixner 2009-08-20   88  	.oem = {
42bbdb43b16d23 Thomas Gleixner 2009-08-20   89  		.arch_setup		= x86_init_noop,
6f30c1ac3fcf11 Thomas Gleixner 2009-08-20   90  		.banner			= default_banner,
42bbdb43b16d23 Thomas Gleixner 2009-08-20   91  	},
030cb6c00d242c Thomas Gleixner 2009-08-20   92  
030cb6c00d242c Thomas Gleixner 2009-08-20   93  	.paging = {
7737b215ad0f94 Attilio Rao     2012-08-21   94  		.pagetable_init		= native_pagetable_init,
030cb6c00d242c Thomas Gleixner 2009-08-20   95  	},
736decac643e89 Thomas Gleixner 2009-08-19   96  
736decac643e89 Thomas Gleixner 2009-08-19   97  	.timers = {
736decac643e89 Thomas Gleixner 2009-08-19   98  		.setup_percpu_clockev	= setup_boot_APIC_clock,
845b3944bbdf9e Thomas Gleixner 2009-08-19   99  		.timer_init		= hpet_time_init,
c311ed6183f4fd Rahul Tanwar    2019-10-10  100  		.wallclock_init		= x86_wallclock_init,
736decac643e89 Thomas Gleixner 2009-08-19  101  	},
d07c1be0693e09 FUJITA Tomonori 2009-11-10  102  
d07c1be0693e09 FUJITA Tomonori 2009-11-10  103  	.iommu = {
d07c1be0693e09 FUJITA Tomonori 2009-11-10  104  		.iommu_init		= iommu_init_noop,
d07c1be0693e09 FUJITA Tomonori 2009-11-10  105  	},
b72d0db9dd41da Thomas Gleixner 2009-08-29  106  
b72d0db9dd41da Thomas Gleixner 2009-08-29  107  	.pci = {
b72d0db9dd41da Thomas Gleixner 2009-08-29  108  		.init			= x86_default_pci_init,
ab3b37937e8f4f Thomas Gleixner 2009-08-29  109  		.init_irq		= x86_default_pci_init_irq,
9325a28ce2fa7c Thomas Gleixner 2009-08-29  110  		.fixup_irqs		= x86_default_pci_fixup_irqs,
b72d0db9dd41da Thomas Gleixner 2009-08-29  111  	},
f72e38e8ec8869 Juergen Gross   2017-11-09  112  
f72e38e8ec8869 Juergen Gross   2017-11-09  113  	.hyper = {
f72e38e8ec8869 Juergen Gross   2017-11-09  114  		.init_platform		= x86_init_noop,
f3614646005a1b Juergen Gross   2017-11-09  115  		.guest_late_init	= x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  116  		.x2apic_available	= bool_x86_init_noop,
ab0f59c6f13528 David Woodhouse 2020-10-24  117  		.msi_ext_dest_id	= bool_x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  118  		.init_mem_mapping	= x86_init_noop,
6f84f8d1587f20 Pavel Tatashin  2018-04-10  119  		.init_after_bootmem	= x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  120  	},
038bac2b02989a Juergen Gross   2018-02-19  121  
038bac2b02989a Juergen Gross   2018-02-19  122  	.acpi = {
41fa1ee9c6d687 Josh Boyer      2019-08-19 @123  		.set_root_pointer	= x86_default_set_root_pointer,
e7b66d16fe4172 Juergen Gross   2018-10-10 @124  		.get_root_pointer	= x86_default_get_root_pointer,
81b53e5ff21e09 Andy Shevchenko 2018-02-20 @125  		.reduced_hw_early_init	= acpi_generic_reduced_hw_init,
038bac2b02989a Juergen Gross   2018-02-19  126  	},
736decac643e89 Thomas Gleixner 2009-08-19  127  };
736decac643e89 Thomas Gleixner 2009-08-19  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
