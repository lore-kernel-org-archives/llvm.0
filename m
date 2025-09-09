Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C6264636;
	Tue,  9 Sep 2025 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390320; cv=none; b=ofnXdlMbcJ1dC+hZpYMZsPto06mARnrj/MBIiAlJh5NnEaR8uH3+ayfC/bKIzoagP1t75lyft6hU3bjjWlVjMnvv23gLyn50tM3sVtvspL1jEtDMfBhlA7tqTnJ6ZuX+W3L7O9swDWEg9iBhNjkHFzzNOMoWUMwXr0HMkSmBRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390320; c=relaxed/simple;
	bh=xu5dx+faNyE+kmiG+OBk+5bqMGRy2YH+AP2uNq7J5y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgvZO/2ZZWOVpMOBibzOtmR9Deeum4b7eq/UOL1lzAQDfH/qoInZULBa4HrJ/ZLZ91cnAPocovKxlpCWnm0nOljJtJgpQjYQyN5SK6KxkXrgMt0kD5G7HGsdGnkWyfMOFpFCNN5SlLjrVqqey8yMb7fsP9UyT9Fsm/P1PPsRRiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P18ZYhh7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P18ZYhh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757390319; x=1788926319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xu5dx+faNyE+kmiG+OBk+5bqMGRy2YH+AP2uNq7J5y8=;
  b=P18ZYhh7MfYmYzyHlAV/jhHexE4DKCl+c/SB3S0L7y1wTGl5pIwLZxTS
   Nrq7aGfabjvOwiPiDGSr2L3GrOoYa4zE3OQAHj31r7DGquZpidN65zvqC
   UnCyxhtzqteIa1eDbFt6VGKHac3qK1892PrhWm7g9kPt/gwmkAGSQL1+x
   Njp9pZmebKJ6wAVFh9DUXpnNgHj41s7NHlP//ACkpV1DgR0VhvItsOXnk
   3DtSPoojzrTqSMNovI2bXmVUL122/9gBB+MojR8Vkq1rGyTGiHoz/E6aw
   nqhu6TrbKLoSMreaRDrFHp8a52e68/m2xOpgoID7X9SRbmV6qRMKe/sSd
   g==;
X-CSE-ConnectionGUID: YSg+MM3tTNClUlM+UXiNFQ==
X-CSE-MsgGUID: YL5pUoHrR6Ked6eZd8PYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77119708"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="77119708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 20:58:38 -0700
X-CSE-ConnectionGUID: qsYqeYD4TwaWl/59F+vizg==
X-CSE-MsgGUID: 2Tr7VpXySIGTLqS3HaMFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172903773"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 20:58:36 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvpV3-0004PH-1n;
	Tue, 09 Sep 2025 03:58:33 +0000
Date: Tue, 9 Sep 2025 11:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rex Lu <rex.lu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [nbd168-wireless:mt76 34/38]
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1845:12: warning: shift
 count >= width of type
Message-ID: <202509091121.aGqkfj6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   11c3ee032f406b80c7ccf743ddfc7b12387abf4a
commit: d6bbaf36220ccf5d93b719ed9c3be9fdb1fa8429 [34/38] wifi: mt76: mt7996: Introduce RRO MSDU callbacks
config: i386-buildonly-randconfig-005-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091121.aGqkfj6z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091121.aGqkfj6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091121.aGqkfj6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1845:12: warning: shift count >= width of type [-Wshift-count-overflow]
    1845 |                 dma_addr <<= 32;
         |                          ^   ~~
   drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1931:14: warning: shift count >= width of type [-Wshift-count-overflow]
    1931 |                                 dma_addr <<= 32;
         |                                          ^   ~~
   2 warnings generated.


