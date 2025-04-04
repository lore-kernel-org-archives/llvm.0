Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6213D539;
	Fri,  4 Apr 2025 17:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787491; cv=none; b=nb9wSc7hk3WmSMe52Po0BAh5fHy6lRqa9bqzi31+n5VU/QHCWQHh/oJmYskp7Dd4xKAG3biODFJlQ3YFNAKHb488iag81hMRYkmkNTPTMNjD89r8oe9FcoBPiwzrLccHA92F5Oom9k2ECm6SE9+IJk4QXxOmUTSlAHlgU7PumG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787491; c=relaxed/simple;
	bh=alZk+FiVk1zToITts/HGQkDMoRZCwzjhLnqBvRWAqek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLAaZFRFVv/dvotg1Uzb/ql4T9epV3enhZjCvScpUFojIrwqFCffebMm/0zNwAQ6O4iqn3dgPjw3d7cok6FjCP4Eqav9vQsBXBjg9iIjPz8Cr3JhfoKMPNYZJAcnadOE49C1ftLjfl/l9mAk/WC/U4TaFiZ4ZrB6gEmF+yG4vO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWdQKH6h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWdQKH6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743787489; x=1775323489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=alZk+FiVk1zToITts/HGQkDMoRZCwzjhLnqBvRWAqek=;
  b=lWdQKH6h+Y58jzaBfLYM+6XU3mO0ikBJZl+hn1B26PP+/cXCFJB5FTJw
   PCdc6v3AK14yBCgMIwChKPH+SkhIeJGcAPsVyxzp1TQUPEgXTUxVJdhAD
   LgPWdBo342AxWRWKnxe35GsIOb8c0t1Qo9kig+B6aZmDdrjCwCfP8PDgA
   WLvzJV1HNkhES2yWFctdUX6Wqp+tQg815C+W1VS34M0SbsHHs0kWOP3bw
   iKm/VGLhVFnitcZVAoB5+0Znrmy+mA/bu0Gu95w5o9hsaGAZNirBwQC7n
   cwwj9WZ36OKX4sBY8k9yFoTZRwPJWjleEy1tJU4ZQ4m029QZS8vn6AmW8
   w==;
X-CSE-ConnectionGUID: K//g5OqATXCfkWVyIh29AA==
X-CSE-MsgGUID: vIk4UHHmROeutSpJHbjKqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45325987"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45325987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:24:46 -0700
X-CSE-ConnectionGUID: nxcNSxgrQ8WbIR7IGxEszg==
X-CSE-MsgGUID: Ns8hkkFAQC26Go4MS2WmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127880513"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 10:24:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kmY-0001Q3-2o;
	Fri, 04 Apr 2025 17:24:42 +0000
Date: Sat, 5 Apr 2025 01:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-xdp-zc 16/18]
 drivers/net/ethernet/ti/am65-cpsw-nuss.c:1822:6: warning: variable 'xsk_tx'
 set but not used
