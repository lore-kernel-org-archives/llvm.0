Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCE30B51E;
	Fri, 27 Mar 2026 06:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591560; cv=none; b=I0VlKXANQ7EfZSSz7JYBsYu0QQpHjyxDkSMGmDcA0PjC6A2FgwTsbqK7C0yLinHYkqf/tfDPOWOHWAT757BZJvzwJ87jRIXUSwIIdUshdewyAZgeD+44yCng87nHtpr4OdNlszm/IrVNJlvniCXo9gIjCQ95PgweCbvLNTLrLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591560; c=relaxed/simple;
	bh=4YKoegXNl/z95DhhSsl6seq1dNu1HoG7+gaZVeQtUto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QT9w2ATfBmdAw2Ymt82tMOA6ekf8RdEsfJFrbAoT7c84BBopgLnAG6Qj8yWxXNWIdeEd5Rlnj7QOKHLzwTnNHSJiUAJ9XC5oY3qTvBJu6qFaZkC8uPECi+T6Lnf7mGwMVrlD/9WEkcvm/EjetTmazJNihKguIb79uI11CzTE/AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9Qx5miB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9Qx5miB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774591559; x=1806127559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4YKoegXNl/z95DhhSsl6seq1dNu1HoG7+gaZVeQtUto=;
  b=Z9Qx5miBYsh+77nrQ2AFMdKC297HUlZj9eU0xdswDEzpfELeJQBYTQHH
   ySiO4gXPq8JXwHTDsuK9Ull/D21OGneeMAx43ZjllumBIyJBj7SYQNxKB
   kFKoGYM2pvtndiQGXhdkzZaFjcjuYvh5B8UBj7/KeOfDBk7QWSPXmuw5k
   5WkOUK2wJyTkXOeg+SSSfBjL8gnqtaJQ/DqLqSF2ZRgV9/ptncjtdioqI
   GzUxmZYC63ZruPvJTK3E3V+6Twi8sDXwehKgF2Kx74hfqzPONS82DQuif
   5BbvcWwsx8qlV/JotAvnyzuHIkO/xGl0x8GZdxdltelX9DAr3CRKZvOcx
   w==;
X-CSE-ConnectionGUID: tg+z3c+bS4KyD9vuU9XF1w==
X-CSE-MsgGUID: vLWh35HuRpy1eF3ebpiS1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75564856"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75564856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 23:05:59 -0700
X-CSE-ConnectionGUID: TOgSNZoFTa6yMCF9aDABVA==
X-CSE-MsgGUID: 90r2Y3HFQnyeACP5T/GSSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="218604192"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2026 23:05:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w60KP-000000009qv-3Gfk;
	Fri, 27 Mar 2026 06:05:53 +0000
Date: Fri, 27 Mar 2026 14:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Carlier <devnexen@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH] media: mali-c55: fix resource leaks in probe and remove
Message-ID: <202603271400.K56xZKaE-lkp@intel.com>
References: <20260326190052.11780-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326190052.11780-1-devnexen@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v7.0-rc5 next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Carlier/media-mali-c55-fix-resource-leaks-in-probe-and-remove/20260327-045201
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20260326190052.11780-1-devnexen%40gmail.com
patch subject: [PATCH] media: mali-c55: fix resource leaks in probe and remove
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603271400.K56xZKaE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271400.K56xZKaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271400.K56xZKaE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/arm/mali-c55/mali-c55-core.c:883:1: warning: unused label 'err_free_context_registers' [-Wunused-label]
     883 | err_free_context_registers:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_free_context_registers +883 drivers/media/platform/arm/mali-c55/mali-c55-core.c

