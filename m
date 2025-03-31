Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFED215178;
	Mon, 31 Mar 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743442500; cv=none; b=cpLBb0i+jFV81tgLZU9AS9gPjqpDbf6UX3RE1FK7H9YitM4W51Oh6w7rhlmxDeeiJO6NRYsixEnr/vGe7Ia/Q3EZP8duIUoEsGKeAbMXlMBvV2fsvw5RkDCfyM78GMEzEfG96L0L0JGUXqdkP6UVW7QN0nivmm4pHyYtwF7rKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743442500; c=relaxed/simple;
	bh=H6XhfcM8+zvk/bd4cJqhtQDP2Ar0dNpqo+MKPNGNO4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyQCypSi3CfMRj5RzETbAB8WQ6APrVX9e9/QYQ0YSipi5f9MEO7rn8LBgtTP4EP8tg4DiUIi5zrggzkfXrXWhxO2bbBXCtBSfrLy0P/nq5jeUoL7Xnm6H1qbyPge89LzkDdwA0Gx6z3PupdxBkrgBO6pr3rOMQd7QfqFl3GKHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na/vulXX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na/vulXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743442497; x=1774978497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H6XhfcM8+zvk/bd4cJqhtQDP2Ar0dNpqo+MKPNGNO4U=;
  b=na/vulXXXYv7PkegChwsEuZ0IfBNxY6Wb++uznZb/3davBlS/v/+K3wK
   c+PCrv52T61aakD/TFQWPSX7rx5bBw28x/vqvwBWvkIg8WhY2UMRKsgHQ
   iocWrK418rMppR7zidA1dWcMsCDJ2lca1dRMgdZ/m8/MMYQhiw9rXBVxw
   K1qa+ClVSfPr5xokHio4IgkVE4EoDC344APe+kc0qdtDl4u8RMymL5mPS
   zFx+z2zE+cNzYOwREBzu2aGHiGtVz7NS4b9f0rkh1Vr6XaDB2M40PAKLQ
   mww0XUL5S2kkQ7gDPqXAax+I9J+7adVwDm6buSvHLAHjjW7ilB9hh2ol7
   A==;
X-CSE-ConnectionGUID: IrR0S1iKQ62J708w3g6qoQ==
X-CSE-MsgGUID: hUxN1JIPTeGPfvP+HrkdoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44652433"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="44652433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 10:34:40 -0700
X-CSE-ConnectionGUID: LR864KQ1TJixdxDWZ50DlA==
X-CSE-MsgGUID: AbEV+Wp6RFG72Nx+i3U4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126145831"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2025 10:34:40 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzJ1u-0009Mm-2I;
	Mon, 31 Mar 2025 17:34:35 +0000
Date: Tue, 1 Apr 2025 01:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Taehee Yoo <ap420073@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 1/2] eth: bnxt: refactor buffer descriptor
Message-ID: <202504010152.IPLHfrBc-lkp@intel.com>
References: <20250331114729.594603-2-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331114729.594603-2-ap420073@gmail.com>

