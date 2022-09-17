Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725C366
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 04:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663387558; x=1694923558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8egC0iJIchIflEUw3SgvHUHfLLT8j/1o/nymXrl1Dz0=;
  b=Y/T0koT0RalL/dLfFWb93lVnLTdiG0yNz8mdEQH083anTZzv1no26ttx
   9u2ws4uSFaY74weCnGPZtg0torkqwVskYSz4UzUcPJZue+1nefKWojvvW
   dEy/5lkdLhdWOIPAoScYsJtLB75rHppIm1T2kgzdyAuN13SAoQdUFOhaz
   Fpt+mLHxVRMwnjnIgtfdFD4xNCzTPM5eeDYmY9Im+49Zn6pVjwkh9HhMm
   phKcl/WlpSVNCPTuQdbVwPmX5tyEekCClOqKFH/nmuywDN8UEX6nbmLt0
   lKitGXvJ6xkVunwGlEJtIWYIKIjsgHszbME98sEZvL66Eh2yarWUi0GEy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="325400576"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="325400576"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 21:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="686366464"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 21:05:54 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZP5V-0002Sg-2x;
	Sat, 17 Sep 2022 04:05:53 +0000
Date: Sat, 17 Sep 2022 12:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Foster <colin.foster@in-advantage.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, UNGLinuxDriver@microchip.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v1 net-next 1/2] net: mscc: ocelot: utilize
 readx_poll_timeout() for chip reset
Message-ID: <202209171105.95JOLHu6-lkp@intel.com>
References: <20220916191349.1659269-2-colin.foster@in-advantage.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916191349.1659269-2-colin.foster@in-advantage.com>

Hi Colin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Colin-Foster/clean-up-ocelot_reset-routine/20220917-031554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 862deb68c1bc19783ab7a98ba17a441aa76eba52
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220917/202209171105.95JOLHu6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/11df0e8e7af298721b4bb1af286571272dd0d56e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Colin-Foster/clean-up-ocelot_reset-routine/20220917-031554
        git checkout 11df0e8e7af298721b4bb1af286571272dd0d56e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/mscc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mscc/ocelot_vsc7514.c:222:6: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
           if (IS_ERR_VALUE(err))
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:22:49: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   1 warning generated.


vim +222 drivers/net/ethernet/mscc/ocelot_vsc7514.c

   208	
   209	static int ocelot_reset(struct ocelot *ocelot)
   210	{
   211		int err;
   212		u32 val;
   213	
   214		regmap_field_write(ocelot->regfields[SYS_RESET_CFG_MEM_INIT], 1);
   215		regmap_field_write(ocelot->regfields[SYS_RESET_CFG_MEM_ENA], 1);
   216	
   217		/* MEM_INIT is a self-clearing bit. Wait for it to be cleared (should be
   218		 * 100us) before enabling the switch core.
   219		 */
   220		err = readx_poll_timeout(ocelot_mem_init_status, ocelot, val, !val,
   221					 MEM_INIT_SLEEP_US, MEM_INIT_TIMEOUT_US);
 > 222		if (IS_ERR_VALUE(err))
   223			return err;
   224	
   225		regmap_field_write(ocelot->regfields[SYS_RESET_CFG_MEM_ENA], 1);
   226		regmap_field_write(ocelot->regfields[SYS_RESET_CFG_CORE_ENA], 1);
   227	
   228		return 0;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
