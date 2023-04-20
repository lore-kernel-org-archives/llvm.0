Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573B15CC;
	Thu, 20 Apr 2023 00:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681952051; x=1713488051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKG4Qpjze+YSShuxJXnKNCLquArvTLixSwdG/WCauIo=;
  b=Sq0Zlg5vjy/UBXVD8sTIGnABu5+6bcKewNghrM9MloYJmgl3VFDuPQh6
   FmzEOT5n5ixmSmFuJHDY7DQyAoY7jievfB82fRbE5UO9hEK6N+RRSEdrb
   FGyJUig6A35WHKkdLVoCQVNAmoeoT9Ty/qkr5n3ZYmPXER7scB4feMPE3
   jWRDqcdpbGVbMybtwp+zcbwLRvDheA0gj4rxTJajLEXaL2+oOGIr9Hd55
   r+/Ab6Zf79Jt1RiRgO1LRI3YQBBwz10D2dP+hAwTzJVHEc6M4ehpN9fKt
   bMDF0+4XQKZsejhrFQI1kPqyKbikHa+PB2IqfvwHovFxYNSXzZjKQu0n9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408511422"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="408511422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 17:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691710363"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="691710363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Apr 2023 17:54:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppIYp-000fIs-2U;
	Thu, 20 Apr 2023 00:54:07 +0000
Date: Thu, 20 Apr 2023 08:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Huang <Leon.Huang1@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [linux-next:master 12500/13075]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:15: warning:
 variable 'feature_support' set but not used
Message-ID: <202304200812.6UqNDVZy-lkp@intel.com>
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
commit: b8fe56375f78835db47565d91ea9d21767fe3c08 [12500/13075] drm/amd/display: Refactor ABM feature
config: arm64-randconfig-r036-20230416 (https://download.01.org/0day-ci/archive/20230420/202304200812.6UqNDVZy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8fe56375f78835db47565d91ea9d21767fe3c08
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b8fe56375f78835db47565d91ea9d21767fe3c08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200812.6UqNDVZy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:15: warning: variable 'feature_support' set but not used [-Wunused-but-set-variable]
           unsigned int feature_support;
                        ^
   1 warning generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:83:6: warning: no previous prototype for function 'dmub_abm_init' [-Wmissing-prototypes]
   void dmub_abm_init(struct abm *abm, uint32_t backlight)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dmub_abm_init(struct abm *abm, uint32_t backlight)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:124:14: warning: no previous prototype for function 'dmub_abm_get_current_backlight' [-Wmissing-prototypes]
   unsigned int dmub_abm_get_current_backlight(struct abm *abm)
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int dmub_abm_get_current_backlight(struct abm *abm)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:135:14: warning: no previous prototype for function 'dmub_abm_get_target_backlight' [-Wmissing-prototypes]
   unsigned int dmub_abm_get_target_backlight(struct abm *abm)
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:135:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int dmub_abm_get_target_backlight(struct abm *abm)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:146:6: warning: no previous prototype for function 'dmub_abm_set_level' [-Wmissing-prototypes]
   bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:167:6: warning: no previous prototype for function 'dmub_abm_set_ambient_level' [-Wmissing-prototypes]
   void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:189:6: warning: no previous prototype for function 'dmub_abm_init_config' [-Wmissing-prototypes]
   void dmub_abm_init_config(struct abm *abm,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dmub_abm_init_config(struct abm *abm,
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:221:6: warning: no previous prototype for function 'dmub_abm_set_pause' [-Wmissing-prototypes]
   bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, unsigned int stream_inst)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, unsigned int stream_inst)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:241:6: warning: no previous prototype for function 'dmub_abm_set_pipe' [-Wmissing-prototypes]
   bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint32_t panel_inst)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint32_t panel_inst)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:263:6: warning: no previous prototype for function 'dmub_abm_set_backlight_level' [-Wmissing-prototypes]
   bool dmub_abm_set_backlight_level(struct abm *abm,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool dmub_abm_set_backlight_level(struct abm *abm,
   ^
   static 
   9 warnings generated.


vim +/feature_support +138 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c

   133	
   134	static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
   135			unsigned int hdr_mode, unsigned int panel_inst)
   136	{
   137		bool ret = false;
 > 138		unsigned int feature_support;
   139	
   140		feature_support = abm_feature_support(abm, panel_inst);
   141	
   142		return ret;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
