Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A37194C78;
	Sat, 14 Dec 2024 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734199945; cv=none; b=o2gbQr1byfkC0VfUZ+iE4zYYVVLfTu8JmE/+TgFqzDLB4E6s4m3pFuyciKXD1mF8tm9Z4VGkHYKM76ABk+34Ir1NnOUMYaMM8BCHDtzWa3kwbjFsNysX2rbS4eoHTJMEpivN7V6qVkQHTlEO02UiB2Ml2ww7JntLXuvsUXcmZko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734199945; c=relaxed/simple;
	bh=wvNSU08Uir7uL0JVcgzofbXSGpZbOQZ79FmdsPkwU5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVqHajbgJz17nUimkELFPSe+7fM5YKxL2T2MDXfSZ4a4/Sp1C68NNgcXeim3PlECYzN7jT/p6YpGWuXwyOkpD2f32G20zUqj5ODRgt/AY0ZMqeJqyRtrwjiMLle8+A2coh+ZucUJLcAZj5gSk2hLXcagIw13sVQJBsu6ZkWp4Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hg1Tov7K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg1Tov7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734199944; x=1765735944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvNSU08Uir7uL0JVcgzofbXSGpZbOQZ79FmdsPkwU5Y=;
  b=Hg1Tov7Kmvln2d0jdpPeK8vYXLCZVQemWXm8p2vjo4GRvg820AibHl0k
   3uAIT6oiIGiByrGIsL+vtrhk/HXLgZ2ObNZokikwURf49nB9cuqzSjaSU
   sHHzi4ayPvumKAgtrohs107uq5MK5YxWhbXplg/XAPZFNSU3E9lSo/lxF
   FH56rKXDmXP0UJ2/37NtFrCV2oa3dijlL0hTHSsGrY1nd7538jfRpM14O
   8wu8tPcaLgdu/enG6CGN5zjGDwZQ4ltHL0AVdQRCaocsxoQb0N/pCP05p
   rUb/gxSCD9+eKAfqp9/ONDea7JBVtr0yMIY7hr2ssC/2kAw6Ens8rA1tM
   g==;
X-CSE-ConnectionGUID: bNLfRnDaSQKQ596ZJRl3/A==
X-CSE-MsgGUID: XWlahMiTSyegzlbVJV3ERg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45324590"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="45324590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:12:23 -0800
X-CSE-ConnectionGUID: n/7A5c9SSSuYNEvNmUxR7Q==
X-CSE-MsgGUID: AJk3vUTAQq2A8O/mq/lezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96675033"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2024 10:12:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMWcl-000D83-2R;
	Sat, 14 Dec 2024 18:12:19 +0000
Date: Sun, 15 Dec 2024 02:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:ipsec-fixes 5/5]
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1758:10: error:
 incompatible pointer types assigning to '__be32 *' (aka 'unsigned int *')
 from '__be32 (*)[4]' (aka 'unsigned int (*)[4]')
