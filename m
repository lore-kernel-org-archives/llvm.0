Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54A2C08CA;
	Sat, 22 Nov 2025 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763841269; cv=none; b=Vdd5BAhw7gdGKQScwxVWy9yxnWF230JRg0p0khv2OBQiMhTUT3VYbVpSOAmx6XihxECdH2cdl9DOUpOKLfFtzbCZuf/3ldjfhS27Z8x8RdHg/42XxyXjjOLSDRqa2JtgNrmuvl+yI6stPbxy6tkhizGfdvtbI6M4DWasM3YeQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763841269; c=relaxed/simple;
	bh=gdj1+AEtUYUM1rxjlUWFIsXGyxXUD0zKTWFRjlMWuFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMGc+SXO3VHnxpTnCAxhdXd/LZKpFuXcKFxSMHlOjzbLko58Pb0+QV0mq1JJb4iH03tUEMCxEn93t6v0c6N390Ee1iEvvQJThwC82XiiszyQpGMjtiZ7TPnTa+zs6YBRptM4IMcgMfpGtMVnw0FZ7Z7iQ/fhIKyfw2Iea+wdc1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTuhe4LW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTuhe4LW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763841266; x=1795377266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdj1+AEtUYUM1rxjlUWFIsXGyxXUD0zKTWFRjlMWuFY=;
  b=HTuhe4LWFJuor9KM0pRx302yr242mP5VorbWYVf4clQowaiTrQ9uoNTZ
   RAQBYDShWvKUVq9OSx1NDMC36VlOqz9Iw1k4p5167Qu4lE3OnZUxJmAbs
   +jCtUWexlDZ5kfb0AHHfxlXcljd5xCMe0wzS0aI1/FgZU/p6kbphiZ8Qs
   LA7mJKToqZgVI1fjacAlez9Nebc/PrMPUxzmA3q8FOj/cQ1El6NhAR/FS
   sg86v9RzOgpYUsZszOcj4yqtUHr7OhAM2VDknLe+0jRP/G/5kt0gCLzdz
   QLWZ3rq1+VTsIwz+bv+nd0z6PURSOYHPaXBQVz3FE4DptpoImnQtYImOS
   w==;
X-CSE-ConnectionGUID: wYPmDTpmQNGN285lCwPm0Q==
X-CSE-MsgGUID: BcW4c/xoSGa5K3gMJx2W4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65841005"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65841005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 11:54:22 -0800
X-CSE-ConnectionGUID: Qr9rNnViQzSXRnKsTOuQYQ==
X-CSE-MsgGUID: cCeq+s4AShKdoa5Z0BCsfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192751346"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 11:54:20 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMtgX-0007nf-2n;
	Sat, 22 Nov 2025 19:54:17 +0000
