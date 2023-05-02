Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573F7E;
	Tue,  2 May 2023 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683037349; x=1714573349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sAT1zMVCGSR7/HgtTUT6Yg2Kj7uvkvQeKWVMoefN+rs=;
  b=NKL6McJXTcObE0BVs/EJOLhYIV0jmYdOYzsyeZjXhwS1J2yWhNAagxbE
   aL+Fijl2aE4HpWkO6PUzLiW1v8sob9Cg0iujwrw1ZpYWikXoOjQip/2pG
   0/6ZX6XfXotpSYIslf9IqTTh4fNsLPTGEXv6yKc6hYbTojqovIIEXtqqd
   c+RaXljncq7VQHtwW1Lsnp5Fz/OyJpfbDLf+9+MhBgJ66WxuA7d/M+NAW
   Osg9HrheL3ToDL5swbZCIehvlh2fZ1HBzg3thSWvTpahD2u4aVGa6Z8Ju
   c7n9O2T/T/mbHTWThJ7Q/LMivj87vCZZe5aHXg9O36tDIPg2o76/sNQtt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337532170"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="337532170"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 07:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="785682785"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="785682785"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2023 07:22:27 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptqte-000162-2J;
	Tue, 02 May 2023 14:22:26 +0000
Date: Tue, 2 May 2023 22:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: "larry.lai" <larry.lai@yunjingtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC RESEND 1/3] mfd: Add support for UP board CPLD/FPGA
Message-ID: <202305022231.zyZXagsH-lkp@intel.com>
References: <20230425152135.30745-2-larry.lai@yunjingtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425152135.30745-2-larry.lai@yunjingtech.com>

Hi larry.lai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4fe89d07dcc2804c8b562f6c7896a45643d34b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
base:   4fe89d07dcc2804c8b562f6c7896a45643d34b2f
patch link:    https://lore.kernel.org/r/20230425152135.30745-2-larry.lai%40yunjingtech.com
patch subject: [RFC RESEND 1/3] mfd: Add support for UP board CPLD/FPGA
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230502/202305022231.zyZXagsH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb16ef420038f2bede2deb3878b529f0e6ea7729
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
        git checkout cb16ef420038f2bede2deb3878b529f0e6ea7729
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022231.zyZXagsH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/upboard-fpga.c:448:49: warning: data argument not used by format string [-Wformat-extra-args]
                   dev_err(fpga->dev, "Failed to add GPIO LEDs", ret);
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^
>> drivers/mfd/upboard-fpga.c:486:20: error: assigning to 'struct regmap_config *' from 'const struct regmap_config *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           fpga->cpld_config = fpga_data->cpld_config;
                             ^ ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +486 drivers/mfd/upboard-fpga.c

   465	
   466	static int __init upboard_fpga_probe(struct platform_device *pdev)
   467	{
   468		struct upboard_fpga *fpga;
   469		const struct acpi_device_id *id;
   470		const struct upboard_fpga_data *fpga_data;
   471		int ret;
   472		struct device *dev = &pdev->dev;
   473	
   474		id = acpi_match_device(upboard_fpga_acpi_match, dev);
   475		if (!id)
   476			return -ENODEV;
   477	
   478		fpga_data = (const struct upboard_fpga_data *) id->driver_data;
   479	
   480		fpga = devm_kzalloc(dev, sizeof(*fpga), GFP_KERNEL);
   481		if (!fpga)
   482			return -ENOMEM;
   483	
   484		platform_set_drvdata(pdev, fpga);
   485		fpga->regmap = devm_regmap_init(dev, NULL, fpga, fpga_data->cpld_config);
 > 486		fpga->cpld_config = fpga_data->cpld_config;
   487	
   488		if (IS_ERR(fpga->regmap))
   489			return PTR_ERR(fpga->regmap);
   490	
   491		ret = upboard_fpga_gpio_init(fpga);
   492		if (ret) {
   493			/*
   494			 * This is for compatiable with some upboards w/o FPGA firmware,
   495			 * so just showing debug info and do not return directly.
   496			 */
   497			dev_warn(dev, "Failed to initialize FPGA common GPIOs: %d", ret);
   498		} else {
   499			upboard_fpga_show_firmware_info(fpga);
   500		}
   501	
   502		/* register GPIO LEDs */
   503		ret = upboard_led_gpio_register(fpga);
   504		if (ret) {
   505			/*
   506			 * This is for compatiable with some upboards w/o LEDs.
   507			 */
   508			dev_warn(dev, "Failed to register LEDs: %d", ret);
   509		}
   510	
   511		return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
   512					    fpga_data->cells,
   513					    fpga_data->ncells,
   514					    NULL, 0, NULL);
   515	}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
