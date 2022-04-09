Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A57FA
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649500084; x=1681036084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SSRyijzpi5DD5S80z3wq/RG0mk2POU8NyKf2x5wmtE=;
  b=OhrZ9Ggu4H0OrsJFP0w84kx2wVMXjVuKPsbo6dyeUU0Moww7KQHAeGjZ
   HxAULZfMuVTU4/wlcA/d+yIIoAd021xZj7I55ctq2NU8Ybg/+SYXDyPo/
   bJn0J+7sojx8SNWPqzak4TJ827usoyIR0N0UHQFcmVldRAkE01SOzvF4U
   JTct4VUhd44hVstArQPa7XLVy9OPp0cy9ZCZHv2sdUt0vuzK7lXrY2Cf0
   GM8SzyFiGmfCk6QtsCInDP1d0A7b95R21dMadt1zk1g+QcLpxN7AsyOy0
   FSVZRNZEhHiiIUVaAOQ+UPfgjXQInPS9DqVeXKKjsYBK4QoI5u3GIeATB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="286785452"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="286785452"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2022 03:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="558174286"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2022 03:28:02 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nd8K2-00015h-1y;
	Sat, 09 Apr 2022 10:28:02 +0000
Date: Sat, 9 Apr 2022 18:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/6] drm/bridge: parade-ps8640: Break probe in two to
 handle DP AUX better
Message-ID: <202204091858.CJxHfQWu-lkp@intel.com>
References: <20220408193536.RFC.2.Ia6324ebc848cd40b4dbd3ad3289a7ffb5c197779@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408193536.RFC.2.Ia6324ebc848cd40b4dbd3ad3289a7ffb5c197779@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Douglas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20220408]
[cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/drm-dp-Improvements-for-DP-AUX-channel/20220409-103757
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220409/202204091858.CJxHfQWu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/014e12b5d0aea273512d56e196c11f40ee229b3f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Douglas-Anderson/drm-dp-Improvements-for-DP-AUX-channel/20220409-103757
        git checkout 014e12b5d0aea273512d56e196c11f40ee229b3f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_dp_aux_register_ep_client" [drivers/gpu/drm/bridge/parade-ps8640.ko] undefined!
ERROR: modpost: "auxiliary_driver_unregister" [drivers/gpu/drm/dp/drm_dp_aux_bus.ko] undefined!
ERROR: modpost: "__auxiliary_driver_register" [drivers/gpu/drm/dp/drm_dp_aux_bus.ko] undefined!
ERROR: modpost: "__auxiliary_device_add" [drivers/gpu/drm/dp/drm_dp_aux_bus.ko] undefined!
ERROR: modpost: "auxiliary_device_init" [drivers/gpu/drm/dp/drm_dp_aux_bus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