Date: Sun, 23 Nov 2025 03:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mmc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 13/13] mmc: dw_mmc: Remove struct dw_mci_slot
Message-ID: <202511230347.DmGrS3Dd-lkp@intel.com>
References: <1763634565-183891-14-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763634565-183891-14-git-send-email-shawn.lin@rock-chips.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251120]
[cannot apply to krzk/for-next rockchip/for-next linus/master ulf-hansson-mmc-mirror/next v6.18-rc6 v6.18-rc5 v6.18-rc4 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-dw_mmc-Remove-unused-struct-dma_pdata/20251120-205522
base:   next-20251120
patch link:    https://lore.kernel.org/r/1763634565-183891-14-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 13/13] mmc: dw_mmc: Remove struct dw_mci_slot
config: loongarch-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230347.DmGrS3Dd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230347.DmGrS3Dd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230347.DmGrS3Dd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/dw_mmc.c:140:1: warning: unused variable 'dw_mci_req_fops' [-Wunused-const-variable]
     140 | DEFINE_SHOW_ATTRIBUTE(dw_mci_req);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:213:37: note: expanded from macro 'DEFINE_SHOW_ATTRIBUTE'
     213 | static const struct file_operations __name ## _fops = {                 \
         |                                     ^~~~~~~~~~~~~~~
   <scratch space>:23:1: note: expanded from here
      23 | dw_mci_req_fops
         | ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/dw_mci_req_fops +140 drivers/mmc/host/dw_mmc.c

f95f3850f7a9e1 Will Newton 2011-01-02   99  
f95f3850f7a9e1 Will Newton 2011-01-02  100  #if defined(CONFIG_DEBUG_FS)
f95f3850f7a9e1 Will Newton 2011-01-02  101  static int dw_mci_req_show(struct seq_file *s, void *v)
f95f3850f7a9e1 Will Newton 2011-01-02  102  {
93ac9a7f4a2ac9 Shawn Lin   2025-11-20  103  	struct dw_mci *host = s->private;
f95f3850f7a9e1 Will Newton 2011-01-02  104  	struct mmc_request *mrq;
f95f3850f7a9e1 Will Newton 2011-01-02  105  	struct mmc_command *cmd;
f95f3850f7a9e1 Will Newton 2011-01-02  106  	struct mmc_command *stop;
f95f3850f7a9e1 Will Newton 2011-01-02  107  	struct mmc_data	*data;
f95f3850f7a9e1 Will Newton 2011-01-02  108  
f95f3850f7a9e1 Will Newton 2011-01-02  109  	/* Make sure we get a consistent snapshot */
93ac9a7f4a2ac9 Shawn Lin   2025-11-20  110  	spin_lock_bh(&host->lock);
93ac9a7f4a2ac9 Shawn Lin   2025-11-20  111  	mrq = host->mrq;
f95f3850f7a9e1 Will Newton 2011-01-02  112  
f95f3850f7a9e1 Will Newton 2011-01-02  113  	if (mrq) {
f95f3850f7a9e1 Will Newton 2011-01-02  114  		cmd = mrq->cmd;
f95f3850f7a9e1 Will Newton 2011-01-02  115  		data = mrq->data;
f95f3850f7a9e1 Will Newton 2011-01-02  116  		stop = mrq->stop;
f95f3850f7a9e1 Will Newton 2011-01-02  117  
f95f3850f7a9e1 Will Newton 2011-01-02  118  		if (cmd)
f95f3850f7a9e1 Will Newton 2011-01-02  119  			seq_printf(s,
f95f3850f7a9e1 Will Newton 2011-01-02  120  				   "CMD%u(0x%x) flg %x rsp %x %x %x %x err %d\n",
f95f3850f7a9e1 Will Newton 2011-01-02  121  				   cmd->opcode, cmd->arg, cmd->flags,
f95f3850f7a9e1 Will Newton 2011-01-02  122  				   cmd->resp[0], cmd->resp[1], cmd->resp[2],
f95f3850f7a9e1 Will Newton 2011-01-02  123  				   cmd->resp[2], cmd->error);
f95f3850f7a9e1 Will Newton 2011-01-02  124  		if (data)
f95f3850f7a9e1 Will Newton 2011-01-02  125  			seq_printf(s, "DATA %u / %u * %u flg %x err %d\n",
f95f3850f7a9e1 Will Newton 2011-01-02  126  				   data->bytes_xfered, data->blocks,
f95f3850f7a9e1 Will Newton 2011-01-02  127  				   data->blksz, data->flags, data->error);
f95f3850f7a9e1 Will Newton 2011-01-02  128  		if (stop)
f95f3850f7a9e1 Will Newton 2011-01-02  129  			seq_printf(s,
f95f3850f7a9e1 Will Newton 2011-01-02  130  				   "CMD%u(0x%x) flg %x rsp %x %x %x %x err %d\n",
f95f3850f7a9e1 Will Newton 2011-01-02  131  				   stop->opcode, stop->arg, stop->flags,
f95f3850f7a9e1 Will Newton 2011-01-02  132  				   stop->resp[0], stop->resp[1], stop->resp[2],
f95f3850f7a9e1 Will Newton 2011-01-02  133  				   stop->resp[2], stop->error);
f95f3850f7a9e1 Will Newton 2011-01-02  134  	}
f95f3850f7a9e1 Will Newton 2011-01-02  135  
93ac9a7f4a2ac9 Shawn Lin   2025-11-20  136  	spin_unlock_bh(&host->lock);
f95f3850f7a9e1 Will Newton 2011-01-02  137  
f95f3850f7a9e1 Will Newton 2011-01-02  138  	return 0;
f95f3850f7a9e1 Will Newton 2011-01-02  139  }
64c1412b77d08d Shawn Lin   2018-02-23 @140  DEFINE_SHOW_ATTRIBUTE(dw_mci_req);
f95f3850f7a9e1 Will Newton 2011-01-02  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
