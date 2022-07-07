Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC28367
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657197345; x=1688733345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vb4JgKVY255rSl/9xFYzOuGudEolSqtfkjLqdmRt0X0=;
  b=PWZkIoO3092rqF8DY5RCpEbLsGjXz3m7M03N4OUjOKput3EPVn9Ewiy+
   OD6CmPl0i8fbapw7B5Y0i2FeMEC92/L8qxMzwjggOtYs9LWEPy4zjLS/U
   H6NDU7gePCVX5iepsvW276M3y7d/n46VIkj3b42bdjorCnVuDQQboPRwi
   VzHy85dmtc0Rtkdks8BoSpfrfDDzFkU4j2XuWZ9UORNwqt5c+KslVXQ4t
   2wfPGz6iD4ex5bWiOIXa4blrFFGhH8GtGTNzqR+RUObXurX0A6iq1P7Og
   pHg/2oYek4vd3mDQkD55Lwf2DEXb3DJfSpB06NkXkptnaSo9FwkalBG+s
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="345702183"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="345702183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 05:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="568502221"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2022 05:35:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9QjO-000M0I-81;
	Thu, 07 Jul 2022 12:35:42 +0000
Date: Thu, 7 Jul 2022 20:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Zhu Ning <zhuning0077@gmail.com>,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	broonie@kernel.org, David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202207072002.QTXsBBqR-lkp@intel.com>
References: <20220707011856.10841-1-zhuning0077@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707011856.10841-1-zhuning0077@gmail.com>

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-randconfig-r014-20220707 (https://download.01.org/0day-ci/archive/20220707/202207072002.QTXsBBqR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/fda793f4ec55b33955344b93a8c290fe207d54d4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
        git checkout fda793f4ec55b33955344b93a8c290fe207d54d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/qcom/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:612:13: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           if((reg && ES8326_VERSION_B) == 1)
                      ^
   sound/soc/codecs/es8326.h:185:29: note: expanded from macro 'ES8326_VERSION_B'
   #define ES8326_VERSION_B (1 << 0)
                               ^
   1 warning generated.


vim +612 sound/soc/codecs/es8326.c

   531	
   532	static struct snd_soc_dai_driver es8326_dai = {
   533		.name = "ES8326 HiFi",
   534		.playback = {
   535			.stream_name = "Playback",
   536			.channels_min = 1,
   537			.channels_max = 2,
   538			.rates = es8326_RATES,
   539			.formats = es8326_FORMATS,
   540			},
   541		.capture = {
   542			.stream_name = "Capture",
   543			.channels_min = 1,
   544			.channels_max = 2,
   545			.rates = es8326_RATES,
   546			.formats = es8326_FORMATS,
   547			},
   548		.ops = &es8326_ops,
   549		.symmetric_rate = 1,
   550	};
   551	static int es8326_resume(struct snd_soc_component *component)
   552	{
   553		struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
   554	
   555		regmap_write(es8326->regmap, ES8326_CLK_CTL_01, ES8326_CLK_ON);
   556		/* Two channel ADC */
   557		regmap_write(es8326->regmap, ES8326_PULLUP_CTL_F9, 0x02);
   558		regmap_write(es8326->regmap, ES8326_CLK_INV_02, 0x00);
   559		regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC_0C, 0x1F);
   560		regmap_write(es8326->regmap, ES8326_CLK_VMIDS1_10, 0xC8);
   561		regmap_write(es8326->regmap, ES8326_CLK_VMIDS2_11, 0x88);
   562		regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME_12, 0x20);
   563		regmap_write(es8326->regmap, ES8326_SYS_BIAS_1D, 0x08);
   564		regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0x22);
   565		regmap_write(es8326->regmap, ES8326_ADC1_SRC_2A, es8326->mic1_src);
   566		regmap_write(es8326->regmap, ES8326_ADC2_SRC_2B, es8326->mic2_src);
   567		regmap_write(es8326->regmap, ES8326_HPJACK_TIMER_56, 0x88);
   568		regmap_write(es8326->regmap, ES8326_HP_DET_57,
   569			     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
   570		regmap_write(es8326->regmap, ES8326_INT_SOURCE_58, 0x08);
   571		regmap_write(es8326->regmap, ES8326_INTOUT_IO_59, 0x45);
   572		regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_CSM_ON);
   573		snd_soc_component_update_bits(component, ES8326_PAGGAIN_23,
   574					      ES8326_MIC_SEL_MASK, ES8326_MIC1_SEL);
   575	
   576		es8326_irq(es8326->irq, es8326);
   577		return 0;
   578	}
   579	static int es8326_probe(struct snd_soc_component *component)
   580	{
   581		struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
   582		int ret;
   583		u8 reg;
   584	
   585		es8326->component = component;
   586		es8326->jd_inverted = device_property_read_bool(component->dev,
   587								"everest,jack-detect-inverted");
   588	
   589		ret = device_property_read_u8(component->dev, "everest,mic1-src", &es8326->mic1_src);
   590		if (ret != 0) {
   591			dev_dbg(component->dev, "mic1-src return %d", ret);
   592			es8326->mic1_src = ES8326_ADC_AMIC;
   593		}
   594		dev_dbg(component->dev, "mic1-src %x", es8326->mic1_src);
   595	
   596		ret = device_property_read_u8(component->dev, "everest,mic2-src", &es8326->mic2_src);
   597		if (ret != 0) {
   598			dev_dbg(component->dev, "mic2-src return %d", ret);
   599			es8326->mic2_src = ES8326_ADC_DMIC;
   600		}
   601		dev_dbg(component->dev, "mic2-src %x", es8326->mic2_src);
   602	
   603		ret = device_property_read_u8(component->dev, "everest,jack-pol", &es8326->jack_pol);
   604		if (ret != 0) {
   605			dev_dbg(component->dev, "jack-pol return %d", ret);
   606			es8326->jack_pol = ES8326_HP_DET_BUTTON_POL | ES8326_HP_TYPE_OMTP;
   607		}
   608		dev_dbg(component->dev, "jack-pol %x", es8326->jack_pol);
   609	
   610		es8326_resume(component);
   611		reg = snd_soc_component_read(component, ES8326_CHIP_VERSION_FF);
 > 612		if((reg && ES8326_VERSION_B) == 1)
   613		{
   614			regmap_write(es8326->regmap, ES8326_ANA_VSEL_1C, 0x7F);
   615			regmap_write(es8326->regmap, ES8326_VMIDLOW_22, 0x0F);
   616			regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0xAA);
   617			regmap_write(es8326->regmap, ES8326_HP_DRVIER_24, 0x20);
   618		}
   619		return 0;
   620	}
   621	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
