Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070562;
	b=WjzzPCaXkQycxZFm7Fc3rUoAT2r4BCQv4QiyNcFeMtT1Ee/WsiPSLZCBbUiu3vNmrxEr
	 qm3nmWZaSlolUQltyQDi5wOJVYnw5koxjSfJjAIt1u3jTsVSmuFLFrNl2ciWB5IpRSdQV
	 UPYOH3CIfTVPOTJPuORTNhNiyQ6rK8hCrtuigQDziKF0H4WKVIKSsVTtEfMDRB92HBN9a
	 cpqe+t8sFoV/8D4AvEG9Sx1cujz7kT2PMhanZVDCbmuqbGRZ4GBZfJ9yUwMt6NbKKVYms
	 KhNFK1ul684aM5FuX1BraUo1GOXLmkNsfg3NPnZEIfH9/xpqjOPpwzqWIxRiQdhbC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070562;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ra0jJFg2rLBnpyjZI3vp/qEopGKNTn3oOysk8aqDYh4=;
	b=iya8QKw/k7z94IEooU2WqthfJsOKppDE3UFCcab7rKBfnAp2eZD3MCUwP8BclWgVuCBr
	 vH6y4q/tD6RgvgFTAwZ9SbWA/yJyR0YvFNou5cEPQxvCmxCDaSxwvZ30+kd0u+cEYEivs
	 FqL0CJu4NCPlcCG5hp/YbRl1cxZv7EaJldRrIfr0UIGQVyqYoFTbxzMbwmnFUmdP0ZaN9
	 IaKkV+zrZLmUxUUDWXe9AXzRbj9IiqYJAkCTp97ZhEcxXSHyqQNI7pMYfMWRTFvwbUQGV
	 VyCmTl78c2VtLgHHFEq4CA19oPzTPICicRIiLYhGgWrU/jSSTfI9VRUQxTKKqmk5QOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ay68REvo;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C5606A325;
	Thu, 19 Nov 2026 06:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6C5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ay68REvo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795070561; x=1826606561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZQY2lgHCzyGRl8yFvLsb5a4GHsBXWlwP2RwNQ4NyDoE=;
  b=Ay68REvoORPnEG+EZq+Cl705ioPV1LBRBN8zb7Yz1hKIw2IFA7cbiSfW
   PBGkauIao3uNr9wLlgNwTIzJXtIW1HjYRxg8JoLR8y/kghVCCOxEM9K85
   UZOSLuUAX0eTVikzcwKnh/xZCmPqWYQOMbM5LwYAE86wa1q3+NLokbw+9
   hKBaV2ImizBQElOQc3RCDjs3C8q5bsvMTz+6o3jAetidSwKXu2dfzd+KZ
   Oud88UaPD+d5fyVjjJmCHoip2fBwQGUryHV3wwES7SPV2doDI8tb1hALd
   vRcaCu9mrHD4Kg51LZtYC8Sn9Vh8LlLJbbAFN74fbQTtVLcU2cbiwQ4F2
   A==;
X-CSE-ConnectionGUID: 5H6IdqMcRDyrfzRG+AHvBQ==
X-CSE-MsgGUID: 29KHBSnMRvaCBP6pl+hpYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3827578"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3827578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 22:42:41 -0800
X-CSE-ConnectionGUID: LMBOrTQoT4yzVyo1QKAIuw==
X-CSE-MsgGUID: qzqpxI7xSGucEDwR5TaBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10689664"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 22:42:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTvqr-00000001FDC-47nC;
	Thu, 19 Nov 2026 06:42:33 +0000
Date: Thu, 19 Nov 2026 14:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Frank.sae" <frank.sae@motor-comm.com>, andrew@lunn.ch,
	hkallweit1@gmail.com, linux@armlinux.org.uk, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net,
	netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lingyu.zou@motor-comm.com, xiaoyong.li@motor-comm.com,
	jie.han@motor-comm.com
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY
 support
Message-ID: <202611191438.hJl6vCfi-lkp@intel.com>
References: <20261118033539.36633-1-frank.sae@motor-comm.com>
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
In-Reply-To: <20261118033539.36633-1-frank.sae@motor-comm.com>

Hi Frank.sae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-sae/net-phy-motorcomm-add-YT8831-2-5G-PHY-support/20261118-033539
base:   net-next/main
patch link:    https://lore.kernel.org/r/20261118033539.36633-1-frank.sae%40motor-comm.com
patch subject: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261119/202611191438.hJl6vCfi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191438.hJl6vCfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191438.hJl6vCfi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/motorcomm.c:2782:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2782 |         if (old_page < 0) {
         |             ^~~~~~~~~~~~
   drivers/net/phy/motorcomm.c:2802:44: note: uninitialized use occurs here
    2802 |         return phy_restore_page(phydev, old_page, ret);
         |                                                   ^~~
   drivers/net/phy/motorcomm.c:2782:2: note: remove the 'if' if its condition is always false
    2782 |         if (old_page < 0) {
         |         ^~~~~~~~~~~~~~~~~~~
    2783 |                 phydev_err(phydev, "Failed to select page: %d\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2784 |                                 old_page);
         |                                 ~~~~~~~~~~
    2785 |                 goto err_restore_page;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
    2786 |         }
         |         ~
   drivers/net/phy/motorcomm.c:2779:19: note: initialize the variable 'ret' to silence this warning
    2779 |         int old_page, ret;
         |                          ^
         |                           = 0
   1 warning generated.


vim +2782 drivers/net/phy/motorcomm.c

  2770	
  2771	/**
  2772	 * yt8831_serdes_init() - serdes init
  2773	 * @phydev: a pointer to a &struct phy_device
  2774	 *
  2775	 * Returns: 0 or negative errno code
  2776	 */
  2777	static int yt8831_serdes_init(struct phy_device *phydev)
  2778	{
  2779		int old_page, ret;
  2780	
  2781		old_page = phy_select_page(phydev, YT8831_RSSR_FIBER_SPACE);
> 2782		if (old_page < 0) {
  2783			phydev_err(phydev, "Failed to select page: %d\n",
  2784					old_page);
  2785			goto err_restore_page;
  2786		}
  2787	
  2788		ret = ytphy_write_ext(phydev, YT8831_SDS_WRITE_PROTECT_REG, 0x1);
  2789		if (ret < 0)
  2790			goto err_restore_page;
  2791	
  2792		ret = ytphy_write_ext(phydev, YT8831_SDS_SGMII_OUTPUT_REG, 0xc4);
  2793		if (ret < 0)
  2794			goto err_restore_page;
  2795	
  2796		/* softreset sds space */
  2797		ret = __phy_modify(phydev, MII_BMCR, BMCR_RESET, BMCR_RESET);
  2798		if (ret < 0)
  2799			goto err_restore_page;
  2800	
  2801	err_restore_page:
  2802		return phy_restore_page(phydev, old_page, ret);
  2803	}
  2804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
