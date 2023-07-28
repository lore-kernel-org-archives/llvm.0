Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F92F35;
	Fri, 28 Jul 2023 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690526103; x=1722062103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCAYqtPO646FojTPeUaVaOlxNfh1eZtXR/rGcjHLlXA=;
  b=f1t/c31CUGbEumzcDkat+8ibCdnKzeJ7B8JAW7E/cajvbooW15e38TGh
   jAND/j92K6nJyZm3MvB8OL85FInwCuqlKPqzDRMRK7lCGCDbtVOkWaYsD
   sFkq1L7byLWsoTxdc1bGf2xdzllZFXAN9vD96w7U31W3VBgAiwQUTy7Xt
   XztWNhD0ctSUvX8Gm+PqMMKE60pRyHFdgb8SznHXvi9BYh+taewUp8CIP
   BoyvG3u6O6ggK3qguVF79YuUEM7GfwZ7smHCkamoiy37UAuAtldXYkBXq
   n8HLhHx5Z4syadkUAlqQplMYwOzxeBfIJWajG9qCgwxjlQsrVQulz8YXj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454882807"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="454882807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 23:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727352725"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="727352725"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 23:34:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPH3l-0002wx-0G;
	Fri, 28 Jul 2023 06:34:45 +0000
Date: Fri, 28 Jul 2023 14:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 33/75] drivers/soc/sifive/sifive_ccache.c:156:21:
 error: '__section__' attribute only applies to functions, global variables,
 Objective-C methods, and Objective-C properties
Message-ID: <202307281457.a61VNqfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   4370487fce31acaedcc03e8bd2e64f3a9c591821
commit: 49753f0d8f50a1e78df6b1d095eb548e72f4f205 [33/75] soc: sifive: ccache: Support cache management operations
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230728/202307281457.a61VNqfJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281457.a61VNqfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281457.a61VNqfJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/sifive/sifive_ccache.c:156:21: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     156 | static const struct __initdata riscv_cache_ops ccache_mgmt_ops = {
         |                     ^
   include/linux/init.h:53:20: note: expanded from macro '__initdata'
      53 | #define __initdata      __section(".init.data")
         |                         ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
     334 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   1 error generated.


vim +/__section__ +156 drivers/soc/sifive/sifive_ccache.c

   155	
 > 156	static const struct __initdata riscv_cache_ops ccache_mgmt_ops = {
   157		.wback = &ccache_flush_range,
   158		.inv = &ccache_flush_range,
   159		.wback_inv = &ccache_flush_range,
   160	};
   161	#endif /* CONFIG_RISCV_NONSTANDARD_CACHE_OPS */
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
