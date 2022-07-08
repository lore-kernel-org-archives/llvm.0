Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EFE3229
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657300622; x=1688836622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pC+2/rBUja//IMlc760pKRue825TaWgK5JHe9TZPuFs=;
  b=bsde9RIzDIAjAhQjRQk8gJEgSU15XLwZiATxyCte6m5KbtluaQhEZ44n
   DTXk0RrXFoj3RIeoFYKY+Z28OgyQscSAkEiLETjD66kqvjDwIItlI4Kg1
   ZMIMPvzRrtH7h04YUvneEP9l+eM9RGH2cbAUHb+UJtBFmTZ9cAJVEydW+
   YasgQbP9NLqGNP3QhIlto6cwrQInMjnPxU3Dos5KOw3BVToZwvZg2FxX7
   wCj1QTEOdBYuOZO7IrL5EPjURy92CTNMuUbN0wNR6rxgmhCzdRKgU3nxm
   xue4Sb1fmQqqSJaQ3x+dVe0sS//YSmq8aTksT2d1M/qhmwJA9iW3lQfdQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="309908223"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="309908223"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 10:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="626768821"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jul 2022 10:17:00 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9rb9-000NjA-BF;
	Fri, 08 Jul 2022 17:16:59 +0000
Date: Sat, 9 Jul 2022 01:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 7253/8914]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2720:6: warning: no
 previous prototype for function 'dc_reset_state'
Message-ID: <202207090100.acXdJ79H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: 97ca308925a50aa80711ccfaf814fa3898374862 [7253/8914] drm/amd/display: Add minimal pipe split transition state
config: riscv-randconfig-r006-20220707 (https://download.01.org/0day-ci/archive/20220709/202207090100.acXdJ79H-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=97ca308925a50aa80711ccfaf814fa3898374862
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 97ca308925a50aa80711ccfaf814fa3898374862
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2720:6: warning: no previous prototype for function 'dc_reset_state' [-Wmissing-prototypes]
   void dc_reset_state(struct dc *dc, struct dc_state *context)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2720:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dc_reset_state(struct dc *dc, struct dc_state *context)
   ^
   static 
   1 warning generated.


vim +/dc_reset_state +2720 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  2719	
> 2720	void dc_reset_state(struct dc *dc, struct dc_state *context)
  2721	{
  2722		dc_resource_state_destruct(context);
  2723	
  2724		/* clear the structure, but don't reset the reference count */
  2725		memset(context, 0, offsetof(struct dc_state, refcount));
  2726	
  2727		init_state(dc, context);
  2728	}
  2729	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
