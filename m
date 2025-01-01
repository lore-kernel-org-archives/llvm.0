Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F6383A5;
	Wed,  1 Jan 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735751403; cv=none; b=pVjYGsP9gFcUCFb6rQMIrn4WMBaHnHiTIHiZN3gZtuVIApVV92pn99DYsVupFbXn9eaTczNAAsSr/Jc2WMzJGwpz7YKjbUJt8ZX/60dsjUObDZrFTSyOqdx5vga5xBAk7z0m+sm0SfX5ClLdoZW+VgLnZ7nVSxt4CGU0RQsOdI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735751403; c=relaxed/simple;
	bh=w4806pHttcq14fcDsE1TCQs1bNJyXM6xixxGIsaUg00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAfJT0LzDYw6unx5XsBabNKuN8L9ZnIrBsoa4kZKmH53qQpdxSsXRsSbAe+Alz+xo5+a8ZqpjtBp47gG0mbSBbwp3mcEmFvSBwHnap2y8StXEjIVQPNkUdEdkfs9Xt99rM+wnrr/HTpss2eN+cVAwoUj4vDFjzJR6yIILhp+1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7uSSZqp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7uSSZqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735751400; x=1767287400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w4806pHttcq14fcDsE1TCQs1bNJyXM6xixxGIsaUg00=;
  b=A7uSSZqppzsXcWeLYH1a5krKndi6gOV+J4Tl3Ly1SDIFCi8eHA5/lkFR
   MsP2aJETfrWtfwoM8xMHUlG7ARuBFLX9pGQy2XRANMKFOAKi6F9Us3AvW
   PJaqnxLAFY1qgJsjjt97GhjMLeV2jVDk/JUNLyxuSQhil2Z2IyWCdMYR3
   WMgYUypGQQPGzqbvFCZs4EWN0DEsx7oCoDBkrGGbWPzTd7oiM+qtvIYp0
   KATVzCqyu4psAyshMATVmQP9F5Hgn/VurfLily/qIC0n33NSE6UPsVpiG
   1ZYiJhMBhrIVd9XegvVn7ReSrIkqZmiY39KlFEyWcx/gc4axhgcX5sxuY
   g==;
X-CSE-ConnectionGUID: EFpMyWTJScyMt25zWfiZBA==
X-CSE-MsgGUID: O2FxoXu+RD2rQ6G1bVWdbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38830081"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="38830081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 09:09:59 -0800
X-CSE-ConnectionGUID: skjhXKsiSWyP1f8EVfehDQ==
X-CSE-MsgGUID: 1u7BJ6rmS0+nb2yF7WxL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132237852"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2025 09:09:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT2EC-0007xz-1b;
	Wed, 01 Jan 2025 17:09:52 +0000
Date: Thu, 2 Jan 2025 01:09:14 +0800
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
Subject: Re: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller
 driver
Message-ID: <202501020007.bve7QkV9-lkp@intel.com>
References: <20241231060047.2298871-6-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-6-jian.hu@amlogic.com>

Hi Jian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20241231-141835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241231060047.2298871-6-jian.hu%40amlogic.com
patch subject: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501020007.bve7QkV9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020007.bve7QkV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020007.bve7QkV9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module t7-pll uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_pll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_pcie_pll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_mpll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol meson_clk_dualdiv_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
