Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DF13FEE;
	Sat, 14 Sep 2024 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282604; cv=none; b=iUVe1YfpXh03usb1CySnPYzlhMXBo1JHMhU485oUzXwZpHvTynt79upeZkoW7NpowiyrhoNIAnkVDLDoKeBvvxHMZDiXIon8V0CWSgpxd0qKHA2JSYT3zw4ejPjkgQbDBSaViHqANW8TOiN3/Q3AAFzp6+xbZOFG+0D2ZwhDW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282604; c=relaxed/simple;
	bh=TfRF/a3tZMACX33Nym0bwiApVNFyDJF2lXEejWZJEFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLrHiaIOFtopKWT160N/4ZDp9+KN6JgMfVgWWBWHiJLeWTmCYya1smNuIe44gnW28/K4bmsp2+E5E/fT1c/AUBX6om1hayBVUbl16WVKizxtXw43V40Xwa0VAbum7wcB1BWBQOCc+LXrz4SxLNbzkcRPwjVI4N46jEpjXjeLi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJfS7Qy7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJfS7Qy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726282603; x=1757818603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TfRF/a3tZMACX33Nym0bwiApVNFyDJF2lXEejWZJEFc=;
  b=ZJfS7Qy754xniqsiCMj9LKtr7E2hIXAlrmnqrGnT9jn3U1Ykvn3musq7
   77Opryka0YoZ3qadBdl8SjZJWP6Qi7S38acaqruXbWdWH+eaeICxqdopI
   j3+ttMeRkEdreF6wcyXBmUNIfb7ECL7DPXqTmPLiofqGTD52JZy5hEovX
   /hbTfFx+tOZH3TOc62HGN7mD0SRO2iLGznMwZ5dH19f/mmfmkns5QDBJj
   b6CWHwWvWeknBRp7VCM0+TWMqLXC4OqM5+wiGwYj9/WLuvwLVGxIzfvsD
   o7Mj3zDKWf8Ncjk3QcmBZkkq4QvTmrAwWZlGuNLCkPn4bERcGsmiABfCL
   w==;
X-CSE-ConnectionGUID: eUQ1fSjkRmWnPr3wUn1d3Q==
X-CSE-MsgGUID: DpB0f9yZS9quWck2yJ6WYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35770254"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35770254"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 19:56:43 -0700
X-CSE-ConnectionGUID: lEjkV/aDSI6kXppHOWZz9Q==
X-CSE-MsgGUID: G84aYRYRSwaILiSOQmbkAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="91561390"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 19:56:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spIxe-0007Hg-0m;
	Sat, 14 Sep 2024 02:56:34 +0000
Date: Sat, 14 Sep 2024 10:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 13/21] pinctrl: Add drivers for ADI ADSP-SC5xx platform
Message-ID: <202409141049.53oom3zJ-lkp@intel.com>
References: <20240912-test-v1-13-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-13-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-13-458fa57c8ccf%40analog.com
patch subject: [PATCH 13/21] pinctrl: Add drivers for ADI ADSP-SC5xx platform
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409141049.53oom3zJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141049.53oom3zJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141049.53oom3zJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'pctldev' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'np' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'map' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'num_maps' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: expecting prototype for Handle device tree structures like(). Prototype was for adsp_pinctrl_dt_node_to_map() instead


vim +291 drivers/pinctrl/pinctrl-adsp.c

   271	
   272	/**
   273	 * Handle device tree structures like:
   274	 *
   275	 * pinctrl_uart0_hwflow: uart0_hwflow_pins {
   276	 *   pins_rxtx_ {
   277	 *     pinmux = <1>, <2>;
   278	 *     some-padconf-flag;
   279	 *   };
   280	 *   pins_hwflow {
   281	 *     pinmux = <3>, <4>;
   282	 *     some-other-padconf-flag;
   283	 *   };
   284	 * };
   285	 *
   286	 * where &pinctrl_uart0_hwflow is passed as an entry in pinctrl-0 on uart driver and
   287	 * enables all sub-pins at once
   288	 */
   289	static int adsp_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
   290		struct device_node *np, struct pinctrl_map **map, unsigned int *num_maps)
 > 291	{
   292		unsigned int reserved_maps;
   293		struct device_node *child_np;
   294		int ret;
   295	
   296		reserved_maps = 0;
   297		*map = NULL;
   298		*num_maps = 0;
   299	
   300		for_each_child_of_node(np, child_np) {
   301			ret = adsp_pinctrl_dt_subnode_to_map(pctldev, child_np, map,
   302						&reserved_maps, num_maps);
   303			if (ret < 0)
   304				goto exit;
   305		}
   306		return 0;
   307	
   308	exit:
   309		pinctrl_utils_free_map(pctldev, *map, *num_maps);
   310		return ret;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
