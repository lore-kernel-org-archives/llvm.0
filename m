Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA44DA534;
	Tue, 14 Jul 2026 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047962; cv=none; b=IrabHWMVSmsOX+VOGcQpXqYC0IZEm421YKVHr2FDp0IEX2mJriuSoI5NM7RiDwbOipcFmqKOZrwlzEeqpZYAPYE24Fz1Qq3qw+9YkUZftiAzOZlBUt+5RHCDwtKd61nu+N3nO/WZcq3BeugJ6jE3fjTy+L1K8tXcZCgK3Y5LiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047962; c=relaxed/simple;
	bh=G2sUneMItuBdDm8dXRE6YjL2dOniX+BtzGbTiLtIHJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BKcD/4Y8S9VfxTrcz7S9hgG1RMsIeHTNBTcZQZwbA6FgM1zV0+YmFyLGNdxJ/Czzdy8VtQ9cznBMVsOqJ8fUu2HN9FFLVfQ/O/T3tUWoVfi/li26zGM3qqXLW3Fy/zApJD3rwLtPxiHYyrNg3WiNcHUtQAdp0N+989ptV3agDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VibjhtyL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VibjhtyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784047961; x=1815583961;
  h=date:from:to:cc:subject:message-id;
  bh=G2sUneMItuBdDm8dXRE6YjL2dOniX+BtzGbTiLtIHJ4=;
  b=VibjhtyLFiFesttAKvQk2iWzDl6IEA0zj4V4VFWEwSSQiTSUpfB1ekrQ
   Y/B0kP+CA7gUj2eGvhFwTvThP8vpE5TWI5OoUANzMxHJ7swkoEMULQhWN
   X+UJROyRNS4k5apngVboqB/NCoQzV9GWCKt7FrqFtRsf3Dlaik2ua1RXU
   OMH+N69LlSrBoFY8Csj89fygey3CFEyA6vPhURqAgvTw/MtH23/NHofve
   mt5EiFK7HXnGveT4f+HcW7AyN7LGF9N9OF3qGUHT/X4RZyX+GZCf3dwjo
   ty0X9pM7TPzdsBhqguoVsZxgSlYG6EhR9JCtoPbJi4Ho5B3xaZJ1G8MhB
   g==;
X-CSE-ConnectionGUID: vlS7KhG9ThisStk1+tzQ6Q==
X-CSE-MsgGUID: KV0tQ9DMRdy11HpL70OM4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88576806"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="88576806"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 09:52:34 -0700
X-CSE-ConnectionGUID: QU9WmLG+Sl2xqxtKtknDGw==
X-CSE-MsgGUID: KI5FQ/47QaS+Rbw3C5fgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="259485583"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2026 09:52:31 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjgMv-0000000042n-0Mhy;
	Tue, 14 Jul 2026 16:52:29 +0000
Date: Tue, 14 Jul 2026 18:52:03 +0200
From: kernel test robot <lkp@intel.com>
To: Anil Gurumurthy <agurumurthy@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Nilesh Javali <njavali@marvell.com>,
 Hannes Reinecke <hare@kernel.org>
Subject: drivers/scsi/qla2xxx/qla_iocb.c:4833:22: warning: variable
 'ha' set but not used
Message-ID: <202607141827.R9mpeMZx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/scsi-qla2xxx-Add-29xx-series-PCI-device-ID-support/20260714-180455
head:   a91be341107d322b5c157a8eb685f7d8d4d9277b
commit: 54ee318c616f5b1c3ee4b8eef9c9b51ee47179f4 scsi: qla2xxx: Update IO path to use 128-byte IOCBs for 29xx
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607141827.R9mpeMZx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141827.R9mpeMZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141827.R9mpeMZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_iocb.c:4833:22: warning: variable 'ha' set but not used [-Wunused-but-set-variable]
    4833 |         struct qla_hw_data *ha;
         |                             ^
   1 warning generated.
--
>> Warning: drivers/scsi/qla2xxx/qla_iocb.c:137 function parameter 'ha' not described in 'qla2x00_prep_cont_type1_iocb'
>> Warning: drivers/scsi/qla2xxx/qla_iocb.c:5023 Excess function parameter 'bundling' description in 'qla29xx_build_scsi_crc_2_iocbs'
>> Warning: drivers/scsi/qla2xxx/qla_iocb.c:137 function parameter 'ha' not described in 'qla2x00_prep_cont_type1_iocb'
>> Warning: drivers/scsi/qla2xxx/qla_iocb.c:5023 Excess function parameter 'bundling' description in 'qla29xx_build_scsi_crc_2_iocbs'


