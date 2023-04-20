Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06D17C9;
	Thu, 20 Apr 2023 02:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681957527; x=1713493527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcXiTGX0jEfHLVUs2sLhbceUjoj4al2FF2c6LlrgD+g=;
  b=P0Jnq5nP9yayxRyP0wD5IF1fHtMtLh3MSBg1lES2pJW9snlPIWSJEoZc
   xTnK8WdDitMZSqt1bhOYRJkW49llnsqOpx2AYGILDUg9uPpd31X7dkr5d
   yROQOMXTMLBatSjzfn5HinrgEx68XeGGT8Cl0m9rrbmWEaw4/syWgC8DX
   y7oj+cfSlW82ZIdPrO69i5KM90OaxGwGFqWecNq3Fsk3JfaJIYt3Ej3ZB
   M8HrxOdfO2R54vgRPz9N39evERYazvMKTcK+IQGlqleyW4HLDZeMIXagv
   0VkZ5YkiOIUthoMXDXjptYlhQzw0SUm5GIo7yTcZ0U0BFdcnJUqiJ+zPP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325943546"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="325943546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 19:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="781074887"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="781074887"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 19:25:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppJyx-000fNm-2T;
	Thu, 20 Apr 2023 02:25:11 +0000
Date: Thu, 20 Apr 2023 10:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Yang <Eric.Yang2@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 12531/13075]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:19: warning:
 variable 'dmub' set but not used
Message-ID: <202304201027.2upm4i0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: 499e4b1c722e0e2ca40c56342b766e95f6c31f4a [12531/13075] drm/amd/display: add mechanism to skip DCN init
config: arm64-randconfig-r036-20230416 (https://download.01.org/0day-ci/archive/20230420/202304201027.2upm4i0C-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=499e4b1c722e0e2ca40c56342b766e95f6c31f4a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 499e4b1c722e0e2ca40c56342b766e95f6c31f4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201027.2upm4i0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:19: warning: variable 'dmub' set but not used [-Wunused-but-set-variable]
           struct dmub_srv *dmub;
                            ^
   1 warning generated.


vim +/dmub +184 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c

   181	
   182	bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
   183	{
 > 184		struct dmub_srv *dmub;
   185		union dmub_fw_boot_status status;
   186	
   187		if (!dc_dmub_srv || !dc_dmub_srv->dmub)
   188			return false;
   189	
   190		dmub = dc_dmub_srv->dmub;
   191	
   192		return status.bits.optimized_init_done;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
