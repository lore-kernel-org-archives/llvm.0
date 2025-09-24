Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AB3126D6;
	Wed, 24 Sep 2025 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733739; cv=none; b=i5FSYZO/0shTlC6M1fWFdDj8YZXdPB0D2JRzw+TRzZuNgkye/gYcL3eiAlkfNaFyIk3LjD1p9TnUxBVoe6OsGDJbLcrbtx6Ps6tX4B1UKihIT2WU/cX3d18JZc1Y8xHUFyvzFPZT3kTlAuWS306tDvVD8faqyuCVFcN5me7HEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733739; c=relaxed/simple;
	bh=/FSO6/ipB0cJtJTFavrv+ZfHe+XpgrP21tHroZy25rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqZ79AN0UD67aBAHCa43URnpxMkCBpnC3MpczVC9COiFPesWodhGNEFRDrXl3dWU8eSmhaVvK98hDfmR2shnkYF5SYeKxJScNQ4gJtr6g4+pHVFVLeANiwwdB+fHzmS4J1msxHqh5RMfkNRhDnZ7BJkEDFn3XNJjiQQ7Jq1YCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RryYs2tt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RryYs2tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758733737; x=1790269737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FSO6/ipB0cJtJTFavrv+ZfHe+XpgrP21tHroZy25rk=;
  b=RryYs2ttkvJAo+KDoNhBahovLvrLqSX8aR8f3upUrw08DzobGAOF66I6
   U8SS9M3iHo1Sr7Sf4gUl76db5HOGPqIF3AP+EFzugruASBIIj2ThnIJNB
   HLlIYxgDAb2Vqkp9bf0qTaXv5L9rhlv/l/s6nhr+/R75L1VVddyRiCb8f
   ufUn5JkDrM8Ss4XchdyAb1xTaQYif7AyLqAT9ymHTNr7UXZONffxCTMvt
   BGbBnHIpj6gLp+mgcv9vzPRA/uDqm3d6asryEAadQWZO2QSJ6d/j9afE9
   tBAscUO862s1uO2b31vxaVNGUDYCHAR0RXXqOxqCJ99QpDkBXMWzLXUiz
   Q==;
X-CSE-ConnectionGUID: efl2xMrFQS+y5fhO/gwLFA==
X-CSE-MsgGUID: Y0lcAKBHTk6Okp7bIOc4FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83643413"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="83643413"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 10:08:45 -0700
X-CSE-ConnectionGUID: FqUjPxVWQ3myxASj/onOeA==
X-CSE-MsgGUID: wBuOCrR5R/y2hpXIKC5Y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181473382"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2025 10:08:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Sys-0004ND-0b;
	Wed, 24 Sep 2025 17:08:38 +0000
Date: Thu, 25 Sep 2025 01:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de
Subject: Re: [PATCH v2 6/6] x86/hyperv: Enable build of hypervisor crashdump
 collection files
