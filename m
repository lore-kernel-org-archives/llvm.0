Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7F196;
	Sat,  8 Mar 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412310; cv=none; b=JkNwDjKhWrHT+wYHg33Wp4SYOQJPkunE8ua8VYtU5k88lIXCmobcbV2hHYVuKNBlc2mDmOIAbWYLR23e21K4/Lmbvg1bud99F87p6SRA1P6YtPdBfdDKr0UII8XW/7og8Gj0zXPdn1xfrXQUC0uyO1mSLt+Gco408G1oV1atN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412310; c=relaxed/simple;
	bh=afFSsAXfznfKFQ8p7FvWWnFeXAMvCTITmE6Oj6WIqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cENZOzpxHa9tCQ4P6HF1o3lI4odcSyj2zGY2zbL9y58aNplLUIBdotbJMM5LuVnDmwFxbGTPQkM7d4U5U2QESUCqJaxVKw0oDlhxr5ZpCJgAx5OrDedToB2CCBJbdHRqkD7BbUxU0DZhtPuxOeSZVLXDnZdVScW8C9RBnQR6nVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FznjdbtX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FznjdbtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741412308; x=1772948308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afFSsAXfznfKFQ8p7FvWWnFeXAMvCTITmE6Oj6WIqck=;
  b=FznjdbtXgC+O2UaE/2/Q/AeHPmT0mAsssMy2a6G+eCz8ywWx2aQieM5X
   MoPYZzDs2sj8Q3x8u7V6MgZph8hDEzkYW/j1I726LVRBYNqxPfNYnWGLI
   nJ/lFmSmj2JGtGFHcj6sTfAzhdZ63GSmSZ/NMkztR6Fg8lY+17VsH8A0t
   untsyQww00BZIExYV0iBkbxJhr1cKpDh8talSk31Xs6ZEPgBBYaN1Qghp
   QfDoGpdT8ukFQPSJarfSVTAbh7h6KPNvTuoKAysuin3JjgV4FiT+hc6ED
   fXOC0jJPslWRX2H/wcBdzqzWTs9yCJF63LDNmzLYrzEj21EilEGOwxo+j
   A==;
X-CSE-ConnectionGUID: E/DTpT6zR4WO9tyI+xBS2w==
X-CSE-MsgGUID: z/btj5otQeuHKM6AtbB51g==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30047199"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="30047199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 21:38:27 -0800
X-CSE-ConnectionGUID: KBESZpoKRCKOBQSyjakqYA==
X-CSE-MsgGUID: E4ajaz7FSF+B0/UJaaw7Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156722625"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 21:38:26 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqmtD-0001XQ-24;
	Sat, 08 Mar 2025 05:38:23 +0000
Date: Sat, 8 Mar 2025 13:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next v1 5/6] RDMA/mlx5: Expose RDMA TRANSPORT flow
 table types to userspace
Message-ID: <202503081358.5IRVqXGS-lkp@intel.com>
References: <2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/RDMA-uverbs-Introduce-UCAP-User-CAPabilities-API/20250306-195708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon%40kernel.org
patch subject: [PATCH rdma-next v1 5/6] RDMA/mlx5: Expose RDMA TRANSPORT flow table types to userspace
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250308/202503081358.5IRVqXGS-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081358.5IRVqXGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081358.5IRVqXGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/fs.c:702:10: error: no member named 'vport' in 'struct mlx5_flow_table_attr'
           ft_attr.vport = vport;
           ~~~~~~~ ^
>> drivers/infiniband/hw/mlx5/fs.c:1430:7: error: call to undeclared function 'MLX5_CAP_ADV_RDMA'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (!MLX5_CAP_ADV_RDMA(dev->mdev, rdma_transport_manager))
                ^
   drivers/infiniband/hw/mlx5/fs.c:1430:36: error: use of undeclared identifier 'rdma_transport_manager'; did you mean 'skb_transport_header'?
           if (!MLX5_CAP_ADV_RDMA(dev->mdev, rdma_transport_manager))
                                             ^~~~~~~~~~~~~~~~~~~~~~
                                             skb_transport_header
   include/linux/skbuff.h:3018:30: note: 'skb_transport_header' declared here
   static inline unsigned char *skb_transport_header(const struct sk_buff *skb)
                                ^
   drivers/infiniband/hw/mlx5/fs.c:1510:7: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX'
           case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
                ^
   drivers/infiniband/hw/mlx5/fs.c:1511:7: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX'
           case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
                ^
   drivers/infiniband/hw/mlx5/fs.c:1512:39: error: use of undeclared identifier 'MLX5_RDMA_TRANSPORT_BYPASS_PRIO'
                   if (ib_port == 0 || user_priority > MLX5_RDMA_TRANSPORT_BYPASS_PRIO)
                                                       ^
   drivers/infiniband/hw/mlx5/fs.c:1520:18: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX'
                   if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX)
                                  ^
