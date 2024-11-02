Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B772B9A4;
	Sat,  2 Nov 2024 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730534426; cv=none; b=iNsl31kuDcDY1amcMWzL+xmdgWrumv0yKGt4ga4ouidPb8kebEqHPnuL1UiuA9gcl8G8hZNff4p16faOshid7mkjZ5iDi3z57oalCjsRKSTkkGqc6/3PJ3djRqSN0xQiLp/LnpMiqzgs3ohD7mloozR03iLQkq9mDEx9HB7gk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730534426; c=relaxed/simple;
	bh=SgpwgeefS5In1ATkBa1Lh4KO5m5ReCoBK8h9KQUVCFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ofeof8sgjXFeMAetdnqrHOa7QXELrQ8qw8AvoLg4Z+omlcWanM52iBxNdnd1MRF5wF+QD3LsarvOP7ch0ivp98JAiRGzOf4o5hzOJZhkCTCxHU7LeDs5LSdTtuMjGOWBWgqk0ykV7A2PiuCvRpnd3RQTVaa/wuZ6nx8QqAKEJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQ2AtLNZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ2AtLNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730534425; x=1762070425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SgpwgeefS5In1ATkBa1Lh4KO5m5ReCoBK8h9KQUVCFQ=;
  b=OQ2AtLNZBD4RmVTJDDcKVpavOk/Zji2hRdmXEm/KHQgZhTPXeoIlfup/
   e1JXXX5mfMI+3yCfdCuRts2+R5PV2+x/JhH0Poif8UXsC+UK2hnRYFD8l
   qg1pO7Ood+2fmdW5jVHFn5fNYS1pCWmP7s/XPl7au0Wh3/BxXMIU5V/xr
   etj2vnuBmXKUHsw5uO6H8v3nTBQsjrUqWK7wwK79E/GOJnk+C2GeQ7DsA
   QNXGhcsb6WgH7Ui8zxP6I6M/JVH1dg+wcvy9sn+aLFENaZYYSNvdl2enk
   1SEWEM998NVgGBCeEEXDxmOLbfyBDW2aEddQPVO54GxM4Z/2Kqr/S8buO
   Q==;
X-CSE-ConnectionGUID: zQTg2wkURTC400PxIwFcmA==
X-CSE-MsgGUID: s/AHXqyKRESn27KJMOkQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30477394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30477394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 01:00:24 -0700
X-CSE-ConnectionGUID: E+uAfSHgQN6E7olP8dHAkA==
X-CSE-MsgGUID: yT24UExQRMCEoxewjsKo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="106515178"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2024 01:00:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t793U-000iaP-1I;
	Sat, 02 Nov 2024 08:00:20 +0000
Date: Sat, 2 Nov 2024 16:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gur Stavi <gur.stavi@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v01 1/1] net: hinic3: Add a driver for Huawei 3rd
 gen NIC
Message-ID: <202411021531.9fJh9AcY-lkp@intel.com>
References: <ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi@huawei.com>

Hi Gur,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on b8ee7a11c75436b85fa1641aa5f970de0f8a575c]

url:    https://github.com/intel-lab-lkp/linux/commits/Gur-Stavi/net-hinic3-Add-a-driver-for-Huawei-3rd-gen-NIC/20241030-201518
base:   b8ee7a11c75436b85fa1641aa5f970de0f8a575c
patch link:    https://lore.kernel.org/r/ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi%40huawei.com
patch subject: [RFC net-next v01 1/1] net: hinic3: Add a driver for Huawei 3rd gen NIC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241102/202411021531.9fJh9AcY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021531.9fJh9AcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021531.9fJh9AcY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
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
   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:146:6: warning: variable 'cqe_len' set but not used [-Wunused-but-set-variable]
     146 |         int cqe_len;
         |             ^
>> drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:333:5: warning: variable 'frag_num' set but not used [-Wunused-but-set-variable]
     333 |         u8 frag_num = 0;
         |            ^
   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:493:25: warning: variable 'nic_dev' set but not used [-Wunused-but-set-variable]
     493 |         struct hinic3_nic_dev *nic_dev;
         |                                ^
   7 warnings generated.