d5f281f3dd2988 Daniel Scally 2025-11-11  804  
d5f281f3dd2988 Daniel Scally 2025-11-11  805  static int mali_c55_probe(struct platform_device *pdev)
d5f281f3dd2988 Daniel Scally 2025-11-11  806  {
d5f281f3dd2988 Daniel Scally 2025-11-11  807  	struct device *dev = &pdev->dev;
d5f281f3dd2988 Daniel Scally 2025-11-11  808  	struct mali_c55 *mali_c55;
d5f281f3dd2988 Daniel Scally 2025-11-11  809  	struct resource *res;
d5f281f3dd2988 Daniel Scally 2025-11-11  810  	int ret;
d5f281f3dd2988 Daniel Scally 2025-11-11  811  
d5f281f3dd2988 Daniel Scally 2025-11-11  812  	mali_c55 = devm_kzalloc(dev, sizeof(*mali_c55), GFP_KERNEL);
d5f281f3dd2988 Daniel Scally 2025-11-11  813  	if (!mali_c55)
d5f281f3dd2988 Daniel Scally 2025-11-11  814  		return -ENOMEM;
d5f281f3dd2988 Daniel Scally 2025-11-11  815  
d5f281f3dd2988 Daniel Scally 2025-11-11  816  	mali_c55->dev = dev;
d5f281f3dd2988 Daniel Scally 2025-11-11  817  	platform_set_drvdata(pdev, mali_c55);
d5f281f3dd2988 Daniel Scally 2025-11-11  818  
d5f281f3dd2988 Daniel Scally 2025-11-11  819  	mali_c55->base = devm_platform_get_and_ioremap_resource(pdev, 0,
d5f281f3dd2988 Daniel Scally 2025-11-11  820  								&res);
d5f281f3dd2988 Daniel Scally 2025-11-11  821  	if (IS_ERR(mali_c55->base))
d5f281f3dd2988 Daniel Scally 2025-11-11  822  		return dev_err_probe(dev, PTR_ERR(mali_c55->base),
d5f281f3dd2988 Daniel Scally 2025-11-11  823  				     "failed to map IO memory\n");
d5f281f3dd2988 Daniel Scally 2025-11-11  824  
d5f281f3dd2988 Daniel Scally 2025-11-11  825  	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
d5f281f3dd2988 Daniel Scally 2025-11-11  826  		mali_c55->clks[i].id = mali_c55_clk_names[i];
d5f281f3dd2988 Daniel Scally 2025-11-11  827  
d5f281f3dd2988 Daniel Scally 2025-11-11  828  	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
d5f281f3dd2988 Daniel Scally 2025-11-11  829  	if (ret)
d5f281f3dd2988 Daniel Scally 2025-11-11  830  		return dev_err_probe(dev, ret, "failed to acquire clocks\n");
d5f281f3dd2988 Daniel Scally 2025-11-11  831  
d5f281f3dd2988 Daniel Scally 2025-11-11  832  	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_reset_names); i++)
d5f281f3dd2988 Daniel Scally 2025-11-11  833  		mali_c55->resets[i].id = mali_c55_reset_names[i];
d5f281f3dd2988 Daniel Scally 2025-11-11  834  
d5f281f3dd2988 Daniel Scally 2025-11-11  835  	ret = devm_reset_control_bulk_get_optional_shared(dev,
d5f281f3dd2988 Daniel Scally 2025-11-11  836  			ARRAY_SIZE(mali_c55_reset_names), mali_c55->resets);
d5f281f3dd2988 Daniel Scally 2025-11-11  837  	if (ret)
d5f281f3dd2988 Daniel Scally 2025-11-11  838  		return dev_err_probe(dev, ret, "failed to acquire resets\n");
d5f281f3dd2988 Daniel Scally 2025-11-11  839  
d5f281f3dd2988 Daniel Scally 2025-11-11  840  	of_reserved_mem_device_init(dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  841  	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
d5f281f3dd2988 Daniel Scally 2025-11-11  842  
d5f281f3dd2988 Daniel Scally 2025-11-11  843  	ret = __mali_c55_power_on(mali_c55);
3b2d04fb011b8b David Carlier 2026-03-26  844  	if (ret) {
3b2d04fb011b8b David Carlier 2026-03-26  845  		dev_err_probe(dev, ret, "failed to power on\n");
3b2d04fb011b8b David Carlier 2026-03-26  846  		goto err_release_mem;
3b2d04fb011b8b David Carlier 2026-03-26  847  	}
d5f281f3dd2988 Daniel Scally 2025-11-11  848  
d5f281f3dd2988 Daniel Scally 2025-11-11  849  	ret = mali_c55_check_hwcfg(mali_c55);
d5f281f3dd2988 Daniel Scally 2025-11-11  850  	if (ret)
d5f281f3dd2988 Daniel Scally 2025-11-11  851  		goto err_power_off;
d5f281f3dd2988 Daniel Scally 2025-11-11  852  
d5f281f3dd2988 Daniel Scally 2025-11-11  853  	ret = mali_c55_init_context(mali_c55, res);
d5f281f3dd2988 Daniel Scally 2025-11-11  854  	if (ret)
d5f281f3dd2988 Daniel Scally 2025-11-11  855  		goto err_power_off;
d5f281f3dd2988 Daniel Scally 2025-11-11  856  
d5f281f3dd2988 Daniel Scally 2025-11-11  857  	mali_c55->media_dev.dev = dev;
d5f281f3dd2988 Daniel Scally 2025-11-11  858  
d5f281f3dd2988 Daniel Scally 2025-11-11  859  	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
d5f281f3dd2988 Daniel Scally 2025-11-11  860  	pm_runtime_use_autosuspend(&pdev->dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  861  	pm_runtime_set_active(&pdev->dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  862  	pm_runtime_enable(&pdev->dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  863  
d5f281f3dd2988 Daniel Scally 2025-11-11  864  	ret = mali_c55_media_frameworks_init(mali_c55);
d5f281f3dd2988 Daniel Scally 2025-11-11  865  	if (ret)
3b2d04fb011b8b David Carlier 2026-03-26  866  		goto err_runtime_disable;
d5f281f3dd2988 Daniel Scally 2025-11-11  867  
d5f281f3dd2988 Daniel Scally 2025-11-11  868  	pm_runtime_idle(&pdev->dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  869  
d5f281f3dd2988 Daniel Scally 2025-11-11  870  	mali_c55->irqnum = platform_get_irq(pdev, 0);
d5f281f3dd2988 Daniel Scally 2025-11-11  871  	if (mali_c55->irqnum < 0) {
d5f281f3dd2988 Daniel Scally 2025-11-11  872  		ret = mali_c55->irqnum;
d5f281f3dd2988 Daniel Scally 2025-11-11  873  		dev_err(dev, "failed to get interrupt\n");
d5f281f3dd2988 Daniel Scally 2025-11-11  874  		goto err_deinit_media_frameworks;
d5f281f3dd2988 Daniel Scally 2025-11-11  875  	}
d5f281f3dd2988 Daniel Scally 2025-11-11  876  
d5f281f3dd2988 Daniel Scally 2025-11-11  877  	return 0;
d5f281f3dd2988 Daniel Scally 2025-11-11  878  
d5f281f3dd2988 Daniel Scally 2025-11-11  879  err_deinit_media_frameworks:
d5f281f3dd2988 Daniel Scally 2025-11-11  880  	mali_c55_media_frameworks_deinit(mali_c55);
3b2d04fb011b8b David Carlier 2026-03-26  881  err_runtime_disable:
d5f281f3dd2988 Daniel Scally 2025-11-11  882  	pm_runtime_disable(&pdev->dev);
d5f281f3dd2988 Daniel Scally 2025-11-11 @883  err_free_context_registers:
d5f281f3dd2988 Daniel Scally 2025-11-11  884  	kfree(mali_c55->context.registers);
d5f281f3dd2988 Daniel Scally 2025-11-11  885  err_power_off:
d5f281f3dd2988 Daniel Scally 2025-11-11  886  	__mali_c55_power_off(mali_c55);
3b2d04fb011b8b David Carlier 2026-03-26  887  err_release_mem:
3b2d04fb011b8b David Carlier 2026-03-26  888  	of_reserved_mem_device_release(dev);
d5f281f3dd2988 Daniel Scally 2025-11-11  889  
d5f281f3dd2988 Daniel Scally 2025-11-11  890  	return ret;
d5f281f3dd2988 Daniel Scally 2025-11-11  891  }
d5f281f3dd2988 Daniel Scally 2025-11-11  892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
