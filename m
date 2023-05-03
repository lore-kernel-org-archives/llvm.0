Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C37E;
	Wed,  3 May 2023 00:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683074927; x=1714610927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ff7dAQgjHLQwALb3r/WMZdO/858Lk2oIq+R75j+Y6WU=;
  b=IRmzEisd15QPkCc9RajBOdwqoLNhvlhwXHimwVX5OtpZrVZznFo+udtY
   h5Z/kjGGcKVxm3+PjuWdzh2G4fd+M6JX2IqMfxm8VKUxwhpeITxSwOlxK
   a1yGhygyiTIWX9z4vaysu8QBuF6kEMzcpS90HkDJg8d1CO5GJFsQrpKOZ
   8uoq82oQld0uAY72h5bstwtJezBz/XuHAP/cKvCp3F2MTR9shpr2xWM3W
   OcUeJlC/ibPFXcmPqib7LaJ3I0YRyT8LdQ/TtbNP111+UksiUCJKXXgW6
   /8rgAjLqD43mQcdsJUZiMr69wMbn/koBEUuuteioWv3tfDz8H9LKH0ljs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347356785"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="347356785"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 17:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="729146429"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="729146429"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 May 2023 17:48:44 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu0fj-0001OG-2U;
	Wed, 03 May 2023 00:48:43 +0000
Date: Wed, 3 May 2023 08:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 3/338]
 arch/powerpc/include/asm/kvm_ppc.h:276:50: error: declaration of 'struct
 kvm_gfn_range' will not be visible outside of this function
