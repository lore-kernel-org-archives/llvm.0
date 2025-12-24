Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6032860E;
	Wed, 24 Dec 2025 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766592884; cv=none; b=gxaAUGH3tfxZvX9eA0fCWzXa7DorBTa6PnHEazXs7klMm0TIX4IKt67Irh/sNmk3mXUOKaMts0XsP9ZIFIVO4t3AYoAE8ls5JDq6mj+LKILdWyRkrzULei1lMA7PQRZ/+SeCS9uawuQUd1uEdNG30l66y3wvk3j+3fd2dZgLW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766592884; c=relaxed/simple;
	bh=puWmGZxXE8UpiT7pGZBgzqUpkzDtlP+dMU+x0yn5VaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV7R1Y5YVe6qb8vnN1/ULRNBBaozOyk7t3qaxcOwsgCAArXfEBEM47xnLU7eu6IPBxlJeRU9943O3Bun98JcXN4Gay8C9K5MDFtfPGaY95D0SR2SW0947l4QZeRP2nk5Acw7TypuvG9MDT2zvOWHF65pLl3pdq4LLgIwF44G3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRnXEu+b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRnXEu+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766592881; x=1798128881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=puWmGZxXE8UpiT7pGZBgzqUpkzDtlP+dMU+x0yn5VaI=;
  b=CRnXEu+b7DtZ3NjJzyrygeacoFyNWPZ7VcN0+nvUk8Rs62w2UjdLxZnt
   YcWy8JMxQaHxWbjUjmhYna9sFquKvmE0+qoYGwf7CBl3d//VTJHPqz1AB
   Z2nbFBXBpc1oeGgiRz7ZHvF1lkpSeOL58TbVhmYG9LlGqmUt4AeFWZ5+W
   pFZtbceY+nnc1S2HNITaxIjKUrG2Q9vHHkrY1ixtOVe2iY18ud5kmaAW0
   c7mAir/TGnOB2hwSZJ26WSuRNfdEaAA+8cF9RH4gorCOUSPVCpTA/bew5
   +C5Ar8ok8NpmQkEgpk4VRXfom8SEbRzrqSuoPWxLSNAaMkCXOcRFo5jA6
   w==;
X-CSE-ConnectionGUID: sVgtDtAMQz2Zebc7TqYsww==
X-CSE-MsgGUID: xyrzvazDQhu3DJr71yjUMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="93898558"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="93898558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 08:14:38 -0800
X-CSE-ConnectionGUID: IbXEZ3XjTeGoaTrUH18k5g==
X-CSE-MsgGUID: BE8WK5MDSv2mgzXQclGqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199282595"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 08:14:33 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYRVN-000000003FJ-2PxI;
	Wed, 24 Dec 2025 16:14:29 +0000
Date: Thu, 25 Dec 2025 00:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marijn Suijten <marijn.suijten@somainline.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Casey Connolly <casey.connolly@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <202512242356.EwESE8Qv-lkp@intel.com>
References: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>

Hi Marijn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marijn-Suijten/drm-panel-Clean-up-SOFEF00-config-dependencies/20251222-073548
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251222-drm-panels-sony-v2-5-82a87465d163%40somainline.org
patch subject: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01 DDIC
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512242356.EwESE8Qv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242356.EwESE8Qv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242356.EwESE8Qv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-sofef01.c:389:20: warning: cast to smaller integer type 'enum panel_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +389 drivers/gpu/drm/panel/panel-samsung-sofef01.c

   357	
   358	static int samsung_sofef01_m_probe(struct mipi_dsi_device *dsi)
   359	{
   360		const struct backlight_properties props = {
   361			.type = BACKLIGHT_RAW,
   362			.brightness = 100,
   363			.max_brightness = 1023,
   364		};
   365		struct device *dev = &dsi->dev;
   366		struct samsung_sofef01_m *ctx;
   367		int ret;
   368	
   369		ctx = devm_drm_panel_alloc(dev, struct samsung_sofef01_m, panel,
   370					   &samsung_sofef01_m_panel_funcs,
   371					   DRM_MODE_CONNECTOR_DSI);
   372		if (IS_ERR(ctx))
   373			return PTR_ERR(ctx);
   374	
   375		ret = devm_regulator_bulk_get_const(
   376			dev,
   377			ARRAY_SIZE(samsung_sofef01_m_supplies),
   378			samsung_sofef01_m_supplies,
   379			&ctx->supplies);
   380		if (ret < 0)
   381			return dev_err_probe(dev, ret, "Failed to get regulators\n");
   382	
   383		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   384		if (IS_ERR(ctx->reset_gpio))
   385			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   386					     "Failed to get reset-gpios\n");
   387	
   388		ctx->dsi = dsi;
 > 389		ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
   390		if (ctx->panel_type == PANEL_TYPE_TC01)
   391			ctx->mode = &samsung_sofef01_m_61_142_mode;
   392		else if (ctx->panel_type == PANEL_TYPE_DK01)
   393			ctx->mode = &samsung_sofef01_m_61_141_mode;
   394		else
   395			ctx->mode = &samsung_sofef01_m_60_139_mode;
   396		mipi_dsi_set_drvdata(dsi, ctx);
   397	
   398		dsi->lanes = 4;
   399		dsi->format = MIPI_DSI_FMT_RGB888;
   400		dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
   401	
   402		ctx->panel.prepare_prev_first = true;
   403	
   404		ctx->panel.backlight = devm_backlight_device_register(
   405			dev, dev_name(dev), dev, dsi,
   406			&samsung_sofef01_m_bl_ops,
   407			&props);
   408		if (IS_ERR(ctx->panel.backlight))
   409			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   410					     "Failed to create backlight\n");
   411	
   412		drm_panel_add(&ctx->panel);
   413	
   414		ret = mipi_dsi_attach(dsi);
   415		if (ret < 0) {
   416			dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
   417			drm_panel_remove(&ctx->panel);
   418			return ret;
   419		}
   420	
   421		return 0;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
