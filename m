Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8723A9
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 06:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657605663; x=1689141663;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G0libjz9gg+1D5DhcHgGBSdmno6eBoH0q8p5daSIOZM=;
  b=Ec4Mh4clfK+7USHgHyKBtsGwCm/wEsNlYj78IBwtLHJy/GaYC8oCJN19
   yvyzYwZH+d3Wi4qbN9dV0AGCeNNY1vYRAL/dm5yvX/ThxlSsZgCOY+UZS
   4EEJT8z8DU1Kf+AfRpGyIyk9uQy7yl9F6S48hlRC4qkMbiRHZiLyB93EO
   eazX0CFFWgmz4qn+HXFlbugLDrIeVf80+qCIou+JcFQf8f3+a4xa2LtaU
   Pvka18QdWiktfT+5s3M+6CSeBcz7273z42SPL7WlojpSYAd8ULohhqzsE
   6J8EvHI6KX6U+UOagdBVXU6h479dRHa7FwCVWoIRNjlfUiZT7Xz3NwJhp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="265258902"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="265258902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 23:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="570063330"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 23:01:01 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oB8xB-0001n1-62;
	Tue, 12 Jul 2022 06:01:01 +0000
Date: Tue, 12 Jul 2022 14:00:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.cyapa_update_fw_store: unexpected
 end of section
Message-ID: <202207121346.z5Qtf4lj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a29232d870d9e63fe5ff30b081be6ea7cc2465d
commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14 scripts/Makefile.clang: default to LLVM_IAS=1
date:   11 months ago
config: x86_64-randconfig-a004-20220627 (https://download.01.org/0day-ci/archive/20220712/202207121346.z5Qtf4lj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.cyapa_update_fw_store: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
