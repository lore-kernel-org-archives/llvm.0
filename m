Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352071;
	b=OqApxaqpII6CfDDeh0KVIiZSXTozKthQlELwVRI43qz8ZuRNWC1vpoVpFvIziPWHhaV2
	 GSW0umNCU7AyMYenNYdKH6YTmG5z4otwGL9/JTX93I8NFp4XRkaBcg78YI3BEqhDat6F0
	 Pb0IwogPCswlx70JMhOz+o7NWLvnM1BHtP5iNjn7BAk2AzzSNn9n8EX3maCEdefs5qOaV
	 OrZ68Ve0CmeJVpKpA1uRMZdMuhiaCdTPcgh1B57JfF7Qy0YPzo+h3CLQLrLUwhQlPG5in
	 d/e1VNirzdaFEbAoD67IiwssrPzeBsV6lkpSGGAn1/YKYqI6mD5MKmB1q1AZhRistJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352071;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6cVtZBFt/3vk5oUYeIqx91flDDvYFe1gGABA2It5iAc=;
	b=L9MUkeTOlR2YvuE18JcGaqDZy4qVoWcvV+zIfwm3vH2w/pkZ5BatJNiXpwyfKYOoh6NI
	 1o6awcgpDA/P40xF2gmZ9rAwVywjlTyuygeHiPMQfcgj60GVbg6esTLLRsIl1udoun7MD
	 ZseUYqzbF/b273+xhVNSOYsmxpSQ+kEOYPlyhD1bgvPk2IaLcicEzLmHIQ89rfe27908K
	 bds1+XwNr30zNLEKOWuJ3AcKpEAQnLxcS4linTEntNtFvpwU2Uw/+GEnr9vHFzDgJVkzz
	 aARWlVaNaHiiKb5phn9FxjZHa0iREyxehaKtokmuFYfhIyYpcODZufV+kbgAuE5ZDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGVfstbw;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B8606A320;
	Sun, 22 Nov 2026 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGVfstbw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795352071; x=1826888071;
  h=date:from:to:cc:subject:message-id;
  bh=5U0FHPPh6Biu1MZ/3tcqcmVFVoX3Qun8UxS7iuMs46g=;
  b=JGVfstbwPGwHlPWddM2+Y1TiNyzr52rQih7EfpvkXXylNau9CXmp9ey9
   C8julzlcy/AwLK2M0v36tiubNWEmJeYkQunOFQZx7pAIppF3g1/zWjHGE
   KwQTSkf6aMEFz4JcJWP1oAyq88VPN05sRkywCtD4mNotp8iEJGWaVk6t9
   Yq7DpNPR1w4XnjQDzLzCUsNsDh18b8hAMn7Irah/clyEVuinP9lmH4f6h
   EUHgwnApDOUswmO3UxK6KYwCPwGHOx12immQGkieFD/19vuSafa8i2W7p
   xL3Giwlc0BDBJ6gVltA6LykuO5263YvVt95pwWlc7MGwtoKeC0h0rd38E
   A==;
X-CSE-ConnectionGUID: uMJgrz0fTmiYZjV5NWUbOA==
X-CSE-MsgGUID: b81yM123SUqxG7Ak10tIPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4169338"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4169338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 04:54:30 -0800
X-CSE-ConnectionGUID: 0RdE2FB0Sj6n3A1twCzzzA==
X-CSE-MsgGUID: Z30NTE53QW2xmyDAzKUVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11445499"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2026 04:54:29 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV75N-00000001LWu-32aQ;
	Sun, 22 Nov 2026 12:54:25 +0000
Date: Sun, 22 Nov 2026 20:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261121-1156 35/35]
 drivers/infiniband/hw/hfi2/tid_rdma.c:4383:6: warning: variable 'flow' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202611222034.7HUBYTOX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Dennis,

