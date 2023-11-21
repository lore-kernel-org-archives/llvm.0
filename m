Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104964207D;
	Tue, 21 Nov 2023 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImjaRdyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700597118; x=1732133118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB0XEtuOS8aU/kHk2urZ5idVumfF0A/GGiP4qxNPUZQ=;
  b=ImjaRdybDyYSNVWybmB0iBUmaQOprY3xvgxTJNXszncZ0M1CewBYwRS+
   SwYEoR/MGCOsX3XsJmF+TqZsP8oIibrbCfqk9sAmDuq4hEAe1rC7WWCMA
   9nOLwWfuNImE3kgk9J5nlorfzkmCuIIAER5ulJXKnfwYkrNh7dq5SkL5W
   DjCETsHYshtPSC9S+HSeF6Aqw2U2P/u40ZfE3tuH6MAJKMLmTTTAK3mdB
   ocN9xNw7beRSplkhToBNSWD5Bk0qCiFGptIg54sEvpThsFTrMPHFgnk2J
   vJM0mSGHK6DSz0mxG/qPxprSysLWdXyfVXs7YGnHv2U7Y5kG2R7Eo8ImJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391691351"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="391691351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 12:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760214714"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="760214714"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 12:05:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Wzd-0008Cw-34;
	Tue, 21 Nov 2023 20:05:09 +0000
Date: Wed, 22 Nov 2023 04:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sre@kernel.org>
Subject: [sre-misc:rk3588 32/37]
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1897:21: warning: variable
 'invpolflags' set but not used
Message-ID: <202311220259.tAXrU0A2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 140267c1c11d90f4889e57ae6d58280b261081c0 [32/37] drm/rockchip: vop2: Add basic support for rk3588
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311220259.tAXrU0A2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220259.tAXrU0A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220259.tAXrU0A2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1897:21: warning: variable 'invpolflags' set but not used [-Wunused-but-set-variable]
    1897 |         u32 val, polflags, invpolflags;
         |                            ^
   1 warning generated.


