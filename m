Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414201A2C0C;
	Thu,  9 May 2024 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272939; cv=none; b=WAc5DvTLlHg9cFPe1tZL+/q63Tvmec6pSBcR/nelp+5ti/Zi53Ipy1fHtnKyJKRP/LkXxOvmTIaINrNJoNaWWFlZ9r/gcxOnJ/PRXF1XZ9x0Uva8rtOLCPbSg/0ISYcHQB8mA/LYbhxgFhPro4u4LSHUK6R1WpoQMxbEEpYPH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272939; c=relaxed/simple;
	bh=FhGC7HWHT7I9NIEDYXYnCZ3XIu+nNEtZYCggc1rGG+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8uR0JeSCP9c94jQPKMOGpRsR42abPwWZzoy2/k0N9CQpNdYV5i/DKsi6VwBO9PMY+9SffOxz0qrCWkh0kIOR3sDY6nEAbtULqncdv0mCie+bpsRM7G4l5zBVM8mc9X/oa4Wz9T9pvtpLVPMwOUB0eodVC2McSHon7nZHy9IHwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBRGk+fO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBRGk+fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272937; x=1746808937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhGC7HWHT7I9NIEDYXYnCZ3XIu+nNEtZYCggc1rGG+s=;
  b=DBRGk+fO5rmJlb8o7tH/4svUxJHBR4aR+GAHjRJjS9iEPRJamIlHGl7R
   DUIFEy6KTE1TKMVGnKfEwOb0D5ceKi8uhPqwT8y2pt3bswWXl3hd7mt1u
   3wDmfUer5HdS0M1rPa3XS+DlFr3sC+PtONxUfI3oGtNtR8/q+GmfGEhmW
   o+TMx+IKZver50rewl0ZJz/mklwioP6FET6RMA8stpGARwCj7nYvCRD8q
   Oc75XkzxTFKCBqf+emrFr/fnziRt9FL8wXpm4DfdFnkVIEHS+VFd4vCuZ
   ru+xxJuRVkrw8yN2ptQSkj+Dvy7tlWpfpqOoGXOPq/LLE+8k2/ZaFs2Bl
   w==;
X-CSE-ConnectionGUID: R0U9R5Q9TVCt0jCSfdNWAA==
X-CSE-MsgGUID: rFl1ahu7TsmXXM4R/7VbEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11083076"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11083076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:42:15 -0700
X-CSE-ConnectionGUID: kTSyd02rRp+A7E3dqDYpNw==
X-CSE-MsgGUID: ISDiJcjjRKCTuApRqTZJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29402097"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2024 09:42:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s56qR-00058u-0E;
	Thu, 09 May 2024 16:42:11 +0000
Date: Fri, 10 May 2024 00:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [arm:zii 40/102] drivers/net/dsa/b53/b53_common.c:1484:23: error:
 incompatible pointer types initializing 'struct ethtool_keee *' with an
 expression of type 'struct ethtool_eee *'
Message-ID: <202405100019.okFNkK95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   e9436a5c3f1e8dc9d425f51b98e96e185a20704d
commit: 7e189be0111c723d361907eecee7f5f96000b518 [40/102] net: dsa: b53: Call b53_eee_init() from b53_mac_link_up()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240510/202405100019.okFNkK95-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100019.okFNkK95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100019.okFNkK95-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/b53/b53_common.c:1484:23: error: incompatible pointer types initializing 'struct ethtool_keee *' with an expression of type 'struct ethtool_eee *' [-Werror,-Wincompatible-pointer-types]
           struct ethtool_keee *p = &dev->ports[port].eee;
                                ^   ~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1488:4: error: incomplete definition of type 'struct ethtool_keee'
                   p->eee_enabled = b53_eee_init(ds, port, phydev);
                   ~^
   drivers/net/dsa/b53/b53_common.c:1484:9: note: forward declaration of 'struct ethtool_keee'
           struct ethtool_keee *p = &dev->ports[port].eee;
                  ^
   2 errors generated.


vim +1484 drivers/net/dsa/b53/b53_common.c

  1475	
  1476	static void b53_phylink_mac_link_up(struct dsa_switch *ds, int port,
  1477					    unsigned int mode,
  1478					    phy_interface_t interface,
  1479					    struct phy_device *phydev,
  1480					    int speed, int duplex,
  1481					    bool tx_pause, bool rx_pause)
  1482	{
  1483		struct b53_device *dev = ds->priv;
> 1484		struct ethtool_keee *p = &dev->ports[port].eee;
  1485	
  1486		if (mode == MLO_AN_PHY) {
  1487			/* Re-negotiate EEE if it was enabled already */
> 1488			p->eee_enabled = b53_eee_init(ds, port, phydev);
  1489			return;
  1490		}
  1491	
  1492		if (mode == MLO_AN_FIXED) {
  1493			/* Force flow control on BCM5301x's CPU port */
  1494			if (is5301x(dev) && dsa_is_cpu_port(ds, port))
  1495				tx_pause = rx_pause = true;
  1496	
  1497			b53_force_port_config(dev, port, speed, duplex,
  1498					      tx_pause, rx_pause);
  1499			b53_force_link(dev, port, true);
  1500			return;
  1501		}
  1502	
  1503		if (phy_interface_mode_is_8023z(interface) &&
  1504		    dev->ops->serdes_link_set)
  1505			dev->ops->serdes_link_set(dev, port, mode, interface, true);
  1506	}
  1507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
