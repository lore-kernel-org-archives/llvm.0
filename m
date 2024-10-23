Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A701ABEB0;
	Wed, 23 Oct 2024 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689158; cv=none; b=mXHadLaHPvQWKdLbTetQpwcrus3fbAma4Js/YoGY/H3S7csueTDXjBOjlag1JOiZfVRJKmS8UrvfvDjNuGy4BgrFxb6tZrwtiMnwOVqDGW19KS17F0DSr1wsSJAu4a6xlKfen3L7fjECEtPRYXH2qe/nRlxPxx4mQie6Zoe/Gok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689158; c=relaxed/simple;
	bh=EUwoUyj0Xna4b4RgHXPDoj0mvlZeeavc2EPYj5CaAqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrM03UZiQo3wphNdw9fj3GUInU3eT64FTH1bSxrh9MaPiSIKtcQV9qb3e+fntFVwb0Apv7bv86ax4j3gKvywPdUw7YMxGUnD3y4DXnDq5K5UoPDWQEdHKMKHL7TPPerMgOg226wM/aZHe0qSCTTNSv94MU1JP3d1riFUnbi2T2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIFdT6+R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIFdT6+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729689157; x=1761225157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EUwoUyj0Xna4b4RgHXPDoj0mvlZeeavc2EPYj5CaAqk=;
  b=LIFdT6+RlR7uzZyF2NnGsYWYeDBbzbhQpv0w2G+OJAkpxO6m+t/kfjkp
   18ZW/Snh92j+NkctzGqcCa2CVg+anUa6t29w7sSl0zXYEMGLJoHXK20wD
   skNGcRCAi0ZH/fY1Yy9KJ1miBnmrCHyNGceEfzRb83bxRGfiLo/Y4AFrR
   pV5QM8Bl1s4xVi7hlWMLBXfqKjI+NxXrXon8k1VeHS0vnRs1zf+NvLg8g
   /9NEy3g0ZJooVP/QXspJvY9hqSRvH07JFe5vR0zNUHQLhzXWiTai+2A6r
   NlAYtpZz2a+4KpecE9UJNIOUzSWYOzB1eJyrYWzf+vMaEGx68i8b9dKGc
   g==;
X-CSE-ConnectionGUID: ukSkhpEZRuKZV/QbiXBNWg==
X-CSE-MsgGUID: IES70mpyQ3uyMSQTVyQgSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29211514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29211514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 06:12:36 -0700
X-CSE-ConnectionGUID: sx2qER9RRO+cTF1bSDAT7g==
X-CSE-MsgGUID: oY7btcvBQzSv7fjuGQxS9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84991353"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 06:12:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3bA8-000Ux0-1D;
	Wed, 23 Oct 2024 13:12:32 +0000
Date: Wed, 23 Oct 2024 21:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: phylink: simplify how SFP PHYs are
 attached
Message-ID: <202410232116.IgRFPrAS-lkp@intel.com>
References: <E1t3DSr-000Vxg-Qx@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1t3DSr-000Vxg-Qx@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-add-common-validation-for-sfp_select_interface/20241022-234251
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1t3DSr-000Vxg-Qx%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 3/3] net: phylink: simplify how SFP PHYs are attached
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410232116.IgRFPrAS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232116.IgRFPrAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232116.IgRFPrAS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:3429:6: warning: unused variable 'ret' [-Wunused-variable]
    3429 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +3429 drivers/net/phy/phylink.c

7adb5b2126bc013 Russell King          2019-12-11  3424  
ce0aa27ff3f68ed Russell King          2017-07-25  3425  static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
ce0aa27ff3f68ed Russell King          2017-07-25  3426  {
7e4183752735deb Baruch Siach          2018-10-03  3427  	struct phylink *pl = upstream;
7adb5b2126bc013 Russell King          2019-12-11  3428  	u8 mode;
938d44c2b502ba4 Russell King          2019-12-11 @3429  	int ret;
7e4183752735deb Baruch Siach          2018-10-03  3430  
52c956003a9d5bc Russell King          2019-12-11  3431  	/*
52c956003a9d5bc Russell King          2019-12-11  3432  	 * This is the new way of dealing with flow control for PHYs,
52c956003a9d5bc Russell King          2019-12-11  3433  	 * as described by Timur Tabi in commit 529ed1275263 ("net: phy:
52c956003a9d5bc Russell King          2019-12-11  3434  	 * phy drivers should not set SUPPORTED_[Asym_]Pause") except
52c956003a9d5bc Russell King          2019-12-11  3435  	 * using our validate call to the MAC, we rely upon the MAC
52c956003a9d5bc Russell King          2019-12-11  3436  	 * clearing the bits from both supported and advertising fields.
52c956003a9d5bc Russell King          2019-12-11  3437  	 */
52c956003a9d5bc Russell King          2019-12-11  3438  	phy_support_asym_pause(phy);
52c956003a9d5bc Russell King          2019-12-11  3439  
7adb5b2126bc013 Russell King          2019-12-11  3440  	if (phylink_phy_no_inband(phy))
7adb5b2126bc013 Russell King          2019-12-11  3441  		mode = MLO_AN_PHY;
7adb5b2126bc013 Russell King          2019-12-11  3442  	else
7adb5b2126bc013 Russell King          2019-12-11  3443  		mode = MLO_AN_INBAND;
7adb5b2126bc013 Russell King          2019-12-11  3444  
eca68a3c7d05b38 Marek Behún           2022-09-30  3445  	/* Set the PHY's host supported interfaces */
eca68a3c7d05b38 Marek Behún           2022-09-30  3446  	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
eca68a3c7d05b38 Marek Behún           2022-09-30  3447  			  pl->config->supported_interfaces);
eca68a3c7d05b38 Marek Behún           2022-09-30  3448  
52c956003a9d5bc Russell King          2019-12-11  3449  	/* Do the initial configuration */
e48bc58d0fa1e08 Russell King (Oracle  2024-10-22  3450) 	return phylink_sfp_config_phy(pl, mode, phy);
ce0aa27ff3f68ed Russell King          2017-07-25  3451  }
ce0aa27ff3f68ed Russell King          2017-07-25  3452  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
