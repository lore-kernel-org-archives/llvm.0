Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B02FB08C;
	Sun, 22 Mar 2026 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774167833; cv=none; b=ZnSE4Y557m+0fBjM82Fy75+9RwypRwqY/rdL3iHmwcPV5YmXI8LsZwgjdUROLjl713zOtD0/0sHHc5PTfKqsyAFOS6W9jMQFzB6bRdVrk4+sWvO7hnx/MDMaC2hvj7nxDPPogKAUPSwJQZUFCMR4+dxciMi4MRPAUsuMnAyExQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774167833; c=relaxed/simple;
	bh=9DOpGrJm+K+zB2s9EIsR8fYcXFLv3lAjQcOZj0xZk8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMXwC7CV2grTQWIGG06dY1LTTcqfM5qpjVi/RrwJIlS3F3ZmNeZ5/3NCryHwvr8GubHMv7VdLYVI+sOSMs0faYhrSTF8ykjy9yyBwN2RiHzSH8jWvJ/luDBzmXYjuTg5t/26zq+Ul5oG7TrE0GljWJh7CzAjaghsZ0nDrGguRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM28cxV/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM28cxV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774167832; x=1805703832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9DOpGrJm+K+zB2s9EIsR8fYcXFLv3lAjQcOZj0xZk8Y=;
  b=jM28cxV/cCFrHdHt/dmfFuhfSZgR4OJsW/yMXDY4KfxZifFsTWOzkGGt
   SjLpWQzBcflaKAo1s1Gep2I8DPUinnggnzEhrqjwt3IT0DzzmPg/uxf+N
   APnYXFslFINT5ByRTvlzNAapqpNwHHWK3Yo75bTsP8xXKpSuvdg98TK+s
   qLOHOsE1dNvU1MXP1t8XUVadA6bYyz8OQbyWivBuOqIFt7KwA3i+ZArdi
   X9f5LFnGP+nXUh4c4VwNwcPfojzJs6Hm8ybUOKpz6jRdE5zNOOWuG6rcn
   tQoxggOV6DkY6sfG9ouZeVrnc4GtAFb+vg4R2xgl6GTBBJ5Iic/IgSnCp
   A==;
X-CSE-ConnectionGUID: Sn4Fe4CbRkKczqU60W36xQ==
X-CSE-MsgGUID: CJgitElSTkanlMnIq5x0jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="92772113"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="92772113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 01:23:51 -0700
X-CSE-ConnectionGUID: zb7nS8y0QxS/CAq76tWiTQ==
X-CSE-MsgGUID: OdolOGsYQtuGb2Mtcz1Ang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="246752550"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2026 01:23:47 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4E5q-000000001rT-3Ut1;
	Sun, 22 Mar 2026 08:23:34 +0000
Date: Sun, 22 Mar 2026 16:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>,
	"kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
Message-ID: <202603221611.fblmNLio-lkp@intel.com>
References: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>

Hi 전민식,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nvme-Move-nvme_setup_cmd-before-hot_pathing/20260322-080947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6%40epcms2p4
patch subject: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
config: i386-randconfig-003-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221611.fblmNLio-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221611.fblmNLio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221611.fblmNLio-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/rdma.c:2067:1: warning: unused label 'unmap_qe' [-Wunused-label]
    2067 | unmap_qe:
         | ^~~~~~~~~
   1 warning generated.


vim +/unmap_qe +2067 drivers/nvme/host/rdma.c

