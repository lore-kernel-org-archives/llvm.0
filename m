Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78291168
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 23:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641425938; x=1672961938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WzXGdl8SYInG/kIPIb7VuliwH6V9anf0ytsKMlAi7y8=;
  b=S8zjq1iKR3S1bqN5Olb6PPePq6dcXL8fmVaUEFWcT21Q0uiUT+w0Cb7B
   2Pfix+WIjJ1c5D+XC3g0T89JX54Z6F1xC7q6n8f8NqXPyZhbRL70D6vhq
   fhuHfHi9fP0KI2kPs3OW1yTAeI+x+t7nNOFS+unI9VoTC1MXyZbP/sxUK
   gYOWJIbZUNJGLoSzb7H/rEShSoEFXnQLaElerz2ZcLrRNlN/5n7qAqMjr
   cZ97LbgvWG4Xr3BQSuvBc6ixOjaZoDqOjI/ffsYdg5YHfh9f208LZ3T4M
   XAd+D+xWTA5xeeB8+JTERioSOwhE5f3tsUVciseELoKbv5rT5q6vySDFl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229369222"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="229369222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 15:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="621322315"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jan 2022 15:38:56 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5Frs-000H89-31; Wed, 05 Jan 2022 23:38:56 +0000
Date: Thu, 6 Jan 2022 07:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph CHAMG <josright123@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v10, 2/2] net: Add dm9051 driver
Message-ID: <202201060738.5ZBat35r-lkp@intel.com>
References: <20220105081728.4289-3-josright123@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105081728.4289-3-josright123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Joseph,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 9d922f5df53844228b9f7c62f2593f4f06c0b69b]

url:    https://github.com/0day-ci/linux/commits/Joseph-CHAMG/ADD-DM9051-ETHERNET-DRIVER/20220105-162144
base:   9d922f5df53844228b9f7c62f2593f4f06c0b69b
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220106/202201060738.5ZBat35r-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4a2b192e52a57fee2e5d3452eeb1f3764ef4086c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joseph-CHAMG/ADD-DM9051-ETHERNET-DRIVER/20220105-162144
        git checkout 4a2b192e52a57fee2e5d3452eeb1f3764ef4086c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/atmel/ drivers/media/platform/sti/bdisp/ drivers/media/platform/sti/delta/ drivers/media/platform/sti/hva/ drivers/mmc/host/ drivers/net/ethernet/davicom/ drivers/staging/rtl8723bs/ fs/xfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/davicom/dm9051.c:153:52: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           regmap_write(db->regmap, DM9051_EPDRH, (val >> 8) && 0xff);
                                                             ^  ~~~~
   drivers/net/ethernet/davicom/dm9051.c:153:52: note: use '&' for a bitwise operation
           regmap_write(db->regmap, DM9051_EPDRH, (val >> 8) && 0xff);
                                                             ^~
                                                             &
   drivers/net/ethernet/davicom/dm9051.c:153:52: note: remove constant to silence this warning
           regmap_write(db->regmap, DM9051_EPDRH, (val >> 8) && 0xff);
                                                            ~^~~~~~~
   1 warning generated.


vim +153 drivers/net/ethernet/davicom/dm9051.c

   145	
   146	static int regmap_dm9051_phy_reg_write(void *context, unsigned int reg, unsigned int val)
   147	{
   148		struct board_info *db = context;
   149		int ret;
   150	
   151		regmap_write(db->regmap, DM9051_EPAR, DM9051_PHY | reg);
   152		regmap_write(db->regmap, DM9051_EPDRL, val & 0xff);
 > 153		regmap_write(db->regmap, DM9051_EPDRH, (val >> 8) && 0xff);
   154		regmap_write(db->regmap, DM9051_EPCR, EPCR_EPOS | EPCR_ERPRW);
   155		ret = dm9051_map_poll(db);
   156		regmap_write(db->regmap, DM9051_EPCR, 0x0);
   157	
   158		if (reg == MII_BMCR && !(val & 0x0800))
   159			mdelay(1); /* need for if activate phyxcer */
   160	
   161		return ret;
   162	}
   163	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