Message-ID: <202412150253.vejuRmav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git ipsec-fixes
head:   839c93393a929a87810d251d9994d1a5a069bc3f
commit: 839c93393a929a87810d251d9994d1a5a069bc3f [5/5] net/mlx5: Rely on reqid and destination address in IPsec tunnel mode
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241215/202412150253.vejuRmav-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150253.vejuRmav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150253.vejuRmav-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:4:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1758:10: error: incompatible pointer types assigning to '__be32 *' (aka 'unsigned int *') from '__be32 (*)[4]' (aka 'unsigned int (*)[4]') [-Werror,-Wincompatible-pointer-types]
    1758 |                         saddr = &attrs->saddr.a6;
         |                               ^ ~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +1758 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c

  1723	
  1724	static int tx_add_rule(struct mlx5e_ipsec_sa_entry *sa_entry)
  1725	{
  1726		struct mlx5_accel_esp_xfrm_attrs *attrs = &sa_entry->attrs;
  1727		struct mlx5_core_dev *mdev = mlx5e_ipsec_sa2dev(sa_entry);
  1728		struct mlx5e_ipsec *ipsec = sa_entry->ipsec;
  1729		struct mlx5_flow_destination dest[2];
  1730		struct mlx5_flow_act flow_act = {};
  1731		struct mlx5_flow_handle *rule;
  1732		struct mlx5_flow_spec *spec;
  1733		struct mlx5e_ipsec_tx *tx;
  1734		struct mlx5_fc *counter;
  1735		__be32 *saddr = NULL;
  1736		int err;
  1737	
  1738		tx = tx_ft_get(mdev, ipsec, attrs->type);
  1739		if (IS_ERR(tx))
  1740			return PTR_ERR(tx);
  1741	
  1742		spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
  1743		if (!spec) {
  1744			err = -ENOMEM;
  1745			goto err_alloc;
  1746		}
  1747	
  1748		switch (attrs->type) {
  1749		case XFRM_DEV_OFFLOAD_PACKET:
  1750			if (attrs->mode == XFRM_MODE_TUNNEL)
  1751				/* We rely on reqid and destination address */
  1752				break;
  1753			fallthrough;
  1754		case XFRM_DEV_OFFLOAD_CRYPTO:
  1755			if (attrs->family == AF_INET)
  1756				saddr = &attrs->saddr.a4;
  1757			else
> 1758				saddr = &attrs->saddr.a6;
  1759			break;
  1760		default:
  1761			break;
  1762		}
  1763	
  1764		if (attrs->family == AF_INET)
  1765			setup_fte_addr4(spec, saddr, &attrs->daddr.a4);
  1766		else
  1767			setup_fte_addr6(spec, saddr, attrs->daddr.a6);
  1768	
  1769		setup_fte_no_frags(spec);
  1770		setup_fte_upper_proto_match(spec, &attrs->upspec);
  1771	
  1772		switch (attrs->type) {
  1773		case XFRM_DEV_OFFLOAD_CRYPTO:
  1774			setup_fte_spi(spec, attrs->spi, false);
  1775			setup_fte_esp(spec);
  1776			setup_fte_reg_a(spec);
  1777			break;
  1778		case XFRM_DEV_OFFLOAD_PACKET:
  1779			if (attrs->reqid)
  1780				setup_fte_reg_c4(spec, attrs->reqid);
  1781			err = setup_pkt_reformat(ipsec, attrs, &flow_act);
  1782			if (err)
  1783				goto err_pkt_reformat;
  1784			break;
  1785		default:
  1786			break;
  1787		}
  1788	
  1789		counter = mlx5_fc_create(mdev, true);
  1790		if (IS_ERR(counter)) {
  1791			err = PTR_ERR(counter);
  1792			goto err_add_cnt;
  1793		}
  1794	
  1795		flow_act.crypto.type = MLX5_FLOW_CONTEXT_ENCRYPT_DECRYPT_TYPE_IPSEC;
  1796		flow_act.crypto.obj_id = sa_entry->ipsec_obj_id;
  1797		flow_act.flags |= FLOW_ACT_NO_APPEND;
  1798		flow_act.action |= MLX5_FLOW_CONTEXT_ACTION_CRYPTO_ENCRYPT |
  1799				   MLX5_FLOW_CONTEXT_ACTION_COUNT;
  1800		if (attrs->drop)
  1801			flow_act.action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
  1802		else
  1803			flow_act.action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
  1804	
  1805		dest[0].ft = tx->ft.status;
  1806		dest[0].type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
  1807		dest[1].type = MLX5_FLOW_DESTINATION_TYPE_COUNTER;
  1808		dest[1].counter_id = mlx5_fc_id(counter);
  1809		rule = mlx5_add_flow_rules(tx->ft.sa, spec, &flow_act, dest, 2);
  1810		if (IS_ERR(rule)) {
  1811			err = PTR_ERR(rule);
  1812			mlx5_core_err(mdev, "fail to add TX ipsec rule err=%d\n", err);
  1813			goto err_add_flow;
  1814		}
  1815	
  1816		kvfree(spec);
  1817		sa_entry->ipsec_rule.rule = rule;
  1818		sa_entry->ipsec_rule.fc = counter;
  1819		sa_entry->ipsec_rule.pkt_reformat = flow_act.pkt_reformat;
  1820		return 0;
  1821	
  1822	err_add_flow:
  1823		mlx5_fc_destroy(mdev, counter);
  1824	err_add_cnt:
  1825		if (flow_act.pkt_reformat)
  1826			mlx5_packet_reformat_dealloc(mdev, flow_act.pkt_reformat);
  1827	err_pkt_reformat:
  1828		kvfree(spec);
  1829	err_alloc:
  1830		tx_ft_put(ipsec, attrs->type);
  1831		return err;
  1832	}
  1833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
