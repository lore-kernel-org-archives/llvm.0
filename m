Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB337C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654585187; x=1686121187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugz5Yr2O87wU2aHl3D58metSBL+6GZHntS4uQF/xDd0=;
  b=VvpqBeZea5OmEP8pAfTPtgkvLKk3ZnlGrn9B4chcDCSZNEXcKeYKTEnG
   SBypGu9Srydq8piJ/bzodDMQGC5KDIX6Ind7lDvWsMQonVGvpxgOENL/5
   KYWHBukNdL52HQtByVdLAcqQJZ+uovhWU9oNPehKOLgY1ZVRNQrsLeQ8W
   wUM5OEtiOyyJQ+jSOXH6DTtie8uRq1Nb3C1Yn50+g97DMD0/BvSyxbhLj
   2/bh0/nb9zTpO3PIEqEbIJgrNhhQesql2VFPZ/pxO3BwlBCnVAl630SNM
   BW9Lc+qQKbdK2ISlqVOQ4Uoph8V0n8LhHRrFAnrzDXmJDgvvo23gWMyOs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="337968186"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="337968186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 23:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="584065425"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2022 23:59:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyTBp-000DRh-3V;
	Tue, 07 Jun 2022 06:59:45 +0000
Date: Tue, 7 Jun 2022 14:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [tglx-spdx:2022-batch1 11/25]
 arch/x86/crypto/crc32-pclmul_asm.S:2:2: error: unexpected token at start of
 statement
Message-ID: <202206071406.DZ8LbAVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/linux-spdx.git 2022-batch1
head:   91ba6750a1ba591f72b2f68e0a209c9cc7c0ace4
commit: 5de8e209fec395c4e3a43a9554ef3459547f0364 [11/25] treewide: Replace GPLv2 boilerplate/reference with SPDX - gpl-2.0_179.RULE
config: x86_64-randconfig-a009 (https://download.01.org/0day-ci/archive/20220607/202206071406.DZ8LbAVZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/linux-spdx.git/commit/?id=5de8e209fec395c4e3a43a9554ef3459547f0364
        git remote add tglx-spdx https://git.kernel.org/pub/scm/linux/kernel/git/tglx/linux-spdx.git
        git fetch --no-tags tglx-spdx 2022-batch1
        git checkout 5de8e209fec395c4e3a43a9554ef3459547f0364
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/crypto/crc32-pclmul_asm.S:2:2: error: unexpected token at start of statement
    */
    ^


vim +2 arch/x86/crypto/crc32-pclmul_asm.S

78c37d191dd6899 Alexander Boyko 2013-01-10 @2   */
78c37d191dd6899 Alexander Boyko 2013-01-10  3  

:::::: The code at line 2 was first introduced by commit
:::::: 78c37d191dd6899d8c219fee597a17d6e3c5d288 crypto: crc32 - add crc32 pclmulqdq implementation and wrappers for table implementation

:::::: TO: Alexander Boyko <alexander_boyko@xyratex.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
