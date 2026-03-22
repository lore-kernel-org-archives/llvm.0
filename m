Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368A17B505;
	Sun, 22 Mar 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222423; cv=none; b=k4TqgXBRELTqT4cffJWPvpYLzzFXi+JZkt5uH4K3dys26gckOjyHX3eAHnevEpxKItK0OkhghBtGMKQr4sXxUQ0oNZrD9hMuwmD+NfHsxCapMb3Jva8urLtXr7Bfs/zDRwkRqUrgjsoYoH6QIlREG/4ezfBx/hJIB0RXg9IVlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222423; c=relaxed/simple;
	bh=Iyq/kR8m/ROKeqOrN3lBBgrhZ0QikXX9ty57LXSzHu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7U8WN7YETWs7BcgPHmCVJ71rsJxgmXrSL0dWIpC2jRzfN+M3Z56WOhPf1PxMTMupbgsaRwcz/92loTaHNJ+2tsB7A9ClzVM+JUestOEkjCTY+cqw+cfHDSuU1zGN9iwC3qLyuzK9r7el3KoqgdAv/u2e0uF5M/5OfdUJKbyeN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhvKPZt3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhvKPZt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774222422; x=1805758422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iyq/kR8m/ROKeqOrN3lBBgrhZ0QikXX9ty57LXSzHu0=;
  b=jhvKPZt3TN5WA4MRJ2XBr/+SErkOiNcnBZS8e/cMUxKjmgGFxzMdk4D1
   aG2JlIgS/8uxLoCZVzxFZCOifUYLOqIqnTMCElDl7BrE2pWkIy7K3GwqI
   kYl5aTqqS/1f+rzt1Zp1OeECtZA6w+QXtC48F1sQ1k4x87DVbwxJizinp
   vbXDE4xkeTwfKuhoyDxryOKHEQ7ZppE08Y9E8NOTG/Pll8zTsR5njXXqi
   QsfyoKKFPhDRptP3G+n5Z+Jy/OBXQa14gDxe3cUaFKxW1Kc9//p25D8Kg
   C+QTY9xgn3bB4+Jx/emPj7dLTyg0ULmNFBVfDkQfxuPQWoqDtLuOh7+Pz
   Q==;
X-CSE-ConnectionGUID: l10jBFvXRQqMMQRQVeDalg==
X-CSE-MsgGUID: 81SSGZC6T1SrDQwPejYgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75343992"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75343992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 16:33:41 -0700
X-CSE-ConnectionGUID: L5lU3e1hSneBMqQipXjSAA==
X-CSE-MsgGUID: LXf5SMqNRLiXfBtk9LP7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="261766636"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 16:32:45 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4SHh-0000000007Z-2kCJ;
	Sun, 22 Mar 2026 23:32:41 +0000
Date: Mon, 23 Mar 2026 07:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <202603230713.5uOUC5EI-lkp@intel.com>
References: <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-phy-qcom-Add-CSI2-C-PHY-DPHY-schema/20260316-081353
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-2-90c09203888d%40linaro.org
patch subject: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603230713.5uOUC5EI-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230713.5uOUC5EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230713.5uOUC5EI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:360:13: error: initializer element is not a compile-time constant
           .opp_clk = x1e_clks[2],
                      ^~~~~~~~~~~
   1 error generated.


vim +360 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   347	
   348	const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
   349		.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
   350		.reg_info = {
   351			.init_seq = lane_regs_x1e80100,
   352			.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
   353			.common_regs_offset = 0x1000,
   354			.generation = GEN2,
   355		},
   356		.supply_names = (const char **)x1e_supplies,
   357		.num_supplies = ARRAY_SIZE(x1e_supplies),
   358		.clk_names = (const char **)x1e_clks,
   359		.num_clk = ARRAY_SIZE(x1e_clks),
 > 360		.opp_clk = x1e_clks[2],

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
