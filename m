Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDD3F8E0D;
	Fri, 27 Mar 2026 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632960; cv=none; b=lFzGovkvOaY/umzC+EQteZQIenCDkj5YPIhSpN7fz3rtQLYTx2Wz78VISCbT9TNo/VOGVNUJSbxAFBLuLa/m5FIE01S6jCRpHpHwq8KstUJPDu+nX90Nzs8t6qw7H08XX3kNWwHiRjwM0urCnaB3blqd5BEM0TfFizQhWYSOwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632960; c=relaxed/simple;
	bh=CJUSl2idgF/8gpsDPtg++lRvo+B/MOMTwUOP6MMZMbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ATGUvZPH7D+35WoCbAdv6Xa3y92eoAMzEiDvif2tFnIJ6BQEyWdud7bslu9fGg2TGaZ2ijZ/v14vbqZD9ZisC9MobJZClBoESZnwkmdJuzzGiP3vJk5O3nuGzAdfB1naPjhnCJjAouZ48wg3WfdqKwXGYz0KFu3BoDKv3addYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asqmaShU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asqmaShU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774632958; x=1806168958;
  h=date:from:to:cc:subject:message-id;
  bh=CJUSl2idgF/8gpsDPtg++lRvo+B/MOMTwUOP6MMZMbs=;
  b=asqmaShU0ajpfvNsSqvS92zpC/dVg+yIuYG0WZ+VcOHl7tNge8PksLTj
   ims18qrYIQRSc5/UR/31K7Ws/t/DelaSUv2GWeSoVu7XK9G9cOTDzRtLs
   JWyziy+kw0r4rkA4DIdHQfRMNJ9GA8fOzYAezSMAIKa/b4HOocBFWNXzv
   o56y91FIvSFLy+j3QA8q4G0vUhEdFhPHY0onb7tsvOiseHN/fgwlDv9Sc
   TtQc4XPcYzeFk4ol9hTOHu9WC4jg3f2XFf1s3C5IXn+xP4FlEL0ZsUv7X
   YQKVwk+eDute5GugtNawFiBTw9Efwl2AAysoLThtKoKbHgyhyM+CeUGaZ
   Q==;
X-CSE-ConnectionGUID: JzEZsV1aSXmapYcH1WMhwQ==
X-CSE-MsgGUID: cm/ktp2vTqyEQ2g1kyGbFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75603536"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75603536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:35:58 -0700
X-CSE-ConnectionGUID: mvSI/KEKRoGyobyfgXC2yg==
X-CSE-MsgGUID: OQhOrmm/RZaGJMXB5A6DZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222050440"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 10:35:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6B69-00000000AXB-2FwJ;
	Fri, 27 Mar 2026 17:35:53 +0000
Date: Sat, 28 Mar 2026 01:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 95/106]
 sound/soc/pxa/mmp-sspa.c:110:23: error: call to undeclared function
 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603280124.IoW0q20u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 09f6604cc02792c7e69777d60b23ac6314ee428c [95/106] dai
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603280124.IoW0q20u-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280124.IoW0q20u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280124.IoW0q20u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/mmp-sspa.c:110:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:110:23: note: did you mean 'snd_soc_dapm_to_dev'?
   include/sound/soc-dapm.h:643:16: note: 'snd_soc_dapm_to_dev' declared here
     643 | struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
         |                ^
>> sound/soc/pxa/mmp-sspa.c:110:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     110 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:138:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:138:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     138 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:216:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:216:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     216 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:327:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:327:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     327 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~
   8 errors generated.


vim +/snd_soc_dai_to_dev +110 sound/soc/pxa/mmp-sspa.c

   102	
   103	/*
   104	 * Set the SSP ports SYSCLK.
   105	 */
   106	static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
   107					    int clk_id, unsigned int freq, int dir)
   108	{
   109		struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 > 110		struct device *dev = snd_soc_dai_to_dev(cpu_dai);
   111		int ret = 0;
   112	
   113		if (dev->of_node)
   114			return -ENOTSUPP;
   115	
   116		switch (clk_id) {
   117		case MMP_SSPA_CLK_AUDIO:
   118			ret = clk_set_rate(sspa->audio_clk, freq);
   119			if (ret)
   120				return ret;
   121			break;
   122		case MMP_SSPA_CLK_PLL:
   123		case MMP_SSPA_CLK_VCXO:
   124			/* not support yet */
   125			return -EINVAL;
   126		default:
   127			return -EINVAL;
   128		}
   129	
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
