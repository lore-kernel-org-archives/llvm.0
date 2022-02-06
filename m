Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8829CA
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644170262; x=1675706262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ns0B7fNPSJcBd/UifoEMtRY5RicmeavbejekRD3vT1M=;
  b=nj+xpVzm/FTFYgX2VzFv3c76llQwUgv5XtsnJXqeHGwFfPahk/uZRr1S
   5DTb8na2i8m+hJUxjyA8wDRIxOGaNPadPyt2TRGxdd3Ps0u6hqZx+CwHo
   +OeS82s6zDohYK6XXkRJ21ZSevNg7acs3p9WM8BzGP3euLQyojoweHw3L
   bMr7tDSutV1dUR8QHXWRLgqHeExOrJzke6Cip2XkvW+/kPS5dWGwvzfEQ
   gVWLrDe/0MvuOWeT86zazUJReWfB6XFuVsf/LWL8Izf7YS82FR3IBHm4S
   GDeuQw9rktxlM1gzuMfwYlS+iO61sD2nEEhgpZNa1LwS9A8761L8fkYpz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="248360640"
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="248360640"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 09:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="484159984"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2022 09:57:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGln9-000aZV-Ps; Sun, 06 Feb 2022 17:57:39 +0000
Date: Mon, 7 Feb 2022 01:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 4/9] drm/bridge: ti-sn65dsi86: Use atomic variants of
 drm_bridge_funcs
Message-ID: <202202070105.4pH2BXwR-lkp@intel.com>
References: <20220206154405.1243333-5-sam@ravnborg.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206154405.1243333-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc2 next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sam-Ravnborg/drm-bridge-ps8640-and-ti-sn65dsi86-updates/20220206-234638
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-buildonly-randconfig-r003-20220206 (https://download.01.org/0day-ci/archive/20220207/202202070105.4pH2BXwR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b4a6b21edb289882a1f838a231032110dd0f3d1e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sam-Ravnborg/drm-bridge-ps8640-and-ti-sn65dsi86-updates/20220206-234638
        git checkout b4a6b21edb289882a1f838a231032110dd0f3d1e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1166:19: error: use of undeclared identifier 'ti_sn_atomic_bridge_enable'
           .atomic_enable = ti_sn_atomic_bridge_enable,
                            ^
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1167:20: error: use of undeclared identifier 'ti_sn_atomic_bridge_disable'
           .atomic_disable = ti_sn_atomic_bridge_disable,
                             ^
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1168:25: error: use of undeclared identifier 'ti_sn_bridge_post_disable'; did you mean 'ti_sn_bridge_atomic_disable'?
           .atomic_post_disable = ti_sn_bridge_post_disable,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
                                  ti_sn_bridge_atomic_disable
   drivers/gpu/drm/bridge/ti-sn65dsi86.c:799:13: note: 'ti_sn_bridge_atomic_disable' declared here
   static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
               ^
   3 errors generated.


vim +/ti_sn_atomic_bridge_enable +1166 drivers/gpu/drm/bridge/ti-sn65dsi86.c

  1160	
  1161	static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
  1162		.attach = ti_sn_bridge_attach,
  1163		.detach = ti_sn_bridge_detach,
  1164		.mode_valid = ti_sn_bridge_mode_valid,
  1165		.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> 1166		.atomic_enable = ti_sn_atomic_bridge_enable,
> 1167		.atomic_disable = ti_sn_atomic_bridge_disable,
> 1168		.atomic_post_disable = ti_sn_bridge_post_disable,
  1169		DRM_BRIDGE_STATE_OPS,
  1170	};
  1171	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
