Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614914AA8;
	Thu, 17 Aug 2023 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692286701; x=1723822701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AF6Jp9zpxQK52mVav7l7mei07u6LPV0nf5nfuhvoi3E=;
  b=O3lXDw/aV4QaSpyg7fau7XjWOBUeHZllHnSU+I2Z2ImTa3Kah+m8iDSB
   gsQ1PgnxeNOxRyM/i5YLCvXO9juuiSl9bvEL/T9FoJAUsUdggXzg9xXOM
   gnVYutsiShkDwS0K7zaC4R84SKqUaJSQVky3Vw67xF0BR4ECFkJDNBn4i
   UNZ4WrgsTv5wO8SmNBh4cOmNTh0ciym/Xxp/asCL2MvdPdRfA4yVNcCO2
   VD2SfzEN0DSoEetB9bQbQCcnmmLIFzTTKjvCnKG4BX5Pagon8Is/hspfY
   w5XQMFDGEUJHZpNKtCbgDK9mfMqHTnC2RAlRnwP3khrF7ijskbNv6liw9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459204644"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="459204644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764139341"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764139341"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 08:36:23 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWf2r-0001HW-33;
	Thu, 17 Aug 2023 15:36:21 +0000
Date: Thu, 17 Aug 2023 23:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	Nilesh Javali <njavali@marvell.com>
Subject: drivers/scsi/qla2xxx/qla_isr.c:3724: warning: Function parameter or
 member 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'
Message-ID: <202308172330.ram2SwC7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: c019cd656e717349ff22d0c41d6fbfc773f48c52 scsi: qla2xxx: edif: Fix dropped IKE message
date:   1 year, 1 month ago
config: i386-randconfig-i002-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172330.ram2SwC7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172330.ram2SwC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172330.ram2SwC7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_isr.c:3724: warning: Function parameter or member 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'


vim +3724 drivers/scsi/qla2xxx/qla_isr.c

e84067d7430107 Duane Grigsby 2017-06-21  3713  
fac2807946c10b Quinn Tran    2021-06-23  3714  /**
fac2807946c10b Quinn Tran    2021-06-23  3715   * qla_chk_cont_iocb_avail - check for all continuation iocbs are available
fac2807946c10b Quinn Tran    2021-06-23  3716   *   before iocb processing can start.
fac2807946c10b Quinn Tran    2021-06-23  3717   * @vha: host adapter pointer
fac2807946c10b Quinn Tran    2021-06-23  3718   * @rsp: respond queue
fac2807946c10b Quinn Tran    2021-06-23  3719   * @pkt: head iocb describing how many continuation iocb
fac2807946c10b Quinn Tran    2021-06-23  3720   * Return: 0 all iocbs has arrived, xx- all iocbs have not arrived.
fac2807946c10b Quinn Tran    2021-06-23  3721   */
fac2807946c10b Quinn Tran    2021-06-23  3722  static int qla_chk_cont_iocb_avail(struct scsi_qla_host *vha,
c019cd656e7173 Quinn Tran    2022-07-12  3723  	struct rsp_que *rsp, response_t *pkt, u32 rsp_q_in)
fac2807946c10b Quinn Tran    2021-06-23 @3724  {
c019cd656e7173 Quinn Tran    2022-07-12  3725  	int start_pkt_ring_index;
c019cd656e7173 Quinn Tran    2022-07-12  3726  	u32 iocb_cnt = 0;
fac2807946c10b Quinn Tran    2021-06-23  3727  	int rc = 0;
fac2807946c10b Quinn Tran    2021-06-23  3728  
fac2807946c10b Quinn Tran    2021-06-23  3729  	if (pkt->entry_count == 1)
fac2807946c10b Quinn Tran    2021-06-23  3730  		return rc;
fac2807946c10b Quinn Tran    2021-06-23  3731  
fac2807946c10b Quinn Tran    2021-06-23  3732  	/* ring_index was pre-increment. set it back to current pkt */
fac2807946c10b Quinn Tran    2021-06-23  3733  	if (rsp->ring_index == 0)
fac2807946c10b Quinn Tran    2021-06-23  3734  		start_pkt_ring_index = rsp->length - 1;
fac2807946c10b Quinn Tran    2021-06-23  3735  	else
fac2807946c10b Quinn Tran    2021-06-23  3736  		start_pkt_ring_index = rsp->ring_index - 1;
fac2807946c10b Quinn Tran    2021-06-23  3737  
c019cd656e7173 Quinn Tran    2022-07-12  3738  	if (rsp_q_in < start_pkt_ring_index)
c019cd656e7173 Quinn Tran    2022-07-12  3739  		/* q in ptr is wrapped */
c019cd656e7173 Quinn Tran    2022-07-12  3740  		iocb_cnt = rsp->length - start_pkt_ring_index + rsp_q_in;
fac2807946c10b Quinn Tran    2021-06-23  3741  	else
c019cd656e7173 Quinn Tran    2022-07-12  3742  		iocb_cnt = rsp_q_in - start_pkt_ring_index;
fac2807946c10b Quinn Tran    2021-06-23  3743  
c019cd656e7173 Quinn Tran    2022-07-12  3744  	if (iocb_cnt < pkt->entry_count)
fac2807946c10b Quinn Tran    2021-06-23  3745  		rc = -EIO;
fac2807946c10b Quinn Tran    2021-06-23  3746  
c019cd656e7173 Quinn Tran    2022-07-12  3747  	ql_dbg(ql_dbg_init, vha, 0x5091,
c019cd656e7173 Quinn Tran    2022-07-12  3748  	       "%s - ring %p pkt %p entry count %d iocb_cnt %d rsp_q_in %d rc %d\n",
c019cd656e7173 Quinn Tran    2022-07-12  3749  	       __func__, rsp->ring, pkt, pkt->entry_count, iocb_cnt, rsp_q_in, rc);
fac2807946c10b Quinn Tran    2021-06-23  3750  
fac2807946c10b Quinn Tran    2021-06-23  3751  	return rc;
fac2807946c10b Quinn Tran    2021-06-23  3752  }
fac2807946c10b Quinn Tran    2021-06-23  3753  

:::::: The code at line 3724 was first introduced by commit
:::::: fac2807946c10b9a509b9c348afd442fa823c5f7 scsi: qla2xxx: edif: Add extraction of auth_els from the wire

:::::: TO: Quinn Tran <qutran@marvell.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
