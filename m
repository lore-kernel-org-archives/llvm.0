Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B377C
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644602344; x=1676138344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ly4eWRKsJxj3FMJ3dAOIfDAsOe0OiL0UZ2cEYPo6R3E=;
  b=MgTDIgyy7YE/lp4XQHWpNAAavNGDj1pVihBNAU/71EoXVo9gaKfBksx+
   tPbFTh/Wefg/cL30ogjfxiww13Bv3ZjPSRXAnpfK/pC3oRo11QAb7EsX7
   1C+fJH/Dcqe6oFcYuX4/BTAkDeX4L+0HpK9DiTfE7528AUctDnUKrYl3S
   hQqfQx31sXLXtB5Sp5wqtExKSjFE3SX+nmIcnFUMT7UkIxjwSA+/Cdyod
   aPvWQdenSk9KY/PZ389Ajwi6koW8vLhy/9gT2uPHFopwaRVrko7Hunv4c
   Pib9jiTcO+O97XU84mCAH8fifgk33GudBNK1+/5OjDD0ld4Z5ZNBG2uGt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="249984523"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="249984523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 09:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="542184957"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Feb 2022 09:59:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIaCD-0004uU-3x; Fri, 11 Feb 2022 17:59:01 +0000
Date: Sat, 12 Feb 2022 01:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 111/144]
 arch/x86/kvm/vmx/tdx_stubs.c:14:6: warning: no previous prototype for
 function 'tdx_vm_teardown'
Message-ID: <202202112353.bT0JdIv7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   8dfa492341b8e8ba1c9dc534dd55565adc1b0ac0
commit: 1942310bc36276289fa54bb8d077c394078c4b15 [111/144] KVM: TDX: Add methods to ignore accesses to CPU state
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220211/202202112353.bT0JdIv7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/1942310bc36276289fa54bb8d077c394078c4b15
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 1942310bc36276289fa54bb8d077c394078c4b15
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx_stubs.c:14:6: warning: no previous prototype for function 'tdx_vm_teardown' [-Wmissing-prototypes]
   void tdx_vm_teardown(struct kvm *kvm) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_vm_teardown(struct kvm *kvm) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:38:5: warning: no previous prototype for function 'tdx_deliver_posted_interrupt' [-Wmissing-prototypes]
   int tdx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector) { return 0; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector) { return 0; }
   ^
   static 
   2 warnings generated.


vim +/tdx_vm_teardown +14 arch/x86/kvm/vmx/tdx_stubs.c

    12	
    13	int tdx_vm_init(struct kvm *kvm) { return -EOPNOTSUPP; }
  > 14	void tdx_vm_teardown(struct kvm *kvm) {}
    15	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
