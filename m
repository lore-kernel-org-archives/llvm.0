Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B39224FA;
	Wed, 30 Apr 2025 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977731; cv=none; b=ksfzDI27jsoRIsDTU80V3asEItWMCYZKpuGQ3FpMtx10BXIPNBey30iOjK4Dn4Ed08KGvil+LXezCpHPxCnHy2UqeAXT2PkVWKg+ZsheJcKeSE7ztfwSTpp8CLFlLKCWOIrRyEdqVKluoVm54kL/p3EQ2JJW68qfPMWxbm2W0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977731; c=relaxed/simple;
	bh=QoaM88W8esAswnsn+bn696GYOwgDC/BZ2rX+lzIENZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmK97vVz7ea4IkIZtQekVETa1OrC3X83tD5/Vs4zh+7eMT3YJ1lCofKMXfRuHWEhLXUiT1mmhVbT/sbZtlhboJUBpxx83R34BXDJqXBemRi4xIs8P1QQxxAd9t2aunGGJusY6GSCEGQKNKbLHW9bLrYcUX9qVJsyPetvgEmgSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciOAIyGQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciOAIyGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745977730; x=1777513730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QoaM88W8esAswnsn+bn696GYOwgDC/BZ2rX+lzIENZI=;
  b=ciOAIyGQNMDNkU4ZwlEAq8zXs2qsUgnLrNC/fcJtxbTGAeUk/8zye8eq
   o8BwhpmsSD+r50ydnPRpiRkyE5GbgBJalbFgOmkEii1vIC7BJnZ795tcU
   eFhh3WkUF9P+1E9H8saGKTTPp1BbqSyILHSUagvV0QXLtXk9Gzs7k+IPS
   uKi642OqnZSTi0d3jT14PGmFrsOig9oLvT4vC2FNERzZ55TQ2FtAv8J0g
   LmfAJjEGtNmCKM/RXWgR0Uo2j0cCN8PdykXAv6HiHFSswAcQmtMEZOQlp
   r+SofAYQt2xCNFWBOfNbwLE70Ze4bUiW112CV8YIePTyvmrxC+1Uw3vEy
   Q==;
X-CSE-ConnectionGUID: dh0eRThnS4KxVXHGf15sgg==
X-CSE-MsgGUID: EI/fkQyfQx2D11NhS7CPqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51440153"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51440153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:48:49 -0700
X-CSE-ConnectionGUID: UQwcSHfvQk+tF6XvIdafbw==
X-CSE-MsgGUID: e4BkjM1KTD+Q1e1DbuhjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133926069"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 18:48:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9wYy-00035J-1V;
	Wed, 30 Apr 2025 01:48:40 +0000
Date: Wed, 30 Apr 2025 09:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, ardb@kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	dimitri.sivanich@hpe.com, haiyangz@microsoft.com, hpa@zytor.com,
	imran.f.khan@oracle.com, jacob.jun.pan@linux.intel.com,
	jgross@suse.com, justin.ernst@hpe.com, kprateek.nayak@amd.com,
	kyle.meyer@hpe.com, kys@microsoft.com, lenb@kernel.org,
	mingo@redhat.com, nikunj@amd.com, papaluri@amd.com,
	perry.yuan@amd.com, rafael@kernel.org, russ.anderson@hpe.com,
	steve.wahl@hpe.com, tglx@linutronix.de, thomas.lendacky@amd.com,
	tim.c.chen@linux.intel.com, tony.luck@intel.com, wei.liu@kernel.org,
	xin@zytor.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next] arch/x86: Provide the CPU number in the
 wakeup AP callback
Message-ID: <202504300914.IDPnAX2v-lkp@intel.com>
References: <20250428225948.810147-1-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428225948.810147-1-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 628cc040b3a2980df6032766e8ef0688e981ab95]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arch-x86-Provide-the-CPU-number-in-the-wakeup-AP-callback/20250429-070238
base:   628cc040b3a2980df6032766e8ef0688e981ab95
patch link:    https://lore.kernel.org/r/20250428225948.810147-1-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next] arch/x86: Provide the CPU number in the wakeup AP callback
config: x86_64-buildonly-randconfig-006-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300914.IDPnAX2v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300914.IDPnAX2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300914.IDPnAX2v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/hyperv/ivm.c:300:16: warning: variable 'start_ip' set but not used [-Wunused-but-set-variable]
     300 |         unsigned long start_ip;
         |                       ^
   1 warning generated.


