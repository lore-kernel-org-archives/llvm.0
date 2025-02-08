Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC91F1815;
	Sat,  8 Feb 2025 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032711; cv=none; b=jqm7Kn1I3vtW7umwWD91RqaS79G1q5PKGw00fF5a44Hb1RtU2k+d3ltOrSd0Qcyfwz8TkXdezKoH+QfuNexL1s06m9HOwOTPChZS3lFzyFYCD2dZ4EYTsmI3EQC2vQckoV2hCmU3n/LPtOeFSKtCmKzFAXQZ5aCvonBhuIFnWCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032711; c=relaxed/simple;
	bh=pSJ308QV31e+p6/3x+d1OCB2BulDmPH+FauHgK+JZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXDe3ohzjOmuFLkjhaTDMu9OoRf5kBT2hv6g2zu60cbobpSY4OuWg83TRG4u+K8ecwfsKa3VJEcKHtG83cyGqtToFxGrEPlrmSemrn/thPGXuMem/HeSf1hsEK7+M6ddGmEIMNjSvMHawtEHJ82IUoshrLQh2uhuWceGr8l3Puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIpD07rm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIpD07rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739032710; x=1770568710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSJ308QV31e+p6/3x+d1OCB2BulDmPH+FauHgK+JZjo=;
  b=WIpD07rmtJAg8YNnB63/UeFFBhPlfvO1OPLubLmOPXyc51Qe7Bn7mz8e
   ok6rciuAeMcTSmjGAo70nOkNLX2E5a8K8J9kq4Abu7BmYNTMwjfXaJN5K
   d7ngLywtfi2SA+2a+xtE9OGyZM7eFIAw/ABNFe7CDT43LOsPX5mU4GeRb
   ybjCuwpfxvikonoqZzNI7h5Gb1jTZcPt0QVDxY3iXxALUbK9U3yPQV1pS
   12F72K46n+YIa1GBTo9TmIfP/YYwE6mS2ZaNqEybkCIEfpmnrWleaSVUK
   baH3hculk0nqG3vH7J4fn6eqn8nlOowBOWyJULvfrwqSJOcdolzp9rUqu
   w==;
X-CSE-ConnectionGUID: QUZImiVaSSK6jpZy7uxmYw==
X-CSE-MsgGUID: KU0QQJalTpexh2HjKQnGEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="42503385"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="42503385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:38:29 -0800
X-CSE-ConnectionGUID: RWi49MwiQ7645PEkaMcozA==
X-CSE-MsgGUID: vm84HpQvR9egP6SVw5E+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112687474"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 08:38:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnqb-0010MF-02;
	Sat, 08 Feb 2025 16:38:25 +0000
Date: Sun, 9 Feb 2025 00:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-xdp-fixes 2/4]
 drivers/net/ethernet/ti/am65-cpsw-nuss.c:1331:15: warning: variable 'skb' is
 uninitialized when used here
Message-ID: <202502090051.nrnZ1Q3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-xdp-fixes
head:   414121e93990e4e8425ecd9e834b2a99dfffa9d5
commit: a949c33d5bf38077bf26b4e66d9d9832c3e6668c [2/4] net: ethernet: ti: am65-cpsw: fix memleak in certain XDP cases
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502090051.nrnZ1Q3T-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090051.nrnZ1Q3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090051.nrnZ1Q3T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/am65-cpsw-nuss.c:761:9: warning: cast to smaller integer type 'enum am65_cpsw_tx_buf_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
     761 |         return (enum am65_cpsw_tx_buf_type)k3_cppi_desc_pool_desc_info(tx_chn->desc_pool,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     762 |                                                                        desc_idx);
         |                                                                        ~~~~~~~~~
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:1331:15: warning: variable 'skb' is uninitialized when used here [-Wuninitialized]
    1331 |                 skb_reserve(skb, headroom);
         |                             ^~~
   drivers/net/ethernet/ti/am65-cpsw-nuss.c:1278:21: note: initialize the variable 'skb' to silence this warning
    1278 |         struct sk_buff *skb;
         |                            ^
         |                             = NULL
   2 warnings generated.