vim +1845 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

  1816	
  1817	void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
  1818	{
  1819		struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
  1820		struct mt76_wed_rro_ind *cmd = (struct mt76_wed_rro_ind *)data;
  1821		struct mt7996_msdu_page_info *pinfo = NULL;
  1822		struct mt7996_msdu_page *p = NULL;
  1823		int i, seq_num = 0;
  1824	
  1825		for (i = 0; i < cmd->ind_cnt; i++) {
  1826			struct mt7996_wed_rro_addr *e;
  1827			struct mt76_rx_status *status;
  1828			struct mt7996_rro_hif *rxd;
  1829			int j, len, qid, data_len;
  1830			struct mt76_txwi_cache *t;
  1831			struct mt76_queue *q;
  1832			dma_addr_t dma_addr;
  1833			struct sk_buff *skb;
  1834			u32 info = 0;
  1835			void *buf;
  1836	
  1837			seq_num = FIELD_GET(MT996_RRO_SN_MASK, cmd->start_sn + i);
  1838			e = mt7996_rro_addr_elem_get(dev, cmd->se_id, seq_num);
  1839			if (e->signature != (seq_num / MT7996_RRO_WINDOW_MAX_LEN)) {
  1840				e->signature = 0xff;
  1841				goto update_ack_seq_num;
  1842			}
  1843	
  1844			dma_addr = e->head_high;
> 1845			dma_addr <<= 32;
  1846			dma_addr |= e->head_low;
  1847	
  1848			for (j = 0; j < e->count; j++) {
  1849				if (!p) {
  1850					p = mt7996_rro_msdu_page_get(dev, dma_addr);
  1851					if (!p)
  1852						continue;
  1853	
  1854					dma_sync_single_for_cpu(mdev->dma_dev, p->dma_addr,
  1855								SKB_WITH_OVERHEAD(p->q->buf_size),
  1856								page_pool_get_dma_dir(p->q->page_pool));
  1857					pinfo = (struct mt7996_msdu_page_info *)p->buf;
  1858				}
  1859	
  1860				rxd = &pinfo->rxd[j % MT7996_MAX_HIF_RXD_IN_PG];
  1861				len = rxd->sdl;
  1862	
  1863				t = mt76_rx_token_release(mdev, rxd->rx_token_id);
  1864				if (!t)
  1865					goto next_page;
  1866	
  1867				qid = t->qid;
  1868				buf = t->ptr;
  1869				q = &mdev->q_rx[qid];
  1870				dma_sync_single_for_cpu(mdev->dma_dev, t->dma_addr,
  1871							SKB_WITH_OVERHEAD(q->buf_size),
  1872							page_pool_get_dma_dir(q->page_pool));
  1873	
  1874				t->dma_addr = 0;
  1875				t->ptr = NULL;
  1876				mt76_put_rxwi(mdev, t);
  1877				if (!buf)
  1878					goto next_page;
  1879	
  1880				if (q->rx_head)
  1881					data_len = q->buf_size;
  1882				else
  1883					data_len = SKB_WITH_OVERHEAD(q->buf_size);
  1884	
  1885				if (data_len < len + q->buf_offset) {
  1886					dev_kfree_skb(q->rx_head);
  1887					mt76_put_page_pool_buf(buf, false);
  1888					q->rx_head = NULL;
  1889					goto next_page;
  1890				}
  1891	
  1892				if (q->rx_head) {
  1893					/* TODO: Take into account non-linear skb. */
  1894					mt76_put_page_pool_buf(buf, false);
  1895					if (rxd->ls) {
  1896						dev_kfree_skb(q->rx_head);
  1897						q->rx_head = NULL;
  1898					}
  1899					goto next_page;
  1900				}
  1901	
  1902				if (rxd->ls && !mt7996_rx_check(mdev, buf, len))
  1903					goto next_page;
  1904	
  1905				skb = build_skb(buf, q->buf_size);
  1906				if (!skb)
  1907					goto next_page;
  1908	
  1909				skb_reserve(skb, q->buf_offset);
  1910				skb_mark_for_recycle(skb);
  1911				__skb_put(skb, len);
  1912	
  1913				if (cmd->ind_reason == 1 || cmd->ind_reason == 2) {
  1914					dev_kfree_skb(skb);
  1915					goto next_page;
  1916				}
  1917	
  1918				if (!rxd->ls) {
  1919					q->rx_head = skb;
  1920					goto next_page;
  1921				}
  1922	
  1923				status = (struct mt76_rx_status *)skb->cb;
  1924				if (cmd->se_id != MT7996_RRO_MAX_SESSION)
  1925					status->aggr = true;
  1926	
  1927				mt7996_queue_rx_skb(mdev, qid, skb, &info);
  1928	next_page:
  1929				if ((j + 1) % MT7996_MAX_HIF_RXD_IN_PG == 0) {
  1930					dma_addr = pinfo->next_pg_high;
  1931					dma_addr <<= 32;
  1932					dma_addr |= pinfo->next_pg_low;
  1933					mt7996_msdu_page_put_to_cache(dev, p);
  1934					p = NULL;
  1935				}
  1936			}
  1937	
  1938	update_ack_seq_num:
  1939			if ((i + 1) % 4 == 0)
  1940				mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
  1941					FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
  1942						   cmd->se_id) |
  1943					FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK,
  1944						   seq_num));
  1945			if (p) {
  1946				mt7996_msdu_page_put_to_cache(dev, p);
  1947				p = NULL;
  1948			}
  1949		}
  1950	
  1951		/* Update ack_seq_num for remaining addr_elem */
  1952		if (i % 4)
  1953			mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
  1954				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
  1955					   cmd->se_id) |
  1956				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK, seq_num));
  1957	}
  1958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