vim +/start_ip +300 arch/x86/hyperv/ivm.c

   291	
   292	int hv_snp_boot_ap(struct wakeup_secondary_cpu_data *wakeup)
   293	{
   294		struct sev_es_save_area *vmsa = (struct sev_es_save_area *)
   295			__get_free_page(GFP_KERNEL | __GFP_ZERO);
   296		struct sev_es_save_area *cur_vmsa;
   297		struct desc_ptr gdtr;
   298		u64 ret, retry = 5;
   299		struct hv_enable_vp_vtl *start_vp_input;
 > 300		unsigned long start_ip;
   301		unsigned long flags;
   302		u32 cpu;
   303	
   304		if (!vmsa)
   305			return -ENOMEM;
   306	
   307		cpu = wakeup->cpu;
   308		start_ip = wakeup->apicid;
   309	
   310		native_store_gdt(&gdtr);
   311	
   312		vmsa->gdtr.base = gdtr.address;
   313		vmsa->gdtr.limit = gdtr.size;
   314	
   315		asm volatile("movl %%es, %%eax;" : "=a" (vmsa->es.selector));
   316		hv_populate_vmcb_seg(vmsa->es, vmsa->gdtr.base);
   317	
   318		asm volatile("movl %%cs, %%eax;" : "=a" (vmsa->cs.selector));
   319		hv_populate_vmcb_seg(vmsa->cs, vmsa->gdtr.base);
   320	
   321		asm volatile("movl %%ss, %%eax;" : "=a" (vmsa->ss.selector));
   322		hv_populate_vmcb_seg(vmsa->ss, vmsa->gdtr.base);
   323	
   324		asm volatile("movl %%ds, %%eax;" : "=a" (vmsa->ds.selector));
   325		hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
   326	
   327		vmsa->efer = native_read_msr(MSR_EFER);
   328	
   329		vmsa->cr4 = native_read_cr4();
   330		vmsa->cr3 = __native_read_cr3();
   331		vmsa->cr0 = native_read_cr0();
   332	
   333		vmsa->xcr0 = 1;
   334		vmsa->g_pat = HV_AP_INIT_GPAT_DEFAULT;
   335		vmsa->rip = (u64)secondary_startup_64_no_verify;
   336		vmsa->rsp = (u64)&ap_start_stack[PAGE_SIZE];
   337	
   338		/*
   339		 * Set the SNP-specific fields for this VMSA:
   340		 *   VMPL level
   341		 *   SEV_FEATURES (matches the SEV STATUS MSR right shifted 2 bits)
   342		 */
   343		vmsa->vmpl = 0;
   344		vmsa->sev_features = sev_status >> 2;
   345	
   346		ret = snp_set_vmsa(vmsa, true);
   347		if (ret) {
   348			pr_err("RMPADJUST(%llx) failed: %llx\n", (u64)vmsa, ret);
   349			free_page((u64)vmsa);
   350			return ret;
   351		}
   352	
   353		local_irq_save(flags);
   354		start_vp_input = (struct hv_enable_vp_vtl *)ap_start_input_arg;
   355		memset(start_vp_input, 0, sizeof(*start_vp_input));
   356		start_vp_input->partition_id = -1;
   357		start_vp_input->vp_index = cpu;
   358		start_vp_input->target_vtl.target_vtl = ms_hyperv.vtl;
   359		*(u64 *)&start_vp_input->vp_context = __pa(vmsa) | 1;
   360	
   361		do {
   362			ret = hv_do_hypercall(HVCALL_START_VP,
   363					      start_vp_input, NULL);
   364		} while (hv_result(ret) == HV_STATUS_TIME_OUT && retry--);
   365	
   366		local_irq_restore(flags);
   367	
   368		if (!hv_result_success(ret)) {
   369			pr_err("HvCallStartVirtualProcessor failed: %llx\n", ret);
   370			snp_cleanup_vmsa(vmsa);
   371			vmsa = NULL;
   372		}
   373	
   374		cur_vmsa = per_cpu(hv_sev_vmsa, cpu);
   375		/* Free up any previous VMSA page */
   376		if (cur_vmsa)
   377			snp_cleanup_vmsa(cur_vmsa);
   378	
   379		/* Record the current VMSA page */
   380		per_cpu(hv_sev_vmsa, cpu) = vmsa;
   381	
   382		return ret;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
