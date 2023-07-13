Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D317754;
	Thu, 13 Jul 2023 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689259845; x=1720795845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=915bhMfyutTP9zinhbT8vja86UsdrYvNYhlqMI7fEXI=;
  b=clUMm8ciwlreU8QOj3IG/KEt+ktIzTwqboKXdOz+QN7Al0+AgZsI7sLO
   upH8ZhhqcS6e+zsVgb/B+h1DN7FL8p6ep5dFMY5uJPoM+IigEHFykjgP2
   QYo5BMjJ1e2lR73qIIcHaxQYM2PLS0xAZhOnuBPAT4bV9DU52RncTzzUT
   3ntNO2WUGrh/NcG8IVlh2Ld2dJkURP02jbezs5WVTk+KKEBdH6i4MtCCr
   xu3o0g+FMb4jAVSRJ4e6QzIdN+ZorIgZD6p/WTyPRndIg/1+H+JlrmCAE
   A2HYtNdRnPd8lNILiJvs5bYOvtCBNN6KvLunB+6oQx6EdkRRjG5xA6qlv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368756848"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="368756848"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 07:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812013577"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="812013577"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2023 07:16:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJx7m-0006ej-0t;
	Thu, 13 Jul 2023 14:16:54 +0000
Date: Thu, 13 Jul 2023 22:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 38/42] sound/soc/codecs/lpass-tx-macro.c:847:24: warning: variable
 'dmic_clk_reg' is uninitialized when used here
Message-ID: <202307132214.NYeD2XiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   e3b5f5398ba6aa06d39089408493667a98fa0a60
commit: 9e9e574223b5ed43d8d8c9ba0faa1546b6d20919 [38/42] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
config: i386-randconfig-i005-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132214.NYeD2XiY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132214.NYeD2XiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132214.NYeD2XiY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-tx-macro.c:847:24: warning: variable 'dmic_clk_reg' is uninitialized when used here [-Wuninitialized]
                                                       mic_sel_reg, dmic_clk_reg,
                                                                    ^~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:804:18: note: initialize the variable 'dmic_clk_reg' to silence this warning
           u16 dmic_clk_reg;
                           ^
                            = 0
   1 warning generated.


vim +/dmic_clk_reg +847 sound/soc/codecs/lpass-tx-macro.c

   795	
   796	static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
   797					 struct snd_ctl_elem_value *ucontrol)
   798	{
   799		struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
   800		struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
   801		struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
   802		unsigned int val;
   803		u16 mic_sel_reg;
   804		u16 dmic_clk_reg;
   805		struct tx_macro *tx = snd_soc_component_get_drvdata(component);
   806	
   807		val = ucontrol->value.enumerated.item[0];
   808		if (val >= e->items)
   809			return -EINVAL;
   810	
   811		switch (e->reg) {
   812		case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
   813			mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
   814			break;
   815		case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
   816			mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
   817			break;
   818		case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
   819			mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
   820			break;
   821		case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
   822			mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
   823			break;
   824		case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
   825			mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
   826			break;
   827		case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
   828			mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
   829			break;
   830		case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
   831			mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
   832			break;
   833		case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
   834			mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
   835			break;
   836		default:
   837			dev_err(component->dev, "Error in configuration!!\n");
   838			return -EINVAL;
   839		}
   840	
   841		if (val != 0) {
   842			if (widget->shift) /* MSM DMIC */
   843				snd_soc_component_write_field(component, mic_sel_reg,
   844							      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
   845			else if (tx->data->ver <= LPASS_VER_9_0_0)
   846				tx_macro_update_smic_sel_v9(component, widget, tx,
 > 847							    mic_sel_reg, dmic_clk_reg,
   848							    val);
   849			else
   850				tx_macro_update_smic_sel_v9_2(component, widget, tx,
   851							      mic_sel_reg, dmic_clk_reg,
   852							      val);
   853		}
   854	
   855		return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
   856	}
   857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
