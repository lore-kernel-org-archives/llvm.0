Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563F631BC85;
	Tue, 25 Nov 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072465; cv=none; b=VeV6VTPTLNbqCgp8wYbBVdKN76lUQ8RnoFP5Q3EqsCo6tuskeIEso58aJ3qFlL4cwZbeZVsTSocCo9fokYkEcoJzBQawPQ0w4kOf7yGsrbMhhRafPEcxATBLREDHC+MXe8rzuNgI45L1MJlkmHutqdcU7VKi5zeEIYrzLYuTDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072465; c=relaxed/simple;
	bh=qq0TTX9wGeZLumRD8PikUL8kyyuwxIpCYIAiBzzYFF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mvrunb7xo3NzX5NJQnbmGVoUJFbkIX+70nmuKuymRO5guRygAkX5KLEz0VQD72v20pdIBG41UjYNYhE+iAfD8vMeFatMY5MsEsbiK4d5jHwelYRjHG0xIpY5KQhWYsbfqwoQsyWBfY8SpVRISvyxeb3HTczdoyyXOXBasX8m4/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJTilQCH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJTilQCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764072463; x=1795608463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qq0TTX9wGeZLumRD8PikUL8kyyuwxIpCYIAiBzzYFF8=;
  b=gJTilQCH+3TLP5Xw4qJDVDNe4SJuPWFiK+RvoAYHFabxrNtTx9Q02fnJ
   TCpgP8aK9lyLKEVVverGvqhtFeixmObq8NIOjIIdeJsQLiHBGJB1wYA/X
   vjvsBzR0lzPyNfJrdFz89obS8YoGXA1s59Sm71Vr0kZI+/62kV07IfPuY
   A3yvpWK3bdP/NQe7Sh0tZ11mgsnIMIXTuMaRQnNi4dJ6m6viGZbsbwPGx
   WjRHqAzrVQB3lVkmL+4yx8H+VsH+N8XHmZguYJoOBmqCJOLgTEWTguEAq
   U285zevp2kzycnYI+gFvGQUjYU1uTDoYmc6DNMBaX/WQOvVuc+pq6//ej
   g==;
X-CSE-ConnectionGUID: 1rzmshQeRXiql4HcFTFoOg==
X-CSE-MsgGUID: STsOQOb7ROWpztUj4m+uVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76711216"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76711216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:07:43 -0800
X-CSE-ConnectionGUID: yI0JdMhYQuGbPYrGH12LFQ==
X-CSE-MsgGUID: 3/m9BFMBTCCqBnJ3l9vdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192617430"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 04:07:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrpX-000000001l7-3NhZ;
	Tue, 25 Nov 2025 12:07:35 +0000
Date: Tue, 25 Nov 2025 20:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH 3/7] dma: mcf-edma: Add per-channel IRQ naming for
 debugging
Message-ID: <202511251902.QUkQzBbn-lkp@intel.com>
References: <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>

Hi Jean-Michel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d13f3ac64efb868d09cb2726b1e84929afe90235]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/dma-fsl-edma-Add-write-barrier-after-TCD-descriptor-fill/20251124-205625
base:   d13f3ac64efb868d09cb2726b1e84929afe90235
patch link:    https://lore.kernel.org/r/20251124-dma-coldfire-v1-3-dc8f93185464%40yoseli.org
patch subject: [PATCH 3/7] dma: mcf-edma: Add per-channel IRQ naming for debugging
config: x86_64-buildonly-randconfig-004-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251902.QUkQzBbn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251902.QUkQzBbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251902.QUkQzBbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/mcf-edma-main.c:86:18: warning: format specifies type 'int' but the argument has type 'resource_size_t' (aka 'unsigned long long') [-Wformat]
      86 |                                                 "eDMA-%d", i - res->start);
         |                                                       ~~   ^~~~~~~~~~~~~~
         |                                                       %llu
   drivers/dma/mcf-edma-main.c:100:18: warning: format specifies type 'int' but the argument has type 'resource_size_t' (aka 'unsigned long long') [-Wformat]
     100 |                                                 "eDMA-%d", 16 + i - res->start);
         |                                                       ~~   ^~~~~~~~~~~~~~~~~~~
         |                                                       %llu
   2 warnings generated.


vim +86 drivers/dma/mcf-edma-main.c

    72	
    73	static int mcf_edma_irq_init(struct platform_device *pdev,
    74					struct fsl_edma_engine *mcf_edma)
    75	{
    76		int ret = 0, i;
    77		struct resource *res;
    78	
    79		res = platform_get_resource_byname(pdev,
    80					IORESOURCE_IRQ, "edma-tx-00-15");
    81		if (!res)
    82			return -1;
    83	
    84		for (ret = 0, i = res->start; i <= res->end; ++i) {
    85			char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
  > 86							"eDMA-%d", i - res->start);
    87	
    88			ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
    89		}
    90		if (ret)
    91			return ret;
    92	
    93		res = platform_get_resource_byname(pdev,
    94				IORESOURCE_IRQ, "edma-tx-16-55");
    95		if (!res)
    96			return -1;
    97	
    98		for (ret = 0, i = res->start; i <= res->end; ++i) {
    99			char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
   100							"eDMA-%d", 16 + i - res->start);
   101	
   102			ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
   103		}
   104		if (ret)
   105			return ret;
   106	
   107		ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
   108		if (ret != -ENXIO) {
   109			ret = request_irq(ret, mcf_edma_tx_handler,
   110					  0, "eDMA-tx-56", mcf_edma);
   111			if (ret)
   112				return ret;
   113		}
   114	
   115		ret = platform_get_irq_byname(pdev, "edma-err");
   116		if (ret != -ENXIO) {
   117			ret = request_irq(ret, mcf_edma_err_handler,
   118					  0, "eDMA-err", mcf_edma);
   119			if (ret)
   120				return ret;
   121		}
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
