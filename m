Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D51FCC;
	Mon, 15 May 2023 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684139653; x=1715675653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBez6Osb3OlGCqZ1FORtebia4bdETu5ihFp5/WRngdA=;
  b=cWutusLT7GwDd03jWfQuEUY+AJX/tBtFpUWhjHWGLVEEWFWTQ7zx1Zrd
   wfOfUd0dhYuvhuDKLNhob/i3X0YZBJ91n/vlgA+yFvZCJ5M9H9X/roSlj
   FUt+VBIQUI4G5iThAhVwoTiwUmiA9u7Y8SSpB63iMTNRu54b4nLaYZYxL
   mQpANj1PZveLT66n+WolMKGDAXYSJPntVqMUQ94uIixNdHlpzRHMzgiFf
   DNGDFfiZVvoCVrDMQcO8OTZFYv1Iyqxk0gCMcfIZDDdbebyLT8i3MR6iz
   QFKjkytbj9n6F+fg4ByfapbPcz3nXoyajUYNqFiKucZf9NfM3WKQmYDlt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="348639209"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="348639209"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 01:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="947341666"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="947341666"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 May 2023 01:34:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyTeZ-0006Hm-2A;
	Mon, 15 May 2023 08:33:59 +0000
Date: Mon, 15 May 2023 16:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 6232/9999]
 drivers/net/xen-netback/netback.c:884:7: warning: variable 'pending_idx' set
 but not used
