Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF96143
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 23:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645401541; x=1676937541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQKAu3rAAJoABD4ppJ5sxiHeQSkmbG9VaqoiWB5FUbU=;
  b=D163E/jhOnYHvGHuquJdeVWutoRTVHYaxttm9gBI0Ims2qAcG8nxEUwi
   jL1dAuT20wnAvo9LX3js7DJpsvHg87zFAZYTsrBb3pnn4f00RbopkzUAG
   HZFbtdsjNFOfCoT2s/KceoskPh0lzziTNmPN+QqQDggTCDxsOddBkFSbf
   CBMH8pAiwWRQeKLo/wDdZIq+EC4dzbN++5Z9or7/CPnVKkpVFsFOru2h/
   +dsg20Nn1/PYynTYZImkSIX1/Ex0pZPYriDodaDxh0UOnBn2ikASeX+F7
   8w14jwSlEP/LmWUmCO5Ha3EGMLGiSe1oHbjlruA3a/7HKqtcIOKvlki3t
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251593313"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="251593313"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 15:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="706055875"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Feb 2022 15:58:58 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLw6T-00012p-OT; Sun, 20 Feb 2022 23:58:57 +0000
Date: Mon, 21 Feb 2022 07:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jami Kettunen <jami.kettunen@somainline.org>
Subject: [drm-msm:msm-next-staging 29/60]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:855:34: warning: unused
 variable 'msm8998_dspp'
Message-ID: <202202210759.N4dlTbHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   bc2112583a0b473f5c4ba87c00da84abd5d0b3fd
commit: 94391a14fc27383a60fc9499b631e5b6ccd9f075 [29/60] drm/msm/dpu1: Add MSM8998 to hw catalog
config: hexagon-randconfig-r041-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210759.N4dlTbHV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-staging
        git checkout 94391a14fc27383a60fc9499b631e5b6ccd9f075
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:855:34: warning: unused variable 'msm8998_dspp' [-Wunused-const-variable]
   static const struct dpu_dspp_cfg msm8998_dspp[] = {
                                    ^
   1 warning generated.


vim +/msm8998_dspp +855 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

   846	
   847	#define DSPP_BLK(_name, _id, _base, _mask, _sblk) \
   848			{\
   849			.name = _name, .id = _id, \
   850			.base = _base, .len = 0x1800, \
   851			.features = _mask, \
   852			.sblk = _sblk \
   853			}
   854	
 > 855	static const struct dpu_dspp_cfg msm8998_dspp[] = {
   856		DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
   857			 &msm8998_dspp_sblk),
   858		DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
   859			 &msm8998_dspp_sblk),
   860	};
   861	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
