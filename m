Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116D8F5A;
	Wed, 19 Mar 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380084; cv=none; b=sx0mrFJChsn2AFFWMl9PvQe+gHiXj82kRlI8heWSYQfrId6FmBwBrv3/uSA0Uvb/fN5Pk3T0nh43Cbb+dc+pp3+9xm66Eh0tZazlAvPfRdGyqVXwM300h7MDT9WNOiGT+/ZM0q0oDXPJHH66SfpIddAswkdJNgHgM6pu/0SLaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380084; c=relaxed/simple;
	bh=yClz+7wQMY4xhK1X1tOrbYdjJSZ+csKdKqUy3kmwBuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJUrD/jkab4F697D58G2aXCMrotgtMAIxU7CAPHDi99zmVaWXXz6Nsh+9WX2Cr+9lN7dYoDCxSaydgvK/LBXxljM+miBuwqwvO8qoOikfVHj+JtSX4nipZUu/c61Ti3/g5fCt4fGlU9lJW1ZqeE3Yz9vuZ5gi80XEo92PAft6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTp4bpr3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTp4bpr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742380082; x=1773916082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yClz+7wQMY4xhK1X1tOrbYdjJSZ+csKdKqUy3kmwBuA=;
  b=CTp4bpr3oJBqB1yrbE9LQVcmIcaiC8Qj2iEDCA+mAq8jcKrwLXgEN1oF
   djmUFW+na0ZjZMyyR2y290thBs8+y0nEQ8ehWAHo5VcJ14x6o0kulczs2
   sGwZh0S9xkrrEkQiCbAYgUYRKSjo0I8tKE19QyJ2fCaQ4dlWFw7JnZSP3
   1vEP2Xr/4+gkSucCgMvhk5w1TC8MRg29HSat7BaJoYl5XLQJAjZSavJ6L
   twbSwOSYSZySG6EyFVGoHAdTN+3C0SxFKfSINBbbKoaET10JoiXxxwl2O
   fUysYAgoWnKm8KvkmKUdd8nsLlbRABXqxUdGTF91y4d+bWvyPzRRAoiRo
   w==;
X-CSE-ConnectionGUID: w/hrF27STf+NWmDOVFQ+OA==
X-CSE-MsgGUID: ypmZ7YpZS0yW9Tcde6Rj2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43425619"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43425619"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:28:01 -0700
X-CSE-ConnectionGUID: didUCmgSTLCtrHAU7daE5A==
X-CSE-MsgGUID: r0tqOrlOQZe4Bfkkq8w0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122393877"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2025 03:27:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuqeS-000Eak-2F;
	Wed, 19 Mar 2025 10:27:56 +0000
Date: Wed, 19 Mar 2025 18:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <yschu@nuvoton.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [i3c:i3c/next 15/15] drivers/i3c/master/svc-i3c-master.c:596:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202503191809.vEfI0h7u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
head:   0430bf9bc1ac068c8b8c540eb93e5751872efc51
commit: 0430bf9bc1ac068c8b8c540eb93e5751872efc51 [15/15] i3c: master: svc: Fix missing STOP for master request
config: i386-buildonly-randconfig-004-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191809.vEfI0h7u-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191809.vEfI0h7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191809.vEfI0h7u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/svc-i3c-master.c:596:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     596 |         default:
         |         ^
   drivers/i3c/master/svc-i3c-master.c:596:2: note: insert 'break;' to avoid fall-through
     596 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +596 drivers/i3c/master/svc-i3c-master.c

