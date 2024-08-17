Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3661E511;
	Sat, 17 Aug 2024 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723912549; cv=none; b=HkGciisSWnJEufSybqWViAt7ws4ltgff/VPvLtmQR7dxrSZ5uzlAoEfGJOqPP8lcX2bW4/dSIAnh0OYc6P6p958uywhSicIQot/xILboN22aZgSJi+vIPvYHEr0TI+ywbv6Epxx17Aw+v3VI0u31wAaAUotu1H4h/BPQzAFrf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723912549; c=relaxed/simple;
	bh=Tc8LeqccCQfgkJcaQ2AWG/dEn6zVo0I1D5X2ZhiTemI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrAZ1nNNSyDpt8Q428kUVI/B8az649hO0eyxUzSq03c2l/k0kujzvVSCjSEftnuLYUA0aMjXrpg9pQQL/DDCsHDgSGkinkVazvUld2zSu2HeaWRxbiIu5+wuisky9dFrNben2ezeC6A+VsN9UnkG1FYnOrE5uje1z7kzUAtVzIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEA73//Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEA73//Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723912547; x=1755448547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tc8LeqccCQfgkJcaQ2AWG/dEn6zVo0I1D5X2ZhiTemI=;
  b=EEA73//QoJr3ieAQiwxa1DulJcbnnH1VdEXypYAmeJ6KIY+1jXuRHf05
   mrAfVg07vma0c07iDCzU+uqo5OMwTVWO8w6gjQpE3CGa7g/iBWw3zrqDW
   rphv4RYLESuF1NTXQeEAfVhhSxG5RV0cvyfq6DkhWt+h2WX/nQR/9aqde
   VRFQjqivdMOGhBCnD1N7EvI1+vb2/EJnqOFRzhvUGSMDK93EB21P4Rbvn
   Dc+ELtPaHBz6DNu7mQ8m1q5vK8WDQSHhH9v3rqWMUkMH9t6DUfjEILxbm
   TL2gn/i+aO2OaOvFuEkFv5zd64KatQeD0RtmKh6+oFzJgwsw6LyDaI6OU
   g==;
X-CSE-ConnectionGUID: paMn39bESVWt39ms5VpcaA==
X-CSE-MsgGUID: 7bcm4V/5SCGawqi0lOI0Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22363863"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="22363863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 09:35:46 -0700
X-CSE-ConnectionGUID: Nz/IargfQI+iH/XZCNkYgg==
X-CSE-MsgGUID: YB/DhZSqTdy2fUS3FqFyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59993581"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2024 09:35:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfMP1-0007e8-18;
	Sat, 17 Aug 2024 16:35:43 +0000
Date: Sun, 18 Aug 2024 00:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net] net: phy: fix may not suspend when phy has WoL
Message-ID: <202408180032.wL6gc9ou-lkp@intel.com>
References: <20240815110907.609-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815110907.609-1-guanwentao@uniontech.com>

Hi Wentao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Guan/net-phy-fix-may-not-suspend-when-phy-has-WoL/20240815-191124
base:   net/main
patch link:    https://lore.kernel.org/r/20240815110907.609-1-guanwentao%40uniontech.com
patch subject: [RFC net] net: phy: fix may not suspend when phy has WoL
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240818/202408180032.wL6gc9ou-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180032.wL6gc9ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180032.wL6gc9ou-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:310:13: error: use of undeclared identifier 'dev'
     310 |                 dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
         |                           ^
   1 error generated.


vim +/dev +310 drivers/net/phy/phy_device.c

   281	
   282	static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
   283	{
   284		struct device_driver *drv = phydev->mdio.dev.driver;
   285		struct phy_driver *phydrv = to_phy_driver(drv);
   286		struct net_device *netdev = phydev->attached_dev;
   287	
   288		if (!drv || !phydrv->suspend)
   289			return false;
   290	
   291		/* PHY not attached? May suspend if the PHY has not already been
   292		 * suspended as part of a prior call to phy_disconnect() ->
   293		 * phy_detach() -> phy_suspend() because the parent netdev might be the
   294		 * MDIO bus driver and clock gated at this point.
   295		 */
   296		if (!netdev)
   297			goto out;
   298	
   299		if (netdev->ethtool->wol_enabled)
   300			return false;
   301	
   302		/* Ethernet and phy device wol state may not same, netdev->wol_enabled
   303		 * disabled,and phydev set wol_enabled enabled, so netdev->wol_enabled
   304		 * is not enough, so check phydev->wol_enabled.
   305		 */
   306		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
   307	
   308		phy_ethtool_get_wol(phydev, &wol);
   309		if (wol.wolopts) {
 > 310			dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
   311			return false;
   312		}
   313	
   314		/* As long as not all affected network drivers support the
   315		 * wol_enabled flag, let's check for hints that WoL is enabled.
   316		 * Don't suspend PHY if the attached netdev parent may wake up.
   317		 * The parent may point to a PCI device, as in tg3 driver.
   318		 */
   319		if (netdev->dev.parent && device_may_wakeup(netdev->dev.parent))
   320			return false;
   321	
   322		/* Also don't suspend PHY if the netdev itself may wakeup. This
   323		 * is the case for devices w/o underlaying pwr. mgmt. aware bus,
   324		 * e.g. SoC devices.
   325		 */
   326		if (device_may_wakeup(&netdev->dev))
   327			return false;
   328	
   329	out:
   330		return !phydev->suspended;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
