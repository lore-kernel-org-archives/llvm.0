Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F9209F5A;
	Sun, 19 Oct 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760886098; cv=none; b=VgjnAmktbXxh5CP1Z336JTzTRzviJkyP1W7Hc6jaFNiglq8d524NmPpga5Swt8QWffCXH5MhtA0GE0p50xHGBi17phdkZa33ttm4braHoBWlouD3uYWoX0ZfbNAy+k5+nBqmceMPeAW3vSwASOlM7iyUEG7fewR2pqdG/bjDW2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760886098; c=relaxed/simple;
	bh=42bhJz7VQMy6SK4y9iDxiZJ0g8kqxEfRJBJZk/Cqxhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ea+eAogPb6l+rVrHJYpZxf00tpuk4lSgJp9ywjVKHpgt+cr4CyJnqIm6sVnjKNT9LeZHysugKXGuGlWmWrZ4QXJYui7R6g9SSK+1A6izohaAU7Ox7WcLQUPwOu8ko1RqA54sudu3Hbx1muNh+r/XEQs4Wu7kwCfmbt+COFmddME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co+N6dnf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co+N6dnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760886096; x=1792422096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42bhJz7VQMy6SK4y9iDxiZJ0g8kqxEfRJBJZk/Cqxhg=;
  b=co+N6dnfcaE0gGZ5HXpoTovMTTeb9EzfHa5xQc5HY1NpAG1IG5NguF22
   NpngSSB+/s2MHZayR2WYXWilWb8F8Nho9JMItxxSyOud0hRi/qbE7AW8H
   ATIHc92L0/iB/ta1BmMbJcmF8h0lnBZbu/8QQ4QQ8r1VPVjHdD+M5ODNH
   XulCfaS7r0dawLsbL7Uf1mOO/7TcDkVAK3sQ7j3XVM5p2J80Crm7Qg7Qq
   UKlqb/C2R+O2o3uKvo/t6HHrH2iz34nKft1BbNPIK7HVrVy61GgcIQ1zl
   gVAYA0Snp6OSsldBK8yvgLSy6DNhrqdyqMolxDPGJmUvyrlqrJM1eYMdt
   g==;
X-CSE-ConnectionGUID: TNHc/EAIQ1KQ4l89l00++g==
X-CSE-MsgGUID: /1DGFCGiSOiC8kn2Urhnfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="50599601"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="50599601"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 08:01:35 -0700
X-CSE-ConnectionGUID: OxWZ1KYqQDimPOajtoJ7nQ==
X-CSE-MsgGUID: iL4Qh2GhR/WqyOaaJY9eJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="187400763"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2025 08:01:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAUua-00098V-01;
	Sun, 19 Oct 2025 15:01:32 +0000
Date: Sun, 19 Oct 2025 23:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>
Subject: [hyperv:hyperv-next 34/34] arch/x86/hyperv/hv_init.c:558:3: error:
 call to undeclared function 'hv_root_crash_init'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510192254.i0JZ2e8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   60116744be534090c62686f441dc16f36dd7e42e
commit: 60116744be534090c62686f441dc16f36dd7e42e [34/34] x86/hyperv: Enable build of hypervisor crashdump collection files
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251019/202510192254.i0JZ2e8S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510192254.i0JZ2e8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510192254.i0JZ2e8S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/hyperv/hv_init.c:558:3: error: call to undeclared function 'hv_root_crash_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     558 |                 hv_root_crash_init();
         |                 ^
   1 error generated.


