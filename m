Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C52E338B;
	Wed,  5 Mar 2025 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166857; cv=none; b=TK5OsvpBpvX/yI/2AsnycioyXtyFPw+wqzHrqnuDrn+LAOKcfQmeXTcJcXRAD9G8UTB/pxdXEEZM+tjAglpUtALUyNdqlEyGmS+FOn4fB/Iug4KvpQY+CrU7gpiwHuxcl8s0uU++/obnYueYg+jB3AfGEHbSKbLXJr71wrqhqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166857; c=relaxed/simple;
	bh=P9SDvpz5ZIPILpXRvTM1MnSEDV2Szw10lkTSDsiveFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3M0SXkFde8VngMaBSIewCPW93YAfhjKaHZv/tbw6bTru2PwQHvy5eLJW2EDXjZf9E2QqK3iIzJAbkl7ZFYxfG+ASdySzjNWyzBW5oOfoGHKhcHlnQzSekGzVu5x74doodbC/F7+cQtWddVxb+XHtInEwSMWiHOrdK5tsaJBgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL/nqVcd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL/nqVcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741166855; x=1772702855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9SDvpz5ZIPILpXRvTM1MnSEDV2Szw10lkTSDsiveFY=;
  b=SL/nqVcdnQMjgu+PqGVXuWaFjVJKVX4g/lsTny99YhO3eWO/ByTDzq9H
   pxv6MVCKnWw2g0wGMTEezUoXHA8Ur+h9BPHR+xzYBiG8Bus4ki8R+y7w7
   Ep6Dv92jlBPvc7AQSJJYx0tUmKNvdpcgFmWzYzXUiyCIoWy1UbZZyUFOJ
   36iiBosjr0X2ynnC6ft6vh6KtWpppS+6sMwrV+sNwB9/taqGj/deXVDf2
   dS0XmdYLPSqLgCbM4HHwedOg8H71u99H1DlUrAlYO7wyCmihbndTPtbnn
   EruMk9smt7mAYkYgHMHeh+uuCWDNqcII/liqBwiTLowjRfiZ9vBuJx4mR
   A==;
X-CSE-ConnectionGUID: Bx+uf1/cQEOXWz6SQX91Mg==
X-CSE-MsgGUID: 9UhUKig0Q3+ZbPkB4Ke3QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52759032"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="52759032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 01:27:34 -0800
X-CSE-ConnectionGUID: 2/LH2U8TSemwGrJyqwg7yg==
X-CSE-MsgGUID: Vvm4Su6aSkGW3MulzfIv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123829108"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2025 01:27:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpl2I-000KmY-0t;
	Wed, 05 Mar 2025 09:27:30 +0000
Date: Wed, 5 Mar 2025 17:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7259/7930]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:7: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202503051744.a44mn4cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7259/7930] drm/rockchip: vop2: Add platform specific callback
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250305/202503051744.a44mn4cM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051744.a44mn4cM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051744.a44mn4cM-lkp@intel.com/

Note: the linux-next/master HEAD 20d5c66e1810e6e8805ec0d01373afb2dba9f51a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     833 |                            FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
         |                            ^
   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1052:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1052 |         vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
         |                      ^
   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1424:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1424 |                 port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT0_MUX,
         |                             ^
   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1543:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1543 |                         cdly |= FIELD_PREP(RK3568_CLUSTER_DLY_NUM__CLUSTER0_0, dly);
         |                                 ^
   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1609:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1609 |                     FIELD_PREP(RK3568_VP_BG_MIX_CTRL__BG_DLY, bg_dly));
         |                     ^
   5 errors generated.


vim +/FIELD_PREP +833 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c

   819	
   820	static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
   821	{
   822		struct vop2 *vop2 = vp->vop2;
   823		struct drm_crtc *crtc = &vp->crtc;
   824		u32 die, dip;
   825	
   826		die = vop2_readl(vop2, RK3568_DSP_IF_EN);
   827		dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
   828	
   829		switch (id) {
   830		case ROCKCHIP_VOP2_EP_RGB0:
   831			die &= ~RK3568_SYS_DSP_INFACE_EN_RGB_MUX;
   832			die |= RK3568_SYS_DSP_INFACE_EN_RGB |
 > 833				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
   834			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   835			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   836			if (polflags & POLFLAG_DCLK_INV)
   837				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
   838			else
   839				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
   840			break;
   841		case ROCKCHIP_VOP2_EP_HDMI0:
   842			die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
   843			die |= RK3568_SYS_DSP_INFACE_EN_HDMI |
   844				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_HDMI_MUX, vp->id);
   845			dip &= ~RK3568_DSP_IF_POL__HDMI_PIN_POL;
   846			dip |= FIELD_PREP(RK3568_DSP_IF_POL__HDMI_PIN_POL, polflags);
   847			break;
   848		case ROCKCHIP_VOP2_EP_EDP0:
   849			die &= ~RK3568_SYS_DSP_INFACE_EN_EDP_MUX;
   850			die |= RK3568_SYS_DSP_INFACE_EN_EDP |
   851				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_EDP_MUX, vp->id);
   852			dip &= ~RK3568_DSP_IF_POL__EDP_PIN_POL;
   853			dip |= FIELD_PREP(RK3568_DSP_IF_POL__EDP_PIN_POL, polflags);
   854			break;
   855		case ROCKCHIP_VOP2_EP_MIPI0:
   856			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX;
   857			die |= RK3568_SYS_DSP_INFACE_EN_MIPI0 |
   858				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX, vp->id);
   859			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
   860			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
   861			break;
   862		case ROCKCHIP_VOP2_EP_MIPI1:
   863			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX;
   864			die |= RK3568_SYS_DSP_INFACE_EN_MIPI1 |
   865				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
   866			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
   867			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
   868			break;
   869		case ROCKCHIP_VOP2_EP_LVDS0:
   870			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX;
   871			die |= RK3568_SYS_DSP_INFACE_EN_LVDS0 |
   872				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX, vp->id);
   873			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   874			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   875			break;
   876		case ROCKCHIP_VOP2_EP_LVDS1:
   877			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX;
   878			die |= RK3568_SYS_DSP_INFACE_EN_LVDS1 |
   879				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX, vp->id);
   880			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   881			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   882			break;
   883		default:
   884			drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
   885			return 0;
   886		}
   887	
   888		dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
   889	
   890		vop2_writel(vop2, RK3568_DSP_IF_EN, die);
   891		vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
   892	
   893		return crtc->state->adjusted_mode.crtc_clock  * 1000LL;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
