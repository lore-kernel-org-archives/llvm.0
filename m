Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490799468;
	Tue,  6 Jun 2023 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686040695; x=1717576695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ON4TiQLzS1/xUqSxYeXTtFFApC9wqgAZToTkjWzpk8=;
  b=LtmpBpdxCQwfHO5C5yz2XgyepghOjIvC09VfE/bnKCgkB16Vm1ose0bO
   Ta3G2htf+JkoX2Fl0fCr94aJ9WFyVrES2jdoun4iQBJu+4k4FLAZaT2E/
   ztcnWFcU4lwgTcC/w2XoTULtWydFu+v2o8/h06IzFoV6QlhgNdkZVIXHu
   khiFtj2f7b81UOEP7Se0AnuwIxV87PF8RPhBoupKWRXTqHo1Ssr1Zy/pK
   irdab4xt/Mg7D+tCiC952XhoTq13LaSFvz4Xpi9mewVOaOMgY/dU2oQek
   IMjaZ0QLwS/Z7dFAES00jRnUbLwEoYnUEPZ7HBl18wkbeOblt0ZBPuXH5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354100140"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="354100140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774038428"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="774038428"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 01:38:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6SCg-00052m-29;
	Tue, 06 Jun 2023 08:38:10 +0000
Date: Tue, 6 Jun 2023 16:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 2/334]
 arch/powerpc/include/asm/kvm_ppc.h:287:50: error: declaration of 'struct
 kvm_gfn_range' will not be visible outside of this function
Message-ID: <202306061618.Er0ZhIzg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   2789a6a07b77e3de6f19336583e1d8099bad1759
commit: 32be382e06a83517f3867e63540312bebd147f09 [2/334] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
config: powerpc-randconfig-r012-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061618.Er0ZhIzg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel/tdx/commit/32be382e06a83517f3867e63540312bebd147f09
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 32be382e06a83517f3867e63540312bebd147f09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061618.Er0ZhIzg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/smp.c:44:
>> arch/powerpc/include/asm/kvm_ppc.h:287:50: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
     287 |         bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                         ^
   arch/powerpc/include/asm/kvm_ppc.h:288:42: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
     288 |         bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                 ^
   arch/powerpc/include/asm/kvm_ppc.h:289:47: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
     289 |         bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^
   arch/powerpc/include/asm/kvm_ppc.h:290:47: error: declaration of 'struct kvm_gfn_range' will not be visible outside of this function [-Werror,-Wvisibility]
     290 |         bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^
   4 errors generated.


vim +287 arch/powerpc/include/asm/kvm_ppc.h

