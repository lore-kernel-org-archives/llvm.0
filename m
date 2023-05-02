Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5ED622;
	Tue,  2 May 2023 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682992823; x=1714528823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmCCglEVSm7RX1Ep0MmX8OZpFQP4RzukGhiXAh8fEJI=;
  b=B6/UYhmiNCRCGNqCWAzlxCx+SF+M/CSfaZGdiRIhKxExaWPg0/oUiS7M
   a74kvUIQpZzjiJu5wcJRJJj5UCElxkTVl4dTzauai/2EAPo3XkbxQiXy4
   RBPffNYqX1cSLxNfjp+kmpXEYLSvv3LtYqoNZinzZPK7YOKYuyijEW5Vd
   Q2yv/gDAFxge5q85cWBEv6BDwUEvs2IwOpHimyhaXe9fLCoxa5ZotQRJf
   bPtvbOrmMO23ljY9YMXRcHHzFmybAT9/81qQqaaNuxM7vx67PxYC87DZu
   Fz3BMlgR0/ozYm5BfTRRLvQLx3iO+SLM7nMd6JuMMyVxZwxYasI7K7zt5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="348331076"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="348331076"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 19:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="760903993"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="760903993"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2023 19:00:21 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptfJU-0000lU-1f;
	Tue, 02 May 2023 02:00:20 +0000
Date: Tue, 2 May 2023 09:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59] drivers/perf/xgene_pmu.c:1732:36:
 warning: unused variable 'xgene_pmu_v3_data'
Message-ID: <202305020945.bGdVB9hL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   34ab035cf8c37588331031cac8fc0dd07f15f3cc
commit: 23496cc222294cb10cd0a3601c443f75a5016ad6 [57/59] Use of_device_get_match_data
config: arm64-randconfig-r015-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020945.bGdVB9hL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=23496cc222294cb10cd0a3601c443f75a5016ad6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 23496cc222294cb10cd0a3601c443f75a5016ad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020945.bGdVB9hL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/xgene_pmu.c:1732:36: warning: unused variable 'xgene_pmu_v3_data' [-Wunused-const-variable]
   static const struct xgene_pmu_data xgene_pmu_v3_data = {
                                      ^
   1 warning generated.


vim +/xgene_pmu_v3_data +1732 drivers/perf/xgene_pmu.c

  1731	
> 1732	static const struct xgene_pmu_data xgene_pmu_v3_data = {
  1733		.id   = PCP_PMU_V3,
  1734	};
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
