Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7E1FD0;
	Mon, 17 Jul 2023 05:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689572146; x=1721108146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9B2M/3cg2tq8HNf0NOx+6XOiY4kdu5T2eSpvLjMO6Gk=;
  b=P1wDV/6udBwgmDe3nbAjTXfHlRRU03GUiDg8v+39xTgGUqWJFeVJROgD
   wsdX7huYnJQpuPxBjzgbSxpOaefG1cXGuBKMcP/Asx35TADl3EO4EmxIj
   gOc0xdEWobJVrvdZXHhfh1xscXzSdsGBiFSWTbWDvRRVdqNp0ANPwkg2/
   rqTknZ+/TbVGOXOJoXYdRPzhiXgXdd/47xnhAjoSdRkKMzcU6010kHg75
   V5n7xiVcfQ4An5RCBo8F6e9Q4MU/NCgB+GWNzml7s3AuCdAenB5nz7hPV
   LQ7X74uZzN3lrbICVKXT7IwyK4ulK5T1gwBOHqqMUpjGBqNU7b9DOdtK1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="368488229"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368488229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 22:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="723078564"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="723078564"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2023 22:35:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLGta-0009Cm-27;
	Mon, 17 Jul 2023 05:35:42 +0000
Date: Mon, 17 Jul 2023 13:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Lin <chen45464546@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 773/9999]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1325:23: warning: result of
 comparison of constant 65536 with expression of type 'u16' (aka 'unsigned
 short') is always true
Message-ID: <202307171357.ThNnuYPO-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: fcba12a4308143f1f1dcb0face8b3ffb51edcc5c [773/9999] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
config: arm64-randconfig-r001-20230717 (https://download.01.org/0day-ci/archive/20230717/202307171357.ThNnuYPO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171357.ThNnuYPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171357.ThNnuYPO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1325:23: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    1325 |                 if (ring->frag_size <= PAGE_SIZE)
         |                     ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1742:23: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    1742 |                 if (ring->frag_size <= PAGE_SIZE)
         |                     ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   2 warnings generated.


vim +1325 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1277	
  1278	static int mtk_poll_rx(struct napi_struct *napi, int budget,
  1279			       struct mtk_eth *eth)
  1280	{
  1281		struct dim_sample dim_sample = {};
  1282		struct mtk_rx_ring *ring;
  1283		int idx;
  1284		struct sk_buff *skb;
  1285		u8 *data, *new_data;
  1286		struct mtk_rx_dma *rxd, trxd;
  1287		int done = 0, bytes = 0;
  1288	
  1289		while (done < budget) {
  1290			struct net_device *netdev;
  1291			unsigned int pktlen;
  1292			dma_addr_t dma_addr;
  1293			u32 hash;
  1294			int mac;
  1295	
  1296			ring = mtk_get_rx_ring(eth);
  1297			if (unlikely(!ring))
  1298				goto rx_done;
  1299	
  1300			idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
  1301			rxd = &ring->dma[idx];
  1302			data = ring->data[idx];
  1303	
  1304			if (!mtk_rx_get_desc(&trxd, rxd))
  1305				break;
  1306	
  1307			/* find out which mac the packet come from. values start at 1 */
  1308			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) ||
  1309			    (trxd.rxd4 & RX_DMA_SPECIAL_TAG))
  1310				mac = 0;
  1311			else
  1312				mac = ((trxd.rxd4 >> RX_DMA_FPORT_SHIFT) &
  1313				       RX_DMA_FPORT_MASK) - 1;
  1314	
  1315			if (unlikely(mac < 0 || mac >= MTK_MAC_COUNT ||
  1316				     !eth->netdev[mac]))
  1317				goto release_desc;
  1318	
  1319			netdev = eth->netdev[mac];
  1320	
  1321			if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
  1322				goto release_desc;
  1323	
  1324			/* alloc new buffer */
> 1325			if (ring->frag_size <= PAGE_SIZE)
  1326				new_data = napi_alloc_frag(ring->frag_size);
  1327			else
  1328				new_data = mtk_max_lro_buf_alloc(GFP_ATOMIC);
  1329			if (unlikely(!new_data)) {
  1330				netdev->stats.rx_dropped++;
  1331				goto release_desc;
  1332			}
  1333			dma_addr = dma_map_single(eth->dev,
  1334						  new_data + NET_SKB_PAD +
  1335						  eth->ip_align,
  1336						  ring->buf_size,
  1337						  DMA_FROM_DEVICE);
  1338			if (unlikely(dma_mapping_error(eth->dev, dma_addr))) {
  1339				skb_free_frag(new_data);
  1340				netdev->stats.rx_dropped++;
  1341				goto release_desc;
  1342			}
  1343	
  1344			dma_unmap_single(eth->dev, trxd.rxd1,
  1345					 ring->buf_size, DMA_FROM_DEVICE);
  1346	
  1347			/* receive data */
  1348			skb = build_skb(data, ring->frag_size);
  1349			if (unlikely(!skb)) {
  1350				skb_free_frag(data);
  1351				netdev->stats.rx_dropped++;
  1352				goto skip_rx;
  1353			}
  1354			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
  1355	
  1356			pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
  1357			skb->dev = netdev;
  1358			skb_put(skb, pktlen);
  1359			if (trxd.rxd4 & eth->rx_dma_l4_valid)
  1360				skb->ip_summed = CHECKSUM_UNNECESSARY;
  1361			else
  1362				skb_checksum_none_assert(skb);
  1363			skb->protocol = eth_type_trans(skb, netdev);
  1364			bytes += pktlen;
  1365	
  1366			hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
  1367			if (hash != MTK_RXD4_FOE_ENTRY) {
  1368				hash = jhash_1word(hash, 0);
  1369				skb_set_hash(skb, hash, PKT_HASH_TYPE_L4);
  1370			}
  1371	
  1372			if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
  1373			    (trxd.rxd2 & RX_DMA_VTAG))
  1374				__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
  1375						       RX_DMA_VID(trxd.rxd3));
  1376			skb_record_rx_queue(skb, 0);
  1377			napi_gro_receive(napi, skb);
  1378	
  1379	skip_rx:
  1380			ring->data[idx] = new_data;
  1381			rxd->rxd1 = (unsigned int)dma_addr;
  1382	
  1383	release_desc:
  1384			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  1385				rxd->rxd2 = RX_DMA_LSO;
  1386			else
  1387				rxd->rxd2 = RX_DMA_PLEN0(ring->buf_size);
  1388	
  1389			ring->calc_idx = idx;
  1390	
  1391			done++;
  1392		}
  1393	
  1394	rx_done:
  1395		if (done) {
  1396			/* make sure that all changes to the dma ring are flushed before
  1397			 * we continue
  1398			 */
  1399			wmb();
  1400			mtk_update_rx_cpu_idx(eth);
  1401		}
  1402	
  1403		eth->rx_packets += done;
  1404		eth->rx_bytes += bytes;
  1405		dim_update_sample(eth->rx_events, eth->rx_packets, eth->rx_bytes,
  1406				  &dim_sample);
  1407		net_dim(&eth->rx_dim, dim_sample);
  1408	
  1409		return done;
  1410	}
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
