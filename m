Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6CA1852
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652858194; x=1684394194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcRevddGN/h5sqx6Ciz2gc2PYJvQVhE5R6wwNzzDbC0=;
  b=h6ejiHJjyylV5Zjlw00Al9ODxA8sECXhGBFTr1cP+NG6XF6mg+QKxc81
   kihlufydoefN/2uxecqR6nSxpm4F35dX3Hqx0ab9pC6zTaA2cInzkJDUQ
   OYIeBreP//NaAEZJ6wpKr+/933oo8pryf2SVq8CnAt6XtSooRQkm5pEzT
   s5hmAWtkQX+7C1hecx305VPnM/uKwLElDcGvI5jE1cF9Yaoe/gOr+q/wf
   ZrZ2PiaUCsWYjziq+6nVIbqFImxfRobKykIOzfcotWgg+IIPtuHsWupTD
   UOH/gfU4E4P2z4KVP/Fm0l1Jl9+q71vFgXXRWskF3oBDEqd7wihoWLoRS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="251419713"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="251419713"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 00:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="523383739"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 May 2022 00:16:22 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrDuw-0001v3-5N;
	Wed, 18 May 2022 07:16:22 +0000
Date: Wed, 18 May 2022 15:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
Subject: [drm-misc:drm-misc-next 2/2]
 drivers/gpu/drm/bridge/analogix/anx7625.c:1643:18: error: use of undeclared
 identifier 'V4L2_FWNODE_BUS_TYPE_DPI'
Message-ID: <202205181514.UVkvf0YL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   315a8d00ac74c59a688a1a88c0ed97a7791d1c91
commit: a77c2af0994e24ee36c7ffb6dc852770bdf06fb1 [2/2] drm/bridge: anx7625: Use DPI bus type
config: arm-buildonly-randconfig-r001-20220518 (https://download.01.org/0day-ci/archive/20220518/202205181514.UVkvf0YL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout a77c2af0994e24ee36c7ffb6dc852770bdf06fb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/analogix/anx7625.c:1643:18: error: use of undeclared identifier 'V4L2_FWNODE_BUS_TYPE_DPI'
           if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
                           ^
   1 error generated.


vim +/V4L2_FWNODE_BUS_TYPE_DPI +1643 drivers/gpu/drm/bridge/analogix/anx7625.c

  1617	
  1618	static int anx7625_parse_dt(struct device *dev,
  1619				    struct anx7625_platform_data *pdata)
  1620	{
  1621		struct device_node *np = dev->of_node, *ep0;
  1622		int bus_type, mipi_lanes;
  1623	
  1624		anx7625_get_swing_setting(dev, pdata);
  1625	
  1626		pdata->is_dpi = 0; /* default dsi mode */
  1627		pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
  1628		if (!pdata->mipi_host_node) {
  1629			DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
  1630			return -ENODEV;
  1631		}
  1632	
  1633		bus_type = 0;
  1634		mipi_lanes = MAX_LANES_SUPPORT;
  1635		ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
  1636		if (ep0) {
  1637			if (of_property_read_u32(ep0, "bus-type", &bus_type))
  1638				bus_type = 0;
  1639	
  1640			mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
  1641		}
  1642	
> 1643		if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
  1644			pdata->is_dpi = 1;
  1645	
  1646		pdata->mipi_lanes = mipi_lanes;
  1647		if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
  1648			pdata->mipi_lanes = MAX_LANES_SUPPORT;
  1649	
  1650		if (pdata->is_dpi)
  1651			DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
  1652		else
  1653			DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
  1654	
  1655		if (of_property_read_bool(np, "analogix,audio-enable"))
  1656			pdata->audio_en = 1;
  1657	
  1658		pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
  1659		if (IS_ERR(pdata->panel_bridge)) {
  1660			if (PTR_ERR(pdata->panel_bridge) == -ENODEV)
  1661				return 0;
  1662	
  1663			return PTR_ERR(pdata->panel_bridge);
  1664		}
  1665	
  1666		DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
  1667	
  1668		return 0;
  1669	}
  1670	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
