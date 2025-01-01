Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27D2745E;
	Wed,  1 Jan 2025 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735722208; cv=none; b=HSHk+ntfpNfjYLVEzThs2eT2ayMoXg/2TBcDx/wIBHWM/fCy3rCfcoNSaSIN1/8bNRp+BD+9m8smdIhlbI9OOASIcukbTw4epsdzRiE6hDOksWx0wr4Bm609b5sTRaT2zTCs4apFEayGJw8sMIu2fnE7fIl7tWH5O/P0a7N5RBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735722208; c=relaxed/simple;
	bh=Nz9aDcQrTUetxC6iaoCKUJgnBxM+z4ES6m8B+iYezLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH6uR3hFIbPH6XeZxABkWEP+ewvInyS7QpzGhFterJsWydASx5lp2cWRCdvC9rZ+xSGNBKDwE+mDfhlKC1oeG8p36OJMBmQpM7kCmmLBnsselk69mz0UVnSTlgrUi2bANjymhxNTyiYedUi5dH7ANoTWGecaR0DmQtymf5xxtxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qrlvvtrm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qrlvvtrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735722207; x=1767258207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nz9aDcQrTUetxC6iaoCKUJgnBxM+z4ES6m8B+iYezLY=;
  b=Qrlvvtrmtis8PKNbjBAjP410cL2Dl9Lm7pYvXr6hD1oNWczerziCxgSZ
   HRCkAbVVzdiZcWk7DtgHWC/EtTdXsHOs+dT+1HmvWiGlvsRBARmPqJw0u
   o+hv6RbvzCV9R+Rh8Xt7Qo7lVq+oOHrul7MFDoNZx0o4F2cNF7xmYhYLd
   O2kKSPkQYCq2FgIoUPHijBkjnWrF1kcWQhfT8HfEuwQr68e61QLN1abLo
   cX8N9U7DebiZtEFYxAvgNQHngeOFCFgKC8+9o3TqdA6TemF1eRLY8tv9E
   hn8FRWU2V+eoOBj2gf8Ov+bfZd1NtrhM+B5yoIJT4xdiJpYfvr4JKlnz3
   Q==;
X-CSE-ConnectionGUID: GuhKd4unSZO+SJss+y6N4Q==
X-CSE-MsgGUID: eaWLQK4QRm2eT/6uxmJRZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46972195"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46972195"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 01:03:26 -0800
X-CSE-ConnectionGUID: XuUNBDnHRJ6foHwmfMM9/A==
X-CSE-MsgGUID: IBcWmbpJQUmPS6sZZkwOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101051676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2025 01:03:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSudM-0007jb-19;
	Wed, 01 Jan 2025 09:03:20 +0000
Date: Wed, 1 Jan 2025 17:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
Message-ID: <202501011623.EZwn2GFV-lkp@intel.com>
References: <20241231060047.2298871-5-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-5-jian.hu@amlogic.com>

Hi Jian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20241231-141835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241231060047.2298871-5-jian.hu%40amlogic.com
patch subject: [PATCH 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501011623.EZwn2GFV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011623.EZwn2GFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011623.EZwn2GFV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module t7-pll uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_pll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_pcie_pll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_mpll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
