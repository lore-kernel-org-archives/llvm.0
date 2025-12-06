Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DB9219A8D;
	Sat,  6 Dec 2025 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764991181; cv=none; b=OLYvh/vYc3Z1fhSvDmzEug7/m5ATgdWeil3cuBFi/IdfmPvW5+Ea5PBUG/FwIauG5qlmsHkmMa0NMdtpiv0uCoQ8wbKw1qvfygDBnwd8lVD9ZLzxO2iCUwVakZdOvOGY2JjpCDa0KyAP10140cGIokK7SsYtofXZ6Z+Iunf373k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764991181; c=relaxed/simple;
	bh=5gH637Pes04sa8dca3MnyEjtJ4p46PyN8XeJW2eyJ/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQhGosp/88+CzVf8wGC0Hx4EmgHpNLPziSebD7S7lhbFlIp5ChtSG7XCgXHBNbtOQK5ywepqPhrOD+Rd6sbgRyx5Z2u1Wjm5XO5NzqFdocTz8/Ucll79b/YwkS0IzgiFCdqOX9ScyuYbQDcPy0EMBOQgc9K8+rQWiLfDuvFqNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnMDbKvd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnMDbKvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764991180; x=1796527180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gH637Pes04sa8dca3MnyEjtJ4p46PyN8XeJW2eyJ/s=;
  b=CnMDbKvdj7xr8AzrQU4FY6goGCK6jt/RItH/KUNAx5koWrcpioy05AJm
   871fAcY9xh1CVp2CfcaN+j0G8+8SMeEy/M10kJiNzEDeImGPUwEqHKS9O
   ySNun+t2COlzhXx/YGVrSKGJdaikuU/0EuI8CghmdQuioUQazXeGNWJJe
   ceOzSzgjGOr4alGXjDv/rqrLBEMNlprqpsfYKhOdr3vwU3kYKCXnWtygC
   V71gtrCfXKsOAsjOOrcsdt10ASqvMy0RNNexUJNTYsBIhoHPPoIywsxU/
   V6PXXduhpZgGPmXRotoE9k5XPcVCfEMqABzlhDXV13nsmkHm1wiA6VdYL
   g==;
X-CSE-ConnectionGUID: QGVhZ4VeQXuFkEYY0ZsBkg==
X-CSE-MsgGUID: 5Ubya6PGTzO4Zgz5BT+2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70877764"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="70877764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 19:19:40 -0800
X-CSE-ConnectionGUID: /FlQIMuHQ6WB1l5Y0IpOnA==
X-CSE-MsgGUID: 1rZPUzLrShiRQVuphcTEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="199929287"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 19:19:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRipZ-00000000Fob-2I6r;
	Sat, 06 Dec 2025 03:19:33 +0000
Date: Sat, 6 Dec 2025 11:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 4/5] clk: meson: t7: add support for the T7 SoC PLL
 clock
Message-ID: <202512061054.wsIzRCCd-lkp@intel.com>
References: <20251204053635.1234150-5-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204053635.1234150-5-jian.hu@amlogic.com>

Hi Jian,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18 next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20251204-135351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251204053635.1234150-5-jian.hu%40amlogic.com
patch subject: [PATCH v6 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
config: arm64-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061054.wsIzRCCd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061054.wsIzRCCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061054.wsIzRCCd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: meson_clk_mpll_ops
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.51) in archive vmlinux.a
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.59) in archive vmlinux.a
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.67) in archive vmlinux.a
   >>> referenced 1 more times
   >>> did you mean: meson_clk_pll_ops
   >>> defined in: vmlinux.a(drivers/clk/meson/clk-pll.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
