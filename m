Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB51C07ED;
	Thu, 23 Jan 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621989; cv=none; b=f7YMny9ncDWmDofsgWQ+abuNRLg0jc3vMaeQSz/6qc0yeMlySkojJhDTPtnC1ZkCcNID6AcWbOoiopK99iDcFboYdF2UA4O5rZ0MvQa2NrZ3wLRxt4TtspDEXfkHE7RtzpuatTXn/1XZ0i05nlqYiAAZsqHJr64wf5vZStf4uIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621989; c=relaxed/simple;
	bh=8mE2zglnZVlKcFppUtEPanT9kJQchQtFlle5ljj4PnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avFtYN8nhnEty38dyeEcS0/IPdHOEScxhJOInvKmPdtvJCXCgGz077HpJYvr0t0kUpgcKPWEjKFRcsCjz9DyOx1+slfBkeHVAGVZ3oEFwYqIPGNKbxqB10R1oTUDTJXdXdYd+kS5k5qux4GXjynTZuFpMeu8TPjsd2gZlil1w54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQV+UZBK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQV+UZBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737621988; x=1769157988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8mE2zglnZVlKcFppUtEPanT9kJQchQtFlle5ljj4PnY=;
  b=DQV+UZBKSvL+xbAKk/Xb6h7Wc9AE5PazPU6c8p7tP3tNgVVimPD52CeL
   uX2XrxdUcybZN2AlW2lDkMs8nClOkzH1cwiKcZILh7/eI5jJqBk+vtY95
   0POzl4DPAJkQDHwFqW4VoeytmQkpgJtBGWK6y8NvL1XHfy4LnfJHf47sg
   JVhDF88AX1j4Bq6eJyPzcftV90jGFSQKZaFZzcXsavKT3jti2ihSOa5IM
   lJdJrzcmoG1R+nvOTCnjR0dRmH+A7/uayOtpScLuLPTFG06lrBVt+C+xT
   7eYsFXBQ4WpcSmnPVQdMen+CJpJZUiuSuEcPgNMBL+uO1XtoLvpBTjI6R
   w==;
X-CSE-ConnectionGUID: u/RK3BDjQ3mrtpx065n9iA==
X-CSE-MsgGUID: EH22oMKUS4KpxUSVIPX5fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40935300"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="40935300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:46:27 -0800
X-CSE-ConnectionGUID: njJwaVUlTH6IVJlOWDdSXA==
X-CSE-MsgGUID: RE6CU6+pQjOqA6Cpa4c8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="108000488"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jan 2025 00:46:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasr2-000ax9-1h;
	Thu, 23 Jan 2025 08:46:24 +0000
Date: Thu, 23 Jan 2025 16:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v2 5/6] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <202501231640.3bytq5PW-lkp@intel.com>
References: <20250122174252.82730-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-6-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-common-Make-BaseT-a-4-lanes-mode/20250123-014546
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250122174252.82730-6-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next RFC v2 5/6] net: phy: dp83822: Add support for phy_port representation
config: arm64-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231640.3bytq5PW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231640.3bytq5PW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231640.3bytq5PW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/dp83822.c:893:29: error: use of undeclared identifier 'dev'
     893 |                                 device_property_present(dev, "ti,link-loss-low");
         |                                                         ^
   drivers/net/phy/dp83822.c:896:29: error: use of undeclared identifier 'dev'
     896 |                                 device_property_present(dev, "ti,fiber-mode");
         |                                                         ^
   2 errors generated.


vim +/dev +893 drivers/net/phy/dp83822.c

   875	
   876	static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
   877	{
   878		struct dp83822_private *dp83822 = phydev->priv;
   879		int ret;
   880	
   881		if (port->mediums) {
   882			if (phy_port_is_fiber(port) ||
   883			    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
   884				dp83822->fx_enabled = true;
   885		} else {
   886			ret = dp83822_read_straps(phydev);
   887			if (ret)
   888				return ret;
   889	
   890	#ifdef CONFIG_OF_MDIO
   891			if (dp83822->fx_enabled && dp83822->fx_sd_enable)
   892				dp83822->fx_signal_det_low =
 > 893					device_property_present(dev, "ti,link-loss-low");
   894			if (!dp83822->fx_enabled)
   895				dp83822->fx_enabled =
   896					device_property_present(dev, "ti,fiber-mode");
   897	#endif
   898	
   899			if (dp83822->fx_enabled) {
   900				port->lanes = 1;
   901				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
   902						BIT(ETHTOOL_LINK_MEDIUM_BASEX);
   903			} else {
   904				/* This PHY can only to 100BaseTX max, so on 2 lanes */
   905				port->lanes = 2;
   906				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
   907			}
   908		}
   909	
   910		return 0;
   911	}
   912	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
