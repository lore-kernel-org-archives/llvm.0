Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB108839;
	Mon, 24 Jul 2023 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690212115; x=1721748115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyCcFKDOaGEp+RHeQHDa0hvD6I2xyirhVE8nbOeL3BM=;
  b=ZkWo39MlDjYon4GNNw2ypdTFXvMIqeqNccYC7EjsCfBI54e4Q2yqpTqG
   SouI5chpAOu6sm3hh8iSZszru0q531lXSIwLbrlZ4QWKCAYRDM3+P0+Sr
   NSGXhdSLIbKyMqcB/+GJgW+pX05vm12FWdQNJw6L03jXiQgNaDC2eeERO
   J+fGNhsChrOjLFbtnLKPFRAUAlr3No6AX2ylsxHx663xWQo7H9lrVBZKH
   j2x8ktv9xsua750Mk8m+6TydZASxLhkrwAacJitVgUun0ZpxFEERgx1iF
   DV8r9TTWWckwoygTyxyCxIwzuj3DCdSq8qjNT7kmqpBwxVA6BKOoW613k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366362203"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="366362203"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="795816473"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="795816473"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2023 08:21:52 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNxNb-0009oG-0L;
	Mon, 24 Jul 2023 15:21:48 +0000
Date: Mon, 24 Jul 2023 23:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable
 'mtmips_of_match'
Message-ID: <202307242310.CdOnd2py-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
commit: 6f3b15586eef736831abe6a14f2a6906bc0dc074 clk: ralink: add clock and reset driver for MTMIPS SoCs
date:   5 weeks ago
config: x86_64-buildonly-randconfig-r003-20230723 (https://download.01.org/0day-ci/archive/20230724/202307242310.CdOnd2py-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242310.CdOnd2py-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242310.CdOnd2py-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/ralink/clk-mtmips.c:309:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           return ret;
                  ^~~
   drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable 'ret' to silence this warning
           int ret, i;
                  ^
                   = 0
   drivers/clk/ralink/clk-mtmips.c:359:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           return ret;
                  ^~~
   drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable 'ret' to silence this warning
           int ret, i;
                  ^
                   = 0
>> drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmips_of_match' [-Wunused-const-variable]
   static const struct of_device_id mtmips_of_match[] = {
                                    ^
   3 warnings generated.


vim +/mtmips_of_match +821 drivers/clk/ralink/clk-mtmips.c

   820	
 > 821	static const struct of_device_id mtmips_of_match[] = {
   822		{
   823			.compatible = "ralink,rt2880-sysc",
   824			.data = &rt2880_clk_data,
   825		},
   826		{
   827			.compatible = "ralink,rt3050-sysc",
   828			.data = &rt305x_clk_data,
   829		},
   830		{
   831			.compatible = "ralink,rt3052-sysc",
   832			.data = &rt305x_clk_data,
   833		},
   834		{
   835			.compatible = "ralink,rt3352-sysc",
   836			.data = &rt3352_clk_data,
   837		},
   838		{
   839			.compatible = "ralink,rt3883-sysc",
   840			.data = &rt3883_clk_data,
   841		},
   842		{
   843			.compatible = "ralink,rt5350-sysc",
   844			.data = &rt5350_clk_data,
   845		},
   846		{
   847			.compatible = "ralink,mt7620-sysc",
   848			.data = &mt7620_clk_data,
   849		},
   850		{
   851			.compatible = "ralink,mt7628-sysc",
   852			.data = &mt76x8_clk_data,
   853		},
   854		{
   855			.compatible = "ralink,mt7688-sysc",
   856			.data = &mt76x8_clk_data,
   857		},
   858		{}
   859	};
   860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
