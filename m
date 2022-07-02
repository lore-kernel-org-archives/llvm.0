Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67021FA1
	for <llvm@lists.linux.dev>; Sat,  2 Jul 2022 07:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656748363; x=1688284363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiPjeF+jRRWUM7VkcVZOcmis1bognjh9b+zwzFC7KpU=;
  b=ZV+TOSrqP0JxuOjXcw+rTmHkPPdmbGjX8SVp/wr5uAPTt8gZ+h+eRFnk
   h7mbsSd3PUtLHqJa/8C/fcQbEl6gmQt8FhkzzBRuOJA3kcyDnUFFmY1dZ
   QdUlZHoZD4UId+5hX2Zcyjqud2Yw3O5UHpopmXo3A+gx1kg4cu9yyj/PL
   uYX/NeUoDMa7+eIRpDAzvUy34X1FFJcFqwmf0R2PX1xItA4pyzqp13Ti3
   WSb/iDfKSigS0jftLWx2pRas9OGcgQzWUr1Ir3wfKsXX3/xKg4tuPj19C
   7VlfGq9aneekgURtwMLAobGbxPkPt83jsRKe6Nn4DXA9FK33FnOPlvpe2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="271574477"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="271574477"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 00:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="596520471"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2022 00:52:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7Xvl-000EyM-22;
	Sat, 02 Jul 2022 07:52:41 +0000
Date: Sat, 2 Jul 2022 15:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [andersson:ci-next 143/256]
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts:13:10: fatal error:
 'sc8280xp-pmics.dtsi' file not found
Message-ID: <202207021501.l6NTMDfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/andersson/kernel ci-next
head:   9b3ce87d4ca378dcc682c816050abac245606df2
commit: c3b2a4e5b808e4bafe248834ade5a00d94984c1c [143/256] arm64: dts: qcom: sc8280xp: Add reference device
config: arm64-buildonly-randconfig-r001-20220629 (https://download.01.org/0day-ci/archive/20220702/202207021501.l6NTMDfZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bcd153485ebf07fe79e2b843ed5f1cb74997df1b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/andersson/kernel/commit/c3b2a4e5b808e4bafe248834ade5a00d94984c1c
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson ci-next
        git checkout c3b2a4e5b808e4bafe248834ade5a00d94984c1c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dts:13:10: fatal error: 'sc8280xp-pmics.dtsi' file not found
   #include "sc8280xp-pmics.dtsi"
            ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts

    11	
    12	#include "sc8280xp.dtsi"
  > 13	#include "sc8280xp-pmics.dtsi"
    14	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