Message-ID: <202305030838.z14Vwcd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: 7f22aea74f0f3963faf10ad01ab4520ff616fb1d [3/338] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
config: powerpc-randconfig-r024-20230503 (https://download.01.org/0day-ci/archive/20230503/202305030838.z14Vwcd4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel/tdx/commit/7f22aea74f0f3963faf10ad01ab4520ff616fb1d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 7f22aea74f0f3963faf10ad01ab4520ff616fb1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030838.z14Vwcd4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/smp.c:44:
>> arch/powerpc/include/asm/kvm_ppc.h:276:50: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
           bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
                                                           ^
   arch/powerpc/include/asm/kvm_ppc.h:277:42: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
           bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
                                                   ^
   arch/powerpc/include/asm/kvm_ppc.h:278:47: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
           bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
                                                        ^
   arch/powerpc/include/asm/kvm_ppc.h:279:47: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
           bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
                                                        ^
   4 errors generated.


vim +276 arch/powerpc/include/asm/kvm_ppc.h

3a167beac07cba Aneesh Kumar K.V     2013-10-07  249  
3a167beac07cba Aneesh Kumar K.V     2013-10-07  250  struct kvmppc_ops {
cbbc58d4fdfab1 Aneesh Kumar K.V     2013-10-07  251  	struct module *owner;
3a167beac07cba Aneesh Kumar K.V     2013-10-07  252  	int (*get_sregs)(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  253  	int (*set_sregs)(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  254  	int (*get_one_reg)(struct kvm_vcpu *vcpu, u64 id,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  255  			   union kvmppc_one_reg *val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  256  	int (*set_one_reg)(struct kvm_vcpu *vcpu, u64 id,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  257  			   union kvmppc_one_reg *val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  258  	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  259  	void (*vcpu_put)(struct kvm_vcpu *vcpu);
87a45e07a5abfe Nicholas Piggin      2019-10-02  260  	void (*inject_interrupt)(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  261  	void (*set_msr)(struct kvm_vcpu *vcpu, u64 msr);
8c99d34578628b Tianjia Zhang        2020-04-27  262  	int (*vcpu_run)(struct kvm_vcpu *vcpu);
ff030fdf557322 Sean Christopherson  2019-12-18  263  	int (*vcpu_create)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  264  	void (*vcpu_free)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  265  	int (*check_requests)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  266  	int (*get_dirty_log)(struct kvm *kvm, struct kvm_dirty_log *log);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  267  	void (*flush_memslot)(struct kvm *kvm, struct kvm_memory_slot *memslot);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  268  	int (*prepare_memory_region)(struct kvm *kvm,
537a17b3149300 Sean Christopherson  2021-12-06  269  				     const struct kvm_memory_slot *old,
537a17b3149300 Sean Christopherson  2021-12-06  270  				     struct kvm_memory_slot *new,
82307e676f9d88 Sean Christopherson  2020-02-18  271  				     enum kvm_mr_change change);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  272  	void (*commit_memory_region)(struct kvm *kvm,
537a17b3149300 Sean Christopherson  2021-12-06  273  				     struct kvm_memory_slot *old,
f032b73459eed4 Bharata B Rao        2018-12-12  274  				     const struct kvm_memory_slot *new,
f032b73459eed4 Bharata B Rao        2018-12-12  275  				     enum kvm_mr_change change);
b1c5356e873cc4 Sean Christopherson  2021-04-01 @276  	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  277  	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  278  	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  279  	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
e96c81ee89d80e Sean Christopherson  2020-02-18  280  	void (*free_memslot)(struct kvm_memory_slot *slot);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  281  	int (*init_vm)(struct kvm *kvm);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  282  	void (*destroy_vm)(struct kvm *kvm);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  283  	int (*get_smmu_info)(struct kvm *kvm, struct kvm_ppc_smmu_info *info);
8c99d34578628b Tianjia Zhang        2020-04-27  284  	int (*emulate_op)(struct kvm_vcpu *vcpu,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  285  			  unsigned int inst, int *advance);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  286  	int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  287  	int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  288  	void (*fast_vcpu_kick)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  289  	long (*arch_vm_ioctl)(struct file *filp, unsigned int ioctl,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  290  			      unsigned long arg);
ae2113a4f1a6cd Paul Mackerras       2014-06-02  291  	int (*hcall_implemented)(unsigned long hcall);
9576730d0e6e30 Suresh Warrier       2016-08-19  292  	int (*irq_bypass_add_producer)(struct irq_bypass_consumer *,
9576730d0e6e30 Suresh Warrier       2016-08-19  293  				       struct irq_bypass_producer *);
9576730d0e6e30 Suresh Warrier       2016-08-19  294  	void (*irq_bypass_del_producer)(struct irq_bypass_consumer *,
9576730d0e6e30 Suresh Warrier       2016-08-19  295  					struct irq_bypass_producer *);
c9270132271168 Paul Mackerras       2017-01-30  296  	int (*configure_mmu)(struct kvm *kvm, struct kvm_ppc_mmuv3_cfg *cfg);
c9270132271168 Paul Mackerras       2017-01-30  297  	int (*get_rmmu_info)(struct kvm *kvm, struct kvm_ppc_rmmu_info *info);
3c313524605a6a Paul Mackerras       2017-02-06  298  	int (*set_smt_mode)(struct kvm *kvm, unsigned long mode,
3c313524605a6a Paul Mackerras       2017-02-06  299  			    unsigned long flags);
2e6baa46b4ae78 Simon Guo            2018-05-21  300  	void (*giveup_ext)(struct kvm_vcpu *vcpu, ulong msr);
aa069a996951f3 Paul Mackerras       2018-09-21  301  	int (*enable_nested)(struct kvm *kvm);
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  302  	int (*load_from_eaddr)(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  303  			       int size);
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  304  	int (*store_to_eaddr)(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  305  			      int size);
9a5788c615f52f Paul Mackerras       2020-03-19  306  	int (*enable_svm)(struct kvm *kvm);
22945688acd4d0 Bharata B Rao        2019-11-25  307  	int (*svm_off)(struct kvm *kvm);
d9a47edabc4f94 Ravi Bangoria        2020-12-16  308  	int (*enable_dawr1)(struct kvm *kvm);
a722076e947023 Fabiano Rosas        2021-02-05  309  	bool (*hash_v3_possible)(void);
faf01aef057075 Alexey Kardashevskiy 2022-01-11  310  	int (*create_vm_debugfs)(struct kvm *kvm);
faf01aef057075 Alexey Kardashevskiy 2022-01-11  311  	int (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  312  };
3a167beac07cba Aneesh Kumar K.V     2013-10-07  313  

:::::: The code at line 276 was first introduced by commit
:::::: b1c5356e873cc4fcbb8f58965e0cd910f3ee37a9 KVM: PPC: Convert to the gfn-based MMU notifier callbacks

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
