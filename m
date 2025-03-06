Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DB020B1E3;
	Thu,  6 Mar 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262521; cv=none; b=gIvbKF1j9sI5kY/vOYaGa8e7szjiBNnKzul6vuEUk98MPeUhYocKFZWKHR8agwUvmUXaOcCxJZI9ApMboeXrM5+TExjx0m3N0XVuTj70mXdMOvrGYRIO1rqxWzLaAi9ZDVYtjsHltYS2djceGkR5cJjMxwn7CI4UqzCShOWZxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262521; c=relaxed/simple;
	bh=6A3cTKo7KUUfKHZVFVrWahz6zcmZpbwBwIgYHz5M58k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7Gemf74Q0Gqc3oWp3w8ZKGhP5gjocRcjoo+88Vba+yQeSUlzWw2YZims0eKo/0r8wNpB7sj9tIgnNceR1srp/O2QccDdQjIsuRYhVSgXUWFBpig0KrCuzUkA9eDBANQ+S3vNvdEdaLuxOpZRrilwmvHorra1ub6QssRv9jqxVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joMNT/6t; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joMNT/6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741262520; x=1772798520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6A3cTKo7KUUfKHZVFVrWahz6zcmZpbwBwIgYHz5M58k=;
  b=joMNT/6tT7fJ06J2T5ATVI30e3Rl/i7bCo+4B/x5uGwuIf7gn9Ylztp7
   2CFOLh4yaFYwEbo/l6Wmr7QgmX9Ge2bjGvORHxEshiZ2pgmHtuAsfaj5Y
   89Wg1W8I+QgSAvkq2STAuigMUhceQ46Pw25aGINw/YjeO7pf1xVUBPbLs
   /2lup/DtcwC4isS3us+tdo/XYrE0vQKdgt3ylNclUqw8J8GIYXiqMwLnP
   59fNi684hjdcZxTHUOY9G3q0J8FEcq5ebCNV8fU0KVctQy9Cs9+aY5ll9
   W4ZR+X9BgjoObcEg3NAhJN84LatN4ZekGH4UQJPMjA70BO4I57gdQl3xC
   w==;
X-CSE-ConnectionGUID: g16JnKFTTPuq12dhMoqhsA==
X-CSE-MsgGUID: 1ZpRzmw/RaODIzZAnZaEow==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46037147"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46037147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:01:59 -0800
X-CSE-ConnectionGUID: yABDaJhISi6yvIheQYBCDw==
X-CSE-MsgGUID: B1WXS+kLSvG1e+W49kQgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="149785313"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Mar 2025 04:01:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq9vH-000N1M-1N;
	Thu, 06 Mar 2025 12:01:55 +0000
Date: Thu, 6 Mar 2025 20:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <202503061951.9eCEo3hd-lkp@intel.com>
References: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>

Hi Melody,

kernel test robot noticed the following build errors:

[auto build test ERROR on 20d5c66e1810e6e8805ec0d01373afb2dba9f51a]

url:    https://github.com/intel-lab-lkp/linux/commits/Melody-Olvera/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-phy-Add-SM8750-to-QMP-PHY/20250305-060056
base:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
patch link:    https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-6-a698a2e68e06%40quicinc.com
patch subject: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503061951.9eCEo3hd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061951.9eCEo3hd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061951.9eCEo3hd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:180:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     180 |                                      FIELD_PREP(FSEL, data->fsel));
         |                                      ^
   1 error generated.


vim +/FIELD_PREP +180 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c

   147	
   148	static int m31eusb2_phy_init(struct phy *uphy)
   149	{
   150		struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
   151		const struct m31_eusb2_priv_data *data = phy->data;
   152		int ret;
   153	
   154		ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
   155		if (ret) {
   156			dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
   157			return ret;
   158		}
   159	
   160		ret = phy_init(phy->repeater);
   161		if (ret) {
   162			dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
   163			goto disable_vreg;
   164		}
   165	
   166		ret = clk_prepare_enable(phy->clk);
   167		if (ret) {
   168			dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
   169			goto disable_repeater;
   170		}
   171	
   172		/* Perform phy reset */
   173		reset_control_assert(phy->reset);
   174		udelay(5);
   175		reset_control_deassert(phy->reset);
   176	
   177		m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
   178		msm_m31_eusb2_write_readback(phy->base,
   179					     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
 > 180					     FIELD_PREP(FSEL, data->fsel));
   181		m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
   182		m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
   183	
   184		return 0;
   185	
   186	disable_repeater:
   187		phy_exit(phy->repeater);
   188	disable_vreg:
   189		regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
   190	
   191		return 0;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
