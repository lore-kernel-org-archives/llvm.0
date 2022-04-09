Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CA7E3
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 05:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649481178; x=1681017178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V1mWiWH4ku54YHIUhKQE2F/LO/k0n7E9dfyoQSFeMv0=;
  b=Klgoj4gcOabBo16Wns5PxClEZPXwpzkgUvkAKlse9fHamKRp/UW/YDKE
   qYG22zhikjNZ5Y84RvTSFl9lraUMj1RhixpuCFdRKRwZ0GHKCpmvp+/Xm
   sVeF0tYu+KLRe7VCRYM4dQJ73fgkAbSrHgoo0RK/6fVBQVbI7FeMSMUju
   QaaOEAtpOtyFl9PGC/piaaZtZaXDOdJVrLJ46N/EM4/1vJJC6fzMud14D
   WFVIh6qM+jsjZoqZ6klHV4jGBFZx47hsJh6q4fbxtooooryAi5ArEoF21
   b7HTNfQvDC61igDXIVjeibs5JlDwxi4RzL+qPSt32jas39fY1aiRo18C5
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="348197345"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="348197345"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 22:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="610066079"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2022 22:12:56 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nd3P6-0000tX-4s;
	Sat, 09 Apr 2022 05:12:56 +0000
Date: Sat, 9 Apr 2022 13:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
Message-ID: <202204091350.o07baxjw-lkp@intel.com>
References: <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Douglas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on v5.18-rc1 next-20220408]
[cannot apply to drm/drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/drm-dp-Improvements-for-DP-AUX-channel/20220409-103757
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: hexagon-randconfig-r041-20220408 (https://download.01.org/0day-ci/archive/20220409/202204091350.o07baxjw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ac7f6296e6f7896ca327e0832276c1f030a1398
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Douglas-Anderson/drm-dp-Improvements-for-DP-AUX-channel/20220409-103757
        git checkout 3ac7f6296e6f7896ca327e0832276c1f030a1398
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: auxiliary_device_init
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_register_ep_client) in archive drivers/built-in.a
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_register_ep_client) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: __auxiliary_device_add
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_register_ep_client) in archive drivers/built-in.a
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_register_ep_client) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: __auxiliary_driver_register
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_bus_init) in archive drivers/built-in.a
   >>> referenced by drm_dp_aux_bus.c
   >>> gpu/drm/dp/drm_dp_aux_bus.o:(dp_aux_bus_init) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
