Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349561CF5FC;
	Sat, 14 Sep 2024 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726321026; cv=none; b=GMIza7Tl4Z1mUORAyFaPCf1X0jWucq9Nxufs3V7lpecv47QX1NSooa30zgN6rArBGXPw1vpj2tTyuAqgXOW/3wxXWw/ElHvRSfoBhS240UgGBOyyRSipMSLnoqtP6X9xV7KV6iY0Dt2SlXY5cwBPDcducXmCPje1zsfi67UBX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726321026; c=relaxed/simple;
	bh=KA/rpYSug6AXyxL/j7kH6RbTB1gaCGdsM617RElTlqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8psrx+pbqEgINiEJaYfvJSVnu6qLI/wisOFFpN7+xkXGYX3stTVLrZThdsTyJXkEeZ6icBUWUv/9SZxYFjV0TsvktyZRNX3RqQ6zRs7wW1TuQpdT6c1je4JyFxVDiKPMydMxlvGlkmT4fE358YyVUhfiTXTlstZk/6eSwVv/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GASKEzRY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GASKEzRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726321024; x=1757857024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KA/rpYSug6AXyxL/j7kH6RbTB1gaCGdsM617RElTlqA=;
  b=GASKEzRYO3MwolnQBTSelkhevdIsm8ArA46q05JITtr//QhUlM8M2j2o
   JD0+/OCgLP5c/8/bLh8iZNRoFNqBmCi5Vwi2wgk/2u1bw9L02CQXeozXv
   xsW2t2X0oJqdIFGXhyfTXS0k6/urQU1v44OtdSZSJCBFoJNcOBAahX25j
   AvNsMbf4uDOLdQwWEksDySfORooQI3mDHbmYJdJd9LJRh9z1QhFmZ0QeM
   fhB3N/7XB3A/FodBQekxnf9NXIuNAWiLPHjNcSM5enCEcIVzkRUc1h0gL
   /KxIAzmamdizRKgbnOoC7JmUV6jq2MLP236G6z9KCVh9eu2Vu3Kt2dSr0
   w==;
X-CSE-ConnectionGUID: lPSKd+oPTVeE2JNQzZAcDQ==
X-CSE-MsgGUID: TwNUg40rTamThycCZh0pHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="29000133"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="29000133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:37:02 -0700
X-CSE-ConnectionGUID: bXU4UQ0ORT+/4Br9W+WXvg==
X-CSE-MsgGUID: hKIYA2RVQ8GBMj/HYETOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68640535"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2024 06:37:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spSxO-0007mw-0c;
	Sat, 14 Sep 2024 13:36:58 +0000
Date: Sat, 14 Sep 2024 21:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 24/35]
 drivers/net/ethernet/mellanox/mlxsw/core.c:2951:7: warning: variable
 'local_port' is uninitialized when used here
Message-ID: <202409142143.HwnD7F8g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   a0a3d1125af568d8cc9181967c8a0cd7212810a2
commit: 9a36de81e7b29b3b0146a7998986149559842a2d [24/35] mlxsw: Check Rx local port in PCI code
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409142143.HwnD7F8g-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142143.HwnD7F8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142143.HwnD7F8g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/core.c:2951:7: warning: variable 'local_port' is uninitialized when used here [-Wuninitialized]
    2951 |             (local_port >= mlxsw_core->max_ports))
         |              ^~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core.c:2947:16: note: initialize the variable 'local_port' to silence this warning
    2947 |         u16 local_port;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/local_port +2951 drivers/net/ethernet/mellanox/mlxsw/core.c

4ec14b7634b298 Ido Schimmel 2015-07-29  2941  
93c1edb27f9e7e Jiri Pirko   2015-07-29  2942  void mlxsw_core_skb_receive(struct mlxsw_core *mlxsw_core, struct sk_buff *skb,
93c1edb27f9e7e Jiri Pirko   2015-07-29  2943  			    struct mlxsw_rx_info *rx_info)
93c1edb27f9e7e Jiri Pirko   2015-07-29  2944  {
93c1edb27f9e7e Jiri Pirko   2015-07-29  2945  	struct mlxsw_rx_listener_item *rxl_item;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2946  	const struct mlxsw_rx_listener *rxl;
c934757d90000a Amit Cohen   2021-12-01  2947  	u16 local_port;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2948  	bool found = false;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2949  
93c1edb27f9e7e Jiri Pirko   2015-07-29  2950  	if ((rx_info->trap_id >= MLXSW_TRAP_ID_MAX) ||
5ec2ee7dd26452 Ido Schimmel 2017-03-24 @2951  	    (local_port >= mlxsw_core->max_ports))
93c1edb27f9e7e Jiri Pirko   2015-07-29  2952  		goto drop;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2953  
93c1edb27f9e7e Jiri Pirko   2015-07-29  2954  	rcu_read_lock();
93c1edb27f9e7e Jiri Pirko   2015-07-29  2955  	list_for_each_entry_rcu(rxl_item, &mlxsw_core->rx_listener_list, list) {
93c1edb27f9e7e Jiri Pirko   2015-07-29  2956  		rxl = &rxl_item->rxl;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2957  		if ((rxl->local_port == MLXSW_PORT_DONT_CARE ||
9a36de81e7b29b Amit Cohen   2024-09-11  2958  		     rxl->local_port == rx_info->local_port) &&
6a8c101e0795d4 Ido Schimmel 2020-07-14  2959  		    rxl->trap_id == rx_info->trap_id &&
6a8c101e0795d4 Ido Schimmel 2020-07-14  2960  		    rxl->mirror_reason == rx_info->mirror_reason) {
c83da2929fcd1f Jiri Pirko   2020-02-24  2961  			if (rxl_item->enabled)
93c1edb27f9e7e Jiri Pirko   2015-07-29  2962  				found = true;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2963  			break;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2964  		}
93c1edb27f9e7e Jiri Pirko   2015-07-29  2965  	}
7d8e8f3433dc8d Ido Schimmel 2020-07-29  2966  	if (!found) {
93c1edb27f9e7e Jiri Pirko   2015-07-29  2967  		rcu_read_unlock();
93c1edb27f9e7e Jiri Pirko   2015-07-29  2968  		goto drop;
7d8e8f3433dc8d Ido Schimmel 2020-07-29  2969  	}
93c1edb27f9e7e Jiri Pirko   2015-07-29  2970  
9a36de81e7b29b Amit Cohen   2024-09-11  2971  	rxl->func(skb, rx_info->local_port, rxl_item->priv);
7d8e8f3433dc8d Ido Schimmel 2020-07-29  2972  	rcu_read_unlock();
93c1edb27f9e7e Jiri Pirko   2015-07-29  2973  	return;
93c1edb27f9e7e Jiri Pirko   2015-07-29  2974  
93c1edb27f9e7e Jiri Pirko   2015-07-29  2975  drop:
93c1edb27f9e7e Jiri Pirko   2015-07-29  2976  	dev_kfree_skb(skb);
93c1edb27f9e7e Jiri Pirko   2015-07-29  2977  }
93c1edb27f9e7e Jiri Pirko   2015-07-29  2978  EXPORT_SYMBOL(mlxsw_core_skb_receive);
93c1edb27f9e7e Jiri Pirko   2015-07-29  2979  

:::::: The code at line 2951 was first introduced by commit
:::::: 5ec2ee7dd26452c2852b395b323b0260c27c2e25 mlxsw: Query maximum number of ports from firmware

:::::: TO: Ido Schimmel <idosch@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
