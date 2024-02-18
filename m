Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950A1EA6E;
	Sun, 18 Feb 2024 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708299367; cv=none; b=sTUoa5QKbuH2otGQoXd7Mvwj2Ugl0Vs5YcHbN+t8p0DgO/Ml6ThE43bza8wnMaUK/qrljiaP2lB8YhnOaRihIeuNbWxHEghbRT2o8817xJeLD6dcv+zDs6SCs3byOaBYZV17/rDXRVBWA0fzeI2HKiSEXtCKZNr/85GKrO0XsP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708299367; c=relaxed/simple;
	bh=A02NHIZZRrEdmVvo0Ng5dU4sFW+tn4D4b9vC6BC4OLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhWmzqTvhzRu6hAhZa+VNT57Cd1aWd+tZ+Xy/AO7IDZZ9kNFV9FEg+myA7BzGDbm8q3AKiE8VSnUy9i9HLgs7D2o9NjFpeFh1v18S8K1RudAqpfidcyuyY4NoATb2p+VToUmf5ZgcOisUjp3wyZbXvfdI0JXhiAsR4jEh4TnVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYEUp3Oj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYEUp3Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708299363; x=1739835363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A02NHIZZRrEdmVvo0Ng5dU4sFW+tn4D4b9vC6BC4OLU=;
  b=GYEUp3OjnN7RHpCflR2fwhAY5ZZzPr8rf/W+Na2ykQA1zc9tWZzxALKn
   MdiLV7tCZvSa48dRSXPXgeyX6tdlJnaqWDIwTkL9gGW2ZWEnmDNosmk8V
   vtrCm7j24Hn4yGM9gJ7bSXqwnC4knQFGB9kg0mcxEQpjQ2Tf/LbFCghM9
   /ibnI4fPB8Us1a/xr80SgkGUqMjBJYzl4dsDwS2mfl5ryUalZQ2JQk71j
   fAYSVOC/kw3tL1eiFu0+MOljPgJFDVqo7nxygtQKSbkx/b1uqnFNclHKj
   4/4c2S38cDOl6Ez5JDXKkq5j7I3reEqyt3AzqaCxiPL7k8XSCki+4EU9i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13475567"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="13475567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 15:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="8928713"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2024 15:36:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbqhT-0003Mb-1t;
	Sun, 18 Feb 2024 23:35:59 +0000
Date: Mon, 19 Feb 2024 07:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 1/3] net: phy: detach PHY driver OPs from
 phy_driver struct
