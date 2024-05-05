Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BA57C9A;
	Sun,  5 May 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714923398; cv=none; b=BGLjexUaMQmwkZvvPuvKXFBxbCM4FuiDvyD2wnC844gVdbckpxeaUK2rgxaWf0HWcytGumI4EJ0HDt+N8sn3gXXTfnn5Bn88/El3oGxLVofy5ZYpbp+qqGdYFv2T8fEZvCwoNNx10t2lxFErUFuD4bdakvHEclGQ4v180CrKT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714923398; c=relaxed/simple;
	bh=BWokMerW/cxS4NyxRotKz7gSxuno5iM10HpbYDkJMI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awjtIwS3ldo8aGCAHW/KVaCPrlNyy+lPwOY5uHXLtgoe89vDIhiBambEGl7c4HJ3YbmjcAii0isnWbtssqe4nrWLiIekB03n7t+67MlW2i/3ePOj++m/E6Si8VtXtH5AaBgUnKrhZKmNT6fuLPuc1Qo9qeTnDTTOrgoQVLckiT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO/mnsWE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO/mnsWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714923396; x=1746459396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWokMerW/cxS4NyxRotKz7gSxuno5iM10HpbYDkJMI0=;
  b=NO/mnsWERIELpceTY4FEhGGp+noG/gNkEthfBNRfIomw2rT3sBwvKkwz
   N7FRUGk9RgiTr6C4hZ6xb3IOA5J49UUx3VAV/SROUycEUv+vPqUOb8eRk
   W9uPTRBENHJ4Z7o5Kqm30bu4miSHXI0me8yxfNk885ZKdkRtgaQXRoI+p
   uYTGmli2puxP6w3iUpuhXFmo3HG+xuZR94z4Ytj3JEkF37idGfYHynlD7
   0pThFbBz2Px+x0E/1YlwVAVoIC0ahFdypEV23xXeIMAysIXvrRaqmUkfL
   BvDNYN+Z4Wpf2AiR5lWjtxd2Wc7+m7b4R+/6U2wFklo6mSEsUTEmW2t6s
   w==;
X-CSE-ConnectionGUID: 7s6N4pScReGX4lKxlG287A==
X-CSE-MsgGUID: Dev3EkQEQzGFwjlBYVyBrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10501193"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="10501193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 08:36:35 -0700
X-CSE-ConnectionGUID: w13o7bOPSyqKXin0aHVYCw==
X-CSE-MsgGUID: LoYoOew9TXWdTOoTRcor7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="28044263"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2024 08:36:33 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3duh-000012-1F;
	Sun, 05 May 2024 15:36:31 +0000
Date: Sun, 5 May 2024 23:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [arm:zii 35/93] drivers/net/dsa/b53/b53_common.c:2283:3: error:
 field designator 'adjust_link' does not refer to any field in type 'const
 struct dsa_switch_ops'
Message-ID: <202405052312.ZN4UrG6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   b602a1302aefbab72bb6e770c84998f0878536f8
commit: 3517bea94ef507148072d1ae9b6b1cfc097fa278 [35/93] net: dsa: Remove adjust_link paths
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240505/202405052312.ZN4UrG6u-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052312.ZN4UrG6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052312.ZN4UrG6u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/b53/b53_common.c:2283:3: error: field designator 'adjust_link' does not refer to any field in type 'const struct dsa_switch_ops'
           .adjust_link            = b53_adjust_link,
            ^
   1 error generated.


vim +2283 drivers/net/dsa/b53/b53_common.c