>> drivers/infiniband/hw/mlx5/fs.c:1522:9: error: call to undeclared function 'MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX(
                                       ^
   drivers/infiniband/hw/mlx5/fs.c:1523:15: error: use of undeclared identifier 'log_max_ft_size'
                                           ft_mdev, log_max_ft_size));
                                                    ^
>> drivers/infiniband/hw/mlx5/fs.c:1526:9: error: call to undeclared function 'MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX(
                                       ^
   drivers/infiniband/hw/mlx5/fs.c:1527:15: error: use of undeclared identifier 'log_max_ft_size'
                                           ft_mdev, log_max_ft_size));
                                                    ^
   drivers/infiniband/hw/mlx5/fs.c:1536:17: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX'
           if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX ||
                          ^
   drivers/infiniband/hw/mlx5/fs.c:1537:17: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX'
               ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX)
                          ^
>> drivers/infiniband/hw/mlx5/fs.c:1538:8: error: call to undeclared function 'mlx5_get_flow_vport_namespace'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
                        ^
   drivers/infiniband/hw/mlx5/fs.c:1538:8: note: did you mean 'mlx5_get_flow_vport_acl_namespace'?
   include/linux/mlx5/fs.h:197:1: note: 'mlx5_get_flow_vport_acl_namespace' declared here
   mlx5_get_flow_vport_acl_namespace(struct mlx5_core_dev *dev,
   ^
   drivers/infiniband/hw/mlx5/fs.c:1538:6: error: incompatible integer to pointer conversion assigning to 'struct mlx5_flow_namespace *' from 'int' [-Wint-conversion]
                   ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/fs.c:1561:7: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX'
           case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
                ^
   drivers/infiniband/hw/mlx5/fs.c:1564:7: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX'
           case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
                ^
   drivers/infiniband/hw/mlx5/fs.c:1814:16: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX'
                   *namespace = MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX;
                                ^
   drivers/infiniband/hw/mlx5/fs.c:1817:16: error: use of undeclared identifier 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX'
                   *namespace = MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX;
                                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/MLX5_CAP_ADV_RDMA +1430 drivers/infiniband/hw/mlx5/fs.c

  1417	
  1418	static int mlx5_ib_fill_transport_ns_info(struct mlx5_ib_dev *dev,
  1419						  enum mlx5_flow_namespace_type type,
  1420						  u32 *flags, u16 *vport_idx,
  1421						  u16 *vport,
  1422						  struct mlx5_core_dev **ft_mdev,
  1423						  u32 ib_port)
  1424	{
  1425		struct mlx5_core_dev *esw_mdev;
  1426	
  1427		if (!is_mdev_switchdev_mode(dev->mdev))
  1428			return 0;
  1429	
> 1430		if (!MLX5_CAP_ADV_RDMA(dev->mdev, rdma_transport_manager))
  1431			return -EOPNOTSUPP;
  1432	
  1433		if (!dev->port[ib_port - 1].rep)
  1434			return -EINVAL;
  1435	
  1436		esw_mdev = mlx5_eswitch_get_core_dev(dev->port[ib_port - 1].rep->esw);
  1437		if (esw_mdev != dev->mdev)
  1438			return -EOPNOTSUPP;
  1439	
  1440		*flags |= MLX5_FLOW_TABLE_OTHER_VPORT;
  1441		*ft_mdev = esw_mdev;
  1442		*vport = dev->port[ib_port - 1].rep->vport;
  1443		*vport_idx = dev->port[ib_port - 1].rep->vport_index;
  1444	
  1445		return 0;
  1446	}
  1447	
  1448	static struct mlx5_ib_flow_prio *
  1449	_get_flow_table(struct mlx5_ib_dev *dev, u16 user_priority,
  1450			enum mlx5_flow_namespace_type ns_type,
  1451			bool mcast, u32 ib_port)
  1452	{
  1453		struct mlx5_core_dev *ft_mdev = dev->mdev;
  1454		struct mlx5_flow_namespace *ns = NULL;
  1455		struct mlx5_ib_flow_prio *prio = NULL;
  1456		int max_table_size = 0;
  1457		u16 vport_idx = 0;
  1458		bool esw_encap;
  1459		u32 flags = 0;
  1460		u16 vport = 0;
  1461		int priority;
  1462		int ret;
  1463	
  1464		if (mcast)
  1465			priority = MLX5_IB_FLOW_MCAST_PRIO;
  1466		else
  1467			priority = ib_prio_to_core_prio(user_priority, false);
  1468	
  1469		esw_encap = mlx5_eswitch_get_encap_mode(dev->mdev) !=
  1470			DEVLINK_ESWITCH_ENCAP_MODE_NONE;
  1471		switch (ns_type) {
  1472		case MLX5_FLOW_NAMESPACE_BYPASS:
  1473			max_table_size = BIT(
  1474				MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev, log_max_ft_size));
  1475			if (MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev, decap) && !esw_encap)
  1476				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_DECAP;
  1477			if (MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev,
  1478						      reformat_l3_tunnel_to_l2) &&
  1479			    !esw_encap)
  1480				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1481			break;
  1482		case MLX5_FLOW_NAMESPACE_EGRESS:
  1483			max_table_size = BIT(
  1484				MLX5_CAP_FLOWTABLE_NIC_TX(dev->mdev, log_max_ft_size));
  1485			if (MLX5_CAP_FLOWTABLE_NIC_TX(dev->mdev, reformat) &&
  1486			    !esw_encap)
  1487				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1488			break;
  1489		case MLX5_FLOW_NAMESPACE_FDB_BYPASS:
  1490			max_table_size = BIT(
  1491				MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev, log_max_ft_size));
  1492			if (MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev, decap) && esw_encap)
  1493				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_DECAP;
  1494			if (MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev,
  1495						       reformat_l3_tunnel_to_l2) &&
  1496			    esw_encap)
  1497				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1498			priority = user_priority;
  1499			break;
  1500		case MLX5_FLOW_NAMESPACE_RDMA_RX:
  1501			max_table_size = BIT(
  1502				MLX5_CAP_FLOWTABLE_RDMA_RX(dev->mdev, log_max_ft_size));
  1503			priority = user_priority;
  1504			break;
  1505		case MLX5_FLOW_NAMESPACE_RDMA_TX:
  1506			max_table_size = BIT(
  1507				MLX5_CAP_FLOWTABLE_RDMA_TX(dev->mdev, log_max_ft_size));
  1508			priority = user_priority;
  1509			break;
  1510		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
  1511		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
  1512			if (ib_port == 0 || user_priority > MLX5_RDMA_TRANSPORT_BYPASS_PRIO)
  1513				return ERR_PTR(-EINVAL);
  1514			ret = mlx5_ib_fill_transport_ns_info(dev, ns_type, &flags,
  1515							     &vport_idx, &vport,
  1516							     &ft_mdev, ib_port);
  1517			if (ret)
  1518				return ERR_PTR(ret);
  1519	
  1520			if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX)
  1521				max_table_size =
