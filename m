Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25117EF;
	Sat,  2 Sep 2023 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693651520; x=1725187520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFb0beCMD5ZG9ReqCcek3ppATq485cQSsKZ4QdI5QVQ=;
  b=UvE4c8ljfs4JFxIOrLg4cRd1Or39gskno494D7fuvKNfI3EYmWuonA9h
   qsM/KRNQfV/n71ShoRs9FzgV1eJxB6VDcWtzOV/WSrWg84F+Mi6DvoQ/4
   SrUG3kL6gQNk2fEhX4oc0Vi/mlSqFmiB5UuNtLUShbr4cGWXwmg7zFc2x
   BbjAim/CVwg707aOEz3YMcRpwZsH5MfCgQwfpw0a8ow7J3fN3TpWKmigH
   5JdFSKDpUpyiswCciQ4rFwH1EKcd8h9WNeBlvHS5iB4BtZjF1qQRHrYr6
   3SnmiB/xaiFEO+7rV+eIOw28P4uedo1XSijjpnpsDno/yqPPQkgsRCucy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380153628"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="380153628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 03:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863812564"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="863812564"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Sep 2023 03:45:18 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcO7w-0002HL-1B;
	Sat, 02 Sep 2023 10:45:16 +0000
Date: Sat, 2 Sep 2023 18:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 29/68] drivers/iio/adc/twl6030-gpadc.c:886:10:
 error: call to undeclared function 'device_get_match_data'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202309021804.Re3mjs6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 23739ec864c4897c8c599ad2ad2ebe6638061ab5 [29/68] iio: Use device_get_match_data()
config: x86_64-randconfig-004-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021804.Re3mjs6u-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021804.Re3mjs6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021804.Re3mjs6u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/twl6030-gpadc.c:886:10: error: call to undeclared function 'device_get_match_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pdata = device_get_match_data(&pdev->dev);
                   ^
>> drivers/iio/adc/twl6030-gpadc.c:886:8: error: incompatible integer to pointer conversion assigning to 'const struct twl6030_gpadc_platform_data *' from 'int' [-Wint-conversion]
           pdata = device_get_match_data(&pdev->dev);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/device_get_match_data +886 drivers/iio/adc/twl6030-gpadc.c

   876	
   877	static int twl6030_gpadc_probe(struct platform_device *pdev)
   878	{
   879		struct device *dev = &pdev->dev;
   880		struct twl6030_gpadc_data *gpadc;
   881		const struct twl6030_gpadc_platform_data *pdata;
   882		struct iio_dev *indio_dev;
   883		int irq;
   884		int ret;
   885	
 > 886		pdata = device_get_match_data(&pdev->dev);
   887		if (!pdata)
   888			return -EINVAL;
   889	
   890		indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
   891		if (!indio_dev)
   892			return -ENOMEM;
   893	
   894		gpadc = iio_priv(indio_dev);
   895	
   896		gpadc->twl6030_cal_tbl = devm_kcalloc(dev,
   897						pdata->nchannels,
   898						sizeof(*gpadc->twl6030_cal_tbl),
   899						GFP_KERNEL);
   900		if (!gpadc->twl6030_cal_tbl)
   901			return -ENOMEM;
   902	
   903		gpadc->dev = dev;
   904		gpadc->pdata = pdata;
   905	
   906		platform_set_drvdata(pdev, indio_dev);
   907		mutex_init(&gpadc->lock);
   908		init_completion(&gpadc->irq_complete);
   909	
   910		ret = pdata->calibrate(gpadc);
   911		if (ret < 0) {
   912			dev_err(dev, "failed to read calibration registers\n");
   913			return ret;
   914		}
   915	
   916		irq = platform_get_irq(pdev, 0);
   917		if (irq < 0)
   918			return irq;
   919	
   920		ret = devm_request_threaded_irq(dev, irq, NULL,
   921					twl6030_gpadc_irq_handler,
   922					IRQF_ONESHOT, "twl6030_gpadc", indio_dev);
   923		if (ret)
   924			return ret;
   925	
   926		ret = twl6030_gpadc_enable_irq(TWL6030_GPADC_RT_SW1_EOC_MASK);
   927		if (ret < 0) {
   928			dev_err(dev, "failed to enable GPADC interrupt\n");
   929			return ret;
   930		}
   931	
   932		ret = twl_i2c_write_u8(TWL6030_MODULE_ID1, TWL6030_GPADCS,
   933						TWL6030_REG_TOGGLE1);
   934		if (ret < 0) {
   935			dev_err(dev, "failed to enable GPADC module\n");
   936			return ret;
   937		}
   938	
   939		ret = twl_i2c_write_u8(TWL_MODULE_USB, VBUS_MEAS, USB_VBUS_CTRL_SET);
   940		if (ret < 0) {
   941			dev_err(dev, "failed to wire up inputs\n");
   942			return ret;
   943		}
   944	
   945		ret = twl_i2c_write_u8(TWL_MODULE_USB, ID_MEAS, USB_ID_CTRL_SET);
   946		if (ret < 0) {
   947			dev_err(dev, "failed to wire up inputs\n");
   948			return ret;
   949		}
   950	
   951		ret = twl_i2c_write_u8(TWL6030_MODULE_ID0,
   952					VBAT_MEAS | BB_MEAS | VAC_MEAS,
   953					TWL6030_MISC1);
   954		if (ret < 0) {
   955			dev_err(dev, "failed to wire up inputs\n");
   956			return ret;
   957		}
   958	
   959		indio_dev->name = DRIVER_NAME;
   960		indio_dev->info = &twl6030_gpadc_iio_info;
   961		indio_dev->modes = INDIO_DIRECT_MODE;
   962		indio_dev->channels = pdata->iio_channels;
   963		indio_dev->num_channels = pdata->nchannels;
   964	
   965		return iio_device_register(indio_dev);
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
