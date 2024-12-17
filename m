Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C11DB52D;
	Tue, 17 Dec 2024 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448060; cv=none; b=ptmsGbfcJRfBhQVGIUezmHOcuPWdnZAkQ+C01v487xAY2qo+rUId0q65sfx1K2bB2aJEilSEr8mVzH8Ke52VUq8ajkF5iSNSFNC/7PdJvTmCSkgYIZwO0tytWxEVQsN1qcLRQ3zAYaMBgOWsY1d973Vow0auBxdA20zWHRri6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448060; c=relaxed/simple;
	bh=sBExK1vL1jnibSrrg8KojZTuQcBCxyO6Co+CfV7vQyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTf2BEGXOlUfNPP8FiDMpwp5zEgeuxL4PWPjnbrkzuXXTWaYB5WQJoMEri8GQv8e1apeOrXZ0Lhl9laq+VdiowLaGpLae5CfHeOd9gPf1v4YigU8onWPHSAxYv4tveDJYHOZXUv10xBIRD0fsiTt9yK8pjmWCY2XRcGeQ92iRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLfRwSrl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLfRwSrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734448059; x=1765984059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sBExK1vL1jnibSrrg8KojZTuQcBCxyO6Co+CfV7vQyc=;
  b=eLfRwSrl8GgzFxGdK5vnyo7odysfdHvJZj9vKSMpS9N89bil0hHFo8mK
   jFRpQdWliafJ8vx6U68stN8Tl0tPh6yjhAmi1QgjrYkpmFyt7j03uof0R
   wXuHHv9k9MDHDU+WmfX2Z1cS9kgV9m2FiPha6zg4bxpPgc5fLWmWHZyCI
   xBBPRxpoyiHlMFHPS2eJnDK/5MVhLFrIj+suWoj09OYJk53Rqh7IPkdfv
   KQfzKsG0/6dlZX09sYvg2R4JTSwdGWNZmvIPhDcEZIFZxsfp9OyMlA9nC
   nXduEEZuwcBf/rbeOt/g88baQ9IaeMaFmjqeHJFEccbFARE7jUmX3+fVQ
   A==;
X-CSE-ConnectionGUID: TSb8nJyqQGy2E6dQ3CtXXQ==
X-CSE-MsgGUID: 96+aI020SIeN5QbZYXcAww==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34169405"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34169405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:07:38 -0800
X-CSE-ConnectionGUID: EhODovXxRgGQcEfJ6J5nuQ==
X-CSE-MsgGUID: L1q9Hj/lSXun7+J7xvzm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97424516"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2024 07:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZAc-000F5S-0Q;
	Tue, 17 Dec 2024 15:07:34 +0000
Date: Tue, 17 Dec 2024 23:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 53/60] net/bridge/br.c:58:4: error:
 call to undeclared function 'br_vlan_vlan_upper_event'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202412172314.72HnCK0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   eed0968cc93b75eeb363ea89d1834928a77e6fdc
commit: dae14d4697667bf658c29a01c0aac9c8f305e478 [53/60] net: bridge: Handle changes in VLAN_FLAG_BRIDGE_BINDING
config: x86_64-buildonly-randconfig-001-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172314.72HnCK0B-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172314.72HnCK0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412172314.72HnCK0B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/bridge/br.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/bridge/br.c:58:4: error: call to undeclared function 'br_vlan_vlan_upper_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |                         br_vlan_vlan_upper_event(real_dev, dev, event);
         |                         ^
   1 warning and 1 error generated.


