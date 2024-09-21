Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181428382;
	Sat, 21 Sep 2024 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726954514; cv=none; b=STROlFyerPrx2pq5rDiL10E9m0R6aIHumXbZRdY4bqCnVkMxigP4SagDrz72f186a25ZCoS36ck8wgoNhdZPQr43qgaibzE2RyGJT2ybIMgQgOpoVpzQQwnboAA5o+0OMQ483JB+xFWTv10T6CvBhUdfZa6OsDnhuLTitgr8whY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726954514; c=relaxed/simple;
	bh=Cg399CoQ5yeAQV9SqcP1fOr6eTdktUGwpwjheEaBP2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upq8gfNkqIJVGrGAeZc2Y1Q95I5vArKVuQVm4WPb9ykn5lK0SXOrkmrC4pZ75rZRJfYhj3kw3bum6wvxbxuiOmfjH1HJh26ShkW/XMZ0rf4oLzSkIRcy+YfKozunvwv3FoJNY11j1EGl5zV8SCWT1yrtnM6LQsuuKsW1palpKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkYZfkVm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkYZfkVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726954512; x=1758490512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cg399CoQ5yeAQV9SqcP1fOr6eTdktUGwpwjheEaBP2Y=;
  b=lkYZfkVm0FbXDqv0IRW+1Jwky3dB9fJBeAk/Q5YQ/66e73zrs+ntCzF3
   yJN59tVeUzZazHBbOtQJDj/Up/lpHdK+S7r98X3CJlJUqXPMw8nSEfLEB
   EUMMEpzRNMsV1HOgm3MASmpRaZJPW6dbsar1eN08M+Pbkq3P4xq6ZZp7O
   u2U+tzXJCUeLXftE67fL8bybHqwb3W6ho8OJCgfVBxJLipow/1OZb/lel
   qbOlecDmUwIz7cLV5DjCCjeqnTC3aBa3gm+EHgYn8+ZfP0ZDJAFKj+NX2
   xy3czD76AqKsRfvDhPqmTke/sbXi8IHZJ0GT1+T7LigwPE8Aaiq6HfybA
   Q==;
X-CSE-ConnectionGUID: 6QoQu5fLRdyxu7KbdnXUwg==
X-CSE-MsgGUID: jfqveDeoRDm5EaQEosLLrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26031915"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="26031915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 14:35:12 -0700
X-CSE-ConnectionGUID: 64csHCMCSr2SIkWg3+jcbQ==
X-CSE-MsgGUID: TD5cWy/xQc+ft4RTB7BXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75216263"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 14:35:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss7ku-000FoQ-2G;
	Sat, 21 Sep 2024 21:35:04 +0000
Date: Sun, 22 Sep 2024 05:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Prusov <ivprusov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@salutedevices.com,
	prusovigor@gmail.com, David Yang <yangxiaohua@everest-semi.com>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add ES7243E ADC driver
Message-ID: <202409220756.5MSHcbg7-lkp@intel.com>
References: <20240920-es7243e-adc-v2-2-0be019735b81@salutedevices.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-es7243e-adc-v2-2-0be019735b81@salutedevices.com>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on baeb9a7d8b60b021d907127509c44507539c15e5]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Prusov/ASoC-dt-bindings-Add-Everest-ES7243E/20240920-235246
base:   baeb9a7d8b60b021d907127509c44507539c15e5
patch link:    https://lore.kernel.org/r/20240920-es7243e-adc-v2-2-0be019735b81%40salutedevices.com
patch subject: [PATCH v2 2/2] ASoC: codecs: add ES7243E ADC driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240922/202409220756.5MSHcbg7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220756.5MSHcbg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220756.5MSHcbg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/es7243e.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/es7243e.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/es7243e.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/codecs/es7243e.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2239:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/es7243e.c:252:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |                 sdpfmt |= FIELD_PREP(ES7243E_SDP_FMT, 0);
         |                           ^
   sound/soc/codecs/es7243e.c:272:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 clk2 |= FIELD_PREP(ES7243E_CLK2_BCLK_INV, 0);
         |                         ^
   sound/soc/codecs/es7243e.c:351:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         val = FIELD_PREP(ES7243E_ADCCTL1_SCALE, cd->scale);
         |               ^
   sound/soc/codecs/es7243e.c:405:18: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     405 |         const int val = FIELD_PREP(ES7243E_SDP_MUTE, 3 * !!mute);
         |                         ^
   sound/soc/codecs/es7243e.c:514:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     514 |         val = FIELD_PREP(ES7243E_SDP_MUTE, 0);
         |               ^
   sound/soc/codecs/es7243e.c:570:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     570 |         val = FIELD_PREP(ES7243E_PGA1_EN, 1);
         |               ^
   7 warnings and 6 errors generated.


