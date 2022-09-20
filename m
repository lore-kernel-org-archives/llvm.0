Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52881872
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663672239; x=1695208239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80y+q0JiEdas7X98PzVvtBdWd1gT4rNB5lAGu7PbxlY=;
  b=m7LFSpI4wt24fclm65XaF5bgnDBzTuvo2tVFNsHSxgI1K/F2bMsmJeRk
   vdSf7GFNTyb+mpokwD/Z9vITxMPnS2O9H+BWjgy61iK/btfSs6gYAZBjd
   vsvaRNyhMeAopWTm17LnVKGqWNdIPYA/2I8AldEFwAMixPw8S03Mvsq7O
   Iy8CqTNFTiv2AnRNKJFe6GBb8QYhJxf0HBE5DvB3JioYWQ8xd80m7CZYb
   8LHiVePw8W7HMb4CWWObVDD5xT22aFQi5HUzxBdKhRGr0gj2QQML+YKRS
   +3z8cgQttyftBTyVQmmE4ggwP4bZhSc+xXTHXtZwtypzkC4LmqCF3afuQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279391005"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="279391005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 04:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="687372297"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2022 04:10:35 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oab99-0002i7-0C;
	Tue, 20 Sep 2022 11:10:35 +0000
Date: Tue, 20 Sep 2022 19:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:crng/random/jd/vdso 3/3]
 drivers/char/random.c:164:42: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202209201907.0qM7YdXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/vdso
head:   a7b31acb923dbd25e7bf030ca209f131c31f5288
commit: a7b31acb923dbd25e7bf030ca209f131c31f5288 [3/3] random: implement getrandom() in vDSO
config: arm64-buildonly-randconfig-r005-20220919 (https://download.01.org/0day-ci/archive/20220920/202209201907.0qM7YdXh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/a7b31acb923dbd25e7bf030ca209f131c31f5288
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block crng/random/jd/vdso
        git checkout a7b31acb923dbd25e7bf030ca209f131c31f5288
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/char/random.c:164:42: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
                                            ^
                                            int
   drivers/char/random.c:164:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
   ^
   int
   2 errors generated.


vim +/int +164 drivers/char/random.c

   146	
   147	#define warn_unseeded_randomness() \
   148		if (IS_ENABLED(CONFIG_WARN_ALL_UNSEEDED_RANDOM) && !crng_ready()) \
   149			printk_deferred(KERN_NOTICE "random: %s called from %pS with crng_init=%d\n", \
   150					__func__, (void *)_RET_IP_, crng_init)
   151	
   152	
   153	
   154	/********************************************************************
   155	 *
   156	 * VDSO support helpers.
   157	 *
   158	 * The actual vDSO function is defined over in lib/vdso/getrandom.c,
   159	 * but this section contains the kernel-mode helpers to support that.
   160	 *
   161	 ********************************************************************/
   162	
   163	/* The shared data page. */
 > 164	DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
   165	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
