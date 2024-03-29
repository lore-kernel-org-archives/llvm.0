Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAE83BB2A;
	Fri, 29 Mar 2024 04:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687779; cv=none; b=LaG/L9Sob47FXfATrS+Qf3lJJkUL4Hs8TtIjnHnxwJjfu3MRH38lS5quqpE4Tt0Vo1xrBOcFh8goN+4eFXojyFjSN2veCeVveNhX9iFxYw2ccgnbPHyDYrHK8plelcbEKBbbLeKRX8Jgj2hfhty5HtxpjcF+Ge6mTDtfHaPp75U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687779; c=relaxed/simple;
	bh=vv4SNQXLInmiHP0tSWxOQa++VXcfnRI535VlwVnxIew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt5Wzroc7nWnrsH8rf9XaHV7awVH5II+V/BL66GIGIGc/rnYaTuTbVaDz/Yl5HtaK2q6JK8nXHZa80oChopXf8iHVlQ/wmKDAFodwDUqeoVIbmCmJVqtn3/os9oajGB7jTlUWx131GXMaohvdHIEjJZzsW3GwEDafqr7Cl+SVRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZTLLViW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZTLLViW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711687778; x=1743223778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vv4SNQXLInmiHP0tSWxOQa++VXcfnRI535VlwVnxIew=;
  b=EZTLLViWjq1DJbC12xNjCLCw8ZmV6WK0MPSAGh0ZQqXSI+utNRZSgHOn
   J1HgQz0yJdM353VeE0fzGHLacDqoXjzxQTolxgdf31mfOUbLV9JEKLAEo
   ag1S5oh0ocX/MFO2y+IliAa9Qx89Et2672x0VMmTdM8yd4je5/6NdQzBa
   8DdRBBgmhI5ebY/t+bUfusgv2g+1eu/Ue+uybSM/QNyWWDuG8+zFKucGQ
   Pni4rGkZZiVuvmz9X/TlN7nZdkmxWTxAg59A8aIppwHnh2sDhGHRetBGf
   r4B50+c2cI4nq6NRed7Qnf8qCZ+9nb6BFMNSt8rP75EBb8n7O82dgVneH
   g==;
X-CSE-ConnectionGUID: A0N6E7WaRzK/WP8AJ/HWMA==
X-CSE-MsgGUID: utWEdMcsTzSyW+Xokq97Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18020175"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18020175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17507527"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2024 21:49:35 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq4BI-0002rE-1Z;
	Fri, 29 Mar 2024 04:49:32 +0000
Date: Fri, 29 Mar 2024 12:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv9 06/17] x86/mm: Make
 x86_platform.guest.enc_status_change_*() return errno
Message-ID: <202403291232.y3DBx965-lkp@intel.com>
References: <20240325103911.2651793-7-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325103911.2651793-7-kirill.shutemov@linux.intel.com>