vim +/FIELD_PREP +252 sound/soc/codecs/es7243e.c

   239	
   240	static int es7243e_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
   241	{
   242		struct snd_soc_component *component = dai->component;
   243		unsigned int sdpfmt = 0;
   244		unsigned int clk2 = 0;
   245		bool is_dsp = false;
   246		bool invert_lrck = false;
   247		int ret;
   248	
   249		/* Set protocol of the serial data port */
   250		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   251		case SND_SOC_DAIFMT_I2S:
 > 252			sdpfmt |= FIELD_PREP(ES7243E_SDP_FMT, 0);
   253			break;
   254		case SND_SOC_DAIFMT_LEFT_J:
   255			sdpfmt |= FIELD_PREP(ES7243E_SDP_FMT, 1);
   256			break;
   257		case SND_SOC_DAIFMT_DSP_A:
   258			sdpfmt |= FIELD_PREP(ES7243E_SDP_FMT, 3);
   259			is_dsp = true;
   260			break;
   261		case SND_SOC_DAIFMT_DSP_B:
   262			sdpfmt |= FIELD_PREP(ES7243E_SDP_FMT, 3);
   263			is_dsp = true;
   264			break;
   265		default:
   266			return -EINVAL;
   267		}
   268	
   269		/* Set LR and BCLK polarity */
   270		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   271		case SND_SOC_DAIFMT_NB_NF:
   272			clk2 |= FIELD_PREP(ES7243E_CLK2_BCLK_INV, 0);
   273			sdpfmt |= FIELD_PREP(ES7243E_SDP_LRP, 0);
   274			break;
   275		case SND_SOC_DAIFMT_IB_IF:
   276			clk2 |= FIELD_PREP(ES7243E_CLK2_BCLK_INV, 1);
   277			sdpfmt |= FIELD_PREP(ES7243E_SDP_LRP, 1);
   278			invert_lrck = true;
   279			break;
   280		case SND_SOC_DAIFMT_IB_NF:
   281			clk2 |= FIELD_PREP(ES7243E_CLK2_BCLK_INV, 1);
   282			sdpfmt |= FIELD_PREP(ES7243E_SDP_LRP, 0);
   283			break;
   284		case SND_SOC_DAIFMT_NB_IF:
   285			clk2 |= FIELD_PREP(ES7243E_CLK2_BCLK_INV, 0);
   286			sdpfmt |= FIELD_PREP(ES7243E_SDP_LRP, 1);
   287			invert_lrck = true;
   288			break;
   289		default:
   290			return -EINVAL;
   291		}
   292	
   293		/* Inverted LRCK is not available in DSP mode. */
   294		if (is_dsp && invert_lrck)
   295			return -EINVAL;
   296	
   297		ret = snd_soc_component_update_bits(component, ES7243E_CLK2,
   298						    ES7243E_CLK2_BCLK_INV, clk2);
   299		if (ret < 0)
   300			return ret;
   301	
   302		return snd_soc_component_update_bits(component, ES7243E_SDP,
   303						     ES7243E_SDP_LRP, sdpfmt);
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
