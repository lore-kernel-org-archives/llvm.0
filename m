Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D57FE
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652697811; x=1684233811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bq57x6TVD4fbOFuNt0pXx4+SkjFnfxJO4hgo5uenDQs=;
  b=VLPWndZc76Xg5imvQMdlcO+zRpDUFjaYzhUsEzIYDBj3WBtSQvX1OXC6
   M0NeSmJchR3B5gX9bSLxeGOY+AeR6kRI+AGQHq33JCcePHv5ee3U+ySkf
   unSOz6WCPymfWwSlR/oNDoDJTaUiKuYM/iPlm9FDRPMj1BhoQcv+POLIa
   O82PF7i64+Tps0mWkqUMUHzrFLd5v6ZrTAlKMPi7BTDVWOiK6dkAKvV50
   04dQ6mp4AwViX0660z5gKQW7awV36kVXIuZKzYQM//1PUqD8yB3COtaZP
   DhyAHKBjsSdu/oiDS60Cb8WIhqLrHgYf0aKlcDOzHzZ5C5jKlc47ebLOr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269620304"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="269620304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="672290564"
Received: from lkp-server02.sh.intel.com (HELO 0628dcddc537) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 May 2022 03:43:27 -0700
Received: from kbuild by 0628dcddc537 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqYCE-000018-Gj;
	Mon, 16 May 2022 10:43:26 +0000
Date: Mon, 16 May 2022 18:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Moon <linux.amoon@gmail.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv2 4/6] thermal: exynos: fixed the efuse min/max value for
 exynos5422
Message-ID: <202205161820.8rHIcsvI-lkp@intel.com>
References: <20220515064126.1424-5-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220515064126.1424-5-linux.amoon@gmail.com>

