Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07017D7;
	Sun, 30 Apr 2023 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682839043; x=1714375043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQjDB/4OFzgiXuKfw6ChmrDohOUgOqd6RJnqLP7bvkE=;
  b=e/4nBRYoU08D0kOHSHnWj0pboQw/13gT5aWfWXm52zJQJdbvuvsnVW6l
   N9FxRMV2El3mDk7m7y7WfQ6rSkc4bBmi8pDjcngCMsIj8izZUE3aMyIWb
   2wyZd+JFoVVGKtEuWkGz7vXxSOYINYRPSlOJQVctnnp+2BmxroqgnaS4s
   DHbW3FpyOeV2t8B/X1qez5Af4dACL3Y84VCRwW+vAPhLQj/W4Wj0ElGxD
   DGoc3VEg084OpWpOmkoqlh12hQbRnpB/cxulR5hSwX7JYthgFBBpSeIbe
   8QiYNl4nMrUspDrWKKlBxpPmsX8+Mb/GVO2YZACxGUR/OTsG1vebFL/se
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332342861"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="332342861"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 00:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="819641952"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="819641952"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Apr 2023 00:17:21 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt1JA-0001Xp-2n;
	Sun, 30 Apr 2023 07:17:20 +0000
Date: Sun, 30 Apr 2023 15:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Yao <yuan.yao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 256/338]
 arch/x86/kvm/vmx/tdx.c:2547:6: warning: variable 'intr_info' set but not
 used
Message-ID: <202304301527.MTE2GE63-lkp@intel.com>
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
commit: de4a8b56e21e09b5d0cca6f846b97837a41aa37c [256/338] KVM: TDX: Basic exception injection support for DEBUG TDX guest
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230430/202304301527.MTE2GE63-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/de4a8b56e21e09b5d0cca6f846b97837a41aa37c
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout de4a8b56e21e09b5d0cca6f846b97837a41aa37c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301527.MTE2GE63-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:2547:6: warning: variable 'intr_info' set but not used [-Wunused-but-set-variable]
           u32 intr_info;
               ^
   1 warning generated.


vim +/intr_info +2547 arch/x86/kvm/vmx/tdx.c

  2532	
  2533	void tdx_set_gdt(struct kvm_vcpu *vcpu, struct desc_ptr *dt)
  2534	{
  2535		if (!is_debug_td(vcpu))
  2536			return;
  2537	
  2538		td_vmcs_write32(to_tdx(vcpu), GUEST_GDTR_LIMIT, dt->size);
  2539		td_vmcs_write64(to_tdx(vcpu), GUEST_GDTR_BASE, dt->address);
  2540	}
  2541	void tdx_inject_exception(struct kvm_vcpu *vcpu)
  2542	{
  2543		struct vcpu_tdx *tdx;
  2544		unsigned int vector;
  2545		bool has_error_code;
  2546		u32 error_code;
> 2547		u32 intr_info;
  2548	
  2549		if (KVM_BUG_ON(!is_debug_td(vcpu), vcpu->kvm))
  2550			return;
  2551	
  2552		tdx = to_tdx(vcpu);
  2553		vector = vcpu->arch.exception.vector;
  2554		has_error_code = vcpu->arch.exception.has_error_code;
  2555		error_code = vcpu->arch.exception.error_code;
  2556		intr_info = vector | INTR_INFO_VALID_MASK;
  2557	
  2558		kvm_deliver_exception_payload(vcpu, &vcpu->arch.exception);
  2559	
  2560		if (has_error_code) {
  2561			td_vmcs_write32(tdx, VM_ENTRY_EXCEPTION_ERROR_CODE,
  2562					error_code);
  2563			intr_info |= INTR_INFO_DELIVER_CODE_MASK;
  2564		}
  2565	
  2566		if (kvm_exception_is_soft(vector)) {
  2567			td_vmcs_write32(tdx, VM_ENTRY_INSTRUCTION_LEN,
  2568					vcpu->arch.event_exit_inst_len);
  2569			intr_info |= INTR_TYPE_SOFT_EXCEPTION;
  2570		} else {
  2571			intr_info |= INTR_TYPE_HARD_EXCEPTION;
  2572		}
  2573	
  2574		pr_warn_once("Exception injection is not supported by TDX.\n");
  2575		/* td_vmcs_write32(tdx, VM_ENTRY_INTR_INFO_FIELD, intr_info);*/
  2576	}
  2577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
