Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E226312832;
	Wed,  1 Jul 2026 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946581; cv=none; b=KGsiwYPoYw2D1mpZtPH8EXEdxGLKdz8+PenWdCIH1a4q98Htjt/AFO9XQIyESIS0gJGmj2R7ggVzIxyrRkPAWcP5TA3A2YJCLdUPc0ftOLHeif/4WEEN8BlC9vIEaUgoT3g2xFL3Z01drUVOsEMkyoubaSoSqv+UREab9MYIj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946581; c=relaxed/simple;
	bh=FSOP4zm4cit4g8DmSosxGX2AMoQVEEHnukJPngJ4e/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNGLGdGMtjjxtG05gpGxmv3/BhqgQED9aNlDAyU7nr29vDgyoxK07R4YcNzu2rPLmgjKul/6KOaL265xqa7neAmdTjDND2DzIXOfqfpAcQ30o/X4GWuWD6111ZDBFUNUKcwZbxRd5z7KdS5sKJYNCTjiuw8KyS/axJ/aOuDaDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpcKECuA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpcKECuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782946579; x=1814482579;
  h=date:from:to:cc:subject:message-id;
  bh=FSOP4zm4cit4g8DmSosxGX2AMoQVEEHnukJPngJ4e/Q=;
  b=bpcKECuAlA1ODc6sIhkUV3HMpm7IpXEkIZCK0iLp0KT8Wf/Kp37n5Yg6
   +XPoefrYLapZ0pLw7vs4ly6oySFTtqPkiL/CzYK7XmFFN8aycdNn0gDMA
   hfXrHFvyqJGC1cRVY3Qb4G7Up24O8BgN9ynvNKS269rBuH36YLHptidBn
   06gt76jXCUybRJ+le8hXWdlMTI/mo5AfSahJ9wFxWcBqg5rqmtOScRYXg
   5F1pM7r2uAAlGw/oCjnJl9Lv3U6a39b79Q+5RUNy4RSH+lZSQ2rzaYqXO
   HYiQMr6kwBDFzN26nIgYkSnR6l0SRXiJQtUl297h/n2gG3PnDQ/0xvmqU
   g==;
X-CSE-ConnectionGUID: 7f96YYB3TkCQsHHnqa3SRw==
X-CSE-MsgGUID: Mf2N8E7+QhOos+FrbfZn2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87522905"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87522905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:56:19 -0700
X-CSE-ConnectionGUID: zdm3OqZpRgmKq7+gvnIRHQ==
X-CSE-MsgGUID: 30G14wY1R+ufIchBoJD+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="277003916"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 15:56:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf3qo-000000009hH-1dZG;
	Wed, 01 Jul 2026 22:56:14 +0000
Date: Thu, 02 Jul 2026 06:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 9/23]
 drivers/firmware/arm_scmi/transports/mailbox.c:252:1: warning: unused label
 'err_free_chan_receiver'
Message-ID: <202607020643.aeL4FIjK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   bdcaa5728f17002c1091efd93dd082c9c23ddd39
commit: 1bfaf4c65e542a88331bfd51d59d27b827a2282d [9/23] firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
config: i386-buildonly-randconfig-005-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020643.aeL4FIjK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020643.aeL4FIjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020643.aeL4FIjK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/transports/mailbox.c:252:1: warning: unused label 'err_free_chan_receiver' [-Wunused-label]
     252 | err_free_chan_receiver:
         | ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_free_chan_receiver +252 drivers/firmware/arm_scmi/transports/mailbox.c

   181	
   182	static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
   183				      bool tx)
   184	{
   185		const char *desc = tx ? "Tx" : "Rx";
   186		struct device *cdev = cinfo->dev;
   187		struct scmi_mailbox *smbox;
   188		int ret, a2p_rx_chan, p2a_chan, p2a_rx_chan;
   189		struct mbox_client *cl;
   190	
   191		ret = mailbox_chan_validate(cdev, &a2p_rx_chan, &p2a_chan, &p2a_rx_chan);
   192		if (ret)
   193			return ret;
   194	
   195		if (!tx && !p2a_chan)
   196			return -ENODEV;
   197	
   198		smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
   199		if (!smbox)
   200			return -ENOMEM;
   201	
   202		smbox->shmem = core->shmem->setup_iomap(cinfo, dev, tx, NULL,
   203							&smbox->io_ops);
   204		if (IS_ERR(smbox->shmem))
   205			return PTR_ERR(smbox->shmem);
   206	
   207		cl = &smbox->cl;
   208		cl->dev = cdev;
   209		cl->tx_prepare = tx ? tx_prepare : NULL;
   210		cl->rx_callback = rx_callback;
   211		cl->tx_block = false;
   212		cl->knows_txdone = tx;
   213	
   214		smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
   215		if (IS_ERR(smbox->chan)) {
   216			ret = PTR_ERR(smbox->chan);
   217			if (ret != -EPROBE_DEFER)
   218				dev_err(cdev,
   219					"failed to request SCMI %s mailbox\n", desc);
   220			return ret;
   221		}
   222	
   223		/* Additional unidirectional channel for TX if needed */
   224		if (tx && a2p_rx_chan) {
   225			smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
   226			if (IS_ERR(smbox->chan_receiver)) {
   227				ret = PTR_ERR(smbox->chan_receiver);
   228				smbox->chan_receiver = NULL;
   229				if (ret != -EPROBE_DEFER)
   230					dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
   231				goto err_free_chan;
   232			}
   233		}
   234	
   235		if (!tx && p2a_rx_chan) {
   236			smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
   237			if (IS_ERR(smbox->chan_platform_receiver)) {
   238				ret = PTR_ERR(smbox->chan_platform_receiver);
   239				smbox->chan_platform_receiver = NULL;
   240				if (ret != -EPROBE_DEFER)
   241					dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
   242				goto err_free_chan;
   243			}
   244		}
   245	
   246		cinfo->transport_info = smbox;
   247		smbox->cinfo = cinfo;
   248		mutex_init(&smbox->chan_lock);
   249	
   250		return 0;
   251	
 > 252	err_free_chan_receiver:
   253		mbox_free_channel(smbox->chan_receiver);
   254	err_free_chan:
   255		mbox_free_channel(smbox->chan);
   256		return ret;
   257	}
   258	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