Hi Anand,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ec7f49619d8ee13e108740c82f942cd401b989e9]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/Exynos-Thermal-code-inprovement/20220515-144336
base:   ec7f49619d8ee13e108740c82f942cd401b989e9
config: hexagon-randconfig-r033-20220516 (https://download.01.org/0day-ci/archive/20220516/202205161820.8rHIcsvI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eb50b0c2100fabd6d09b87abd11f52c5295512e8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anand-Moon/Exynos-Thermal-code-inprovement/20220515-144336
        git checkout eb50b0c2100fabd6d09b87abd11f52c5295512e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/thermal/samsung/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/thermal/samsung/exynos_tmu.c:929:40: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
                   if (data->soc == SOC_ARCH_EXYNOS5420 &&
                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   1 warning generated.


vim +929 drivers/thermal/samsung/exynos_tmu.c

   865	
   866	static int exynos_map_dt_data(struct platform_device *pdev)
   867	{
   868		struct exynos_tmu_data *data = platform_get_drvdata(pdev);
   869		struct resource res;
   870	
   871		if (!data || !pdev->dev.of_node)
   872			return -ENODEV;
   873	
   874		data->id = of_alias_get_id(pdev->dev.of_node, "tmuctrl");
   875		if (data->id < 0)
   876			data->id = 0;
   877	
   878		data->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
   879		if (data->irq <= 0) {
   880			dev_err(&pdev->dev, "failed to get IRQ\n");
   881			return -ENODEV;
   882		}
   883	
   884		if (of_address_to_resource(pdev->dev.of_node, 0, &res)) {
   885			dev_err(&pdev->dev, "failed to get Resource 0\n");
   886			return -ENODEV;
   887		}
   888	
   889		data->base = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
   890		if (!data->base) {
   891			dev_err(&pdev->dev, "Failed to ioremap memory\n");
   892			return -EADDRNOTAVAIL;
   893		}
   894	
   895		data->soc = (enum soc_type)of_device_get_match_data(&pdev->dev);
   896	
   897		switch (data->soc) {
   898		case SOC_ARCH_EXYNOS4210:
   899			data->tmu_set_trip_temp = exynos4210_tmu_set_trip_temp;
   900			data->tmu_set_trip_hyst = exynos4210_tmu_set_trip_hyst;
   901			data->tmu_initialize = exynos4210_tmu_initialize;
   902			data->tmu_control = exynos4210_tmu_control;
   903			data->tmu_read = exynos4210_tmu_read;
   904			data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
   905			data->ntrip = 4;
   906			data->gain = 15;
   907			data->reference_voltage = 7;
   908			data->efuse_value = 55;
   909			data->min_efuse_value = 40;
   910			data->max_efuse_value = 100;
   911			break;
   912		case SOC_ARCH_EXYNOS3250:
   913		case SOC_ARCH_EXYNOS4412:
   914		case SOC_ARCH_EXYNOS5250:
   915		case SOC_ARCH_EXYNOS5260:
   916		case SOC_ARCH_EXYNOS5420:
   917		case SOC_ARCH_EXYNOS5420_TRIMINFO:
   918			data->tmu_set_trip_temp = exynos4412_tmu_set_trip_temp;
   919			data->tmu_set_trip_hyst = exynos4412_tmu_set_trip_hyst;
   920			data->tmu_initialize = exynos4412_tmu_initialize;
   921			data->tmu_control = exynos4210_tmu_control;
   922			data->tmu_read = exynos4412_tmu_read;
   923			data->tmu_set_emulation = exynos4412_tmu_set_emulation;
   924			data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
   925			data->ntrip = 4;
   926			data->gain = 8;
   927			data->reference_voltage = 16;
   928			data->efuse_value = 55;
 > 929			if (data->soc == SOC_ARCH_EXYNOS5420 &&
   930			    data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
   931				data->min_efuse_value = 16;
   932				data->max_efuse_value = 76;
   933			} else {
   934				data->min_efuse_value = 40;
   935				data->max_efuse_value = 100;
   936			}
   937			break;
   938		case SOC_ARCH_EXYNOS5433:
   939			data->tmu_set_trip_temp = exynos5433_tmu_set_trip_temp;
   940			data->tmu_set_trip_hyst = exynos5433_tmu_set_trip_hyst;
   941			data->tmu_initialize = exynos5433_tmu_initialize;
   942			data->tmu_control = exynos5433_tmu_control;
   943			data->tmu_read = exynos4412_tmu_read;
   944			data->tmu_set_emulation = exynos4412_tmu_set_emulation;
   945			data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
   946			data->ntrip = 8;
   947			data->gain = 8;
   948			if (res.start == EXYNOS5433_G3D_BASE)
   949				data->reference_voltage = 23;
   950			else
   951				data->reference_voltage = 16;
   952			data->efuse_value = 75;
   953			data->min_efuse_value = 40;
   954			data->max_efuse_value = 150;
   955			break;
   956		case SOC_ARCH_EXYNOS7:
   957			data->tmu_set_trip_temp = exynos7_tmu_set_trip_temp;
   958			data->tmu_set_trip_hyst = exynos7_tmu_set_trip_hyst;
   959			data->tmu_initialize = exynos7_tmu_initialize;
   960			data->tmu_control = exynos7_tmu_control;
   961			data->tmu_read = exynos7_tmu_read;
   962			data->tmu_set_emulation = exynos4412_tmu_set_emulation;
   963			data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
   964			data->ntrip = 8;
   965			data->gain = 9;
   966			data->reference_voltage = 17;
   967			data->efuse_value = 75;
   968			data->min_efuse_value = 15;
   969			data->max_efuse_value = 100;
   970			break;
   971		default:
   972			dev_err(&pdev->dev, "Platform not supported\n");
   973			return -EINVAL;
   974		}
   975	
   976		data->cal_type = TYPE_ONE_POINT_TRIMMING;
   977	
   978		/*
   979		 * Check if the TMU shares some registers and then try to map the
   980		 * memory of common registers.
   981		 */
   982		if (data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
   983			return 0;
   984	
   985		if (of_address_to_resource(pdev->dev.of_node, 1, &res)) {
   986			dev_err(&pdev->dev, "failed to get Resource 1\n");
   987			return -ENODEV;
   988		}
   989	
   990		data->base_second = devm_ioremap(&pdev->dev, res.start,
   991						resource_size(&res));
   992		if (!data->base_second) {
   993			dev_err(&pdev->dev, "Failed to ioremap memory\n");
   994			return -ENOMEM;
   995		}
   996	
   997		return 0;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
