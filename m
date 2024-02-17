Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296311E4A8;
	Sat, 17 Feb 2024 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708198563; cv=none; b=FkfbljXtBqSVUdNVBh2aAy+WYti4wq0YReMS+Sjym9Nh6LYF2qazfjuE1Ya0/vTz5SENAS0QQDJPbrEejhgiuQJmSU0MULpmEpS0tMoMGyd4fjkNe+XAliUxwz4UFWxM5IvnSUbNiZ6HtsE4hXxcWYbkTL7Rm+dMbrLhOXwalp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708198563; c=relaxed/simple;
	bh=WgmeGu5jPTALxYM9TeTQ2yCmiAAOjMHw2FPsI3eBK04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSA+s19LrHEZW0vkrvSKNQE26i+cn7sLW0K5aZgdWZEpPsEu0Lo3TgC6ZWOY889D5norRSldJP4HD7BDB0LtVV9RJ9aLDMgQUCkW2chd4IaSnaRDY3yLwl2JelRstfCyrTlOnW1xSrhuPX+eIturVSJw7fYZqQQO3WTvWUhqfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgP5UZIr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgP5UZIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708198562; x=1739734562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WgmeGu5jPTALxYM9TeTQ2yCmiAAOjMHw2FPsI3eBK04=;
  b=SgP5UZIr/ntDjeHzzhjau7qb+03iqYnr2H6145KfwswQA52UT9yt+VXJ
   Pm2AIMid7Eye13ZkZz03Ny6XQHlSjQchsv3hVfi9By+f8EYLHrGZ21Wb1
   DfsfV//al1lJPlJFq6Pu2dara42ZF+a7LSW+vTtaRF3K9W0fJ6EZm99hH
   LeWSzs6C3pBDubX2c0JS1cm5P6zd/pzbONZvY/z+HVWVcHlPTwnvvH3YN
   3ahbOb1R6sA092GxFY1D3ho9jNPti6I4VF8RSP8lc9sK1/4vsFUG9FQ5Q
   ar1C47X5COJumwol4PC2X18tvokGQLIfA83+HgzvRvhkIP11uFVWrhyIv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2218170"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2218170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 11:36:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4190549"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2024 11:35:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbQTH-0002SE-3C;
	Sat, 17 Feb 2024 19:35:38 +0000
Date: Sun, 18 Feb 2024 03:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Harald Mommer <Harald.Mommer@opensynergy.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] SPI: Add virtio SPI driver.
Message-ID: <202402180341.OAy6gqDI-lkp@intel.com>
References: <20240213135350.5878-4-Harald.Mommer@opensynergy.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213135350.5878-4-Harald.Mommer@opensynergy.com>

Hi Harald,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harald-Mommer/virtio-Add-ID-for-virtio-SPI/20240213-220415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240213135350.5878-4-Harald.Mommer%40opensynergy.com
patch subject: [RFC PATCH v3 3/3] SPI: Add virtio SPI driver.
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240218/202402180341.OAy6gqDI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180341.OAy6gqDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180341.OAy6gqDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-virtio.c:162:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     162 |         if (virtio_spi_set_delays(th, spi, xfer))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-virtio.c:197:6: note: uninitialized use occurs here
     197 |         if (ret)
         |             ^~~
   drivers/spi/spi-virtio.c:162:2: note: remove the 'if' if its condition is always false
     162 |         if (virtio_spi_set_delays(th, spi, xfer))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     163 |                 goto msg_done;
         |                 ~~~~~~~~~~~~~
   drivers/spi/spi-virtio.c:131:9: note: initialize the variable 'ret' to silence this warning
     131 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +162 drivers/spi/spi-virtio.c

   117	
   118	static int virtio_spi_one_transfer(struct virtio_spi_req *spi_req,
   119					   struct spi_controller *ctrl,
   120					   struct spi_message *msg,
   121					   struct spi_transfer *xfer)
   122	{
   123		struct virtio_spi_priv *priv = spi_controller_get_devdata(ctrl);
   124		struct spi_device *spi = msg->spi;
   125		struct spi_transfer_head *th;
   126		struct scatterlist sg_out_head, sg_out_payload;
   127		struct scatterlist sg_in_result, sg_in_payload;
   128		struct scatterlist *sgs[4];
   129		unsigned int outcnt = 0u;
   130		unsigned int incnt = 0u;
   131		int ret;
   132	
   133		th = &spi_req->transfer_head;
   134	
   135		/* Fill struct spi_transfer_head */
   136		th->chip_select_id = spi_get_chipselect(spi, 0);
   137		th->bits_per_word = spi->bits_per_word;
   138		/*
   139		 * Got comment: "The virtio spec for cs_change is *not* what the Linux
   140		 * cs_change field does, this will not do the right thing."
   141		 * TODO: Understand/discuss this, still unclear what may be wrong here
   142		 */
   143		th->cs_change = xfer->cs_change;
   144		th->tx_nbits = xfer->tx_nbits;
   145		th->rx_nbits = xfer->rx_nbits;
   146		th->reserved[0] = 0;
   147		th->reserved[1] = 0;
   148		th->reserved[2] = 0;
   149	
   150		BUILD_BUG_ON(VIRTIO_SPI_CPHA != SPI_CPHA);
   151		BUILD_BUG_ON(VIRTIO_SPI_CPOL != SPI_CPOL);
   152		BUILD_BUG_ON(VIRTIO_SPI_CS_HIGH != SPI_CS_HIGH);
   153		BUILD_BUG_ON(VIRTIO_SPI_MODE_LSB_FIRST != SPI_LSB_FIRST);
   154	
   155		th->mode = cpu_to_le32(spi->mode & (SPI_LSB_FIRST | SPI_CS_HIGH |
   156						    SPI_CPOL | SPI_CPHA));
   157		if ((spi->mode & SPI_LOOP) != 0)
   158			th->mode |= cpu_to_le32(VIRTIO_SPI_MODE_LOOP);
   159	
   160		th->freq = cpu_to_le32(xfer->speed_hz);
   161	
 > 162		if (virtio_spi_set_delays(th, spi, xfer))
   163			goto msg_done;
   164	
   165		/* Set buffers */
   166		spi_req->tx_buf = xfer->tx_buf;
   167		spi_req->rx_buf = xfer->rx_buf;
   168	
   169		/* Prepare sending of virtio message */
   170		init_completion(&spi_req->completion);
   171	
   172		sg_init_one(&sg_out_head, th, sizeof(*th));
   173		sgs[outcnt] = &sg_out_head;
   174		outcnt++;
   175	
   176		if (spi_req->tx_buf) {
   177			sg_init_one(&sg_out_payload, spi_req->tx_buf, xfer->len);
   178			sgs[outcnt] = &sg_out_payload;
   179			outcnt++;
   180		}
   181	
   182		if (spi_req->rx_buf) {
   183			sg_init_one(&sg_in_payload, spi_req->rx_buf, xfer->len);
   184			sgs[outcnt + incnt] = &sg_in_payload;
   185			incnt++;
   186		}
   187	
   188		sg_init_one(&sg_in_result, &spi_req->result,
   189			    sizeof(struct spi_transfer_result));
   190		sgs[outcnt + incnt] = &sg_in_result;
   191		incnt++;
   192	
   193		ret = virtqueue_add_sgs(priv->vq, sgs, outcnt, incnt, spi_req,
   194					GFP_KERNEL);
   195	
   196	msg_done:
   197		if (ret)
   198			msg->status = ret;
   199	
   200		return ret;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
