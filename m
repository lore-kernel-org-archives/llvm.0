Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323D29CA
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641992689; x=1673528689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otrlf0TLwmjZRvUxM9bfrO14jmluagoPTWq+W4/kW8w=;
  b=PG/NaviUflty1Cu4iSuz8MyNeIS4EBikblqCZEkEHfLHhr+/Fwd/uFfS
   ubtgdN7UC7CAtA+UIMEBdWsXNVUvS0qB/85aLv/lJCsnkpHsdkCTZdULI
   A/k99bkVKnyM2vjuAhnQ3/hCVSxNyYGTtumQKmL46mfzOOdW0eprazqQY
   SGDvcNvuxIp6WMgnTKranZAo1eQhzih4FjWvYj9yGletPqJLF/SE9wu8+
   xjygaVIEnFEBUo4vRCIHB8EUcxuU97KjQp8Ud5NnKa54JnU6fiwqcE6tR
   laaSq+lX3R1RL90mp1e2q0j7aaVElOcVrUaKT0pyWo306+htg/ZhUyW4H
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="304465773"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="304465773"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 05:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="558702484"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jan 2022 05:04:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7dIz-0005pI-Ug; Wed, 12 Jan 2022 13:04:45 +0000
Date: Wed, 12 Jan 2022 21:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/media/platform/allegro-dvt/allegro-core.c:3206:34: warning:
 unused variable 'allegro_dt_ids'
Message-ID: <202201122143.NO6WA9tr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Michael,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   daadb3bd0e8d3e317e36bc2c1542e86c528665e5
commit: d74d4e2359ec7985831192f9b5ee22ed5e55b81c media: allegro: move driver out of staging
date:   1 year ago
config: mips-buildonly-randconfig-r004-20220112 (https://download.01.org/0day-ci/archive/20220112/202201122143.NO6WA9tr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d74d4e2359ec7985831192f9b5ee22ed5e55b81c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d74d4e2359ec7985831192f9b5ee22ed5e55b81c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/allegro-dvt/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/allegro-dvt/allegro-core.c:3206:34: warning: unused variable 'allegro_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id allegro_dt_ids[] = {
                                    ^
   1 warning generated.


vim +/allegro_dt_ids +3206 drivers/media/platform/allegro-dvt/allegro-core.c

f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28  3205  
f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28 @3206  static const struct of_device_id allegro_dt_ids[] = {
f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28  3207  	{ .compatible = "allegro,al5e-1.1" },
f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28  3208  	{ /* sentinel */ }
f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28  3209  };
f20387dfd065693 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tretter 2019-05-28  3210  

:::::: The code at line 3206 was first introduced by commit
:::::: f20387dfd065693ba7ea2788a2f893bf653c9cb8 media: allegro: add Allegro DVT video IP core driver

:::::: TO: Michael Tretter <m.tretter@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
