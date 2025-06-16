Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB321771C;
	Mon, 16 Jun 2025 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110247; cv=none; b=K44HWZcWKsh7VJheBxD4XeDVhXzNxlx1kNbWZwRKpZKTB/84esD0R5bGcjLTbGD34q3TiJ7kVcael7m1S8NFxGe1dZsoEK1Q6Y7B78neMDcRvnEvOAzaatjuiwTnYiYRTzBMXwA6O+SZbDqfhAun/jeRlAb9wJOrHbvL3GYNan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110247; c=relaxed/simple;
	bh=xYYpqS/yph36XxhA3NcFXjRZd9tgbaOoOaVpX+T/0Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1fCQml0SHQ/w2e4AKaXGMcm06ndd/J4D+C8JH3zxvqJh31iAlCzYNFptyE3Wao1C8hZt3Wv1lgYjIXkhqRmkwBhslPi4V05fhC4SnZfVly4yLVeObTfxFajtxaW7A/nghNptdNNjR2LKVEraK5mwSfyzQQJiIbCy9DO0Vb99UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMTFQkDx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMTFQkDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750110245; x=1781646245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYYpqS/yph36XxhA3NcFXjRZd9tgbaOoOaVpX+T/0Io=;
  b=YMTFQkDx7QgmeJDSvxn0rFhUJril8BPPDhMu6gu1gH7cB9LPecb0JM60
   yijWGnAaloIfhfbNHW+yUV5rVQp0eoLCtfBfY/WVhdiQyuLs/l7P0HTMv
   bEEsAD+onMw15hbzoYAUn6uHYgLJ1a1A+yvXIEyL2I4EJjwCTDqC430az
   t1Uf21/MOyBxEfz/XgurxoAkWPCtcasSlQ3jmDaozub4X7AkqrTkaMGzE
   BjxleuFj2qorMz9p71H5qoIE3HIDKyPGbSO+n/eQCnv3GHrWpl5p2WMVS
   omxD0e4LDS9LVlHLfCUtYSyCjF7WWpO6B1VdGXMaCll32uNXyUL3/JAS7
   Q==;
X-CSE-ConnectionGUID: ZBuLc6GuS/i5QE7dNX2inA==
X-CSE-MsgGUID: iTB1ro0qR1GBmjw+Y4d/yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63617750"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="63617750"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 14:44:04 -0700
X-CSE-ConnectionGUID: vHU7Fvn+SJGtVdBa49IXpQ==
X-CSE-MsgGUID: tqYFuWpwRCy4d73JFrkpxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179578915"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2025 14:44:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRHcX-000FNI-0I;
	Mon, 16 Jun 2025 21:44:01 +0000
Date: Tue, 17 Jun 2025 05:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-06-12 83/85]
 sound/soc/intel/avs/boards/rt5640.c:70:12: error: member reference type
 'struct snd_soc_dapm_context *' is a pointer; did you mean to use '->'?
Message-ID: <202506170540.br7XFfZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-06-12
head:   1d90fbcaa764745c6048fb1f9145b0d1663f861e
commit: 5c652408212f6180dfe7664ea31c1b03e864ca55 [83/85] ASoC: soc-dapm: add snd_soc_dapm_alloc()
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250617/202506170540.br7XFfZ5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170540.br7XFfZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170540.br7XFfZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/boards/rt5640.c:13:
   In file included from include/sound/soc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/intel/avs/boards/rt5640.c:70:12: error: member reference type 'struct snd_soc_dapm_context *' is a pointer; did you mean to use '->'?
      70 |         card->dapm.idle_bias_off = true;
         |         ~~~~~~~~~~^
         |                   ->
   sound/soc/intel/avs/boards/rt5640.c:70:13: error: no member named 'idle_bias_off' in 'struct snd_soc_dapm_context'; did you mean 'idle_bias'?
      70 |         card->dapm.idle_bias_off = true;
         |                    ^~~~~~~~~~~~~
         |                    idle_bias
   include/sound/soc-dapm.h:587:7: note: 'idle_bias' declared here
     587 |         bool idle_bias;                         /* Use BIAS_OFF instead of STANDBY when false */
         |              ^
   1 warning and 2 errors generated.


vim +70 sound/soc/intel/avs/boards/rt5640.c

c95e925daa434e Cezary Rojewski 2025-05-30  48  
c95e925daa434e Cezary Rojewski 2025-05-30  49  static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
c95e925daa434e Cezary Rojewski 2025-05-30  50  {
c95e925daa434e Cezary Rojewski 2025-05-30  51  	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
c95e925daa434e Cezary Rojewski 2025-05-30  52  	struct snd_soc_card *card = runtime->card;
c95e925daa434e Cezary Rojewski 2025-05-30  53  	struct snd_soc_jack_pin *pins;
c95e925daa434e Cezary Rojewski 2025-05-30  54  	struct snd_soc_jack *jack;
c95e925daa434e Cezary Rojewski 2025-05-30  55  	int num_pins, ret;
c95e925daa434e Cezary Rojewski 2025-05-30  56  
c95e925daa434e Cezary Rojewski 2025-05-30  57  	jack = snd_soc_card_get_drvdata(card);
c95e925daa434e Cezary Rojewski 2025-05-30  58  	num_pins = ARRAY_SIZE(card_headset_pins);
c95e925daa434e Cezary Rojewski 2025-05-30  59  
c95e925daa434e Cezary Rojewski 2025-05-30  60  	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  61  	if (!pins)
c95e925daa434e Cezary Rojewski 2025-05-30  62  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  63  
c95e925daa434e Cezary Rojewski 2025-05-30  64  	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET, jack, pins,
c95e925daa434e Cezary Rojewski 2025-05-30  65  					 num_pins);
c95e925daa434e Cezary Rojewski 2025-05-30  66  	if (ret)
c95e925daa434e Cezary Rojewski 2025-05-30  67  		return ret;
c95e925daa434e Cezary Rojewski 2025-05-30  68  
c95e925daa434e Cezary Rojewski 2025-05-30  69  	snd_soc_component_set_jack(codec_dai->component, jack, NULL);
c95e925daa434e Cezary Rojewski 2025-05-30 @70  	card->dapm.idle_bias_off = true;
c95e925daa434e Cezary Rojewski 2025-05-30  71  
c95e925daa434e Cezary Rojewski 2025-05-30  72  	return 0;
c95e925daa434e Cezary Rojewski 2025-05-30  73  }
c95e925daa434e Cezary Rojewski 2025-05-30  74  

:::::: The code at line 70 was first introduced by commit
:::::: c95e925daa434ee1a40a86aec6476ce588e4bd77 ASoC: Intel: avs: Add rt5640 machine board

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
