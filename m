Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD8173
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641235214; x=1672771214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FaGXdKT6FdLQV1VDy/vJjt2TYtlez/TqCQw7hQOerwc=;
  b=VzbX+5HLzScl6q4RVLhkmpXDfnIGRB9A86d5E1Vjb8aM2+IhtYWTRCyq
   FPFxXOkLLaL3GAcqB/13y2jvedaVNWfm7XUTTQaNhkIk46YYi1xxA/KxB
   4Sudj0tnZNW/ZvneUCuJsbjL40Ezxlcsqsb0IfgXpVKQbhjqr6tXp+t31
   qIxqSwEPqGtyFz5fops4/awm8RnWZ6R/WnXE9TWGniZTqhNraKjsuMbiW
   xs6DVyiLeHsrSZlyAbIHgik94M0D63YnYmS+/4m7MR0ILicHsZLWbs6ZQ
   /RNxyaYrzlodJxww36/e3ocEYtsFXHb4JL9DpVzQFpCpknLNmxg4JBiXN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="222775668"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="222775668"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 10:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="620392878"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Jan 2022 10:40:12 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4SFf-000EL5-IS; Mon, 03 Jan 2022 18:40:11 +0000
Date: Tue, 4 Jan 2022 02:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/pmu-bl 4/5]
 arch/arm64/kvm/pmu-emul.c:895:24: error: use of undeclared identifier 'kvm'
Message-ID: <202201040228.xRreWFaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pmu-bl
head:   877a6850e9bc0d29fa60dbedf345300c0f3396e4
commit: 0071239cd4ab9fc0b5cb9b911b36adee31598f3f [4/5] KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_SET_PMU attribute
config: arm64-randconfig-r013-20220103 (https://download.01.org/0day-ci/archive/20220104/202201040228.xRreWFaE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a827ea6de0cbe0f5faef4407552ede31d165c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=0071239cd4ab9fc0b5cb9b911b36adee31598f3f
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/pmu-bl
        git checkout 0071239cd4ab9fc0b5cb9b911b36adee31598f3f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/pmu-emul.c:895:24: error: use of undeclared identifier 'kvm'
           if (irqchip_in_kernel(kvm)) {
                                 ^
   arch/arm64/kvm/pmu-emul.c:903:25: error: use of undeclared identifier 'kvm'
                   if (!vgic_initialized(kvm))
                                         ^
>> arch/arm64/kvm/pmu-emul.c:906:8: error: no member named 'pmu' in 'struct kvm_arch'
                   if (!kvm_arm_pmu_irq_initialized(vcpu->kvm))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kvm/arm_pmu.h:45:51: note: expanded from macro 'kvm_arm_pmu_irq_initialized'
   #define kvm_arm_pmu_irq_initialized(v)  ((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
                                            ~~~~~~~~~ ^
   3 errors generated.


vim +/kvm +895 arch/arm64/kvm/pmu-emul.c

   892	
   893	static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
   894	{
 > 895		if (irqchip_in_kernel(kvm)) {
   896			int ret;
   897	
   898			/*
   899			 * If using the PMU with an in-kernel virtual GIC
   900			 * implementation, we require the GIC to be already
   901			 * initialized when initializing the PMU.
   902			 */
   903			if (!vgic_initialized(kvm))
   904				return -ENODEV;
   905	
 > 906			if (!kvm_arm_pmu_irq_initialized(vcpu->kvm))
   907				return -ENXIO;
   908	
   909			ret = kvm_vgic_set_owner(vcpu, vcpu->arch.pmu.irq_num,
   910						 &vcpu->arch.pmu);
   911			if (ret)
   912				return ret;
   913		}
   914	
   915		init_irq_work(&vcpu->arch.pmu.overflow_work,
   916			      kvm_pmu_perf_overflow_notify_vcpu);
   917	
   918		atomic_set(&vcpu->arch.pmu.created, 1);
   919	
   920		return 0;
   921	}
   922	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
