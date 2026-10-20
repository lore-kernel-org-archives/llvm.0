Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536313;
	b=v/yB/GCIf5vSrcxMqBcqg5/GsTqP87ADhrbdOcoV767W9oZBUpdFavRxjCtLg4wop6x5
	 23lh7+z38R14Dm/tmPiThkdNoMzXX4aSzs4Gu1KYl7UDkTI/mF7xynBTCUIeAFF6Q3Cse
	 71r5uPysQHMrE/ZxlSK0ozdf3meXBHJ+5pAzKEc2u19Co7YQL7jR86WcLNW9uN+56Q1en
	 qhPl80YRR3vPmjLAAGjkazei+E8+KAXh5m6YfaIf2Kc2ZxecHHSgfCMWOp2BzM67ALT1H
	 HQC5uOAc+kzo3iAzkyNCsF3X+O/iQxwP1MCYfOyzDurFiOXlOCEUG4qcz4dM1dq87/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536313;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=lJLnHt4bxbKF39LO9zBvyGdrg+8lnf6r+u8u5/WrGZA=;
	b=gbaRRpva5n2jDUWG8NkMlS7IPWEGDEtGeEg9fwsSDZehWN6SdXaoLo2xu5muxZKBGDMP
	 DWPFqR5TNfR1ZSXFVb48p29/Pzw1cGSWsUhFi/nJpjn1jBeJT+npIgsnZSX8hksNJkM07
	 v3LNvXu5lu7Gwkabw3mxxnT0sGlF0EovWRHUZiYXbmufV9rjSTgEBfSmYizv05AcTd6G5
	 1JHAJ3niIUcOJI3/d/QTvLk/KSIGIyldqHTMAeiogWRYGZURw6MIJi3XaVGS5dn5miucr
	 gYYMJj1VYIHVOeLWnyVTPn+MT+plHyGQeIxyQDBrPmu8ngEJmWjj9JKdcCeLWI0Sffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hpuPhNty;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32413606A320;
	Tue, 20 Oct 2026 22:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32413606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hpuPhNty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792536312; x=1824072312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4qZsjXfVDronkzI5htlpTGEiOv4YO+QDYYMog/2uT5U=;
  b=hpuPhNtyG433z7do0RMqVI1+1Ca+nwYLYhHjcjuPQbAS+yzK5MVOT/ai
   +O7TlUSH/WjSayBgJNwHCQPuIA6pYjhawbhSjh3ciQDVdixNjJLgOvJt1
   82aAC6KOTvcAYbGes21ewCmxdJAnqnqiZHrKctcPaBoRAkiQvdztnp/lL
   yNsDihpXthaL5w39ia8QDE5+ImJVwqXkbo5JZqbR3a+RNPParenZVIL9Y
   bkzR53Ym0XskpfslGvFEy7yD5DjRJFgv/bGQxI2URF+iDvsCqB9454m54
   mZhZDHyU/S1CtX3iSu1mvY2IfOSltEbFo+WIcat1PMZPFWNKyuD9EPOcB
   w==;
X-CSE-ConnectionGUID: 5ROMJ3SNQgi6jc+JTd6tnQ==
X-CSE-MsgGUID: 6J8wvfHJSdiI27EvsuQYbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263062"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:45:11 -0700
X-CSE-ConnectionGUID: naZfbzKAQxWKEBuQXOviSw==
X-CSE-MsgGUID: 7/2ocfsSQbazXZov9lQ3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2990709"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Oct 2026 15:45:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJIZq-00000000Oby-3GFd;
	Tue, 20 Oct 2026 22:45:02 +0000
Date: Wed, 21 Oct 2026 06:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 6/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI
 Type B panel driver
Message-ID: <202610210605.HdtW8SAP-lkp@intel.com>
References: <20261019095705.91062-7-clamor95@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019095705.91062-7-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next linus/master v7.3 next-20261019]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/drm-tegra-dc-Expand-available-registers-layouts/20261019-125659
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261019095705.91062-7-clamor95%40gmail.com
patch subject: [PATCH v3 6/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
config: arm64-randconfig-1002-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210605.HdtW8SAP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210605.HdtW8SAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210605.HdtW8SAP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dbi.c:79:17: warning: unused variable 'mipi_dbi_dcs_read_commands' [-Wunused-const-variable]
      79 | static const u8 mipi_dbi_dcs_read_commands[] = {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mipi_dbi_dcs_read_commands +79 drivers/gpu/drm/drm_mipi_dbi.c

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   78  
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  @79  static const u8 mipi_dbi_dcs_read_commands[] = {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   80  	MIPI_DCS_GET_DISPLAY_ID,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   81  	MIPI_DCS_GET_RED_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   82  	MIPI_DCS_GET_GREEN_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   83  	MIPI_DCS_GET_BLUE_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   84  	MIPI_DCS_GET_DISPLAY_STATUS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   85  	MIPI_DCS_GET_POWER_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   86  	MIPI_DCS_GET_ADDRESS_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   87  	MIPI_DCS_GET_PIXEL_FORMAT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   88  	MIPI_DCS_GET_DISPLAY_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   89  	MIPI_DCS_GET_SIGNAL_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   90  	MIPI_DCS_GET_DIAGNOSTIC_RESULT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   91  	MIPI_DCS_READ_MEMORY_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   92  	MIPI_DCS_READ_MEMORY_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   93  	MIPI_DCS_GET_SCANLINE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   94  	MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   95  	MIPI_DCS_GET_CONTROL_DISPLAY,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   96  	MIPI_DCS_GET_POWER_SAVE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   97  	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   98  	MIPI_DCS_READ_DDB_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22   99  	MIPI_DCS_READ_DDB_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  100  	0, /* sentinel */
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  101  };
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  102  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
