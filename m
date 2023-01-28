Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F633F7;
	Sat, 28 Jan 2023 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674935396; x=1706471396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFlt0dTWqnmYysHAAyNP29UYwkWzHS840iyUSaKI5YI=;
  b=hzSC34Ubp/zVUSChsVjfwvSVr9xKguvSLLQpzF2Nq1pVGf19GW4HhA+w
   SwSrn27qlHiX7MjE9AIMsA7YB6Ui+OqKyMXhQMcWiS3SNAcfiFd+1jJpS
   wPa0y/7lDmqaHkzen1i8y/2ZJYWQt1awUF7x+YdoviINvDZZMVlOtCXl0
   VNtst0/Slklb6nAZQ5M3x+Srm9on8UCl4e4Zt/sqMA9DRv/rQMRw2ECgZ
   k/AWzEW1G+4us/Jyhk127+B/DJm0YCjSpYP7HCgQXLv4Ek0pH9kNL/GVR
   zTSewnefYp09uBvXBU4Bh7TQlSiKSt4RLyY7s8pOqBJ8wbpvB8EdMBCXo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413548373"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413548373"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 11:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="732231778"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="732231778"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2023 11:49:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLrCv-000137-1J;
	Sat, 28 Jan 2023 19:49:49 +0000
Date: Sun, 29 Jan 2023 03:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 35/52]
 arch/riscv/kvm/aia_aplic.c:264:6: warning: variable 'inject' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202301290307.OaC4P0U7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   d04f10f89dd06562a982bfad9f8eac0569204d60
commit: d215844ff37ecccad7be31db0b38cc9a12927a2c [35/52] RISC-V: KVM: Add in-kernel emulation of AIA APLIC
config: riscv-randconfig-r014-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290307.OaC4P0U7-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/d215844ff37ecccad7be31db0b38cc9a12927a2c
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout d215844ff37ecccad7be31db0b38cc9a12927a2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_aplic.c:264:6: warning: variable 'inject' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (irqd->sourcecfg & APLIC_SOURCECFG_D)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_aplic.c:303:6: note: uninitialized use occurs here
           if (inject)
               ^~~~~~
   arch/riscv/kvm/aia_aplic.c:264:2: note: remove the 'if' if its condition is always false
           if (irqd->sourcecfg & APLIC_SOURCECFG_D)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_aplic.c:252:13: note: initialize the variable 'inject' to silence this warning
           bool inject, ie;
                      ^
                       = 0
   1 warning generated.


vim +264 arch/riscv/kvm/aia_aplic.c

   248	
   249	int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level)
   250	{
   251		u32 target;
   252		bool inject, ie;
   253		unsigned long flags;
   254		struct aplic_irq *irqd;
   255		struct aplic *aplic = kvm->arch.aia.aplic_state;
   256	
   257		if (!aplic || !source || (aplic->nr_irqs <= source))
   258			return -ENODEV;
   259		irqd = &aplic->irqs[source];
   260		ie = (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;
   261	
   262		raw_spin_lock_irqsave(&irqd->lock, flags);
   263	
 > 264		if (irqd->sourcecfg & APLIC_SOURCECFG_D)
   265			goto skip_unlock;
   266	
   267		switch (irqd->sourcecfg & APLIC_SOURCECFG_SM_MASK) {
   268		case APLIC_SOURCECFG_SM_EDGE_RISE:
   269			if (level && !(irqd->state & APLIC_IRQ_STATE_INPUT) &&
   270			    !(irqd->state & APLIC_IRQ_STATE_PENDING))
   271				irqd->state |= APLIC_IRQ_STATE_PENDING;
   272			break;
   273		case APLIC_SOURCECFG_SM_EDGE_FALL:
   274			if (!level && (irqd->state & APLIC_IRQ_STATE_INPUT) &&
   275			    !(irqd->state & APLIC_IRQ_STATE_PENDING))
   276				irqd->state |= APLIC_IRQ_STATE_PENDING;
   277			break;
   278		case APLIC_SOURCECFG_SM_LEVEL_HIGH:
   279			if (level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
   280				irqd->state |= APLIC_IRQ_STATE_PENDING;
   281			break;
   282		case APLIC_SOURCECFG_SM_LEVEL_LOW:
   283			if (!level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
   284				irqd->state |= APLIC_IRQ_STATE_PENDING;
   285			break;
   286		}
   287	
   288		if (level)
   289			irqd->state |= APLIC_IRQ_STATE_INPUT;
   290		else
   291			irqd->state &= ~APLIC_IRQ_STATE_INPUT;
   292	
   293		inject = false;
   294		target = irqd->target;
   295		if (ie && (irqd->state & APLIC_IRQ_STATE_ENPEND)) {
   296			irqd->state &= ~APLIC_IRQ_STATE_PENDING;
   297			inject = true;
   298		}
   299	
   300	skip_unlock:
   301		raw_spin_unlock_irqrestore(&irqd->lock, flags);
   302	
   303		if (inject)
   304			aplic_inject_msi(kvm, source, target);
   305	
   306		return 0;
   307	}
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
