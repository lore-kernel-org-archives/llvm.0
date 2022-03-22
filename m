Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8FE7A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647934395; x=1679470395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjqTS0bRelAsBLt8UQTDT7EFfOOxxrUvy9T/WMTF0Xo=;
  b=gKQnIpBGeEdoy4hDtDBVWgUJ/1bqvb42ZiIPWEyXge0gWRHm2Vm4nOP6
   4eSIhiRIhvh6zLcDhu5RTFnoIpM39GFWtcgqIaf2ngmCqtTWD80etVoEU
   3Rp7LFI8iLBD/l22VSnHqK0um0riTTZw999NjN26HbUqgdr+3HwQJgnir
   Ro7WGtsQubtoumBbPJ6mMBmmKFpOi29Yrjn0Uh3jn4RgYbX481FbJyYyz
   ldGTejdnlOT8ogmj90veEdPBqVAkflGipBs4iifMCjVUpVqeZNEoLAXgv
   7JAY8MlL2VLEck8abDnatGZecmhxCYZz92CjAqCqluaJgFiusIcvGtz4G
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344179751"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="344179751"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 00:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="515243243"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2022 00:33:07 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWZ0t-000Iam-5w; Tue, 22 Mar 2022 07:33:07 +0000
Date: Tue, 22 Mar 2022 15:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atish.patra@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>, linux-doc@vger.kernel.org
Subject: [ammarfaizi2-block:palmer/linux/riscv-pmu 10/15]
 drivers/perf/riscv_pmu_legacy.c:76: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202203221500.ajQCd6Bp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-pmu
head:   33363c336516e4beb9dd7e8265b369ff96d07dcb
commit: 9b3e150e310ee71d7bae1e31c38a300cfa5e951b [10/15] RISC-V: Add a simple platform driver for RISC-V legacy perf
config: riscv-randconfig-r042-20220320 (https://download.01.org/0day-ci/archive/20220322/202203221500.ajQCd6Bp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/9b3e150e310ee71d7bae1e31c38a300cfa5e951b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-pmu
        git checkout 9b3e150e310ee71d7bae1e31c38a300cfa5e951b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_legacy.c:76: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This is just a simple implementation to allow legacy implementations


vim +76 drivers/perf/riscv_pmu_legacy.c

    74	
    75	/**
  > 76	 * This is just a simple implementation to allow legacy implementations
    77	 * compatible with new RISC-V PMU driver framework.
    78	 * This driver only allows reading two counters i.e CYCLE & INSTRET.
    79	 * However, it can not start or stop the counter. Thus, it is not very useful
    80	 * will be removed in future.
    81	 */
    82	static void pmu_legacy_init(struct riscv_pmu *pmu)
    83	{
    84		pr_info("Legacy PMU implementation is available\n");
    85	
    86		pmu->num_counters = RISCV_PMU_LEGACY_NUM_CTR;
    87		pmu->ctr_start = pmu_legacy_ctr_start;
    88		pmu->ctr_stop = NULL;
    89		pmu->event_map = pmu_legacy_event_map;
    90		pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
    91		pmu->ctr_get_width = NULL;
    92		pmu->ctr_clear_idx = NULL;
    93		pmu->ctr_read = pmu_legacy_read_ctr;
    94	
    95		perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
