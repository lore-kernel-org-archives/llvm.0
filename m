Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A62565
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648561333; x=1680097333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpqU7MqHJNI3GQ9qmngKtxRXq3ePkaM7Z6l6zV3fyvA=;
  b=hzxYU/IHcLtxZaroXbGUutT7K0swJJIq3BnS3um157p3rvyWBQmEuAhT
   +NhEx57HfqPfR7w0bQYahBPNWV6RmFJUziN3b3kcBZpBVuAmd4Xa+isBY
   r+OghJ+rT953wA0MrSgVSzK4/hg79LAb296dwyqpXU/qEacdvbgGpB2N9
   Kr9Cqi3tgdCb07NsfCN6H2UtMuuuuIeCLvWj6qhH23pXTyyHmWJebDVAH
   dbl1kHWKtaxckEEqWU80VE1iF8HqAb373nMMbhotVc8gO+8nI3FGpW6io
   HZWz2EZ31ydQxOmE2HJR+GGI6pN6QXltpZ5I/AE4oZ5sxAKf6n+3rKThJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="345687920"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="345687920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 06:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="652975216"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 06:42:10 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZC6s-0000GL-10; Tue, 29 Mar 2022 13:42:10 +0000
Date: Tue, 29 Mar 2022 21:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Hersen Wu <hersenwu@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1617:6:
 warning: no previous prototype for function 'is_timing_changed'
Message-ID: <202203292131.ydRfKsCO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Roman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 17ce8a6907f77b7ac97ddaa071d8a1f6e06ce85b drm/amd/display: Add dsc pre-validation in atomic check
date:   6 weeks ago
config: arm64-randconfig-r031-20220327 (https://download.01.org/0day-ci/archive/20220329/202203292131.ydRfKsCO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=17ce8a6907f77b7ac97ddaa071d8a1f6e06ce85b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 17ce8a6907f77b7ac97ddaa071d8a1f6e06ce85b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1617:6: warning: no previous prototype for function 'is_timing_changed' [-Wmissing-prototypes]
   bool is_timing_changed(struct dc_stream_state *cur_stream,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_timing_changed(struct dc_stream_state *cur_stream,
   ^
   static 
   1 warning generated.


vim +/is_timing_changed +1617 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c

  1616	
> 1617	bool is_timing_changed(struct dc_stream_state *cur_stream,
  1618			       struct dc_stream_state *new_stream)
  1619	{
  1620		if (cur_stream == NULL)
  1621			return true;
  1622	
  1623		/* If output color space is changed, need to reprogram info frames */
  1624		if (cur_stream->output_color_space != new_stream->output_color_space)
  1625			return true;
  1626	
  1627		return memcmp(
  1628			&cur_stream->timing,
  1629			&new_stream->timing,
  1630			sizeof(struct dc_crtc_timing)) != 0;
  1631	}
  1632	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
