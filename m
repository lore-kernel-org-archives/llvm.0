Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B62DB7A7;
	Tue,  3 Feb 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770084100; cv=none; b=Us7tyBLDnpQOPVZ9iv1kVXlbRAmS6eRBsYSvvh58+rUlezedyMKmimhO4+/cvJ2V/uNsGJ3xiVcK0ocgB51yd/M9xKvdroapjCMD84LX+h5Nnn1V9I54BjZkYCT9LClaJg6LA6cAWUN7Z4yxP9zLIi+CNlYhu36I8bXaDnQrSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770084100; c=relaxed/simple;
	bh=0/F0Q6VxLD/CwtBHXGBoWzfJ29ElsDgYnGFeBji2yoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Onlp6i1UNqO5oOUs+Z4/xU9/hRDzY/sLgL+mmIDcgu25aIXQnHfUygmpM+llmuZbJ8MCl0nJizdWCa+wGYWrVW91U0O/MT2omicTDvhW1Wxzbv/NhC95KWAbUeqzQO7dZbMLRXkxzS0rSk/0JpnYgADZ0gq6Lw5BIgdKRTOIfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMQ3QPyu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMQ3QPyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770084098; x=1801620098;
  h=date:from:to:cc:subject:message-id;
  bh=0/F0Q6VxLD/CwtBHXGBoWzfJ29ElsDgYnGFeBji2yoE=;
  b=AMQ3QPyuVCr3DzvT5JhFVq1reGUmVolywB9fTqfjsR8U8lnkVH7A7shX
   nDf281rDdWTcrx5XbtD6z6VEJpuJaRdxgp9va/EWzwouY+1oVLs/8/cSw
   3c+C9s/pljzk5pN5zOGfxvCTHADXh7Fe5TmNToerJUlzQEiK6PkYjvgi1
   ZM7MzbOkyI5thww53FM7ytyyULVTxj524rUPOhJ5N3cK9LmTXwJ5WbYmG
   fw1fjeEAy1l/HJ4HBUbBJ5rP947vi8OOYcRuG9kIfzIQpDojxmqxqUisa
   LjUy96EZptR5pLIOTfFzmJJuSE0TvTzRilnEN1uWw9pGOBYYAThOcCpGB
   Q==;
X-CSE-ConnectionGUID: 70sGTj67StuYuJRWBpropQ==
X-CSE-MsgGUID: /NaK5N5SRtmgDQLWarYWqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71150690"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71150690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:01:38 -0800
X-CSE-ConnectionGUID: HS9ruX3ATTq3iNQmolj0yA==
X-CSE-MsgGUID: I/DF07wpTtSU5iBa80GD3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="240368931"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2026 18:01:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn5jR-00000000g8k-0PUn;
	Tue, 03 Feb 2026 02:01:33 +0000
Date: Tue, 03 Feb 2026 10:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Mikityanska <alice@isovalent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:alice/vxlan-bigtcp-part1 11/11]
 drivers/net/ethernet/broadcom/bnge/bnge_txrx.c:1466:15: error: call to
 undeclared function 'ipv6_hopopt_jumbo_remove'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602031000.qJXkT65Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git alice/vxlan-bigtcp-part1
head:   62d00a11d3571396b90e03bd46e5b3b6655dcf57
commit: 62d00a11d3571396b90e03bd46e5b3b6655dcf57 [11/11] net/ipv6: Remove HBH helpers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602031000.qJXkT65Q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031000.qJXkT65Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031000.qJXkT65Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnge/bnge_txrx.c:1466:15: error: call to undeclared function 'ipv6_hopopt_jumbo_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1466 |         if (unlikely(ipv6_hopopt_jumbo_remove(skb)))
         |                      ^
   1 error generated.


vim +/ipv6_hopopt_jumbo_remove +1466 drivers/net/ethernet/broadcom/bnge/bnge_txrx.c

bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1432  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1433  netdev_tx_t bnge_start_xmit(struct sk_buff *skb, struct net_device *dev)
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1434  {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1435  	u32 len, free_size, vlan_tag_flags, cfa_action, flags;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1436  	struct bnge_net *bn = netdev_priv(dev);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1437  	struct bnge_tx_ring_info *txr;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1438  	struct bnge_dev *bd = bn->bd;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1439  	struct bnge_sw_tx_bd *tx_buf;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1440  	struct tx_bd *txbd, *txbd0;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1441  	struct netdev_queue *txq;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1442  	struct tx_bd_ext *txbd1;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1443  	u16 prod, last_frag;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1444  	unsigned int length;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1445  	dma_addr_t mapping;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1446  	__le32 lflags = 0;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1447  	skb_frag_t *frag;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1448  	int i;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1449  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1450  	i = skb_get_queue_mapping(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1451  	txq = netdev_get_tx_queue(dev, i);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1452  	txr = &bn->tx_ring[bn->tx_ring_map[i]];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1453  	prod = txr->tx_prod;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1454  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1455  	free_size = bnge_tx_avail(bn, txr);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1456  	if (unlikely(free_size < skb_shinfo(skb)->nr_frags + 2)) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1457  		/* We must have raced with NAPI cleanup */
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1458  		if (net_ratelimit() && txr->kick_pending)
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1459  			netif_warn(bn, tx_err, dev,
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1460  				   "bnge: ring busy w/ flush pending!\n");
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1461  		if (!netif_txq_try_stop(txq, bnge_tx_avail(bn, txr),
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1462  					bn->tx_wake_thresh))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1463  			return NETDEV_TX_BUSY;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1464  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1465  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29 @1466  	if (unlikely(ipv6_hopopt_jumbo_remove(skb)))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1467  		goto tx_free;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1468  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1469  	last_frag = skb_shinfo(skb)->nr_frags;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1470  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1471  	txbd = &txr->tx_desc_ring[TX_RING(bn, prod)][TX_IDX(prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1472  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1473  	tx_buf = &txr->tx_buf_ring[SW_TX_RING(bn, prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1474  	tx_buf->skb = skb;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1475  	tx_buf->nr_frags = last_frag;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1476  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1477  	vlan_tag_flags = 0;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1478  	cfa_action = bnge_xmit_get_cfa_action(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1479  	if (skb_vlan_tag_present(skb)) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1480  		vlan_tag_flags = TX_BD_CFA_META_KEY_VLAN |
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1481  				 skb_vlan_tag_get(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1482  		/* Currently supports 8021Q, 8021AD vlan offloads
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1483  		 * QINQ1, QINQ2, QINQ3 vlan headers are deprecated
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1484  		 */
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1485  		if (skb->vlan_proto == htons(ETH_P_8021Q))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1486  			vlan_tag_flags |= 1 << TX_BD_CFA_META_TPID_SHIFT;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1487  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1488  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1489  	if (unlikely(skb->no_fcs))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1490  		lflags |= cpu_to_le32(TX_BD_FLAGS_NO_CRC);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1491  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1492  	if (eth_skb_pad(skb))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1493  		goto tx_kick_pending;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1494  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1495  	len = skb_headlen(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1496  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1497  	mapping = dma_map_single(bd->dev, skb->data, len, DMA_TO_DEVICE);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1498  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1499  	if (unlikely(dma_mapping_error(bd->dev, mapping)))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1500  		goto tx_free;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1501  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1502  	dma_unmap_addr_set(tx_buf, mapping, mapping);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1503  	flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1504  		TX_BD_CNT(last_frag + 2);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1505  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1506  	txbd->tx_bd_haddr = cpu_to_le64(mapping);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1507  	txbd->tx_bd_opaque = SET_TX_OPAQUE(bn, txr, prod, 2 + last_frag);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1508  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1509  	prod = NEXT_TX(prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1510  	txbd1 = (struct tx_bd_ext *)
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1511  		&txr->tx_desc_ring[TX_RING(bn, prod)][TX_IDX(prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1512  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1513  	if (skb_is_gso(skb)) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1514  		u32 hdr_len = bnge_get_gso_hdr_len(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1515  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1516  		lflags |= cpu_to_le32(TX_BD_FLAGS_LSO | TX_BD_FLAGS_T_IPID |
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1517  				      (hdr_len << (TX_BD_HSIZE_SHIFT - 1)));
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1518  		length = skb_shinfo(skb)->gso_size;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1519  		txbd1->tx_bd_mss = cpu_to_le32(length);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1520  		length += hdr_len;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1521  	} else {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1522  		length = skb->len;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1523  		if (skb->ip_summed == CHECKSUM_PARTIAL) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1524  			lflags |= cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1525  			txbd1->tx_bd_mss = 0;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1526  		}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1527  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1528  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1529  	flags |= bnge_lhint_arr[length >> 9];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1530  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1531  	txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1532  	txbd1->tx_bd_hsize_lflags = lflags;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1533  	txbd1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1534  	txbd1->tx_bd_cfa_action =
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1535  			cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1536  	txbd0 = txbd;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1537  	for (i = 0; i < last_frag; i++) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1538  		frag = &skb_shinfo(skb)->frags[i];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1539  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1540  		prod = NEXT_TX(prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1541  		txbd = &txr->tx_desc_ring[TX_RING(bn, prod)][TX_IDX(prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1542  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1543  		len = skb_frag_size(frag);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1544  		mapping = skb_frag_dma_map(bd->dev, frag, 0, len,
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1545  					   DMA_TO_DEVICE);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1546  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1547  		if (unlikely(dma_mapping_error(bd->dev, mapping)))
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1548  			goto tx_dma_error;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1549  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1550  		tx_buf = &txr->tx_buf_ring[SW_TX_RING(bn, prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1551  		netmem_dma_unmap_addr_set(skb_frag_netmem(frag), tx_buf,
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1552  					  mapping, mapping);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1553  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1554  		txbd->tx_bd_haddr = cpu_to_le64(mapping);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1555  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1556  		flags = len << TX_BD_LEN_SHIFT;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1557  		txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1558  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1559  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1560  	flags &= ~TX_BD_LEN;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1561  	txbd->tx_bd_len_flags_type =
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1562  		cpu_to_le32(((len) << TX_BD_LEN_SHIFT) | flags |
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1563  			    TX_BD_FLAGS_PACKET_END);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1564  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1565  	netdev_tx_sent_queue(txq, skb->len);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1566  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1567  	prod = NEXT_TX(prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1568  	WRITE_ONCE(txr->tx_prod, prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1569  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1570  	if (!netdev_xmit_more() || netif_xmit_stopped(txq)) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1571  		bnge_txr_db_kick(bn, txr, prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1572  	} else {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1573  		if (free_size >= bn->tx_wake_thresh)
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1574  			txbd0->tx_bd_len_flags_type |=
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1575  				cpu_to_le32(TX_BD_FLAGS_NO_CMPL);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1576  		txr->kick_pending = 1;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1577  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1578  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1579  	if (unlikely(bnge_tx_avail(bn, txr) <= MAX_SKB_FRAGS + 1)) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1580  		if (netdev_xmit_more()) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1581  			txbd0->tx_bd_len_flags_type &=
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1582  				cpu_to_le32(~TX_BD_FLAGS_NO_CMPL);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1583  			bnge_txr_db_kick(bn, txr, prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1584  		}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1585  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1586  		netif_txq_try_stop(txq, bnge_tx_avail(bn, txr),
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1587  				   bn->tx_wake_thresh);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1588  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1589  	return NETDEV_TX_OK;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1590  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1591  tx_dma_error:
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1592  	last_frag = i;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1593  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1594  	/* start back at beginning and unmap skb */
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1595  	prod = txr->tx_prod;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1596  	tx_buf = &txr->tx_buf_ring[SW_TX_RING(bn, prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1597  	dma_unmap_single(bd->dev, dma_unmap_addr(tx_buf, mapping),
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1598  			 skb_headlen(skb), DMA_TO_DEVICE);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1599  	prod = NEXT_TX(prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1600  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1601  	/* unmap remaining mapped pages */
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1602  	for (i = 0; i < last_frag; i++) {
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1603  		prod = NEXT_TX(prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1604  		tx_buf = &txr->tx_buf_ring[SW_TX_RING(bn, prod)];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1605  		frag = &skb_shinfo(skb)->frags[i];
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1606  		netmem_dma_unmap_page_attrs(bd->dev,
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1607  					    dma_unmap_addr(tx_buf, mapping),
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1608  					    skb_frag_size(frag),
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1609  					    DMA_TO_DEVICE, 0);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1610  	}
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1611  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1612  tx_free:
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1613  	dev_kfree_skb_any(skb);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1614  
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1615  tx_kick_pending:
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1616  	if (txr->kick_pending)
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1617  		bnge_txr_db_kick(bn, txr, txr->tx_prod);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1618  	txr->tx_buf_ring[SW_TX_RING(bn, txr->tx_prod)].skb = NULL;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1619  	dev_core_stats_tx_dropped_inc(dev);
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1620  	return NETDEV_TX_OK;
bd5ad9c052c855 Bhargava Marreddy 2026-01-29  1621  }
5deaeae186b4e3 Bhargava Marreddy 2026-01-29  1622  

:::::: The code at line 1466 was first introduced by commit
:::::: bd5ad9c052c855c0c8a0e98f5405a22f5887b298 bng_en: Add TX support

:::::: TO: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
