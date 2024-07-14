Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE23DDC9;
	Sun, 14 Jul 2024 05:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720933388; cv=none; b=o9TFK2QhkcivTpHhDGO6wXD+gLYoEpdF4DIwVeCf+Tol8uk8RVa0aeD8651OOHmO3NN0bLqhlubI79pGQfi+ZSB34FHdhT5IBLM2M7mDLAApGb8utJh9nBC5ou1hk4VSVgmRzECWBw+9P0Dn5ClfGPThldpUs+hdQnO3OevazBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720933388; c=relaxed/simple;
	bh=zvOpsenYBjMtA4pDUl+tBs6xd1tjtJ6pfBsU3eGJ1J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK08h+y8VY4NuQ536iatilL8vfj0/Pt4BYG1gwt7bxOObkGq0I4f4GjEdxS6uWDT/XRybRLy9LJo9y1k3PuBIN0QiDcZGaZM/4TyKSoLokZe+IMYJwGO5sU6PFF5Rwt0IlREni3q83wIkOKdlB8FyAfx3OqiLzgbOMJCFU0cSNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3umqCIO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3umqCIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720933386; x=1752469386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zvOpsenYBjMtA4pDUl+tBs6xd1tjtJ6pfBsU3eGJ1J8=;
  b=E3umqCIO9F40GdSRtYMt2JKFYeMQv06U98qoxYmcYZLhqCcDLHzyHHS8
   Li4IeTzp3TMOA5/qL0RyY72bs7CexmqDI/dHFUtUndvVALCYR67S0msL5
   6X6TL0ILB7wpwFmWitBzliCG2xVaIfJielvwyAOohK1eLq3MHkvktsHsn
   NPHAkrjdmbRZYZ/3FjomUOvfWeDDG85xmeE9NA+UhAuZBk3kQeoHuSAVY
   BR12BwPddXa/rleRvx0rjNLAVti6So8PPlS76p8ITx5Eld8W6HkQYhSKT
   lcqzx2WLM5O0y26A/JB6zDjpVJZiv3O7sGSsGezEcRGgcRxf+WJJsSK2H
   A==;
X-CSE-ConnectionGUID: 9vf89v1PR2a+kkaivN4G7g==
X-CSE-MsgGUID: 9yv+MJo8RJmNwB5GCoUj8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="40865091"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="40865091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 22:03:06 -0700
X-CSE-ConnectionGUID: cxc+VvOASKuLm5jTYUZhHQ==
X-CSE-MsgGUID: 2ZaHAEUbQNObDaDrc6UbAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49163409"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2024 22:02:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSrNx-000d4z-0d;
	Sun, 14 Jul 2024 05:02:57 +0000
Date: Sun, 14 Jul 2024 13:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Liran Alon <liran.alon@oracle.com>,
	Jan Setje-Eilers <jan.setjeeilers@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>, Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@kernel.org>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Paul Turner <pjt@google.com>, Reiji Watanabe <reijiw@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 26/26] KVM: x86: asi: Add some mitigations on address
 space transitions
