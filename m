Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752981;
	b=k01CqE1XRTfnPPCU8D5/5i8ER58qX1Q4oOJ9KIbbat4Xkx3XcIwypbK5UYqTOpeiLCdP
	 95qsQmanZUCLTMZ38ypmBH0stU2Mnj2Fmys5A457yOVD0agKg413lVZB6yMxGkqMRzbym
	 TCmibGm5GmNzk21y8EG61brILScN8eU1pODBVF9hcJe1Ae915pgRgKUA/SP6ohoWGlMbl
	 /O/dmqHpdotuv36sW25/x0+tM0GD9A+r38VnDtEnbpSZXKibF1CrLuHa81Q74ZYTqrKj4
	 EtS1ok4toesFzu3cwVtxuqcKArSEHKO72fnaPRNmxBBVJoTbDDOViFnOMyqWcljU99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/gkB3CyBnkyEfhETaZTf1/hXY1n3SNjAkSsd3UzcwEI=;
	b=ixt1PzRyv/0y+Qi0fgkanbgBmDGdBzi+WFI0XKHXOdzc0Q4zXDtG+yfdV2tVpQMpg2nF
	 Z5y9FxFroQ56zWOHhJABIC6d39oWDDWJ0auP5Jhzd85cmTl4IU4d1SEk9TBrTuPV9mq10
	 Aqg6MCbEsLidZBRHI5Hb1A/97AhEx5P/zrLWXdFrDyz+bDULtZxbO28j4PLZGDMb1h1Uw
	 6GVK/EjahVRmvBQqjvdfx9h0peQI7VohH08mUI24vkPUCYhIIoQE0xCP/Zy2i/6HLpTdC
	 H4PI7J1M14HceMOoo7b7dtAcMH190Prm6EfPaA6hKUvCoLoL4IcCSiSF+U4KQYIRsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTIgwCZd;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF10606A31B;
	Fri, 23 Oct 2026 10:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTIgwCZd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792752980; x=1824288980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SmNR2fS4YUFeqdtEFX9f9RWWkKArtF5QfsMJTPVdue4=;
  b=GTIgwCZddPwt3AZQr3f8MbmQCV8dtfrjCngcQzQ607Qjrs2rzISzsKV/
   wlgjevpY+Kykb8G+ftmW37kLUce5TAD4gdYNr3NF8pSHOjEyrtcs9AiEF
   LqELM+hfVHeZseY8QwMUbM2sITtNFYnQwIGMLsBULyjaPVPE02HUHj+vV
   6+kHmyNhRvC/uZGISA+8ZWRFYi5fsSEUhkpDUbFqkxE/6fVKZ8xsEM/T8
   cf3qiQljFLBVg+QxVJGrKmLNDDM2X5r97QaqRfKQ2JuFBLibrAZx5A+66
   Hvpi4caJyK5w51DrGDVJtIPCZA0e3P6IJJ0lxrgxXFp+HS4miZx6/2Dzq
   Q==;
X-CSE-ConnectionGUID: 1+xlxOPpSRe8mWNlIcWGRg==
X-CSE-MsgGUID: fdnZQ3qdTTOTeFKpW6abXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1411056"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1411056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:56:19 -0700
X-CSE-ConnectionGUID: 7JI6xiUzRiO89umhOSChPA==
X-CSE-MsgGUID: Sv5MMNRST6yvyNvSIOdgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3557035"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2026 03:56:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCwS-00000000SbK-3Nn3;
	Fri, 23 Oct 2026 10:56:08 +0000
