Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB82874FF;
	Sun,  6 Jul 2025 22:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840096; cv=none; b=NhOUxXVEfFe3jtgUzlMhoBs+SMTbhEN162SZD1LpEp2wJnkq/yUCrTKDVfzKW5j6fa5PRiYeX3Vnl5KI9L1mU3sEtrgj9gtmRhHSom8XBpPEjEz7VvZkN85yXaToy43pRk3P6P/UJTId6j/MJjyCPPDftB7LZZMiDsaPXzXxZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840096; c=relaxed/simple;
	bh=Nzf4Mkkkt4HL4ziwTXLy8W4Gku2hWhNszHEsTcQ/tso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ii6aqyTvxhzwmPk7eCf5lSYO3Mq1Jo8V83XlSfbsAwS8YCQu7qYfuM0TLbWcmk9Dtf1d6jOduEEzpQF3US+io/eD78aH56xRM7Z8Pcc5vFFElBqTZ85ZO7Y/0taE1WIy03WGClX58gMLCZiKINAewboGcyLgxnDJYQ399AQ0OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbSFr/1e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbSFr/1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840095; x=1783376095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nzf4Mkkkt4HL4ziwTXLy8W4Gku2hWhNszHEsTcQ/tso=;
  b=EbSFr/1e4rkaONKsZilhxVBIc2+pRd1sbhoH//0IEOMvGDY278Ow0nST
   nHc+69C6gQ1FcLD5l7vP21KbsrxvGXsY1A7JXCAgBL+LxK9ZKLLdoEWa/
   5DItIpPyhIg22p6Q3Jbzn+5oOnyc91EHaGw/WBR6eq1W8KVGWCePV9ytO
   vfnoohJC7Ymm8vK4Ojps/RjI3YChKYzydH2TW+lgZk/cVQsaBxHsAvVx1
   J8mGUvtEz7TNVckKK1jJH58N6y5MX+zJgfIPd03pJdGixHkvXFoRTl8Kg
   H4XGMKY3qDmbEPM/1cj+vIUlXF/s4ivmJ5sNSuqI0/cnVeE9UreecA8Qy
   A==;
X-CSE-ConnectionGUID: Wfkwxe79RGyt2MS5wP4IGA==
X-CSE-MsgGUID: SFGJaxbZStqvGNiH+zyZ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65123383"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="65123383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:52 -0700
X-CSE-ConnectionGUID: ygPRX7JfTpyrtLa4I2fwKA==
X-CSE-MsgGUID: HaUaSFaXTMaOG4YS6lMChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154802324"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdI-00001R-00;
	Sun, 06 Jul 2025 22:14:48 +0000
Date: Mon, 7 Jul 2025 06:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [mellanox:wip/leon-for-next 29/35]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared
 identifier 'cmd_numi'; did you mean 'cmd_num'?
Message-ID: <202507070359.Ng3M8gut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git wip/leon-for-next
head:   bdc5726cdd454f91d7bf49f47c8c31377cb3d7ce
commit: 6cbf3ee2e409ca573ef1ebb3f383ae3873850ee7 [29/35] RDMA/hns: Get message length of ack_req from FW
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070359.Ng3M8gut-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared identifier 'cmd_numi'; did you mean 'cmd_num'?
    2225 |         hns_roce_cmq_setup_basic_desc(&desc[cmd_numi - 1], cmd, true);
         |                                             ^~~~~~~~
         |                                             cmd_num
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2210:6: note: 'cmd_num' declared here
    2210 |         int cmd_num;
         |             ^
   1 error generated.