vim +/invpolflags +1897 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

  1872	
  1873	static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
  1874					    struct drm_atomic_state *state)
  1875	{
  1876		struct vop2_video_port *vp = to_vop2_video_port(crtc);
  1877		struct vop2 *vop2 = vp->vop2;
  1878		const struct vop2_data *vop2_data = vop2->data;
  1879		const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
  1880		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
  1881		struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
  1882		struct drm_display_mode *mode = &crtc->state->adjusted_mode;
  1883		unsigned long clock = mode->crtc_clock * 1000;
  1884		u16 hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
  1885		u16 hdisplay = mode->crtc_hdisplay;
  1886		u16 htotal = mode->crtc_htotal;
  1887		u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
  1888		u16 hact_end = hact_st + hdisplay;
  1889		u16 vdisplay = mode->crtc_vdisplay;
  1890		u16 vtotal = mode->crtc_vtotal;
  1891		u16 vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
  1892		u16 vact_st = mode->crtc_vtotal - mode->crtc_vsync_start;
  1893		u16 vact_end = vact_st + vdisplay;
  1894		u8 out_mode;
  1895		u32 dsp_ctrl = 0;
  1896		int act_end;
> 1897		u32 val, polflags, invpolflags;
  1898		int ret;
  1899		struct drm_encoder *encoder;
  1900	
  1901		drm_dbg(vop2->drm, "Update mode to %dx%d%s%d, type: %d for vp%d\n",
  1902			hdisplay, vdisplay, mode->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "p",
  1903			drm_mode_vrefresh(mode), vcstate->output_type, vp->id);
  1904	
  1905		vop2_lock(vop2);
  1906	
  1907		ret = clk_prepare_enable(vp->dclk);
  1908		if (ret < 0) {
  1909			drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
  1910				vp->id, ret);
  1911			vop2_unlock(vop2);
  1912			return;
  1913		}
  1914	
  1915		if (!vop2->enable_count)
  1916			vop2_enable(vop2);
  1917	
  1918		vop2->enable_count++;
  1919	
  1920		vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
  1921	
  1922		polflags = 0;
  1923		if (vcstate->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
  1924			polflags |= POLFLAG_DCLK_INV;
  1925		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
  1926			polflags |= BIT(HSYNC_POSITIVE);
  1927		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
  1928			polflags |= BIT(VSYNC_POSITIVE);
  1929	
  1930		/* RK3588 uses inverted HDMI V/HSYNC polarity */
  1931		if (vop2->data->soc_id == 3588) {
  1932			invpolflags = 0;
  1933			if (mode->flags & DRM_MODE_FLAG_NHSYNC)
  1934				invpolflags |= BIT(HSYNC_POSITIVE);
  1935			if (mode->flags & DRM_MODE_FLAG_NVSYNC)
  1936				invpolflags |= BIT(VSYNC_POSITIVE);
  1937		} else {
  1938			invpolflags = polflags;
  1939		}
  1940	
  1941		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
  1942			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
  1943	
  1944			// rk3568_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags, invpolflags);
  1945			vop2_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
  1946		}
  1947	
  1948		if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
  1949		    !(vp_data->feature & VOP_FEATURE_OUTPUT_10BIT))
  1950			out_mode = ROCKCHIP_OUT_MODE_P888;
  1951		else
  1952			out_mode = vcstate->output_mode;
  1953	
  1954		dsp_ctrl |= FIELD_PREP(RK3568_VP_DSP_CTRL__OUT_MODE, out_mode);
  1955	
  1956		if (vop2_output_uv_swap(vcstate->bus_format, vcstate->output_mode))
  1957			dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_RB_SWAP;
  1958	
  1959		if (is_yuv_output(vcstate->bus_format))
  1960			dsp_ctrl |= RK3568_VP_DSP_CTRL__POST_DSP_OUT_R2Y;
  1961	
  1962		vop2_dither_setup(crtc, &dsp_ctrl);
  1963	
  1964		vop2_vp_write(vp, RK3568_VP_DSP_HTOTAL_HS_END, (htotal << 16) | hsync_len);
  1965		val = hact_st << 16;
  1966		val |= hact_end;
  1967		vop2_vp_write(vp, RK3568_VP_DSP_HACT_ST_END, val);
  1968	
  1969		val = vact_st << 16;
  1970		val |= vact_end;
  1971		vop2_vp_write(vp, RK3568_VP_DSP_VACT_ST_END, val);
  1972	
  1973		if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
  1974			u16 vact_st_f1 = vtotal + vact_st + 1;
  1975			u16 vact_end_f1 = vact_st_f1 + vdisplay;
  1976	
  1977			val = vact_st_f1 << 16 | vact_end_f1;
  1978			vop2_vp_write(vp, RK3568_VP_DSP_VACT_ST_END_F1, val);
  1979	
  1980			val = vtotal << 16 | (vtotal + vsync_len);
  1981			vop2_vp_write(vp, RK3568_VP_DSP_VS_ST_END_F1, val);
  1982			dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_INTERLACE;
  1983			dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_FILED_POL;
  1984			dsp_ctrl |= RK3568_VP_DSP_CTRL__P2I_EN;
  1985			vtotal += vtotal + 1;
  1986			act_end = vact_end_f1;
  1987		} else {
  1988			act_end = vact_end;
  1989		}
  1990	
  1991		vop2_writel(vop2, RK3568_VP_LINE_FLAG(vp->id),
  1992			    (act_end - us_to_vertical_line(mode, 0)) << 16 | act_end);
  1993	
  1994		vop2_vp_write(vp, RK3568_VP_DSP_VTOTAL_VS_END, vtotal << 16 | vsync_len);
  1995	
  1996		if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
  1997			dsp_ctrl |= RK3568_VP_DSP_CTRL__CORE_DCLK_DIV;
  1998			clock *= 2;
  1999		}
  2000	
  2001		vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
  2002	
  2003		clk_set_rate(vp->dclk, clock);
  2004	
  2005		vop2_post_config(crtc);
  2006	
  2007		vop2_cfg_done(vp);
  2008	
  2009		vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
  2010	
  2011		drm_crtc_vblank_on(crtc);
  2012	
  2013		// [CC:] needed?
  2014		ret = reset_control_assert(vp->dclk_rst);
  2015		if (ret < 0)
  2016			drm_warn(vop2->drm, "failed to assert reset: %d\n", ret);
  2017		udelay(10);
  2018		ret = reset_control_deassert(vp->dclk_rst);
  2019		if (ret < 0)
  2020			drm_warn(vop2->drm, "failed to deassert reset: %d\n", ret);
  2021	
  2022		vop2_unlock(vop2);
  2023	}
  2024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
