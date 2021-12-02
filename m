Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F068
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 06:42:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="297436806"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="297436806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 22:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="677550997"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2021 22:42:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msfnD-000FzD-H0; Thu, 02 Dec 2021 06:42:07 +0000
Date: Thu, 2 Dec 2021 14:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Adrian Ratiu <adrian.ratiu@collabora.com>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/staging/media/hantro/hantro_g2_hevc_dec.c:536:5: warning:
 stack frame size (1264) exceeds limit (1024) in 'hantro_g2_hevc_dec_run'
Message-ID: <202112021403.foBPTSMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: cb5dd5a0fa518dff14ff2b90837c3c8f98f4dd5c media: hantro: Introduce G2/HEVC decoder
date:   6 months ago
config: mips-randconfig-r022-20211202 (https://download.01.org/0day-ci/archive/20211202/202112021403.foBPTSMx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cb5dd5a0fa518dff14ff2b90837c3c8f98f4dd5c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cb5dd5a0fa518dff14ff2b90837c3c8f98f4dd5c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/staging/media/hantro/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/hantro/hantro_g2_hevc_dec.c:536:5: warning: stack frame size (1264) exceeds limit (1024) in 'hantro_g2_hevc_dec_run' [-Wframe-larger-than]
   int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
       ^
   1 warning generated.


vim +/hantro_g2_hevc_dec_run +536 drivers/staging/media/hantro/hantro_g2_hevc_dec.c

   535	
 > 536	int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
