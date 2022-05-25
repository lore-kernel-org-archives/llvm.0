Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F1A38
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 04:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653452143; x=1684988143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zoLHpPJlHQj1sMadNZjpddoZi4TuvVOAVFg4iO1UKTM=;
  b=PDdowoHav1Qjqu5ARR3VtCAEI2eXSvI75rEjJTcIF18txAgGoQFiUwpQ
   AlVlPYEXQsGMwCYLSEBAPyw81uf5IQNtYO0e1P4YCcScj1iEKqPobQHjy
   3LzMqgkMTytHlolyprUymfBtIpbEefSFPvcTqsFUJ8RmDM25svMXL6iPE
   ipL5CHNzhWPzZ/qkMz/TyYHXuWuXk9rhq5Ue8bfxNaaM3WGfQcypBarx0
   Ottzq9ZLRr0EQdIkZms7YbTD9h1OXUjl68BHypul5lDMi2UX+tDHlnEqk
   UPCEzotp7V4N3WLyaFDP+VrgC4j3pFH+Lj+n9rZrwYKUmV4lhUce98Dl7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="261321906"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="261321906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 21:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="608954990"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 May 2022 21:15:40 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntiQu-0002iE-9H;
	Wed, 25 May 2022 04:15:40 +0000
Date: Wed, 25 May 2022 12:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: drivers/media/platform/renesas/rcar_drif.c:1470:34: warning: unused
 variable 'rcar_drif_of_table'
Message-ID: <202205251220.mSx58WJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fdaf9a5840acaab18694a19e0eb0aa51162eeeed
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   2 months ago
config: hexagon-buildonly-randconfig-r001-20220525 (https://download.01.org/0day-ci/archive/20220525/202205251220.mSx58WJG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/imx/ drivers/media/platform/renesas/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/rcar_drif.c:1470:34: warning: unused variable 'rcar_drif_of_table' [-Wunused-const-variable]
   static const struct of_device_id rcar_drif_of_table[] = {
                                    ^
   1 warning generated.


vim +/rcar_drif_of_table +1470 drivers/media/platform/renesas/rcar_drif.c

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1466  
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1467  static SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1468  			 rcar_drif_resume);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1469  
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12 @1470  static const struct of_device_id rcar_drif_of_table[] = {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1471  	{ .compatible = "renesas,rcar-gen3-drif" },
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1472  	{ }
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1473  };
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1474  MODULE_DEVICE_TABLE(of, rcar_drif_of_table);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2017-06-12  1475  

:::::: The code at line 1470 was first introduced by commit
:::::: 7625ee981af166ddb569e2e6c0006e2af471326f [media] media: platform: rcar_drif: Add DRIF support

:::::: TO: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
