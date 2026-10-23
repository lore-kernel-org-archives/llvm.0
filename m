Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748826;
	b=RJYDjylZnW0HUfRyMmiGhURobFF0EHiZsBJjpJYHIizMot/GRjjXG91yIvnSS43/y90U
	 +pz33H63EjCUjnIrB2XGYQ8TYIeAsZ7vt32DsYi8Q6yXSn4czKy9EHZau3+YAVNRRHBmt
	 ChIPDZDW/fvB1hTI9SLXtjb/1zgFcMh5/R+Q7qZnGkxxRmLXER6oKiEf0pvjuAbgqXK5S
	 MCuK5YaiByx6N6lj7sgbzldXKu1szcZFC34VagRd2caXOiavpEWA2ajjGhMmdlmbzMXpi
	 uJx3z1Qg5gH2rQgvNN7WmpY21yrx+LDRftTGvj9JHxOivfEedDF0MyaQxBUQUgsWgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748826;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BaBhHIwP5Ua3qHMWFlzBtgALNXFNaZcIn+2A1HkNCG0=;
	b=pyY/UZgtBFeJ30EdkLn2F0jI+RGHw01WOBoGm8Yx1RqFss+C9yiXGAF1mb5Qfn8rVJKe
	 omFARKNcxAvH3hFrDCk17QrxKULrk/eqncS35mwXbmtVZ5bQtMTqofuWZytNrfx0oCs6y
	 +ZFvi8JTl1BpeBCKh3q/+vfD8EhzhHKy8UYM9dqGZWzn2iZ7DR6GnR997pLbbBHNs+s2Z
	 J+zWr4rGBkxrI8D0gbzAlTA1gO4HsX04U1dNviX2bDwpo2kIL87m7F32t4M6cWy5loFNB
	 AyTvgxYFnQuejc95aWOENMCAiVm5imngs/vHbLCz6PAoQpHUGxzQ9CSDWCo3nWHwLNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GZFliATV;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B1606A31F;
	Fri, 23 Oct 2026 09:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745B1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GZFliATV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792748825; x=1824284825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gQ9nQ7BayhpQi7/501DcO0lJ2Sxa5ZeozNJ37s/HH+M=;
  b=GZFliATVYyGCjtURgimi5JLimb4WSFO+ecprCgeTAuNTeZXZHKiaUEt+
   wA7s+q3vTsGLfhCXkTA1Dks42qNhj/H7FCMbjdqJipLnJE4FfNVQZcmo1
   ISpC6yhpZnVYpLE1xNI9HSpNIBUIk04VjiJZLUxl/0YzO2SJx+dnZ0fWJ
   lBIt8427os24UVd/1mmiSGHnIyhG+o2FnZyMQ0gcG6JiGoorDx5rYXw6D
   ehVoFavSWlWzLikZtwLldhXM/Gr6hh9nMjO/K6bWnJJ4nKjsDgLezTL6P
   lrZlaNVkB4fxYwXQkRp6KtkcyOC5pVvqFMy1z9gMYW6xpFAsIN1HdSSLx
   w==;
X-CSE-ConnectionGUID: Y0eu/TGJTdyQ7wo5k/VZcA==
X-CSE-MsgGUID: irYnnc8HQyy7SN4f7Guatg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383340"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1383340"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:47:05 -0700
X-CSE-ConnectionGUID: CtmiaNT2Qe610YGnKfB18Q==
X-CSE-MsgGUID: 72CUuvjpQs6P+tCXdd0VJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3691885"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Oct 2026 02:47:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKBrW-00000000SVu-2fyk;
	Fri, 23 Oct 2026 09:46:58 +0000
Date: Fri, 23 Oct 2026 17:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lars Rask <lars.rask@axis.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@axis.com,
	Lars Rask <lars.rask@axis.com>
Subject: Re: [PATCH 1/2] drm/sitronix/st7571-spi: Add support for ST75156
 controller
Message-ID: <202610231738.0gNssMIn-lkp@intel.com>
References: <20261022-add_st75156_support-v1-1-582525a39a39@axis.com>
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
In-Reply-To: <20261022-add_st75156_support-v1-1-582525a39a39@axis.com>

Hi Lars,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8d3ae59288f1e7d58d76558a6ee96d533bc5019f]

url:    https://github.com/intel-lab-lkp/linux/commits/Lars-Rask/drm-sitronix-st7571-spi-Add-support-for-ST75156-controller/20261022-173105
base:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
patch link:    https://lore.kernel.org/r/20261022-add_st75156_support-v1-1-582525a39a39%40axis.com
patch subject: [PATCH 1/2] drm/sitronix/st7571-spi: Add support for ST75156 controller
config: i386-buildonly-randconfig-1001-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231738.0gNssMIn-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231738.0gNssMIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231738.0gNssMIn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/sitronix/st7571-spi.c:121:43: warning: variable 'regmap' is uninitialized when used here [-Wuninitialized]
     121 |                 return dev_err_probe(&spi->dev, PTR_ERR(regmap),
         |                                                         ^~~~~~
   drivers/gpu/drm/sitronix/st7571-spi.c:116:23: note: initialize the variable 'regmap' to silence this warning
     116 |         struct regmap *regmap;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +/regmap +121 drivers/gpu/drm/sitronix/st7571-spi.c

   112	
   113	static int st7571_spi_probe(struct spi_device *spi)
   114	{
   115		struct st7571_device *st7571;
   116		struct regmap *regmap;
   117		struct spi_device_data *spi_data;
   118	
   119		spi_data = devm_kzalloc(&spi->dev, sizeof(*spi_data), GFP_KERNEL);
   120		if (IS_ERR(spi_data))
 > 121			return dev_err_probe(&spi->dev, PTR_ERR(regmap),
   122					     "Failed to initialize spi data\n");
   123	
   124		spi_data->spi = spi;
   125		spi_data->dc_gpio = devm_gpiod_get(&spi->dev, "dc", GPIOD_OUT_LOW);
   126	
   127		if (IS_ERR(spi_data->dc_gpio))
   128			/* init regmap for 3 line SPI */
   129			regmap = devm_regmap_init_spi(spi, &st7571_spi_regmap_config);
   130		else
   131			/* init regmap for 4 line SPI */
   132			regmap = devm_regmap_init(&spi->dev, &regmap_spi_dc_bus,
   133						  spi_data, &st7571_spi_regmap_config);
   134	
   135		if (IS_ERR(regmap))
   136			return dev_err_probe(&spi->dev, PTR_ERR(regmap),
   137					     "Failed to initialize regmap\n");
   138	
   139		st7571 = st7571_probe(&spi->dev, regmap);
   140		if (IS_ERR(st7571))
   141			return dev_err_probe(&spi->dev, PTR_ERR(st7571),
   142					     "Failed to initialize regmap\n");
   143	
   144		st7571->spi_data = spi_data;
   145		spi_set_drvdata(spi, st7571);
   146	
   147		return 0;
   148	}
   149	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