3a167beac07cba Aneesh Kumar K.V     2013-10-07  260  
3a167beac07cba Aneesh Kumar K.V     2013-10-07  261  struct kvmppc_ops {
cbbc58d4fdfab1 Aneesh Kumar K.V     2013-10-07  262  	struct module *owner;
3a167beac07cba Aneesh Kumar K.V     2013-10-07  263  	int (*get_sregs)(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  264  	int (*set_sregs)(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  265  	int (*get_one_reg)(struct kvm_vcpu *vcpu, u64 id,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  266  			   union kvmppc_one_reg *val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  267  	int (*set_one_reg)(struct kvm_vcpu *vcpu, u64 id,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  268  			   union kvmppc_one_reg *val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  269  	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  270  	void (*vcpu_put)(struct kvm_vcpu *vcpu);
87a45e07a5abfe Nicholas Piggin      2019-10-02  271  	void (*inject_interrupt)(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  272  	void (*set_msr)(struct kvm_vcpu *vcpu, u64 msr);
8c99d34578628b Tianjia Zhang        2020-04-27  273  	int (*vcpu_run)(struct kvm_vcpu *vcpu);
ff030fdf557322 Sean Christopherson  2019-12-18  274  	int (*vcpu_create)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  275  	void (*vcpu_free)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  276  	int (*check_requests)(struct kvm_vcpu *vcpu);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  277  	int (*get_dirty_log)(struct kvm *kvm, struct kvm_dirty_log *log);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  278  	void (*flush_memslot)(struct kvm *kvm, struct kvm_memory_slot *memslot);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  279  	int (*prepare_memory_region)(struct kvm *kvm,
537a17b3149300 Sean Christopherson  2021-12-06  280  				     const struct kvm_memory_slot *old,
537a17b3149300 Sean Christopherson  2021-12-06  281  				     struct kvm_memory_slot *new,
82307e676f9d88 Sean Christopherson  2020-02-18  282  				     enum kvm_mr_change change);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  283  	void (*commit_memory_region)(struct kvm *kvm,
537a17b3149300 Sean Christopherson  2021-12-06  284  				     struct kvm_memory_slot *old,
f032b73459eed4 Bharata B Rao        2018-12-12  285  				     const struct kvm_memory_slot *new,
f032b73459eed4 Bharata B Rao        2018-12-12  286  				     enum kvm_mr_change change);
b1c5356e873cc4 Sean Christopherson  2021-04-01 @287  	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  288  	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  289  	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
b1c5356e873cc4 Sean Christopherson  2021-04-01  290  	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
e96c81ee89d80e Sean Christopherson  2020-02-18  291  	void (*free_memslot)(struct kvm_memory_slot *slot);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  292  	int (*init_vm)(struct kvm *kvm);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  293  	void (*destroy_vm)(struct kvm *kvm);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  294  	int (*get_smmu_info)(struct kvm *kvm, struct kvm_ppc_smmu_info *info);
8c99d34578628b Tianjia Zhang        2020-04-27  295  	int (*emulate_op)(struct kvm_vcpu *vcpu,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  296  			  unsigned int inst, int *advance);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  297  	int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  298  	int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  299  	void (*fast_vcpu_kick)(struct kvm_vcpu *vcpu);
67c48662e2b553 Thomas Huth          2023-02-08  300  	int (*arch_vm_ioctl)(struct file *filp, unsigned int ioctl,
3a167beac07cba Aneesh Kumar K.V     2013-10-07  301  			     unsigned long arg);
ae2113a4f1a6cd Paul Mackerras       2014-06-02  302  	int (*hcall_implemented)(unsigned long hcall);
9576730d0e6e30 Suresh Warrier       2016-08-19  303  	int (*irq_bypass_add_producer)(struct irq_bypass_consumer *,
9576730d0e6e30 Suresh Warrier       2016-08-19  304  				       struct irq_bypass_producer *);
9576730d0e6e30 Suresh Warrier       2016-08-19  305  	void (*irq_bypass_del_producer)(struct irq_bypass_consumer *,
9576730d0e6e30 Suresh Warrier       2016-08-19  306  					struct irq_bypass_producer *);
c9270132271168 Paul Mackerras       2017-01-30  307  	int (*configure_mmu)(struct kvm *kvm, struct kvm_ppc_mmuv3_cfg *cfg);
c9270132271168 Paul Mackerras       2017-01-30  308  	int (*get_rmmu_info)(struct kvm *kvm, struct kvm_ppc_rmmu_info *info);
3c313524605a6a Paul Mackerras       2017-02-06  309  	int (*set_smt_mode)(struct kvm *kvm, unsigned long mode,
3c313524605a6a Paul Mackerras       2017-02-06  310  			    unsigned long flags);
2e6baa46b4ae78 Simon Guo            2018-05-21  311  	void (*giveup_ext)(struct kvm_vcpu *vcpu, ulong msr);
aa069a996951f3 Paul Mackerras       2018-09-21  312  	int (*enable_nested)(struct kvm *kvm);
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  313  	int (*load_from_eaddr)(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  314  			       int size);
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  315  	int (*store_to_eaddr)(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
dceadcf91b2e09 Suraj Jitindar Singh 2018-12-14  316  			      int size);
9a5788c615f52f Paul Mackerras       2020-03-19  317  	int (*enable_svm)(struct kvm *kvm);
22945688acd4d0 Bharata B Rao        2019-11-25  318  	int (*svm_off)(struct kvm *kvm);
d9a47edabc4f94 Ravi Bangoria        2020-12-16  319  	int (*enable_dawr1)(struct kvm *kvm);
a722076e947023 Fabiano Rosas        2021-02-05  320  	bool (*hash_v3_possible)(void);
faf01aef057075 Alexey Kardashevskiy 2022-01-11  321  	int (*create_vm_debugfs)(struct kvm *kvm);
faf01aef057075 Alexey Kardashevskiy 2022-01-11  322  	int (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
3a167beac07cba Aneesh Kumar K.V     2013-10-07  323  };
3a167beac07cba Aneesh Kumar K.V     2013-10-07  324  

:::::: The code at line 287 was first introduced by commit
:::::: b1c5356e873cc4fcbb8f58965e0cd910f3ee37a9 KVM: PPC: Convert to the gfn-based MMU notifier callbacks

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
