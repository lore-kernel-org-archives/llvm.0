Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA553686
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647549489; x=1679085489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izW1J7nMvMyfzQRtUDJRsjFXu/vL7GV0U6SezsmFX3Q=;
  b=Q/R9JoKU/Pt5Jp2W8kBAGof380wsXqjIGpGLRjVfYBMffXaV1ykg8xSz
   rwU2wmlWQTCB4J7yqZYrDfeoT1M777zGnpyU1h05/y73qtT8D/Bew9+9O
   Q00XwCIZG/ceAHXNX+6/lmQgRFsyJj0qXKRz1R956BQlT6NMSq78AMdkv
   VsM+k/QQwJsOKnoThFdXRag7VwSgApWk1dKBd/2ie6jGzyPdT9lrDb9W7
   bg1M98wIk3U3f6zDkA6ZDOH/LV4X+VWAYgLTFyiLJ8IufRPVs36f27KfK
   QgM84a3GMw9EvILcAyyFx1MGVJRVqKMdS8E57d3r5K9cO7wo8z7v/H16K
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="255804568"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="255804568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 13:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="498977576"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2022 13:38:06 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUwso-000E3C-8Q; Thu, 17 Mar 2022 20:38:06 +0000
Date: Fri, 18 Mar 2022 04:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 11721/13392]
 drivers/media/platform/renesas/renesas-ceu.c:1609:30: warning: unused
 variable 'ceu_data_rz'
Message-ID: <202203180453.7LxvqwzJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97add482e9033a9386baa8824fbea34d0cbfe663
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 [11721/13392] media: platform: place Renesas drivers on a separate dir
config: hexagon-randconfig-r021-20220317 (https://download.01.org/0day-ci/archive/20220318/202203180453.7LxvqwzJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/renesas-ceu.c:1609:30: warning: unused variable 'ceu_data_rz' [-Wunused-const-variable]
   static const struct ceu_data ceu_data_rz = {
                                ^
   1 warning generated.


vim +/ceu_data_rz +1609 drivers/media/platform/renesas/renesas-ceu.c

32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1608  
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22 @1609  static const struct ceu_data ceu_data_rz = {
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1610  	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1611  };
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1612  

:::::: The code at line 1609 was first introduced by commit
:::::: 32e5a70dc8f4e9813c61e5465d72d2e9830ba0ff media: platform: Add Renesas CEU driver

:::::: TO: Jacopo Mondi <jacopo+renesas@jmondi.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
