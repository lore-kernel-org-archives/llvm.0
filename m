Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69587A
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654865217; x=1686401217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fPRffznqP3QJikn1bGV+biqojxGyPlNiUoj0REL35Q=;
  b=M79Cfhx962Wq0IU/2LdWRc677vcfiVYSuYBR8cziGQgqnkWPoZaU0kuT
   S5+VcJtW8TRkR2WI/zXzxox8gH4+qkNAJq1SB63d8y5VZEPvOHbiUE+vf
   PX1D0mfaPSNcQ+NFy1Txs6ASMjwffDssjUiED5PpVpF0um6wm0bu07rgq
   bgTWi1mxWybg20xpf8X5PWGiuT/6Xj/MY/WKI7qH+ZGjHf/e3GFs4s2M1
   33E2CO6vzB39YrSWqbUt3Azp9DONAAukWFPjAEVLHfMKDtiQMdz6GOIDp
   c7mkoLFSie1kQoR4VNycpNPE9E8BcEXj6M+Gzq8Kcrpd53dQ56h4oCGlG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="275152261"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="275152261"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 05:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="671831932"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 05:46:39 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nze2A-000Hwf-U6;
	Fri, 10 Jun 2022 12:46:38 +0000
Date: Fri, 10 Jun 2022 20:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vireshk-pm:opp/linux-next 51/52] drivers/opp/core.c:97:6: warning:
 no previous prototype for function 'assert_single_clk'
Message-ID: <202206102000.LY9iR2Ek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   76c4db9b37866c60306d39ed982cba56af15ff00
commit: a62471a6205813e478c21edb405d62285ea6be6e [51/52] OPP: Assert clk_count == 1 for single clk helpers
config: arm64-randconfig-r025-20220610 (https://download.01.org/0day-ci/archive/20220610/202206102000.LY9iR2Ek-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?id=a62471a6205813e478c21edb405d62285ea6be6e
        git remote add vireshk-pm https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
        git fetch --no-tags vireshk-pm opp/linux-next
        git checkout a62471a6205813e478c21edb405d62285ea6be6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/opp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:97:6: warning: no previous prototype for function 'assert_single_clk' [-Wmissing-prototypes]
   bool assert_single_clk(struct opp_table *opp_table)
        ^
   drivers/opp/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool assert_single_clk(struct opp_table *opp_table)
   ^
   static 
   drivers/opp/core.c:1634:43: warning: variable 'clk_size' set but not used [-Wunused-but-set-variable]
           int supply_count, supply_size, icc_size, clk_size;
                                                    ^
   2 warnings generated.


vim +/assert_single_clk +97 drivers/opp/core.c

    95	
    96	/* Returns true for single clock, false with WARN otherwise */
  > 97	bool assert_single_clk(struct opp_table *opp_table)
    98	{
    99		return !WARN_ON(opp_table->clk_count != 1);
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