6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2272  
a82f67afe8e297 Florian Fainelli          2017-01-08  2273  static const struct dsa_switch_ops b53_switch_ops = {
7b314362a2344f Andrew Lunn               2016-08-22  2274  	.get_tag_protocol	= b53_get_tag_protocol,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2275  	.setup			= b53_setup,
4f6a5caf187ff5 Florian Fainelli          2020-09-09  2276  	.teardown		= b53_teardown,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2277  	.get_strings		= b53_get_strings,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2278  	.get_ethtool_stats	= b53_get_ethtool_stats,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2279  	.get_sset_count		= b53_get_sset_count,
c7d28c9df292a4 Florian Fainelli          2018-04-25  2280  	.get_ethtool_phy_stats	= b53_get_ethtool_phy_stats,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2281  	.phy_read		= b53_phy_read16,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2282  	.phy_write		= b53_phy_write16,
967dd82ffc52e9 Florian Fainelli          2016-06-09 @2283  	.adjust_link		= b53_adjust_link,
dda1c25751fa22 Russell King (Oracle      2022-02-22  2284) 	.phylink_get_caps	= b53_phylink_get_caps,
79396934e289db Russell King (Oracle      2022-04-29  2285) 	.phylink_mac_select_pcs	= b53_phylink_mac_select_pcs,
a8e8b98531369c Florian Fainelli          2018-09-05  2286  	.phylink_mac_config	= b53_phylink_mac_config,
a8e8b98531369c Florian Fainelli          2018-09-05  2287  	.phylink_mac_link_down	= b53_phylink_mac_link_down,
a8e8b98531369c Florian Fainelli          2018-09-05  2288  	.phylink_mac_link_up	= b53_phylink_mac_link_up,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2289  	.port_enable		= b53_enable_port,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2290  	.port_disable		= b53_disable_port,
f43a2dbe959703 Florian Fainelli          2017-09-19  2291  	.get_mac_eee		= b53_get_mac_eee,
f43a2dbe959703 Florian Fainelli          2017-09-19  2292  	.set_mac_eee		= b53_set_mac_eee,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2293  	.port_bridge_join	= b53_br_join,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2294  	.port_bridge_leave	= b53_br_leave,
a8b659e7ff75a6 Vladimir Oltean           2021-02-12  2295  	.port_pre_bridge_flags	= b53_br_flags_pre,
a8b659e7ff75a6 Vladimir Oltean           2021-02-12  2296  	.port_bridge_flags	= b53_br_flags,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2297  	.port_stp_state_set	= b53_br_set_stp_state,
597698f1e00d37 Vivien Didelot            2016-09-22  2298  	.port_fast_age		= b53_br_fast_age,
a2482d2ce34986 Florian Fainelli          2016-06-09  2299  	.port_vlan_filtering	= b53_vlan_filtering,
a2482d2ce34986 Florian Fainelli          2016-06-09  2300  	.port_vlan_add		= b53_vlan_add,
a2482d2ce34986 Florian Fainelli          2016-06-09  2301  	.port_vlan_del		= b53_vlan_del,
1da6df85c6fbed Florian Fainelli          2016-06-09  2302  	.port_fdb_dump		= b53_fdb_dump,
1da6df85c6fbed Florian Fainelli          2016-06-09  2303  	.port_fdb_add		= b53_fdb_add,
1da6df85c6fbed Florian Fainelli          2016-06-09  2304  	.port_fdb_del		= b53_fdb_del,
ed3af5fd08ebe3 Florian Fainelli          2017-01-30  2305  	.port_mirror_add	= b53_mirror_add,
ed3af5fd08ebe3 Florian Fainelli          2017-01-30  2306  	.port_mirror_del	= b53_mirror_del,
5d65b64a3d9701 Florian Fainelli          2019-10-24  2307  	.port_mdb_add		= b53_mdb_add,
5d65b64a3d9701 Florian Fainelli          2019-10-24  2308  	.port_mdb_del		= b53_mdb_del,
6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2309  	.port_max_mtu		= b53_get_max_mtu,
6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2310  	.port_change_mtu	= b53_change_mtu,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2311  };
967dd82ffc52e9 Florian Fainelli          2016-06-09  2312  

:::::: The code at line 2283 was first introduced by commit
:::::: 967dd82ffc52e9d8ea0defde094f9a39a3f4eeed net: dsa: b53: Add support for Broadcom RoboSwitch

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
