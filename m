Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847F27706;
	Fri, 24 Mar 2023 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679696077; x=1711232077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdSbpr8UOno21L70QAYxlXrHiZmhrOSEQlRJoQg34PI=;
  b=T462mBPcOK6nLFhovyJh2lKhLN9NqHnRS6u0eSDkUZ32U1C4nyGWZvc5
   /dcXz9Zz5tn38pAhBOKY3PbzDcpd8otUoQJhzixv24a71QgT0A1SCKRWT
   xE5iLtB32LufavW+4+cYKY1x0dXfzYMgydWIGpnHb07vhwDorD3mPauY/
   cnKr8BuqvKO/iYFJGfnnxqGLM8L0a9icpv1R2vMi1O8GgE8HdZLjkhprQ
   2MahVwChI0aukybslWybBpPK3ONHE47AEetyqstdCU9otUhR66epXFuU0
   BqedwnV+5Roi+65M0NsVivPAhy8+oqQ+/fpSCPU0rewZ2yerzSfnxhVPi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328322330"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="328322330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 15:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682832307"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="682832307"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 15:14:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfpgB-000FhP-0A;
	Fri, 24 Mar 2023 22:14:35 +0000
Date: Sat, 25 Mar 2023 06:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:alexghiti_test 51/78] arch/riscv/kvm/aia_aplic.c:264:6:
 warning: variable 'inject' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202303250639.tVnfIjzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: c9c4cf36341f2f48f84a8db75d1908a21d130de2 [51/78] RISC-V: KVM: Add in-kernel emulation of AIA APLIC
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230325/202303250639.tVnfIjzY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/c9c4cf36341f2f48f84a8db75d1908a21d130de2
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout c9c4cf36341f2f48f84a8db75d1908a21d130de2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250639.tVnfIjzY-lkp@intel.com/

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
