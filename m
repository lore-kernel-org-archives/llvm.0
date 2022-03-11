Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8017E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646988401; x=1678524401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHtqczBMuBwrNgtwksjNxVlbSq+mu9MDf5OZWoseuIM=;
  b=GmszD3iFGKeeNo9LqDxDHQnAMopTxDFeToOzfrhCgctQXNHpcv7Tz80T
   2vraXIlNWWFW3tZzz41D8FxErL9TahIuv9zCAvLT1YgGgxzyI7H9SW6Q5
   8q15J4ZrteF8CZrk+XIHUm1HOG3he8eEC4WU7BPEdXE3U9cMjdeR2bHOr
   cJuFrvu+y8wvv4/Q2jipIhjgwwSlFwZ9EYcdOOzD6Axc12Mwrk081IsI/
   rA/ICY1cvcobOWOngzLoE3vUNNyjA1M5mXrsYNePMUlhW3XfzPTU1pgDl
   QckhEe9mh6HfsyYUznzpyB63IPjALmhTk2dGxkg+BI/prEgWAEfTCiV4J
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255264955"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="255264955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 00:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="514433431"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 00:46:39 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSav0-00067y-V4; Fri, 11 Mar 2022 08:46:38 +0000
Date: Fri, 11 Mar 2022 16:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [kbingham-rcar:kbingham/drm-misc/next/sn65dsi86/hpd 11/15] ERROR:
 modpost: "drm_atomic_helper_bridge_dsi_input_bus_fmt"
 [drivers/gpu/drm/bridge/parade-ps8640.ko] undefined!
Message-ID: <202203111635.N1MPOboS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git kbingham/drm-misc/next/sn65dsi86/hpd
head:   94aa000441bc3f2b262da3580845e490e1c31017
commit: d7e45a09dc884537c84843120b2fa90e76495a82 [11/15] drm/bridge: ps8640: plug atomic_get_input_bus_fmts
config: hexagon-randconfig-r045-20220310 (https://download.01.org/0day-ci/archive/20220311/202203111635.N1MPOboS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?id=d7e45a09dc884537c84843120b2fa90e76495a82
        git remote add kbingham-rcar https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
        git fetch --no-tags kbingham-rcar kbingham/drm-misc/next/sn65dsi86/hpd
        git checkout d7e45a09dc884537c84843120b2fa90e76495a82
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_atomic_helper_bridge_dsi_input_bus_fmt" [drivers/gpu/drm/bridge/parade-ps8640.ko] undefined!

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
