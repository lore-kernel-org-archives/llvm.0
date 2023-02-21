Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF28C0B;
	Tue, 21 Feb 2023 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677009962; x=1708545962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgS7PVJCPZJ+//xyj4OSmQvPnD+TakDYc2ICsvn/8wM=;
  b=O41J+hdkDbvSqVyvEAmLZXZ43PNGZ/G754AiarMkRM9K3QDY3Bkk8Yn5
   xhbS8BPTxmcIFM7KAF7NjJdEunshPz7/oYT5efCjxQ0GFG474LXa9Jp8m
   GqQb80JigDcVW8ATNFbPwH8t5AP7KGPoPHLNQDcDabJWtkd8Qki9OdHZc
   S+OLXB8knAWOJbe3+lrzJeIzI2xqmtxfQiExMBbnqTx0+aUCw6wAiyIB8
   1IJpwt2VM5fLnyehpD8fQ4HYVRsfB3TRkK1tkDAbuH9L5oJWXlbVs6d39
   bfV6PT13Ai+l3GbdFFmEuWd4oGWN+ek5fx6GS/pPLxH0IsAgFsBgMH0nm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334100046"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334100046"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 12:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="917317158"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="917317158"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 12:05:39 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUYtO-0000Cr-2Q;
	Tue, 21 Feb 2023 20:05:38 +0000
Date: Wed, 22 Feb 2023 04:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/input/touchscreen/sun4i-ts.c:392:34: warning: unused
 variable 'sun4i_ts_of_match'
Message-ID: <202302220342.AqAtycBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9e58df973d2272e6e558965e7cb32453a4b380ff
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   2 years, 5 months ago
config: mips-randconfig-c004-20230217 (https://download.01.org/0day-ci/archive/20230222/202302220342.AqAtycBB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220342.AqAtycBB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/sun4i-ts.c:392:34: warning: unused variable 'sun4i_ts_of_match' [-Wunused-const-variable]
   static const struct of_device_id sun4i_ts_of_match[] = {
                                    ^
   1 warning generated.


vim +/sun4i_ts_of_match +392 drivers/input/touchscreen/sun4i-ts.c

f09f98d3240b7e Hans de Goede 2014-05-14  391  
6decea7c5438e2 Hans de Goede 2014-05-14 @392  static const struct of_device_id sun4i_ts_of_match[] = {
6decea7c5438e2 Hans de Goede 2014-05-14  393  	{ .compatible = "allwinner,sun4i-a10-ts", },
91c68a7c1d92b4 Hans de Goede 2015-03-08  394  	{ .compatible = "allwinner,sun5i-a13-ts", },
43c0e2234021d7 Chen-Yu Tsai  2015-01-26  395  	{ .compatible = "allwinner,sun6i-a31-ts", },
6decea7c5438e2 Hans de Goede 2014-05-14  396  	{ /* sentinel */ }
6decea7c5438e2 Hans de Goede 2014-05-14  397  };
6decea7c5438e2 Hans de Goede 2014-05-14  398  MODULE_DEVICE_TABLE(of, sun4i_ts_of_match);
6decea7c5438e2 Hans de Goede 2014-05-14  399  

:::::: The code at line 392 was first introduced by commit
:::::: 6decea7c5438e2955f64e2513ec9a2fac7602a7d Input: add driver for Allwinner sunxi SoC's rtp controller

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
