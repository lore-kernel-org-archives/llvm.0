Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E43BE659;
	Wed,  2 Sep 2026 19:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378550; cv=none; b=C3zaaZCGBnKZi5EIHH5GvnL0zoAkjx3uhfIw/znGinAgAv4caiH5ZUikKsZEg55dONsdNi1sfLVxMtcIW6uwgHzYqZCGBlz0dq3KVX18HrxjP/zo9wOcRFqQYAvcl9la7Zlsl9W0jasiwKQwz0RiAsN7u79WXqnATpjjFM1IzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378550; c=relaxed/simple;
	bh=PqONomyjOqjqkvONvcbxns6QfCa4tWnfoco/vQp0RX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLwNp5aw2jb3wSL+HR79T2taEJ0GkrgD4+HanEd3JsAU674m6gCYFUQWaSD8ilyiUKSNoNYZ8ApzmyaSlgfIJkqiqcWI9XcnfY1PTYTeN3d+C1bnfqxQ+AZIHuYdPF+4wQ/IzMKzCRlcmt5FFfgjPa9U6RzUCqAGyZbBn3x4sXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cm21xca+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cm21xca+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788378545; x=1819914545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PqONomyjOqjqkvONvcbxns6QfCa4tWnfoco/vQp0RX8=;
  b=Cm21xca+uxIOttN10H+u1QMWWgDbKRRv+LAFi4B8S3DQk28g1/IvmOSW
   i/X5rzQhnqqhhwYFg6qD9sPJJRJyeUsRZSwNKELChnumw42vVainDCDm6
   mgq9Ijsrf5He9BcRjDhaiL1aozdDZv9peMuT7U1BqwjJmBfIh58E7v/9D
   VnU8bLpWWBDboyTKxRF+Z391bdM0pKq3R18SrcfrGdHXmgqTsAEZuALj8
   Lrid6pQrjEKPDHLX5Xtedx8dz4NWJMfd/PM5aAodp5NKU8g1+1wEzMQ3G
   w6L9/VRd9QkcDR89FhL7GhNFYNc66bTid0n3A1DHmK+zuCgGUs06CaFL5
   Q==;
X-CSE-ConnectionGUID: 8vaNaYA5TP+CFKd4IUlwzw==
X-CSE-MsgGUID: nNAqwAYmT5O5iPQ5Wye4yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111623246"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111623246"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:48:56 -0700
X-CSE-ConnectionGUID: ybu/weRnTVqAQJqu94/Pbw==
X-CSE-MsgGUID: qazrVWkARIOUkQCDIRrzpQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2026 12:48:54 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1qx0-000000003GI-2haC;
	Wed, 02 Sep 2026 19:48:50 +0000
Date: Thu, 3 Sep 2026 03:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Li Youhong <dayou5941@163.com>, Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Message-ID: <202609030325.ALAaghFW-lkp@intel.com>
References: <20260902013016.3381788-1-dayou5941@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013016.3381788-1-dayou5941@163.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v7.3-rc1 next-20260902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Youhong/dmaengine-dw-axi-dmac-convert-to-clk-bulk-APIs/20260902-093016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260902013016.3381788-1-dayou5941%40163.com
patch subject: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609030325.ALAaghFW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ed1626b9d0eaf7c406f44da5fb595ad94559f54b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030325.ALAaghFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030325.ALAaghFW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1638:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
    1638 |         clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +1638 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

  1629	
  1630	static void dw_remove(struct platform_device *pdev)
  1631	{
  1632		struct axi_dma_chip *chip = platform_get_drvdata(pdev);
  1633		struct dw_axi_dma *dw = chip->dw;
  1634		struct axi_dma_chan *chan, *_chan;
  1635		u32 i;
  1636	
  1637		/* Enable clk before accessing to registers */
> 1638		clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
  1639		axi_dma_irq_disable(chip);
  1640		for (i = 0; i < dw->hdata->nr_channels; i++) {
  1641			axi_chan_disable(&chip->dw->chan[i]);
  1642			axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
  1643		}
  1644		axi_dma_disable(chip);
  1645	
  1646		pm_runtime_disable(chip->dev);
  1647		axi_dma_suspend(chip);
  1648	
  1649		for (i = 0; i < DMAC_MAX_CHANNELS; i++)
  1650			if (chip->irq[i] > 0)
  1651				devm_free_irq(chip->dev, chip->irq[i], chip);
  1652	
  1653		of_dma_controller_free(chip->dev->of_node);
  1654	
  1655		list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
  1656					 vc.chan.device_node) {
  1657			list_del(&chan->vc.chan.device_node);
  1658			tasklet_kill(&chan->vc.task);
  1659		}
  1660	}
  1661	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
