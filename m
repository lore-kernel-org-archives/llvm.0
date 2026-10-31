Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412318;
	b=TpBhdkHBBiZ6m8AF8z3atWesp7e/YgkjoY6Kge3C8P7CQOzixvTnc14J1pdFeZ9ChaV/
	 og1sR3uw7dFbCXNxRktcBVXJvzY1ya+Tbe5w9ms84cugGiFUg1VU1bMyiueOvjJIOfQDg
	 8wTC9SQA21vDCcXTIH9DqmOetqxURDDBh3UWgOYcvoQyNLgZkX8vYxjYprEjl1m/LHOfc
	 hXMYFBUacSH+4OHlOoSLFrHPop3GJjU+TARTzDBzdx2PXuqYmj+HNBSsMjg9B6CQWPXm7
	 36HH8F4VtKHSy+CCQw9uDp12QEm8DAwwTQLzH1+EOYKzFpuF7fjiYFdYXI1V1u9/CBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UlBttvbTfPH6bD8qwAPRvEvBrmgF2s7FgvULNFDejzM=;
	b=Vcdc8dKYjVkmSfmf0qyOPLRAscE5BpK1Gb28cUteu5ddx97iAWowfueOyUuYimxIxvAI
	 9eFuXzGUwLk3icGa5UAiRC8/cnOIyPhO8K9H0/yiQmeDIR7OxvkvaG/wuai16GeEB2EMb
	 NQJ99K5oE03QvTgwJ7ESBhTO+eOSVTZgmfET06jZ3FkhmJwyZtNYVBnwMqL1JP9jjzYuX
	 bZzQVYUhZHmFDjxmWWztyU4cZLesZ3fZfBrQ0WI178Rx7jcFcJ/DGl5+wUreoD3YDcSBd
	 k6WNA0316lRYFGFRAiqYQGLdy3kvE+wq+VZhkh0jzm5BxNhsD0TkKIpKPOg9sHAIytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KLrg8JRr;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8A606A31C;
	Sat, 31 Oct 2026 02:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KLrg8JRr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793412316; x=1824948316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFP0baAiFvMl7x0GJSmUU/DikfJl7LDgkFNhT+TL2Hc=;
  b=KLrg8JRrl1SoMwcNx0OCYgG/I9AsztINAe6gsGfONLQZ52qcnfpKiTUr
   vRNrHkjCGdVSEzceaNHV206KcnJYSyM/pnQIJoGa2nGyQh+wOw+mjBQQI
   rtszkb6lWU+g6jIWAP3wK4hYSWyPyfW9kPIDt8uLqUciXawZR6t658342
   p04M35eGFcvbNXuWYHyllsBiVP3M7Nk8TW4Cr69hsyL8NMDMYiPVHE0L0
   c2Z8fNlP20qK5VVu42n1pXD0oNq2UXjkwiSnL7v1v1IDpEQjOFr4tqQD7
   s3xAIIenj6fub6yYr8ltJkzdL2WnwCwUJFRKpxOkbn9V/jUY05NqiJ64O
   Q==;
X-CSE-ConnectionGUID: GJ/VKpt/Ri2m7+HT7omycQ==
X-CSE-MsgGUID: Adb4UMC8TYKafJObzmMQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2210044"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2210044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:05:16 -0700
X-CSE-ConnectionGUID: rpu8b9TrR9KayjHTgqdWLw==
X-CSE-MsgGUID: gFTzgCr4SSm7mo8/J3eY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5540397"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2026 19:05:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMySw-00000000cRg-0s3X;
	Sat, 31 Oct 2026 02:05:06 +0000
Date: Sat, 31 Oct 2026 10:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>,
	Han Gao <gaohan@iscas.ac.cn>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 3/3] drm/bridge: add TH1520 DesignWare MIPI DSI host
 controller
Message-ID: <202610311004.6oZFiXBi-lkp@intel.com>
References: <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>
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
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-display-bridge-document-TH1520-MIPI-DSI-controller/20261030-154749
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f%40iscas.ac.cn
patch subject: [PATCH 3/3] drm/bridge: add TH1520 DesignWare MIPI DSI host controller
config: arm64-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311004.6oZFiXBi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311004.6oZFiXBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311004.6oZFiXBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c:445:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     445 |                 dev_err_probe(dev, ret, "Unable to get DSI registers\n");
         |                                    ^~~
   drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c:428:12: note: initialize the variable 'ret' to silence this warning
     428 |         int i, ret;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/ret +445 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c

   420	
   421	static int th1520_dw_mipi_dsi_probe(struct platform_device *pdev)
   422	{
   423		const struct dsi_chip_data *cdata;
   424		struct device *dev = &pdev->dev;
   425		struct th1520_dw_mipi_dsi *dsi;
   426		struct resource *res;
   427		void __iomem *base;
   428		int i, ret;
   429	
   430		dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
   431		if (!dsi)
   432			return -ENOMEM;
   433	
   434		dsi->dev = dev;
   435	
   436		dsi->syscon = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
   437		if (IS_ERR(dsi->syscon)) {
   438			ret = PTR_ERR(dsi->syscon);
   439			dev_err_probe(dev, ret, "Unable to get system controller regmap\n");
   440			return ret;
   441		}
   442	
   443		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   444		if (IS_ERR(base)) {
 > 445			dev_err_probe(dev, ret, "Unable to get DSI registers\n");
   446			return PTR_ERR(base);
   447		}
   448	
   449		cdata = of_device_get_match_data(dev);
   450		i = 0;
   451		while (cdata[i].reg) {
   452			if (cdata[i].reg == res->start) {
   453				dsi->cdata = &cdata[i];
   454				break;
   455			}
   456	
   457			i++;
   458		}
   459	
   460		if (!dsi->cdata) {
   461			dev_err(dev, "Failed to find chip data for this controller\n");
   462			return -EINVAL;
   463		}
   464	
   465		dsi->clk_ref = devm_clk_get_enabled(dev, "ref");
   466		if (IS_ERR(dsi->clk_ref)) {
   467			ret = PTR_ERR(dsi->clk_ref);
   468			dev_err_probe(dev, ret, "Unable to get PHY reference clock\n");
   469			return ret;
   470		}
   471	
   472		dsi->clk_cfg = devm_clk_get_enabled(dev, "phy_cfg");
   473		if (IS_ERR(dsi->clk_cfg)) {
   474			ret = PTR_ERR(dsi->clk_cfg);
   475			dev_err_probe(dev, ret, "Unable to get PHY configuration clock\n");
   476			return ret;
   477		}
   478	
   479		dsi->clk_pix = devm_clk_get(dev, "pixel");
   480		if (IS_ERR(dsi->clk_pix)) {
   481			ret = PTR_ERR(dsi->clk_pix);
   482			dev_err_probe(dev, ret, "Unable to get PHY pixel clock\n");
   483			return ret;
   484		}
   485	
   486		dsi->pdata.base = base;
   487		dsi->pdata.priv_data = dsi;
   488		dsi->pdata.max_data_lanes = 4;
   489		dsi->pdata.phy_ops = &th1520_dw_mipi_dsi_phy_ops;
   490		dsi->pdata.mode_valid = dsi_mode_valid;
   491	
   492		platform_set_drvdata(pdev, dsi);
   493	
   494		dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
   495		if (IS_ERR(dsi->dmd)) {
   496			ret = PTR_ERR(dsi->dmd);
   497			dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
   498			return ret;
   499		}
   500	
   501		return 0;
   502	}
   503	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
