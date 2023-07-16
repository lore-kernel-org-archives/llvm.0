Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E0186A;
	Sun, 16 Jul 2023 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689480978; x=1721016978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoLPZQgzeO3d3v/maQ7MZpB9tHsiQDSTvdgxDCcZthM=;
  b=FwOb479TogiXLl3wO7xzKSmtjuQpQVMcEqyBneiGL/koHqJ/0iWOaBZ/
   B2vMZckRpoeRp8eHEMc7F5OpCb5dN+Mf+rUTY49UUITchaeCAXHMcHCaP
   HoNuPUpFyw/OHa+iusX73u7utLmxfXTwXH1oGnICaatGIwxOxLRSQmvGb
   roViUIDR/pnOoac1FTa3WNI2tKvjiJPAreqTPWtbR0fQmeSTAX/RwoNnB
   iRNN6MhZr+h/dUnPb3uHT8+jZ+xzf5R4WgYz0yhCmwwDaNWsRRl15JLgV
   ykzqrAo1UwqkUdKveYXEdGvrvbfduLU7VOnJdAVKlKTsuSPf10yQh5cGN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364598382"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364598382"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="726127885"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="726127885"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 21:16:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtB7-0008ZN-1x;
	Sun, 16 Jul 2023 04:16:13 +0000
Date: Sun, 16 Jul 2023 12:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 122/365]
 arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for function
 'vt_set_memory_attributes'
Message-ID: <202307161257.9cANZlGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 7ead2f69626501b5fc9041b2c111f6d082e23bc4 [122/365] KVM: TDX: implement set_memory_attributes() callback
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307161257.9cANZlGt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161257.9cANZlGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161257.9cANZlGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/main.c:4:
   In file included from arch/x86/kvm/vmx/x86_ops.h:5:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for function 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
        ^
   include/linux/kvm_host.h:2370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
   ^
   static 
   arch/x86/kvm/vmx/main.c:185:3: error: call to undeclared function 'tdx_flush_tlb_current'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   tdx_flush_tlb_current(vcpu);
                   ^
   arch/x86/kvm/vmx/main.c:185:3: note: did you mean 'vmx_flush_tlb_current'?
   arch/x86/kvm/vmx/x86_ops.h:99:6: note: 'vmx_flush_tlb_current' declared here
   void vmx_flush_tlb_current(struct kvm_vcpu *vcpu);
        ^
>> arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for function 'vt_set_memory_attributes' [-Wmissing-prototypes]
   bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
        ^
   arch/x86/kvm/vmx/main.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
   ^
   static 
   2 warnings and 1 error generated.


vim +/vt_set_memory_attributes +247 arch/x86/kvm/vmx/main.c

   181	
   182	static void vt_flush_tlb_current(struct kvm_vcpu *vcpu)
   183	{
   184		if (is_td_vcpu(vcpu)) {
 > 185			tdx_flush_tlb_current(vcpu);
   186			return;
   187		}
   188	
   189		vmx_flush_tlb_current(vcpu);
   190	}
   191	
   192	static int vt_flush_remote_tlbs(struct kvm *kvm)
   193	{
   194		if (is_td(kvm))
   195			return tdx_sept_flush_remote_tlbs(kvm);
   196	
   197		/*
   198		 * fallback to KVM_REQ_TLB_FLUSH.
   199		 * See kvm_arch_flush_remote_tlb() and kvm_flush_remote_tlbs().
   200		 */
   201		return -EOPNOTSUPP;
   202	}
   203	
   204	static void vt_flush_tlb_gva(struct kvm_vcpu *vcpu, gva_t addr)
   205	{
   206		if (KVM_BUG_ON(is_td_vcpu(vcpu), vcpu->kvm))
   207			return;
   208	
   209		vmx_flush_tlb_gva(vcpu, addr);
   210	}
   211	
   212	static void vt_flush_tlb_guest(struct kvm_vcpu *vcpu)
   213	{
   214		if (is_td_vcpu(vcpu))
   215			return;
   216	
   217		vmx_flush_tlb_guest(vcpu);
   218	}
   219	
   220	static void vt_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa,
   221				int pgd_level)
   222	{
   223		if (is_td_vcpu(vcpu)) {
   224			tdx_load_mmu_pgd(vcpu, root_hpa, pgd_level);
   225			return;
   226		}
   227	
   228		vmx_load_mmu_pgd(vcpu, root_hpa, pgd_level);
   229	}
   230	
   231	static int vt_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
   232	{
   233		if (!is_td(kvm))
   234			return -ENOTTY;
   235	
   236		return tdx_vm_ioctl(kvm, argp);
   237	}
   238	
   239	static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
   240	{
   241		if (!is_td_vcpu(vcpu))
   242			return -EINVAL;
   243	
   244		return tdx_vcpu_ioctl(vcpu, argp);
   245	}
   246	
 > 247	bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
   248	{
   249		if (is_td(kvm))
   250			return tdx_set_memory_attributes(kvm, range);
   251	
   252		if (kvm->arch.vm_type == KVM_X86_PROTECTED_VM)
   253			return kvm_unmap_gfn_range(kvm, range);
   254		return false;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
