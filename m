Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713671C8604;
	Sun,  8 Mar 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772979465; cv=none; b=ZgP0mXdmCc7dliu/w4sgNxPHpQL8ViNoL4V+6tUyFt1s9OyFU77g+wdPTSLes9vmJt9VCSmwXFoIA/ClYikfFi7wkKidWuDs5kcCGLn/3wQPJFfo1FPRI5CE1E+dw35gMYnbqSajMKPf1gnAOTHsFwXB5eCU9OKRBgoGJzX7vIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772979465; c=relaxed/simple;
	bh=8qeFutWw+BB4rroxVqdEPs7a3s6Ta8CazCTn6Ie2wzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lndGp0BPx8QvYPfjRuMNNtzyXSskZ27a4C8/EWTUjkFQw6I4AAI4dRnu4ZiRbMf8Ct+el/Fl3myGGFwoP0RUShlOoNIc0m++xXumiEmo4WkrVL/FNDx/9q6qIRfb3XFA/cIFY+AhYFJOGy+Ar7l2oZOwfoWl4kN2zzsIVI6B2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lv0xnwrJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lv0xnwrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772979462; x=1804515462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8qeFutWw+BB4rroxVqdEPs7a3s6Ta8CazCTn6Ie2wzc=;
  b=lv0xnwrJ6/KdS8EV8g9w8V3A3j3yleTceETtPf0UbthsOl3cgeQPVSXE
   6fpNK4QUw6XqSN8jFAPA3ofQz2arN5kv8I8bAL2fX/mEL2qS13enjblub
   fNloCe1/TBo3JOecp9m076jW4D7IeNt9pkCHvlp0mh56vBt1NjHr016uf
   LhJ/nxwYLSoxbYDjDa8geBJGpjo9TE+Viqr4xT776KFipm5IPAPDEaQPQ
   QQJj/vXkV5LubbX7G2Uaw+bWsdhw/6Hr/iCNougi1WHKfCXshS/JqtGGZ
   F16wtxtms2345FKK1PwOEs5iB87hMtG0VSP2Wbmt4yZ8oVtKAQbpd1nXa
   g==;
X-CSE-ConnectionGUID: 7llR+5R7TPq2cPP2L/k+Xw==
X-CSE-MsgGUID: g5mTQ79RRxOOPSNN0MgpKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77898214"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77898214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 07:17:41 -0700
X-CSE-ConnectionGUID: vK5RaDZZTU+P8ecYkBrL4g==
X-CSE-MsgGUID: KN9S+TStSV65E+A7SP3bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="222211592"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2026 07:17:36 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzEwn-000000003AW-3Wna;
	Sun, 08 Mar 2026 14:17:33 +0000
Date: Sun, 8 Mar 2026 22:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <AKoskovich@pm.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
Message-ID: <202603082210.FAhPnZOe-lkp@intel.com>
References: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/dt-bindings-display-panel-Document-Tianma-TA066VVHM03/20260308-140525
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260308-tianma-ta066vvhm03-v1-2-869fac443b20%40pm.me
patch subject: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603082210.FAhPnZOe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082210.FAhPnZOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082210.FAhPnZOe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c:335:7: error: no member named 'dsc_slice_per_pkt' in 'struct mipi_dsi_device'
     335 |         dsi->dsc_slice_per_pkt = 2;
         |         ~~~  ^
   1 error generated.


vim +335 drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c

   286	
   287	static int tianma_ta066vvhm03_probe(struct mipi_dsi_device *dsi)
   288	{
   289		struct device *dev = &dsi->dev;
   290		struct tianma_ta066vvhm03 *ctx;
   291		int ret;
   292	
   293		ctx = devm_drm_panel_alloc(dev, struct tianma_ta066vvhm03, panel,
   294					   &tianma_ta066vvhm03_panel_funcs,
   295					   DRM_MODE_CONNECTOR_DSI);
   296		if (IS_ERR(ctx))
   297			return PTR_ERR(ctx);
   298	
   299		ret = devm_regulator_bulk_get_const(dev,
   300						    ARRAY_SIZE(tianma_ta066vvhm03_supplies),
   301						    tianma_ta066vvhm03_supplies,
   302						    &ctx->supplies);
   303		if (ret < 0)
   304			return ret;
   305	
   306		ctx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
   307		if (IS_ERR(ctx->enable_gpio))
   308			return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
   309					     "Failed to get enable-gpios\n");
   310	
   311		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   312		if (IS_ERR(ctx->reset_gpio))
   313			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   314					     "Failed to get reset-gpios\n");
   315	
   316		ctx->dsi = dsi;
   317		mipi_dsi_set_drvdata(dsi, ctx);
   318	
   319		dsi->lanes = 4;
   320		dsi->format = MIPI_DSI_FMT_RGB888;
   321		dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
   322				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
   323	
   324		ctx->panel.prepare_prev_first = true;
   325	
   326		ctx->panel.backlight = tianma_ta066vvhm03_create_backlight(dsi);
   327		if (IS_ERR(ctx->panel.backlight))
   328			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   329					     "Failed to create backlight\n");
   330	
   331		drm_panel_add(&ctx->panel);
   332	
   333		/* This panel only supports DSC; unconditionally enable it */
   334		dsi->dsc = &ctx->dsc;
 > 335		dsi->dsc_slice_per_pkt = 2;
   336	
   337		ctx->dsc.dsc_version_major = 1;
   338		ctx->dsc.dsc_version_minor = 1;
   339	
   340		ctx->dsc.slice_height = 20;
   341		ctx->dsc.slice_width = 540;
   342		WARN_ON(1080 % ctx->dsc.slice_width);
   343		ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
   344		ctx->dsc.bits_per_component = 10;
   345		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
   346		ctx->dsc.block_pred_enable = true;
   347	
   348		ret = mipi_dsi_attach(dsi);
   349		if (ret < 0) {
   350			drm_panel_remove(&ctx->panel);
   351			return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   352		}
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
