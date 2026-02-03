Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654782F3C34;
	Tue,  3 Feb 2026 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139956; cv=none; b=NIw2AjZ0bisYlGcwX2ynmBuyUAGIsTDlRvvSQXF5UKKkDalKMWhwcXH7BAVgPUFzykfxCYABrvXvW6d/wSbxLUN6RZdovMUmLD1oj8s6e93qyb4NCD/kR+D9kKZIX8eG6QPoI9v5uDFR3TBdZOu0Bfd0r+uR4CGQOdDA6lcHXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139956; c=relaxed/simple;
	bh=zOUHPvPYgAED+5chP8L8z0Gl/CW+3EmlWHBnR1pXUuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG2WLmIhGNoXaswrt6rqnkUQWTAhOUKtftMyisXa4ED/2eu/w9UWO8NzV+DPuzuXLArotWS69OS+4dOXfqfVfxRPx/XqBFMyt22c61EFAZD0gqUWZZ3KfwqQ/xwR5wTf9SOD/Ls88xxLf48dzSknJzFTRR4LFNGWb51WbWeAQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRuVFepg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRuVFepg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770139955; x=1801675955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zOUHPvPYgAED+5chP8L8z0Gl/CW+3EmlWHBnR1pXUuA=;
  b=GRuVFepgSwo9uPbqatqhaNGu7eEXeotl+61n+bw1cmJp6OUR7ckl+jyC
   cj56zhrwuHek2FBRhyD8y9OXjPWzTLV+rN/K2dEkR8btqTLSjwn0wbT0e
   rVUBYcvkepEo4oWOqqUwYSpbPtcRK5VEQxQ+noOHHPZTwvi33gkLq0mZF
   5PBHMNvmxQynpspHmsdEaUT7H8aDdJ+4FVO4j3Gaxpg7IlQ+XwqwhT2sQ
   7RHpy2sL6NI0jAqD06Pjqu1oaUiaQEztVEv7hipndoYEj2d3B5QAwuCQJ
   KuiE5FQ2uGV387hW9q7uhJ4TWZ1eYfSejH/200/2af7AmzePc205nJVUm
   g==;
X-CSE-ConnectionGUID: Ftcv7o/rR+Od6LbMaV9eQg==
X-CSE-MsgGUID: /DDoh6mzTuileTmDQGgKug==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74939348"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="74939348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:32:34 -0800
X-CSE-ConnectionGUID: oGD2iRp5REOmYrYYHGZ1VQ==
X-CSE-MsgGUID: j27gC4EKSv+Jhb07xjwNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209195436"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 09:32:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnKGK-00000000guW-0ghX;
	Tue, 03 Feb 2026 17:32:28 +0000
Date: Wed, 4 Feb 2026 01:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 2/3] reset: add Sky1 soc reset support
Message-ID: <202602040111.sphIzkjq-lkp@intel.com>
References: <20260203022031.4075627-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203022031.4075627-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master pza/reset/next v6.19-rc8 next-20260202]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-soc-cix-document-the-simple-mfd-syscon-on-Sky1-SoC/20260203-102331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260203022031.4075627-3-gary.yang%40cixtech.com
patch subject: [PATCH v6 2/3] reset: add Sky1 soc reset support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260204/202602040111.sphIzkjq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040111.sphIzkjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040111.sphIzkjq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1-base.c:97:5: warning: no previous prototype for function 'sky1_reset_common_probe' [-Wmissing-prototypes]
      97 | int sky1_reset_common_probe(struct platform_device *pdev,
         |     ^
   drivers/reset/reset-sky1-base.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | int sky1_reset_common_probe(struct platform_device *pdev,
         | ^
         | static 
   1 warning generated.


vim +/sky1_reset_common_probe +97 drivers/reset/reset-sky1-base.c

    96	
  > 97	int sky1_reset_common_probe(struct platform_device *pdev,
    98				const struct sky1_src_variant *variant)
    99	{
   100		struct sky1_src *sky1src;
   101		struct device *dev = &pdev->dev;
   102	
   103		sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
   104		if (!sky1src)
   105			return -ENOMEM;
   106	
   107		sky1src->regmap = device_node_to_regmap(dev->parent->of_node);
   108		if (IS_ERR(sky1src->regmap)) {
   109			dev_err(dev, "Unable to get sky1-src regmap");
   110			return PTR_ERR(sky1src->regmap);
   111		}
   112	
   113		sky1src->signals = variant->signals;
   114		sky1src->rcdev.owner     = THIS_MODULE;
   115		sky1src->rcdev.nr_resets = variant->signals_num;
   116		sky1src->rcdev.ops       = &sky1_src_ops;
   117		sky1src->rcdev.of_node   = dev->parent->of_node;
   118		sky1src->rcdev.dev       = dev;
   119	
   120		return devm_reset_controller_register(dev, &sky1src->rcdev);
   121	}
   122	EXPORT_SYMBOL_GPL(sky1_reset_common_probe);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
