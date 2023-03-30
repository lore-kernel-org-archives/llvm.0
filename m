Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C339455;
	Thu, 30 Mar 2023 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680207265; x=1711743265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bea+xem6elcdy2LZ06ZtGG8Us1sXLJgZqGD29PtHwGE=;
  b=hBAttRNr8nPkNwPr33XgEtasgRd6CdRhuCP5d6CxVevx+GZepbkBcLBF
   3mj1twib4+PlFK6u/Mv/zcPrlRPwDodo6kDzmKJTuVX9nov8GSETSI4GT
   cPlc86m8npGkZ21g5uWlKQ2UuL3eXELzfVTCU21H84ap6/O9lHXNKUtlx
   2qIYYmXL8WLqH13cMcI/I7wy3tdGvsihi+wl+pBtIF3OgqrfGolwD7PYl
   B46AZtHGVOAn6YcJ7Yve58m7JadwtIFul460J2wbc4sFXmTEJgKNVnDoG
   hweRjgoAvm8z9L7nycypD7P0aYGuP9oNhfTRNqIUQmtjZLGgXWjw0gv6S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338778297"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="338778297"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 13:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635049774"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="635049774"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2023 13:14:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phyeu-000LBG-2Z;
	Thu, 30 Mar 2023 20:14:08 +0000
Date: Fri, 31 Mar 2023 04:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Yao <yuan.yao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 252/328]
 arch/x86/kvm/vmx/tdx.c:2536:6: warning: variable 'intr_info' set but not
 used
Message-ID: <202303310456.PGvMNNVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: 7ee20d457dea511ea551519e66484f5e160c3f5c [252/328] KVM: TDX: Basic exception injection support for DEBUG TDX guest
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310456.PGvMNNVS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/7ee20d457dea511ea551519e66484f5e160c3f5c
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 7ee20d457dea511ea551519e66484f5e160c3f5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310456.PGvMNNVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:2536:6: warning: variable 'intr_info' set but not used [-Wunused-but-set-variable]
           u32 intr_info;
               ^
   1 warning generated.


vim +/intr_info +2536 arch/x86/kvm/vmx/tdx.c

  2521	
  2522	void tdx_set_gdt(struct kvm_vcpu *vcpu, struct desc_ptr *dt)
  2523	{
  2524		if (!is_debug_td(vcpu))
  2525			return;
  2526	
  2527		td_vmcs_write32(to_tdx(vcpu), GUEST_GDTR_LIMIT, dt->size);
  2528		td_vmcs_write64(to_tdx(vcpu), GUEST_GDTR_BASE, dt->address);
  2529	}
  2530	void tdx_inject_exception(struct kvm_vcpu *vcpu)
  2531	{
  2532		struct vcpu_tdx *tdx;
  2533		unsigned int vector;
  2534		bool has_error_code;
  2535		u32 error_code;
> 2536		u32 intr_info;
  2537	
  2538		if (KVM_BUG_ON(!is_debug_td(vcpu), vcpu->kvm))
  2539			return;
  2540	
  2541		tdx = to_tdx(vcpu);
  2542		vector = vcpu->arch.exception.vector;
  2543		has_error_code = vcpu->arch.exception.has_error_code;
  2544		error_code = vcpu->arch.exception.error_code;
  2545		intr_info = vector | INTR_INFO_VALID_MASK;
  2546	
  2547		kvm_deliver_exception_payload(vcpu, &vcpu->arch.exception);
  2548	
  2549		if (has_error_code) {
  2550			td_vmcs_write32(tdx, VM_ENTRY_EXCEPTION_ERROR_CODE,
  2551					error_code);
  2552			intr_info |= INTR_INFO_DELIVER_CODE_MASK;
  2553		}
  2554	
  2555		if (kvm_exception_is_soft(vector)) {
  2556			td_vmcs_write32(tdx, VM_ENTRY_INSTRUCTION_LEN,
  2557					vcpu->arch.event_exit_inst_len);
  2558			intr_info |= INTR_TYPE_SOFT_EXCEPTION;
  2559		} else {
  2560			intr_info |= INTR_TYPE_HARD_EXCEPTION;
  2561		}
  2562	
  2563		pr_warn_once("Exception injection is not supported by TDX.\n");
  2564		/* td_vmcs_write32(tdx, VM_ENTRY_INTR_INFO_FIELD, intr_info);*/
  2565	}
  2566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