Message-ID: <202402190743.SaQuB7x7-lkp@intel.com>
References: <20240217194116.8565-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217194116.8565-2-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-detach-PHY-driver-OPs-from-phy_driver-struct/20240218-034406
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240217194116.8565-2-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 1/3] net: phy: detach PHY driver OPs from phy_driver struct
config: i386-buildonly-randconfig-003-20240219 (https://download.01.org/0day-ci/archive/20240219/202402190743.SaQuB7x7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190743.SaQuB7x7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190743.SaQuB7x7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ethtool/linkstate.c:38:36: error: no member named 'get_sqi' in 'struct phy_driver'
      38 |         if (!phydev->drv || !phydev->drv->get_sqi)
         |                              ~~~~~~~~~~~  ^
   net/ethtool/linkstate.c:41:22: error: no member named 'get_sqi' in 'struct phy_driver'
      41 |                 ret = phydev->drv->get_sqi(phydev);
         |                       ~~~~~~~~~~~  ^
>> net/ethtool/linkstate.c:56:36: error: no member named 'get_sqi_max' in 'struct phy_driver'
      56 |         if (!phydev->drv || !phydev->drv->get_sqi_max)
         |                              ~~~~~~~~~~~  ^
   net/ethtool/linkstate.c:59:22: error: no member named 'get_sqi_max' in 'struct phy_driver'
      59 |                 ret = phydev->drv->get_sqi_max(phydev);
         |                       ~~~~~~~~~~~  ^
   4 errors generated.
--
>> net/ethtool/ioctl.c:2481:44: error: no member named 'module_info' in 'struct phy_driver'
    2481 |         if (phydev && phydev->drv && phydev->drv->module_info)
         |                                      ~~~~~~~~~~~  ^
   net/ethtool/ioctl.c:2482:23: error: no member named 'module_info' in 'struct phy_driver'
    2482 |                 return phydev->drv->module_info(phydev, modinfo);
         |                        ~~~~~~~~~~~  ^
>> net/ethtool/ioctl.c:2518:44: error: no member named 'module_eeprom' in 'struct phy_driver'
    2518 |         if (phydev && phydev->drv && phydev->drv->module_eeprom)
         |                                      ~~~~~~~~~~~  ^
   net/ethtool/ioctl.c:2519:23: error: no member named 'module_eeprom' in 'struct phy_driver'
    2519 |                 return phydev->drv->module_eeprom(phydev, ee, data);
         |                        ~~~~~~~~~~~  ^
>> net/ethtool/ioctl.c:2762:58: error: no member named 'get_tunable' in 'struct phy_driver'
    2762 |         phy_drv_tunable = phydev && phydev->drv && phydev->drv->get_tunable;
         |                                                    ~~~~~~~~~~~  ^
   net/ethtool/ioctl.c:2775:22: error: no member named 'get_tunable' in 'struct phy_driver'
    2775 |                 ret = phydev->drv->get_tunable(phydev, &tuna, data);
         |                       ~~~~~~~~~~~  ^
   net/ethtool/ioctl.c:2801:58: error: no member named 'get_tunable' in 'struct phy_driver'
    2801 |         phy_drv_tunable = phydev && phydev->drv && phydev->drv->get_tunable;
         |                                                    ~~~~~~~~~~~  ^
>> net/ethtool/ioctl.c:2815:22: error: no member named 'set_tunable' in 'struct phy_driver'
    2815 |                 ret = phydev->drv->set_tunable(phydev, &tuna, data);
         |                       ~~~~~~~~~~~  ^
   8 errors generated.


vim +38 net/ethtool/linkstate.c

3d2b847fb99cf2 Michal Kubecek 2019-12-27  28  
8066021915924f Oleksij Rempel 2020-05-20  29  static int linkstate_get_sqi(struct net_device *dev)
8066021915924f Oleksij Rempel 2020-05-20  30  {
8066021915924f Oleksij Rempel 2020-05-20  31  	struct phy_device *phydev = dev->phydev;
8066021915924f Oleksij Rempel 2020-05-20  32  	int ret;
8066021915924f Oleksij Rempel 2020-05-20  33  
8066021915924f Oleksij Rempel 2020-05-20  34  	if (!phydev)
8066021915924f Oleksij Rempel 2020-05-20  35  		return -EOPNOTSUPP;
8066021915924f Oleksij Rempel 2020-05-20  36  
8066021915924f Oleksij Rempel 2020-05-20  37  	mutex_lock(&phydev->lock);
8066021915924f Oleksij Rempel 2020-05-20 @38  	if (!phydev->drv || !phydev->drv->get_sqi)
8066021915924f Oleksij Rempel 2020-05-20  39  		ret = -EOPNOTSUPP;
8066021915924f Oleksij Rempel 2020-05-20  40  	else
8066021915924f Oleksij Rempel 2020-05-20  41  		ret = phydev->drv->get_sqi(phydev);
8066021915924f Oleksij Rempel 2020-05-20  42  	mutex_unlock(&phydev->lock);
8066021915924f Oleksij Rempel 2020-05-20  43  
8066021915924f Oleksij Rempel 2020-05-20  44  	return ret;
8066021915924f Oleksij Rempel 2020-05-20  45  }
8066021915924f Oleksij Rempel 2020-05-20  46  
8066021915924f Oleksij Rempel 2020-05-20  47  static int linkstate_get_sqi_max(struct net_device *dev)
8066021915924f Oleksij Rempel 2020-05-20  48  {
8066021915924f Oleksij Rempel 2020-05-20  49  	struct phy_device *phydev = dev->phydev;
8066021915924f Oleksij Rempel 2020-05-20  50  	int ret;
8066021915924f Oleksij Rempel 2020-05-20  51  
8066021915924f Oleksij Rempel 2020-05-20  52  	if (!phydev)
8066021915924f Oleksij Rempel 2020-05-20  53  		return -EOPNOTSUPP;
8066021915924f Oleksij Rempel 2020-05-20  54  
8066021915924f Oleksij Rempel 2020-05-20  55  	mutex_lock(&phydev->lock);
8066021915924f Oleksij Rempel 2020-05-20 @56  	if (!phydev->drv || !phydev->drv->get_sqi_max)
8066021915924f Oleksij Rempel 2020-05-20  57  		ret = -EOPNOTSUPP;
8066021915924f Oleksij Rempel 2020-05-20  58  	else
8066021915924f Oleksij Rempel 2020-05-20  59  		ret = phydev->drv->get_sqi_max(phydev);
8066021915924f Oleksij Rempel 2020-05-20  60  	mutex_unlock(&phydev->lock);
8066021915924f Oleksij Rempel 2020-05-20  61  
8066021915924f Oleksij Rempel 2020-05-20  62  	return ret;
ecc31c60240b98 Amit Cohen     2020-06-29  63  };
ecc31c60240b98 Amit Cohen     2020-06-29  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