Hi Kirill,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.9-rc1 next-20240328]
[cannot apply to tip/x86/core tip/x86/mm rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/x86-acpi-Extract-ACPI-MADT-wakeup-code-into-a-separate-file/20240326-023510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240325103911.2651793-7-kirill.shutemov%40linux.intel.com
patch subject: [PATCHv9 06/17] x86/mm: Make x86_platform.guest.enc_status_change_*() return errno
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240329/202403291232.y3DBx965-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291232.y3DBx965-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291232.y3DBx965-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/hyperv/ivm.c:551:3: error: use of undeclared identifier 'result'
     551 |                 result = false;
         |                 ^
   arch/x86/hyperv/ivm.c:587:3: error: use of undeclared identifier 'result'
     587 |                 result = false;
         |                 ^
>> arch/x86/hyperv/ivm.c:662:47: error: incompatible function pointer types assigning to 'int (*)(unsigned long, int, bool)' (aka 'int (*)(unsigned long, int, _Bool)') from 'bool (unsigned long, int, bool)' (aka '_Bool (unsigned long, int, _Bool)') [-Wincompatible-function-pointer-types]
     662 |         x86_platform.guest.enc_status_change_prepare = hv_vtom_clear_present;
         |                                                      ^ ~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/result +551 arch/x86/hyperv/ivm.c

0f34d11234868d Michael Kelley        2024-01-15  530  
810a521265023a Tianyu Lan            2021-10-25  531  /*
812b0597fb4043 Michael Kelley        2023-03-26  532   * hv_vtom_set_host_visibility - Set specified memory visible to host.
810a521265023a Tianyu Lan            2021-10-25  533   *
810a521265023a Tianyu Lan            2021-10-25  534   * In Isolation VM, all guest memory is encrypted from host and guest
810a521265023a Tianyu Lan            2021-10-25  535   * needs to set memory visible to host via hvcall before sharing memory
810a521265023a Tianyu Lan            2021-10-25  536   * with host. This function works as wrap of hv_mark_gpa_visibility()
810a521265023a Tianyu Lan            2021-10-25  537   * with memory base and size.
810a521265023a Tianyu Lan            2021-10-25  538   */
f223946fdefa0e Kirill A. Shutemov    2024-03-25  539  static int hv_vtom_set_host_visibility(unsigned long kbuffer, int pagecount, bool enc)
810a521265023a Tianyu Lan            2021-10-25  540  {
812b0597fb4043 Michael Kelley        2023-03-26  541  	enum hv_mem_host_visibility visibility = enc ?
812b0597fb4043 Michael Kelley        2023-03-26  542  			VMBUS_PAGE_NOT_VISIBLE : VMBUS_PAGE_VISIBLE_READ_WRITE;
810a521265023a Tianyu Lan            2021-10-25  543  	u64 *pfn_array;
9fef276f9f416a Michael Kelley        2024-01-15  544  	phys_addr_t paddr;
9fef276f9f416a Michael Kelley        2024-01-15  545  	void *vaddr;
810a521265023a Tianyu Lan            2021-10-25  546  	int ret = 0;
810a521265023a Tianyu Lan            2021-10-25  547  	int i, pfn;
810a521265023a Tianyu Lan            2021-10-25  548  
810a521265023a Tianyu Lan            2021-10-25  549  	pfn_array = kmalloc(HV_HYP_PAGE_SIZE, GFP_KERNEL);
0f34d11234868d Michael Kelley        2024-01-15  550  	if (!pfn_array) {
0f34d11234868d Michael Kelley        2024-01-15 @551  		result = false;
0f34d11234868d Michael Kelley        2024-01-15  552  		goto err_set_memory_p;
0f34d11234868d Michael Kelley        2024-01-15  553  	}
810a521265023a Tianyu Lan            2021-10-25  554  
810a521265023a Tianyu Lan            2021-10-25  555  	for (i = 0, pfn = 0; i < pagecount; i++) {
9fef276f9f416a Michael Kelley        2024-01-15  556  		/*
9fef276f9f416a Michael Kelley        2024-01-15  557  		 * Use slow_virt_to_phys() because the PRESENT bit has been
9fef276f9f416a Michael Kelley        2024-01-15  558  		 * temporarily cleared in the PTEs.  slow_virt_to_phys() works
9fef276f9f416a Michael Kelley        2024-01-15  559  		 * without the PRESENT bit while virt_to_hvpfn() or similar
9fef276f9f416a Michael Kelley        2024-01-15  560  		 * does not.
9fef276f9f416a Michael Kelley        2024-01-15  561  		 */
9fef276f9f416a Michael Kelley        2024-01-15  562  		vaddr = (void *)kbuffer + (i * HV_HYP_PAGE_SIZE);
9fef276f9f416a Michael Kelley        2024-01-15  563  		paddr = slow_virt_to_phys(vaddr);
9fef276f9f416a Michael Kelley        2024-01-15  564  		pfn_array[pfn] = paddr >> HV_HYP_PAGE_SHIFT;
810a521265023a Tianyu Lan            2021-10-25  565  		pfn++;
810a521265023a Tianyu Lan            2021-10-25  566  
810a521265023a Tianyu Lan            2021-10-25  567  		if (pfn == HV_MAX_MODIFY_GPA_REP_COUNT || i == pagecount - 1) {
810a521265023a Tianyu Lan            2021-10-25  568  			ret = hv_mark_gpa_visibility(pfn, pfn_array,
810a521265023a Tianyu Lan            2021-10-25  569  						     visibility);
f223946fdefa0e Kirill A. Shutemov    2024-03-25  570  			if (ret)
810a521265023a Tianyu Lan            2021-10-25  571  				goto err_free_pfn_array;
810a521265023a Tianyu Lan            2021-10-25  572  			pfn = 0;
810a521265023a Tianyu Lan            2021-10-25  573  		}
810a521265023a Tianyu Lan            2021-10-25  574  	}
810a521265023a Tianyu Lan            2021-10-25  575  
810a521265023a Tianyu Lan            2021-10-25  576  err_free_pfn_array:
810a521265023a Tianyu Lan            2021-10-25  577  	kfree(pfn_array);
0f34d11234868d Michael Kelley        2024-01-15  578  
0f34d11234868d Michael Kelley        2024-01-15  579  err_set_memory_p:
0f34d11234868d Michael Kelley        2024-01-15  580  	/*
0f34d11234868d Michael Kelley        2024-01-15  581  	 * Set the PTE PRESENT bits again to revert what hv_vtom_clear_present()
0f34d11234868d Michael Kelley        2024-01-15  582  	 * did. Do this even if there is an error earlier in this function in
0f34d11234868d Michael Kelley        2024-01-15  583  	 * order to avoid leaving the memory range in a "broken" state. Setting
0f34d11234868d Michael Kelley        2024-01-15  584  	 * the PRESENT bits shouldn't fail, but return an error if it does.
0f34d11234868d Michael Kelley        2024-01-15  585  	 */
0f34d11234868d Michael Kelley        2024-01-15  586  	if (set_memory_p(kbuffer, pagecount))
0f34d11234868d Michael Kelley        2024-01-15  587  		result = false;
0f34d11234868d Michael Kelley        2024-01-15  588  
f223946fdefa0e Kirill A. Shutemov    2024-03-25  589  	return ret;
812b0597fb4043 Michael Kelley        2023-03-26  590  }
812b0597fb4043 Michael Kelley        2023-03-26  591  
812b0597fb4043 Michael Kelley        2023-03-26  592  static bool hv_vtom_tlb_flush_required(bool private)
812b0597fb4043 Michael Kelley        2023-03-26  593  {
0f34d11234868d Michael Kelley        2024-01-15  594  	/*
0f34d11234868d Michael Kelley        2024-01-15  595  	 * Since hv_vtom_clear_present() marks the PTEs as "not present"
0f34d11234868d Michael Kelley        2024-01-15  596  	 * and flushes the TLB, they can't be in the TLB. That makes the
0f34d11234868d Michael Kelley        2024-01-15  597  	 * flush controlled by this function redundant, so return "false".
0f34d11234868d Michael Kelley        2024-01-15  598  	 */
0f34d11234868d Michael Kelley        2024-01-15  599  	return false;
812b0597fb4043 Michael Kelley        2023-03-26  600  }
812b0597fb4043 Michael Kelley        2023-03-26  601  
812b0597fb4043 Michael Kelley        2023-03-26  602  static bool hv_vtom_cache_flush_required(void)
812b0597fb4043 Michael Kelley        2023-03-26  603  {
812b0597fb4043 Michael Kelley        2023-03-26  604  	return false;
812b0597fb4043 Michael Kelley        2023-03-26  605  }
812b0597fb4043 Michael Kelley        2023-03-26  606  
812b0597fb4043 Michael Kelley        2023-03-26  607  static bool hv_is_private_mmio(u64 addr)
812b0597fb4043 Michael Kelley        2023-03-26  608  {
812b0597fb4043 Michael Kelley        2023-03-26  609  	/*
812b0597fb4043 Michael Kelley        2023-03-26  610  	 * Hyper-V always provides a single IO-APIC in a guest VM.
812b0597fb4043 Michael Kelley        2023-03-26  611  	 * When a paravisor is used, it is emulated by the paravisor
812b0597fb4043 Michael Kelley        2023-03-26  612  	 * in the guest context and must be mapped private.
812b0597fb4043 Michael Kelley        2023-03-26  613  	 */
812b0597fb4043 Michael Kelley        2023-03-26  614  	if (addr >= HV_IOAPIC_BASE_ADDRESS &&
812b0597fb4043 Michael Kelley        2023-03-26  615  	    addr < (HV_IOAPIC_BASE_ADDRESS + PAGE_SIZE))
812b0597fb4043 Michael Kelley        2023-03-26  616  		return true;
812b0597fb4043 Michael Kelley        2023-03-26  617  
812b0597fb4043 Michael Kelley        2023-03-26  618  	/* Same with a vTPM */
812b0597fb4043 Michael Kelley        2023-03-26  619  	if (addr >= VTPM_BASE_ADDRESS &&
812b0597fb4043 Michael Kelley        2023-03-26  620  	    addr < (VTPM_BASE_ADDRESS + PAGE_SIZE))
812b0597fb4043 Michael Kelley        2023-03-26  621  		return true;
812b0597fb4043 Michael Kelley        2023-03-26  622  
812b0597fb4043 Michael Kelley        2023-03-26  623  	return false;
810a521265023a Tianyu Lan            2021-10-25  624  }
846da38de0e822 Tianyu Lan            2021-12-13  625  
812b0597fb4043 Michael Kelley        2023-03-26  626  void __init hv_vtom_init(void)
812b0597fb4043 Michael Kelley        2023-03-26  627  {
d3a9d7e49d1531 Dexuan Cui            2023-08-24  628  	enum hv_isolation_type type = hv_get_isolation_type();
d3a9d7e49d1531 Dexuan Cui            2023-08-24  629  
d3a9d7e49d1531 Dexuan Cui            2023-08-24  630  	switch (type) {
d3a9d7e49d1531 Dexuan Cui            2023-08-24  631  	case HV_ISOLATION_TYPE_VBS:
d3a9d7e49d1531 Dexuan Cui            2023-08-24  632  		fallthrough;
812b0597fb4043 Michael Kelley        2023-03-26  633  	/*
812b0597fb4043 Michael Kelley        2023-03-26  634  	 * By design, a VM using vTOM doesn't see the SEV setting,
812b0597fb4043 Michael Kelley        2023-03-26  635  	 * so SEV initialization is bypassed and sev_status isn't set.
812b0597fb4043 Michael Kelley        2023-03-26  636  	 * Set it here to indicate a vTOM VM.
d3a9d7e49d1531 Dexuan Cui            2023-08-24  637  	 *
d3a9d7e49d1531 Dexuan Cui            2023-08-24  638  	 * Note: if CONFIG_AMD_MEM_ENCRYPT is not set, sev_status is
d3a9d7e49d1531 Dexuan Cui            2023-08-24  639  	 * defined as 0ULL, to which we can't assigned a value.
812b0597fb4043 Michael Kelley        2023-03-26  640  	 */
d3a9d7e49d1531 Dexuan Cui            2023-08-24  641  #ifdef CONFIG_AMD_MEM_ENCRYPT
d3a9d7e49d1531 Dexuan Cui            2023-08-24  642  	case HV_ISOLATION_TYPE_SNP:
812b0597fb4043 Michael Kelley        2023-03-26  643  		sev_status = MSR_AMD64_SNP_VTOM;
da86eb96118407 Borislav Petkov (AMD  2023-05-08  644) 		cc_vendor = CC_VENDOR_AMD;
d3a9d7e49d1531 Dexuan Cui            2023-08-24  645  		break;
d3a9d7e49d1531 Dexuan Cui            2023-08-24  646  #endif
d3a9d7e49d1531 Dexuan Cui            2023-08-24  647  
d3a9d7e49d1531 Dexuan Cui            2023-08-24  648  	case HV_ISOLATION_TYPE_TDX:
d3a9d7e49d1531 Dexuan Cui            2023-08-24  649  		cc_vendor = CC_VENDOR_INTEL;
d3a9d7e49d1531 Dexuan Cui            2023-08-24  650  		break;
d3a9d7e49d1531 Dexuan Cui            2023-08-24  651  
d3a9d7e49d1531 Dexuan Cui            2023-08-24  652  	default:
d3a9d7e49d1531 Dexuan Cui            2023-08-24  653  		panic("hv_vtom_init: unsupported isolation type %d\n", type);
d3a9d7e49d1531 Dexuan Cui            2023-08-24  654  	}
d3a9d7e49d1531 Dexuan Cui            2023-08-24  655  
812b0597fb4043 Michael Kelley        2023-03-26  656  	cc_set_mask(ms_hyperv.shared_gpa_boundary);
812b0597fb4043 Michael Kelley        2023-03-26  657  	physical_mask &= ms_hyperv.shared_gpa_boundary - 1;
812b0597fb4043 Michael Kelley        2023-03-26  658  
812b0597fb4043 Michael Kelley        2023-03-26  659  	x86_platform.hyper.is_private_mmio = hv_is_private_mmio;
812b0597fb4043 Michael Kelley        2023-03-26  660  	x86_platform.guest.enc_cache_flush_required = hv_vtom_cache_flush_required;
812b0597fb4043 Michael Kelley        2023-03-26  661  	x86_platform.guest.enc_tlb_flush_required = hv_vtom_tlb_flush_required;
0f34d11234868d Michael Kelley        2024-01-15 @662  	x86_platform.guest.enc_status_change_prepare = hv_vtom_clear_present;
812b0597fb4043 Michael Kelley        2023-03-26  663  	x86_platform.guest.enc_status_change_finish = hv_vtom_set_host_visibility;
c957f1f3c498bc Juergen Gross         2023-05-02  664  
c957f1f3c498bc Juergen Gross         2023-05-02  665  	/* Set WB as the default cache mode. */
c957f1f3c498bc Juergen Gross         2023-05-02  666  	mtrr_overwrite_state(NULL, 0, MTRR_TYPE_WRBACK);
812b0597fb4043 Michael Kelley        2023-03-26  667  }
812b0597fb4043 Michael Kelley        2023-03-26  668  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