Message-ID: <202504050138.Un6XvqKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-xdp-zc
head:   ef51a2dafc4aa5551f92ff9fde7f9e298b5b1e62
commit: 862cfb8dae249d301ae6ac6879f29b9282053ddd [16/18] merge: return num_tx
config: arm64-randconfig-004-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050138.Un6XvqKk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050138.Un6XvqKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050138.Un6XvqKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/am65-cpsw-nuss.c:863:9: warning: cast to smaller integer type 'enum am65_cpsw_tx_buf_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
           return (enum am65_cpsw_tx_buf_type)k3_cppi_desc_pool_desc_info(tx_chn->desc_pool,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:1822:6: warning: variable 'xsk_tx' set but not used [-Wunused-but-set-variable]
           int xsk_tx = 0;
               ^
   2 warnings generated.


vim +/xsk_tx +1822 drivers/net/ethernet/ti/am65-cpsw-nuss.c

a9e60cf0b46044b Grygorii Strashko 2020-10-30  1803  
93a76530316a3d8 Grygorii Strashko 2020-03-24  1804  static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
e4918f9d48823ea Grygorii Strashko 2023-12-19  1805  					   int chn, unsigned int budget, bool *tdown)
93a76530316a3d8 Grygorii Strashko 2020-03-24  1806  {
9a369ae3d1431a8 Roger Quadros     2025-02-17  1807  	bool single_port = AM65_CPSW_IS_CPSW2G(common);
8acacc40f733752 Julien Panis      2024-04-12  1808  	enum am65_cpsw_tx_buf_type buf_type;
ce643fa62a70f0b Roger Quadros     2025-02-17  1809  	struct am65_cpsw_tx_swdata *swdata;
ce643fa62a70f0b Roger Quadros     2025-02-17  1810  	struct cppi5_host_desc_t *desc_tx;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1811  	struct device *dev = common->dev;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1812  	struct am65_cpsw_tx_chn *tx_chn;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1813  	struct netdev_queue *netif_txq;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1814  	unsigned int total_bytes = 0;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1815  	struct net_device *ndev;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1816  	int xsk_frames_done = 0;
8acacc40f733752 Julien Panis      2024-04-12  1817  	struct xdp_frame *xdpf;
9a369ae3d1431a8 Roger Quadros     2025-02-17  1818  	unsigned int pkt_len;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1819  	struct sk_buff *skb;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1820  	dma_addr_t desc_dma;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1821  	int res, num_tx = 0;
d835693e1b4ebe8 Roger Quadros     2025-01-09 @1822  	int xsk_tx = 0;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1823  
93a76530316a3d8 Grygorii Strashko 2020-03-24  1824  	tx_chn = &common->tx_chns[chn];
93a76530316a3d8 Grygorii Strashko 2020-03-24  1825  
93a76530316a3d8 Grygorii Strashko 2020-03-24  1826  	while (true) {
66c007cfde744f9 Roger Quadros     2025-03-29  1827  		pkt_len = 0;
66c007cfde744f9 Roger Quadros     2025-03-29  1828  
9a369ae3d1431a8 Roger Quadros     2025-02-17  1829  		if (!single_port)
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1830  			spin_lock(&tx_chn->lock);
93a76530316a3d8 Grygorii Strashko 2020-03-24  1831  		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
9a369ae3d1431a8 Roger Quadros     2025-02-17  1832  		if (!single_port)
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1833  			spin_unlock(&tx_chn->lock);
9a369ae3d1431a8 Roger Quadros     2025-02-17  1834  
93a76530316a3d8 Grygorii Strashko 2020-03-24  1835  		if (res == -ENODATA)
93a76530316a3d8 Grygorii Strashko 2020-03-24  1836  			break;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1837  
6a40e2890e6e1dd Grygorii Strashko 2020-10-30  1838  		if (cppi5_desc_is_tdcm(desc_dma)) {
93a76530316a3d8 Grygorii Strashko 2020-03-24  1839  			if (atomic_dec_and_test(&common->tdown_cnt))
93a76530316a3d8 Grygorii Strashko 2020-03-24  1840  				complete(&common->tdown_complete);
e4918f9d48823ea Grygorii Strashko 2023-12-19  1841  			*tdown = true;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1842  			break;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1843  		}
93a76530316a3d8 Grygorii Strashko 2020-03-24  1844  
ce643fa62a70f0b Roger Quadros     2025-02-17  1845  		desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool,
ce643fa62a70f0b Roger Quadros     2025-02-17  1846  						     desc_dma);
ce643fa62a70f0b Roger Quadros     2025-02-17  1847  		swdata = cppi5_hdesc_get_swdata(desc_tx);
ce643fa62a70f0b Roger Quadros     2025-02-17  1848  		ndev = swdata->ndev;
8acacc40f733752 Julien Panis      2024-04-12  1849  		buf_type = am65_cpsw_nuss_buf_type(tx_chn, desc_dma);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1850  		switch (buf_type) {
d835693e1b4ebe8 Roger Quadros     2025-01-09  1851  		case AM65_CPSW_TX_BUF_TYPE_SKB:
ce643fa62a70f0b Roger Quadros     2025-02-17  1852  			skb = swdata->skb;
ce643fa62a70f0b Roger Quadros     2025-02-17  1853  			am65_cpts_tx_timestamp(tx_chn->common->cpts, skb);
9a369ae3d1431a8 Roger Quadros     2025-02-17  1854  			pkt_len = skb->len;
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1855  			napi_consume_skb(skb, budget);
66c007cfde744f9 Roger Quadros     2025-03-29  1856  			total_bytes += pkt_len;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1857  			break;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1858  		case AM65_CPSW_TX_BUF_TYPE_XDP_TX:
d835693e1b4ebe8 Roger Quadros     2025-01-09  1859  		case AM65_CPSW_TX_BUF_TYPE_XDP_NDO:
ce643fa62a70f0b Roger Quadros     2025-02-17  1860  			xdpf = swdata->xdpf;
9a369ae3d1431a8 Roger Quadros     2025-02-17  1861  			pkt_len = xdpf->len;
66c007cfde744f9 Roger Quadros     2025-03-29  1862  			total_bytes += pkt_len;
8acacc40f733752 Julien Panis      2024-04-12  1863  			if (buf_type == AM65_CPSW_TX_BUF_TYPE_XDP_TX)
8acacc40f733752 Julien Panis      2024-04-12  1864  				xdp_return_frame_rx_napi(xdpf);
8acacc40f733752 Julien Panis      2024-04-12  1865  			else
8acacc40f733752 Julien Panis      2024-04-12  1866  				xdp_return_frame(xdpf);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1867  			break;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1868  		case AM65_CPSW_TX_BUF_TYPE_XSK_TX:
d835693e1b4ebe8 Roger Quadros     2025-01-09  1869  			pkt_len = cppi5_hdesc_get_pktlen(desc_tx);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1870  			xsk_frames_done++;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1871  			break;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1872  		default:
d835693e1b4ebe8 Roger Quadros     2025-01-09  1873  			break;
8acacc40f733752 Julien Panis      2024-04-12  1874  		}
9a369ae3d1431a8 Roger Quadros     2025-02-17  1875  
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1876  		num_tx++;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1877  		am65_cpsw_nuss_xmit_free(tx_chn, desc_tx, buf_type);
ce643fa62a70f0b Roger Quadros     2025-02-17  1878  		dev_sw_netstats_tx_add(ndev, 1, pkt_len);
66c007cfde744f9 Roger Quadros     2025-03-29  1879  		if (!single_port && buf_type != AM65_CPSW_TX_BUF_TYPE_XSK_TX) {
9a369ae3d1431a8 Roger Quadros     2025-02-17  1880  			/* as packets from multi ports can be interleaved
9a369ae3d1431a8 Roger Quadros     2025-02-17  1881  			 * on the same channel, we have to figure out the
9a369ae3d1431a8 Roger Quadros     2025-02-17  1882  			 * port/queue at every packet and report it/wake queue.
9a369ae3d1431a8 Roger Quadros     2025-02-17  1883  			 */
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1884  			netif_txq = netdev_get_tx_queue(ndev, chn);
9a369ae3d1431a8 Roger Quadros     2025-02-17  1885  			netdev_tx_completed_queue(netif_txq, 1, pkt_len);
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1886  			am65_cpsw_nuss_tx_wake(tx_chn, ndev, netif_txq);
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1887  		}
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1888  	}
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1889  
415be547922f142 Roger Quadros     2025-04-04  1890  	trace_printk("txcmp %d:%d\n", num_tx, xsk_frames_done);
415be547922f142 Roger Quadros     2025-04-04  1891  
9a369ae3d1431a8 Roger Quadros     2025-02-17  1892  	if (single_port) {
93a76530316a3d8 Grygorii Strashko 2020-03-24  1893  		netif_txq = netdev_get_tx_queue(ndev, chn);
93a76530316a3d8 Grygorii Strashko 2020-03-24  1894  		netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
a9e60cf0b46044b Grygorii Strashko 2020-10-30  1895  		am65_cpsw_nuss_tx_wake(tx_chn, ndev, netif_txq);
9a369ae3d1431a8 Roger Quadros     2025-02-17  1896  	}
93a76530316a3d8 Grygorii Strashko 2020-03-24  1897  
d835693e1b4ebe8 Roger Quadros     2025-01-09  1898  	if (tx_chn->xsk_pool) {
d835693e1b4ebe8 Roger Quadros     2025-01-09  1899  		if (xsk_frames_done)
d835693e1b4ebe8 Roger Quadros     2025-01-09  1900  			xsk_tx_completed(tx_chn->xsk_pool, xsk_frames_done);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1901  
d835693e1b4ebe8 Roger Quadros     2025-01-09  1902  		if (xsk_uses_need_wakeup(tx_chn->xsk_pool))
d835693e1b4ebe8 Roger Quadros     2025-01-09  1903  			xsk_set_tx_need_wakeup(tx_chn->xsk_pool);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1904  
d835693e1b4ebe8 Roger Quadros     2025-01-09  1905  		ndev = common->ports[tx_chn->xsk_port_id].ndev;
d835693e1b4ebe8 Roger Quadros     2025-01-09  1906  		netif_txq = netdev_get_tx_queue(ndev, chn);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1907  		txq_trans_cond_update(netif_txq);
426c3a333c40fef Roger Quadros     2025-04-04  1908  		xsk_tx = am65_cpsw_xsk_xmit_zc(ndev, tx_chn);
d835693e1b4ebe8 Roger Quadros     2025-01-09  1909  	}
d835693e1b4ebe8 Roger Quadros     2025-01-09  1910  
93a76530316a3d8 Grygorii Strashko 2020-03-24  1911  	dev_dbg(dev, "%s:%u pkt:%d\n", __func__, chn, num_tx);
93a76530316a3d8 Grygorii Strashko 2020-03-24  1912  
862cfb8dae249d3 Roger Quadros     2025-04-04  1913  	return num_tx;
93a76530316a3d8 Grygorii Strashko 2020-03-24  1914  }
93a76530316a3d8 Grygorii Strashko 2020-03-24  1915  

:::::: The code at line 1822 was first introduced by commit
:::::: d835693e1b4ebe8fc212035e78127e9960005869 am65_cpsw: add TX XDP zero copy

:::::: TO: Roger Quadros <rogerq@kernel.org>
:::::: CC: Roger Quadros <rogerq@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
