Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A35A41
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650311695; x=1681847695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h6Wq2KUNZXLjKWIzIbgs5E6BmURH6qZiyFlSB+GJJJI=;
  b=ldr+lhtkimWsfiCS+jwGcDZf3i+Ymu3mcdmmIQsKAb9agCbFnJYK0rtT
   bUjWzaMhZSoey1C7PnsPtvseH612ygeW/DaeB8UxI2pn6Ct09gDwfngjD
   91RHndKTeYvZ6Y9hQf2n7+9QHRARcmKtnC10F9lx64tRKLiwTT4Tzu0nZ
   D78D6R2vD2N4svMvESXFp++64sD9YP3I+Iua+8fIHR3LJS0Ro+y5R7gnU
   Bb4CQfzp4UKNmv5rnaSr3zbGAre3gnbREOEJCje6K8prFlTVqM9tRSyyd
   Nzp3RlBnYYpU+vqTFXLPEDxg0qlPA9bk4tb+bM9Iv74Z2nNkWN69s0Uqz
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="324040855"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="324040855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 12:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="561448219"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2022 12:54:52 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngXSV-0004vF-Rw;
	Mon, 18 Apr 2022 19:54:51 +0000
Date: Tue, 19 Apr 2022 03:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hao <haokexin@gmail.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Dejin Zheng <zhengdejin5@gmail.com>
Subject: Re: [PATCH] net: stmmac: Use readl_poll_timeout_atomic() in atomic
 state
Message-ID: <202204190334.b0rutoIE-lkp@intel.com>
References: <20220418090500.3393423-1-haokexin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418090500.3393423-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kevin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]
[also build test ERROR on net-next/master horms-ipvs/master linus/master v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Hao/net-stmmac-Use-readl_poll_timeout_atomic-in-atomic-state/20220418-170945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 49aefd131739df552f83c566d0665744c30b1d70
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20220419/202204190334.b0rutoIE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/2a443e2b58e8910075a2d972e0e52b1d070654af
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kevin-Hao/net-stmmac-Use-readl_poll_timeout_atomic-in-atomic-state/20220418-170945
        git checkout 2a443e2b58e8910075a2d972e0e52b1d070654af
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_udelay
   >>> referenced by stmmac_hwtstamp.c
   >>>               net/ethernet/stmicro/stmmac/stmmac_hwtstamp.o:(init_systime) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
