Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3672D745DA;
	Thu, 21 Dec 2023 20:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCqkEeac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703190302; x=1734726302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNzCnCb79u7Ew3tXfKvGwXkzBCjlKygQwmHWFpAjdKs=;
  b=bCqkEeac77d9i5oLvExu1OEllV4jaHWM9AxxNohzyUdd7TNWEz0ISr9/
   wSu/NMJzFv3QB07BO0Ocky3X6h2eqtTPP8L4HmEDkh5sGe6aSZgBlqB+Z
   1o6gJSqdayohJzoY42JI/47Hr/jLJSKhrNePvjkZWvT8MqPZPZ98Q2zvz
   WMKEzdwtSdQPISgV4IZOk7QdV8TSW0xbE18Kw6MMT36D0hYNbYz/XwJXw
   q9rXCDH86lGjVMWZyhDP+8ZVo1INmw7gS0cBsqskdtg9VB+SHXW/QOzKJ
   /Sqn2sky7RdjM0ZN0IS1ECVAGMN2OFqmmi/tByJ7Soty4lNxH0KFlyW4o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9410062"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9410062"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 12:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="867427292"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="867427292"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2023 12:24:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGPbC-0008gb-1T;
	Thu, 21 Dec 2023 20:24:56 +0000
Date: Fri, 22 Dec 2023 04:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 28/43]
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2266:12: error: no member
 named 'mem' in 'struct xdp_frame'
Message-ID: <202312220402.3V9lGgcI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   e944237df3e149d8d67f1a27ca54fc98d5d745cf
commit: 4e8e6162ad16b75af48bbaf17316accaf90954e6 [28/43] xdp: get rid of xdp_frame::mem.id
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231222/202312220402.3V9lGgcI-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220402.3V9lGgcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220402.3V9lGgcI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2266:12: error: no member named 'mem' in 'struct xdp_frame'
    2266 |         new_xdpf->mem.type = MEM_TYPE_PAGE_ORDER0;
         |         ~~~~~~~~  ^
   1 error generated.


vim +2266 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c

