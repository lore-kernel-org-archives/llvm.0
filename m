Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951723BE
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648158664; x=1679694664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cz6HBthwW0nY24DRIJjypp9xMPbxdoGHo2l1mnA2Wxg=;
  b=C5kjrsMJ1cgt6qapT8cRWPHpy/ElHFRm6cWwzLL0vTUUrqIevPOMYYX/
   9CMOQvjGXQe9DJApd9C7aSKYjGXVeoBTGbz1dM1YsZ/p9ADp+CB7OWbLw
   paz+6V8pKe8/2g6JQ6FZk9JgE7diil911fp11UtkTw7Q1Lo93TBwdO4zi
   BoP7HcLzK6ROdpRUE8SGwEIhjaMfKrtG1PG/5Yq2R1XI7hPT/yAmD84X1
   SyKkcFHH7rT/ownBz/EZpyEJKw7/Ms5hnOxU7IiFQpD0dSZ2ktmShChji
   0h3KIr/d41YFe7r5jDG5sOvY+0R+oYhxgjxvFQ+KEL2lgDdG3TW07xrOl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321694822"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="321694822"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 14:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="650017140"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 14:51:01 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXVMD-000LTf-3j; Thu, 24 Mar 2022 21:51:01 +0000
Date: Fri, 25 Mar 2022 05:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jimmy Kizito <Jimmy.Kizito@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:416:6:
 warning: variable 'matching_stream_ptrs' set but not used
Message-ID: <202203250504.X4x0hoOe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ed4643521e6af8ab8ed1e467630a85884d2696cf
commit: b3492ed160768ad60ad6753269099213b6772a70 drm/amd/display: Fix concurrent dynamic encoder assignment
date:   6 months ago
config: arm64-randconfig-r013-20220324 (https://download.01.org/0day-ci/archive/20220325/202203250504.X4x0hoOe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b3492ed160768ad60ad6753269099213b6772a70
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b3492ed160768ad60ad6753269099213b6772a70
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:416:6: warning: variable 'matching_stream_ptrs' set but not used [-Wunused-but-set-variable]
           int matching_stream_ptrs = 0;
               ^
   1 warning generated.


vim +/matching_stream_ptrs +416 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c

   404	
   405	bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
   406	{
   407		bool is_valid = false;
   408		bool valid_entries = true;
   409		bool valid_stream_ptrs = true;
   410		bool valid_uniqueness = true;
   411		bool valid_avail = true;
   412		bool valid_streams = true;
   413		int i, j;
   414		uint8_t valid_count = 0;
   415		uint8_t dig_stream_count = 0;
 > 416		int matching_stream_ptrs = 0;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
