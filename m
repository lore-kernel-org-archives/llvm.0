Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C51261CC;
	Mon,  5 Jun 2023 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685996489; x=1717532489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dlz/aAMnE+zmlUskuGjjrJznWNjFCm23V27aqchxys=;
  b=SGfzS/6OHJ+dw3/CRbohG00g5Y1Ijf4dAnBLSBdC9awD9C2lVVWs3tD9
   al7RA+AzzgY36GLcY87TT0qSCFIEmIMsIOS7KPOYvhGmUwQwUfGUwSQy3
   uvK2UvTSyiw3Vd+jcqXqjpnsRIyAloCMiyXf8yyYtrjdpYnTebbZ5VPSZ
   rriaLsIw4BQ4TxmLk7LsKQOgo5tGik2+CK1QdO2nFtIctI4xBub3zsm3i
   t0RTIXYtxNw7z8JXkMcCwMyM4CEcULPMKN8uownPubjquviorm3CPRtS6
   ghXEgBfHQAHd8oVy5qxmD+rqQ4wV9ipy/P4u3rTVLInp+LAsuAzGbrhjT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355326354"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="355326354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 13:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773857152"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="773857152"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 13:21:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Ghe-0004Pj-07;
	Mon, 05 Jun 2023 20:21:22 +0000
Date: Tue, 6 Jun 2023 04:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Simon Horman <simon.horman@corigine.com>
Subject: [net-next:main 5/19] ERROR: modpost: "lynx_pcs_destroy"
 [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!
Message-ID: <202306060415.KGGf0EG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   69da40ac3481993d6f599c98e84fcdbbf0bcd7e0
commit: 5d1f3fe7d2d54d04b44aa5b9b62b305fdcf653ec [5/19] net: stmmac: dwmac-sogfpga: use the lynx pcs driver
config: i386-randconfig-i061-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060415.KGGf0EG0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=5d1f3fe7d2d54d04b44aa5b9b62b305fdcf653ec
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch --no-tags net-next main
        git checkout 5d1f3fe7d2d54d04b44aa5b9b62b305fdcf653ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060415.KGGf0EG0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "lynx_pcs_destroy" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
