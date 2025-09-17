Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FE2EA727;
	Wed, 17 Sep 2025 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758100980; cv=none; b=Fjwoeo/UOeDDwnqyo7Mtt3Z1g5LqZOkYz4pE+f7Vd2tZYK1fpa698J38gamT5XOzxOtJFfZl+uFFIenlY141erhTAFjUkLUFFSzKe9AYgtG0vvOExUcrYk2ZIqUAzh5BHdZpwIx+haTdWDv/z0gFCOZdvgchyVE9Hp336r/kEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758100980; c=relaxed/simple;
	bh=yKgXc9fU+S1cFIgmRsCSfUa45Akir9pwqHE7rWhoxXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjHWyS9Fv+hJ45zTjzCNLK28uOKerJBgErUydcE3bwJg5u4eukbropFdOOhk9w0xZapdx7+RD0Bb7ihO9iqUTUus7Vl6X9aGRhN3ra/sm7jjl4RwtL8ERkykKk5f8s7KwZKELax5DPzK5SS+bwZ52Q8avqWWEZJFdHtAwXeQpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2MbTf6g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2MbTf6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F307EC4CEF0;
	Wed, 17 Sep 2025 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758100979;
	bh=yKgXc9fU+S1cFIgmRsCSfUa45Akir9pwqHE7rWhoxXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2MbTf6gsJF4EGiJCXDmiTkBct1KaJMs2ZL9mit7/R1bC23Cc3WOc5F3l330Ugb1p
	 MSSaUy4+uhTBUBgZhn0gypb5z1O00AsRlSTj55ekeZyRGL66r+TMkZA2LHBCYQbFrl
	 KFp0RZdROvM9FPKxEak+njh+58kD3N2CP7yO/REP7HbuyzsM+lHULNTyVtnL024O5V
	 20qLpDo9UuVAV4fseMDePq2M67ZhVq2WJk2YM5NjX5EgZrpoly1vm4lSlEEbIec+vZ
	 7igKlLZVJ7OpYApi67Cq5CQ5T4ybk3MSyzRKzvYMcdYbwW9ngcnKDPooy/0Y3s8y+Z
	 RNmzZ0Mitk8UA==
Date: Wed, 17 Sep 2025 10:22:54 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Simona Vetter <simona.vetter@ffwll.ch>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>
Subject: Re: [lee-backlight:for-backlight-next 14/14]
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call
 to undeclared function 'device_property_read_bool'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <20250917092254.GD3893363@google.com>
References: <202509170410.RubSxK3n-lkp@intel.com>
 <a555ff12-e0a9-4413-b90c-0b0fe8515723@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a555ff12-e0a9-4413-b90c-0b0fe8515723@suse.de>

On Wed, 17 Sep 2025, Thomas Zimmermann wrote:

> Hi,
> 
> it seems impossible to catch all of those.

That's what it's there for. :)

> I'm going to send out a patch for
> the driver and get it upstream ASAP.

Sounds good, thanks.

> Am 16.09.25 um 22:29 schrieb kernel test robot:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
> > head:   9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
> > commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2 [14/14] backlight: Do not include <linux/fb.h> in header file
> > config: x86_64-buildonly-randconfig-004-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509170410.RubSxK3n-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call to undeclared function 'device_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >       718 |         ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
> >           |                                ^
> >     drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: note: did you mean 'drm_property_create_bool'?
> >     include/drm/drm_property.h:271:22: note: 'drm_property_create_bool' declared here
> >       271 | struct drm_property *drm_property_create_bool(struct drm_device *dev,
> >           |                      ^
> > > > drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:748:61: error: array has incomplete element type 'const struct of_device_id'
> >       748 | static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
> >           |                                                             ^
> >     include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
> >       106 |         const struct of_device_id       *of_match_table;
> >           |                      ^
> >     2 errors generated.
> > 
> > 
> > vim +/device_property_read_bool +718 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> > 
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  683
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  684  static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  685  {
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  686  	struct device *dev = &dsi->dev;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  687  	struct s6e88a0_ams427ap24 *ctx;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  688  	int ret;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  689
> > 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  690  	ctx = devm_drm_panel_alloc(dev, struct s6e88a0_ams427ap24, panel,
> > 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  691  				   &s6e88a0_ams427ap24_panel_funcs,
> > 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  692  				   DRM_MODE_CONNECTOR_DSI);
> > 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  693  	if (IS_ERR(ctx))
> > 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  694  		return PTR_ERR(ctx);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  695
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  696  	ret = devm_regulator_bulk_get_const(dev,
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  697  				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  698  				      s6e88a0_ams427ap24_supplies,
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  699  				      &ctx->supplies);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  700  	if (ret < 0)
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  701  		return ret;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  702
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  703  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  704  	if (IS_ERR(ctx->reset_gpio))
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  705  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  706  				     "Failed to get reset-gpios\n");
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  707
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  708  	ctx->dsi = dsi;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  709  	mipi_dsi_set_drvdata(dsi, ctx);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  710
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  711  	dsi->lanes = 2;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  712  	dsi->format = MIPI_DSI_FMT_RGB888;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  713  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  714  			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_NO_HFP;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  715
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  716  	ctx->panel.prepare_prev_first = true;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  717
> > e70d4f8e242bbc4 Jakob Hauser    2024-10-28 @718  	ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
> > e70d4f8e242bbc4 Jakob Hauser    2024-10-28  719
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  720  	ret = s6e88a0_ams427ap24_register_backlight(ctx);
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  721  	if (ret < 0)
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  722  		return ret;
> > 5b67fdf1668fc37 Jakob Hauser    2024-10-28  723
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  724  	drm_panel_add(&ctx->panel);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  725
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  726  	ret = mipi_dsi_attach(dsi);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  727  	if (ret < 0) {
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  728  		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  729  		drm_panel_remove(&ctx->panel);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  730  		return ret;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  731  	}
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  732
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  733  	return 0;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  734  }
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  735
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  736  static void s6e88a0_ams427ap24_remove(struct mipi_dsi_device *dsi)
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  737  {
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  738  	struct s6e88a0_ams427ap24 *ctx = mipi_dsi_get_drvdata(dsi);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  739  	int ret;
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  740
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  741  	ret = mipi_dsi_detach(dsi);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  742  	if (ret < 0)
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  743  		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  744
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  745  	drm_panel_remove(&ctx->panel);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  746  }
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  747
> > d5658db2a0768a7 Jakob Hauser    2024-10-28 @748  static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  749  	{ .compatible = "samsung,s6e88a0-ams427ap24" },
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  750  	{ /* sentinel */ },
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  751  };
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  752  MODULE_DEVICE_TABLE(of, s6e88a0_ams427ap24_of_match);
> > d5658db2a0768a7 Jakob Hauser    2024-10-28  753
> > 
> > :::::: The code at line 718 was first introduced by commit
> > :::::: e70d4f8e242bbc4fd39f3a867dc3e33122d7e559 drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
> > 
> > :::::: TO: Jakob Hauser <jahau@rocketmail.com>
> > :::::: CC: Neil Armstrong <neil.armstrong@linaro.org>
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
> 

-- 
Lee Jones [李琼斯]
