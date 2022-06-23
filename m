Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCC138A
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655947676; x=1687483676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDnpcfeHyA5MPRXxBfp+Cv9dCpW6YCbzNtf0xkZa0ZE=;
  b=h65UuD9TBFqjshqyzlZAxPjqd8STLQ7wIPfOHdgG+k0BRig2q19eNiCg
   0wlrZIaWHaft/8P4j0cZIBTr4tk5HOYszPlehY9qCzIwwcYaJgQ5We7K7
   rFK8FnaPYOI1mOeZpKT5/ESsav27yHN62SoKdPNF6aN2Wz7zpLhnmqV+X
   HpCloQGguyiZYx0VX5bB93DYAT2X4qMXiEq53qJ6bi/ImgQLQInTftSV3
   vQ9x5tSbnABE59Ajgkl0iQB8tptptjcUGAVNsaGzcgJSdueUB8gLT5hPZ
   s990VcIDMAHHSG1SWGyigRhO99ZYpfvN67HJsE6uuGWMD6uQMKAtKYQzb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280640421"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="280640421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 18:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="585967246"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Jun 2022 18:27:53 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4BdQ-000090-Vt;
	Thu, 23 Jun 2022 01:27:52 +0000
Date: Thu, 23 Jun 2022 09:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [kbingham-rcar:kbingham/drm-misc/next/sn65dsi86/hpd 10/21]
 drivers/gpu/drm/bridge/parade-ps8640.c:524:2: error: call to undeclared
 function 'drm_bridge_chain_pre_enable'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202206230923.AHVRLVRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git kbingham/drm-misc/next/sn65dsi86/hpd
head:   69c67e7d89e9e68e6ffb17deec7112af1d529ac9
commit: b88732c0df106217e663da0458bd46d061ec3ce4 [10/21] drm/bridge: Drop unused drm_bridge_chain functions
config: hexagon-randconfig-r045-20220622 (https://download.01.org/0day-ci/archive/20220623/202206230923.AHVRLVRb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?id=b88732c0df106217e663da0458bd46d061ec3ce4
        git remote add kbingham-rcar https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
        git fetch --no-tags kbingham-rcar kbingham/drm-misc/next/sn65dsi86/hpd
        git checkout b88732c0df106217e663da0458bd46d061ec3ce4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/parade-ps8640.c:524:2: error: call to undeclared function 'drm_bridge_chain_pre_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           drm_bridge_chain_pre_enable(bridge);
           ^
>> drivers/gpu/drm/bridge/parade-ps8640.c:534:3: error: call to undeclared function 'drm_bridge_chain_post_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   drm_bridge_chain_post_disable(bridge);
                   ^
   2 errors generated.


vim +/drm_bridge_chain_pre_enable +524 drivers/gpu/drm/bridge/parade-ps8640.c

13afcdd7277eff Philip Chen            2021-09-21  504  
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  505  static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  506  					   struct drm_connector *connector)
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  507  {
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  508  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
826cff3f7ebba4 Philip Chen            2021-10-28  509  	bool poweroff = !ps_bridge->pre_enabled;
46f206304db031 Enric Balletbo i Serra 2020-08-27  510  	struct edid *edid;
46f206304db031 Enric Balletbo i Serra 2020-08-27  511  
46f206304db031 Enric Balletbo i Serra 2020-08-27  512  	/*
46f206304db031 Enric Balletbo i Serra 2020-08-27  513  	 * When we end calling get_edid() triggered by an ioctl, i.e
46f206304db031 Enric Balletbo i Serra 2020-08-27  514  	 *
46f206304db031 Enric Balletbo i Serra 2020-08-27  515  	 *   drm_mode_getconnector (ioctl)
46f206304db031 Enric Balletbo i Serra 2020-08-27  516  	 *     -> drm_helper_probe_single_connector_modes
46f206304db031 Enric Balletbo i Serra 2020-08-27  517  	 *        -> drm_bridge_connector_get_modes
46f206304db031 Enric Balletbo i Serra 2020-08-27  518  	 *           -> ps8640_bridge_get_edid
46f206304db031 Enric Balletbo i Serra 2020-08-27  519  	 *
46f206304db031 Enric Balletbo i Serra 2020-08-27  520  	 * We need to make sure that what we need is enabled before reading
46f206304db031 Enric Balletbo i Serra 2020-08-27  521  	 * EDID, for this chip, we need to do a full poweron, otherwise it will
46f206304db031 Enric Balletbo i Serra 2020-08-27  522  	 * fail.
46f206304db031 Enric Balletbo i Serra 2020-08-27  523  	 */
46f206304db031 Enric Balletbo i Serra 2020-08-27 @524  	drm_bridge_chain_pre_enable(bridge);
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  525  
46f206304db031 Enric Balletbo i Serra 2020-08-27  526  	edid = drm_get_edid(connector,
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  527  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
46f206304db031 Enric Balletbo i Serra 2020-08-27  528  
46f206304db031 Enric Balletbo i Serra 2020-08-27  529  	/*
46f206304db031 Enric Balletbo i Serra 2020-08-27  530  	 * If we call the get_edid() function without having enabled the chip
46f206304db031 Enric Balletbo i Serra 2020-08-27  531  	 * before, return the chip to its original power state.
46f206304db031 Enric Balletbo i Serra 2020-08-27  532  	 */
46f206304db031 Enric Balletbo i Serra 2020-08-27  533  	if (poweroff)
46f206304db031 Enric Balletbo i Serra 2020-08-27 @534  		drm_bridge_chain_post_disable(bridge);
46f206304db031 Enric Balletbo i Serra 2020-08-27  535  
46f206304db031 Enric Balletbo i Serra 2020-08-27  536  	return edid;
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  537  }
d82c12ab16b847 Enric Balletbo i Serra 2020-08-26  538  

:::::: The code at line 524 was first introduced by commit
:::::: 46f206304db0311b0920479f42accaa7cb472fdc drm/bridge: ps8640: Rework power state handling

:::::: TO: Enric Balletbo i Serra <enric.balletbo@collabora.com>
:::::: CC: Neil Armstrong <narmstrong@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