First bad commit (maybe != root cause):

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20261121-1156
head:   9ad3b0e4aeb0f2b8e51f67eeb867af1e832fda69
commit: 9ad3b0e4aeb0f2b8e51f67eeb867af1e832fda69 [35/35] RDMA/hfi2: Add tracepoints and enable hfi2 driver build
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611222034.7HUBYTOX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611222034.7HUBYTOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611222034.7HUBYTOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi2/tid_rdma.c:4383:6: warning: variable 'flow' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4383 |         if (unlikely(priv->r_tid_tail == HFI2_QP_WQE_INVALID ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4384 |                      priv->r_tid_tail == priv->r_tid_head)) {
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/tid_rdma.c:4502:27: note: uninitialized use occurs here
    4502 |         priv->r_next_psn_kdeth = flow->flow_state.r_next_psn;
         |                                  ^~~~
   drivers/infiniband/hw/hfi2/tid_rdma.c:4383:2: note: remove the 'if' if its condition is always false
    4383 |         if (unlikely(priv->r_tid_tail == HFI2_QP_WQE_INVALID ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4384 |                      priv->r_tid_tail == priv->r_tid_head)) {
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4385 |                 spin_unlock_irqrestore(&qp->s_lock, flags);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4386 |                 goto done;
         |                 ~~~~~~~~~~
    4387 |         }
         |         ~
   drivers/infiniband/hw/hfi2/tid_rdma.c:4367:28: note: initialize the variable 'flow' to silence this warning
    4367 |         struct tid_rdma_flow *flow;
         |                                   ^
         |                                    = NULL
   1 warning generated.
--
>> Warning: drivers/infiniband/hw/hfi2/ruc.c:183 function parameter 'bth2_dw' not described in 'build_ahg'
>> Warning: drivers/infiniband/hw/hfi2/ruc.c:183 function parameter 'bth2_dw' not described in 'build_ahg'


vim +4383 drivers/infiniband/hw/hfi2/tid_rdma.c

19903d7803d2bb Dennis Dalessandro 2026-11-20  4358  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4359  void hfi2_rc_rcv_tid_rdma_write_data(struct hfi2_packet *packet)
19903d7803d2bb Dennis Dalessandro 2026-11-20  4360  {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4361  	struct rvt_qp *qp = packet->qp;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4362  	struct hfi2_qp_priv *priv = qp->priv;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4363  	struct hfi2_ctxtdata *rcd = priv->rcd;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4364  	struct ib_other_headers *ohdr = packet->ohdr;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4365  	struct rvt_ack_entry *e;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4366  	struct tid_rdma_request *req;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4367  	struct tid_rdma_flow *flow;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4368  	struct hfi2_ibdev *dev = to_idev(qp->ibqp.device);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4369  	unsigned long flags;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4370  	u32 psn, next;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4371  	u8 opcode;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4372  	bool fecn;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4373  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4374  	fecn = process_ecn(qp, packet);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4375  	psn = mask_psn(be32_to_cpu(ohdr->bth[2]));
19903d7803d2bb Dennis Dalessandro 2026-11-20  4376  	opcode = (be32_to_cpu(ohdr->bth[0]) >> 24) & 0xff;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4377  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4378  	/*
19903d7803d2bb Dennis Dalessandro 2026-11-20  4379  	 * All error handling should be done by now. If we are here, the packet
19903d7803d2bb Dennis Dalessandro 2026-11-20  4380  	 * is either good or been accepted by the error handler.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4381  	 */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4382  	spin_lock_irqsave(&qp->s_lock, flags);
19903d7803d2bb Dennis Dalessandro 2026-11-20 @4383  	if (unlikely(priv->r_tid_tail == HFI2_QP_WQE_INVALID ||
19903d7803d2bb Dennis Dalessandro 2026-11-20  4384  		     priv->r_tid_tail == priv->r_tid_head)) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4385  		spin_unlock_irqrestore(&qp->s_lock, flags);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4386  		goto done;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4387  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4388  	e = &qp->s_ack_queue[priv->r_tid_tail];
19903d7803d2bb Dennis Dalessandro 2026-11-20  4389  	req = ack_to_tid_req(e);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4390  	flow = &req->flows[req->clear_tail];
19903d7803d2bb Dennis Dalessandro 2026-11-20  4391  	if (cmp_psn(psn, full_flow_psn(flow, flow->flow_state.lpsn))) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4392  		update_r_next_psn_fecn(packet, priv, rcd, flow, fecn);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4393  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4394  		if (cmp_psn(psn, flow->flow_state.r_next_psn))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4395  			goto send_nak;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4396  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4397  		flow->flow_state.r_next_psn = mask_psn(psn + 1);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4398  		/*
19903d7803d2bb Dennis Dalessandro 2026-11-20  4399  		 * Copy the payload to destination buffer if this packet is
19903d7803d2bb Dennis Dalessandro 2026-11-20  4400  		 * delivered as an eager packet due to RSM rule and FECN.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4401  		 * The RSM rule selects FECN bit in BTH and SH bit in
19903d7803d2bb Dennis Dalessandro 2026-11-20  4402  		 * KDETH header and therefore will not match the last
19903d7803d2bb Dennis Dalessandro 2026-11-20  4403  		 * packet of each segment that has SH bit cleared.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4404  		 */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4405  		if (fecn && packet->etype == RHF_RCV_TYPE_EAGER) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4406  			struct rvt_sge_state ss;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4407  			u32 len;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4408  			u32 tlen = packet->tlen;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4409  			u16 hdrsize = packet->hlen;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4410  			u8 pad = packet->pad;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4411  			u8 extra_bytes =
19903d7803d2bb Dennis Dalessandro 2026-11-20  4412  				pad + packet->extra_byte + (SIZE_OF_CRC << 2);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4413  			u32 pmtu = qp->pmtu;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4414  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4415  			if (unlikely(tlen != (hdrsize + pmtu + extra_bytes)))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4416  				goto send_nak;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4417  			len = req->comp_seg * req->seg_len;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4418  			len += delta_psn(psn,
19903d7803d2bb Dennis Dalessandro 2026-11-20  4419  					 full_flow_psn(flow,
19903d7803d2bb Dennis Dalessandro 2026-11-20  4420  						       flow->flow_state.spsn)) *
19903d7803d2bb Dennis Dalessandro 2026-11-20  4421  			       pmtu;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4422  			if (unlikely(req->total_len - len < pmtu))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4423  				goto send_nak;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4424  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4425  			/*
19903d7803d2bb Dennis Dalessandro 2026-11-20  4426  			 * The e->rdma_sge field is set when TID RDMA WRITE REQ
19903d7803d2bb Dennis Dalessandro 2026-11-20  4427  			 * is first received and is never modified thereafter.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4428  			 */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4429  			ss.sge = e->rdma_sge;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4430  			ss.sg_list = NULL;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4431  			ss.num_sge = 1;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4432  			ss.total_len = req->total_len;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4433  			rvt_skip_sge(&ss, len, false);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4434  			rvt_copy_sge(qp, &ss,
19903d7803d2bb Dennis Dalessandro 2026-11-20  4435  				     rvt_to_kseg(packet->payload, pmtu),
19903d7803d2bb Dennis Dalessandro 2026-11-20  4436  				     false, false);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4437  			/* Raise the sw sequence check flag for next hfi2_packet */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4438  			priv->r_next_psn_kdeth = mask_psn(psn + 1);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4439  			priv->s_flags |= HFI2_R_TID_SW_PSN;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4440  		}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4441  		goto exit;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4442  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4443  	flow->flow_state.r_next_psn = mask_psn(psn + 1);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4444  	hfi2_kern_exp_rcv_clear(req);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4445  	priv->alloc_w_segs--;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4446  	rcd->flows[flow->idx].psn = psn & HFI2_KDETH_BTH_SEQ_MASK;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4447  	req->comp_seg++;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4448  	priv->s_nak_state = 0;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4449  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4450  	/*
19903d7803d2bb Dennis Dalessandro 2026-11-20  4451  	 * Release the flow if one of the following conditions has been met:
19903d7803d2bb Dennis Dalessandro 2026-11-20  4452  	 *  - The request has reached a sync point AND all outstanding
19903d7803d2bb Dennis Dalessandro 2026-11-20  4453  	 *    segments have been completed, or
19903d7803d2bb Dennis Dalessandro 2026-11-20  4454  	 *  - The entire request is complete and there are no more requests
19903d7803d2bb Dennis Dalessandro 2026-11-20  4455  	 *    (of any kind) in the queue.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4456  	 */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4457  	trace_hfi2_rsp_rcv_tid_write_data(qp, psn);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4458  	trace_hfi2_tid_req_rcv_write_data(qp, 0, e->opcode, e->psn, e->lpsn,
19903d7803d2bb Dennis Dalessandro 2026-11-20  4459  					  req);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4460  	trace_hfi2_tid_write_rsp_rcv_data(qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4461  	validate_r_tid_ack(priv);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4462  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4463  	if (opcode == TID_OP(WRITE_DATA_LAST)) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4464  		release_rdma_sge_mr(e);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4465  		for (next = priv->r_tid_tail + 1;; next++) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4466  			if (next > rvt_size_atomic(&dev->rdi))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4467  				next = 0;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4468  			if (next == priv->r_tid_head)
19903d7803d2bb Dennis Dalessandro 2026-11-20  4469  				break;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4470  			e = &qp->s_ack_queue[next];
19903d7803d2bb Dennis Dalessandro 2026-11-20  4471  			if (e->opcode == TID_OP(WRITE_REQ))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4472  				break;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4473  		}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4474  		priv->r_tid_tail = next;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4475  		if (++qp->s_acked_ack_queue > rvt_size_atomic(&dev->rdi))
19903d7803d2bb Dennis Dalessandro 2026-11-20  4476  			qp->s_acked_ack_queue = 0;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4477  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4478  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4479  	hfi2_tid_write_alloc_resources(qp, true);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4480  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4481  	/*
19903d7803d2bb Dennis Dalessandro 2026-11-20  4482  	 * If we need to generate more responses, schedule the
19903d7803d2bb Dennis Dalessandro 2026-11-20  4483  	 * send engine.
19903d7803d2bb Dennis Dalessandro 2026-11-20  4484  	 */
19903d7803d2bb Dennis Dalessandro 2026-11-20  4485  	if (req->cur_seg < req->total_segs ||
19903d7803d2bb Dennis Dalessandro 2026-11-20  4486  	    qp->s_tail_ack_queue != qp->r_head_ack_queue) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4487  		qp->s_flags |= RVT_S_RESP_PENDING;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4488  		hfi2_schedule_send(qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4489  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4490  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4491  	priv->pending_tid_w_segs--;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4492  	if (priv->s_flags & HFI2_R_TID_RSC_TIMER) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4493  		if (priv->pending_tid_w_segs)
19903d7803d2bb Dennis Dalessandro 2026-11-20  4494  			hfi2_mod_tid_reap_timer(req->qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4495  		else
19903d7803d2bb Dennis Dalessandro 2026-11-20  4496  			hfi2_stop_tid_reap_timer(req->qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4497  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4498  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4499  done:
19903d7803d2bb Dennis Dalessandro 2026-11-20  4500  	tid_rdma_schedule_ack(qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4501  exit:
19903d7803d2bb Dennis Dalessandro 2026-11-20  4502  	priv->r_next_psn_kdeth = flow->flow_state.r_next_psn;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4503  	if (fecn)
19903d7803d2bb Dennis Dalessandro 2026-11-20  4504  		qp->s_flags |= RVT_S_ECN;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4505  	spin_unlock_irqrestore(&qp->s_lock, flags);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4506  	return;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4507  
19903d7803d2bb Dennis Dalessandro 2026-11-20  4508  send_nak:
19903d7803d2bb Dennis Dalessandro 2026-11-20  4509  	if (!priv->s_nak_state) {
19903d7803d2bb Dennis Dalessandro 2026-11-20  4510  		priv->s_nak_state = IB_NAK_PSN_ERROR;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4511  		priv->s_nak_psn = flow->flow_state.r_next_psn;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4512  		tid_rdma_trigger_ack(qp);
19903d7803d2bb Dennis Dalessandro 2026-11-20  4513  	}
19903d7803d2bb Dennis Dalessandro 2026-11-20  4514  	goto done;
19903d7803d2bb Dennis Dalessandro 2026-11-20  4515  }
19903d7803d2bb Dennis Dalessandro 2026-11-20  4516  

:::::: The code at line 4383 was first introduced by commit
:::::: 19903d7803d2bb106c1164653527ef3676ef30c2 RDMA/hfi2: Add TID RDMA hardware-accelerated transport

:::::: TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
:::::: CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
