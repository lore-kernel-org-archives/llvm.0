Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAB4120B;
	Thu, 12 Jun 2025 01:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749691016; cv=none; b=IeAfjYI1J+ldID9QQhQ9siRBlMhGU7WH7B/+8/4pHQowt22mAYPB9I4A80UciQd22g18g28ks3644jpaNh3UymirEGX7bsbV+DcsUSpRWHLzapRk0k9c9QHdGi2UjA8KdcnWcr5WPzNOUv5DMNpeEuYVTrLsojs63BT34z4/UF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749691016; c=relaxed/simple;
	bh=MTa7otCB2Wo9neeMdM82dTa2A6VWYQKo/rAiioHcnkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBWAOcUhmbxrE671Nxc7fC9shkIM52MhQ+G/3i6guJMuPIWMs3E0KD8rjT6SdpjtQ8jPKNMXT7bu5H+hb8TQROfW7w3RBLJ2uYVj8v7VW8CBICq3hVWMjlG3sZuFNsPR5ILI9qyd1NWq57zS0lY6FTATKcUBwycFynhDwDLNyYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNY4ZinI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNY4ZinI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749691014; x=1781227014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTa7otCB2Wo9neeMdM82dTa2A6VWYQKo/rAiioHcnkU=;
  b=dNY4ZinIsqHSnBLPhU4NGxALFv/FXGCQ0qHBRKTvNGPrNwhdhMOL3kEW
   jTA8KmUkUebBdrQAoJEJKmkhR1F47VB3K7PYoksr/GOH72Vty2LK8mrGk
   qa/EzWk7na3Bx6u9CAe2p9AM9ci9TDELqiJ37LumttgGwPVlr5WoXQCt2
   9oDdvQ8fCTTKJPs25VwrvELH0HJr2oJVil90hswc5QG0L3UwXX+B2zM47
   4aCsFRiNFBJ9Nv7eAp6xiUjBN84oFVWBsofBxCiOHpwgkDEw9LYQmeaD4
   EH9QDqE4dnAYo7ztIxFDgqW28yUIYwG18MimeHxXqZNznaX87zNw9Gz5c
   A==;
X-CSE-ConnectionGUID: Tyc8EgB3S7yKlxlIgOzgAg==
X-CSE-MsgGUID: zEyl1CUPQfGeLC9AKxZC8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39466399"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="39466399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 18:16:53 -0700
X-CSE-ConnectionGUID: GHlB3+9CS3yUDwRYF81yxA==
X-CSE-MsgGUID: yr+/rY8UTDuzy4mEi1qSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147723323"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2025 18:16:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPWYj-000AyL-19;
	Thu, 12 Jun 2025 01:16:49 +0000
Date: Thu, 12 Jun 2025 09:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 6/17]
 drivers/net/ethernet/mellanox/mlx4/en_tx.c:879:18: warning: unused variable
 'h6'
Message-ID: <202506120908.yWCtOUqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   a7e6f8c929d912f6c844af1387b2d5cec8d37011
commit: b63a4fd5ab6dc77dd8544abfd6e5d057754e6bc8 [6/17] net/mlx4: Remove jumbo_remove step from TX path
config: i386-buildonly-randconfig-001-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120908.yWCtOUqL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120908.yWCtOUqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120908.yWCtOUqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx4/en_tx.c:879:18: warning: unused variable 'h6' [-Wunused-variable]
     879 |         struct ipv6hdr *h6;
         |                         ^~
   1 warning generated.


vim +/h6 +879 drivers/net/ethernet/mellanox/mlx4/en_tx.c

