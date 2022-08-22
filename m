Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DB7F
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661153263; x=1692689263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIX/nHo7zid4qKFYJG9ZTmbJikpG6pbFmXZh0kFzUE8=;
  b=RVpyQV3lpqEec4J0sOwvaXx4Mwu/PyDJiR39G8rw3/U6xxqCsIPqhDnO
   23YyOhKAuStCHWNRjbVmt7LbLSeD0pEkcyv1sqfU8O24AY3pOQAeCyQKC
   sJwfIhFF+L5VDoNZ9VJYAVElZUL/Cq1RdVecob88StU1fMacCVq3bBjJ5
   eBrjU6FG1jDhn5nX7mA0SWjS6RDtZQSXF6eBN2G9pUoh7LOAmx9VZXQoW
   d4i0bqJLFgvLH0uTgASkydm/5td/9F7nVas0frwgauJPS7nJqieIzvwI/
   lw14KPqyVgWN+IxD+qUlfU6Abw56gDgC1RbpKILqjP0HXnUdQ1fUqpZ6p
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="273731685"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="273731685"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 00:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="936930985"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 00:27:37 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQ1qS-00054l-1W;
	Mon, 22 Aug 2022 07:27:36 +0000
Date: Mon, 22 Aug 2022 15:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: ld.lld: error: undefined symbol: drm_gem_fb_get_obj
Message-ID: <202208221506.0Lo051G4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
commit: 57f6190a60ecc19f1ddddac0d7ea6524229271a9 drm/panel: ws2401: Add driver for WideChips WS2401
date:   1 year, 1 month ago
config: x86_64-randconfig-a002-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221506.0Lo051G4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f6190a60ecc19f1ddddac0d7ea6524229271a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 57f6190a60ecc19f1ddddac0d7ea6524229271a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_gem_fb_get_obj
   >>> referenced by drm_mipi_dbi.c:203 (drivers/gpu/drm/drm_mipi_dbi.c:203)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
   >>> referenced by drm_mipi_dbi.c:258 (drivers/gpu/drm/drm_mipi_dbi.c:258)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_fb_dirty) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_fb_swab
   >>> referenced by drm_mipi_dbi.c:219 (drivers/gpu/drm/drm_mipi_dbi.c:219)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_atomic_helper_connector_destroy_state
   >>> referenced by drm_mipi_dbi.c
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_fb_create_with_dirty
   >>> referenced by drm_mipi_dbi.c
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_atomic_helper_check
   >>> referenced by drm_mipi_dbi.c
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_atomic_helper_commit
   >>> referenced by drm_mipi_dbi.c
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_fb_xrgb8888_to_rgb565
   >>> referenced by drm_mipi_dbi.c:224 (drivers/gpu/drm/drm_mipi_dbi.c:224)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_fb_memcpy
   >>> referenced by drm_mipi_dbi.c:221 (drivers/gpu/drm/drm_mipi_dbi.c:221)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_atomic_helper_damage_merged
   >>> referenced by drm_mipi_dbi.c:318 (drivers/gpu/drm/drm_mipi_dbi.c:318)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_pipe_update) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_simple_display_pipe_init
   >>> referenced by drm_mipi_dbi.c:529 (drivers/gpu/drm/drm_mipi_dbi.c:529)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_dev_init_with_formats) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_atomic_helper_connector_reset
   >>> referenced by drm_mipi_dbi.c
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
