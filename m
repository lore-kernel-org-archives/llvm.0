Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678E210EC
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 04:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657425954; x=1688961954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axb0Ra840yThWSAkPT/410YLKRy8qie48JJJlqlmEwE=;
  b=ZXSgh5iwCnCwPFEYWLdu2/MVLXRfB6O/v/iy8k3njw+0Y8pXGPlTAd5f
   99FzPR8kbZWoSdN9N3JQSWH/3EBiNYoNY7Qk/KTPH9f4Dyica/jmQzZeq
   Rs3jgfNJvP2vZhnH0qwyaIETgePmjGT6YKl1lhMA2BzAeVfCxIcbPqbY2
   LOffUHl2IwzVe8J6fscOmykKlplVgkjGDHes6qOhOZkes1cGqiK1XmfvV
   VYmZXeCeTKZdAkFhZld2bIjW4TARwEUZyYA8eSls/MjgswRX3MNU1Y4Cl
   X2aYrjXLvvnMTRwD6om1xR3WqLwbOpUD1ff7yuLa488PwU79RTipWRf8T
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="310074523"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="310074523"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 21:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="544633741"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jul 2022 21:05:51 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAOCc-000PSA-Th;
	Sun, 10 Jul 2022 04:05:50 +0000
Date: Sun, 10 Jul 2022 12:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Lin <chen45464546@163.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:1481:23: warning: result
 of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned
 short') is always true
