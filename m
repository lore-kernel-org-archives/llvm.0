Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291A1078A;
	Thu, 13 Jul 2023 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689242332; x=1720778332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zyhLKzHEbvZh0m0yw71FWPE9ATf7hBKeew4ZQU4FAI=;
  b=maIcmA97IylmWrFl27U3uz8OEbJn8vlvBn7yybfv49faZvIbeoPuujep
   TCeiGuXM6Lb/fGOY+vJd/qpBVTnki+b6Mq3N5Ot2mh5kCTqcH2ObmjI7B
   zFM3HugbVf6S7C9fEEfSiEjlGYH92D1xOH7X86zFDJ2x3RqAXFhGeI8Ty
   i3JpAaom9+alfGruIqSNV6uCYIY701NDs29QL2nuxKgIRx02fLrRoGsUt
   ivHA9CQoyK0qP43Gp5vPYzHY94ZbJbKLZcJXdeCSuUHJy5Wa281KRD8fH
   yLjXmY6UH3iRJrgEuIH9FDB2vbNcLs5GRpURN92z/l8yEcfNXVwxW2Cuv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="345457294"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="345457294"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 02:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725242414"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="725242414"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 02:58:49 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJt61-0006Vv-0M;
	Thu, 13 Jul 2023 09:58:49 +0000
Date: Thu, 13 Jul 2023 17:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: [mtd:nand/next 24/28] drivers/mtd/nand/raw/qcom_nandc.c:2957:24:
 warning: variable 'naddrs' set but not used
Message-ID: <202307131730.NOYbcjBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   2b42d718c7d7f4269d45fb58b4f74d7b2bfb08bd
commit: 5c6a9518447ebc72606b390ab5cb3eab9dc1d867 [24/28] mtd: rawnand: qcom: Implement exec_op()
config: arm64-randconfig-r034-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131730.NOYbcjBr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131730.NOYbcjBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/qcom_nandc.c:2957:24: warning: variable 'naddrs' set but not used [-Wunused-but-set-variable]
                   unsigned int offset, naddrs;
                                        ^
   1 warning generated.


vim +/naddrs +2957 drivers/mtd/nand/raw/qcom_nandc.c

  2943	
  2944	/* NAND framework ->exec_op() hooks and related helpers */
  2945	static void qcom_parse_instructions(struct nand_chip *chip,
  2946					    const struct nand_subop *subop,
  2947						struct qcom_op *q_op)
  2948	{
  2949		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
  2950		const struct nand_op_instr *instr = NULL;
  2951		unsigned int op_id;
  2952		int i;
  2953	
  2954		memset(q_op, 0, sizeof(*q_op));
  2955	
  2956		for (op_id = 0; op_id < subop->ninstrs; op_id++) {
> 2957			unsigned int offset, naddrs;
  2958			const u8 *addrs;
  2959	
  2960			instr = &subop->instrs[op_id];
  2961	
  2962			switch (instr->type) {
  2963			case NAND_OP_CMD_INSTR:
  2964				q_op->cmd_reg = qcom_op_cmd_mapping(nandc, instr->ctx.cmd.opcode, q_op);
  2965				q_op->rdy_delay_ns = instr->delay_ns;
  2966				break;
  2967	
  2968			case NAND_OP_ADDR_INSTR:
  2969				offset = nand_subop_get_addr_start_off(subop, op_id);
  2970				naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
  2971				addrs = &instr->ctx.addr.addrs[offset];
  2972				for (i = 0; i < MAX_ADDRESS_CYCLE; i++) {
  2973					if (i < 4)
  2974						q_op->addr1_reg |= (u32)addrs[i] << i * 8;
  2975					else
  2976						q_op->addr2_reg |= addrs[i];
  2977				}
  2978				q_op->rdy_delay_ns = instr->delay_ns;
  2979				break;
  2980	
  2981			case NAND_OP_DATA_IN_INSTR:
  2982				q_op->data_instr = instr;
  2983				q_op->data_instr_idx = op_id;
  2984				q_op->rdy_delay_ns = instr->delay_ns;
  2985				fallthrough;
  2986			case NAND_OP_DATA_OUT_INSTR:
  2987				q_op->rdy_delay_ns = instr->delay_ns;
  2988				break;
  2989	
  2990			case NAND_OP_WAITRDY_INSTR:
  2991				q_op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
  2992				q_op->rdy_delay_ns = instr->delay_ns;
  2993				break;
  2994			}
  2995		}
  2996	}
  2997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
