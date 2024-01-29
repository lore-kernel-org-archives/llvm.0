Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC0EEDA;
	Mon, 29 Jan 2024 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706495821; cv=none; b=JcSvCVUCBbjo0ruQ2u0xASX8viRxv+ePPea3BCpFyX3WwUprsXRFc4c6nRdsL7PuAmsoukMFSw3jC8w+xYOVc3xpV+Db2qcRz2jm0Ov3h/4bmogDyNP8AZEhxi3byzy/tzocf0LCQmMvuI63viUQPjJLZW6eBgd3UtPVIpgL/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706495821; c=relaxed/simple;
	bh=eFbBgGKDmaefXjiMaXWTv6JMoNwOf1yJnVa1YJvn8pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MqC7ZBnoyMbye2j7Qe6JpeTKyLACLgLTh7Gm6PJj6hgpFUyJ14nGimtSROqwprTuEjc7RQkTERaIu1jSJHZGxY2z34wfW+U5bojRhOVu1eQCbk+9RpCIJuPMiJEEVZ7UH5RXWAEQBYzcF+0xT82Tu9r8PTKvor812CqlzMnlfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5jh11Jq; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5jh11Jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706495818; x=1738031818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFbBgGKDmaefXjiMaXWTv6JMoNwOf1yJnVa1YJvn8pI=;
  b=j5jh11Jq0PnIQCeJFqn7Te/WWfXYw39Fsev6APDL92DH1qGRN5qTHeXI
   E+qqkj7EBUYfjJQIt58Sr0+3MYSBsIZDmXbezSEVY5eJZZ+OHR1+8gJQp
   /myroPmf7hlxoxWY5gAcGi3xf2m5d2wqgIGZRWM+mPRW/e8c/dgp7yRHl
   yrEmsnpJmfoNUTyySQYl57DPinVi19hCNnUQUf9bpVQk2e5dcPw+BqEBS
   MR/b+GRKkiInVMmUvPyGxmwtktzynS9DZLnXZqferh71nsIC9OWge5x+Y
   HuhzlqbwfbZy0r44BvMzvg03OpCjVS3EW8Uhjx+a9fSRbSWQylS+NVwFk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401698440"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="401698440"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 18:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118794116"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="1118794116"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 18:36:56 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUHW2-0003yW-0U;
	Mon, 29 Jan 2024 02:36:54 +0000
Date: Mon, 29 Jan 2024 10:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jmondi:jmondi/media-stage/pispbe 3/4]
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:275:27: warning: shift
 count >= width of type
Message-ID: <202401291016.iFQ01xG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git jmondi/media-stage/pispbe
head:   1e94449ecd7f9aa59eae24b5b76cd3c461d8b613
commit: e4109de6a8b9abac9f0a87c1cf6d8b1683ec00f7 [3/4] fixup! media: raspberrypi: Add support for PiSP BE
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240129/202401291016.iFQ01xG8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291016.iFQ01xG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291016.iFQ01xG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:20:
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:236:18: error: use of undeclared identifier 'V4L2_PIX_FMT_RGB48'
     236 |                 .fourcc             = V4L2_PIX_FMT_RGB48,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:245:18: error: use of undeclared identifier 'V4L2_PIX_FMT_BGR48'
     245 |                 .fourcc             = V4L2_PIX_FMT_BGR48,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:441:18: error: use of undeclared identifier 'V4L2_PIX_FMT_PISP_COMP1_BGGR'
     441 |                 .fourcc             = V4L2_PIX_FMT_PISP_COMP1_BGGR,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:450:18: error: use of undeclared identifier 'V4L2_PIX_FMT_PISP_COMP1_RGGB'
     450 |                 .fourcc             = V4L2_PIX_FMT_PISP_COMP1_RGGB,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:459:18: error: use of undeclared identifier 'V4L2_PIX_FMT_PISP_COMP1_GRBG'
     459 |                 .fourcc             = V4L2_PIX_FMT_PISP_COMP1_GRBG,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:468:18: error: use of undeclared identifier 'V4L2_PIX_FMT_PISP_COMP1_GBRG'
     468 |                 .fourcc             = V4L2_PIX_FMT_PISP_COMP1_GBRG,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:495:14: error: use of undeclared identifier 'V4L2_PIX_FMT_PISP_COMP1_MONO'
     495 |                 .fourcc         = V4L2_PIX_FMT_PISP_COMP1_MONO,
         |                                   ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:505:18: error: use of undeclared identifier 'V4L2_PIX_FMT_RPI_BE'
     505 |                 .fourcc             = V4L2_PIX_FMT_RPI_BE,
         |                                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h:513:18: error: use of undeclared identifier 'V4L2_META_FMT_RPI_BE_CFG'
     513 |                 .fourcc             = V4L2_META_FMT_RPI_BE_CFG,
         |                                       ^
>> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:275:27: warning: shift count >= width of type [-Wshift-count-overflow]
     275 |                           job->hw_dma_addrs[u] >> 32);
         |                                                ^  ~~
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:309:63: warning: shift count >= width of type [-Wshift-count-overflow]
     309 |         pispbe_wr(pispbe, PISP_BE_TILE_ADDR_HI_REG, (u32)(job->tiles >> 32));
         |                                                                      ^  ~~
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1111:31: error: invalid application of 'sizeof' to an incomplete type 'const struct pisp_be_format[]'
    1111 |         for (unsigned int i = 0; i < ARRAY_SIZE(supported_formats); i++) {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1161:16: error: use of undeclared identifier 'V4L2_PIX_FMT_RPI_BE'
    1161 |         if (pixfmt == V4L2_PIX_FMT_RPI_BE)
         |                       ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1270:27: error: use of undeclared identifier 'V4L2_META_FMT_RPI_BE_CFG'
    1270 |         f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
         |                                  ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1289:27: error: use of undeclared identifier 'V4L2_PIX_FMT_RPI_BE'
    1289 |         f->fmt.meta.dataformat = V4L2_PIX_FMT_RPI_BE;
         |                                  ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1385:21: error: use of undeclared identifier 'V4L2_META_FMT_RPI_BE_CFG'
    1385 |                         f->pixelformat = V4L2_META_FMT_RPI_BE_CFG;
         |                                          ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1387:21: error: use of undeclared identifier 'V4L2_PIX_FMT_RPI_BE'
    1387 |                         f->pixelformat = V4L2_PIX_FMT_RPI_BE;
         |                                          ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1392:18: error: invalid application of 'sizeof' to an incomplete type 'const struct pisp_be_format[]'
    1392 |         if (f->index >= ARRAY_SIZE(supported_formats))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1499:28: error: use of undeclared identifier 'V4L2_META_FMT_RPI_BE_CFG'
    1499 |                 f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
         |                                          ^
   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1506:28: error: use of undeclared identifier 'V4L2_PIX_FMT_RPI_BE'
    1506 |                 f->fmt.meta.dataformat = V4L2_PIX_FMT_RPI_BE;
         |                                          ^
   2 warnings and 18 errors generated.


vim +275 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c

dff3569dbc4dad Jacopo Mondi 2024-01-25  251  
dff3569dbc4dad Jacopo Mondi 2024-01-25  252  /*
dff3569dbc4dad Jacopo Mondi 2024-01-25  253   * Queue a job to the h/w. If the h/w is idle it will begin immediately.
dff3569dbc4dad Jacopo Mondi 2024-01-25  254   * Caller must ensure it is "safe to queue", i.e. we don't already have a
dff3569dbc4dad Jacopo Mondi 2024-01-25  255   * queued, unstarted job.
dff3569dbc4dad Jacopo Mondi 2024-01-25  256   */
dff3569dbc4dad Jacopo Mondi 2024-01-25  257  static void pispbe_queue_job(struct pispbe_dev *pispbe,
dff3569dbc4dad Jacopo Mondi 2024-01-25  258  			     struct pispbe_job_descriptor *job)
dff3569dbc4dad Jacopo Mondi 2024-01-25  259  {
dff3569dbc4dad Jacopo Mondi 2024-01-25  260  	unsigned int begin, end;
dff3569dbc4dad Jacopo Mondi 2024-01-25  261  
dff3569dbc4dad Jacopo Mondi 2024-01-25  262  	if (pispbe_rd(pispbe, PISP_BE_STATUS_REG) & PISP_BE_STATUS_QUEUED)
dff3569dbc4dad Jacopo Mondi 2024-01-25  263  		dev_err(pispbe->dev, "ERROR: not safe to queue new job!\n");
dff3569dbc4dad Jacopo Mondi 2024-01-25  264  
dff3569dbc4dad Jacopo Mondi 2024-01-25  265  	/*
dff3569dbc4dad Jacopo Mondi 2024-01-25  266  	 * Write configuration to hardware. DMA addresses and enable flags
dff3569dbc4dad Jacopo Mondi 2024-01-25  267  	 * are passed separately, because the driver needs to sanitize them,
dff3569dbc4dad Jacopo Mondi 2024-01-25  268  	 * and we don't want to modify (or be vulnerable to modifications of)
dff3569dbc4dad Jacopo Mondi 2024-01-25  269  	 * the mmap'd buffer.
dff3569dbc4dad Jacopo Mondi 2024-01-25  270  	 */
dff3569dbc4dad Jacopo Mondi 2024-01-25  271  	for (unsigned int u = 0; u < N_HW_ADDRESSES; ++u) {
dff3569dbc4dad Jacopo Mondi 2024-01-25  272  		pispbe_wr(pispbe, PISP_BE_IO_INPUT_ADDR0(u),
dff3569dbc4dad Jacopo Mondi 2024-01-25  273  			  job->hw_dma_addrs[u]);
dff3569dbc4dad Jacopo Mondi 2024-01-25  274  		pispbe_wr(pispbe, PISP_BE_IO_INPUT_ADDR0(u) + 4,
dff3569dbc4dad Jacopo Mondi 2024-01-25 @275  			  job->hw_dma_addrs[u] >> 32);
dff3569dbc4dad Jacopo Mondi 2024-01-25  276  	}
dff3569dbc4dad Jacopo Mondi 2024-01-25  277  	pispbe_wr(pispbe, PISP_BE_GLOBAL_BAYER_ENABLE, job->hw_enables[0]);
dff3569dbc4dad Jacopo Mondi 2024-01-25  278  	pispbe_wr(pispbe, PISP_BE_GLOBAL_RGB_ENABLE, job->hw_enables[1]);
dff3569dbc4dad Jacopo Mondi 2024-01-25  279  
dff3569dbc4dad Jacopo Mondi 2024-01-25  280  	/*
dff3569dbc4dad Jacopo Mondi 2024-01-25  281  	 * Everything else is as supplied by the user. Buffer sizes not
dff3569dbc4dad Jacopo Mondi 2024-01-25  282  	 * checked!
dff3569dbc4dad Jacopo Mondi 2024-01-25  283  	 */
dff3569dbc4dad Jacopo Mondi 2024-01-25  284  	begin =	offsetof(struct pisp_be_config, global.bayer_order)
dff3569dbc4dad Jacopo Mondi 2024-01-25  285  	      / sizeof(u32);
dff3569dbc4dad Jacopo Mondi 2024-01-25  286  	end = offsetof(struct pisp_be_config, axi) / sizeof(u32);
dff3569dbc4dad Jacopo Mondi 2024-01-25  287  	for (unsigned int u = begin; u < end; u++)
dff3569dbc4dad Jacopo Mondi 2024-01-25  288  		pispbe_wr(pispbe, PISP_BE_CONFIG_BASE_REG + 4 * u,
dff3569dbc4dad Jacopo Mondi 2024-01-25  289  			  ((u32 *)job->config)[u]);
dff3569dbc4dad Jacopo Mondi 2024-01-25  290  
dff3569dbc4dad Jacopo Mondi 2024-01-25  291  	/* Read back the addresses -- an error here could be fatal */
dff3569dbc4dad Jacopo Mondi 2024-01-25  292  	for (unsigned int u = 0; u < N_HW_ADDRESSES; ++u) {
dff3569dbc4dad Jacopo Mondi 2024-01-25  293  		unsigned int offset = PISP_BE_IO_INPUT_ADDR0(u);
dff3569dbc4dad Jacopo Mondi 2024-01-25  294  		u64 along = pispbe_rd(pispbe, offset);
dff3569dbc4dad Jacopo Mondi 2024-01-25  295  
dff3569dbc4dad Jacopo Mondi 2024-01-25  296  		along += ((u64)pispbe_rd(pispbe, offset + 4)) << 32;
dff3569dbc4dad Jacopo Mondi 2024-01-25  297  		if (along != (u64)(job->hw_dma_addrs[u])) {
dff3569dbc4dad Jacopo Mondi 2024-01-25  298  			dev_err(pispbe->dev,
dff3569dbc4dad Jacopo Mondi 2024-01-25  299  				"ISP BE config error: check if ISP RAMs enabled?\n");
dff3569dbc4dad Jacopo Mondi 2024-01-25  300  			return;
dff3569dbc4dad Jacopo Mondi 2024-01-25  301  		}
dff3569dbc4dad Jacopo Mondi 2024-01-25  302  	}
dff3569dbc4dad Jacopo Mondi 2024-01-25  303  
dff3569dbc4dad Jacopo Mondi 2024-01-25  304  	/*
dff3569dbc4dad Jacopo Mondi 2024-01-25  305  	 * Write tile pointer to hardware. Tile offsets and sizes not checked
dff3569dbc4dad Jacopo Mondi 2024-01-25  306  	 * (and even if checked, the user could subsequently modify them)!
dff3569dbc4dad Jacopo Mondi 2024-01-25  307  	 */
dff3569dbc4dad Jacopo Mondi 2024-01-25  308  	pispbe_wr(pispbe, PISP_BE_TILE_ADDR_LO_REG, (u32)job->tiles);
dff3569dbc4dad Jacopo Mondi 2024-01-25  309  	pispbe_wr(pispbe, PISP_BE_TILE_ADDR_HI_REG, (u32)(job->tiles >> 32));
dff3569dbc4dad Jacopo Mondi 2024-01-25  310  
dff3569dbc4dad Jacopo Mondi 2024-01-25  311  	/* Enqueue the job */
dff3569dbc4dad Jacopo Mondi 2024-01-25  312  	pispbe_wr(pispbe, PISP_BE_CONTROL_REG,
dff3569dbc4dad Jacopo Mondi 2024-01-25  313  		  PISP_BE_CONTROL_COPY_CONFIG | PISP_BE_CONTROL_QUEUE_JOB |
dff3569dbc4dad Jacopo Mondi 2024-01-25  314  		  PISP_BE_CONTROL_NUM_TILES(job->config->num_tiles));
dff3569dbc4dad Jacopo Mondi 2024-01-25  315  }
dff3569dbc4dad Jacopo Mondi 2024-01-25  316  

:::::: The code at line 275 was first introduced by commit
:::::: dff3569dbc4dadee5907b7d0a5a98089aaeb32ca media: raspberrypi: Add support for PiSP BE

:::::: TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
:::::: CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
