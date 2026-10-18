Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAA1A6834;
	Sun, 18 Oct 2026 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284458; cv=none; b=tvmW3rJSFtMY+s9zYNu/3lXHISyhXMiEbpIZ2NbBBnZ1tA7CWYx+wV54WNcrlAYs/xs9S9uLB1gJdDb/rJRqrMLEg3Jj3u6t6Dyc6ldpsqqnghxpNKZol2DffJMQeFjIOKROqjbgA7SuIhVsy6jPSrS83Ar2kpyhJaeTAuJ7cd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284458; c=relaxed/simple;
	bh=daoOQm05VwaFoZ0+CpbIgWX8Bo/e4Sr3//Gl6DlQae0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xn7byifXST2JY/sOm7SJXB/qFKTMarno21G3rA0pEHf9PvpGfHOAkDbVfoq3kCIkkDAclzz7/lwQ/DWjDA5l8PY3dBxLuGcGF3JDhq6JT19Z1zw/qTyTrRqbz6GaRChJEW1P8W/MlTFsAY10BiZrLttM7hDWVnhRmfHeV9kAXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMMutEn0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMMutEn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792284455; x=1823820455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=daoOQm05VwaFoZ0+CpbIgWX8Bo/e4Sr3//Gl6DlQae0=;
  b=HMMutEn0dC2+LmzXZUxOYKQB+mHXexiDt0HdofvNuL3s/TL3IseUU5q8
   eDXnfPBfaUFJaHTwTSdtMVc4V0pF3Y0zb2BRCbgRsV4uw37PiYqtj/S9n
   vKaJ7QFKHetiGUQTva7BnTCKNSCivJ3zQL0tZqwzF2TopZ1q3WqMVQs5L
   aW/+La8FpP1aLPIDUV9y1k9Wg4PU5hPx2092ezwQgzvrUCg/GQKll9vuK
   UKiS1J/RkbPlVNGJ6dtbYS++hBagbG3eYQNbN+HQ9ZzPp0Rp0z/rVFNcG
   WzU7RSzzcg2sFvcE3QWcwouQnyLCEIGNWTMaxrXoVYkV4fAInEYNDM5c4
   A==;
X-CSE-ConnectionGUID: nl8mSEraTCSWS87P95dJ4w==
X-CSE-MsgGUID: 0HfpZ5kJQTGm566wlP3zmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1049614"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1049614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 17:47:35 -0700
X-CSE-ConnectionGUID: 7QNb9IvsTCmVMcmTPGQv7w==
X-CSE-MsgGUID: IT3zV5cIQzKxka3VbTtNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2646600"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2026 17:47:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIF3h-00000000Juw-19NP;
	Sun, 18 Oct 2026 00:47:29 +0000
Date: Sun, 18 Oct 2026 08:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
Message-ID: <202610180841.U0qsol4i-lkp@intel.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/phy-rockchip-usbdp-Track-PHY-power-state/20261016-204317
base:   8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
patch link:    https://lore.kernel.org/r/20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f%40collabora.com
patch subject: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
config: hexagon-randconfig-1000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610180841.U0qsol4i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180841.U0qsol4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180841.U0qsol4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 struct member 'dwc_rk' not described in 'dwc3_rk_phy_nb'
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 Excess struct member 'dwc' description in 'dwc3_rk_phy_nb' (did you mean one of: 'dwc_rk')
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 struct member 'dwc_rk' not described in 'dwc3_rk_phy_nb'
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 Excess struct member 'dwc' description in 'dwc3_rk_phy_nb' (did you mean one of: 'dwc_rk')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
