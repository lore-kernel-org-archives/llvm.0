Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D44F889;
	Sun, 28 Apr 2024 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714287803; cv=none; b=DkScRXuRR6L1IZ1HJWBVzGEozc5GCaKHlMAMld8luVxYYItTqTcPWOYkWIljEqQ5SjdCuYEfX2MkpcLqFjh8/PRR/3lf6iIwJNsFxb6DOwKshNSb+JXjY6amrw23qrYkv29op0lXrmhM7t7n5DE8K9fS1MbpFStdqsjOhvJGVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714287803; c=relaxed/simple;
	bh=y8WhzOR2LrdOimTpGSD5jOfN63+2rqjHOPWVTv5KT50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhcYAb3p5yQfxmaZQKGmoqUNQXl1rl49MzLlL+SElS+Gt8f1MYLUjDhiU1GbJ0SnFyEGG+rnXnU/JV7OmLEoWSGobhuUvyX53TTlckBIJstKB+/8nHBpN3P4nJoC+YPTGrGNfT3oU1BDl0lq8M1rUibDRSxMkdJu36axXjky8Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWftRb4D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWftRb4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714287801; x=1745823801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y8WhzOR2LrdOimTpGSD5jOfN63+2rqjHOPWVTv5KT50=;
  b=cWftRb4DjvIuKEj6ZmBeKFrwBWv6e2dqRDSVTg8P+ZDcnUIWh4kKaRFk
   aLiDTdef+/0p382kLqGW11K/mvURqh/kBMJrpzus6L7XKDPZ8F15jyaoj
   JgWQuRxVKeX9CAGiUdkUlVXO2COrSKYse3t0GPGW7LAeVnebPFN5yffNx
   KB4o7zl8XHI6MVeMqTi4hwpp+0to1F/r0hO7knEnyni+SRbQ5qr88PQZw
   CGtdIHs14qaXT++30q9R+VzIzbFK7WnfZB/Jz3/003lezpaFLlwQ/hmuq
   p3mxm0vKNhtNxDuB4hv23IpWIE5aHykr+LGoNUX5NYyLDJVbVNCSYkhnG
   w==;
X-CSE-ConnectionGUID: so4LIc9TQgyERoGEwLWr0g==
X-CSE-MsgGUID: g9WXVhVURKOKgtQ5hgRB0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10084827"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="10084827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:03:21 -0700
X-CSE-ConnectionGUID: eDdQ5o5ySZ6IQUM0dhY63A==
X-CSE-MsgGUID: V0g9lFEnS+uMNjRSeuCPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26441061"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 00:03:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0yZA-0005wI-1r;
	Sun, 28 Apr 2024 07:03:16 +0000
Date: Sun, 28 Apr 2024 15:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 78/91] drivers/net/phy/phylink.c:3769:19: error: use of
 undeclared identifier 'link_config'
Message-ID: <202404281441.Hlarm92C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   a98a469e79c72ce3b4d0d35d9f4c6799c2848749
commit: 338a60c57d4cd93a06091616323db3a899da75e1 [78/91] net: phylink: use phy interface mode bitmaps for SFP PHYs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240428/202404281441.Hlarm92C-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281441.Hlarm92C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281441.Hlarm92C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/phy/phylink.c:9:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/phy/phylink.c:3769:19: error: use of undeclared identifier 'link_config'
    3769 |                              phy_modes(link_config.interface));
         |                                        ^
>> drivers/net/phy/phylink.c:3769:19: error: use of undeclared identifier 'link_config'
   1 warning and 2 errors generated.


vim +/link_config +3769 drivers/net/phy/phylink.c

  3706	
  3707	static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
  3708	{
  3709		DECLARE_PHY_INTERFACE_MASK(interfaces);
  3710		struct phylink *pl = upstream;
  3711		phy_interface_t interface;
  3712		int ret;
  3713	
  3714		/*
  3715		 * This is the new way of dealing with flow control for PHYs,
  3716		 * as described by Timur Tabi in commit 529ed1275263 ("net: phy:
  3717		 * phy drivers should not set SUPPORTED_[Asym_]Pause") except
  3718		 * using our validate call to the MAC, we rely upon the MAC
  3719		 * clearing the bits from both supported and advertising fields.
  3720		 */
  3721		phy_support_asym_pause(phy);
  3722	
  3723		/* Set the PHY's host supported interfaces */
  3724		phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
  3725				  pl->config->supported_interfaces);
  3726	
  3727		if (phy_interface_empty(phy->supported_interfaces)) {
  3728			phylink_dbg(pl, "copper SFP: PHY provides empty supported_interfaces\n");
  3729	
  3730			/* Do the initial configuration */
  3731			return phylink_sfp_config_phy(pl, phy);
  3732		}
  3733	
  3734		phylink_dbg(pl, "copper SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
  3735			    (int)PHY_INTERFACE_MODE_MAX,
  3736			    pl->config->supported_interfaces,
  3737			    (int)PHY_INTERFACE_MODE_MAX,
  3738			    phy->supported_interfaces);
  3739	
  3740		phy_interface_and(interfaces, phy->supported_interfaces,
  3741				  pl->config->supported_interfaces);
  3742		interface = phylink_choose_sfp_interface(pl, interfaces);
  3743		if (interface == PHY_INTERFACE_MODE_NA) {
  3744			phylink_err(pl,
  3745				    "selection of interface for PHY failed\n");
  3746			return -EINVAL;
  3747		}
  3748	
  3749		phylink_dbg(pl, "copper SFP: chosen %s interface\n",
  3750			    phy_modes(interface));
  3751	
  3752		ret = phylink_attach_phy(pl, phy, interface);
  3753		if (ret < 0)
  3754			return ret;
  3755	
  3756		ret = phylink_bringup_phy(pl, phy, interface);
  3757		if (ret) {
  3758			phy_detach(phy);
  3759			return ret;
  3760		}
  3761	
  3762		if (pl->req_link_an_mode != MLO_AN_INBAND ||
  3763		    pl->link_config.interface != interface) {
  3764			pl->link_config.interface = interface;
  3765			pl->req_link_an_mode = MLO_AN_INBAND;
  3766	
  3767			phylink_info(pl, "switched to %s/%s link mode\n",
  3768				     phylink_an_mode_str(pl->req_link_an_mode),
> 3769				     phy_modes(link_config.interface));
  3770		}
  3771	
  3772		if (!test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
  3773			phylink_mac_initial_config(pl, false);
  3774	
  3775		return 0;
  3776	}
  3777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
