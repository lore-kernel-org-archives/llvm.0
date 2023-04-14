Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F263DC;
	Fri, 14 Apr 2023 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681503372; x=1713039372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJnIbU+555sjDhir4kYwr+Pnn4S1ezPNx+nzAlJyneY=;
  b=CxZBcsK1l7Jhg84SP1gMpqsH/uwN1ggrrHFCB6rc2ScxEXaWtVbQNPhB
   aEsDyPru7hq5lBuu5wSGnmZwNsVdT1Wt/+Wyeyhxqo9gXCTaTrC3ykIuP
   EuG6R+0L4wclMTjD8UEWS7dBqC2E70OGCF8x2AhjXtS1XW+NFc228WY20
   h5t80xV0ksAtRHvDai8Td45TbxHdjghX1m2fwwQgSQQIvatZY9xMw9dDb
   xMIC4l1z6vnHy+Zfm8LQ+p9jEjtd2VBLqKJluxkejx4NyNd3pOpJlqjj/
   PYZoVFnXhQP3urym8jn39uEhWqBv06jNdDpRzg15nxabTL/8yCvEAEVZd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407445567"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="407445567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 13:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="814016916"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="814016916"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 13:15:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnPpi-000ZuF-24;
	Fri, 14 Apr 2023 20:15:46 +0000
Date: Sat, 15 Apr 2023 04:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Lin <CTLIN0@nuvoton.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 440/441] sound/soc/codecs/nau8825.c:2826:31:
 warning: overlapping comparisons always evaluate to false
Message-ID: <202304150432.zdu6MCpg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   813cca73b7c2b3cbb6ff4b2b6d515035318d690a
commit: fc0b096c92918c2ba4d76411ea763fdeb2ef6b0d [440/441] ASoC: nau8825: Add delay control for input path
config: arm-randconfig-r046-20230412 (https://download.01.org/0day-ci/archive/20230415/202304150432.zdu6MCpg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=fc0b096c92918c2ba4d76411ea763fdeb2ef6b0d
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
        git fetch --no-tags broonie-sound for-next
        git checkout fc0b096c92918c2ba4d76411ea763fdeb2ef6b0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150432.zdu6MCpg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/nau8825.c:2826:31: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
           if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2826 sound/soc/codecs/nau8825.c

  2757	
  2758	static int nau8825_read_device_properties(struct device *dev,
  2759		struct nau8825 *nau8825) {
  2760		int ret;
  2761	
  2762		nau8825->jkdet_enable = device_property_read_bool(dev,
  2763			"nuvoton,jkdet-enable");
  2764		nau8825->jkdet_pull_enable = device_property_read_bool(dev,
  2765			"nuvoton,jkdet-pull-enable");
  2766		nau8825->jkdet_pull_up = device_property_read_bool(dev,
  2767			"nuvoton,jkdet-pull-up");
  2768		ret = device_property_read_u32(dev, "nuvoton,jkdet-polarity",
  2769			&nau8825->jkdet_polarity);
  2770		if (ret)
  2771			nau8825->jkdet_polarity = 1;
  2772		ret = device_property_read_u32(dev, "nuvoton,micbias-voltage",
  2773			&nau8825->micbias_voltage);
  2774		if (ret)
  2775			nau8825->micbias_voltage = 6;
  2776		ret = device_property_read_u32(dev, "nuvoton,vref-impedance",
  2777			&nau8825->vref_impedance);
  2778		if (ret)
  2779			nau8825->vref_impedance = 2;
  2780		ret = device_property_read_u32(dev, "nuvoton,sar-threshold-num",
  2781			&nau8825->sar_threshold_num);
  2782		if (ret)
  2783			nau8825->sar_threshold_num = 4;
  2784		ret = device_property_read_u32_array(dev, "nuvoton,sar-threshold",
  2785			nau8825->sar_threshold, nau8825->sar_threshold_num);
  2786		if (ret) {
  2787			nau8825->sar_threshold[0] = 0x08;
  2788			nau8825->sar_threshold[1] = 0x12;
  2789			nau8825->sar_threshold[2] = 0x26;
  2790			nau8825->sar_threshold[3] = 0x73;
  2791		}
  2792		ret = device_property_read_u32(dev, "nuvoton,sar-hysteresis",
  2793			&nau8825->sar_hysteresis);
  2794		if (ret)
  2795			nau8825->sar_hysteresis = 0;
  2796		ret = device_property_read_u32(dev, "nuvoton,sar-voltage",
  2797			&nau8825->sar_voltage);
  2798		if (ret)
  2799			nau8825->sar_voltage = 6;
  2800		ret = device_property_read_u32(dev, "nuvoton,sar-compare-time",
  2801			&nau8825->sar_compare_time);
  2802		if (ret)
  2803			nau8825->sar_compare_time = 1;
  2804		ret = device_property_read_u32(dev, "nuvoton,sar-sampling-time",
  2805			&nau8825->sar_sampling_time);
  2806		if (ret)
  2807			nau8825->sar_sampling_time = 1;
  2808		ret = device_property_read_u32(dev, "nuvoton,short-key-debounce",
  2809			&nau8825->key_debounce);
  2810		if (ret)
  2811			nau8825->key_debounce = 3;
  2812		ret = device_property_read_u32(dev, "nuvoton,jack-insert-debounce",
  2813			&nau8825->jack_insert_debounce);
  2814		if (ret)
  2815			nau8825->jack_insert_debounce = 7;
  2816		ret = device_property_read_u32(dev, "nuvoton,jack-eject-debounce",
  2817			&nau8825->jack_eject_debounce);
  2818		if (ret)
  2819			nau8825->jack_eject_debounce = 0;
  2820		nau8825->xtalk_enable = device_property_read_bool(dev,
  2821			"nuvoton,crosstalk-enable");
  2822		nau8825->adcout_ds = device_property_read_bool(dev, "nuvoton,adcout-drive-strong");
  2823		ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms", &nau8825->adc_delay);
  2824		if (ret)
  2825			nau8825->adc_delay = 125;
> 2826		if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
  2827			dev_warn(dev, "Please set the suitable delay time!\n");
  2828	
  2829		nau8825->mclk = devm_clk_get(dev, "mclk");
  2830		if (PTR_ERR(nau8825->mclk) == -EPROBE_DEFER) {
  2831			return -EPROBE_DEFER;
  2832		} else if (PTR_ERR(nau8825->mclk) == -ENOENT) {
  2833			/* The MCLK is managed externally or not used at all */
  2834			nau8825->mclk = NULL;
  2835			dev_info(dev, "No 'mclk' clock found, assume MCLK is managed externally");
  2836		} else if (IS_ERR(nau8825->mclk)) {
  2837			return -EINVAL;
  2838		}
  2839	
  2840		return 0;
  2841	}
  2842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