Message-ID: <202407141222.Av9rdSaZ-lkp@intel.com>
References: <20240712-asi-rfc-24-v1-26-144b319a40d8@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-asi-rfc-24-v1-26-144b319a40d8@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-asi-Make-some-utility-functions-noinstr-compatible/20240713-012107
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240712-asi-rfc-24-v1-26-144b319a40d8%40google.com
patch subject: [PATCH 26/26] KVM: x86: asi: Add some mitigations on address space transitions
config: i386-buildonly-randconfig-004-20240714 (https://download.01.org/0day-ci/archive/20240714/202407141222.Av9rdSaZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141222.Av9rdSaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141222.Av9rdSaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:9786:12: error: no member named 'post_asi_enter' in 'struct asi_hooks'
    9786 |         asi_hooks.post_asi_enter = ops->post_asi_enter;
         |         ~~~~~~~~~ ^
   1 error generated.


vim +9786 arch/x86/kvm/x86.c

  9726	
  9727	
  9728	int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
  9729	{
  9730		u64 host_pat;
  9731		int r, cpu;
  9732	
  9733		guard(mutex)(&vendor_module_lock);
  9734	
  9735		if (kvm_x86_ops.hardware_enable) {
  9736			pr_err("already loaded vendor module '%s'\n", kvm_x86_ops.name);
  9737			return -EEXIST;
  9738		}
  9739	
  9740		/*
  9741		 * KVM explicitly assumes that the guest has an FPU and
  9742		 * FXSAVE/FXRSTOR. For example, the KVM_GET_FPU explicitly casts the
  9743		 * vCPU's FPU state as a fxregs_state struct.
  9744		 */
  9745		if (!boot_cpu_has(X86_FEATURE_FPU) || !boot_cpu_has(X86_FEATURE_FXSR)) {
  9746			pr_err("inadequate fpu\n");
  9747			return -EOPNOTSUPP;
  9748		}
  9749	
  9750		if (IS_ENABLED(CONFIG_PREEMPT_RT) && !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
  9751			pr_err("RT requires X86_FEATURE_CONSTANT_TSC\n");
  9752			return -EOPNOTSUPP;
  9753		}
  9754	
  9755		/*
  9756		 * KVM assumes that PAT entry '0' encodes WB memtype and simply zeroes
  9757		 * the PAT bits in SPTEs.  Bail if PAT[0] is programmed to something
  9758		 * other than WB.  Note, EPT doesn't utilize the PAT, but don't bother
  9759		 * with an exception.  PAT[0] is set to WB on RESET and also by the
  9760		 * kernel, i.e. failure indicates a kernel bug or broken firmware.
  9761		 */
  9762		if (rdmsrl_safe(MSR_IA32_CR_PAT, &host_pat) ||
  9763		    (host_pat & GENMASK(2, 0)) != 6) {
  9764			pr_err("host PAT[0] is not WB\n");
  9765			return -EIO;
  9766		}
  9767	
  9768		x86_emulator_cache = kvm_alloc_emulator_cache();
  9769		if (!x86_emulator_cache) {
  9770			pr_err("failed to allocate cache for x86 emulator\n");
  9771			return -ENOMEM;
  9772		}
  9773	
  9774		user_return_msrs = alloc_percpu(struct kvm_user_return_msrs);
  9775		if (!user_return_msrs) {
  9776			pr_err("failed to allocate percpu kvm_user_return_msrs\n");
  9777			r = -ENOMEM;
  9778			goto out_free_x86_emulator_cache;
  9779		}
  9780		kvm_nr_uret_msrs = 0;
  9781	
  9782		r = kvm_mmu_vendor_module_init();
  9783		if (r)
  9784			goto out_free_percpu;
  9785	
> 9786		asi_hooks.post_asi_enter = ops->post_asi_enter;
  9787		r = asi_register_class("KVM", &asi_hooks);
  9788		if (r < 0)
  9789			goto out_mmu_exit;
  9790		kvm_asi_index = r;
  9791	
  9792		if (boot_cpu_has(X86_FEATURE_XSAVE)) {
  9793			host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
  9794			kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
  9795		}
  9796	
  9797		rdmsrl_safe(MSR_EFER, &host_efer);
  9798	
  9799		if (boot_cpu_has(X86_FEATURE_XSAVES))
  9800			rdmsrl(MSR_IA32_XSS, host_xss);
  9801	
  9802		kvm_init_pmu_capability(ops->pmu_ops);
  9803	
  9804		if (boot_cpu_has(X86_FEATURE_ARCH_CAPABILITIES))
  9805			rdmsrl(MSR_IA32_ARCH_CAPABILITIES, host_arch_capabilities);
  9806	
  9807		r = ops->hardware_setup();
  9808		if (r != 0)
  9809			goto out_asi_unregister;
  9810	
  9811		kvm_ops_update(ops);
  9812	
  9813		for_each_online_cpu(cpu) {
  9814			smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &r, 1);
  9815			if (r < 0)
  9816				goto out_unwind_ops;
  9817		}
  9818	
  9819		/*
  9820		 * Point of no return!  DO NOT add error paths below this point unless
  9821		 * absolutely necessary, as most operations from this point forward
  9822		 * require unwinding.
  9823		 */
  9824		kvm_timer_init();
  9825	
  9826		if (pi_inject_timer == -1)
  9827			pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
  9828	#ifdef CONFIG_X86_64
  9829		pvclock_gtod_register_notifier(&pvclock_gtod_notifier);
  9830	
  9831		if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
  9832			set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
  9833	#endif
  9834	
  9835		kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
  9836	
  9837		if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
  9838			kvm_caps.supported_xss = 0;
  9839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