vim +2225 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

  2196	
  2197	static int hns_roce_query_caps(struct hns_roce_dev *hr_dev)
  2198	{
  2199		struct hns_roce_cmq_desc desc[HNS_ROCE_QUERY_PF_CAPS_CMD_NUM] = {};
  2200		struct hns_roce_caps *caps = &hr_dev->caps;
  2201		struct hns_roce_query_pf_caps_a *resp_a;
  2202		struct hns_roce_query_pf_caps_b *resp_b;
  2203		struct hns_roce_query_pf_caps_c *resp_c;
  2204		struct hns_roce_query_pf_caps_d *resp_d;
  2205		struct hns_roce_query_pf_caps_e *resp_e;
  2206		struct hns_roce_query_pf_caps_f *resp_f;
  2207		enum hns_roce_opcode_type cmd;
  2208		int ctx_hop_num;
  2209		int pbl_hop_num;
  2210		int cmd_num;
  2211		int ret;
  2212		int i;
  2213	
  2214		cmd = hr_dev->is_vf ? HNS_ROCE_OPC_QUERY_VF_CAPS_NUM :
  2215		      HNS_ROCE_OPC_QUERY_PF_CAPS_NUM;
  2216		cmd_num = hr_dev->pci_dev->revision == PCI_REVISION_ID_HIP08 ?
  2217			  HNS_ROCE_QUERY_PF_CAPS_CMD_NUM_HIP08 :
  2218			  HNS_ROCE_QUERY_PF_CAPS_CMD_NUM;
  2219	
  2220		for (i = 0; i < cmd_num - 1; i++) {
  2221			hns_roce_cmq_setup_basic_desc(&desc[i], cmd, true);
  2222			desc[i].flag |= cpu_to_le16(HNS_ROCE_CMD_FLAG_NEXT);
  2223		}
  2224	
> 2225		hns_roce_cmq_setup_basic_desc(&desc[cmd_numi - 1], cmd, true);
  2226		desc[cmd_num - 1].flag &= ~cpu_to_le16(HNS_ROCE_CMD_FLAG_NEXT);
  2227	
  2228		ret = hns_roce_cmq_send(hr_dev, desc, cmd_num);
  2229		if (ret)
  2230			return ret;
  2231	
  2232		resp_a = (struct hns_roce_query_pf_caps_a *)desc[0].data;
  2233		resp_b = (struct hns_roce_query_pf_caps_b *)desc[1].data;
  2234		resp_c = (struct hns_roce_query_pf_caps_c *)desc[2].data;
  2235		resp_d = (struct hns_roce_query_pf_caps_d *)desc[3].data;
  2236		resp_e = (struct hns_roce_query_pf_caps_e *)desc[4].data;
  2237		resp_f = (struct hns_roce_query_pf_caps_f *)desc[5].data;
  2238	
  2239		caps->local_ca_ack_delay = resp_a->local_ca_ack_delay;
  2240		caps->max_sq_sg = le16_to_cpu(resp_a->max_sq_sg);
  2241		caps->max_sq_inline = le16_to_cpu(resp_a->max_sq_inline);
  2242		caps->max_rq_sg = le16_to_cpu(resp_a->max_rq_sg);
  2243		caps->max_rq_sg = roundup_pow_of_two(caps->max_rq_sg);
  2244		caps->max_srq_sges = le16_to_cpu(resp_a->max_srq_sges);
  2245		caps->max_srq_sges = roundup_pow_of_two(caps->max_srq_sges);
  2246		caps->num_aeq_vectors = resp_a->num_aeq_vectors;
  2247		caps->num_other_vectors = resp_a->num_other_vectors;
  2248		caps->max_sq_desc_sz = resp_a->max_sq_desc_sz;
  2249		caps->max_rq_desc_sz = resp_a->max_rq_desc_sz;
  2250	
  2251		caps->mtpt_entry_sz = resp_b->mtpt_entry_sz;
  2252		caps->irrl_entry_sz = resp_b->irrl_entry_sz;
  2253		caps->trrl_entry_sz = resp_b->trrl_entry_sz;
  2254		caps->cqc_entry_sz = resp_b->cqc_entry_sz;
  2255		caps->srqc_entry_sz = resp_b->srqc_entry_sz;
  2256		caps->idx_entry_sz = resp_b->idx_entry_sz;
  2257		caps->sccc_sz = resp_b->sccc_sz;
  2258		caps->max_mtu = resp_b->max_mtu;
  2259		caps->min_cqes = resp_b->min_cqes;
  2260		caps->min_wqes = resp_b->min_wqes;
  2261		caps->page_size_cap = le32_to_cpu(resp_b->page_size_cap);
  2262		caps->pkey_table_len[0] = resp_b->pkey_table_len;
  2263		caps->phy_num_uars = resp_b->phy_num_uars;
  2264		ctx_hop_num = resp_b->ctx_hop_num;
  2265		pbl_hop_num = resp_b->pbl_hop_num;
  2266	
  2267		caps->num_pds = 1 << hr_reg_read(resp_c, PF_CAPS_C_NUM_PDS);
  2268	
  2269		caps->flags = hr_reg_read(resp_c, PF_CAPS_C_CAP_FLAGS);
  2270		caps->flags |= le16_to_cpu(resp_d->cap_flags_ex) <<
  2271			       HNS_ROCE_CAP_FLAGS_EX_SHIFT;
  2272	
  2273		caps->num_cqs = 1 << hr_reg_read(resp_c, PF_CAPS_C_NUM_CQS);
  2274		caps->gid_table_len[0] = hr_reg_read(resp_c, PF_CAPS_C_MAX_GID);
  2275		caps->max_cqes = 1 << hr_reg_read(resp_c, PF_CAPS_C_CQ_DEPTH);
  2276		caps->num_xrcds = 1 << hr_reg_read(resp_c, PF_CAPS_C_NUM_XRCDS);
  2277		caps->num_mtpts = 1 << hr_reg_read(resp_c, PF_CAPS_C_NUM_MRWS);
  2278		caps->num_qps = 1 << hr_reg_read(resp_c, PF_CAPS_C_NUM_QPS);
  2279		caps->max_qp_init_rdma = hr_reg_read(resp_c, PF_CAPS_C_MAX_ORD);
  2280		caps->max_qp_dest_rdma = caps->max_qp_init_rdma;
  2281		caps->max_wqes = 1 << le16_to_cpu(resp_c->sq_depth);
  2282	
  2283		caps->num_srqs = 1 << hr_reg_read(resp_d, PF_CAPS_D_NUM_SRQS);
  2284		caps->cong_cap = hr_reg_read(resp_d, PF_CAPS_D_CONG_CAP);
  2285		caps->max_srq_wrs = 1 << le16_to_cpu(resp_d->srq_depth);
  2286		caps->ceqe_depth = 1 << hr_reg_read(resp_d, PF_CAPS_D_CEQ_DEPTH);
  2287		caps->num_comp_vectors = hr_reg_read(resp_d, PF_CAPS_D_NUM_CEQS);
  2288		caps->aeqe_depth = 1 << hr_reg_read(resp_d, PF_CAPS_D_AEQ_DEPTH);
  2289		caps->default_cong_type = hr_reg_read(resp_d, PF_CAPS_D_DEFAULT_ALG);
  2290		caps->reserved_pds = hr_reg_read(resp_d, PF_CAPS_D_RSV_PDS);
  2291		caps->num_uars = 1 << hr_reg_read(resp_d, PF_CAPS_D_NUM_UARS);
  2292		caps->reserved_qps = hr_reg_read(resp_d, PF_CAPS_D_RSV_QPS);
  2293		caps->reserved_uars = hr_reg_read(resp_d, PF_CAPS_D_RSV_UARS);
  2294	
  2295		caps->reserved_mrws = hr_reg_read(resp_e, PF_CAPS_E_RSV_MRWS);
  2296		caps->chunk_sz = 1 << hr_reg_read(resp_e, PF_CAPS_E_CHUNK_SIZE_SHIFT);
  2297		caps->reserved_cqs = hr_reg_read(resp_e, PF_CAPS_E_RSV_CQS);
  2298		caps->reserved_xrcds = hr_reg_read(resp_e, PF_CAPS_E_RSV_XRCDS);
  2299		caps->reserved_srqs = hr_reg_read(resp_e, PF_CAPS_E_RSV_SRQS);
  2300		caps->reserved_lkey = hr_reg_read(resp_e, PF_CAPS_E_RSV_LKEYS);
  2301	
  2302		caps->max_ack_req_msg_len = le32_to_cpu(resp_f->max_ack_req_msg_len);
  2303	
  2304		caps->qpc_hop_num = ctx_hop_num;
  2305		caps->sccc_hop_num = ctx_hop_num;
  2306		caps->srqc_hop_num = ctx_hop_num;
  2307		caps->cqc_hop_num = ctx_hop_num;
  2308		caps->mpt_hop_num = ctx_hop_num;
  2309		caps->mtt_hop_num = pbl_hop_num;
  2310		caps->cqe_hop_num = pbl_hop_num;
  2311		caps->srqwqe_hop_num = pbl_hop_num;
  2312		caps->idx_hop_num = pbl_hop_num;
  2313		caps->wqe_sq_hop_num = hr_reg_read(resp_d, PF_CAPS_D_SQWQE_HOP_NUM);
  2314		caps->wqe_sge_hop_num = hr_reg_read(resp_d, PF_CAPS_D_EX_SGE_HOP_NUM);
  2315		caps->wqe_rq_hop_num = hr_reg_read(resp_d, PF_CAPS_D_RQWQE_HOP_NUM);
  2316	
  2317		if (!(caps->page_size_cap & PAGE_SIZE))
  2318			caps->page_size_cap = HNS_ROCE_V2_PAGE_SIZE_SUPPORTED;
  2319	
  2320		if (!hr_dev->is_vf) {
  2321			caps->cqe_sz = resp_a->cqe_sz;
  2322			caps->qpc_sz = le16_to_cpu(resp_b->qpc_sz);
  2323			caps->default_aeq_arm_st =
  2324					hr_reg_read(resp_d, PF_CAPS_D_AEQ_ARM_ST);
  2325			caps->default_ceq_arm_st =
  2326					hr_reg_read(resp_d, PF_CAPS_D_CEQ_ARM_ST);
  2327			caps->default_ceq_max_cnt = le16_to_cpu(resp_e->ceq_max_cnt);
  2328			caps->default_ceq_period = le16_to_cpu(resp_e->ceq_period);
  2329			caps->default_aeq_max_cnt = le16_to_cpu(resp_e->aeq_max_cnt);
  2330			caps->default_aeq_period = le16_to_cpu(resp_e->aeq_period);
  2331		}
  2332	
  2333		return 0;
  2334	}
  2335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
