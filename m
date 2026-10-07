Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B506399348;
	Wed,  7 Oct 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370850; cv=none; b=ZGhyL/7H1yo8DbhXuIxdpgZyMhVtWZivMD7ku5fLsIZcQlOSv/wTFNpGLtRShWb0lk40JoRyFwx/2O90d4JXVYS28vChgnZM2E6U+ZaDsl1I3SIme+PDYzP67oDkQlZJoKRPp59NXsGrH4S4eJzWwOU9acZz1WHaKWJ3yZ0ODiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370850; c=relaxed/simple;
	bh=b9Y5JMuxHoZJDF9zlmTBWx0Lew2o5MI7bC+/DAQ4foI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiiBit2Q+KzcB3xa+rgNDj66n+1ZbXSLx90RNUx3/v8p49+SBi2/WC3JD+uvTyxIo7sWY0pmNCWN+iB35Zh926eJrWRFOv0PCCjLaGlCweqSZsKMaxbUp2ZtIFI39auXAvP6kuvebERrIMYCj8k33zR6kI3m01oNOgvYVTFi57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jn98vnXb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jn98vnXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791370823; x=1822906823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9Y5JMuxHoZJDF9zlmTBWx0Lew2o5MI7bC+/DAQ4foI=;
  b=jn98vnXbn22wvnF2AmIyAAJKr0BmyAiBmHUoPe+olLAfjD7mlF9B28PK
   LjDsn+ws+bV8t3hRziBfNmoieWm3mjMQTl3B5KaaKyv/LgVmmeR1u/Am4
   gRj04z+/hMaEYtjFwAH9omq4oNsMcV0uvXUzv03LflM8RgfcAbwj+EKLR
   KkNr/oOZQ9YUnk+z2xrl83TLCHP0mzysh3hyjAePF4rid9J29B4YV3rP7
   nWspn+bh5A9+zx+jSurRCcbhqTcgba8o+EVRxmV3KLTqFHtMEvf3ks9bq
   x64+VwBnH463Ur/hPc3sgPzHPS4/26UTQzztf9FwggWPEUHdikqjiKJvC
   Q==;
X-CSE-ConnectionGUID: fISJtadmRkS0dvsiIdmn2w==
X-CSE-MsgGUID: 8OlvpOEHQ4uSzwR4MQVG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="11090"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="11090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 04:00:22 -0700
X-CSE-ConnectionGUID: zfD3bn2aRtSIQZEIveqeCg==
X-CSE-MsgGUID: hQVYRKRkSHSSfBEtUVHKTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285349533"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2026 04:00:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEPNe-000000002sW-2UtY;
	Wed, 07 Oct 2026 11:00:14 +0000
Date: Wed, 7 Oct 2026 19:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Manu Gautam <mgautam@codeaurora.org>,
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <pza@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <202610071844.6m37sk3H-lkp@intel.com>
References: <20261006-phy-v5-6-cbe9330a6449@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-phy-v5-6-cbe9330a6449@oss.qualcomm.com>

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 15551282e82db772bfc862f96a8abf14a60f4ea5]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/dt-bindings-phy-qcom-qmp-usb-Add-IPQ9650-USB3-PHY/20261006-105915
base:   15551282e82db772bfc862f96a8abf14a60f4ea5
patch link:    https://lore.kernel.org/r/20261006-phy-v5-6-cbe9330a6449%40oss.qualcomm.com
patch subject: [PATCH v5 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
config: x86_64-buildonly-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610071844.6m37sk3H-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071844.6m37sk3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071844.6m37sk3H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
         |                                                            ^
   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
      39 | #define FSEL_24MHZ                              FIELD_PREP_CONST(FSEL_MASK, 2)
         |                                                 ^
>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: initializer element is not a compile-time constant
     449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
         |                                                            ^~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
      39 | #define FSEL_24MHZ                              FIELD_PREP_CONST(FSEL_MASK, 2)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/FIELD_PREP_CONST +449 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c

   444	
   445	static const struct phy_reg_config hs_6nm_phy_pre_tuning[] = {
   446		{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
   447		{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
   448		{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
 > 449		{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
   450		{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
   451		{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
   452		{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
   453		{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
   454	};
   455	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
