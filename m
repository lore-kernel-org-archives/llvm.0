Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC317C;
	Thu, 13 Jul 2023 01:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689212173; x=1720748173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pXhdgdLZpPWGObPkRH1h0Lrvrl0aS6pRlsFnJPFhs0=;
  b=CwK7TGLGBsPl1h5bSkxVy1i+vohouikl3T3Zwpn+59TSve3S+kQhY9Fj
   thu0yvHu4qmGgXh95mgIBNeqvzz4czPGa8zcWgtDFMr/lnpqD2gote0U9
   CGsBf1g2epG0qVjpNgo8sUFTTAzTAWwzue0u1UONb2qcoQr0ZAJQ+f4mF
   +8ZEnmnsuuoMW02KVcIPiA3iBt8GnIN0ThllFtBXBJhGuSwUrqD8PjhS/
   0iuYQisvmDEvlRs5ZNh8jvSPP/p8eVPXJ7si+j/bgobxURPZbB5HwZgxO
   cpjuG8Xzk12utuCtyWoPGu6qIGZb067IMWGsScFqkvpJMTItncijfLLhs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344650584"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="344650584"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 18:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="811805487"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="811805487"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2023 18:36:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJlFa-000669-1x;
	Thu, 13 Jul 2023 01:36:10 +0000
Date: Thu, 13 Jul 2023 09:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 100/101] drivers/perf/xgene_pmu.c:1732:36:
 warning: unused variable 'xgene_pmu_v3_data'
Message-ID: <202307130948.Y1aU572v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: 313ab319a928ebd740c8a86e6cc1436be6c1c359 [100/101] Use of_device_get_match_data
config: arm64-randconfig-r003-20230713 (https://download.01.org/0day-ci/archive/20230713/202307130948.Y1aU572v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130948.Y1aU572v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130948.Y1aU572v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/xgene_pmu.c:1732:36: warning: unused variable 'xgene_pmu_v3_data' [-Wunused-const-variable]
    1732 | static const struct xgene_pmu_data xgene_pmu_v3_data = {
         |                                    ^
   1 warning generated.


vim +/xgene_pmu_v3_data +1732 drivers/perf/xgene_pmu.c

  1731	
> 1732	static const struct xgene_pmu_data xgene_pmu_v3_data = {
  1733		.id   = PCP_PMU_V3,
  1734	};
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
