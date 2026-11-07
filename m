Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031875;
	b=Ke7LnHRmwHXEJ0Sv7H17JpsmtUGz6+PpKjNb5XRHaoTy3oiVqBZ9dAIYJE25d/P8XUNG
	 D/aA9gFEmtNL4y8DXumNwduNvEHxhvQXpjNQ++NJSPR9Xc5Q1nFSG3JAr8/UJWS+GGR+P
	 PQ234YPYzlr3mYW2B9r6YTFGr2xPcnunDiR7/dVJuPb0HkYO0mhodN3qQXojym/SUHrOO
	 7zGFcKDgsPEEQOIYXv7gD4scp/e6P9Xx7rrKlFIhIaY8GM/CDJI/yluQiDTfud9VYWApI
	 glZNuYd/HMGcaR6oEVHka9e93+lmBnc2nDk4ltc/Daeu0beKagWUcYxQcSN02mTAjvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AdDuoPFhbdcHzbdmDf/jrv3oAT+qHeieR6nvMNIKfZ0=;
	b=KUV9z8TNq9+6TIo1o9vDfahbeK9CkBD7lYXx8w6iJsJaM1Hw5PCGZl63Ju2RPg0X/3FF
	 AR9oJ/NTqrj0ODD8BKVV43vemgr80kGjex/Q2aaY1gLHsOPmEFPiv8a/vWpA2nNb1HCna
	 boeqR3KM8vCzCVUkJLSRwL+F1mgDaaJR9AtgLT1X/xNLcaX7ygt8RTIpEJGH1qNcAC5VN
	 XlUEZdUuu/dPrA+zVot1KPpBewFlxtsovwa2mkYqnYF0D2LLb6Y9xMLkU6lGYX3WoRcXL
	 /aaf0NGusm6olDc7crlAv7K4YAGXdEWUI++LaMAuk8Bcb0RZbWE8py7IefafXw0h/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HbwuxFFM;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D6606A326;
	Sat,  7 Nov 2026 06:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HbwuxFFM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794031874; x=1825567874;
  h=date:from:to:cc:subject:message-id;
  bh=vOBOVmCmBtrhgDGCD2Reabr0MaRHJoIyJHtwB4HZRRg=;
  b=HbwuxFFMmwt8i5yf9Dn/jDCh51b2C4oVMyrykBKoFZWg7ufig1qHZVMm
   oCboT4687MJD2cD1w4//8D+M2FJCy7GqgObE3k1NrsNG3b4PaDtpa+Uem
   WHChHS3eT6hzxRSWfBTND4mwpylHRqBlTowI40YnJt2X+m+VIjIKRzNsv
   xO+z0L2rxqDKUXTpHCVLUm0H1XjYuie8ATEUBSNEpPe46OOBsqxuGYkGC
   GZ2/5VhraG/EYaq4x0KttnfuS2RRbnsrP65Vio6PYlYaZZn7FJ5j+03rk
   US/rTpBcWw8LDc0/QajTr12ZfFPhxHT4e08mMf0jsS9vYLG6cKbnCvlZG
   A==;
X-CSE-ConnectionGUID: VSSjAqQTSUCV+xX40nYrEw==
X-CSE-MsgGUID: F9GDsvn9T5m5773qDB7fIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2743877"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2743877"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 22:11:13 -0800
X-CSE-ConnectionGUID: w2cipSwTQd+a81pYakSiXg==
X-CSE-MsgGUID: 021Lta72QOGTvEydKYfv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7605748"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2026 22:11:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPZdt-00000000qWP-46cB;
	Sat, 07 Nov 2026 06:11:09 +0000
Date: Sat, 07 Nov 2026 14:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 sound/soc/qcom/lpass-platform.c:641:61: warning: format specifies type
 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long
 long')
Message-ID: <202611071331.Xu1BV2nK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8650/deckard-el2
head:   4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65
commit: 4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65 [1/1] WiP
config: i386-buildonly-randconfig-1004-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071331.Xu1BV2nK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071331.Xu1BV2nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071331.Xu1BV2nK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/lpass-platform.c:641:61: warning: format specifies type 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
     641 |         dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
         |                                              ~~                    ^~~~~~~~~~~~~~~~~
         |                                              %llx
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +641 sound/soc/qcom/lpass-platform.c

   595	
   596	static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
   597						 struct snd_pcm_substream *substream)
   598	{
   599		struct snd_pcm_runtime *runtime = substream->runtime;
   600		struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
   601		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
   602		struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
   603		struct snd_pcm_runtime *rt = substream->runtime;
   604		struct lpass_pcm_data *pcm_data = rt->private_data;
   605		const struct lpass_variant *v = drvdata->variant;
   606		struct lpaif_dmactl *dmactl;
   607		struct regmap *map;
   608		int ret, id, ch, dir = substream->stream;
   609		unsigned int dai_id = cpu_dai->driver->id;
   610	
   611		ch = pcm_data->dma_ch;
   612	
   613		dmactl = __lpass_get_dmactl_handle(substream, component);
   614		id = __lpass_get_id(substream, component);
   615		map = __lpass_get_regmap_handle(substream, component);
   616	
   617		ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
   618					runtime->dma_addr);
   619		if (ret) {
   620			dev_err(soc_runtime->dev, "error writing to rdmabase reg: %d\n",
   621				ret);
   622			return ret;
   623		}
   624	
   625		ret = regmap_write(map, LPAIF_DMABUFF_REG(v, ch, dir, dai_id),
   626				(snd_pcm_lib_buffer_bytes(substream) >> 2) - 1);
   627		if (ret) {
   628			dev_err(soc_runtime->dev, "error writing to rdmabuff reg: %d\n",
   629				ret);
   630			return ret;
   631		}
   632	
   633		ret = regmap_write(map, LPAIF_DMAPER_REG(v, ch, dir, dai_id),
   634				(snd_pcm_lib_period_bytes(substream) >> 2) - 1);
   635		if (ret) {
   636			dev_err(soc_runtime->dev, "error writing to rdmaper reg: %d\n",
   637				ret);
   638			return ret;
   639		}
   640		
 > 641		dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
   642	
   643		if (is_cdc_dma_port(dai_id)) {
   644			ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
   645			if (ret) {
   646				dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
   647					ret, id);
   648				return ret;
   649			}
   650		}
   651		ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
   652		if (ret) {
   653			dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
   654				ret);
   655			return ret;
   656		}
   657	
   658		return 0;
   659	}
   660	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
