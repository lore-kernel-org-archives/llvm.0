Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7162C80
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642693452; x=1674229452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwlCk5iW4cVjNFc94CvaqBtZ42VwJI5NxIlip4DdM+4=;
  b=P4RDwGfmrcUzNbMTu9oaDKo9g3jpf3FpOXfD1uD5hRk+sTx6kS6gkW+K
   4zisYihcEdSKGrGFdUwqQ0Eg5V/EjriJnbJVVJsWLbRAlFs8g2cOPdjgy
   NPaphH3+cN6K4lJz6BCMMO+pZKUGXYsWGFddx/hn2IsT8FIxOW3wDtWCJ
   qIyS0T6IaW4lAEi577uQzSufYY+IS02gbeoYart9Llv0gOnCHaGM7SaIM
   aqPbL+nW/pZ3dHx+CBbULOrLSyEehvXHnqD/NAfVVrMA9JOsZpxUjzEDK
   dCv9To5jxmvZauJaGmCgGmsBJv+yH6VZzX7HTD3A6R3nVIZL+d/rOXx7A
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331730272"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="331730272"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 07:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="694240674"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2022 07:44:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAZba-000EPq-VE; Thu, 20 Jan 2022 15:44:06 +0000
Date: Thu, 20 Jan 2022 23:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/6] drm/meson: venc: add ENCL encoder setup for
 MIPI-DSI output
