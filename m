Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4E7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659394917; x=1690930917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qaxB4sl8a/rH+tTAChpuZTrtwZkUmR2acUchCg95ECU=;
  b=QlVaPyuWTf6ElyqUmZM57JmiEkhEiMSpEyAOvpBuOmqOiI8JBHz8w17E
   eS+NIzgAkUPA/iwxrqnWvft4nkHLunxb2bmyOlOg9wQhiz85OfDvmgThu
   gU04VnuI9nmhWjuHPSi26Bs2DHwZmcDoRiuVQ8Cbnx5sy/+QSWC5VBmQz
   vNgEyjXj1z6hKGf0Inb50AfOGyi8u5S6B56jzAxe9bh+PpEcLLV3Evn5M
   lJ27bxa/iFhCpi2flIHKYajWRGodqX2A6CourFkRl5qXQSU/DnIHVrGM1
   9eFC83U7JEciDIoPx8vxqyAGjf6F0OACjlz/xP8IsBxrrVHSpTHJzKcUp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286829123"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="286829123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 16:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="691633782"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2022 16:01:53 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIeQ5-000FSI-0h;
	Mon, 01 Aug 2022 23:01:53 +0000
Date: Tue, 2 Aug 2022 07:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pmu-chained 6/6]
 arch/arm64/kvm/pmu-emul.c:175:7: warning: variable 'val' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202208020643.wTCgOkeH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pmu-chained
head:   ed5c6c9ddd3a3376659e45652c263cee7ee0ac2f
commit: ed5c6c9ddd3a3376659e45652c263cee7ee0ac2f [6/6] rework overflow conditions
config: arm64-buildonly-randconfig-r003-20220801 (https://download.01.org/0day-ci/archive/20220802/202208020643.wTCgOkeH-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=ed5c6c9ddd3a3376659e45652c263cee7ee0ac2f
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/pmu-chained
        git checkout ed5c6c9ddd3a3376659e45652c263cee7ee0ac2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pmu-emul.c:175:7: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (!kvm_pmu_idx_is_64bit(vcpu, pmc->idx))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/pmu-emul.c:179:30: note: uninitialized use occurs here
           __vcpu_sys_reg(vcpu, reg) = val;
                                       ^~~
   arch/arm64/kvm/pmu-emul.c:175:3: note: remove the 'if' if its condition is always true
                   if (!kvm_pmu_idx_is_64bit(vcpu, pmc->idx))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/pmu-emul.c:163:23: note: initialize the variable 'val' to silence this warning
           u64 counter, reg, val;
                                ^
                                 = 0
   1 warning generated.


vim +175 arch/arm64/kvm/pmu-emul.c

   154	
   155	/**
   156	 * kvm_pmu_stop_counter - stop PMU counter
   157	 * @pmc: The PMU counter pointer
   158	 *
   159	 * If this counter has been configured to monitor some event, release it here.
   160	 */
   161	static void kvm_pmu_stop_counter(struct kvm_vcpu *vcpu, struct kvm_pmc *pmc)
   162	{
   163		u64 counter, reg, val;
   164	
   165		if (!pmc->perf_event)
   166			return;
   167	
   168		counter = kvm_pmu_get_counter_value(vcpu, pmc->idx);
   169	
   170		if (pmc->idx == ARMV8_PMU_CYCLE_IDX) {
   171			reg = PMCCNTR_EL0;
   172			val = counter;
   173		} else {
   174			reg = PMEVCNTR0_EL0 + pmc->idx;
 > 175			if (!kvm_pmu_idx_is_64bit(vcpu, pmc->idx))
   176				val = lower_32_bits(counter);
   177		}
   178	
   179		__vcpu_sys_reg(vcpu, reg) = val;
   180	
   181		kvm_pmu_release_perf_event(pmc);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