> 1522					BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX(
  1523						ft_mdev, log_max_ft_size));
  1524			else
  1525				max_table_size =
> 1526					BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX(
  1527						ft_mdev, log_max_ft_size));
  1528			priority = user_priority;
  1529			break;
  1530		default:
  1531			break;
  1532		}
  1533	
  1534		max_table_size = min_t(int, max_table_size, MLX5_FS_MAX_ENTRIES);
  1535	
  1536		if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX ||
  1537		    ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX)
> 1538			ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
  1539		else
  1540			ns = mlx5_get_flow_namespace(ft_mdev, ns_type);
  1541	
  1542		if (!ns)
  1543			return ERR_PTR(-EOPNOTSUPP);
  1544	
  1545		switch (ns_type) {
  1546		case MLX5_FLOW_NAMESPACE_BYPASS:
  1547			prio = &dev->flow_db->prios[priority];
  1548			break;
  1549		case MLX5_FLOW_NAMESPACE_EGRESS:
  1550			prio = &dev->flow_db->egress_prios[priority];
  1551			break;
  1552		case MLX5_FLOW_NAMESPACE_FDB_BYPASS:
  1553			prio = &dev->flow_db->fdb[priority];
  1554			break;
  1555		case MLX5_FLOW_NAMESPACE_RDMA_RX:
  1556			prio = &dev->flow_db->rdma_rx[priority];
  1557			break;
  1558		case MLX5_FLOW_NAMESPACE_RDMA_TX:
  1559			prio = &dev->flow_db->rdma_tx[priority];
  1560			break;
  1561		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
  1562			prio = &dev->flow_db->rdma_transport_rx[ib_port - 1];
  1563			break;
  1564		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
  1565			prio = &dev->flow_db->rdma_transport_tx[ib_port - 1];
  1566			break;
  1567		default: return ERR_PTR(-EINVAL);
  1568		}
  1569	
  1570		if (!prio)
  1571			return ERR_PTR(-EINVAL);
  1572	
  1573		if (prio->flow_table)
  1574			return prio;
  1575	
  1576		return _get_prio(dev, ns, prio, priority, max_table_size,
  1577				 MLX5_FS_MAX_TYPES, flags, vport);
  1578	}
  1579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