vim +/ha +4833 drivers/scsi/qla2xxx/qla_iocb.c

  4813	
  4814	/*
  4815	 * Note: the 29xx extended path reuses qla24xx_configure_prot_mode() -- the
  4816	 * SCSI-prot-op to PO_MODE_DIF_* translation is independent of the IOCB
  4817	 * generation.
  4818	 */
  4819	
  4820	/**
  4821	 * qla29xx_build_scsi_type_6_iocbs() - Build IOCB command utilizing Command
  4822	 * Type 6 IOCB types on the 29xx extended ring.
  4823	 * @sp: SRB command to process
  4824	 * @cmd_pkt: Command type 6 extended IOCB
  4825	 * @tot_dsds: Total number of segments to transfer
  4826	 */
  4827	static void
  4828	qla29xx_build_scsi_type_6_iocbs(srb_t *sp, struct cmd_type_6_ext *cmd_pkt,
  4829		uint16_t tot_dsds)
  4830	{
  4831		struct dsd64 *cur_dsd = NULL, *next_dsd;
  4832		scsi_qla_host_t	*vha;
> 4833		struct qla_hw_data *ha;
  4834		struct scsi_cmnd *cmd;
  4835		struct	scatterlist *cur_seg;
  4836		uint8_t avail_dsds;
  4837		uint8_t first_iocb = 1;
  4838		uint32_t dsd_list_len;
  4839		struct dsd_dma *dsd_ptr;
  4840		struct ct6_dsd *ctx;
  4841		struct qla_qpair *qpair = sp->qpair;
  4842	
  4843		cmd = GET_CMD_SP(sp);
  4844	
  4845		/* Update entry type to indicate Command Type 6 IOCB */
  4846		put_unaligned_le32(COMMAND_TYPE_6, &cmd_pkt->entry_type);
  4847	
  4848		/* No data transfer */
  4849		if (!scsi_bufflen(cmd) || cmd->sc_data_direction == DMA_NONE) {
  4850			cmd_pkt->byte_count = cpu_to_le32(0);
  4851			goto function_end;
  4852		}
  4853	
  4854		vha = sp->vha;
  4855		ha = vha->hw;
  4856	
  4857		/* Set transfer direction */
  4858		if (cmd->sc_data_direction == DMA_TO_DEVICE) {
  4859			cmd_pkt->control_flags = cpu_to_le16(CF_WRITE_DATA);
  4860			qpair->counters.output_bytes += scsi_bufflen(cmd);
  4861			qpair->counters.output_requests++;
  4862		} else if (cmd->sc_data_direction == DMA_FROM_DEVICE) {
  4863			cmd_pkt->control_flags = cpu_to_le16(CF_READ_DATA);
  4864			qpair->counters.input_bytes += scsi_bufflen(cmd);
  4865			qpair->counters.input_requests++;
  4866		}
  4867	
  4868		cur_seg = scsi_sglist(cmd);
  4869		ctx = &sp->u.scmd.ct6_ctx;
  4870	
  4871		while (tot_dsds) {
  4872			avail_dsds = (tot_dsds > QLA_DSDS_PER_IOCB) ?
  4873			    QLA_DSDS_PER_IOCB : tot_dsds;
  4874			tot_dsds -= avail_dsds;
  4875			dsd_list_len = (avail_dsds + 1) * QLA_DSD_SIZE;
  4876	
  4877			dsd_ptr = list_first_entry(&qpair->dsd_list, struct dsd_dma,
  4878						   list);
  4879			next_dsd = dsd_ptr->dsd_addr;
  4880			list_del(&dsd_ptr->list);
  4881			qpair->dsd_avail--;
  4882			list_add_tail(&dsd_ptr->list, &ctx->dsd_list);
  4883			ctx->dsd_use_cnt++;
  4884			qpair->dsd_inuse++;
  4885	
  4886			if (first_iocb) {
  4887				first_iocb = 0;
  4888				put_unaligned_le64(dsd_ptr->dsd_list_dma,
  4889						   &cmd_pkt->dsd[0].address);
  4890				cmd_pkt->dsd[0].length = cpu_to_le32(dsd_list_len);
  4891			} else {
  4892				put_unaligned_le64(dsd_ptr->dsd_list_dma,
  4893						   &cur_dsd->address);
  4894				cur_dsd->length = cpu_to_le32(dsd_list_len);
  4895				cur_dsd++;
  4896			}
  4897			cur_dsd = next_dsd;
  4898			while (avail_dsds) {
  4899				append_dsd64(&cur_dsd, cur_seg);
  4900				cur_seg = sg_next(cur_seg);
  4901				avail_dsds--;
  4902			}
  4903		}
  4904	
  4905		/* Null termination */
  4906		if (cur_dsd) {
  4907			cur_dsd->address = 0;
  4908			cur_dsd->length = 0;
  4909			cur_dsd++;
  4910		}
  4911		cmd_pkt->control_flags |= CF_DATA_SEG_DESCR_ENABLE;
  4912	function_end:
  4913		return;
  4914	}
  4915	
  4916	/*
  4917	 * Note: the 29xx extended path reuses qla24xx_calc_dsd_lists() -- the
  4918	 * DSD-list-per-IOCB arithmetic (based on QLA_DSDS_PER_IOCB) is generation-
  4919	 * agnostic.
  4920	 */
  4921	
  4922	/**
  4923	 * qla29xx_build_scsi_iocbs() - Build IOCB command utilizing Command Type 7
  4924	 * IOCB types on the 29xx extended ring.
  4925	 * @sp: SRB command to process
  4926	 * @cmd_pkt: Command type 7 extended IOCB
  4927	 * @tot_dsds: Total number of segments to transfer
  4928	 * @req: pointer to request queue
  4929	 */
  4930	static void __maybe_unused
  4931	qla29xx_build_scsi_iocbs(srb_t *sp, struct cmd_type_7_ext *cmd_pkt,
  4932		uint16_t tot_dsds, struct req_que *req)
  4933	{
  4934		uint8_t	avail_dsds;
  4935		struct dsd64 *cur_dsd;
  4936		scsi_qla_host_t	*vha;
  4937		struct scsi_cmnd *cmd;
  4938		struct scatterlist *sg;
  4939		int i;
  4940		struct qla_qpair *qpair = sp->qpair;
  4941	
  4942		cmd = GET_CMD_SP(sp);
  4943	
  4944		/* Update entry type to indicate Command Type 7 IOCB */
  4945		put_unaligned_le32(COMMAND_TYPE_7, &cmd_pkt->entry_type);
  4946	
  4947		/* No data transfer */
  4948		if (!scsi_bufflen(cmd) || cmd->sc_data_direction == DMA_NONE) {
  4949			cmd_pkt->byte_count = cpu_to_le32(0);
  4950			return;
  4951		}
  4952	
  4953		vha = sp->vha;
  4954	
  4955		/* Set transfer direction */
  4956		if (cmd->sc_data_direction == DMA_TO_DEVICE) {
  4957			cmd_pkt->task_mgmt_flags = cpu_to_le16(TMF_WRITE_DATA);
  4958			qpair->counters.output_bytes += scsi_bufflen(cmd);
  4959			qpair->counters.output_requests++;
  4960		} else if (cmd->sc_data_direction == DMA_FROM_DEVICE) {
  4961			cmd_pkt->task_mgmt_flags = cpu_to_le16(TMF_READ_DATA);
  4962			qpair->counters.input_bytes += scsi_bufflen(cmd);
  4963			qpair->counters.input_requests++;
  4964		}
  4965	
  4966		/* NUM_CMD67_DSDS DSDs available in the Command Type 7 ext IOCB */
  4967		avail_dsds = NUM_CMD67_DSDS;
  4968		cur_dsd = &cmd_pkt->dsd[0];
  4969	
  4970		scsi_for_each_sg(cmd, sg, tot_dsds, i) {
  4971			struct cont_a64_entry_ext *cont_pkt;
  4972	
  4973			/* Allocate additional continuation packets? */
  4974			if (avail_dsds == 0) {
  4975				/*
  4976				 * NUM_CONT1_DSDS DSDs are available in the Continuation
  4977				 * Type 1 extended IOCB.
  4978				 */
  4979				cont_pkt = qla2900_prep_cont_type1_iocb(vha, req);
  4980				cur_dsd = cont_pkt->dsd;
  4981				avail_dsds = ARRAY_SIZE(cont_pkt->dsd);
  4982			}
  4983	
  4984			append_dsd64(&cur_dsd, sg);
  4985			avail_dsds--;
  4986		}
  4987	}
  4988	
  4989	/*
  4990	 * Note: the 29xx extended path reuses qla24xx_set_t10dif_tags() (defined
  4991	 * earlier in this file) -- the T10-DIF ref/app tag layout is identical
  4992	 * between the 24xx and 29xx extended CRC_2 IOCBs (both share the same
  4993	 * fw_dif_context layout inside struct crc_context).
  4994	 */
  4995	
  4996	/*
  4997	 * Note: the 29xx extended CRC_2 path reuses the 24xx SG walkers
  4998	 * (qla24xx_get_one_block_sg, qla24xx_walk_and_build_sglist_no_difb,
  4999	 * qla24xx_walk_and_build_sglist, qla24xx_walk_and_build_prot_sglist).
  5000	 * The DSD-chain / CRC-context layout they produce is generation-agnostic;
  5001	 * only the IOCB that points at the chain (Type-6/7/CRC_2 vs their _ext
  5002	 * variants) differs between generations, and that is handled by the
  5003	 * separate qla29xx_build_* builders.
  5004	 *
  5005	 * The walkers that take a struct qla_tc_param *tc are invoked with tc=NULL
  5006	 * here because the 29xx fast-path does not use the tape/copy offload.
  5007	 */
  5008	
  5009	/**
  5010	 * qla29xx_build_scsi_crc_2_iocbs() - Build IOCB command utilizing Command
  5011	 * Type CRC_2 IOCB types on the 29xx extended ring.
  5012	 * @sp: SRB command to process
  5013	 * @cmd_pkt: Command type CRC_2 extended IOCB
  5014	 * @tot_dsds: Total number of segments to transfer
  5015	 * @tot_prot_dsds: Total number of segments with protection information
  5016	 * @fw_prot_opts: Protection options to be passed to firmware
  5017	 * @bundling: Bundling flag
  5018	 *
  5019	 * Returns 0 if successful, 1 otherwise.
  5020	 */
  5021	static int
  5022	qla29xx_build_scsi_crc_2_iocbs(srb_t *sp, struct cmd_type_crc_2_ext *cmd_pkt,
> 5023		uint16_t tot_dsds, uint16_t tot_prot_dsds, uint16_t fw_prot_opts)
  5024	{
  5025		struct dsd64		*cur_dsd;
  5026		__be32			*fcp_dl;
  5027		scsi_qla_host_t		*vha;
  5028		struct scsi_cmnd	*cmd;
  5029		uint32_t		total_bytes = 0;
  5030		uint32_t		data_bytes;
  5031		uint32_t		dif_bytes;
  5032		uint8_t			bundling = 1;
  5033		uint16_t		blk_size;
  5034		struct crc_context	*crc_ctx_pkt = NULL;
  5035		struct qla_hw_data	*ha;
  5036		uint8_t			additional_fcpcdb_len;
  5037		uint16_t		fcp_cmnd_len;
  5038		struct fcp_cmnd		*fcp_cmnd;
  5039		dma_addr_t		crc_ctx_dma;
  5040	
  5041		cmd = GET_CMD_SP(sp);
  5042	
  5043		/* Update entry type to indicate Command Type CRC_2 IOCB */
  5044		put_unaligned_le32(COMMAND_TYPE_CRC_2, &cmd_pkt->entry_type);
  5045	
  5046		vha = sp->vha;
  5047		ha = vha->hw;
  5048	
  5049		/* No data transfer */
  5050		data_bytes = scsi_bufflen(cmd);
  5051		if (!data_bytes || cmd->sc_data_direction == DMA_NONE) {
  5052			cmd_pkt->byte_count = cpu_to_le32(0);
  5053			return QLA_SUCCESS;
  5054		}
  5055	
  5056		cmd_pkt->vp_index = cpu_to_le16(sp->vha->vp_idx);
  5057	
  5058		/* Set transfer direction */
  5059		if (cmd->sc_data_direction == DMA_TO_DEVICE)
  5060			cmd_pkt->control_flags_1 = cpu_to_le16(CF_WRITE_DATA);
  5061		else if (cmd->sc_data_direction == DMA_FROM_DEVICE)
  5062			cmd_pkt->control_flags_1 = cpu_to_le16(CF_READ_DATA);
  5063	
  5064		if ((scsi_get_prot_op(cmd) == SCSI_PROT_READ_INSERT) ||
  5065		    (scsi_get_prot_op(cmd) == SCSI_PROT_WRITE_STRIP) ||
  5066		    (scsi_get_prot_op(cmd) == SCSI_PROT_READ_STRIP) ||
  5067		    (scsi_get_prot_op(cmd) == SCSI_PROT_WRITE_INSERT))
  5068			bundling = 0;
  5069	
  5070		/* Allocate CRC context from global pool */
  5071		crc_ctx_pkt = sp->u.scmd.crc_ctx =
  5072		    dma_pool_zalloc(ha->dl_dma_pool, GFP_ATOMIC, &crc_ctx_dma);
  5073	
  5074		if (!crc_ctx_pkt)
  5075			goto crc_queuing_error;
  5076	
  5077		crc_ctx_pkt->crc_ctx_dma = crc_ctx_dma;
  5078	
  5079		sp->flags |= SRB_CRC_CTX_DMA_VALID;
  5080	
  5081		/* Set handle */
  5082		crc_ctx_pkt->handle = cmd_pkt->handle;
  5083	
  5084		INIT_LIST_HEAD(&crc_ctx_pkt->dsd_list);
  5085	
  5086		qla24xx_set_t10dif_tags(sp, (struct fw_dif_context *)
  5087		    &crc_ctx_pkt->ref_tag, tot_prot_dsds);
  5088	
  5089		/* Determine SCSI command length -- align to 4 byte boundary */
  5090		if (cmd->cmd_len > 16) {
  5091			additional_fcpcdb_len = cmd->cmd_len - 16;
  5092			if ((cmd->cmd_len % 4) != 0) {
  5093				/* SCSI cmd > 16 bytes must be multiple of 4 */
  5094				goto crc_queuing_error;
  5095			}
  5096			fcp_cmnd_len = 12 + cmd->cmd_len + 4;
  5097		} else {
  5098			additional_fcpcdb_len = 0;
  5099			fcp_cmnd_len = 12 + 16 + 4;
  5100		}
  5101	
  5102		fcp_cmnd = &crc_ctx_pkt->fcp_cmnd;
  5103	
  5104		fcp_cmnd->additional_cdb_len = additional_fcpcdb_len;
  5105		if (cmd->sc_data_direction == DMA_TO_DEVICE)
  5106			fcp_cmnd->additional_cdb_len |= 1;
  5107		else if (cmd->sc_data_direction == DMA_FROM_DEVICE)
  5108			fcp_cmnd->additional_cdb_len |= 2;
  5109	
  5110		int_to_scsilun(cmd->device->lun, &fcp_cmnd->lun);
  5111		memcpy(fcp_cmnd->cdb, cmd->cmnd, cmd->cmd_len);
  5112		cmd_pkt->fcp_cmnd_dseg_len = cpu_to_le16(fcp_cmnd_len);
  5113		put_unaligned_le64(crc_ctx_dma + CRC_CONTEXT_FCPCMND_OFF,
  5114				   &cmd_pkt->fcp_cmnd_dseg_address);
  5115		fcp_cmnd->task_management = 0;
  5116		fcp_cmnd->task_attribute = TSK_SIMPLE;
  5117	
  5118		cmd_pkt->fcp_rsp_dseg_len = 0; /* Let response come in status iocb */
  5119	
  5120		/* Compute dif len and adjust data len to include protection */
  5121		dif_bytes = 0;
  5122		blk_size = cmd->device->sector_size;
  5123		dif_bytes = (data_bytes / blk_size) * 8;
  5124	
  5125		switch (scsi_get_prot_op(GET_CMD_SP(sp))) {
  5126		case SCSI_PROT_READ_INSERT:
  5127		case SCSI_PROT_WRITE_STRIP:
  5128			total_bytes = data_bytes;
  5129			data_bytes += dif_bytes;
  5130			break;
  5131	
  5132		case SCSI_PROT_READ_STRIP:
  5133		case SCSI_PROT_WRITE_INSERT:
  5134		case SCSI_PROT_READ_PASS:
  5135		case SCSI_PROT_WRITE_PASS:
  5136			total_bytes = data_bytes + dif_bytes;
  5137			break;
  5138		default:
  5139			WARN_ON_ONCE(1);
  5140			return 1;
  5141		}
  5142	
  5143		if (!qla2x00_hba_err_chk_enabled(sp))
  5144			fw_prot_opts |= 0x10; /* Disable Guard tag checking */
  5145		/* HBA error checking enabled */
  5146		else {
  5147			if ((scsi_get_prot_type(GET_CMD_SP(sp)) == SCSI_PROT_DIF_TYPE1)
  5148			    || (scsi_get_prot_type(GET_CMD_SP(sp)) ==
  5149				SCSI_PROT_DIF_TYPE2))
  5150				fw_prot_opts |= BIT_10;
  5151			else if (scsi_get_prot_type(GET_CMD_SP(sp)) ==
  5152			    SCSI_PROT_DIF_TYPE3)
  5153				fw_prot_opts |= BIT_11;
  5154		}
  5155	
  5156		if (!bundling) {
  5157			cur_dsd = &crc_ctx_pkt->u.nobundling.data_dsd[0];
  5158		} else {
  5159			/*
  5160			 * Configure Bundling if we need to fetch interleaving
  5161			 * protection PCI accesses
  5162			 */
  5163			fw_prot_opts |= PO_ENABLE_DIF_BUNDLING;
  5164			crc_ctx_pkt->u.bundling.dif_byte_count = cpu_to_le32(dif_bytes);
  5165			crc_ctx_pkt->u.bundling.dseg_count = cpu_to_le16(tot_dsds -
  5166								tot_prot_dsds);
  5167			cur_dsd = &crc_ctx_pkt->u.bundling.data_dsd[0];
  5168		}
  5169	
  5170		/* Finish the common fields of CRC pkt */
  5171		crc_ctx_pkt->blk_size = cpu_to_le16(blk_size);
  5172		crc_ctx_pkt->prot_opts = cpu_to_le16(fw_prot_opts);
  5173		crc_ctx_pkt->byte_count = cpu_to_le32(data_bytes);
  5174		crc_ctx_pkt->guard_seed = cpu_to_le16(0);
  5175		/* Fibre channel byte count */
  5176		cmd_pkt->byte_count = cpu_to_le32(total_bytes);
  5177		fcp_dl = (__be32 *)(crc_ctx_pkt->fcp_cmnd.cdb + 16 +
  5178		    additional_fcpcdb_len);
  5179		*fcp_dl = htonl(total_bytes);
  5180	
  5181		/* Walks data segments */
  5182	
  5183		cmd_pkt->control_flags_1 |= cpu_to_le16(CF_DATA_SEG_DESCR_ENABLE);
  5184	
  5185		if (!bundling && tot_prot_dsds) {
  5186			if (qla24xx_walk_and_build_sglist_no_difb(ha, sp,
  5187				cur_dsd, tot_dsds, NULL))
  5188				goto crc_queuing_error;
  5189		} else if (qla24xx_walk_and_build_sglist(ha, sp, cur_dsd,
  5190				(tot_dsds - tot_prot_dsds), NULL))
  5191			goto crc_queuing_error;
  5192	
  5193		if (bundling && tot_prot_dsds) {
  5194			/* Walks dif segments */
  5195			cmd_pkt->control_flags_1 |= cpu_to_le16(CF_DIF_SEG_DESCR_ENABLE);
  5196			cur_dsd = &crc_ctx_pkt->u.bundling.dif_dsd;
  5197			if (qla24xx_walk_and_build_prot_sglist(ha, sp, cur_dsd,
  5198					tot_prot_dsds, NULL))
  5199				goto crc_queuing_error;
  5200		}
  5201		qla29xx_copy_dif_iocb_data(cmd_pkt, crc_ctx_pkt, bundling);
  5202	
  5203		return QLA_SUCCESS;
  5204	
  5205	crc_queuing_error:
  5206		/* Cleanup will be performed by the caller */
  5207		return QLA_FUNCTION_FAILED;
  5208	}
  5209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
