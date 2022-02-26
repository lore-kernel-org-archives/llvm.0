Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F513B21
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645876371; x=1677412371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jDCHAFivtb8bWag8LVsqSoLoN1GP8PqAV+X91PWEJ9s=;
  b=CY5ViCIB8zDt7K2zdp823Z/7yPPAxkI4LfIfWQ9/hxxE4j8YAcDP3T/L
   30zge3cbevNkBPq1CDG/A5syuAHISxSTgy1a4upCuD5yNKhiGNlFGXu4m
   EXfEt4UayQMLKgCLTO/iOxfHJ8NOhFHnz0ofrQF81aB83jnXzZnlmCrbZ
   Jj2urEOJzxwR5+lvM8Ojq/Ye5ZyyUICTeqSoyOYcs1R1tyBI/hzBojM17
   +ws7Yu35A4Lox6XSK06BC4g6GikrBx0GfMBgCOWEidrfLcaWh1cBZNTM2
   X4beab2DNXBkGvUsHaAkgeJ1vjrIBKc7pvbYDhMQzuVN6JH6igAUzDRoS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="277293650"
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="277293650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 03:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="592755736"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Feb 2022 03:52:50 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNvd3-0005Qi-DX; Sat, 26 Feb 2022 11:52:49 +0000
Date: Sat, 26 Feb 2022 19:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RESEND v4 1/2] ASoC: codecs: Add power domains support in
 digital macro codecs
Message-ID: <202202261931.0oAfi4YW-lkp@intel.com>
References: <1645861531-13829-2-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645861531-13829-2-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Srinivasa,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[cannot apply to v5.17-rc5 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/Add-power-domains-support-for-digital-macro-codecs/20220226-154756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220226/202202261931.0oAfi4YW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dbf07c8c599d3de2e83d99b0c562cbd2b429a70e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/Add-power-domains-support-for-digital-macro-codecs/20220226-154756
        git checkout dbf07c8c599d3de2e83d99b0c562cbd2b429a70e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-rx-macro.c:3567:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   sound/soc/codecs/lpass-rx-macro.c:3538:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.
--
>> sound/soc/codecs/lpass-tx-macro.c:1829:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   sound/soc/codecs/lpass-tx-macro.c:1800:9: note: initialize the variable 'ret' to silence this warning
           int ret, reg;
                  ^
                   = 0
   1 warning generated.


vim +/ret +3567 sound/soc/codecs/lpass-rx-macro.c

  3532	
  3533	static int rx_macro_probe(struct platform_device *pdev)
  3534	{
  3535		struct device *dev = &pdev->dev;
  3536		struct rx_macro *rx;
  3537		void __iomem *base;
  3538		int ret;
  3539	
  3540		rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
  3541		if (!rx)
  3542			return -ENOMEM;
  3543	
  3544		rx->macro = devm_clk_get_optional(dev, "macro");
  3545		if (IS_ERR(rx->macro))
  3546			return PTR_ERR(rx->macro);
  3547	
  3548		rx->dcodec = devm_clk_get_optional(dev, "dcodec");
  3549		if (IS_ERR(rx->dcodec))
  3550			return PTR_ERR(rx->dcodec);
  3551	
  3552		rx->mclk = devm_clk_get(dev, "mclk");
  3553		if (IS_ERR(rx->mclk))
  3554			return PTR_ERR(rx->mclk);
  3555	
  3556		rx->npl = devm_clk_get(dev, "npl");
  3557		if (IS_ERR(rx->npl))
  3558			return PTR_ERR(rx->npl);
  3559	
  3560		rx->fsgen = devm_clk_get(dev, "fsgen");
  3561		if (IS_ERR(rx->fsgen))
  3562			return PTR_ERR(rx->fsgen);
  3563	
  3564		rx->pds = lpass_macro_pds_init(dev);
  3565		if (!rx->pds) {
  3566			dev_err(dev, "Enabling power domains failed in %s\n", __func__);
> 3567			return ret;
  3568		}
  3569	
  3570		base = devm_platform_ioremap_resource(pdev, 0);
  3571		if (IS_ERR(base))
  3572			return PTR_ERR(base);
  3573	
  3574		rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
  3575		if (IS_ERR(rx->regmap))
  3576			return PTR_ERR(rx->regmap);
  3577	
  3578		dev_set_drvdata(dev, rx);
  3579	
  3580		rx->reset_swr = true;
  3581		rx->dev = dev;
  3582	
  3583		/* set MCLK and NPL rates */
  3584		clk_set_rate(rx->mclk, MCLK_FREQ);
  3585		clk_set_rate(rx->npl, 2 * MCLK_FREQ);
  3586	
  3587		ret = clk_prepare_enable(rx->macro);
  3588		if (ret)
  3589			goto err;
  3590	
  3591		ret = clk_prepare_enable(rx->dcodec);
  3592		if (ret)
  3593			goto err_dcodec;
  3594	
  3595		ret = clk_prepare_enable(rx->mclk);
  3596		if (ret)
  3597			goto err_mclk;
  3598	
  3599		ret = clk_prepare_enable(rx->npl);
  3600		if (ret)
  3601			goto err_npl;
  3602	
  3603		ret = clk_prepare_enable(rx->fsgen);
  3604		if (ret)
  3605			goto err_fsgen;
  3606	
  3607		ret = rx_macro_register_mclk_output(rx);
  3608		if (ret)
  3609			goto err_clkout;
  3610	
  3611		ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
  3612						      rx_macro_dai,
  3613						      ARRAY_SIZE(rx_macro_dai));
  3614		if (ret)
  3615			goto err_clkout;
  3616	
  3617	
  3618		pm_runtime_set_autosuspend_delay(dev, 3000);
  3619		pm_runtime_use_autosuspend(dev);
  3620		pm_runtime_mark_last_busy(dev);
  3621		pm_runtime_set_active(dev);
  3622		pm_runtime_enable(dev);
  3623	
  3624		return 0;
  3625	
  3626	err_clkout:
  3627		clk_disable_unprepare(rx->fsgen);
  3628	err_fsgen:
  3629		clk_disable_unprepare(rx->npl);
  3630	err_npl:
  3631		clk_disable_unprepare(rx->mclk);
  3632	err_mclk:
  3633		clk_disable_unprepare(rx->dcodec);
  3634	err_dcodec:
  3635		clk_disable_unprepare(rx->macro);
  3636	err:
  3637		return ret;
  3638	}
  3639	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
