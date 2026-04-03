Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F41A0BE0;
	Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206024; cv=none; b=CPJcYuIQgqYs7XhobvxCiJrQ5RKRgT/hx1f07A6imHhG/CYWobL/B2MR1OUwglXFLgLJnVnGU40cCJka4Us+ddZRfZ0Kg5TXZ+EU5R51NOdOxILf1Q1VYMxnWvV32Mv2/AH/cZHDdxVZbOX0mUSCfTDuAehuSfbgm3xpqETgS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206024; c=relaxed/simple;
	bh=IgYVznEoxR5PUm8mtTgBJAeOfQV5bfBHAmc2dYjfxBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OR76IWCiRNxCIeLQQiggABSqVPyhLHIm2xSyCfoiuS5O1W7mNFCOB/Vx2ATo0D66tGslQz/vagWAykO+kd/9qVJXpn5KvIjAMQrfkVAfUxYv3N6ZqSShKBWv3InFs9vCW91PetVW0PfEFCsmFv6ZLbv7eN7ggqLG1eG/OXOyXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4g/Fzkm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4g/Fzkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206022; x=1806742022;
  h=date:from:to:cc:subject:message-id;
  bh=IgYVznEoxR5PUm8mtTgBJAeOfQV5bfBHAmc2dYjfxBk=;
  b=N4g/Fzkmd0rvflf2eW+6lz7dWj8tL0OeZatukpUO2TGzrJBEiqUymbc0
   Jr6zYMWtkgSGl+h4wCYQZ5oIKos+UncMyma1Cmp31jk6t79VQ/+MlN6o3
   YOII0Tb7AfXEaiQFu8WXrYUKIpD9QgOHqvEL4E/KBsbHXrXlr2RDmo9GB
   c9BdeXVo7kM4ewRNI4/ALIBbsIaBAVVH7whmCqEPm07x9SNlUSVYkZBvV
   X834xXxI6hGYQpFJV1srja9NfnfpLZIuUPg4IhWUIb869QTlwYLfv4GO+
   vmVDwYWa7590QZDM3/+GHMazugKKvgwdh4CDV16Eivsdx7T2RYhRRPo2D
   w==;
X-CSE-ConnectionGUID: hyD5D0EGT/Sc+mE9XR/axg==
X-CSE-MsgGUID: iV6eRffLRomK8cKplHyRtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312097"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312097"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: CK2LON9/RyaDQGfqR1FJUA==
X-CSE-MsgGUID: btAYaByQRLueFZYy6N64qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287306"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016n-3WJN;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260402-1611 30/31]
 drivers/infiniband/hw/hfi2/chip.c:11124:28: warning: variable 'extended_vl'
 set but not used
Message-ID: <202604031400.eSZ27oir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260402-1611
head:   f09b053c0b35d3b9de750922b56cbf341eac7434
commit: 7734297106cd4f9aa8cb260395ce5c59fdb16dd1 [30/31] RDMA/hfi2: Make it build
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260403/202604031400.eSZ27oir-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031400.eSZ27oir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031400.eSZ27oir-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi2/chip.c:11124:28: warning: variable 'extended_vl' set but not used [-Wunused-but-set-variable]
    11124 |         unsigned int qpns_per_vl, extended_vl, ctxt, i, qpn, n, m;
          |                                   ^
   drivers/infiniband/hw/hfi2/chip.c:12004:12: error: incompatible pointer types assigning to 'struct hfi2_asic_data *' from 'typeof (dd->asic_data) *' (aka 'struct hfi2_asic_data **'); dereference with * [-Werror,-Wincompatible-pointer-types]
    12004 |         asic_data = kzalloc_obj(dd->asic_data, GFP_KERNEL);
          |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          |                     *(                                    )
   1 warning and 1 error generated.
--
   drivers/infiniband/hw/hfi2/cport.c:224:10: error: incompatible pointer types assigning to 'union mctxt_mem *' from 'typeof (cw->req) *' (aka 'union mctxt_mem **'); dereference with * [-Werror,-Wincompatible-pointer-types]
     224 |         cw->req = kzalloc_obj(cw->req, GFP_KERNEL);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   *(                              )
