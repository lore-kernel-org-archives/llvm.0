Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935D366
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 00:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648601075; x=1680137075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0WJV+wQxL1oipMcGM7eD6BwEm/VitRunljixoP6PLY=;
  b=KBk8OmU074SnyrajZ2qRofV74dA833gIamaMzhnPbOn4wnzSaI8YgJeo
   xTMMBpqDns1iyR9usioihvVLjh+JcpIUaI9M600MHln73VZwQ0N0WrH6y
   dDMbCuJKeMO/VqSJ0Fj/Hj5Yr8+PgozKhnAngjhbdV1wQsuU1EyrivaT2
   w0PGVoBsyu5sFcW0Ee7aoqrdX9FX29gkqTSSsjA3hYa6DsCPc5xOWKv+8
   6g7yRlEFdMCXvu/INzli/0j/tR2VZEC/7iTMnczNQuFdaA6XykgjHmT70
   V3uOao4vHaDHN6QKDtC8SC27zBP7Dc/99tq2/swZoybwsnCo5yTWjd3V6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246911444"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="246911444"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 17:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="503116647"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2022 17:44:34 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZMRt-0000og-Fu; Wed, 30 Mar 2022 00:44:33 +0000
Date: Wed, 30 Mar 2022 08:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sc8180x-next-20220301-take2 5/27] ERROR: modpost:
 "typec_mux_get_drvdata" [drivers/gpu/drm/msm/msm.ko] undefined!
Message-ID: <202203300817.85Fl2EbD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/andersson/kernel wip/sc8180x-next-20220301-take2
head:   4e9e94d03691fd0820dcff8d0877ddb280b01f88
commit: e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771 [5/27] drm/msm/dp: Add typec_mux implementation
config: hexagon-randconfig-r005-20220329 (https://download.01.org/0day-ci/archive/20220330/202203300817.85Fl2EbD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/andersson/kernel/commit/e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sc8180x-next-20220301-take2
        git checkout e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "typec_mux_get_drvdata" [drivers/gpu/drm/msm/msm.ko] undefined!
>> ERROR: modpost: "typec_mux_unregister" [drivers/gpu/drm/msm/msm.ko] undefined!
>> ERROR: modpost: "typec_mux_register" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