vim +/frag_num +333 drivers/net/ethernet/huawei/hinic3/hinic3_rx.c

   137	
   138	/* Associate fixed completion element to every wqe in the rq. Every rq wqe will
   139	 * always post completion to the same place.
   140	 */
   141	static void rq_associate_cqes(struct hinic3_rxq *rxq)
   142	{
   143		struct hinic3_queue_pages *qpages;
   144		struct hinic3_rq_wqe *rq_wqe;
   145		dma_addr_t cqe_dma;
 > 146		int cqe_len;
   147		u32 i;
   148	
   149		/* unit of cqe length is 16B */
   150		cqe_len = sizeof(struct hinic3_rq_cqe) >> HINIC3_CQE_SIZE_SHIFT;
   151		qpages = &rxq->rq->wq.qpages;
   152	
   153		for (i = 0; i < rxq->q_depth; i++) {
   154			rq_wqe = get_q_element(qpages, i, NULL);
   155			cqe_dma = rxq->cqe_start_paddr + i * sizeof(struct hinic3_rq_cqe);
   156			rq_wqe->cqe_hi_addr = upper_32_bits(cqe_dma);
   157			rq_wqe->cqe_lo_addr = lower_32_bits(cqe_dma);
   158		}
   159	}
   160	
   161	static void rq_wqe_buff_set(struct hinic3_io_queue *rq, uint32_t wqe_idx,
   162				    dma_addr_t dma_addr, u16 len)
   163	{
   164		struct hinic3_rq_wqe *rq_wqe;
   165	
   166		rq_wqe = get_q_element(&rq->wq.qpages, wqe_idx, NULL);
   167		rq_wqe->buf_hi_addr = upper_32_bits(dma_addr);
   168		rq_wqe->buf_lo_addr = lower_32_bits(dma_addr);
   169	}
   170	
   171	static u32 hinic3_rx_fill_buffers(struct hinic3_rxq *rxq)
   172	{
   173		struct net_device *netdev = rxq->netdev;
   174		u32 i, free_wqebbs = rxq->delta - 1;
   175		struct hinic3_nic_dev *nic_dev;
   176		struct hinic3_rx_info *rx_info;
   177		dma_addr_t dma_addr;
   178		int err;
   179	
   180		nic_dev = netdev_priv(netdev);
   181		for (i = 0; i < free_wqebbs; i++) {
   182			rx_info = &rxq->rx_info[rxq->next_to_update];
   183	
   184			err = rx_alloc_mapped_page(netdev, rx_info);
   185			if (unlikely(err)) {
   186				RXQ_STATS_INC(rxq, alloc_rx_buf_err);
   187				break;
   188			}
   189	
   190			dma_addr = rx_info->buf_dma_addr + rx_info->page_offset;
   191			rq_wqe_buff_set(rxq->rq, rxq->next_to_update, dma_addr,
   192					nic_dev->rx_buff_len);
   193			rxq->next_to_update = (u16)((rxq->next_to_update + 1) & rxq->q_mask);
   194		}
   195	
   196		if (likely(i)) {
   197			hinic3_write_db(rxq->rq, rxq->q_id & 3, RQ_CFLAG_DP,
   198					rxq->next_to_update << HINIC3_NORMAL_RQ_WQE);
   199			rxq->delta -= i;
   200			rxq->next_to_alloc = rxq->next_to_update;
   201		} else if (free_wqebbs == rxq->q_depth - 1) {
   202			RXQ_STATS_INC(rxq, rx_buf_empty);
   203		}
   204	
   205		return i;
   206	}
   207	
   208	static u32 hinic3_rx_alloc_buffers(struct net_device *netdev, u32 rq_depth,
   209					   struct hinic3_rx_info *rx_info_arr)
   210	{
   211		u32 free_wqebbs = rq_depth - 1;
   212		u32 idx;
   213		int err;
   214	
   215		for (idx = 0; idx < free_wqebbs; idx++) {
   216			err = rx_alloc_mapped_page(netdev, &rx_info_arr[idx]);
   217			if (err)
   218				break;
   219		}
   220	
   221		return idx;
   222	}
   223	
   224	static void hinic3_rx_free_buffers(struct net_device *netdev, u32 q_depth,
   225					   struct hinic3_rx_info *rx_info_arr)
   226	{
   227		struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
   228		struct hinic3_rx_info *rx_info;
   229		u32 i;
   230	
   231		/* Free all the Rx ring sk_buffs */
   232		for (i = 0; i < q_depth; i++) {
   233			rx_info = &rx_info_arr[i];
   234	
   235			if (rx_info->buf_dma_addr) {
   236				dma_unmap_page(&nic_dev->pdev->dev,
   237					       rx_info->buf_dma_addr,
   238					       nic_dev->dma_rx_buff_size,
   239					       DMA_FROM_DEVICE);
   240				rx_info->buf_dma_addr = 0;
   241			}
   242	
   243			if (rx_info->page) {
   244				__free_pages(rx_info->page, nic_dev->page_order);
   245				rx_info->page = NULL;
   246			}
   247		}
   248	}
   249	
   250	static void hinic3_reuse_rx_page(struct hinic3_rxq *rxq,
   251					 struct hinic3_rx_info *old_rx_info)
   252	{
   253		struct hinic3_rx_info *new_rx_info;
   254		u16 nta = rxq->next_to_alloc;
   255	
   256		new_rx_info = &rxq->rx_info[nta];
   257	
   258		/* update, and store next to alloc */
   259		nta++;
   260		rxq->next_to_alloc = (nta < rxq->q_depth) ? nta : 0;
   261	
   262		new_rx_info->page = old_rx_info->page;
   263		new_rx_info->page_offset = old_rx_info->page_offset;
   264		new_rx_info->buf_dma_addr = old_rx_info->buf_dma_addr;
   265	
   266		/* sync the buffer for use by the device */
   267		dma_sync_single_range_for_device(rxq->dev, new_rx_info->buf_dma_addr,
   268						 new_rx_info->page_offset,
   269						 rxq->buf_len,
   270						 DMA_FROM_DEVICE);
   271	}
   272	
   273	static void hinic3_add_rx_frag(struct hinic3_rxq *rxq,
   274				       struct hinic3_rx_info *rx_info,
   275				       struct sk_buff *skb, u32 size)
   276	{
   277		struct page *page;
   278		u8 *va;
   279	
   280		page = rx_info->page;
   281		va = (u8 *)page_address(page) + rx_info->page_offset;
   282		prefetch(va);
   283	
   284		dma_sync_single_range_for_cpu(rxq->dev,
   285					      rx_info->buf_dma_addr,
   286					      rx_info->page_offset,
   287					      rxq->buf_len,
   288					      DMA_FROM_DEVICE);
   289	
   290		if (size <= HINIC3_RX_HDR_SIZE && !skb_is_nonlinear(skb)) {
   291			memcpy(__skb_put(skb, size), va,
   292			       ALIGN(size, sizeof(long)));
   293	
   294			/* page is not reserved, we can reuse buffer as-is */
   295			if (likely(page_to_nid(page) == numa_node_id()))
   296				goto reuse_rx_page;
   297	
   298			/* this page cannot be reused so discard it */
   299			put_page(page);
   300			goto err_reuse_buffer;
   301		}
   302	
   303		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, page,
   304				rx_info->page_offset, size, rxq->buf_len);
   305	
   306		/* avoid re-using remote pages */
   307		if (unlikely(page_to_nid(page) != numa_node_id()))
   308			goto err_reuse_buffer;
   309	
   310		/* if we are the only owner of the page we can reuse it */
   311		if (unlikely(page_count(page) != 1))
   312			goto err_reuse_buffer;
   313	
   314		/* flip page offset to other buffer */
   315		rx_info->page_offset ^= rxq->buf_len;
   316		get_page(page);
   317	
   318	reuse_rx_page:
   319		hinic3_reuse_rx_page(rxq, rx_info);
   320		return;
   321	
   322	err_reuse_buffer:
   323		/* we are not reusing the buffer so unmap it */
   324		dma_unmap_page(rxq->dev, rx_info->buf_dma_addr, rxq->dma_rx_buff_size, DMA_FROM_DEVICE);
   325	}
   326	
   327	static void packaging_skb(struct hinic3_rxq *rxq, struct sk_buff *skb,
   328				  u32 sge_num, u32 pkt_len)
   329	{
   330		struct hinic3_rx_info *rx_info;
   331		u32 temp_pkt_len = pkt_len;
   332		u32 temp_sge_num = sge_num;
 > 333		u8 frag_num = 0;
   334		u32 sw_ci;
   335		u32 size;
   336	
   337		sw_ci = rxq->cons_idx & rxq->q_mask;
   338		while (temp_sge_num) {
   339			rx_info = &rxq->rx_info[sw_ci];
   340			sw_ci = (sw_ci + 1) & rxq->q_mask;
   341			if (unlikely(temp_pkt_len > rxq->buf_len)) {
   342				size = rxq->buf_len;
   343				temp_pkt_len -= rxq->buf_len;
   344			} else {
   345				size = temp_pkt_len;
   346			}
   347	
   348			hinic3_add_rx_frag(rxq, rx_info, skb, size);
   349	
   350			/* clear contents of buffer_info */
   351			rx_info->buf_dma_addr = 0;
   352			rx_info->page = NULL;
   353			temp_sge_num--;
   354			frag_num++;
   355		}
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
