Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3768
	for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 04:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639198291; x=1670734291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORaAGIoy+j8VYxXqV2KW+tZfGurfvWFFe66CgFnWH2E=;
  b=VeyCr0MdnEV96mkJA+ITdVhXrJrfkZedftDag+pTtGtXKExZfouuLHIl
   Rk7cNzvLgBrqTR0GCCrEuY9NAHyNDvzeI+7caDFFgelz/kYIUPUjddGir
   8wFuwq5KNXJncKd4BoTgQzdwueYOLu5i0e8Gv9SMVDje249eHC0Ckx14A
   lqhuUx9iNqjsEGWt3HiXFzQDXjVQp66p8Ka8/uyRNLyFvlbz9VeUY4Y3D
   8xh8GC8yOa5dbO8hIEyXVvmQUqlB7IIyL+VST50J6xLqdIMZDVjngnC77
   nJ0apKBBQfChpTnFjcHnzK+BkbQ3E3OsU9wBCG6FWuBjlZ+DEDlEMo1wE
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="218527853"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="218527853"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 20:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="544212044"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Dec 2021 20:51:29 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvuM4-00047v-N4; Sat, 11 Dec 2021 04:51:28 +0000
Date: Sat, 11 Dec 2021 12:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [superna9999:amlogic/v5.17/g12-dsi 20/23]
 drivers/gpu/drm/meson/meson_encoder_dsi.c:59:37: error: passing 'const
 struct drm_display_mode *' to parameter of type 'struct drm_display_mode *'
 discards qualifiers
Message-ID: <202112111247.XKv1vmaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/superna9999/linux amlogic/v5.17/g12-dsi
head:   62dac9179f2937dc08bffe08d15c6846bc4aedb4
commit: b186318175a12bdca613ee26b4b452964c795eb3 [20/23] fixup! WIP: drm/meson: add DSI encoder
config: arm-randconfig-r033-20211210 (https://download.01.org/0day-ci/archive/20211211/202112111247.XKv1vmaF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/superna9999/linux/commit/b186318175a12bdca613ee26b4b452964c795eb3
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 amlogic/v5.17/g12-dsi
        git checkout b186318175a12bdca613ee26b4b452964c795eb3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_encoder_dsi.c:59:37: error: passing 'const struct drm_display_mode *' to parameter of type 'struct drm_display_mode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           meson_venc_mipi_dsi_mode_set(priv, mode);
                                              ^~~~
   drivers/gpu/drm/meson/meson_venc.h:71:32: note: passing argument to parameter 'mode' here
                                     struct drm_display_mode *mode);
                                                              ^
   drivers/gpu/drm/meson/meson_encoder_dsi.c:130:69: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   dev_err(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
                                                                                     ^~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpu/drm/meson/meson_encoder_dsi.c:109:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning and 1 error generated.


vim +59 drivers/gpu/drm/meson/meson_encoder_dsi.c

6b197be782e041 Neil Armstrong 2021-12-09  47  
b186318175a12b Neil Armstrong 2021-12-10  48  static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
b186318175a12b Neil Armstrong 2021-12-10  49  					const struct drm_display_mode *mode,
b186318175a12b Neil Armstrong 2021-12-10  50  					const struct drm_display_mode *adjusted_mode)
6b197be782e041 Neil Armstrong 2021-12-09  51  {
6b197be782e041 Neil Armstrong 2021-12-09  52  	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
6b197be782e041 Neil Armstrong 2021-12-09  53  	struct meson_drm *priv = encoder_dsi->priv;
6b197be782e041 Neil Armstrong 2021-12-09  54  
b186318175a12b Neil Armstrong 2021-12-10  55  	pr_err("%s:%d\n", __func__, __LINE__);
6b197be782e041 Neil Armstrong 2021-12-09  56  
b186318175a12b Neil Armstrong 2021-12-10  57  	meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
6b197be782e041 Neil Armstrong 2021-12-09  58  
d521159dd8a996 Neil Armstrong 2021-12-10 @59  	meson_venc_mipi_dsi_mode_set(priv, mode);
e1e87e576f5bef Neil Armstrong 2021-12-09  60  	meson_encl_load_gamma(priv);
6b197be782e041 Neil Armstrong 2021-12-09  61  
b186318175a12b Neil Armstrong 2021-12-10  62  	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
b186318175a12b Neil Armstrong 2021-12-10  63  
e1e87e576f5bef Neil Armstrong 2021-12-09  64  	writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
e1e87e576f5bef Neil Armstrong 2021-12-09  65  	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
b186318175a12b Neil Armstrong 2021-12-10  66  }
b186318175a12b Neil Armstrong 2021-12-10  67  

:::::: The code at line 59 was first introduced by commit
:::::: d521159dd8a996678230b50e4ecafcdf50648c52 fixup! WIP: drm/meson: add DSI encoder

:::::: TO: Neil Armstrong <narmstrong@baylibre.com>
:::::: CC: Neil Armstrong <narmstrong@baylibre.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