711023071960285 Christoph Hellwig 2016-07-06  1991  
fc17b6534eb8395 Christoph Hellwig 2017-06-03  1992  static blk_status_t nvme_rdma_queue_rq(struct blk_mq_hw_ctx *hctx,
711023071960285 Christoph Hellwig 2016-07-06  1993  		const struct blk_mq_queue_data *bd)
711023071960285 Christoph Hellwig 2016-07-06  1994  {
711023071960285 Christoph Hellwig 2016-07-06  1995  	struct nvme_ns *ns = hctx->queue->queuedata;
711023071960285 Christoph Hellwig 2016-07-06  1996  	struct nvme_rdma_queue *queue = hctx->driver_data;
711023071960285 Christoph Hellwig 2016-07-06  1997  	struct request *rq = bd->rq;
711023071960285 Christoph Hellwig 2016-07-06  1998  	struct nvme_rdma_request *req = blk_mq_rq_to_pdu(rq);
711023071960285 Christoph Hellwig 2016-07-06  1999  	struct nvme_rdma_qe *sqe = &req->sqe;
f4b9e6c90c57251 Keith Busch       2021-03-17  2000  	struct nvme_command *c = nvme_req(rq)->cmd;
711023071960285 Christoph Hellwig 2016-07-06  2001  	struct ib_device *dev;
3bc32bb1186ccaf Christoph Hellwig 2018-06-11  2002  	bool queue_ready = test_bit(NVME_RDMA_Q_LIVE, &queue->flags);
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2003  	blk_status_t ret;
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2004  	int err;
711023071960285 Christoph Hellwig 2016-07-06  2005  
711023071960285 Christoph Hellwig 2016-07-06  2006  	WARN_ON_ONCE(rq->tag < 0);
711023071960285 Christoph Hellwig 2016-07-06  2007  
ae1c609d185960c 전민식            2026-03-20  2008  	ret = nvme_setup_cmd(ns, rq);
ae1c609d185960c 전민식            2026-03-20  2009  	if (ret)
ae1c609d185960c 전민식            2026-03-20  2010  		return ret;
ae1c609d185960c 전민식            2026-03-20  2011  
a97157440e1e69c Andy Chiu         2021-04-26  2012  	if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
a97157440e1e69c Andy Chiu         2021-04-26  2013  		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
553cd9ef82edd81 Christoph Hellwig 2016-11-02  2014  
711023071960285 Christoph Hellwig 2016-07-06  2015  	dev = queue->device->dev;
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2016  
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2017  	req->sqe.dma = ib_dma_map_single(dev, req->sqe.data,
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2018  					 sizeof(struct nvme_command),
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2019  					 DMA_TO_DEVICE);
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2020  	err = ib_dma_mapping_error(dev, req->sqe.dma);
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2021  	if (unlikely(err))
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2022  		return BLK_STS_RESOURCE;
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2023  
711023071960285 Christoph Hellwig 2016-07-06  2024  	ib_dma_sync_single_for_cpu(dev, sqe->dma,
711023071960285 Christoph Hellwig 2016-07-06  2025  			sizeof(struct nvme_command), DMA_TO_DEVICE);
711023071960285 Christoph Hellwig 2016-07-06  2026  
6887fc6495f2dfd Sagi Grimberg     2022-10-03  2027  	nvme_start_request(rq);
711023071960285 Christoph Hellwig 2016-07-06  2028  
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2029  	if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2030  	    queue->pi_support &&
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2031  	    (c->common.opcode == nvme_cmd_write ||
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2032  	     c->common.opcode == nvme_cmd_read) &&
0372dd4e3617170 Daniel Wagner     2023-12-18  2033  	    nvme_ns_has_pi(ns->head))
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2034  		req->use_sig_mr = true;
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2035  	else
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2036  		req->use_sig_mr = false;
5ec5d3bddc6b912 Max Gurtovoy      2020-05-19  2037  
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2038  	err = nvme_rdma_map_data(queue, rq, c);
a7b7c7a105a528e Max Gurtovoy      2017-08-14  2039  	if (unlikely(err < 0)) {
711023071960285 Christoph Hellwig 2016-07-06  2040  		dev_err(queue->ctrl->ctrl.device,
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2041  			     "Failed to map data (%d)\n", err);
711023071960285 Christoph Hellwig 2016-07-06  2042  		goto err;
711023071960285 Christoph Hellwig 2016-07-06  2043  	}
711023071960285 Christoph Hellwig 2016-07-06  2044  
b4b591c87f2b0f4 Sagi Grimberg     2017-11-23  2045  	sqe->cqe.done = nvme_rdma_send_done;
b4b591c87f2b0f4 Sagi Grimberg     2017-11-23  2046  
711023071960285 Christoph Hellwig 2016-07-06  2047  	ib_dma_sync_single_for_device(dev, sqe->dma,
711023071960285 Christoph Hellwig 2016-07-06  2048  			sizeof(struct nvme_command), DMA_TO_DEVICE);
711023071960285 Christoph Hellwig 2016-07-06  2049  
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2050  	err = nvme_rdma_post_send(queue, sqe, req->sge, req->num_sge,
f41725bbe16b077 Israel Rukshin    2017-11-26  2051  			req->mr ? &req->reg_wr.wr : NULL);
16686f3a6c3cd63 Max Gurtovoy      2019-10-13  2052  	if (unlikely(err))
16686f3a6c3cd63 Max Gurtovoy      2019-10-13  2053  		goto err_unmap;
711023071960285 Christoph Hellwig 2016-07-06  2054  
fc17b6534eb8395 Christoph Hellwig 2017-06-03  2055  	return BLK_STS_OK;
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2056  
16686f3a6c3cd63 Max Gurtovoy      2019-10-13  2057  err_unmap:
16686f3a6c3cd63 Max Gurtovoy      2019-10-13  2058  	nvme_rdma_unmap_data(queue, rq);
711023071960285 Christoph Hellwig 2016-07-06  2059  err:
62eca39722fd997 Chao Leng         2021-02-01  2060  	if (err == -EIO)
62eca39722fd997 Chao Leng         2021-02-01  2061  		ret = nvme_host_path_error(rq);
62eca39722fd997 Chao Leng         2021-02-01  2062  	else if (err == -ENOMEM || err == -EAGAIN)
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2063  		ret = BLK_STS_RESOURCE;
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2064  	else
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2065  		ret = BLK_STS_IOERR;
16686f3a6c3cd63 Max Gurtovoy      2019-10-13  2066  	nvme_cleanup_cmd(rq);
62f99b62e5e3b88 Max Gurtovoy      2019-06-06 @2067  unmap_qe:
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2068  	ib_dma_unmap_single(dev, req->sqe.dma, sizeof(struct nvme_command),
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2069  			    DMA_TO_DEVICE);
62f99b62e5e3b88 Max Gurtovoy      2019-06-06  2070  	return ret;
711023071960285 Christoph Hellwig 2016-07-06  2071  }
711023071960285 Christoph Hellwig 2016-07-06  2072  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
