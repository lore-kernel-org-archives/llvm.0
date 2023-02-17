Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EBD946A;
	Fri, 17 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676667160; x=1708203160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9bjGsggXK6vBVKsFel909L2LGFlpL8PR8PhqWQ1rJg=;
  b=nP8q82Re3fAuOtztKCbhh44azkeh7xioEqW1v0YRG/vN/Oyi2UuI5wdp
   D1ZiCKRUsUPaS1N7C2AiY0VAHS1f2YUkd+GNtmWQVEW9lWXkpOoG2CZfS
   VZXT6Qadpr4Dt85cl0bPOkG8O8rF3Ch9CYdJRt4wQFffIDA36u8DI9AB1
   loqdRxVVfgo4Qp8OMYqcPFux15s3pxrZPDYRQQIpiRatAxRKWq1RVFS6+
   mmuhC/uJlBMy/r1CPajLKKYnloWtY8AQ0UDffGr63I2iCcTNQxGDHm22L
   Pn6Cz5rhOz34XzZjfdwJZfdy4ACwXDbGcZeYKBAWx/Mvc6Ok2edqa+uKX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="315801351"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="315801351"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 12:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="916209601"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="916209601"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 12:52:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT7ib-000BoN-2g;
	Fri, 17 Feb 2023 20:52:33 +0000
Date: Sat, 18 Feb 2023 04:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 35/584]
 drivers/hwtracing/coresight/coresight-etm4x-core.c:987:41: error: use of
 undeclared identifier 'dev'
Message-ID: <202302180445.AiGhEfUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   e1df0b14d2e3085d5ff5a1c7474b47840640da92
commit: 08c5e3278b418c5a4f7f98e4357208deff68a8da [35/584] coresight: etm4x: Fix crash observed on Qcom ETM parts with 'Low power override'
config: arm64-randconfig-r031-20230217 (https://download.01.org/0day-ci/archive/20230218/202302180445.AiGhEfUc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/08c5e3278b418c5a4f7f98e4357208deff68a8da
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 08c5e3278b418c5a4f7f98e4357208deff68a8da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180445.AiGhEfUc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:987:41: error: use of undeclared identifier 'dev'
           if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
                                                  ^
   1 error generated.


vim +/dev +987 drivers/hwtracing/coresight/coresight-etm4x-core.c

   971	
   972	static bool etm4_init_sysreg_access(struct etmv4_drvdata *drvdata,
   973					    struct csdev_access *csa)
   974	{
   975		u32 devarch;
   976	
   977		if (!cpu_supports_sysreg_trace())
   978			return false;
   979	
   980		/*
   981		 * Some Qualcomm implementations require skipping powering up the trace unit,
   982		 * as the ETMs are in the same power domain as their CPU cores.
   983		 *
   984		 * Since the 'skip_power_up' flag is used inside 'etm4_init_arch_data' function,
   985		 * initialize it before the function is called.
   986		 */
 > 987		if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
   988			drvdata->skip_power_up = true;
   989	
   990		/*
   991		 * ETMs implementing sysreg access must implement TRCDEVARCH.
   992		 */
   993		devarch = read_etm4x_sysreg_const_offset(TRCDEVARCH);
   994		switch (devarch & ETM_DEVARCH_ID_MASK) {
   995		case ETM_DEVARCH_ETMv4x_ARCH:
   996			*csa = (struct csdev_access) {
   997				.io_mem	= false,
   998				.read	= etm4x_sysreg_read,
   999				.write	= etm4x_sysreg_write,
  1000			};
  1001			break;
  1002		case ETM_DEVARCH_ETE_ARCH:
  1003			*csa = (struct csdev_access) {
  1004				.io_mem	= false,
  1005				.read	= ete_sysreg_read,
  1006				.write	= ete_sysreg_write,
  1007			};
  1008			break;
  1009		default:
  1010			return false;
  1011		}
  1012	
  1013		drvdata->arch = etm_devarch_to_arch(devarch);
  1014		return true;
  1015	}
  1016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
