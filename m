Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F36E1E513;
	Wed, 10 May 2023 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683757313; x=1715293313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9nz11hgr1pdyboo2d2yucR9JBZTPgmdIvG8fig0W0A=;
  b=QBcu5+nJlcSPneK94ESYTmLUCFPG3PDzgr/ODys657DZnq938jkEX5lT
   fyNre3K1VpYzWFR00E+YP5VEnNaPGStv+K8qaJB7J/SSSmvYW/cIMjtPp
   /PbHraOKxym7PhuAGkH63+zf0Ace6HIoPcXC7TadbJOAYe3z8OQoD9WN/
   9K9CaM3c2BIow03eW/PGQIaE88iThPNcrwbq+C3CvkcLMxaUVXwtT0rWs
   vzme/ajXwg08APP3612U0DHSMrZfP4szza6l1Wn9dg5Xzer5DUVJRjd5s
   FF9faHSrSKd6MCTF3EB+iWYpE4NTr75vcbiAb8Sk4stB4fNPXfQyrUN2p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352537571"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="352537571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 15:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649896511"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="649896511"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 15:21:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwsBv-0003cL-1w;
	Wed, 10 May 2023 22:21:47 +0000
Date: Thu, 11 May 2023 06:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 3/7]
 drivers/perf/riscv_pmu_sbi.c:473:4: warning: misleading indentation;
 statement is not part of the previous 'if'
Message-ID: <202305110618.gYfUFQjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb [3/7] drivers/pmu: sbi: Read upper bits of a firmware counter
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230511/202305110618.gYfUFQjG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/atishp04/linux/commit/49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110618.gYfUFQjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:473:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                           if (!ret.error)
                           ^
   drivers/perf/riscv_pmu_sbi.c:470:3: note: previous statement is here
                   if (sbi_v2_available && info.width >= 32)
                   ^
>> drivers/perf/riscv_pmu_sbi.c:474:28: warning: shift count >= width of type [-Wshift-count-overflow]
                                   val = val | (ret.value << 32);
                                                          ^  ~~
   2 warnings generated.


vim +/if +473 drivers/perf/riscv_pmu_sbi.c

   455	
   456	static u64 pmu_sbi_ctr_read(struct perf_event *event)
   457	{
   458		struct hw_perf_event *hwc = &event->hw;
   459		int idx = hwc->idx;
   460		struct sbiret ret;
   461		u64 val = 0;
   462		union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
   463	
   464		if (pmu_sbi_is_fw_event(event)) {
   465			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
   466					hwc->idx, 0, 0, 0, 0, 0);
   467			if (!ret.error)
   468				val = ret.value;
   469	#if defined(CONFIG_32BIT)
   470			if (sbi_v2_available && info.width >= 32)
   471				ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
   472						hwc->idx, 0, 0, 0, 0, 0);
 > 473				if (!ret.error)
 > 474					val = val | (ret.value << 32);
   475	#endif
   476		} else {
   477			val = riscv_pmu_ctr_read_csr(info.csr);
   478			if (IS_ENABLED(CONFIG_32BIT))
   479				val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
   480		}
   481	
   482		return val;
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
