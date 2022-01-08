Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB392C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641668106; x=1673204106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70Q/2UXqoBuMRdkWXo7BCf4oj8OqqkptpAbi1Ty0HVw=;
  b=h7LklU3or2O1zYHJOyEwYbfoLA2zP0VMC0dnxAmRLcmsgfSUuX1SES/Q
   QpxUTBLmpd3NTLhf2X8/4qN43/rJpFPVFkhh1mGRX4D86VI8r0auq5/Mz
   9ZCEQisxZGYA+gsxzeNzw/7pWHNUsa29+qUkwyQxr3VUEA3V/XWVJL6m4
   QUv27K8mjfNn2EEIzdUNm0HYpfXvsP6WUqVde6I2pGWM5kGm0jgJOxWSA
   QeQrPS/7/VtihMV1D37s4UZe5pHwliupDewm4jqfKJYQh6brbZQbiWwyd
   FeVDCLnQAiwd5jE1U2whYHmbp2ZcoKOWL6uIc9idnPaPpW/vF6KlBx9TN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="223731279"
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="223731279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 10:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="612483135"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2022 10:55:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6Gro-0000vv-D4; Sat, 08 Jan 2022 18:55:04 +0000
Date: Sun, 9 Jan 2022 02:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 5/6] drm/meson: add DSI encoder
Message-ID: <202201090255.SV1mvcAL-lkp@intel.com>
References: <20220107145515.613009-6-narmstrong@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107145515.613009-6-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Neil,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next next-20220107]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220107-225717
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-randconfig-r002-20220107 (https://download.01.org/0day-ci/archive/20220109/202201090255.SV1mvcAL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/ceb473650c47d3914419f8795fba12fbc9947710
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220107-225717
        git checkout ceb473650c47d3914419f8795fba12fbc9947710
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_encoder_dsi.c:121:69: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
                                                                                     ^~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/gpu/drm/meson/meson_encoder_dsi.c:106:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +121 drivers/gpu/drm/meson/meson_encoder_dsi.c

   101	
   102	int meson_encoder_dsi_init(struct meson_drm *priv)
   103	{
   104		struct meson_encoder_dsi *meson_encoder_dsi;
   105		struct device_node *remote;
   106		int ret;
   107	
   108		meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
   109		if (!meson_encoder_dsi)
   110			return -ENOMEM;
   111	
   112		/* DSI Transceiver Bridge */
   113		remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
   114		if (!remote) {
   115			dev_err(priv->dev, "DSI transceiver device is disabled");
   116			return 0;
   117		}
   118	
   119		meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
   120		if (!meson_encoder_dsi->next_bridge) {
 > 121			dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