e22405a812a11e Frank Li      2024-10-02  489  
dd3c52846d5954 Miquel Raynal 2021-01-21  490  static void svc_i3c_master_ibi_work(struct work_struct *work)
dd3c52846d5954 Miquel Raynal 2021-01-21  491  {
dd3c52846d5954 Miquel Raynal 2021-01-21  492  	struct svc_i3c_master *master = container_of(work, struct svc_i3c_master, ibi_work);
dd3c52846d5954 Miquel Raynal 2021-01-21  493  	struct svc_i3c_i2c_dev_data *data;
dd3c52846d5954 Miquel Raynal 2021-01-21  494  	unsigned int ibitype, ibiaddr;
dd3c52846d5954 Miquel Raynal 2021-01-21  495  	struct i3c_dev_desc *dev;
dd3c52846d5954 Miquel Raynal 2021-01-21  496  	u32 status, val;
dd3c52846d5954 Miquel Raynal 2021-01-21  497  	int ret;
dd3c52846d5954 Miquel Raynal 2021-01-21  498  
f36f6624cbacb3 Frank Li      2024-10-02  499  	/*
f36f6624cbacb3 Frank Li      2024-10-02  500  	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
f36f6624cbacb3 Frank Li      2024-10-02  501  	 *
f36f6624cbacb3 Frank Li      2024-10-02  502  	 * The I3C Controller shall hold SCL low while the Bus is in ACK/NACK Phase of I3C/I2C
f36f6624cbacb3 Frank Li      2024-10-02  503  	 * transfer. But maximum stall time is 100us. The IRQs have to be disabled to prevent
f36f6624cbacb3 Frank Li      2024-10-02  504  	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
f36f6624cbacb3 Frank Li      2024-10-02  505  	 * any irq or schedule happen during transaction.
f36f6624cbacb3 Frank Li      2024-10-02  506  	 */
f36f6624cbacb3 Frank Li      2024-10-02  507  	guard(spinlock_irqsave)(&master->xferqueue.lock);
f36f6624cbacb3 Frank Li      2024-10-02  508  
38baed9b860000 Frank Li      2024-05-06  509  	/*
38baed9b860000 Frank Li      2024-05-06  510  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
38baed9b860000 Frank Li      2024-05-06  511  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
38baed9b860000 Frank Li      2024-05-06  512  	 * ibitype will be 0 since it was last updated only after the 8th SCL
38baed9b860000 Frank Li      2024-05-06  513  	 * cycle, leading to missed client IBI handlers.
38baed9b860000 Frank Li      2024-05-06  514  	 *
38baed9b860000 Frank Li      2024-05-06  515  	 * A typical scenario is when IBIWON occurs and bus arbitration is lost
38baed9b860000 Frank Li      2024-05-06  516  	 * at svc_i3c_master_priv_xfers().
38baed9b860000 Frank Li      2024-05-06  517  	 *
38baed9b860000 Frank Li      2024-05-06  518  	 * Clear SVC_I3C_MINT_IBIWON before sending SVC_I3C_MCTRL_REQUEST_AUTO_IBI.
38baed9b860000 Frank Li      2024-05-06  519  	 */
38baed9b860000 Frank Li      2024-05-06  520  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
38baed9b860000 Frank Li      2024-05-06  521  
dd3c52846d5954 Miquel Raynal 2021-01-21  522  	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
dd3c52846d5954 Miquel Raynal 2021-01-21  523  	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
dd3c52846d5954 Miquel Raynal 2021-01-21  524  	       SVC_I3C_MCTRL_IBIRESP_AUTO,
dd3c52846d5954 Miquel Raynal 2021-01-21  525  	       master->regs + SVC_I3C_MCTRL);
dd3c52846d5954 Miquel Raynal 2021-01-21  526  
dd3c52846d5954 Miquel Raynal 2021-01-21  527  	/* Wait for IBIWON, should take approximately 100us */
f36f6624cbacb3 Frank Li      2024-10-02  528  	ret = readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, val,
f36f6624cbacb3 Frank Li      2024-10-02  529  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 100);
dd3c52846d5954 Miquel Raynal 2021-01-21  530  	if (ret) {
dd3c52846d5954 Miquel Raynal 2021-01-21  531  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
dfd7cd6aafdb1f Frank Li      2023-10-23  532  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  533  		goto reenable_ibis;
dd3c52846d5954 Miquel Raynal 2021-01-21  534  	}
dd3c52846d5954 Miquel Raynal 2021-01-21  535  
dd3c52846d5954 Miquel Raynal 2021-01-21  536  	status = readl(master->regs + SVC_I3C_MSTATUS);
dd3c52846d5954 Miquel Raynal 2021-01-21  537  	ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
dd3c52846d5954 Miquel Raynal 2021-01-21  538  	ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
dd3c52846d5954 Miquel Raynal 2021-01-21  539  
dd3c52846d5954 Miquel Raynal 2021-01-21  540  	/* Handle the critical responses to IBI's */
dd3c52846d5954 Miquel Raynal 2021-01-21  541  	switch (ibitype) {
dd3c52846d5954 Miquel Raynal 2021-01-21  542  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954 Miquel Raynal 2021-01-21  543  		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
05b26c31a4859a Frank Li      2023-12-01  544  		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
dd3c52846d5954 Miquel Raynal 2021-01-21  545  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  546  		else
dd3c52846d5954 Miquel Raynal 2021-01-21  547  			svc_i3c_master_handle_ibi(master, dev);
dd3c52846d5954 Miquel Raynal 2021-01-21  548  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  549  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859a Frank Li      2023-12-01  550  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954 Miquel Raynal 2021-01-21  551  			svc_i3c_master_ack_ibi(master, false);
05b26c31a4859a Frank Li      2023-12-01  552  		else
05b26c31a4859a Frank Li      2023-12-01  553  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  554  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  555  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
dd3c52846d5954 Miquel Raynal 2021-01-21  556  		svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  557  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  558  	default:
dd3c52846d5954 Miquel Raynal 2021-01-21  559  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  560  	}
dd3c52846d5954 Miquel Raynal 2021-01-21  561  
dd3c52846d5954 Miquel Raynal 2021-01-21  562  	/*
dd3c52846d5954 Miquel Raynal 2021-01-21  563  	 * If an error happened, we probably got interrupted and the exchange
dd3c52846d5954 Miquel Raynal 2021-01-21  564  	 * timedout. In this case we just drop everything, emit a stop and wait
dd3c52846d5954 Miquel Raynal 2021-01-21  565  	 * for the slave to interrupt again.
dd3c52846d5954 Miquel Raynal 2021-01-21  566  	 */
dd3c52846d5954 Miquel Raynal 2021-01-21  567  	if (svc_i3c_master_error(master)) {
dd3c52846d5954 Miquel Raynal 2021-01-21  568  		if (master->ibi.tbq_slot) {
dd3c52846d5954 Miquel Raynal 2021-01-21  569  			data = i3c_dev_get_master_data(dev);
dd3c52846d5954 Miquel Raynal 2021-01-21  570  			i3c_generic_ibi_recycle_slot(data->ibi_pool,
dd3c52846d5954 Miquel Raynal 2021-01-21  571  						     master->ibi.tbq_slot);
dd3c52846d5954 Miquel Raynal 2021-01-21  572  			master->ibi.tbq_slot = NULL;
dd3c52846d5954 Miquel Raynal 2021-01-21  573  		}
dd3c52846d5954 Miquel Raynal 2021-01-21  574  
dd3c52846d5954 Miquel Raynal 2021-01-21  575  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  576  
dd3c52846d5954 Miquel Raynal 2021-01-21  577  		goto reenable_ibis;
dd3c52846d5954 Miquel Raynal 2021-01-21  578  	}
dd3c52846d5954 Miquel Raynal 2021-01-21  579  
dd3c52846d5954 Miquel Raynal 2021-01-21  580  	/* Handle the non critical tasks */
dd3c52846d5954 Miquel Raynal 2021-01-21  581  	switch (ibitype) {
dd3c52846d5954 Miquel Raynal 2021-01-21  582  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954 Miquel Raynal 2021-01-21  583  		if (dev) {
dd3c52846d5954 Miquel Raynal 2021-01-21  584  			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
dd3c52846d5954 Miquel Raynal 2021-01-21  585  			master->ibi.tbq_slot = NULL;
dd3c52846d5954 Miquel Raynal 2021-01-21  586  		}
dd3c52846d5954 Miquel Raynal 2021-01-21  587  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal 2021-01-21  588  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  589  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859a Frank Li      2023-12-01  590  		svc_i3c_master_emit_stop(master);
05b26c31a4859a Frank Li      2023-12-01  591  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954 Miquel Raynal 2021-01-21  592  			queue_work(master->base.wq, &master->hj_work);
dd3c52846d5954 Miquel Raynal 2021-01-21  593  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  594  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
0430bf9bc1ac06 Stanley Chu   2025-03-18  595  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal 2021-01-21 @596  	default:
dd3c52846d5954 Miquel Raynal 2021-01-21  597  		break;
dd3c52846d5954 Miquel Raynal 2021-01-21  598  	}
dd3c52846d5954 Miquel Raynal 2021-01-21  599  
dd3c52846d5954 Miquel Raynal 2021-01-21  600  reenable_ibis:
dd3c52846d5954 Miquel Raynal 2021-01-21  601  	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
dd3c52846d5954 Miquel Raynal 2021-01-21  602  }
dd3c52846d5954 Miquel Raynal 2021-01-21  603  

:::::: The code at line 596 was first introduced by commit
:::::: dd3c52846d5954acd43f0e771689302f27dadc28 i3c: master: svc: Add Silvaco I3C master driver

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