vim +/skb +1331 drivers/net/ethernet/ti/am65-cpsw-nuss.c

93a76530316a3d Grygorii Strashko   2020-03-24  1262  
da70d184a8c330 Roger Quadros       2024-09-10  1263  static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
da70d184a8c330 Roger Quadros       2024-09-10  1264  				     int cpu, int *xdp_state)
93a76530316a3d Grygorii Strashko   2020-03-24  1265  {
da70d184a8c330 Roger Quadros       2024-09-10  1266  	struct am65_cpsw_rx_chn *rx_chn = &flow->common->rx_chns;
93a76530316a3d Grygorii Strashko   2020-03-24  1267  	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
da70d184a8c330 Roger Quadros       2024-09-10  1268  	struct am65_cpsw_common *common = flow->common;
93a76530316a3d Grygorii Strashko   2020-03-24  1269  	struct am65_cpsw_ndev_priv *ndev_priv;
93a76530316a3d Grygorii Strashko   2020-03-24  1270  	struct cppi5_host_desc_t *desc_rx;
93a76530316a3d Grygorii Strashko   2020-03-24  1271  	struct device *dev = common->dev;
de794169cf1711 Roger Quadros       2024-11-01  1272  	struct am65_cpsw_swdata *swdata;
8acacc40f73375 Julien Panis        2024-04-12  1273  	struct page *page, *new_page;
93a76530316a3d Grygorii Strashko   2020-03-24  1274  	dma_addr_t desc_dma, buf_dma;
93a76530316a3d Grygorii Strashko   2020-03-24  1275  	struct am65_cpsw_port *port;
93a76530316a3d Grygorii Strashko   2020-03-24  1276  	struct net_device *ndev;
da70d184a8c330 Roger Quadros       2024-09-10  1277  	u32 flow_idx = flow->id;
8acacc40f73375 Julien Panis        2024-04-12  1278  	struct sk_buff *skb;
8acacc40f73375 Julien Panis        2024-04-12  1279  	struct xdp_buff	xdp;
de794169cf1711 Roger Quadros       2024-11-01  1280  	int headroom, ret;
8acacc40f73375 Julien Panis        2024-04-12  1281  	void *page_addr;
93a76530316a3d Grygorii Strashko   2020-03-24  1282  	u32 *psdata;
93a76530316a3d Grygorii Strashko   2020-03-24  1283  
5e24db550bd6f4 Roger Quadros       2024-08-29  1284  	*xdp_state = AM65_CPSW_XDP_PASS;
93a76530316a3d Grygorii Strashko   2020-03-24  1285  	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_idx, &desc_dma);
93a76530316a3d Grygorii Strashko   2020-03-24  1286  	if (ret) {
93a76530316a3d Grygorii Strashko   2020-03-24  1287  		if (ret != -ENODATA)
93a76530316a3d Grygorii Strashko   2020-03-24  1288  			dev_err(dev, "RX: pop chn fail %d\n", ret);
93a76530316a3d Grygorii Strashko   2020-03-24  1289  		return ret;
93a76530316a3d Grygorii Strashko   2020-03-24  1290  	}
93a76530316a3d Grygorii Strashko   2020-03-24  1291  
6a40e2890e6e1d Grygorii Strashko   2020-10-30  1292  	if (cppi5_desc_is_tdcm(desc_dma)) {
93a76530316a3d Grygorii Strashko   2020-03-24  1293  		dev_dbg(dev, "%s RX tdown flow: %u\n", __func__, flow_idx);
0ed577e7e8e508 Siddharth Vadapalli 2023-02-09  1294  		if (common->pdata.quirks & AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ)
0ed577e7e8e508 Siddharth Vadapalli 2023-02-09  1295  			complete(&common->tdown_complete);
93a76530316a3d Grygorii Strashko   2020-03-24  1296  		return 0;
93a76530316a3d Grygorii Strashko   2020-03-24  1297  	}
93a76530316a3d Grygorii Strashko   2020-03-24  1298  
93a76530316a3d Grygorii Strashko   2020-03-24  1299  	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
93a76530316a3d Grygorii Strashko   2020-03-24  1300  	dev_dbg(dev, "%s flow_idx: %u desc %pad\n",
93a76530316a3d Grygorii Strashko   2020-03-24  1301  		__func__, flow_idx, &desc_dma);
93a76530316a3d Grygorii Strashko   2020-03-24  1302  
93a76530316a3d Grygorii Strashko   2020-03-24  1303  	swdata = cppi5_hdesc_get_swdata(desc_rx);
de794169cf1711 Roger Quadros       2024-11-01  1304  	page = swdata->page;
de794169cf1711 Roger Quadros       2024-11-01  1305  	page_addr = page_address(page);
93a76530316a3d Grygorii Strashko   2020-03-24  1306  	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
39fd0547ee6666 Peter Ujfalusi      2021-01-15  1307  	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
93a76530316a3d Grygorii Strashko   2020-03-24  1308  	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
93a76530316a3d Grygorii Strashko   2020-03-24  1309  	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
93a76530316a3d Grygorii Strashko   2020-03-24  1310  	dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
93a76530316a3d Grygorii Strashko   2020-03-24  1311  	port = am65_common_get_port(common, port_id);
93a76530316a3d Grygorii Strashko   2020-03-24  1312  	ndev = port->ndev;
93a76530316a3d Grygorii Strashko   2020-03-24  1313  	psdata = cppi5_hdesc_get_psdata(desc_rx);
93a76530316a3d Grygorii Strashko   2020-03-24  1314  	csum_info = psdata[2];
93a76530316a3d Grygorii Strashko   2020-03-24  1315  	dev_dbg(dev, "%s rx csum_info:%#x\n", __func__, csum_info);
93a76530316a3d Grygorii Strashko   2020-03-24  1316  
ed569ed9b30a74 Peter Ujfalusi      2021-01-15  1317  	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
93a76530316a3d Grygorii Strashko   2020-03-24  1318  	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
93a76530316a3d Grygorii Strashko   2020-03-24  1319  
8acacc40f73375 Julien Panis        2024-04-12  1320  	if (port->xdp_prog) {
da70d184a8c330 Roger Quadros       2024-09-10  1321  		xdp_init_buff(&xdp, PAGE_SIZE, &port->xdp_rxq[flow->id]);
5e24db550bd6f4 Roger Quadros       2024-08-29  1322  		xdp_prepare_buff(&xdp, page_addr, AM65_CPSW_HEADROOM,
8acacc40f73375 Julien Panis        2024-04-12  1323  				 pkt_len, false);
de794169cf1711 Roger Quadros       2024-11-01  1324  		*xdp_state = am65_cpsw_run_xdp(flow, port, &xdp,
8acacc40f73375 Julien Panis        2024-04-12  1325  					       cpu, &pkt_len);
5e24db550bd6f4 Roger Quadros       2024-08-29  1326  		if (*xdp_state != AM65_CPSW_XDP_PASS)
5e24db550bd6f4 Roger Quadros       2024-08-29  1327  			goto allocate;
8acacc40f73375 Julien Panis        2024-04-12  1328  
8acacc40f73375 Julien Panis        2024-04-12  1329  		/* Compute additional headroom to be reserved */
8acacc40f73375 Julien Panis        2024-04-12  1330  		headroom = (xdp.data - xdp.data_hard_start) - skb_headroom(skb);
8acacc40f73375 Julien Panis        2024-04-12 @1331  		skb_reserve(skb, headroom);
8acacc40f73375 Julien Panis        2024-04-12  1332  	}
8acacc40f73375 Julien Panis        2024-04-12  1333  
a949c33d5bf380 Roger Quadros       2025-02-05  1334  	skb = am65_cpsw_build_skb(page_addr, ndev,
a949c33d5bf380 Roger Quadros       2025-02-05  1335  				  AM65_CPSW_MAX_PACKET_SIZE);
a949c33d5bf380 Roger Quadros       2025-02-05  1336  	if (unlikely(!skb)) {
a949c33d5bf380 Roger Quadros       2025-02-05  1337  		new_page = page;
a949c33d5bf380 Roger Quadros       2025-02-05  1338  		goto requeue;
a949c33d5bf380 Roger Quadros       2025-02-05  1339  	}
a949c33d5bf380 Roger Quadros       2025-02-05  1340  
86e8b070b25e3c Vignesh Raghavendra 2021-02-11  1341  	ndev_priv = netdev_priv(ndev);
86e8b070b25e3c Vignesh Raghavendra 2021-02-11  1342  	am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
93a76530316a3d Grygorii Strashko   2020-03-24  1343  	skb_put(skb, pkt_len);
c03a6fd398269e Chintan Vankar      2024-04-19  1344  	if (port->rx_ts_enabled)
c03a6fd398269e Chintan Vankar      2024-04-19  1345  		am65_cpts_rx_timestamp(common->cpts, skb);
8acacc40f73375 Julien Panis        2024-04-12  1346  	skb_mark_for_recycle(skb);
93a76530316a3d Grygorii Strashko   2020-03-24  1347  	skb->protocol = eth_type_trans(skb, ndev);
93a76530316a3d Grygorii Strashko   2020-03-24  1348  	am65_cpsw_nuss_rx_csum(skb, csum_info);
da70d184a8c330 Roger Quadros       2024-09-10  1349  	napi_gro_receive(&flow->napi_rx, skb);
93a76530316a3d Grygorii Strashko   2020-03-24  1350  
4a7b2ba94a59d1 Simon Horman        2024-10-10  1351  	dev_sw_netstats_rx_add(ndev, pkt_len);
8acacc40f73375 Julien Panis        2024-04-12  1352  
5e24db550bd6f4 Roger Quadros       2024-08-29  1353  allocate:
da70d184a8c330 Roger Quadros       2024-09-10  1354  	new_page = page_pool_dev_alloc_pages(flow->page_pool);
5e24db550bd6f4 Roger Quadros       2024-08-29  1355  	if (unlikely(!new_page)) {
5e24db550bd6f4 Roger Quadros       2024-08-29  1356  		dev_err(dev, "page alloc failed\n");
8acacc40f73375 Julien Panis        2024-04-12  1357  		return -ENOMEM;
5e24db550bd6f4 Roger Quadros       2024-08-29  1358  	}
5e24db550bd6f4 Roger Quadros       2024-08-29  1359  
93a76530316a3d Grygorii Strashko   2020-03-24  1360  	if (netif_dormant(ndev)) {
de794169cf1711 Roger Quadros       2024-11-01  1361  		am65_cpsw_put_page(flow, new_page, true);
93a76530316a3d Grygorii Strashko   2020-03-24  1362  		ndev->stats.rx_dropped++;
93a76530316a3d Grygorii Strashko   2020-03-24  1363  		return 0;
93a76530316a3d Grygorii Strashko   2020-03-24  1364  	}
93a76530316a3d Grygorii Strashko   2020-03-24  1365  
8acacc40f73375 Julien Panis        2024-04-12  1366  requeue:
da70d184a8c330 Roger Quadros       2024-09-10  1367  	ret = am65_cpsw_nuss_rx_push(common, new_page, flow_idx);
93a76530316a3d Grygorii Strashko   2020-03-24  1368  	if (WARN_ON(ret < 0)) {
de794169cf1711 Roger Quadros       2024-11-01  1369  		am65_cpsw_put_page(flow, new_page, true);
93a76530316a3d Grygorii Strashko   2020-03-24  1370  		ndev->stats.rx_errors++;
93a76530316a3d Grygorii Strashko   2020-03-24  1371  		ndev->stats.rx_dropped++;
93a76530316a3d Grygorii Strashko   2020-03-24  1372  	}
93a76530316a3d Grygorii Strashko   2020-03-24  1373  
93a76530316a3d Grygorii Strashko   2020-03-24  1374  	return ret;
93a76530316a3d Grygorii Strashko   2020-03-24  1375  }
93a76530316a3d Grygorii Strashko   2020-03-24  1376  

:::::: The code at line 1331 was first introduced by commit
:::::: 8acacc40f7337527ff84cd901ed2ef0a2b95b2b6 net: ethernet: ti: am65-cpsw: Add minimal XDP support

:::::: TO: Julien Panis <jpanis@baylibre.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