vim +/hv_root_crash_init +558 arch/x86/hyperv/hv_init.c

   438	
   439	/*
   440	 * This function is to be invoked early in the boot sequence after the
   441	 * hypervisor has been detected.
   442	 *
   443	 * 1. Setup the hypercall page.
   444	 * 2. Register Hyper-V specific clocksource.
   445	 * 3. Setup Hyper-V specific APIC entry points.
   446	 */
   447	void __init hyperv_init(void)
   448	{
   449		u64 guest_id;
   450		union hv_x64_msr_hypercall_contents hypercall_msr;
   451		int cpuhp;
   452	
   453		if (x86_hyper_type != X86_HYPER_MS_HYPERV)
   454			return;
   455	
   456		if (hv_common_init())
   457			return;
   458	
   459		/*
   460		 * The VP assist page is useless to a TDX guest: the only use we
   461		 * would have for it is lazy EOI, which can not be used with TDX.
   462		 */
   463		if (hv_isolation_type_tdx())
   464			hv_vp_assist_page = NULL;
   465		else
   466			hv_vp_assist_page = kcalloc(nr_cpu_ids,
   467						    sizeof(*hv_vp_assist_page),
   468						    GFP_KERNEL);
   469		if (!hv_vp_assist_page) {
   470			ms_hyperv.hints &= ~HV_X64_ENLIGHTENED_VMCS_RECOMMENDED;
   471	
   472			if (!hv_isolation_type_tdx())
   473				goto common_free;
   474		}
   475	
   476		if (ms_hyperv.paravisor_present && hv_isolation_type_snp()) {
   477			/* Negotiate GHCB Version. */
   478			if (!hv_ghcb_negotiate_protocol())
   479				hv_ghcb_terminate(SEV_TERM_SET_GEN,
   480						  GHCB_SEV_ES_PROT_UNSUPPORTED);
   481	
   482			hv_ghcb_pg = alloc_percpu(union hv_ghcb *);
   483			if (!hv_ghcb_pg)
   484				goto free_vp_assist_page;
   485		}
   486	
   487		cpuhp = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "x86/hyperv_init:online",
   488					  hv_cpu_init, hv_cpu_die);
   489		if (cpuhp < 0)
   490			goto free_ghcb_page;
   491	
   492		/*
   493		 * Setup the hypercall page and enable hypercalls.
   494		 * 1. Register the guest ID
   495		 * 2. Enable the hypercall and register the hypercall page
   496		 *
   497		 * A TDX VM with no paravisor only uses TDX GHCI rather than hv_hypercall_pg:
   498		 * when the hypercall input is a page, such a VM must pass a decrypted
   499		 * page to Hyper-V, e.g. hv_post_message() uses the per-CPU page
   500		 * hyperv_pcpu_input_arg, which is decrypted if no paravisor is present.
   501		 *
   502		 * A TDX VM with the paravisor uses hv_hypercall_pg for most hypercalls,
   503		 * which are handled by the paravisor and the VM must use an encrypted
   504		 * input page: in such a VM, the hyperv_pcpu_input_arg is encrypted and
   505		 * used in the hypercalls, e.g. see hv_mark_gpa_visibility() and
   506		 * hv_arch_irq_unmask(). Such a VM uses TDX GHCI for two hypercalls:
   507		 * 1. HVCALL_SIGNAL_EVENT: see vmbus_set_event() and _hv_do_fast_hypercall8().
   508		 * 2. HVCALL_POST_MESSAGE: the input page must be a decrypted page, i.e.
   509		 * hv_post_message() in such a VM can't use the encrypted hyperv_pcpu_input_arg;
   510		 * instead, hv_post_message() uses the post_msg_page, which is decrypted
   511		 * in such a VM and is only used in such a VM.
   512		 */
   513		guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
   514		wrmsrq(HV_X64_MSR_GUEST_OS_ID, guest_id);
   515	
   516		/* With the paravisor, the VM must also write the ID via GHCB/GHCI */
   517		hv_ivm_msr_write(HV_X64_MSR_GUEST_OS_ID, guest_id);
   518	
   519		/* A TDX VM with no paravisor only uses TDX GHCI rather than hv_hypercall_pg */
   520		if (hv_isolation_type_tdx() && !ms_hyperv.paravisor_present)
   521			goto skip_hypercall_pg_init;
   522	
   523		hv_hypercall_pg = __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR,
   524				MODULES_END, GFP_KERNEL, PAGE_KERNEL_ROX,
   525				VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
   526				__builtin_return_address(0));
   527		if (hv_hypercall_pg == NULL)
   528			goto clean_guest_os_id;
   529	
   530		rdmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
   531		hypercall_msr.enable = 1;
   532	
   533		if (hv_root_partition()) {
   534			struct page *pg;
   535			void *src;
   536	
   537			/*
   538			 * For the root partition, the hypervisor will set up its
   539			 * hypercall page. The hypervisor guarantees it will not show
   540			 * up in the root's address space. The root can't change the
   541			 * location of the hypercall page.
   542			 *
   543			 * Order is important here. We must enable the hypercall page
   544			 * so it is populated with code, then copy the code to an
   545			 * executable page.
   546			 */
   547			wrmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
   548	
   549			pg = vmalloc_to_page(hv_hypercall_pg);
   550			src = memremap(hypercall_msr.guest_physical_address << PAGE_SHIFT, PAGE_SIZE,
   551					MEMREMAP_WB);
   552			BUG_ON(!src);
   553			memcpy_to_page(pg, 0, src, HV_HYP_PAGE_SIZE);
   554			memunmap(src);
   555	
   556			hv_remap_tsc_clocksource();
   557	#ifdef CONFIG_X86_64
 > 558			hv_root_crash_init();
   559	#endif
   560		} else {
   561			hypercall_msr.guest_physical_address = vmalloc_to_pfn(hv_hypercall_pg);
   562			wrmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
   563		}
   564	
   565		hv_set_hypercall_pg(hv_hypercall_pg);
   566	
   567	skip_hypercall_pg_init:
   568		/*
   569		 * hyperv_init() is called before LAPIC is initialized: see
   570		 * apic_intr_mode_init() -> x86_platform.apic_post_init() and
   571		 * apic_bsp_setup() -> setup_local_APIC(). The direct-mode STIMER
   572		 * depends on LAPIC, so hv_stimer_alloc() should be called from
   573		 * x86_init.timers.setup_percpu_clockev.
   574		 */
   575		old_setup_percpu_clockev = x86_init.timers.setup_percpu_clockev;
   576		x86_init.timers.setup_percpu_clockev = hv_stimer_setup_percpu_clockev;
   577	
   578		hv_apic_init();
   579	
   580		x86_init.pci.arch_init = hv_pci_init;
   581	
   582		register_syscore_ops(&hv_syscore_ops);
   583	
   584		if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
   585			hv_get_partition_id();
   586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