Hi Taehee,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/eth-bnxt-add-support-rx-side-device-memory-TCP/20250331-204815
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250331114729.594603-2-ap420073%40gmail.com
patch subject: [RFC net-next 1/2] eth: bnxt: refactor buffer descriptor
config: x86_64-buildonly-randconfig-003-20250331 (https://download.01.org/0day-ci/archive/20250401/202504010152.IPLHfrBc-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010152.IPLHfrBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504010152.IPLHfrBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1236:14: warning: variable 'mapping' set but not used [-Wunused-but-set-variable]
    1236 |                 dma_addr_t mapping;
         |                            ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1385:6: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    1385 |         u8 *data = xdp->data;
         |             ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:1802:13: warning: variable 'mapping' set but not used [-Wunused-but-set-variable]
    1802 |         dma_addr_t mapping;
         |                    ^
   3 warnings generated.
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:219:18: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
     219 |         struct pci_dev *pdev;
         |                         ^
   1 warning generated.


vim +/mapping +1236 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan    2015-10-22  1212  
23e4c0469ad03f Andy Gospodarek 2022-04-08  1213  static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
e44758b78ae814 Michael Chan    2018-10-14  1214  			       struct bnxt_cp_ring_info *cpr,
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1215  			       struct skb_shared_info *shinfo,
31b9998bf225ec Andy Gospodarek 2022-04-08  1216  			       u16 idx, u32 agg_bufs, bool tpa,
31b9998bf225ec Andy Gospodarek 2022-04-08  1217  			       struct xdp_buff *xdp)
c0c050c58d8409 Michael Chan    2015-10-22  1218  {
e44758b78ae814 Michael Chan    2018-10-14  1219  	struct bnxt_napi *bnapi = cpr->bnapi;
431e37cd471b9e Taehee Yoo      2025-03-31  1220  	struct bnxt_rx_ring_info *rxr;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1221  	u32 i, total_frag_len = 0;
bfcd8d791ec184 Michael Chan    2019-07-29  1222  	bool p5_tpa = false;
431e37cd471b9e Taehee Yoo      2025-03-31  1223  	u16 prod;
431e37cd471b9e Taehee Yoo      2025-03-31  1224  
431e37cd471b9e Taehee Yoo      2025-03-31  1225  	rxr = bnapi->rx_ring;
431e37cd471b9e Taehee Yoo      2025-03-31  1226  	prod = rxr->rx_agg_prod;
c0c050c58d8409 Michael Chan    2015-10-22  1227  
1c7fd6ee2fe4ec Randy Schacher  2023-11-20  1228  	if ((bp->flags & BNXT_FLAG_CHIP_P5_PLUS) && tpa)
bfcd8d791ec184 Michael Chan    2019-07-29  1229  		p5_tpa = true;
bfcd8d791ec184 Michael Chan    2019-07-29  1230  
c0c050c58d8409 Michael Chan    2015-10-22  1231  	for (i = 0; i < agg_bufs; i++) {
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1232  		skb_frag_t *frag = &shinfo->frags[i];
431e37cd471b9e Taehee Yoo      2025-03-31  1233  		struct bnxt_sw_rx_bd *cons_rx_buf;
c0c050c58d8409 Michael Chan    2015-10-22  1234  		struct rx_agg_cmp *agg;
431e37cd471b9e Taehee Yoo      2025-03-31  1235  		u16 cons, frag_len;
c0c050c58d8409 Michael Chan    2015-10-22 @1236  		dma_addr_t mapping;
431e37cd471b9e Taehee Yoo      2025-03-31  1237  		struct page *page;
c0c050c58d8409 Michael Chan    2015-10-22  1238  
bfcd8d791ec184 Michael Chan    2019-07-29  1239  		if (p5_tpa)
bfcd8d791ec184 Michael Chan    2019-07-29  1240  			agg = bnxt_get_tpa_agg_p5(bp, rxr, idx, i);
bfcd8d791ec184 Michael Chan    2019-07-29  1241  		else
4a228a3a5e58e5 Michael Chan    2019-07-29  1242  			agg = bnxt_get_agg(bp, cpr, idx, i);
c0c050c58d8409 Michael Chan    2015-10-22  1243  		cons = agg->rx_agg_cmp_opaque;
c0c050c58d8409 Michael Chan    2015-10-22  1244  		frag_len = (le32_to_cpu(agg->rx_agg_cmp_len_flags_type) &
c0c050c58d8409 Michael Chan    2015-10-22  1245  			    RX_AGG_CMP_LEN) >> RX_AGG_CMP_LEN_SHIFT;
c0c050c58d8409 Michael Chan    2015-10-22  1246  
c0c050c58d8409 Michael Chan    2015-10-22  1247  		cons_rx_buf = &rxr->rx_agg_ring[cons];
b51f4113ebb020 Yunsheng Lin    2023-05-11  1248  		skb_frag_fill_page_desc(frag, cons_rx_buf->page,
b51f4113ebb020 Yunsheng Lin    2023-05-11  1249  					cons_rx_buf->offset, frag_len);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1250  		shinfo->nr_frags = i + 1;
c0c050c58d8409 Michael Chan    2015-10-22  1251  		__clear_bit(cons, rxr->rx_agg_bmap);
c0c050c58d8409 Michael Chan    2015-10-22  1252  
431e37cd471b9e Taehee Yoo      2025-03-31  1253  		/* It is possible for bnxt_alloc_rx_agg_page() to allocate
c0c050c58d8409 Michael Chan    2015-10-22  1254  		 * a sw_prod index that equals the cons index, so we
c0c050c58d8409 Michael Chan    2015-10-22  1255  		 * need to clear the cons entry now.
c0c050c58d8409 Michael Chan    2015-10-22  1256  		 */
11cd119d31a71b Michael Chan    2017-02-06  1257  		mapping = cons_rx_buf->mapping;
c0c050c58d8409 Michael Chan    2015-10-22  1258  		page = cons_rx_buf->page;
c0c050c58d8409 Michael Chan    2015-10-22  1259  		cons_rx_buf->page = NULL;
c0c050c58d8409 Michael Chan    2015-10-22  1260  
31b9998bf225ec Andy Gospodarek 2022-04-08  1261  		if (xdp && page_is_pfmemalloc(page))
31b9998bf225ec Andy Gospodarek 2022-04-08  1262  			xdp_buff_set_frag_pfmemalloc(xdp);
31b9998bf225ec Andy Gospodarek 2022-04-08  1263  
431e37cd471b9e Taehee Yoo      2025-03-31  1264  		if (bnxt_alloc_rx_agg_page(bp, rxr, prod, GFP_ATOMIC) != 0) {
278fda0d52f672 Yunsheng Lin    2023-05-11  1265  			--shinfo->nr_frags;
c0c050c58d8409 Michael Chan    2015-10-22  1266  			cons_rx_buf->page = page;
c0c050c58d8409 Michael Chan    2015-10-22  1267  
c0c050c58d8409 Michael Chan    2015-10-22  1268  			/* Update prod since possibly some pages have been
c0c050c58d8409 Michael Chan    2015-10-22  1269  			 * allocated already.
c0c050c58d8409 Michael Chan    2015-10-22  1270  			 */
c0c050c58d8409 Michael Chan    2015-10-22  1271  			rxr->rx_agg_prod = prod;
4a228a3a5e58e5 Michael Chan    2019-07-29  1272  			bnxt_reuse_rx_agg_bufs(cpr, idx, i, agg_bufs - i, tpa);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1273  			return 0;
c0c050c58d8409 Michael Chan    2015-10-22  1274  		}
c0c050c58d8409 Michael Chan    2015-10-22  1275  
431e37cd471b9e Taehee Yoo      2025-03-31  1276  		page_pool_dma_sync_for_cpu(rxr->page_pool, page, 0,
431e37cd471b9e Taehee Yoo      2025-03-31  1277  					   BNXT_RX_PAGE_SIZE);
c0c050c58d8409 Michael Chan    2015-10-22  1278  
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1279  		total_frag_len += frag_len;
c0c050c58d8409 Michael Chan    2015-10-22  1280  		prod = NEXT_RX_AGG(prod);
c0c050c58d8409 Michael Chan    2015-10-22  1281  	}
c0c050c58d8409 Michael Chan    2015-10-22  1282  	rxr->rx_agg_prod = prod;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1283  	return total_frag_len;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1284  }
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1285  
23e4c0469ad03f Andy Gospodarek 2022-04-08  1286  static struct sk_buff *bnxt_rx_agg_pages_skb(struct bnxt *bp,
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1287  					     struct bnxt_cp_ring_info *cpr,
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1288  					     struct sk_buff *skb, u16 idx,
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1289  					     u32 agg_bufs, bool tpa)
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1290  {
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1291  	struct skb_shared_info *shinfo = skb_shinfo(skb);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1292  	u32 total_frag_len = 0;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1293  
31b9998bf225ec Andy Gospodarek 2022-04-08  1294  	total_frag_len = __bnxt_rx_agg_pages(bp, cpr, shinfo, idx,
31b9998bf225ec Andy Gospodarek 2022-04-08  1295  					     agg_bufs, tpa, NULL);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1296  	if (!total_frag_len) {
86b05508f7759f Somnath Kotur   2023-08-17  1297  		skb_mark_for_recycle(skb);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1298  		dev_kfree_skb(skb);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1299  		return NULL;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1300  	}
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1301  
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1302  	skb->data_len += total_frag_len;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1303  	skb->len += total_frag_len;
f6974b4c2d8e10 Somnath Kotur   2023-07-31  1304  	skb->truesize += BNXT_RX_PAGE_SIZE * agg_bufs;
c0c050c58d8409 Michael Chan    2015-10-22  1305  	return skb;
c0c050c58d8409 Michael Chan    2015-10-22  1306  }
c0c050c58d8409 Michael Chan    2015-10-22  1307  
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1308  static u32 bnxt_rx_agg_pages_xdp(struct bnxt *bp,
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1309  				 struct bnxt_cp_ring_info *cpr,
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1310  				 struct xdp_buff *xdp, u16 idx,
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1311  				 u32 agg_bufs, bool tpa)
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1312  {
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1313  	struct skb_shared_info *shinfo = xdp_get_shared_info_from_buff(xdp);
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1314  	u32 total_frag_len = 0;
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1315  
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1316  	if (!xdp_buff_has_frags(xdp))
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1317  		shinfo->nr_frags = 0;
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1318  
31b9998bf225ec Andy Gospodarek 2022-04-08  1319  	total_frag_len = __bnxt_rx_agg_pages(bp, cpr, shinfo,
31b9998bf225ec Andy Gospodarek 2022-04-08  1320  					     idx, agg_bufs, tpa, xdp);
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1321  	if (total_frag_len) {
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1322  		xdp_buff_set_frags_flag(xdp);
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1323  		shinfo->nr_frags = agg_bufs;
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1324  		shinfo->xdp_frags_size = total_frag_len;
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1325  	}
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1326  	return total_frag_len;
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1327  }
4c6c123c9af9c9 Andy Gospodarek 2022-04-08  1328  
c0c050c58d8409 Michael Chan    2015-10-22  1329  static int bnxt_agg_bufs_valid(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
c0c050c58d8409 Michael Chan    2015-10-22  1330  			       u8 agg_bufs, u32 *raw_cons)
c0c050c58d8409 Michael Chan    2015-10-22  1331  {
c0c050c58d8409 Michael Chan    2015-10-22  1332  	u16 last;
c0c050c58d8409 Michael Chan    2015-10-22  1333  	struct rx_agg_cmp *agg;
c0c050c58d8409 Michael Chan    2015-10-22  1334  
c0c050c58d8409 Michael Chan    2015-10-22  1335  	*raw_cons = ADV_RAW_CMP(*raw_cons, agg_bufs);
c0c050c58d8409 Michael Chan    2015-10-22  1336  	last = RING_CMP(*raw_cons);
c0c050c58d8409 Michael Chan    2015-10-22  1337  	agg = (struct rx_agg_cmp *)
c0c050c58d8409 Michael Chan    2015-10-22  1338  		&cpr->cp_desc_ring[CP_RING(last)][CP_IDX(last)];
c0c050c58d8409 Michael Chan    2015-10-22  1339  	return RX_AGG_CMP_VALID(agg, *raw_cons);
c0c050c58d8409 Michael Chan    2015-10-22  1340  }
c0c050c58d8409 Michael Chan    2015-10-22  1341  
431e37cd471b9e Taehee Yoo      2025-03-31  1342  static struct sk_buff *bnxt_copy_data(struct bnxt_napi *bnapi,
431e37cd471b9e Taehee Yoo      2025-03-31  1343  				      struct page *page,
431e37cd471b9e Taehee Yoo      2025-03-31  1344  				      unsigned int offset,
431e37cd471b9e Taehee Yoo      2025-03-31  1345  				      unsigned int len)
c0c050c58d8409 Michael Chan    2015-10-22  1346  {
431e37cd471b9e Taehee Yoo      2025-03-31  1347  	struct bnxt_rx_ring_info *rxr = bnapi->rx_ring;
c0c050c58d8409 Michael Chan    2015-10-22  1348  	struct bnxt *bp = bnapi->bp;
c0c050c58d8409 Michael Chan    2015-10-22  1349  	struct sk_buff *skb;
c0c050c58d8409 Michael Chan    2015-10-22  1350  
c0c050c58d8409 Michael Chan    2015-10-22  1351  	skb = napi_alloc_skb(&bnapi->napi, len);
c0c050c58d8409 Michael Chan    2015-10-22  1352  	if (!skb)
c0c050c58d8409 Michael Chan    2015-10-22  1353  		return NULL;
c0c050c58d8409 Michael Chan    2015-10-22  1354  
431e37cd471b9e Taehee Yoo      2025-03-31  1355  	page_pool_dma_sync_for_cpu(rxr->head_pool, page,
431e37cd471b9e Taehee Yoo      2025-03-31  1356  				   offset + bp->rx_dma_offset,
431e37cd471b9e Taehee Yoo      2025-03-31  1357  				   bp->rx_copybreak);
c0c050c58d8409 Michael Chan    2015-10-22  1358  
431e37cd471b9e Taehee Yoo      2025-03-31  1359  	memcpy(skb->data - NET_IP_ALIGN,
431e37cd471b9e Taehee Yoo      2025-03-31  1360  	       bnxt_data_ptr(bp, page, offset) - NET_IP_ALIGN,
6bb19474391d17 Michael Chan    2017-02-06  1361  	       len + NET_IP_ALIGN);
c0c050c58d8409 Michael Chan    2015-10-22  1362  
431e37cd471b9e Taehee Yoo      2025-03-31  1363  	page_pool_dma_sync_for_device(rxr->head_pool, page_to_netmem(page),
431e37cd471b9e Taehee Yoo      2025-03-31  1364  				      bp->rx_dma_offset, bp->rx_copybreak);
c0c050c58d8409 Michael Chan    2015-10-22  1365  	skb_put(skb, len);
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1366  
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1367  	return skb;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1368  }
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1369  
431e37cd471b9e Taehee Yoo      2025-03-31  1370  static struct sk_buff *bnxt_copy_skb(struct bnxt_napi *bnapi,
431e37cd471b9e Taehee Yoo      2025-03-31  1371  				     struct page *page,
431e37cd471b9e Taehee Yoo      2025-03-31  1372  				     unsigned int offset,
431e37cd471b9e Taehee Yoo      2025-03-31  1373  				     unsigned int len)
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1374  {
431e37cd471b9e Taehee Yoo      2025-03-31  1375  	return bnxt_copy_data(bnapi, page, offset, len);
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1376  }
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1377  
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1378  static struct sk_buff *bnxt_copy_xdp(struct bnxt_napi *bnapi,
431e37cd471b9e Taehee Yoo      2025-03-31  1379  				     struct page *page,
431e37cd471b9e Taehee Yoo      2025-03-31  1380  				     unsigned int offset,
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1381  				     struct xdp_buff *xdp,
431e37cd471b9e Taehee Yoo      2025-03-31  1382  				     unsigned int len)
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1383  {
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1384  	unsigned int metasize = 0;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02 @1385  	u8 *data = xdp->data;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1386  	struct sk_buff *skb;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1387  
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1388  	len = xdp->data_end - xdp->data_meta;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1389  	metasize = xdp->data - xdp->data_meta;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1390  	data = xdp->data_meta;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1391  
431e37cd471b9e Taehee Yoo      2025-03-31  1392  	skb = bnxt_copy_data(bnapi, page, offset, len);
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1393  	if (!skb)
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1394  		return skb;
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1395  
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1396  	if (metasize) {
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1397  		skb_metadata_set(skb, metasize);
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1398  		__skb_pull(skb, metasize);
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1399  	}
0ae1fafc8be6d4 Somnath Kotur   2024-04-02  1400  
c0c050c58d8409 Michael Chan    2015-10-22  1401  	return skb;
c0c050c58d8409 Michael Chan    2015-10-22  1402  }
c0c050c58d8409 Michael Chan    2015-10-22  1403  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
