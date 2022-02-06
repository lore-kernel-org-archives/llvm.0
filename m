Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA512F24
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644167201; x=1675703201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRiv8ddZ1vTozHHk+QkzX5fiJlMnhpMtF+GNLMhnzWM=;
  b=LD+H6ipL7MIWgJeS4e9dUWykoByLdq+wRA6OryOmsFYhlFbfdz0StBSG
   KIPSnGicsYPyzHSwE/x8lcJwINvxaQNoMdcVbz9Xw8V47zC8ownE4Nqbv
   jR81nKBqgFXDS8HAwF6Cw6LOoNfNHMcGQnueSZr1VW75TktdcpoxP5MjO
   pzIAArYdxTCWPzQ74qB5DWyqhmck6oHpkQcLPTzAZ4eBiKVniU2sIgw57
   FQRBu28HGJmCw/I9nDAo2LJ/BCA5Nu3uCNTEAroHhHjXFEBAKgutKZCdA
   HQ5IYBj5omZfRPD+Gib8Ij+Occ8RY4BqtJNHGd0rvdgWCIkZcdHcqOJVz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="229242285"
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="229242285"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 09:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="700211878"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2022 09:06:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGkzl-000aWv-Tc; Sun, 06 Feb 2022 17:06:37 +0000
Date: Mon, 7 Feb 2022 01:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 3/9] drm: add
 drm_atomic_helper_bridge_dsi_input_bus_fmt
Message-ID: <202202070113.dsmEk0pf-lkp@intel.com>
References: <20220206154405.1243333-4-sam@ravnborg.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206154405.1243333-4-sam@ravnborg.org>
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
config: hexagon-buildonly-randconfig-r003-20220206 (https://download.01.org/0day-ci/archive/20220207/202202070113.dsmEk0pf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d72252f11e9d51bd1da85eb99299f3d8fec36bc2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sam-Ravnborg/drm-bridge-ps8640-and-ti-sn65dsi86-updates/20220206-234638
        git checkout d72252f11e9d51bd1da85eb99299f3d8fec36bc2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_helper.c:3583:23: error: use of undeclared identifier 'MAX_INPUT_SEL_FORMATS'
           input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
                                ^
   1 error generated.


vim +/MAX_INPUT_SEL_FORMATS +3583 drivers/gpu/drm/drm_atomic_helper.c

  3552	
  3553	/**
  3554	 * drm_atomic_helper_bridge_dsi_input_bus_fmt - Define one DSI output format
  3555	 *
  3556	 * @bridge: bridge control structure
  3557	 * @bridge_state: new bridge state
  3558	 * @crtc_state: new CRTC state
  3559	 * @conn_state: new connector state
  3560	 * @output_fmt: tested output bus format
  3561	 * @num_input_fmts: will contain the size of the returned array
  3562	 *
  3563	 * This helper is an implementation of the
  3564	 * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that supports
  3565	 * a single DSI media bus format MEDIA_BUS_FMT_RGB888_1X24.
  3566	 *
  3567	 * RETURNS
  3568	 * A format array with one entry containing MEDIA_BUS_FMT_RGB888_1X24,
  3569	 * or NULL if the allocation failed
  3570	 */
  3571	u32 *
  3572	drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
  3573						   struct drm_bridge_state *bridge_state,
  3574						   struct drm_crtc_state *crtc_state,
  3575						   struct drm_connector_state *conn_state,
  3576						   u32 output_fmt,
  3577						   unsigned int *num_input_fmts)
  3578	{
  3579		u32 *input_fmts;
  3580	
  3581		*num_input_fmts = 0;
  3582	
> 3583		input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