vim +/br_vlan_vlan_upper_event +58 net/bridge/br.c

    21	
    22	/*
    23	 * Handle changes in state of network devices enslaved to a bridge.
    24	 *
    25	 * Note: don't care about up/down if bridge itself is down, because
    26	 *     port state is checked when bridge is brought up.
    27	 */
    28	static int br_device_event(struct notifier_block *unused, unsigned long event, void *ptr)
    29	{
    30		struct netlink_ext_ack *extack = netdev_notifier_info_to_extack(ptr);
    31		struct netdev_notifier_pre_changeaddr_info *prechaddr_info;
    32		struct net_device *dev = netdev_notifier_info_to_dev(ptr);
    33		struct net_bridge_port *p;
    34		struct net_bridge *br;
    35		bool notified = false;
    36		bool changed_addr;
    37		int err;
    38	
    39		if (netif_is_bridge_master(dev)) {
    40			err = br_vlan_bridge_event(dev, event, ptr);
    41			if (err)
    42				return notifier_from_errno(err);
    43	
    44			if (event == NETDEV_REGISTER) {
    45				/* register of bridge completed, add sysfs entries */
    46				err = br_sysfs_addbr(dev);
    47				if (err)
    48					return notifier_from_errno(err);
    49	
    50				return NOTIFY_DONE;
    51			}
    52		}
    53	
    54		if (is_vlan_dev(dev)) {
    55			struct net_device *real_dev = vlan_dev_real_dev(dev);
    56	
    57			if (netif_is_bridge_master(real_dev))
  > 58				br_vlan_vlan_upper_event(real_dev, dev, event);
    59		}
    60	
    61		/* not a port of a bridge */
    62		p = br_port_get_rtnl(dev);
    63		if (!p)
    64			return NOTIFY_DONE;
    65	
    66		br = p->br;
    67	
    68		switch (event) {
    69		case NETDEV_CHANGEMTU:
    70			br_mtu_auto_adjust(br);
    71			break;
    72	
    73		case NETDEV_PRE_CHANGEADDR:
    74			if (br->dev->addr_assign_type == NET_ADDR_SET)
    75				break;
    76			prechaddr_info = ptr;
    77			err = dev_pre_changeaddr_notify(br->dev,
    78							prechaddr_info->dev_addr,
    79							extack);
    80			if (err)
    81				return notifier_from_errno(err);
    82			break;
    83	
    84		case NETDEV_CHANGEADDR:
    85			spin_lock_bh(&br->lock);
    86			br_fdb_changeaddr(p, dev->dev_addr);
    87			changed_addr = br_stp_recalculate_bridge_id(br);
    88			spin_unlock_bh(&br->lock);
    89	
    90			if (changed_addr)
    91				call_netdevice_notifiers(NETDEV_CHANGEADDR, br->dev);
    92	
    93			break;
    94	
    95		case NETDEV_CHANGE:
    96			br_port_carrier_check(p, &notified);
    97			break;
    98	
    99		case NETDEV_FEAT_CHANGE:
   100			netdev_update_features(br->dev);
   101			break;
   102	
   103		case NETDEV_DOWN:
   104			spin_lock_bh(&br->lock);
   105			if (br->dev->flags & IFF_UP) {
   106				br_stp_disable_port(p);
   107				notified = true;
   108			}
   109			spin_unlock_bh(&br->lock);
   110			break;
   111	
   112		case NETDEV_UP:
   113			if (netif_running(br->dev) && netif_oper_up(dev)) {
   114				spin_lock_bh(&br->lock);
   115				br_stp_enable_port(p);
   116				notified = true;
   117				spin_unlock_bh(&br->lock);
   118			}
   119			break;
   120	
   121		case NETDEV_UNREGISTER:
   122			br_del_if(br, dev);
   123			break;
   124	
   125		case NETDEV_CHANGENAME:
   126			err = br_sysfs_renameif(p);
   127			if (err)
   128				return notifier_from_errno(err);
   129			break;
   130	
   131		case NETDEV_PRE_TYPE_CHANGE:
   132			/* Forbid underlying device to change its type. */
   133			return NOTIFY_BAD;
   134	
   135		case NETDEV_RESEND_IGMP:
   136			/* Propagate to master device */
   137			call_netdevice_notifiers(event, br->dev);
   138			break;
   139		}
   140	
   141		if (event != NETDEV_UNREGISTER)
   142			br_vlan_port_event(p, event);
   143	
   144		/* Events that may cause spanning tree to refresh */
   145		if (!notified && (event == NETDEV_CHANGEADDR || event == NETDEV_UP ||
   146				  event == NETDEV_CHANGE || event == NETDEV_DOWN))
   147			br_ifinfo_notify(RTM_NEWLINK, NULL, p);
   148	
   149		return NOTIFY_DONE;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