Date: Fri, 23 Oct 2026 18:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
Message-ID: <202610231854.u7RVx7M9-lkp@intel.com>
References: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 725953d4da85cfb97a4c309fad6346b72f8529e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-connector-report-out-of-band-IRQ_HPD-events/20261022-162756
base:   725953d4da85cfb97a4c309fad6346b72f8529e7
patch link:    https://lore.kernel.org/r/20261022-hpd-irq-events-v6-7-337ea3ddaa62%40oss.qualcomm.com
patch subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by USB-C
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261023/202610231854.u7RVx7M9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231854.u7RVx7M9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231854.u7RVx7M9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_display.c:1581:2: error: expected '}'
    1581 | }
         |  ^
   drivers/gpu/drm/msm/dp/dp_display.c:1549:1: note: to match this '{'
    1549 | {
         | ^
   1 error generated.


vim +1581 drivers/gpu/drm/msm/dp/dp_display.c

542b37efc20e648 Bjorn Andersson  2022-12-07  1544  
fb7d509b1710d12 Dmitry Baryshkov 2024-10-29  1545  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
8a717c16ddf2611 Dmitry Baryshkov 2025-08-03  1546  			      struct drm_connector *connector,
5be7f4197260fc7 Dmitry Baryshkov 2026-10-22  1547  			      enum drm_connector_status status,
5be7f4197260fc7 Dmitry Baryshkov 2026-10-22  1548  			      enum drm_connector_dp_event event)
542b37efc20e648 Bjorn Andersson  2022-12-07  1549  {
fb7d509b1710d12 Dmitry Baryshkov 2024-10-29  1550  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
fb7d509b1710d12 Dmitry Baryshkov 2024-10-29  1551  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
fb7d509b1710d12 Dmitry Baryshkov 2024-10-29  1552  	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
5043357e75ba7cc Jessica Zhang    2026-05-24  1553  	u32 hpd_link_status = 0;
542b37efc20e648 Bjorn Andersson  2022-12-07  1554  
5043357e75ba7cc Jessica Zhang    2026-05-24  1555  	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
5043357e75ba7cc Jessica Zhang    2026-05-24  1556  		DRM_ERROR("failed to pm_runtime_resume\n");
542b37efc20e648 Bjorn Andersson  2022-12-07  1557  		return;
5043357e75ba7cc Jessica Zhang    2026-05-24  1558  	}
542b37efc20e648 Bjorn Andersson  2022-12-07  1559  
5043357e75ba7cc Jessica Zhang    2026-05-24  1560  	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
542b37efc20e648 Bjorn Andersson  2022-12-07  1561  
3ea2d1c3d15476d Dmitry Baryshkov 2026-05-24  1562  	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
3ea2d1c3d15476d Dmitry Baryshkov 2026-05-24  1563  		   msm_dp_display->connector_type, hpd_link_status, status);
5043357e75ba7cc Jessica Zhang    2026-05-24  1564  
5043357e75ba7cc Jessica Zhang    2026-05-24  1565  	if (status == connector_status_connected) {
5043357e75ba7cc Jessica Zhang    2026-05-24  1566  		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
5043357e75ba7cc Jessica Zhang    2026-05-24  1567  			msm_dp_hpd_unplug_handle(dp);
5043357e75ba7cc Jessica Zhang    2026-05-24  1568  			msm_dp_hpd_plug_handle(dp);
5043357e75ba7cc Jessica Zhang    2026-05-24  1569  		} else {
5043357e75ba7cc Jessica Zhang    2026-05-24  1570  			msm_dp_hpd_plug_handle(dp);
5043357e75ba7cc Jessica Zhang    2026-05-24  1571  		}
b24625456ddceb2 Dmitry Baryshkov 2026-10-22  1572  
b24625456ddceb2 Dmitry Baryshkov 2026-10-22  1573  		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
b24625456ddceb2 Dmitry Baryshkov 2026-10-22  1574  		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
b24625456ddceb2 Dmitry Baryshkov 2026-10-22  1575  			msm_dp_irq_hpd_handle(dp);
5043357e75ba7cc Jessica Zhang    2026-05-24  1576  	} else {
5043357e75ba7cc Jessica Zhang    2026-05-24  1577  		msm_dp_hpd_unplug_handle(dp);
5043357e75ba7cc Jessica Zhang    2026-05-24  1578  	}
5043357e75ba7cc Jessica Zhang    2026-05-24  1579  
5043357e75ba7cc Jessica Zhang    2026-05-24  1580  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
542b37efc20e648 Bjorn Andersson  2022-12-07 @1581  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