Message-ID: <202201202322.HA2Ce0Rs-lkp@intel.com>
References: <20220120083357.1541262-4-narmstrong@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120083357.1541262-4-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Neil,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16 next-20220120]
[cannot apply to drm/drm-next drm-intel/for-linux-next airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220120-163607
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arm-randconfig-r002-20220120 (https://download.01.org/0day-ci/archive/20220120/202201202322.HA2Ce0Rs-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/582fe216b10e102620e7148d6df969d4eed430af
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220120-163607
        git checkout 582fe216b10e102620e7148d6df969d4eed430af
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_venc.c:1595:10: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
                          FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0),
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1661:17: error: use of undeclared identifier 'ENCL_PX_LN_CNT_SHADOW_EN'
           writel_relaxed(ENCL_PX_LN_CNT_SHADOW_EN, priv->io_base + _REG(ENCL_VIDEO_MODE));
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1662:17: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
           writel_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN |
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1663:10: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_GAIN_HDTV'
                          ENCL_VIDEO_MODE_ADV_GAIN_HDTV |
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1664:10: error: use of undeclared identifier 'ENCL_SEL_GAMMA_RGB_IN'
                          ENCL_SEL_GAMMA_RGB_IN, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1666:17: error: use of undeclared identifier 'ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER'
           writel_relaxed(ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER,
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1681:17: error: use of undeclared identifier 'ENCL_VIDEO_RGBIN_RGB'
           writel_relaxed(ENCL_VIDEO_RGBIN_RGB | ENCL_VIDEO_RGBIN_ZBLK,
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1681:40: error: use of undeclared identifier 'ENCL_VIDEO_RGBIN_ZBLK'
           writel_relaxed(ENCL_VIDEO_RGBIN_RGB | ENCL_VIDEO_RGBIN_ZBLK,
                                                 ^
   drivers/gpu/drm/meson/meson_venc.c:1690:22: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
           writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, 0,
                               ^
   drivers/gpu/drm/meson/meson_venc.c:1690:22: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
>> drivers/gpu/drm/meson/meson_venc.c:1753:17: error: use of undeclared identifier 'L_TCON_MISC_SEL_STV1'
           writel_relaxed(L_TCON_MISC_SEL_STV1 | L_TCON_MISC_SEL_STV2,
                          ^
>> drivers/gpu/drm/meson/meson_venc.c:1753:40: error: use of undeclared identifier 'L_TCON_MISC_SEL_STV2'
           writel_relaxed(L_TCON_MISC_SEL_STV1 | L_TCON_MISC_SEL_STV2,
                                                 ^
>> drivers/gpu/drm/meson/meson_venc.c:1952:18: error: use of undeclared identifier 'VENC_INTCTRL_ENCP_LNRST_INT_EN'
                   writel_relaxed(VENC_INTCTRL_ENCP_LNRST_INT_EN,
                                  ^
   13 errors generated.


vim +/FIELD_PREP +1595 drivers/gpu/drm/meson/meson_venc.c

  1579	
  1580	static void meson_encl_set_gamma_table(struct meson_drm *priv, u16 *data,
  1581					       u32 rgb_mask)
  1582	{
  1583		int i, ret;
  1584		u32 reg;
  1585	
  1586		writel_bits_relaxed(L_GAMMA_CNTL_PORT_EN, 0,
  1587				    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
  1588	
  1589		ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1590						 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
  1591		if (ret)
  1592			pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
  1593	
  1594		writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
> 1595			       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0),
  1596			       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
  1597	
  1598		for (i = 0; i < 256; i++) {
  1599			ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1600							 reg, reg & L_GAMMA_CNTL_PORT_WR_RDY,
  1601							 10, 10000);
  1602			if (ret)
  1603				pr_warn_once("%s: GAMMA WR_RDY timeout\n", __func__);
  1604	
  1605			writel_relaxed(data[i], priv->io_base + _REG(L_GAMMA_DATA_PORT));
  1606		}
  1607	
  1608		ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1609						 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
  1610		if (ret)
  1611			pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
  1612	
  1613		writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
  1614			       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0x23),
  1615			       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
  1616	}
  1617	
  1618	void meson_encl_load_gamma(struct meson_drm *priv)
  1619	{
  1620		meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_R);
  1621		meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_G);
  1622		meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_B);
  1623	
  1624		writel_bits_relaxed(L_GAMMA_CNTL_PORT_EN, L_GAMMA_CNTL_PORT_EN,
  1625				    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
  1626	}
  1627	
  1628	void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
  1629					  const struct drm_display_mode *mode)
  1630	{
  1631		unsigned int max_pxcnt;
  1632		unsigned int max_lncnt;
  1633		unsigned int havon_begin;
  1634		unsigned int havon_end;
  1635		unsigned int vavon_bline;
  1636		unsigned int vavon_eline;
  1637		unsigned int hso_begin;
  1638		unsigned int hso_end;
  1639		unsigned int vso_begin;
  1640		unsigned int vso_end;
  1641		unsigned int vso_bline;
  1642		unsigned int vso_eline;
  1643	
  1644		max_pxcnt = mode->htotal - 1;
  1645		max_lncnt = mode->vtotal - 1;
  1646		havon_begin = mode->htotal - mode->hsync_start;
  1647		havon_end = havon_begin + mode->hdisplay - 1;
  1648		vavon_bline = mode->vtotal - mode->vsync_start;
  1649		vavon_eline = vavon_bline + mode->vdisplay - 1;
  1650		hso_begin = 0;
  1651		hso_end = mode->hsync_end - mode->hsync_start;
  1652		vso_begin = 0;
  1653		vso_end = 0;
  1654		vso_bline = 0;
  1655		vso_eline = mode->vsync_end - mode->vsync_start;
  1656	
  1657		meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCL);
  1658	
  1659		writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
  1660	
> 1661		writel_relaxed(ENCL_PX_LN_CNT_SHADOW_EN, priv->io_base + _REG(ENCL_VIDEO_MODE));
> 1662		writel_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN |
> 1663			       ENCL_VIDEO_MODE_ADV_GAIN_HDTV |
> 1664			       ENCL_SEL_GAMMA_RGB_IN, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
  1665	
> 1666		writel_relaxed(ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER,
  1667			       priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
  1668		writel_relaxed(max_pxcnt, priv->io_base + _REG(ENCL_VIDEO_MAX_PXCNT));
  1669		writel_relaxed(max_lncnt, priv->io_base + _REG(ENCL_VIDEO_MAX_LNCNT));
  1670		writel_relaxed(havon_begin, priv->io_base + _REG(ENCL_VIDEO_HAVON_BEGIN));
  1671		writel_relaxed(havon_end, priv->io_base + _REG(ENCL_VIDEO_HAVON_END));
  1672		writel_relaxed(vavon_bline, priv->io_base + _REG(ENCL_VIDEO_VAVON_BLINE));
  1673		writel_relaxed(vavon_eline, priv->io_base + _REG(ENCL_VIDEO_VAVON_ELINE));
  1674	
  1675		writel_relaxed(hso_begin, priv->io_base + _REG(ENCL_VIDEO_HSO_BEGIN));
  1676		writel_relaxed(hso_end, priv->io_base + _REG(ENCL_VIDEO_HSO_END));
  1677		writel_relaxed(vso_begin, priv->io_base + _REG(ENCL_VIDEO_VSO_BEGIN));
  1678		writel_relaxed(vso_end, priv->io_base + _REG(ENCL_VIDEO_VSO_END));
  1679		writel_relaxed(vso_bline, priv->io_base + _REG(ENCL_VIDEO_VSO_BLINE));
  1680		writel_relaxed(vso_eline, priv->io_base + _REG(ENCL_VIDEO_VSO_ELINE));
> 1681		writel_relaxed(ENCL_VIDEO_RGBIN_RGB | ENCL_VIDEO_RGBIN_ZBLK,
  1682			       priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
  1683	
  1684		/* default black pattern */
  1685		writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
  1686		writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
  1687		writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
  1688		writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
  1689		writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
  1690		writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, 0,
  1691				    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
  1692	
  1693		writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
  1694	
  1695		writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
  1696		writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR)); /* Magic value */
  1697	
  1698		writel_relaxed(L_DITH_CNTL_DITH10_EN, priv->io_base + _REG(L_DITH_CNTL_ADDR));
  1699	
  1700		/* DE signal for TTL */
  1701		writel_relaxed(havon_begin, priv->io_base + _REG(L_OEH_HS_ADDR));
  1702		writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEH_HE_ADDR));
  1703		writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEH_VS_ADDR));
  1704		writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEH_VE_ADDR));
  1705	
  1706		/* DE signal for TTL */
  1707		writel_relaxed(havon_begin, priv->io_base + _REG(L_OEV1_HS_ADDR));
  1708		writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEV1_HE_ADDR));
  1709		writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEV1_VS_ADDR));
  1710		writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEV1_VE_ADDR));
  1711	
  1712		/* Hsync signal for TTL */
  1713		if (mode->flags & DRM_MODE_FLAG_PHSYNC) {
  1714			writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HS_ADDR));
  1715			writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HE_ADDR));
  1716		} else {
  1717			writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HS_ADDR));
  1718			writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HE_ADDR));
  1719		}
  1720		writel_relaxed(0, priv->io_base + _REG(L_STH1_VS_ADDR));
  1721		writel_relaxed(max_lncnt, priv->io_base + _REG(L_STH1_VE_ADDR));
  1722	
  1723		/* Vsync signal for TTL */
  1724		writel_relaxed(vso_begin, priv->io_base + _REG(L_STV1_HS_ADDR));
  1725		writel_relaxed(vso_end, priv->io_base + _REG(L_STV1_HE_ADDR));
  1726		if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
  1727			writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VS_ADDR));
  1728			writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VE_ADDR));
  1729		} else {
  1730			writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VS_ADDR));
  1731			writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VE_ADDR));
  1732		}
  1733	
  1734		/* DE signal */
  1735		writel_relaxed(havon_begin, priv->io_base + _REG(L_DE_HS_ADDR));
  1736		writel_relaxed(havon_end + 1, priv->io_base + _REG(L_DE_HE_ADDR));
  1737		writel_relaxed(vavon_bline, priv->io_base + _REG(L_DE_VS_ADDR));
  1738		writel_relaxed(vavon_eline, priv->io_base + _REG(L_DE_VE_ADDR));
  1739	
  1740		/* Hsync signal */
  1741		writel_relaxed(hso_begin, priv->io_base + _REG(L_HSYNC_HS_ADDR));
  1742		writel_relaxed(hso_end, priv->io_base + _REG(L_HSYNC_HE_ADDR));
  1743		writel_relaxed(0, priv->io_base + _REG(L_HSYNC_VS_ADDR));
  1744		writel_relaxed(max_lncnt, priv->io_base + _REG(L_HSYNC_VE_ADDR));
  1745	
  1746		/* Vsync signal */
  1747		writel_relaxed(vso_begin, priv->io_base + _REG(L_VSYNC_HS_ADDR));
  1748		writel_relaxed(vso_end, priv->io_base + _REG(L_VSYNC_HE_ADDR));
  1749		writel_relaxed(vso_bline, priv->io_base + _REG(L_VSYNC_VS_ADDR));
  1750		writel_relaxed(vso_eline, priv->io_base + _REG(L_VSYNC_VE_ADDR));
  1751	
  1752		writel_relaxed(0, priv->io_base + _REG(L_INV_CNT_ADDR));
> 1753		writel_relaxed(L_TCON_MISC_SEL_STV1 | L_TCON_MISC_SEL_STV2,
  1754			       priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
  1755	
  1756		priv->venc.current_mode = MESON_VENC_MODE_MIPI_DSI;
  1757	}
  1758	EXPORT_SYMBOL_GPL(meson_venc_mipi_dsi_mode_set);
  1759	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