Message-ID: <202305151632.JxTOC5q5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   b0ece631f84a3e70341496b000b094b7dfdf4e5f
commit: 0fe29bd92594a747a2561589bd452c259451929e [6232/9999] xen/netback: Ensure protocol headers don't fall in the non-linear area
config: i386-randconfig-i064-20230515 (https://download.01.org/0day-ci/archive/20230515/202305151632.JxTOC5q5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0fe29bd92594a747a2561589bd452c259451929e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 0fe29bd92594a747a2561589bd452c259451929e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/xen-netback/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305151632.JxTOC5q5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/xen-netback/netback.c:884:7: warning: variable 'pending_idx' set but not used [-Wunused-but-set-variable]
                   u16 pending_idx;
                       ^
   1 warning generated.


vim +/pending_idx +884 drivers/net/xen-netback/netback.c

210c34dcd8d912 Paul Durrant   2015-09-02   869  
e9ce7cb6b10740 Wei Liu        2014-06-04   870  static void xenvif_tx_build_gops(struct xenvif_queue *queue,
bdab82759b8e36 Zoltan Kiss    2014-04-02   871  				     int budget,
bdab82759b8e36 Zoltan Kiss    2014-04-02   872  				     unsigned *copy_ops,
bdab82759b8e36 Zoltan Kiss    2014-04-02   873  				     unsigned *map_ops)
f942dc2552b8bf Ian Campbell   2011-03-15   874  {
2475b22526d702 Ross Lagerwall 2015-08-03   875  	struct sk_buff *skb, *nskb;
f942dc2552b8bf Ian Campbell   2011-03-15   876  	int ret;
2475b22526d702 Ross Lagerwall 2015-08-03   877  	unsigned int frag_overflow;
f942dc2552b8bf Ian Campbell   2011-03-15   878  
e9ce7cb6b10740 Wei Liu        2014-06-04   879  	while (skb_queue_len(&queue->tx_queue) < budget) {
f942dc2552b8bf Ian Campbell   2011-03-15   880  		struct xen_netif_tx_request txreq;
376414945d15aa Wei Liu        2013-05-02   881  		struct xen_netif_tx_request txfrags[XEN_NETBK_LEGACY_SLOTS_MAX];
f942dc2552b8bf Ian Campbell   2011-03-15   882  		struct xen_netif_extra_info extras[XEN_NETIF_EXTRA_TYPE_MAX-1];
562abd39a19027 Paul Durrant   2016-03-10   883  		unsigned int extra_count;
f942dc2552b8bf Ian Campbell   2011-03-15  @884  		u16 pending_idx;
f942dc2552b8bf Ian Campbell   2011-03-15   885  		RING_IDX idx;
f942dc2552b8bf Ian Campbell   2011-03-15   886  		int work_to_do;
f942dc2552b8bf Ian Campbell   2011-03-15   887  		unsigned int data_len;
f942dc2552b8bf Ian Campbell   2011-03-15   888  		pending_ring_idx_t index;
f942dc2552b8bf Ian Campbell   2011-03-15   889  
e9ce7cb6b10740 Wei Liu        2014-06-04   890  		if (queue->tx.sring->req_prod - queue->tx.req_cons >
48856286b64e4b Ian Campbell   2013-02-06   891  		    XEN_NETIF_TX_RING_SIZE) {
e9ce7cb6b10740 Wei Liu        2014-06-04   892  			netdev_err(queue->vif->dev,
48856286b64e4b Ian Campbell   2013-02-06   893  				   "Impossible number of requests. "
48856286b64e4b Ian Campbell   2013-02-06   894  				   "req_prod %d, req_cons %d, size %ld\n",
e9ce7cb6b10740 Wei Liu        2014-06-04   895  				   queue->tx.sring->req_prod, queue->tx.req_cons,
48856286b64e4b Ian Campbell   2013-02-06   896  				   XEN_NETIF_TX_RING_SIZE);
e9ce7cb6b10740 Wei Liu        2014-06-04   897  			xenvif_fatal_tx_err(queue->vif);
e9d8b2c2968499 Wei Liu        2014-04-01   898  			break;
48856286b64e4b Ian Campbell   2013-02-06   899  		}
48856286b64e4b Ian Campbell   2013-02-06   900  
e9ce7cb6b10740 Wei Liu        2014-06-04   901  		work_to_do = RING_HAS_UNCONSUMED_REQUESTS(&queue->tx);
b3f980bd827e6e Wei Liu        2013-08-26   902  		if (!work_to_do)
b3f980bd827e6e Wei Liu        2013-08-26   903  			break;
f942dc2552b8bf Ian Campbell   2011-03-15   904  
e9ce7cb6b10740 Wei Liu        2014-06-04   905  		idx = queue->tx.req_cons;
f942dc2552b8bf Ian Campbell   2011-03-15   906  		rmb(); /* Ensure that we see the request before we copy it. */
68a33bfd8403e4 David Vrabel   2015-10-30   907  		RING_COPY_REQUEST(&queue->tx, idx, &txreq);
f942dc2552b8bf Ian Campbell   2011-03-15   908  
f942dc2552b8bf Ian Campbell   2011-03-15   909  		/* Credit-based scheduling. */
e9ce7cb6b10740 Wei Liu        2014-06-04   910  		if (txreq.size > queue->remaining_credit &&
e9ce7cb6b10740 Wei Liu        2014-06-04   911  		    tx_credit_exceeded(queue, txreq.size))
b3f980bd827e6e Wei Liu        2013-08-26   912  			break;
f942dc2552b8bf Ian Campbell   2011-03-15   913  
e9ce7cb6b10740 Wei Liu        2014-06-04   914  		queue->remaining_credit -= txreq.size;
f942dc2552b8bf Ian Campbell   2011-03-15   915  
f942dc2552b8bf Ian Campbell   2011-03-15   916  		work_to_do--;
e9ce7cb6b10740 Wei Liu        2014-06-04   917  		queue->tx.req_cons = ++idx;
f942dc2552b8bf Ian Campbell   2011-03-15   918  
f942dc2552b8bf Ian Campbell   2011-03-15   919  		memset(extras, 0, sizeof(extras));
562abd39a19027 Paul Durrant   2016-03-10   920  		extra_count = 0;
f942dc2552b8bf Ian Campbell   2011-03-15   921  		if (txreq.flags & XEN_NETTXF_extra_info) {
e9ce7cb6b10740 Wei Liu        2014-06-04   922  			work_to_do = xenvif_get_extras(queue, extras,
562abd39a19027 Paul Durrant   2016-03-10   923  						       &extra_count,
f942dc2552b8bf Ian Campbell   2011-03-15   924  						       work_to_do);
e9ce7cb6b10740 Wei Liu        2014-06-04   925  			idx = queue->tx.req_cons;
48856286b64e4b Ian Campbell   2013-02-06   926  			if (unlikely(work_to_do < 0))
b3f980bd827e6e Wei Liu        2013-08-26   927  				break;
f942dc2552b8bf Ian Campbell   2011-03-15   928  		}
f942dc2552b8bf Ian Campbell   2011-03-15   929  
210c34dcd8d912 Paul Durrant   2015-09-02   930  		if (extras[XEN_NETIF_EXTRA_TYPE_MCAST_ADD - 1].type) {
210c34dcd8d912 Paul Durrant   2015-09-02   931  			struct xen_netif_extra_info *extra;
210c34dcd8d912 Paul Durrant   2015-09-02   932  
210c34dcd8d912 Paul Durrant   2015-09-02   933  			extra = &extras[XEN_NETIF_EXTRA_TYPE_MCAST_ADD - 1];
210c34dcd8d912 Paul Durrant   2015-09-02   934  			ret = xenvif_mcast_add(queue->vif, extra->u.mcast.addr);
210c34dcd8d912 Paul Durrant   2015-09-02   935  
562abd39a19027 Paul Durrant   2016-03-10   936  			make_tx_response(queue, &txreq, extra_count,
210c34dcd8d912 Paul Durrant   2015-09-02   937  					 (ret == 0) ?
210c34dcd8d912 Paul Durrant   2015-09-02   938  					 XEN_NETIF_RSP_OKAY :
210c34dcd8d912 Paul Durrant   2015-09-02   939  					 XEN_NETIF_RSP_ERROR);
210c34dcd8d912 Paul Durrant   2015-09-02   940  			push_tx_responses(queue);
210c34dcd8d912 Paul Durrant   2015-09-02   941  			continue;
210c34dcd8d912 Paul Durrant   2015-09-02   942  		}
210c34dcd8d912 Paul Durrant   2015-09-02   943  
210c34dcd8d912 Paul Durrant   2015-09-02   944  		if (extras[XEN_NETIF_EXTRA_TYPE_MCAST_DEL - 1].type) {
210c34dcd8d912 Paul Durrant   2015-09-02   945  			struct xen_netif_extra_info *extra;
210c34dcd8d912 Paul Durrant   2015-09-02   946  
210c34dcd8d912 Paul Durrant   2015-09-02   947  			extra = &extras[XEN_NETIF_EXTRA_TYPE_MCAST_DEL - 1];
210c34dcd8d912 Paul Durrant   2015-09-02   948  			xenvif_mcast_del(queue->vif, extra->u.mcast.addr);
210c34dcd8d912 Paul Durrant   2015-09-02   949  
562abd39a19027 Paul Durrant   2016-03-10   950  			make_tx_response(queue, &txreq, extra_count,
562abd39a19027 Paul Durrant   2016-03-10   951  					 XEN_NETIF_RSP_OKAY);
210c34dcd8d912 Paul Durrant   2015-09-02   952  			push_tx_responses(queue);
210c34dcd8d912 Paul Durrant   2015-09-02   953  			continue;
210c34dcd8d912 Paul Durrant   2015-09-02   954  		}
210c34dcd8d912 Paul Durrant   2015-09-02   955  
0fe29bd92594a7 Ross Lagerwall 2022-11-22   956  		data_len = (txreq.size > XEN_NETBACK_TX_COPY_LEN) ?
0fe29bd92594a7 Ross Lagerwall 2022-11-22   957  			XEN_NETBACK_TX_COPY_LEN : txreq.size;
0fe29bd92594a7 Ross Lagerwall 2022-11-22   958  
562abd39a19027 Paul Durrant   2016-03-10   959  		ret = xenvif_count_requests(queue, &txreq, extra_count,
562abd39a19027 Paul Durrant   2016-03-10   960  					    txfrags, work_to_do);
0fe29bd92594a7 Ross Lagerwall 2022-11-22   961  
48856286b64e4b Ian Campbell   2013-02-06   962  		if (unlikely(ret < 0))
b3f980bd827e6e Wei Liu        2013-08-26   963  			break;
48856286b64e4b Ian Campbell   2013-02-06   964  
f942dc2552b8bf Ian Campbell   2011-03-15   965  		idx += ret;
f942dc2552b8bf Ian Campbell   2011-03-15   966  
f942dc2552b8bf Ian Campbell   2011-03-15   967  		if (unlikely(txreq.size < ETH_HLEN)) {
e9ce7cb6b10740 Wei Liu        2014-06-04   968  			netdev_dbg(queue->vif->dev,
f942dc2552b8bf Ian Campbell   2011-03-15   969  				   "Bad packet size: %d\n", txreq.size);
562abd39a19027 Paul Durrant   2016-03-10   970  			xenvif_tx_err(queue, &txreq, extra_count, idx);
b3f980bd827e6e Wei Liu        2013-08-26   971  			break;
f942dc2552b8bf Ian Campbell   2011-03-15   972  		}
f942dc2552b8bf Ian Campbell   2011-03-15   973  
f942dc2552b8bf Ian Campbell   2011-03-15   974  		/* No crossing a page as the payload mustn't fragment. */
d0089e8a0e4c97 Julien Grall   2015-05-05   975  		if (unlikely((txreq.offset + txreq.size) > XEN_PAGE_SIZE)) {
e9ce7cb6b10740 Wei Liu        2014-06-04   976  			netdev_err(queue->vif->dev,
68946159da1b0b Julien Grall   2015-06-16   977  				   "txreq.offset: %u, size: %u, end: %lu\n",
f942dc2552b8bf Ian Campbell   2011-03-15   978  				   txreq.offset, txreq.size,
d0089e8a0e4c97 Julien Grall   2015-05-05   979  				   (unsigned long)(txreq.offset&~XEN_PAGE_MASK) + txreq.size);
e9ce7cb6b10740 Wei Liu        2014-06-04   980  			xenvif_fatal_tx_err(queue->vif);
b3f980bd827e6e Wei Liu        2013-08-26   981  			break;
f942dc2552b8bf Ian Campbell   2011-03-15   982  		}
f942dc2552b8bf Ian Campbell   2011-03-15   983  
e9ce7cb6b10740 Wei Liu        2014-06-04   984  		index = pending_index(queue->pending_cons);
e9ce7cb6b10740 Wei Liu        2014-06-04   985  		pending_idx = queue->pending_ring[index];
f942dc2552b8bf Ian Campbell   2011-03-15   986  
0fe29bd92594a7 Ross Lagerwall 2022-11-22   987  		if (ret >= XEN_NETBK_LEGACY_SLOTS_MAX - 1 && data_len < txreq.size)
0fe29bd92594a7 Ross Lagerwall 2022-11-22   988  			data_len = txreq.size;
f942dc2552b8bf Ian Campbell   2011-03-15   989  
e3377f36ca20a0 Zoltan Kiss    2014-03-06   990  		skb = xenvif_alloc_skb(data_len);
f942dc2552b8bf Ian Campbell   2011-03-15   991  		if (unlikely(skb == NULL)) {
e9ce7cb6b10740 Wei Liu        2014-06-04   992  			netdev_dbg(queue->vif->dev,
f942dc2552b8bf Ian Campbell   2011-03-15   993  				   "Can't allocate a skb in start_xmit.\n");
562abd39a19027 Paul Durrant   2016-03-10   994  			xenvif_tx_err(queue, &txreq, extra_count, idx);
f942dc2552b8bf Ian Campbell   2011-03-15   995  			break;
f942dc2552b8bf Ian Campbell   2011-03-15   996  		}
f942dc2552b8bf Ian Campbell   2011-03-15   997  
2475b22526d702 Ross Lagerwall 2015-08-03   998  		skb_shinfo(skb)->nr_frags = ret;
2475b22526d702 Ross Lagerwall 2015-08-03   999  		/* At this point shinfo->nr_frags is in fact the number of
2475b22526d702 Ross Lagerwall 2015-08-03  1000  		 * slots, which can be as large as XEN_NETBK_LEGACY_SLOTS_MAX.
2475b22526d702 Ross Lagerwall 2015-08-03  1001  		 */
2475b22526d702 Ross Lagerwall 2015-08-03  1002  		frag_overflow = 0;
2475b22526d702 Ross Lagerwall 2015-08-03  1003  		nskb = NULL;
2475b22526d702 Ross Lagerwall 2015-08-03  1004  		if (skb_shinfo(skb)->nr_frags > MAX_SKB_FRAGS) {
2475b22526d702 Ross Lagerwall 2015-08-03  1005  			frag_overflow = skb_shinfo(skb)->nr_frags - MAX_SKB_FRAGS;
2475b22526d702 Ross Lagerwall 2015-08-03  1006  			BUG_ON(frag_overflow > MAX_SKB_FRAGS);
2475b22526d702 Ross Lagerwall 2015-08-03  1007  			skb_shinfo(skb)->nr_frags = MAX_SKB_FRAGS;
2475b22526d702 Ross Lagerwall 2015-08-03  1008  			nskb = xenvif_alloc_skb(0);
2475b22526d702 Ross Lagerwall 2015-08-03  1009  			if (unlikely(nskb == NULL)) {
3a0233ddec554b Ross Lagerwall 2019-08-05  1010  				skb_shinfo(skb)->nr_frags = 0;
2475b22526d702 Ross Lagerwall 2015-08-03  1011  				kfree_skb(skb);
562abd39a19027 Paul Durrant   2016-03-10  1012  				xenvif_tx_err(queue, &txreq, extra_count, idx);
2475b22526d702 Ross Lagerwall 2015-08-03  1013  				if (net_ratelimit())
2475b22526d702 Ross Lagerwall 2015-08-03  1014  					netdev_err(queue->vif->dev,
2475b22526d702 Ross Lagerwall 2015-08-03  1015  						   "Can't allocate the frag_list skb.\n");
2475b22526d702 Ross Lagerwall 2015-08-03  1016  				break;
2475b22526d702 Ross Lagerwall 2015-08-03  1017  			}
2475b22526d702 Ross Lagerwall 2015-08-03  1018  		}
2475b22526d702 Ross Lagerwall 2015-08-03  1019  
f942dc2552b8bf Ian Campbell   2011-03-15  1020  		if (extras[XEN_NETIF_EXTRA_TYPE_GSO - 1].type) {
f942dc2552b8bf Ian Campbell   2011-03-15  1021  			struct xen_netif_extra_info *gso;
f942dc2552b8bf Ian Campbell   2011-03-15  1022  			gso = &extras[XEN_NETIF_EXTRA_TYPE_GSO - 1];
f942dc2552b8bf Ian Campbell   2011-03-15  1023  
e9ce7cb6b10740 Wei Liu        2014-06-04  1024  			if (xenvif_set_skb_gso(queue->vif, skb, gso)) {
7376419a469765 Wei Liu        2013-08-26  1025  				/* Failure in xenvif_set_skb_gso is fatal. */
3a0233ddec554b Ross Lagerwall 2019-08-05  1026  				skb_shinfo(skb)->nr_frags = 0;
f942dc2552b8bf Ian Campbell   2011-03-15  1027  				kfree_skb(skb);
2475b22526d702 Ross Lagerwall 2015-08-03  1028  				kfree_skb(nskb);
b3f980bd827e6e Wei Liu        2013-08-26  1029  				break;
f942dc2552b8bf Ian Campbell   2011-03-15  1030  			}
f942dc2552b8bf Ian Campbell   2011-03-15  1031  		}
f942dc2552b8bf Ian Campbell   2011-03-15  1032  
c2d09fde7299f6 Paul Durrant   2016-05-13  1033  		if (extras[XEN_NETIF_EXTRA_TYPE_HASH - 1].type) {
c2d09fde7299f6 Paul Durrant   2016-05-13  1034  			struct xen_netif_extra_info *extra;
c2d09fde7299f6 Paul Durrant   2016-05-13  1035  			enum pkt_hash_types type = PKT_HASH_TYPE_NONE;
c2d09fde7299f6 Paul Durrant   2016-05-13  1036  
c2d09fde7299f6 Paul Durrant   2016-05-13  1037  			extra = &extras[XEN_NETIF_EXTRA_TYPE_HASH - 1];
c2d09fde7299f6 Paul Durrant   2016-05-13  1038  
c2d09fde7299f6 Paul Durrant   2016-05-13  1039  			switch (extra->u.hash.type) {
c2d09fde7299f6 Paul Durrant   2016-05-13  1040  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV4:
c2d09fde7299f6 Paul Durrant   2016-05-13  1041  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV6:
c2d09fde7299f6 Paul Durrant   2016-05-13  1042  				type = PKT_HASH_TYPE_L3;
c2d09fde7299f6 Paul Durrant   2016-05-13  1043  				break;
c2d09fde7299f6 Paul Durrant   2016-05-13  1044  
c2d09fde7299f6 Paul Durrant   2016-05-13  1045  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV4_TCP:
c2d09fde7299f6 Paul Durrant   2016-05-13  1046  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV6_TCP:
c2d09fde7299f6 Paul Durrant   2016-05-13  1047  				type = PKT_HASH_TYPE_L4;
c2d09fde7299f6 Paul Durrant   2016-05-13  1048  				break;
c2d09fde7299f6 Paul Durrant   2016-05-13  1049  
c2d09fde7299f6 Paul Durrant   2016-05-13  1050  			default:
c2d09fde7299f6 Paul Durrant   2016-05-13  1051  				break;
c2d09fde7299f6 Paul Durrant   2016-05-13  1052  			}
c2d09fde7299f6 Paul Durrant   2016-05-13  1053  
c2d09fde7299f6 Paul Durrant   2016-05-13  1054  			if (type != PKT_HASH_TYPE_NONE)
c2d09fde7299f6 Paul Durrant   2016-05-13  1055  				skb_set_hash(skb,
c2d09fde7299f6 Paul Durrant   2016-05-13  1056  					     *(u32 *)extra->u.hash.value,
c2d09fde7299f6 Paul Durrant   2016-05-13  1057  					     type);
c2d09fde7299f6 Paul Durrant   2016-05-13  1058  		}
c2d09fde7299f6 Paul Durrant   2016-05-13  1059  
0fe29bd92594a7 Ross Lagerwall 2022-11-22  1060  		xenvif_get_requests(queue, skb, &txreq, txfrags, copy_ops,
0fe29bd92594a7 Ross Lagerwall 2022-11-22  1061  				    map_ops, frag_overflow, nskb, extra_count,
0fe29bd92594a7 Ross Lagerwall 2022-11-22  1062  				    data_len);
f942dc2552b8bf Ian Campbell   2011-03-15  1063  
e9ce7cb6b10740 Wei Liu        2014-06-04  1064  		__skb_queue_tail(&queue->tx_queue, skb);
1e0b6eac6a150a Annie Li       2012-06-27  1065  
e9ce7cb6b10740 Wei Liu        2014-06-04  1066  		queue->tx.req_cons = idx;
f942dc2552b8bf Ian Campbell   2011-03-15  1067  
0fe29bd92594a7 Ross Lagerwall 2022-11-22  1068  		if ((*map_ops >= ARRAY_SIZE(queue->tx_map_ops)) ||
e9ce7cb6b10740 Wei Liu        2014-06-04  1069  		    (*copy_ops >= ARRAY_SIZE(queue->tx_copy_ops)))
f942dc2552b8bf Ian Campbell   2011-03-15  1070  			break;
f942dc2552b8bf Ian Campbell   2011-03-15  1071  	}
f942dc2552b8bf Ian Campbell   2011-03-15  1072  
bdab82759b8e36 Zoltan Kiss    2014-04-02  1073  	return;
f942dc2552b8bf Ian Campbell   2011-03-15  1074  }
f942dc2552b8bf Ian Campbell   2011-03-15  1075  

:::::: The code at line 884 was first introduced by commit
:::::: f942dc2552b8bfdee607be867b12a8971bb9cd85 xen network backend driver

:::::: TO: Ian Campbell <Ian.Campbell@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
