Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D307EBC;
	Tue,  4 Jul 2023 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688467373; x=1720003373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2PUhTok0jcdvIxFCL6V04bVuutu3tC1f/b0Wg4mYHuc=;
  b=mMFEj9NsIdTmbOgOX70pKMYvryMR5l0PEwnhLdW5HYnG5IJCo20ZBD82
   fs3p/UQGkCeci0kYDQGNn1rV0hJurrG8faoubEM1RYcJ8j4YlUboVmxJd
   nHl4FY8mBmBR5iIjrqQiqlcfrs3tTYtzi1p04IDAxa6RZZF9l6BwySec5
   wsJFgxZM/5eVljPxAv2jGXvKprm86lmKS4W6P8Nwjlyx+7sDguAi3B9c7
   Zy+Cu4M/2JyHjTihLYbPKeMQoNJDRlmr+hrC3cXR1BT28v2NnmCkj16us
   sLWn4QbW+Z02Pu3gYJzwGkFY7zw7B3fPKp9n0z+tCI7G5RtKY9XyMm+Lv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="363128093"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363128093"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 03:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808886860"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="808886860"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 03:42:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGdUg-000ICX-0c;
	Tue, 04 Jul 2023 10:42:50 +0000
Date: Tue, 4 Jul 2023 18:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 1/7] drivers/hwmon/oxp-sensors.c:437:9:
 error: call to undeclared function 'devm_device_add_groups'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202307041842.rnp7Za0Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   3b24ae38f8fe0b3d0877a909072bf871c65654a9
commit: 1893121f03c6880cd4942d43f47fd7318a713809 [1/7] driver core: remove devm_device_add_groups()
config: x86_64-randconfig-x001-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041842.rnp7Za0Z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041842.rnp7Za0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041842.rnp7Za0Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/oxp-sensors.c:437:9: error: call to undeclared function 'devm_device_add_groups'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   ret = devm_device_add_groups(dev, oxp_ec_groups);
                         ^
   drivers/hwmon/oxp-sensors.c:437:9: note: did you mean 'devm_device_add_group'?
   include/linux/device.h:1167:18: note: 'devm_device_add_group' declared here
   int __must_check devm_device_add_group(struct device *dev,
                    ^
   1 error generated.


vim +/devm_device_add_groups +437 drivers/hwmon/oxp-sensors.c

ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  411  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  412  /* Initialization logic */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  413  static int oxp_platform_probe(struct platform_device *pdev)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  414  {
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  415  	const struct dmi_system_id *dmi_entry;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  416  	struct device *dev = &pdev->dev;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  417  	struct device *hwdev;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  418  	int ret;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  419  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  420  	/*
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  421  	 * Have to check for AMD processor here because DMI strings are the
ebd4bfee2b972d Derek J. Clark            2022-12-28  422  	 * same between Intel and AMD boards, the only way to tell them apart
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  423  	 * is the CPU.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  424  	 * Intel boards seem to have different EC registers and values to
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  425  	 * read/write.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  426  	 */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  427  	dmi_entry = dmi_first_match(dmi_table);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  428  	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  429  		return -ENODEV;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  430  
5d06ec4279a860 Joaquín Ignacio Aramendía 2023-04-29  431  	board = (enum oxp_board)(unsigned long)dmi_entry->driver_data;
3ca0f12a02582c Joaquín Ignacio Aramendía 2022-11-25  432  
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  433  	switch (board) {
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  434  	case aok_zoe_a1:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  435  	case oxp_mini_amd_a07:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  436  	case oxp_mini_amd_pro:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11 @437  		ret = devm_device_add_groups(dev, oxp_ec_groups);
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  438  		if (ret)
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  439  			return ret;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  440  		break;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  441  	default:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  442  		break;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  443  	}
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  444  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  445  	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  446  						     &oxp_ec_chip_info, NULL);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  447  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  448  	return PTR_ERR_OR_ZERO(hwdev);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  449  }
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  450  

:::::: The code at line 437 was first introduced by commit
:::::: be144ee49127216b456da26f1a32b6ba281ac505 hwmon: (oxp-sensors) Add tt_toggle attribute on supported boards

:::::: TO: Joaquín Ignacio Aramendía <samsagax@gmail.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