f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   863  
61357325f37788 drivers/net/mlx4/en_tx.c                   Stephen Hemminger  2009-08-31   864  netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   865  {
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   866  	struct skb_shared_info *shinfo = skb_shinfo(skb);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   867  	struct mlx4_en_priv *priv = netdev_priv(dev);
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   868  	union mlx4_wqe_qpn_vlan	qpn_vlan = {};
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   869  	struct mlx4_en_tx_ring *ring;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   870  	struct mlx4_en_tx_desc *tx_desc;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   871  	struct mlx4_wqe_data_seg *data;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   872  	struct mlx4_en_tx_info *tx_info;
7c8c0291f84027 drivers/net/ethernet/mellanox/mlx4/en_tx.c Jesse Brandeburg   2020-09-25   873  	u32 __maybe_unused ring_cons;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   874  	int tx_ind;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   875  	int nr_txbb;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   876  	int desc_size;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   877  	int real_size;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   878  	u32 index, bf_index;
1169a64265c4ea drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-05-13  @879  	struct ipv6hdr *h6;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   880  	__be32 op_own;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   881  	int lso_header_size;
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   882  	void *fragptr = NULL;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   883  	bool bounce = false;
5804283d7cb1da drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-09-25   884  	bool send_doorbell;
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06   885  	bool stop_queue;
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   886  	bool inline_ok;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   887  	u8 data_offset;
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   888  	bool bf_ok;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   889  
f905c79e12791d drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   890  	tx_ind = skb_get_queue_mapping(skb);
67f8b1dcb9ee7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2016-11-02   891  	ring = priv->tx_ring[TX][tx_ind];
f905c79e12791d drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   892  
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   893  	if (unlikely(!priv->port_up))
63a664b7e92b14 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2016-05-25   894  		goto tx_drop;
63a664b7e92b14 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2016-05-25   895  
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   896  	real_size = get_real_size(skb, shinfo, dev, &lso_header_size,
b63a4fd5ab6dc7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Maxim Mikityanskiy 2025-06-11   897  				  &inline_ok, &fragptr);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   898  	if (unlikely(!real_size))
7a61fc86af4a0c drivers/net/ethernet/mellanox/mlx4/en_tx.c Moshe Shemesh      2016-09-11   899  		goto tx_drop_count;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   900  
25985edcedea63 drivers/net/mlx4/en_tx.c                   Lucas De Marchi    2011-03-30   901  	/* Align descriptor to TXBB size */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   902  	desc_size = ALIGN(real_size, TXBB_SIZE);
9573e0d39ff8d7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   903  	nr_txbb = desc_size >> LOG_TXBB_SIZE;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   904  
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   905  	bf_ok = ring->bf_enabled;
e38af4faf01d0b drivers/net/ethernet/mellanox/mlx4/en_tx.c Hadar Hen Zion     2015-07-27   906  	if (skb_vlan_tag_present(skb)) {
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   907  		u16 vlan_proto;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   908  
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   909  		qpn_vlan.vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
e38af4faf01d0b drivers/net/ethernet/mellanox/mlx4/en_tx.c Hadar Hen Zion     2015-07-27   910  		vlan_proto = be16_to_cpu(skb->vlan_proto);
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   911  		if (vlan_proto == ETH_P_8021AD)
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   912  			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   913  		else if (vlan_proto == ETH_P_8021Q)
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   914  			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   915  		else
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   916  			qpn_vlan.ins_vlan = 0;
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   917  		bf_ok = false;
e38af4faf01d0b drivers/net/ethernet/mellanox/mlx4/en_tx.c Hadar Hen Zion     2015-07-27   918  	}
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   919  
535114539bb2c0 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-08   920  	netdev_txq_bql_enqueue_prefetchw(ring->tx_queue);
29d40c90324759 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   921  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   922  	/* Packet is good - grab an index and transmit it */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   923  	index = ring->prod & ring->size_mask;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   924  	bf_index = ring->prod;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   925  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   926  	/* See if we have enough space for whole descriptor TXBB for setting
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   927  	 * SW ownership on next descriptor; if not, use a bounce buffer. */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   928  	if (likely(index + nr_txbb <= ring->size))
9573e0d39ff8d7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   929  		tx_desc = ring->buf + (index << LOG_TXBB_SIZE);
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   930  	else {
0e706f7961a44f drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-12-07   931  		if (unlikely(nr_txbb > MLX4_MAX_DESC_TXBBS)) {
0e706f7961a44f drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-12-07   932  			if (netif_msg_tx_err(priv))
0e706f7961a44f drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-12-07   933  				en_warn(priv, "Oversized header or SG list\n");
0e706f7961a44f drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-12-07   934  			goto tx_drop_count;
0e706f7961a44f drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-12-07   935  		}
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   936  		tx_desc = (struct mlx4_en_tx_desc *) ring->bounce_buf;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   937  		bounce = true;
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19   938  		bf_ok = false;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22   939  	}
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   940  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   941  	/* Save skb in tx_info ring */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   942  	tx_info = &ring->tx_info[index];
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   943  	tx_info->skb = skb;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   944  	tx_info->nr_txbb = nr_txbb;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   945  
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   946  	if (!lso_header_size) {
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   947  		data = &tx_desc->data;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   948  		data_offset = offsetof(struct mlx4_en_tx_desc, data);
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   949  	} else {
b63a4fd5ab6dc7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Maxim Mikityanskiy 2025-06-11   950  		int lso_align = ALIGN(lso_header_size + 4, DS_SIZE);
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   951  
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   952  		data = (void *)&tx_desc->lso + lso_align;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   953  		data_offset = offsetof(struct mlx4_en_tx_desc, lso) + lso_align;
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   954  	}
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   955  
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   956  	/* valid only for none inline segments */
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   957  	tx_info->data_offset = data_offset;
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   958  
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   959  	tx_info->inl = inline_ok;
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   960  
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   961  	tx_info->linear = lso_header_size < skb_headlen(skb) && !inline_ok;
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   962  
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   963  	tx_info->nr_maps = shinfo->nr_frags + tx_info->linear;
3d03641cb4ea05 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   964  	data += tx_info->nr_maps - 1;
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   965  
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   966  	if (!tx_info->inl)
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   967  		if (!mlx4_en_build_dma_wqe(priv, shinfo, data, skb,
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   968  					   lso_header_size, ring->mr_key,
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   969  					   tx_info))
f28186d6b55d4c drivers/net/ethernet/mellanox/mlx4/en_tx.c Tariq Toukan       2017-06-15   970  			goto tx_drop_count;
237a3a3b154457 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   971  
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   972  	/*
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   973  	 * For timestamping add flag to skb_shinfo and
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   974  	 * set flag for further reference
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   975  	 */
e70602a8b87649 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   976  	tx_info->ts_requested = 0;
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   977  	if (unlikely(ring->hwtstamp_tx_type == HWTSTAMP_TX_ON &&
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   978  		     shinfo->tx_flags & SKBTX_HW_TSTAMP)) {
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05   979  		shinfo->tx_flags |= SKBTX_IN_PROGRESS;
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   980  		tx_info->ts_requested = 1;
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   981  	}
ec693d47010e83 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23   982  
6cc9c6fbc79f64 drivers/net/ethernet/mellanox/mlx4/en_tx.c Simon Horman       2024-02-05   983  	/* Prepare ctrl segment apart opcode+ownership, which depends on
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   984  	 * whether LSO is used */
60d6fe99e4a507 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2011-11-26   985  	tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   986  	if (likely(skb->ip_summed == CHECKSUM_PARTIAL)) {
a4f2dacbf2a504 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2014-10-30   987  		if (!skb->encapsulation)
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   988  			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   989  								 MLX4_WQE_CTRL_TCP_UDP_CSUM);
a4f2dacbf2a504 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2014-10-30   990  		else
a4f2dacbf2a504 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2014-10-30   991  			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
ad04378cecca9c drivers/net/ethernet/mellanox/mlx4/en_tx.c Yevgeny Petrilin   2011-10-18   992  		ring->tx_csum++;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   993  	}
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22   994  
79aeaccd915c52 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-02-07   995  	if (priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK) {
5f1cd200c4e4e1 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   996  		struct ethhdr *ethh;
5f1cd200c4e4e1 drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-08-21   997  
213815a1e6ae70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-01-17   998  		/* Copy dst mac address to wqe. This allows loopback in eSwitch,
213815a1e6ae70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-01-17   999  		 * so that VFs and PF can communicate with each other
213815a1e6ae70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-01-17  1000  		 */
622121719934f6 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2012-02-25  1001  		ethh = (struct ethhdr *)skb->data;
18f973af3e7028 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2012-03-05  1002  		tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
18f973af3e7028 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2012-03-05  1003  		tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
213815a1e6ae70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-01-17  1004  	}
213815a1e6ae70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yan Burman         2013-01-17  1005  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1006  	/* Handle LSO (TSO) packets */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1007  	if (lso_header_size) {
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1008  		int i;
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1009  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1010  		/* Mark opcode as LSO */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1011  		op_own = cpu_to_be32(MLX4_OPCODE_LSO | (1 << 6)) |
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1012  			((ring->prod & ring->size) ?
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1013  				cpu_to_be32(MLX4_EN_BIT_DESC_OWN) : 0);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1014  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1015  		/* Fill in the LSO prefix */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1016  		tx_desc->lso.mss_hdr_size = cpu_to_be32(
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1017  			shinfo->gso_size << 16 | lso_header_size);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1018  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1019  		/* Copy headers;
1169a64265c4ea drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-05-13  1020  		 * note that we already verified that it is linear
1169a64265c4ea drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2022-05-13  1021  		 */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1022  		memcpy(tx_desc->lso.header, skb->data, lso_header_size);
b63a4fd5ab6dc7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Maxim Mikityanskiy 2025-06-11  1023  
9fab426de78140 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-02  1024  		ring->tso_packets++;
b9d8839a44092c drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1025  
75d04aa368d9e9 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2017-04-05  1026  		i = shinfo->gso_segs;
5b263f5374ea70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yevgeny Petrilin   2012-04-23  1027  		tx_info->nr_bytes = skb->len + (i - 1) * lso_header_size;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1028  		ring->packets += i;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1029  	} else {
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1030  		/* Normal (Non LSO) packet */
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1031  		op_own = cpu_to_be32(MLX4_OPCODE_SEND) |
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1032  			((ring->prod & ring->size) ?
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1033  			 cpu_to_be32(MLX4_EN_BIT_DESC_OWN) : 0);
5b263f5374ea70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yevgeny Petrilin   2012-04-23  1034  		tx_info->nr_bytes = max_t(unsigned int, skb->len, ETH_ZLEN);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1035  		ring->packets++;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1036  	}
5b263f5374ea70 drivers/net/ethernet/mellanox/mlx4/en_tx.c Yevgeny Petrilin   2012-04-23  1037  	ring->bytes += tx_info->nr_bytes;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1038  
acea73d671b25b drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1039  	if (tx_info->inl)
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1040  		build_inline_wqe(tx_desc, skb, shinfo, fragptr);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1041  
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1042  	if (skb->encapsulation) {
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1043  		union {
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1044  			struct iphdr *v4;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1045  			struct ipv6hdr *v6;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1046  			unsigned char *hdr;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1047  		} ip;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1048  		u8 proto;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1049  
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1050  		ip.hdr = skb_inner_network_header(skb);
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1051  		proto = (ip.v4->version == 4) ? ip.v4->protocol :
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1052  						ip.v6->nexthdr;
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1053  
09067122db3b7f drivers/net/ethernet/mellanox/mlx4/en_tx.c Alexander Duyck    2016-05-02  1054  		if (proto == IPPROTO_TCP || proto == IPPROTO_UDP)
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1055  			op_own |= cpu_to_be32(MLX4_WQE_CTRL_IIP | MLX4_WQE_CTRL_ILP);
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1056  		else
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1057  			op_own |= cpu_to_be32(MLX4_WQE_CTRL_IIP);
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1058  	}
837052d0ccc5a7 drivers/net/ethernet/mellanox/mlx4/en_tx.c Or Gerlitz         2013-12-23  1059  
9a714997386ba1 drivers/net/ethernet/mellanox/mlx4/en_tx.c Jakub Kicinski     2023-04-11  1060  	WRITE_ONCE(ring->prod, ring->prod + nr_txbb);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1061  
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1062  	/* If we used a bounce buffer then copy descriptor back into place */
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1063  	if (unlikely(bounce))
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1064  		tx_desc = mlx4_en_bounce_to_desc(priv, ring, index, desc_size);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1065  
eb0cabbd1bebbf drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23  1066  	skb_tx_timestamp(skb);
eb0cabbd1bebbf drivers/net/ethernet/mellanox/mlx4/en_tx.c Amir Vadai         2013-04-23  1067  
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1068  	/* Check available TXBBs And 2K spare for prefetch */
488a9b48e398b1 drivers/net/ethernet/mellanox/mlx4/en_tx.c Ido Shamay         2015-06-25  1069  	stop_queue = mlx4_en_is_tx_ring_full(ring);
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1070  	if (unlikely(stop_queue)) {
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1071  		netif_tx_stop_queue(ring->tx_queue);
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1072  		ring->queue_stopped++;
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1073  	}
c29734443511aa drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2018-10-31  1074  
c29734443511aa drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2018-10-31  1075  	send_doorbell = __netdev_tx_sent_queue(ring->tx_queue,
c29734443511aa drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2018-10-31  1076  					       tx_info->nr_bytes,
3c31ff22b25f15 drivers/net/ethernet/mellanox/mlx4/en_tx.c Florian Westphal   2019-04-01  1077  					       netdev_xmit_more());
5804283d7cb1da drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-09-25  1078  
6a4e81211f4755 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1079  	real_size = (real_size / 16) & 0x3f;
6a4e81211f4755 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1080  
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1081  	bf_ok &= desc_size <= MAX_BF && send_doorbell;
87a5c3896f9cf3 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2011-03-22  1082  
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1083  	if (bf_ok)
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1084  		qpn_vlan.bf_qpn = ring->doorbell_qpn | cpu_to_be32(real_size);
092bf0fc80f5fb drivers/net/ethernet/mellanox/mlx4/en_tx.c Jack Morgenstein   2015-10-27  1085  	else
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1086  		qpn_vlan.fence_size = real_size;
7dfa4b414d4eec drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-05  1087  
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1088  	mlx4_en_tx_write_desc(ring, tx_desc, qpn_vlan, desc_size, bf_index,
224e92e02a769b drivers/net/ethernet/mellanox/mlx4/en_tx.c Brenden Blanco     2016-07-19  1089  			      op_own, bf_ok, send_doorbell);
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1090  
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1091  	if (unlikely(stop_queue)) {
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1092  		/* If queue was emptied after the if (stop_queue) , and before
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1093  		 * the netif_tx_stop_queue() - need to wake the queue,
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1094  		 * or else it will remain stopped forever.
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1095  		 * Need a memory barrier to make sure ring->cons was not
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1096  		 * updated before queue was stopped.
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1097  		 */
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1098  		smp_rmb();
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1099  
488a9b48e398b1 drivers/net/ethernet/mellanox/mlx4/en_tx.c Ido Shamay         2015-06-25  1100  		if (unlikely(!mlx4_en_is_tx_ring_full(ring))) {
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1101  			netif_tx_wake_queue(ring->tx_queue);
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1102  			ring->wake_queue++;
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1103  		}
fe971b95c22578 drivers/net/ethernet/mellanox/mlx4/en_tx.c Eric Dumazet       2014-10-06  1104  	}
ec634fe328182a drivers/net/mlx4/en_tx.c                   Patrick McHardy    2009-07-05  1105  	return NETDEV_TX_OK;
7e23091347664b drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2009-06-20  1106  
7a61fc86af4a0c drivers/net/ethernet/mellanox/mlx4/en_tx.c Moshe Shemesh      2016-09-11  1107  tx_drop_count:
7a61fc86af4a0c drivers/net/ethernet/mellanox/mlx4/en_tx.c Moshe Shemesh      2016-09-11  1108  	ring->tx_dropped++;
7e23091347664b drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2009-06-20  1109  tx_drop:
7e23091347664b drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2009-06-20  1110  	dev_kfree_skb_any(skb);
7e23091347664b drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2009-06-20  1111  	return NETDEV_TX_OK;
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1112  }
c27a02cd94d669 drivers/net/mlx4/en_tx.c                   Yevgeny Petrilin   2008-10-22  1113  

:::::: The code at line 879 was first introduced by commit
:::::: 1169a64265c4ea7100091228c98d4267f041b0e7 mlx4: support BIG TCP packets

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
