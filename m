Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC4367B93;
	Fri, 29 May 2026 04:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029643; cv=none; b=pTMTAn6K37XDgGL4cqOlFd3aTWXSvV2njl8eCzwpKXcy6EKf44N+MBaHQPjkqRcckir8TQW3mhqjI0d33/gK6fBzsFN7k7SlOFCxioTYok8kwCsNX3MIFkIy8Wp+zevE03GeRTPk7RQd40IRT7ZnK9bx4TOAwaJRPOy9oa6us/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029643; c=relaxed/simple;
	bh=Foeg4dSi3z9TYbKdiFS1ryI9uUYSgtrI0i/55qmstXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qw7DU+T+P7kQD7v0RVN6H6BV/3vmhxYeoEH5rHnFTqWVDM76vxdQDsHyjN81o/Gt4Z5XuyqFA/0btsJ+LtPbl5TFoJly1m2yByVmmrJ/FFafrt+d1gsuclCamEFmgU3N3Kwe0/ZheG8/0OJ16yl49NGYP+qyUySPrwxoCGMDT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPvpLjBr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPvpLjBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780029642; x=1811565642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Foeg4dSi3z9TYbKdiFS1ryI9uUYSgtrI0i/55qmstXo=;
  b=XPvpLjBrJLEcNbeN4xi00C1ptzhMmJor+C+hEXETRUvRHZbafnuSRV//
   7gO5BQcRBUWPCBRTzndpXrRR4LeO99F2PZEhGkDKHMVihCePts/j7kYJK
   FvQmyIePnuu9KA1ift8qyJ8HQESZlmgAKlPMCr/9UiFExxyvb9yPbwKH8
   R/1Zq4dJcgfHLIjCestkH03R55wR2J+I5hOh5w+8YrIfU6obeFTmErKX4
   wVWJAUeAfGyVPVagDT44ZXiQkKyiUs49TSRHY2FxRdiYiqguD9J6L2XMc
   H0jeLusI90pLnNbgpizrUcF0RHMaAoge607GFZuxux4aNMcnVtHBOKsEV
   w==;
X-CSE-ConnectionGUID: /wYYr2zzR7ScPm3DL+2x+g==
X-CSE-MsgGUID: 8vfkgp+YS5yMxODB9tK+rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91188302"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="91188302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 21:40:42 -0700
X-CSE-ConnectionGUID: NTkOfrkFRdmEGNZjed71zA==
X-CSE-MsgGUID: fxBDTmiGRw6IibNZeF5UTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="241922473"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2026 21:40:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSp1R-000000006ls-1ELz;
	Fri, 29 May 2026 04:40:37 +0000
Date: Fri, 29 May 2026 12:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	imx@lists.linux.dev, frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: serialize command receiver
 registration
Message-ID: <202605291206.NC4J51NQ-lkp@intel.com>
References: <20260528091634.3331090-1-pankaj.gupta@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528091634.3331090-1-pankaj.gupta@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260527]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/firmware-imx-se_ctrl-serialize-command-receiver-registration/20260528-172942
base:   next-20260527
patch link:    https://lore.kernel.org/r/20260528091634.3331090-1-pankaj.gupta%40nxp.com
patch subject: [PATCH -next] firmware: imx: se_ctrl: serialize command receiver registration
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260529/202605291206.NC4J51NQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291206.NC4J51NQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291206.NC4J51NQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/imx/se_ctrl.c:673:16: warning: result of comparison of constant 18446744073709551608 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     673 |         if (io.length > SIZE_MAX - 7) {
         |             ~~~~~~~~~ ^ ~~~~~~~~~~~~
>> drivers/firmware/imx/se_ctrl.c:934:4: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     934 |                         }
         |                         ^
   2 warnings generated.


vim +934 drivers/firmware/imx/se_ctrl.c

3ae9dcce8400f0 Pankaj Gupta 2026-01-22  905  
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  906  /* IOCTL entry point of a character device */
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  907  static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  908  {
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  909  	struct se_if_device_ctx *dev_ctx = fp->private_data;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  910  	struct se_if_priv *priv = dev_ctx->priv;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  911  	void __user *uarg = (void __user *)arg;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  912  	long err;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  913  
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  914  	/* Prevent race during change of device context */
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  915  	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  916  		switch (cmd) {
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  917  		case SE_IOCTL_ENABLE_CMD_RCV:
8aff20bcff5290 Pankaj Gupta 2026-05-28  918  			scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
8aff20bcff5290 Pankaj Gupta 2026-05-28  919  				if (priv->cmd_receiver_clbk_hdl.dev_ctx) {
8aff20bcff5290 Pankaj Gupta 2026-05-28  920  					err = -EBUSY;
8aff20bcff5290 Pankaj Gupta 2026-05-28  921  					goto out_enable_cmd_rcv;
8aff20bcff5290 Pankaj Gupta 2026-05-28  922  				}
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  923  				priv->cmd_receiver_clbk_hdl.rx_msg =
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  924  								kzalloc(MAX_NVM_MSG_LEN,
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  925  									GFP_KERNEL);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  926  				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  927  					err = -ENOMEM;
8aff20bcff5290 Pankaj Gupta 2026-05-28  928  					goto out_enable_cmd_rcv;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  929  				}
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  930  				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  931  				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  932  				err = 0;
8aff20bcff5290 Pankaj Gupta 2026-05-28  933  out_enable_cmd_rcv:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22 @934  			}
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  935  			break;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  936  		case SE_IOCTL_GET_MU_INFO:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  937  			err = se_ioctl_get_mu_info(dev_ctx, uarg);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  938  			break;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  939  		case SE_IOCTL_SETUP_IOBUF:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  940  			err = se_ioctl_setup_iobuf_handler(dev_ctx, uarg);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  941  			break;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  942  		case SE_IOCTL_GET_SOC_INFO:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  943  			err = se_ioctl_get_se_soc_info_handler(dev_ctx, uarg);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  944  			break;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  945  		case SE_IOCTL_CMD_SEND_RCV_RSP:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  946  			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, uarg);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  947  			break;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  948  		default:
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  949  			err = -EINVAL;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  950  			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  951  				dev_ctx->devname, cmd);
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  952  		}
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  953  	}
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  954  
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  955  	return err;
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  956  }
3ae9dcce8400f0 Pankaj Gupta 2026-01-22  957  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