ae680bcbd06ae9 Camelia Groza 2020-11-25  2194  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2195  static int dpaa_a050385_wa_xdpf(struct dpaa_priv *priv,
ae680bcbd06ae9 Camelia Groza 2020-11-25  2196  				struct xdp_frame **init_xdpf)
ae680bcbd06ae9 Camelia Groza 2020-11-25  2197  {
ae680bcbd06ae9 Camelia Groza 2020-11-25  2198  	struct xdp_frame *new_xdpf, *xdpf = *init_xdpf;
0a9946cca1a30b Camelia Groza 2021-02-04  2199  	void *new_buff, *aligned_data;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2200  	struct page *p;
0a9946cca1a30b Camelia Groza 2021-02-04  2201  	u32 data_shift;
275a9c72b420e5 Camelia Groza 2021-02-04  2202  	int headroom;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2203  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2204  	/* Check the data alignment and make sure the headroom is large
ae680bcbd06ae9 Camelia Groza 2020-11-25  2205  	 * enough to store the xdpf backpointer. Use an aligned headroom
ae680bcbd06ae9 Camelia Groza 2020-11-25  2206  	 * value.
ae680bcbd06ae9 Camelia Groza 2020-11-25  2207  	 *
ae680bcbd06ae9 Camelia Groza 2020-11-25  2208  	 * Due to alignment constraints, we give XDP access to the full 256
ae680bcbd06ae9 Camelia Groza 2020-11-25  2209  	 * byte frame headroom. If the XDP program uses all of it, copy the
ae680bcbd06ae9 Camelia Groza 2020-11-25  2210  	 * data to a new buffer and make room for storing the backpointer.
ae680bcbd06ae9 Camelia Groza 2020-11-25  2211  	 */
c2b0e8455eb761 Camelia Groza 2021-02-04  2212  	if (PTR_IS_ALIGNED(xdpf->data, DPAA_FD_DATA_ALIGNMENT) &&
ae680bcbd06ae9 Camelia Groza 2020-11-25  2213  	    xdpf->headroom >= priv->tx_headroom) {
ae680bcbd06ae9 Camelia Groza 2020-11-25  2214  		xdpf->headroom = priv->tx_headroom;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2215  		return 0;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2216  	}
ae680bcbd06ae9 Camelia Groza 2020-11-25  2217  
0a9946cca1a30b Camelia Groza 2021-02-04  2218  	/* Try to move the data inside the buffer just enough to align it and
0a9946cca1a30b Camelia Groza 2021-02-04  2219  	 * store the xdpf backpointer. If the available headroom isn't large
0a9946cca1a30b Camelia Groza 2021-02-04  2220  	 * enough, resort to allocating a new buffer and copying the data.
0a9946cca1a30b Camelia Groza 2021-02-04  2221  	 */
0a9946cca1a30b Camelia Groza 2021-02-04  2222  	aligned_data = PTR_ALIGN_DOWN(xdpf->data, DPAA_FD_DATA_ALIGNMENT);
0a9946cca1a30b Camelia Groza 2021-02-04  2223  	data_shift = xdpf->data - aligned_data;
0a9946cca1a30b Camelia Groza 2021-02-04  2224  
0a9946cca1a30b Camelia Groza 2021-02-04  2225  	/* The XDP frame's headroom needs to be large enough to accommodate
0a9946cca1a30b Camelia Groza 2021-02-04  2226  	 * shifting the data as well as storing the xdpf backpointer.
0a9946cca1a30b Camelia Groza 2021-02-04  2227  	 */
0a9946cca1a30b Camelia Groza 2021-02-04  2228  	if (xdpf->headroom  >= data_shift + priv->tx_headroom) {
0a9946cca1a30b Camelia Groza 2021-02-04  2229  		memmove(aligned_data, xdpf->data, xdpf->len);
0a9946cca1a30b Camelia Groza 2021-02-04  2230  		xdpf->data = aligned_data;
0a9946cca1a30b Camelia Groza 2021-02-04  2231  		xdpf->headroom = priv->tx_headroom;
0a9946cca1a30b Camelia Groza 2021-02-04  2232  		return 0;
0a9946cca1a30b Camelia Groza 2021-02-04  2233  	}
0a9946cca1a30b Camelia Groza 2021-02-04  2234  
275a9c72b420e5 Camelia Groza 2021-02-04  2235  	/* The new xdp_frame is stored in the new buffer. Reserve enough space
275a9c72b420e5 Camelia Groza 2021-02-04  2236  	 * in the headroom for storing it along with the driver's private
275a9c72b420e5 Camelia Groza 2021-02-04  2237  	 * info. The headroom needs to be aligned to DPAA_FD_DATA_ALIGNMENT to
275a9c72b420e5 Camelia Groza 2021-02-04  2238  	 * guarantee the data's alignment in the buffer.
275a9c72b420e5 Camelia Groza 2021-02-04  2239  	 */
275a9c72b420e5 Camelia Groza 2021-02-04  2240  	headroom = ALIGN(sizeof(*new_xdpf) + priv->tx_headroom,
275a9c72b420e5 Camelia Groza 2021-02-04  2241  			 DPAA_FD_DATA_ALIGNMENT);
275a9c72b420e5 Camelia Groza 2021-02-04  2242  
275a9c72b420e5 Camelia Groza 2021-02-04  2243  	/* Assure the extended headroom and data don't overflow the buffer,
275a9c72b420e5 Camelia Groza 2021-02-04  2244  	 * while maintaining the mandatory tailroom.
275a9c72b420e5 Camelia Groza 2021-02-04  2245  	 */
275a9c72b420e5 Camelia Groza 2021-02-04  2246  	if (headroom + xdpf->len > DPAA_BP_RAW_SIZE -
275a9c72b420e5 Camelia Groza 2021-02-04  2247  			SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
275a9c72b420e5 Camelia Groza 2021-02-04  2248  		return -ENOMEM;
275a9c72b420e5 Camelia Groza 2021-02-04  2249  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2250  	p = dev_alloc_pages(0);
ae680bcbd06ae9 Camelia Groza 2020-11-25  2251  	if (unlikely(!p))
ae680bcbd06ae9 Camelia Groza 2020-11-25  2252  		return -ENOMEM;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2253  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2254  	/* Copy the data to the new buffer at a properly aligned offset */
ae680bcbd06ae9 Camelia Groza 2020-11-25  2255  	new_buff = page_address(p);
275a9c72b420e5 Camelia Groza 2021-02-04  2256  	memcpy(new_buff + headroom, xdpf->data, xdpf->len);
ae680bcbd06ae9 Camelia Groza 2020-11-25  2257  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2258  	/* Create an XDP frame around the new buffer in a similar fashion
ae680bcbd06ae9 Camelia Groza 2020-11-25  2259  	 * to xdp_convert_buff_to_frame.
ae680bcbd06ae9 Camelia Groza 2020-11-25  2260  	 */
ae680bcbd06ae9 Camelia Groza 2020-11-25  2261  	new_xdpf = new_buff;
275a9c72b420e5 Camelia Groza 2021-02-04  2262  	new_xdpf->data = new_buff + headroom;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2263  	new_xdpf->len = xdpf->len;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2264  	new_xdpf->headroom = priv->tx_headroom;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2265  	new_xdpf->frame_sz = DPAA_BP_RAW_SIZE;
ae680bcbd06ae9 Camelia Groza 2020-11-25 @2266  	new_xdpf->mem.type = MEM_TYPE_PAGE_ORDER0;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2267  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2268  	/* Release the initial buffer */
ae680bcbd06ae9 Camelia Groza 2020-11-25  2269  	xdp_return_frame_rx_napi(xdpf);
ae680bcbd06ae9 Camelia Groza 2020-11-25  2270  
ae680bcbd06ae9 Camelia Groza 2020-11-25  2271  	*init_xdpf = new_xdpf;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2272  	return 0;
ae680bcbd06ae9 Camelia Groza 2020-11-25  2273  }
3c68b8fffb48c0 Madalin Bucur 2020-03-04  2274  #endif
3c68b8fffb48c0 Madalin Bucur 2020-03-04  2275  

:::::: The code at line 2266 was first introduced by commit
:::::: ae680bcbd06ae9189e0102f8cdb5fd938b00725f dpaa_eth: implement the A050385 erratum workaround for XDP

:::::: TO: Camelia Groza <camelia.groza@nxp.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