>> drivers/infiniband/hw/hfi2/cport.c:842:50: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     842 |         if (op_start > op_end || op_start < 0 || op_end >= 256)
         |                                                  ~~~~~~ ^  ~~~
   drivers/infiniband/hw/hfi2/cport.c:940:8: error: incompatible pointer types assigning to 'struct hfi2_cport *' from 'typeof (cport) *' (aka 'struct hfi2_cport **'); dereference with * [-Werror,-Wincompatible-pointer-types]
     940 |         cport = kzalloc_obj(cport, GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 *(                            )
   1 warning and 2 errors generated.
--
   drivers/infiniband/hw/hfi2/init.c:638:8: error: incompatible pointer types assigning to 'struct cport_trap_reg *' from 'typeof (entry) *' (aka 'struct cport_trap_reg **'); dereference with * [-Werror,-Wincompatible-pointer-types]
     638 |         entry = kzalloc_obj(entry, GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 *(                            )
   drivers/infiniband/hw/hfi2/init.c:1354:11: error: incompatible pointer types assigning to 'struct cc_state *' from 'typeof (cc_state) *' (aka 'struct cc_state **'); dereference with * [-Werror,-Wincompatible-pointer-types]
    1354 |         cc_state = kzalloc_obj(cc_state, GFP_KERNEL);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    *(                               )
>> drivers/infiniband/hw/hfi2/init.c:2495:6: warning: variable 'initfail' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2495 |         if (!ret)
         |             ^~~~
   drivers/infiniband/hw/hfi2/init.c:2498:7: note: uninitialized use occurs here
    2498 |         if (!initfail && !ret)
         |              ^~~~~~~~
   drivers/infiniband/hw/hfi2/init.c:2495:2: note: remove the 'if' if its condition is always true
    2495 |         if (!ret)
         |         ^~~~~~~~~
    2496 |                 initfail = hfi2_init(dd, 0);
   drivers/infiniband/hw/hfi2/init.c:2385:29: note: initialize the variable 'initfail' to silence this warning
    2385 |         int ret = 0, pidx, initfail;
         |                                    ^
         |                                     = 0
   1 warning and 2 errors generated.
--
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:303 function parameter 'ppd' not described in 'hfi2_netdev_rx_init'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:324 function parameter 'ppd' not described in 'hfi2_netdev_rx_destroy'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:405 function parameter 'ppd' not described in 'hfi2_netdev_enable_queues'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:445 function parameter 'ppd' not described in 'hfi2_netdev_add_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:459 function parameter 'ppd' not described in 'hfi2_netdev_remove_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:472 function parameter 'ppd' not described in 'hfi2_netdev_get_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:485 function parameter 'ppd' not described in 'hfi2_netdev_get_first_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:303 function parameter 'ppd' not described in 'hfi2_netdev_rx_init'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:324 function parameter 'ppd' not described in 'hfi2_netdev_rx_destroy'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:405 function parameter 'ppd' not described in 'hfi2_netdev_enable_queues'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:445 function parameter 'ppd' not described in 'hfi2_netdev_add_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:459 function parameter 'ppd' not described in 'hfi2_netdev_remove_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:472 function parameter 'ppd' not described in 'hfi2_netdev_get_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:485 function parameter 'ppd' not described in 'hfi2_netdev_get_first_data'
--
   drivers/infiniband/hw/hfi2/sdma.c:1025:13: error: incompatible pointer types assigning to 'struct sdma_rht_node *' from 'typeof (rht_node) *' (aka 'struct sdma_rht_node **'); dereference with * [-Werror,-Wincompatible-pointer-types]
    1025 |                         rht_node = kzalloc_obj(rht_node, GFP_KERNEL);
         |                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    *(                               )
   drivers/infiniband/hw/hfi2/sdma.c:2480:7: error: incompatible pointer types assigning to 'struct sdma_print_info *' from 'typeof (sdi) *' (aka 'struct sdma_print_info **'); dereference with * [-Werror,-Wincompatible-pointer-types]
    2480 |                 sdi = kmalloc_obj(sdi, GFP_ATOMIC);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       *(                          )
>> drivers/infiniband/hw/hfi2/sdma.c:3856:8: warning: variable 'data_addr' set but not used [-Wunused-but-set-variable]
    3856 |         void *data_addr;
         |               ^
   1 warning and 2 errors generated.
--
>> Warning: drivers/infiniband/hw/hfi2/intr.c:79 function parameter 'ppd' not described in 'handle_linkup_change'
>> Warning: drivers/infiniband/hw/hfi2/intr.c:79 function parameter 'ppd' not described in 'handle_linkup_change'
--
>> drivers/infiniband/hw/hfi2/verbs.c:1564:23: warning: variable 'dd' set but not used [-Wunused-but-set-variable]
    1564 |         struct hfi2_devdata *dd;
         |                              ^
   drivers/infiniband/hw/hfi2/verbs.c:1596:23: warning: variable 'dd' set but not used [-Wunused-but-set-variable]
    1596 |         struct hfi2_devdata *dd;
         |                              ^
   2 warnings generated.
--
>> drivers/infiniband/hw/hfi2/vf2pf_lb.c:112:6: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     112 |         u32 len;
         |             ^
   drivers/infiniband/hw/hfi2/vf2pf_lb.c:485:6: error: incompatible pointer types assigning to 'struct vf2pf_lbdata *' from 'typeof (lbd) *' (aka 'struct vf2pf_lbdata **'); dereference with * [-Werror,-Wincompatible-pointer-types]
     485 |         lbd = kzalloc_obj(lbd, GFP_KERNEL);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               *(                          )
   1 warning and 1 error generated.
--
>> Warning: drivers/infiniband/hw/hfi2/user_sdma.c:980 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Try adding @ptr to @tx->req->pinrefs first but add to @tx->pinrefs if
>> Warning: drivers/infiniband/hw/hfi2/user_sdma.c:1002 Cannot find identifier on line:
    * @return most-recently used pinref for @memtype from @tx->req. Most-recent
   Warning: drivers/infiniband/hw/hfi2/user_sdma.c:1003 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *         determined by &user_sdma_pinref->pinref_seqnum.


vim +/extended_vl +11124 drivers/infiniband/hw/hfi2/chip.c

9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11102  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11103  /**
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11104   * init_qos_port - initialize RX QOS for a single port
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11105   * @ppd: port data
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11106   * @rmt: RSM map table
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11107   *
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11108   * This routine initializes a rule and the RSM map table to implement
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11109   * quality of service (qos) for this port.
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11110   *
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11111   * If all of the limit tests succeed, qos is applied based on the array
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11112   * interpretation of krcvqs where entry 0 is VL0.
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11113   *
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11114   * The number of vl bits (n) and the number of qpn bits (m) are computed to
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11115   * feed both the RSM map table and the single rule.
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11116   */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11117  static void init_qos_port(struct hfi2_pportdata *ppd, struct rsm_map_table *rmt)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11118  {
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11119  	struct hfi2_devdata *dd = ppd->dd;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11120  	struct hfi2_devrsrcs *dr = &dd->rsrcs;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11121  	struct hfi2_portrsrcs *pr = &dr->ppr[ppd->hw_pidx];
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11122  	unsigned int rcb = pr->rcv_context_base;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11123  	struct rsm_rule_data rrd;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25 @11124  	unsigned int qpns_per_vl, extended_vl, ctxt, i, qpn, n, m;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11125  	unsigned int rmt_entries;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11126  	int rule_index;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11127  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11128  	if (!rmt)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11129  		goto bail;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11130  	if (!pr->n_krcv_queues)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11131  		goto bail;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11132  	rmt_entries = qos_rmt_entries(pr->n_krcv_queues - 1, &m, &n);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11133  	if (rmt_entries == 0)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11134  		goto bail;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11135  	qpns_per_vl = 1 << m;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11136  	extended_vl = 1 << n;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11137  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11138  	/* enough room in the map table? */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11139  	if (rmt->used + rmt_entries > dd->params->rsm_map_table_entries)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11140  		goto bail;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11141  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11142  	/* allocate a rule */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11143  	rule_index = alloc_rsm_rule(dd, RSM_TYPE_VERBS);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11144  	if (rule_index < 0)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11145  		goto bail;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11146  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11147  	/* fill block in RMT with this port's control context */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11148  	ctxt = rcb + HFI2_CTRL_CTXT;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11149  	for (i = 0; i < rmt_entries; i++)
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11150  		set_rmt_entry(dd, rmt, rmt->used + i, ctxt);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11151  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11152  	/* overwrite applicable qos entries */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11153  	ctxt = rcb + FIRST_KERNEL_KCTXT;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11154  	for (i = 0; i < num_vls; i++) {
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11155  		unsigned int tctxt;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11156  		unsigned int idx;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11157  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11158  		for (qpn = 0, tctxt = ctxt;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11159  		     krcvqs[i] && qpn < qpns_per_vl; qpn++) {
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11160  			/* generate the index the hardware will produce */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11161  			idx = rmt->used + ((qpn << n) ^ i);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11162  			set_rmt_entry(dd, rmt, idx, tctxt);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11163  			tctxt++;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11164  			if (tctxt == ctxt + krcvqs[i])
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11165  				tctxt = ctxt;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11166  		}
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11167  		ctxt += krcvqs[i];
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11168  	}
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11169  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11170  	/*
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11171  	 * Create a rule to extract an index using the formula:
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11172  	 *	idx = qpn[m+n+1:1] ^ VL[n-1:0]
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11173  	 *
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11174  	 * The "qos_shift" setting will ensure the bottom n+1 bits of the QPN
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11175  	 * will always be zero (except for GSI QPN=1).
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11176  	 */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11177  	rrd.offset = rmt->used;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11178  	rrd.pkt_type = RHF_RCV_TYPE_IB;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11179  	rrd.pidx_mask = 1 << ppd->hw_pidx;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11180  	rrd.field1_off = LRH_BTH_MATCH_OFFSET;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11181  	rrd.field2_off = LRH_SC_MATCH_OFFSET;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11182  	rrd.index1_off = LRH_SC_SELECT_OFFSET;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11183  	rrd.index1_width = n;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11184  	rrd.index2_off = QPN_SELECT_OFFSET;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11185  	rrd.index2_width = m + n;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11186  	rrd.mask1 = LRH_BTH_MASK;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11187  	rrd.value1 = LRH_BTH_VALUE;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11188  	rrd.mask2 = LRH_SC_MASK;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11189  	rrd.value2 = LRH_SC_VALUE;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11190  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11191  	/* add rule */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11192  	add_rsm_rule(dd, rule_index, &rrd);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11193  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11194  	/* mark RSM map entries as used */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11195  	rmt->used += rmt_entries;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11196  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11197  	ppd->qos_shift = n + 1;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11198  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11199  	/* map everything else to this port's mcast/err/vl15 context */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11200  	init_qpmap_table(ppd, rcb + HFI2_CTRL_CTXT, rcb + HFI2_CTRL_CTXT);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11201  	return;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11202  bail:
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11203  	ppd->qos_shift = 1;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11204  
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11205  	if (pr->n_krcv_queues) {
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11206  		/* map everything to this port's kernel contexts (excl. HFI2_CTRL_CTXT) */
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11207  		ctxt = rcb + FIRST_KERNEL_KCTXT;
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11208  		init_qpmap_table(ppd, ctxt,
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11209  				 ctxt + pr->n_krcv_queues - FIRST_KERNEL_KCTXT - 1);
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11210  	}
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11211  }
9cd1b9c5afd7de Dennis Dalessandro 2026-02-25  11212  

:::::: The code at line 11124 was first introduced by commit
:::::: 9cd1b9c5afd7de7395c644cee2b7fdf38b23cb4a RDMA/hfi2: Add in HW register access support

:::::: TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
:::::: CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
