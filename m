Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258957333;
	Fri, 19 Jan 2024 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705698559; cv=none; b=n/6RpHtEQcsJI3pbcTj9TrHq2znyoeYpB0lsVY8wsvUY1XTha2M6+sKi27BYhSoTHCYHjP8yCjtknyyXNqfOfsdhYGgBmfTuqzfhFsiqtap2q0nJFmcsm6NKLKljYOaCvDUp3GFvXsB+rT06zvUlac/iYqCT6A8HYVbPREn8yOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705698559; c=relaxed/simple;
	bh=JIeqxWnSPTVGfUWEgZhjqCsH1GMRTzp0QV1UtpXuSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZBldNfoYdpZVF2wfggV0uwOUtoftgbpuGl7XtP0RvQnvxIKM/znkE7yDgSO0WQVIC2g6XJIReO8bxhii89rQiBREqB0i7uKK+8O6gBwqpMVYK3dc5Z3odM2EOVPk4fAxQbhqfs6f67I1QBa4W3/cidzSfwafQqd8FthpNdN3XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqFK2+Tp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqFK2+Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705698558; x=1737234558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIeqxWnSPTVGfUWEgZhjqCsH1GMRTzp0QV1UtpXuSrM=;
  b=XqFK2+Tpa4LJJOMZ+oEMs35DAZZTv6mkoFEgjpU9pd9rM0JFdgVrkHZu
   zmBd5SEr5F5IglukMCxK+7X+mhQ2xYZ/JkiimKEeVvonedQ5Qecabhr9W
   ulTIS714l2ypqzdBQg4ya4Pbqkt2DXLvwswmRd7PJHM8hBFipHtxHLarf
   OoxtMI+j9ii54mpRAo8xUker7S1sZ6HZkMuHQ9j34jNW5Gf/StZEE8UK1
   l6b/YwhwBccAYFdjXgSkMt1qgnwKA825H3xWPBYlQtX90h0+QZpAvPv2R
   TmOveA36eth85cNVeWFxkB0r00pHDQkhCYFm69oxC7s2GAR1SWKDJTJtl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19413538"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="19413538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 13:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908427237"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="908427237"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2024 13:09:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQw6z-0004Qc-0a;
	Fri, 19 Jan 2024 21:09:13 +0000
Date: Sat, 20 Jan 2024 05:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15/30] sound/soc/qcom/lpass.h:43:7: error: use of undeclared identifier
 'LPASS_CDC_DMA_RX0'
Message-ID: <202401200528.iSlkIgkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: 09ac587b4c3759cc859d282118bf963cbdfc17ac [15/30] UPSTREAM: ASoC: qcom: reduce number of binding headers includes
config: arm-randconfig-001-20240118 (https://download.01.org/0day-ci/archive/20240120/202401200528.iSlkIgkO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200528.iSlkIgkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200528.iSlkIgkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/qcom/lpass-ipq806x.c:21:
>> sound/soc/qcom/lpass.h:43:7: error: use of undeclared identifier 'LPASS_CDC_DMA_RX0'
           case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
                ^
>> sound/soc/qcom/lpass.h:44:7: error: use of undeclared identifier 'LPASS_CDC_DMA_TX0'
           case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
                ^
>> sound/soc/qcom/lpass.h:45:7: error: use of undeclared identifier 'LPASS_CDC_DMA_VA_TX0'
           case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
                ^
   sound/soc/qcom/lpass.h:54:7: error: use of undeclared identifier 'LPASS_CDC_DMA_RX0'
           case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
                ^
   sound/soc/qcom/lpass.h:55:7: error: use of undeclared identifier 'LPASS_CDC_DMA_TX0'
           case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
                ^
   5 errors generated.


vim +/LPASS_CDC_DMA_RX0 +43 sound/soc/qcom/lpass.h

7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  32  
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  33  #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  34  	do { \
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  35  		mf = devm_regmap_field_alloc(d, m, f);     \
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  36  		if (IS_ERR(mf))                \
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  37  			return -EINVAL;         \
7cb37b7bd0d3c93 V Sujith Kumar Reddy    2020-10-08  38  	} while (0)
cd59f13823ae65a Kenneth Westfield       2015-03-03  39  
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  40  static inline bool is_cdc_dma_port(int dai_id)
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  41  {
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  42  	switch (dai_id) {
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24 @43  	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24 @44  	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24 @45  	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  46  		return true;
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  47  	}
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  48  	return false;
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  49  }
dc8d9766bc03efe Srinivasa Rao Mandadapu 2022-02-24  50  

:::::: The code at line 43 was first introduced by commit
:::::: dc8d9766bc03efee4d1b6dd912659858fdf981de ASoC: qcom: Add register definition for codec rddma and wrdma

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
