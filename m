Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3338F93B;
	Mon, 24 Aug 2026 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604286; cv=none; b=PBo61Ia+iYYv5JF7pgsQZjr1cS++1j8BhGW4L/LHplqOZuXH146j0ZEbpCuEuEwwu4SCMwNDwCfctlgHAPPgjgLJ0GT0D0CnAObQSYBcXMIM0wTlLc9ATdLNz6dvKwiDuK3OJuG6ee1GKYBiGpBFzM6M7x69SrYdnHzObvXM+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604286; c=relaxed/simple;
	bh=NOA4vCbb1ZYoR2rPPmMusfS16XtzjtdN1T/mb8VJtC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm9TSbp/QjhxqNShXvHwYZW37INt9NUXDPwVQISlKRo5NezsFhJ+ieMO3QJWHNfFb+mwM5tfEr0Zpj+RZmZhKsprFVFB19UsVUvhmu1K3WBL3VCvismLQUo+mMdli5w3GprgC7dRs/eHxhPEAadtSOpY6xmbVLnYLYyJQE/pXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr4Jvxn3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr4Jvxn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787604285; x=1819140285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NOA4vCbb1ZYoR2rPPmMusfS16XtzjtdN1T/mb8VJtC8=;
  b=lr4Jvxn3O7jUJAfvdEXa38Tv7i9MwWpFcnRbqjwTYGPwZBh3ac4QefiJ
   F2zdlM9QvniWXpTNxzM/Vx9wy5dz77j2/zN/EjA+/oxndgWJtClOQLTNQ
   h/6qkm7Ij5iYy/mtSad9OCotX9qdxTVnSl7/6NBCA33gUCgoZ3iGkuD/e
   czuoeBWIwdJqhqYOFDAiw2nenxHH0ppPagLYip8kNWXYi9yoADO3Ny5gO
   lrRZfKBALg1ZpEacrcesRSLbmEa37NNM7BZ7lYaYgbTTSM9FX+ZJpDu3o
   BFIroioD/NIdkVa0n9j7wZKQ9eEUVQzRmzlbTaJf+QVf09V/yZAcepJIt
   Q==;
X-CSE-ConnectionGUID: LWxdkpVQQ2SLw8U74qwJNw==
X-CSE-MsgGUID: wD5F7FeARlO6vuLf44Pw1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110852356"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="110852356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:44:44 -0700
X-CSE-ConnectionGUID: gOHQQFA4TaueFmkpeRvIcg==
X-CSE-MsgGUID: 0iKgjXZuS3mbnxO942bOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="291950997"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Aug 2026 13:44:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wybWx-0000000046D-2932;
	Mon, 24 Aug 2026 20:44:32 +0000
Date: Tue, 25 Aug 2026 04:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <202608250423.yjFoKzoa-lkp@intel.com>
References: <20260823050012.17067-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823050012.17067-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.2]
[also build test ERROR on linus/master next-20260821]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ASoC-xilinx-formatter_pcm-use-more-devm-in-probe/20260822-220012
base:   v7.2
patch link:    https://lore.kernel.org/r/20260823050012.17067-1-rosenp%40gmail.com
patch subject: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
config: arm64-randconfig-002-20260825 (https://download.01.org/0day-ci/archive/20260825/202608250423.yjFoKzoa-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250423.yjFoKzoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250423.yjFoKzoa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/xilinx/xlnx_formatter_pcm.c:632:62: error: too few arguments to function call, expected at least 3, have 2
     632 |                         return dev_err_probe(dev, "audio formatter reset failed\n");
         |                                ~~~~~~~~~~~~~                                      ^
   include/linux/dev_printk.h:278:20: note: 'dev_err_probe' declared here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +632 sound/soc/xilinx/xlnx_formatter_pcm.c

   584	
   585	static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
   586	{
   587		int ret;
   588		u32 val;
   589		struct xlnx_pcm_drv_data *aud_drv_data;
   590		struct device *dev = &pdev->dev;
   591		struct clk *axi_clk;
   592	
   593		axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
   594		if (IS_ERR(axi_clk))
   595			return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
   596	
   597		aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
   598		if (!aud_drv_data)
   599			return -ENOMEM;
   600	
   601		aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
   602		if (IS_ERR(aud_drv_data->mmio))
   603			return PTR_ERR(aud_drv_data->mmio);
   604	
   605		val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
   606		if (val & AUD_CFG_MM2S_MASK) {
   607			aud_drv_data->mm2s_presence = true;
   608			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   609						       XLNX_MM2S_OFFSET);
   610			if (ret)
   611				return dev_err_probe(dev, ret, "audio formatter reset failed\n");
   612			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   613						    XLNX_MM2S_OFFSET,
   614						    SNDRV_PCM_STREAM_PLAYBACK);
   615	
   616			aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
   617									 "irq_mm2s");
   618			if (aud_drv_data->mm2s_irq < 0)
   619				return aud_drv_data->mm2s_irq;
   620	
   621			ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
   622					       xlnx_mm2s_irq_handler, 0,
   623					       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
   624			if (ret)
   625				return ret;
   626		}
   627		if (val & AUD_CFG_S2MM_MASK) {
   628			aud_drv_data->s2mm_presence = true;
   629			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   630						       XLNX_S2MM_OFFSET);
   631			if (ret)
 > 632				return dev_err_probe(dev, "audio formatter reset failed\n");
   633			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   634						    XLNX_S2MM_OFFSET,
   635						    SNDRV_PCM_STREAM_CAPTURE);
   636	
   637			aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
   638									 "irq_s2mm");
   639			if (aud_drv_data->s2mm_irq < 0)
   640				return aud_drv_data->s2mm_irq;
   641	
   642			ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
   643					       xlnx_s2mm_irq_handler, 0,
   644					       "xlnx_formatter_pcm_s2mm_irq",
   645					       aud_drv_data);
   646			if (ret)
   647				return ret;
   648		}
   649	
   650		dev_set_drvdata(dev, aud_drv_data);
   651	
   652		return devm_snd_soc_register_component(dev, &xlnx_asoc_component, NULL, 0);
   653	}
   654	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