Message-ID: <202207101201.EC6ie6ln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
commit: 2f2c0d2919a14002760f89f4e02960c735a316d2 net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
date:   4 weeks ago
config: arm64-randconfig-r003-20220710 (https://download.01.org/0day-ci/archive/20220710/202207101201.EC6ie6ln-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c0d2919a14002760f89f4e02960c735a316d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f2c0d2919a14002760f89f4e02960c735a316d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/mediatek/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1481:23: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
                   if (ring->frag_size <= PAGE_SIZE)
                       ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1931:23: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
                   if (ring->frag_size <= PAGE_SIZE)
                       ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   2 warnings generated.


vim +1481 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1434	
  1435	static int mtk_poll_rx(struct napi_struct *napi, int budget,
  1436			       struct mtk_eth *eth)
  1437	{
  1438		struct dim_sample dim_sample = {};
  1439		struct mtk_rx_ring *ring;
  1440		int idx;
  1441		struct sk_buff *skb;
  1442		u8 *data, *new_data;
  1443		struct mtk_rx_dma_v2 *rxd, trxd;
  1444		int done = 0, bytes = 0;
  1445	
  1446		while (done < budget) {
  1447			struct net_device *netdev;
  1448			unsigned int pktlen;
  1449			dma_addr_t dma_addr;
  1450			u32 hash, reason;
  1451			int mac = 0;
  1452	
  1453			ring = mtk_get_rx_ring(eth);
  1454			if (unlikely(!ring))
  1455				goto rx_done;
  1456	
  1457			idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
  1458			rxd = ring->dma + idx * eth->soc->txrx.rxd_size;
  1459			data = ring->data[idx];
  1460	
  1461			if (!mtk_rx_get_desc(eth, &trxd, rxd))
  1462				break;
  1463	
  1464			/* find out which mac the packet come from. values start at 1 */
  1465			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
  1466				mac = RX_DMA_GET_SPORT_V2(trxd.rxd5) - 1;
  1467			else if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
  1468				 !(trxd.rxd4 & RX_DMA_SPECIAL_TAG))
  1469				mac = RX_DMA_GET_SPORT(trxd.rxd4) - 1;
  1470	
  1471			if (unlikely(mac < 0 || mac >= MTK_MAC_COUNT ||
  1472				     !eth->netdev[mac]))
  1473				goto release_desc;
  1474	
  1475			netdev = eth->netdev[mac];
  1476	
  1477			if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
  1478				goto release_desc;
  1479	
  1480			/* alloc new buffer */
> 1481			if (ring->frag_size <= PAGE_SIZE)
  1482				new_data = napi_alloc_frag(ring->frag_size);
  1483			else
  1484				new_data = mtk_max_lro_buf_alloc(GFP_ATOMIC);
  1485			if (unlikely(!new_data)) {
  1486				netdev->stats.rx_dropped++;
  1487				goto release_desc;
  1488			}
  1489			dma_addr = dma_map_single(eth->dma_dev,
  1490						  new_data + NET_SKB_PAD +
  1491						  eth->ip_align,
  1492						  ring->buf_size,
  1493						  DMA_FROM_DEVICE);
  1494			if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr))) {
  1495				skb_free_frag(new_data);
  1496				netdev->stats.rx_dropped++;
  1497				goto release_desc;
  1498			}
  1499	
  1500			dma_unmap_single(eth->dma_dev, trxd.rxd1,
  1501					 ring->buf_size, DMA_FROM_DEVICE);
  1502	
  1503			/* receive data */
  1504			skb = build_skb(data, ring->frag_size);
  1505			if (unlikely(!skb)) {
  1506				skb_free_frag(data);
  1507				netdev->stats.rx_dropped++;
  1508				goto skip_rx;
  1509			}
  1510			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
  1511	
  1512			pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
  1513			skb->dev = netdev;
  1514			skb_put(skb, pktlen);
  1515			if (trxd.rxd4 & eth->soc->txrx.rx_dma_l4_valid)
  1516				skb->ip_summed = CHECKSUM_UNNECESSARY;
  1517			else
  1518				skb_checksum_none_assert(skb);
  1519			skb->protocol = eth_type_trans(skb, netdev);
  1520			bytes += pktlen;
  1521	
  1522			hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
  1523			if (hash != MTK_RXD4_FOE_ENTRY) {
  1524				hash = jhash_1word(hash, 0);
  1525				skb_set_hash(skb, hash, PKT_HASH_TYPE_L4);
  1526			}
  1527	
  1528			reason = FIELD_GET(MTK_RXD4_PPE_CPU_REASON, trxd.rxd4);
  1529			if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
  1530				mtk_ppe_check_skb(eth->ppe, skb,
  1531						  trxd.rxd4 & MTK_RXD4_FOE_ENTRY);
  1532	
  1533			if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
  1534				if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
  1535					if (trxd.rxd3 & RX_DMA_VTAG_V2)
  1536						__vlan_hwaccel_put_tag(skb,
  1537							htons(RX_DMA_VPID(trxd.rxd4)),
  1538							RX_DMA_VID(trxd.rxd4));
  1539				} else if (trxd.rxd2 & RX_DMA_VTAG) {
  1540					__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
  1541							       RX_DMA_VID(trxd.rxd3));
  1542				}
  1543	
  1544				/* If the device is attached to a dsa switch, the special
  1545				 * tag inserted in VLAN field by hw switch can * be offloaded
  1546				 * by RX HW VLAN offload. Clear vlan info.
  1547				 */
  1548				if (netdev_uses_dsa(netdev))
  1549					__vlan_hwaccel_clear_tag(skb);
  1550			}
  1551	
  1552			skb_record_rx_queue(skb, 0);
  1553			napi_gro_receive(napi, skb);
  1554	
  1555	skip_rx:
  1556			ring->data[idx] = new_data;
  1557			rxd->rxd1 = (unsigned int)dma_addr;
  1558	
  1559	release_desc:
  1560			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  1561				rxd->rxd2 = RX_DMA_LSO;
  1562			else
  1563				rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
  1564	
  1565			ring->calc_idx = idx;
  1566	
  1567			done++;
  1568		}
  1569	
  1570	rx_done:
  1571		if (done) {
  1572			/* make sure that all changes to the dma ring are flushed before
  1573			 * we continue
  1574			 */
  1575			wmb();
  1576			mtk_update_rx_cpu_idx(eth);
  1577		}
  1578	
  1579		eth->rx_packets += done;
  1580		eth->rx_bytes += bytes;
  1581		dim_update_sample(eth->rx_events, eth->rx_packets, eth->rx_bytes,
  1582				  &dim_sample);
  1583		net_dim(&eth->rx_dim, dim_sample);
  1584	
  1585		return done;
  1586	}
  1587	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
