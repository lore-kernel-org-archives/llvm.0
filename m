Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9E3D60;
	Mon, 29 May 2023 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685365930; x=1716901930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQ2OVp0QljR5baDEtU4HsmwJbaoW64/YHR9On/0jnoA=;
  b=ebytcL4GzgMFQKWu5VbyHFJ/6lw7Xk5JcfyMGjwOfv5DLx3imm56ZfUa
   PuJ+3879TpuifsBAFnR+lt/8UpIddP2V0AAaNbxm1l6YYnDm4NLB94/Sj
   w8Rzr/a9YVCyn4BL1Q2qvDfjB2cXN47BwI19mmizdB/pLNwIyxsJhZ5nz
   ob9Fg6R7Cf/XTFUqUvv9ld5Kwdj6bayRXFuxf6qaRCypIHQs7qSWoZZxz
   0m8W50j7xoUVXTw5eIRCPXhNskmjQBciItuwAtqS51FrDgySzCR8EPcWh
   GhBPV54d8B7aVxVoqZPBBMO+nuk3rns1npTxWUWeDaaQdNqphrGsEf+/e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420459045"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="420459045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 06:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="1036219812"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="1036219812"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 May 2023 06:12:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3cfP-000L09-1C;
	Mon, 29 May 2023 13:12:07 +0000
Date: Mon, 29 May 2023 21:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 319/327]
 arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1979:12: warning: no previous
 prototype for function 'kvm_arch_required_alignment'
Message-ID: <202305292058.bSTEzaTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   148ce77f987a3cf12193c1f81baa78f41cf13154
commit: f9628fde0c623c76992345cebbf4cefdcc6bb542 [319/327] KVM: Relax alignment check for restricted mem
config: arm64-buildonly-randconfig-r002-20230529 (https://download.01.org/0day-ci/archive/20230529/202305292058.bSTEzaTY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel/tdx/commit/f9628fde0c623c76992345cebbf4cefdcc6bb542
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout f9628fde0c623c76992345cebbf4cefdcc6bb542
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305292058.bSTEzaTY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1981:19: error: expected ';' after return statement
           return PAGE_SHIFT
                            ^
                            ;
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1979:12: warning: no previous prototype for function 'kvm_arch_required_alignment' [-Wmissing-prototypes]
   __weak int kvm_arch_required_alignment(u64 gpa)
              ^
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1979:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak int kvm_arch_required_alignment(u64 gpa)
          ^
          static 
   1 warning and 1 error generated.


vim +/kvm_arch_required_alignment +1979 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

  1977	
  1978	#ifndef kvm_arch_required_alignment
> 1979	__weak int kvm_arch_required_alignment(u64 gpa)
  1980	{
> 1981		return PAGE_SHIFT
  1982	}
  1983	#endif
  1984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
