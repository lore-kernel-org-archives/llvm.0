Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23124C8C;
	Sat, 17 Jun 2023 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687014099; x=1718550099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYxlNhys+EMsmxikqxXtY8HrsL/KmkhiJny/EYHTT9E=;
  b=a3GfjkBi2mztNum1RQ9ULM3EDCxEeNapvRK6HsGaFu6a1yvsSiDAwQeA
   Zm3tgCGK4o/9vndXifx+oz+MOWBD+39tuPLZVfgnTk/OXLPxwiNNkyaPS
   QJfAWL5gIUxcFe+JZ8IZmNLKBTJ7LsAA6H8RSV0xXuqqePislmA+W1jtO
   3nLqEDVWNznJKRUYLva5KP1UQ3Yx4e/kmde2N4O10+nXfFFS5hmrIcZRj
   ZonzTS4B6TbCO3dzYS+bLxva+cOAJ7zVLAU2B/mZiATWIh163iUpLe/Pq
   ZpJVMKIsyrQh/XXgxEkB+LWaAEuxhXlHAeFD/ngy9gSvVqid1n2Goq291
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="388277392"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="388277392"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="713196624"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="713196624"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jun 2023 08:01:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAXQl-0002pU-2A;
	Sat, 17 Jun 2023 15:01:35 +0000
Date: Sat, 17 Jun 2023 23:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Leon Romanovsky <leon@kernel.org>,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: [linux-next:master 8257/10546]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:325:18: warning: variable
 'opcode' is uninitialized when used here
Message-ID: <202306172212.EDVOdASm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: bcfee4ce3e0139ffa9c564e4ed3682e8b87f0a1d [8257/10546] RDMA/bnxt_re: remove redundant cmdq_bitmap
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230617/202306172212.EDVOdASm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172212.EDVOdASm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172212.EDVOdASm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:325:18: warning: variable 'opcode' is uninitialized when used here [-Wuninitialized]
           crsqe->opcode = opcode;
                           ^~~~~~
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:291:11: note: initialize the variable 'opcode' to silence this warning
           u8 opcode;
                    ^
                     = '\0'
   1 warning generated.


vim +/opcode +325 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

   278	
   279	static int __send_message(struct bnxt_qplib_rcfw *rcfw,
   280				  struct bnxt_qplib_cmdqmsg *msg)
   281	{
   282		u32 bsize, free_slots, required_slots;
   283		struct bnxt_qplib_cmdq_ctx *cmdq;
   284		struct bnxt_qplib_crsqe *crsqe;
   285		struct bnxt_qplib_cmdqe *cmdqe;
   286		struct bnxt_qplib_hwq *hwq;
   287		u32 sw_prod, cmdq_prod;
   288		struct pci_dev *pdev;
   289		unsigned long flags;
   290		u16 cookie;
   291		u8 opcode;
   292		u8 *preq;
   293	
   294		cmdq = &rcfw->cmdq;
   295		hwq = &cmdq->hwq;
   296		pdev = rcfw->pdev;
   297	
   298		/* Cmdq are in 16-byte units, each request can consume 1 or more
   299		 * cmdqe
   300		 */
   301		spin_lock_irqsave(&hwq->lock, flags);
   302		required_slots = bnxt_qplib_get_cmd_slots(msg->req);
   303		free_slots = HWQ_FREE_SLOTS(hwq);
   304		cookie = cmdq->seq_num & RCFW_MAX_COOKIE_VALUE;
   305		crsqe = &rcfw->crsqe_tbl[cookie];
   306	
   307		if (required_slots >= free_slots) {
   308			dev_info_ratelimited(&pdev->dev,
   309					     "CMDQ is full req/free %d/%d!",
   310					     required_slots, free_slots);
   311			spin_unlock_irqrestore(&hwq->lock, flags);
   312			return -EAGAIN;
   313		}
   314		if (msg->block)
   315			cookie |= RCFW_CMD_IS_BLOCKING;
   316		__set_cmdq_base_cookie(msg->req, msg->req_sz, cpu_to_le16(cookie));
   317	
   318		bsize = bnxt_qplib_set_cmd_slots(msg->req);
   319		crsqe->free_slots = free_slots;
   320		crsqe->resp = (struct creq_qp_event *)msg->resp;
   321		crsqe->resp->cookie = cpu_to_le16(cookie);
   322		crsqe->is_internal_cmd = false;
   323		crsqe->is_waiter_alive = true;
   324		crsqe->is_in_used = true;
 > 325		crsqe->opcode = opcode;
   326	
   327		crsqe->req_size = __get_cmdq_base_cmd_size(msg->req, msg->req_sz);
   328		if (__get_cmdq_base_resp_size(msg->req, msg->req_sz) && msg->sb) {
   329			struct bnxt_qplib_rcfw_sbuf *sbuf = msg->sb;
   330	
   331			__set_cmdq_base_resp_addr(msg->req, msg->req_sz,
   332						  cpu_to_le64(sbuf->dma_addr));
   333			__set_cmdq_base_resp_size(msg->req, msg->req_sz,
   334						  ALIGN(sbuf->size,
   335							BNXT_QPLIB_CMDQE_UNITS));
   336		}
   337	
   338		preq = (u8 *)msg->req;
   339		do {
   340			/* Locate the next cmdq slot */
   341			sw_prod = HWQ_CMP(hwq->prod, hwq);
   342			cmdqe = bnxt_qplib_get_qe(hwq, sw_prod, NULL);
   343			/* Copy a segment of the req cmd to the cmdq */
   344			memset(cmdqe, 0, sizeof(*cmdqe));
   345			memcpy(cmdqe, preq, min_t(u32, bsize, sizeof(*cmdqe)));
   346			preq += min_t(u32, bsize, sizeof(*cmdqe));
   347			bsize -= min_t(u32, bsize, sizeof(*cmdqe));
   348			hwq->prod++;
   349		} while (bsize > 0);
   350		cmdq->seq_num++;
   351	
   352		cmdq_prod = hwq->prod & 0xFFFF;
   353		if (test_bit(FIRMWARE_FIRST_FLAG, &cmdq->flags)) {
   354			/* The very first doorbell write
   355			 * is required to set this flag
   356			 * which prompts the FW to reset
   357			 * its internal pointers
   358			 */
   359			cmdq_prod |= BIT(FIRMWARE_FIRST_FLAG);
   360			clear_bit(FIRMWARE_FIRST_FLAG, &cmdq->flags);
   361		}
   362		/* ring CMDQ DB */
   363		wmb();
   364		writel(cmdq_prod, cmdq->cmdq_mbox.prod);
   365		writel(RCFW_CMDQ_TRIG_VAL, cmdq->cmdq_mbox.db);
   366		spin_unlock_irqrestore(&hwq->lock, flags);
   367		/* Return the CREQ response pointer */
   368		return 0;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
