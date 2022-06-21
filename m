Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66B1C0C
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655852902; x=1687388902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbNcvbxt2AEX50zg7N51mEeNHFJNVXxxyBoLBKPjpeg=;
  b=nnPFCNeDSGg9GO0S4QmToQeWtC+vFg1JpaQE4FRC2jkEA/nF/Qzg0mDH
   fZYQu6uQwrEwtkyGALJfETj9mAKvc6is73l5a/603UrKx/saJrBLdbpVX
   QSlM9xrBUM+idVQQAx1zrYd3UDsM1iyoikxKsqIT9rQWspdG+XkgD1c3h
   MxfXF8b/ha04nO4kikn7UzngRi4e63X5yEGt17fEUNytk2LsS0RqWqilc
   aIMvwcoQB3mtE8BZMhUPDpSSo51H8SjRYxYSBZjE4CHtqvmtUGKag4uba
   mnz6HH6EZhvLFKRcGGJiNIULOb0tKoALxzHJ3s8u0RVJWfL8u3EQFdxSY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="277809326"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="277809326"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 16:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="586435848"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 16:08:17 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3myn-0000X2-9P;
	Tue, 21 Jun 2022 23:08:17 +0000
Date: Wed, 22 Jun 2022 07:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>, linux-phy@lists.infradead.org,
	kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, p.yadav@ti.com,
	tomi.valkeinen@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org, jpawar@cadence.com,
	sjakhade@cadence.com, mparab@cadence.com,
	devicetree@vger.kernel.org, vigneshr@ti.com, lee.jones@linaro.org,
	Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH 2/3] phy: cdns-dphy: Add band config for dphy tx
Message-ID: <202206220747.oBZNVia0-lkp@intel.com>
References: <20220621180332.28767-3-r-ravikumar@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621180332.28767-3-r-ravikumar@ti.com>

Hi Rahul,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v5.19-rc3 next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Rahul-T-R/Add-support-for-DPHY-TX-on-J721E/20220622-020528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-randconfig-r041-20220622 (https://download.01.org/0day-ci/archive/20220622/202206220747.oBZNVia0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/846aa076b0d86dd2ebc49c2a437c7b452305691d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rahul-T-R/Add-support-for-DPHY-TX-on-J721E/20220622-020528
        git checkout 846aa076b0d86dd2ebc49c2a437c7b452305691d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/phy/cadence/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/phy/cadence/cdns-dphy.c:324:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, band_ctrl) |
                 ^
   1 error generated.


vim +/FIELD_PREP +324 drivers/phy/cadence/cdns-dphy.c

   285	
   286	static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
   287	{
   288		struct cdns_dphy *dphy = phy_get_drvdata(phy);
   289		struct cdns_dphy_cfg cfg = { 0 };
   290		int ret, band_ctrl;
   291		unsigned int reg;
   292	
   293		ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
   294		if (ret)
   295			return ret;
   296	
   297		/*
   298		 * Configure the internal PSM clk divider so that the DPHY has a
   299		 * 1MHz clk (or something close).
   300		 */
   301		ret = cdns_dphy_setup_psm(dphy);
   302		if (ret)
   303			return ret;
   304	
   305		/*
   306		 * Configure attach clk lanes to data lanes: the DPHY has 2 clk lanes
   307		 * and 8 data lanes, each clk lane can be attache different set of
   308		 * data lanes. The 2 groups are named 'left' and 'right', so here we
   309		 * just say that we want the 'left' clk lane to drive the 'left' data
   310		 * lanes.
   311		 */
   312		cdns_dphy_set_clk_lane_cfg(dphy, DPHY_CLK_CFG_LEFT_DRIVES_LEFT);
   313	
   314		/*
   315		 * Configure the DPHY PLL that will be used to generate the TX byte
   316		 * clk.
   317		 */
   318		cdns_dphy_set_pll_cfg(dphy, &cfg);
   319	
   320		band_ctrl = cdns_dphy_tx_get_band_ctrl(opts->mipi_dphy.hs_clk_rate);
   321		if (band_ctrl < 0)
   322			return band_ctrl;
   323	
 > 324		reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, band_ctrl) |
   325		      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
   326		writel(reg, dphy->regs + DPHY_BAND_CFG);
   327	
   328		return 0;
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
