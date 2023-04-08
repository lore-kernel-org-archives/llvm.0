Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647415A0;
	Sat,  8 Apr 2023 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680925108; x=1712461108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnO0sDPl1HQzTQIUjCRe8kSlZAJ1tELSqKn2OfnckgA=;
  b=HbT7dt4Pi/ps9/+FE9wDpjIcX6zh3r1he1ovy53kahuWD9PTAW82jU6p
   bO/DTc82iEbw6NqhYh5Ov02DW4+du60e/hDhjAs+Wr/rhIb5oAHug1m3L
   uJzL4405Uny7jNeyOpsXwzKmDd8oDXwWRbSKlmkhU6PvXfeJIx0GAQ5Ce
   UFjlaZhft68fPHzu3edz8FwahwYO4x4hIfX6BNDfJixzt6yirqG82kd1c
   Xuj9CwKmSqujwRleEYmPe4b63nXVTvnKhwC4IOP2yNmrhoMT6w9oebKb0
   pWpTerD4eJXfgtoNDGEYTX9WPDrkv3wwzhh3S35KCAFwIN7C6YTLByEGi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405933301"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405933301"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 20:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811589947"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="811589947"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 20:38:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkzPG-000TFx-06;
	Sat, 08 Apr 2023 03:38:26 +0000
Date: Sat, 8 Apr 2023 11:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [avpatel:riscv_kvm_aia_csr_v4 19/20] arch/riscv/kvm/aia.c:67:3:
 error: expected ')'
Message-ID: <202304081121.tuXRhkCT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_csr_v4
head:   10a633664c6222e488f960ad5e20823853c085e0
commit: 07b94e72a68ca6f3ea93dbc2e419de440467bd35 [19/20] RISC-V: KVM: Virtualize per-HART AIA CSRs
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230408/202304081121.tuXRhkCT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/07b94e72a68ca6f3ea93dbc2e419de440467bd35
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_csr_v4
        git checkout 07b94e72a68ca6f3ea93dbc2e419de440467bd35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081121.tuXRhkCT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/aia.c:67:3: error: expected ')'
                   return true;
                   ^
   arch/riscv/kvm/aia.c:65:5: note: to match this '('
           if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
              ^
   1 error generated.


vim +67 arch/riscv/kvm/aia.c

    56	
    57	bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
    58	{
    59		unsigned long seip;
    60	
    61		if (!kvm_riscv_aia_available())
    62			return false;
    63	
    64	#ifdef CONFIG_32BIT
    65		if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
    66		    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask))
  > 67			return true;
    68	#endif
    69	
    70		seip = vcpu->arch.guest_csr.vsie;
    71		seip &= (unsigned long)mask;
    72		seip &= BIT(IRQ_S_EXT);
    73	
    74		if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
    75			return false;
    76	
    77		return false;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
