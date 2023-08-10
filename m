Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60ED1E1A2;
	Thu, 10 Aug 2023 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691679511; x=1723215511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4L+XZ5vyS6b+zkA6MyEDrIq6Ora2t8EO//Tfz+qR3I=;
  b=X7eD8VivEd+603UbEs/zUj8Unw60P1FKz6tR+UsaxyNkuYz5OJ5K39h0
   ZYe5Fsa8vz6i8AS8QKqYOYuGZ1FfOkq4oXDcPhFtgY5Fl7mtBpj0cck1F
   RuGRhp3C/GsQeMfFMZYbU+66MS+zcaO/9WgEeYcRRNVG/AM8wsyPk+Nk1
   sh1g/pd3NMh22F9Q0wGa1974BJwhvCTYB6QbNOi6/P+c5MI0Km2aQwEL3
   2O9c/i7nIbiCQ+eXIrrPrXwcskCOkHfaDJ765sI4EbWyvS3Xpj3BPJBhe
   zUs21NXD+fNssKZib0L6A6jXrWYXy70QhTS1Bh8o5iQHOJhHFh671ECIM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="402400488"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="402400488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 07:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="846427107"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="846427107"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2023 07:58:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU775-00074S-2f;
	Thu, 10 Aug 2023 14:58:11 +0000
Date: Thu, 10 Aug 2023 22:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc5-clover 64/115] fastrpc.c:(.text+0x0):
 multiple definition of `qcom_scm_qseecom_app_get_id';
 drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x0): first
 defined here
Message-ID: <202308102228.DcMmeX4t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc5-clover
head:   5d47ba475cde92b762751035d1d4faa8f696eec7
commit: 5edf9aaedeb63806137481219aa793fd06dd5afe [64/115] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: s390-randconfig-r044-20230809 (https://download.01.org/0day-ci/archive/20230810/202308102228.DcMmeX4t-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102228.DcMmeX4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102228.DcMmeX4t-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/misc/fastrpc.o: in function `qcom_scm_qseecom_app_get_id':
>> fastrpc.c:(.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x0): first defined here
   s390x-linux-ld: drivers/misc/fastrpc.o: in function `qcom_scm_qseecom_app_send':
>> fastrpc.c:(.text+0x40): multiple definition of `qcom_scm_qseecom_app_send'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x40): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm.o: in function `qcom_scm_qseecom_app_get_id':
   qcom_scm.c:(.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x0): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm.o: in function `qcom_scm_qseecom_app_send':
   qcom_scm.c:(.text+0x40): multiple definition of `qcom_scm_qseecom_app_send'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x40): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_get_id':
   qcom_scm-smc.c:(.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x0): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_send':
   qcom_scm-smc.c:(.text+0x40): multiple definition of `qcom_scm_qseecom_app_send'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x40): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_get_id':
   qcom_scm-legacy.c:(.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x0): first defined here
   s390x-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_send':
   qcom_scm-legacy.c:(.text+0x40): multiple definition of `qcom_scm_qseecom_app_send'; drivers/iommu/arm/arm-smmu/qcom_iommu.o:qcom_iommu.c:(.text+0x40): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
