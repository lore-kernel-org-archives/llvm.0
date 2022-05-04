Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4CA2110
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651658121; x=1683194121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQAj5zU5YBDIpsvllkIWVZmIaEkdqHUjk7C411iG0ro=;
  b=N0afb06ylAx7jsC4YCS+Lxx1ux1/aYur95Dolx2LplW0tTINuBlNMpwO
   Wni0M8h/+T+gEMS+fsQ+NtJfg8vDvPgrACjzdf4xEjZLcBrOaqut5EAJa
   EmfT31rLhYYMUoMXInbQ0i1Rptt3BI9fFpphhRP+yGmmdqtll+kZ9glyN
   Y7box8K5zSxybrAick0ayaXnPvgguDJiqlLLqOEHeYHrd7sAyzYCKsERs
   JT52Ec3vSuXh3zmeuC3i1KytIXMDkOSz4DpAwkpAaF3kqmBoeH/+U8ipM
   6/qLHF3zjuzyQixSE2B6WbPhp/e8t2b96WSZXwFA+JEAMKQy5k6oGPw2q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354154810"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="354154810"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 02:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="693685435"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 May 2022 02:55:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmBj4-000BI3-Qu;
	Wed, 04 May 2022 09:55:18 +0000
Date: Wed, 4 May 2022 17:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sc8180x-next-20220502 2/29]
 drivers/usb/typec/ucsi/ucsi_glink.c:622:34: warning: unused variable
 'ucsi_glink_of_match'
Message-ID: <202205041711.8Ka8RUyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/andersson/kernel wip/sc8180x-next-20220502
head:   6199153320a3b7d1dce23ad1ea4d894a86793cb6
commit: be6dcf10ab84d8bb9ec872791f28b2724996fc32 [2/29] pmic_glink: Add UCSI/PAN prototype
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220504/202205041711.8Ka8RUyq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/andersson/kernel/commit/be6dcf10ab84d8bb9ec872791f28b2724996fc32
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sc8180x-next-20220502
        git checkout be6dcf10ab84d8bb9ec872791f28b2724996fc32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/usb/typec/ucsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi_glink.c:622:34: warning: unused variable 'ucsi_glink_of_match' [-Wunused-const-variable]
   static const struct of_device_id ucsi_glink_of_match[] = {
                                    ^
   1 warning generated.


vim +/ucsi_glink_of_match +622 drivers/usb/typec/ucsi/ucsi_glink.c

   621	
 > 622	static const struct of_device_id ucsi_glink_of_match[] = {
   623		{ .compatible = "qcom,glink-ucsi", },
   624		{}
   625	};
   626	//MODULE_DEVICE_TABLE(of, ucsi_glink_of_match);
   627	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