Message-ID: <202509250034.2hNDVmj0-lkp@intel.com>
References: <20250923214609.4101554-7-mrathor@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923214609.4101554-7-mrathor@linux.microsoft.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250923]
[also build test ERROR on v6.17-rc7]
[cannot apply to tip/x86/core linus/master v6.17-rc7 v6.17-rc6 v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Rathor/x86-hyperv-Rename-guest-crash-shutdown-function/20250924-054910
base:   next-20250923
patch link:    https://lore.kernel.org/r/20250923214609.4101554-7-mrathor%40linux.microsoft.com
patch subject: [PATCH v2 6/6] x86/hyperv: Enable build of hypervisor crashdump collection files
config: x86_64-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250925/202509250034.2hNDVmj0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250034.2hNDVmj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250034.2hNDVmj0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_crash.c:282:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     282 |         u64 status;
         |             ^
>> arch/x86/hyperv/hv_crash.c:631:2: error: must use 'struct' tag to refer to type 'smp_ops'
     631 |         smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;
         |         ^
         |         struct 
>> arch/x86/hyperv/hv_crash.c:631:9: error: expected identifier or '('
     631 |         smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;
         |                ^
   1 warning and 2 errors generated.


vim +631 arch/x86/hyperv/hv_crash.c

c619422e77519d Mukesh Rathor 2025-09-23  580  
c619422e77519d Mukesh Rathor 2025-09-23  581  /* Setup for kdump kexec to collect hypervisor RAM when running as root/dom0 */
c619422e77519d Mukesh Rathor 2025-09-23  582  void hv_root_crash_init(void)
c619422e77519d Mukesh Rathor 2025-09-23  583  {
c619422e77519d Mukesh Rathor 2025-09-23  584  	int rc;
c619422e77519d Mukesh Rathor 2025-09-23  585  	struct hv_input_get_system_property *input;
c619422e77519d Mukesh Rathor 2025-09-23  586  	struct hv_output_get_system_property *output;
c619422e77519d Mukesh Rathor 2025-09-23  587  	unsigned long flags;
c619422e77519d Mukesh Rathor 2025-09-23  588  	u64 status;
c619422e77519d Mukesh Rathor 2025-09-23  589  	union hv_pfn_range cda_info;
c619422e77519d Mukesh Rathor 2025-09-23  590  
c619422e77519d Mukesh Rathor 2025-09-23  591  	if (pgtable_l5_enabled()) {
c619422e77519d Mukesh Rathor 2025-09-23  592  		pr_err("Hyper-V: crash dump not yet supported on 5level PTs\n");
c619422e77519d Mukesh Rathor 2025-09-23  593  		return;
c619422e77519d Mukesh Rathor 2025-09-23  594  	}
c619422e77519d Mukesh Rathor 2025-09-23  595  
c619422e77519d Mukesh Rathor 2025-09-23  596  	rc = register_nmi_handler(NMI_LOCAL, hv_crash_nmi_local, NMI_FLAG_FIRST,
c619422e77519d Mukesh Rathor 2025-09-23  597  				  "hv_crash_nmi");
c619422e77519d Mukesh Rathor 2025-09-23  598  	if (rc) {
c619422e77519d Mukesh Rathor 2025-09-23  599  		pr_err("Hyper-V: failed to register crash nmi handler\n");
c619422e77519d Mukesh Rathor 2025-09-23  600  		return;
c619422e77519d Mukesh Rathor 2025-09-23  601  	}
c619422e77519d Mukesh Rathor 2025-09-23  602  
c619422e77519d Mukesh Rathor 2025-09-23  603  	local_irq_save(flags);
c619422e77519d Mukesh Rathor 2025-09-23  604  	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
c619422e77519d Mukesh Rathor 2025-09-23  605  	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
c619422e77519d Mukesh Rathor 2025-09-23  606  
c619422e77519d Mukesh Rathor 2025-09-23  607  	memset(input, 0, sizeof(*input));
c619422e77519d Mukesh Rathor 2025-09-23  608  	input->property_id = HV_SYSTEM_PROPERTY_CRASHDUMPAREA;
c619422e77519d Mukesh Rathor 2025-09-23  609  
c619422e77519d Mukesh Rathor 2025-09-23  610  	status = hv_do_hypercall(HVCALL_GET_SYSTEM_PROPERTY, input, output);
c619422e77519d Mukesh Rathor 2025-09-23  611  	cda_info.as_uint64 = output->hv_cda_info.as_uint64;
c619422e77519d Mukesh Rathor 2025-09-23  612  	local_irq_restore(flags);
c619422e77519d Mukesh Rathor 2025-09-23  613  
c619422e77519d Mukesh Rathor 2025-09-23  614  	if (!hv_result_success(status)) {
c619422e77519d Mukesh Rathor 2025-09-23  615  		pr_err("Hyper-V: %s: property:%d %s\n", __func__,
c619422e77519d Mukesh Rathor 2025-09-23  616  		       input->property_id, hv_result_to_string(status));
c619422e77519d Mukesh Rathor 2025-09-23  617  		goto err_out;
c619422e77519d Mukesh Rathor 2025-09-23  618  	}
c619422e77519d Mukesh Rathor 2025-09-23  619  
c619422e77519d Mukesh Rathor 2025-09-23  620  	if (cda_info.base_pfn == 0) {
c619422e77519d Mukesh Rathor 2025-09-23  621  		pr_err("Hyper-V: hypervisor crash dump area pfn is 0\n");
c619422e77519d Mukesh Rathor 2025-09-23  622  		goto err_out;
c619422e77519d Mukesh Rathor 2025-09-23  623  	}
c619422e77519d Mukesh Rathor 2025-09-23  624  
c619422e77519d Mukesh Rathor 2025-09-23  625  	hv_cda = phys_to_virt(cda_info.base_pfn << HV_HYP_PAGE_SHIFT);
c619422e77519d Mukesh Rathor 2025-09-23  626  
c619422e77519d Mukesh Rathor 2025-09-23  627  	rc = hv_crash_trampoline_setup();
c619422e77519d Mukesh Rathor 2025-09-23  628  	if (rc)
c619422e77519d Mukesh Rathor 2025-09-23  629  		goto err_out;
c619422e77519d Mukesh Rathor 2025-09-23  630  
c619422e77519d Mukesh Rathor 2025-09-23 @631  	smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
