Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E07E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648292055; x=1679828055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DULYsQyN33SjUke7wC+KDnyKxuorPFQhsSjFOU7jBY=;
  b=Stk+CUUxQ1TZ1HPBwW3BD9w2sWFdOrNW1yzNs5SKO81i68kGrd4Ajwuy
   +YsBBpb7CAOOjxsxj+gs5Du5mIIWXGJyyjdplVQlGwJ7L9aT8OMzCdSxB
   e+j/vriJ3SaVtCtKWmY7I/QXf93E8kRi275gISqvfG8lTAjOW/5gR+dic
   24a+tW9X6cELMoQTTfGMVym+SxBTITBmkv1iopwGmLjQ7N/uObDjv11HE
   xmMlftaqsBP8FgYBzkYnjYyfO/AXK3KPpmVS3OoIJ7H6fWLoOECXHpZn0
   JagWrX/izvIfAZUoZ/YBPQ+dNsX+bUErRhoOWCNTE0XY7eNi8oLcYgmhZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="257604471"
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="257604471"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2022 03:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="520474136"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2022 03:54:13 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nY43g-000NIZ-8a; Sat, 26 Mar 2022 10:54:12 +0000
Date: Sat, 26 Mar 2022 18:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sc8180x-next-20220301 5/27]
 drivers/gpu/drm/msm/dp/dp_hpd.c:63:53: warning: converting the enum constant
 to a boolean
Message-ID: <202203261858.pcxuQp9z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/andersson/kernel wip/sc8180x-next-20220301
head:   0289eb1e5447f549241a40b2a0742a796467ecd8
commit: e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771 [5/27] drm/msm/dp: Add typec_mux implementation
config: arm64-randconfig-r014-20220324 (https://download.01.org/0day-ci/archive/20220326/202203261858.pcxuQp9z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/andersson/kernel/commit/e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sc8180x-next-20220301
        git checkout e4014b0e8a0a46349e91bfb9ef44a59d5a4a2771
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_hpd.c:63:53: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
                   usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
                                                                     ^
   1 warning generated.


vim +63 drivers/gpu/drm/msm/dp/dp_hpd.c

    52	
    53	static int dp_hpd_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
    54	{
    55		struct dp_hpd_private *dp_hpd = typec_mux_get_drvdata(mux);
    56		struct dp_usbpd *usbpd = &dp_hpd->dp_usbpd;
    57		struct typec_displayport_data *dp_data = state->data;
    58		int pin_assign = 0;
    59	
    60		if (dp_data) {
    61			pin_assign = DP_CONF_GET_PIN_ASSIGN(dp_data->conf);
    62			usbpd->hpd_irq = !!(dp_data->status & DP_STATUS_IRQ_HPD);
  > 63			usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
    64		}
    65	
    66		if (!pin_assign) {
    67			if (dp_hpd->connected) {
    68				dp_hpd->connected = false;
    69				dp_hpd->dp_cb->disconnect(dp_hpd->dev);
    70			}
    71		} else if (!dp_hpd->connected) {
    72			dp_hpd->connected = true;
    73			dp_hpd->dp_cb->configure(dp_hpd->dev);
    74		} else {
    75			dp_hpd->dp_cb->attention(dp_hpd->dev);
    76		}
    77	
    78		return 0;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
