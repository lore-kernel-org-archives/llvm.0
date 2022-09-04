Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDC3C00
	for <llvm@lists.linux.dev>; Sun,  4 Sep 2022 23:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662335096; x=1693871096;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4eycWTCn7QnRoWrh0i2fI7iV6XtPfu26qzlrFBEus4Q=;
  b=C3HDV9UO2ayq4dR1Gn9+RQ8zDqVV4fp6Wn7o9vPrNb6LsY9lnHQwy1pv
   jSBEqrlBTCSUaQ4Kn1eFaYojSwOmFaIET6nLUuW7NuOjEPmphNfvq/JLa
   Vk1cOvTh4ZB0wp2Zbv3Ph7UcPwKTbfufWYG5jjQZDdtvQr2yUr7LEg755
   jGQPZ6C/tTLwCkqkW9ycwxwYKrnzCWLwWuj0VOGtPeFKFOeZRzx2sg1VW
   4wICB6Ife2iuRmZ1Gnx9+1EJLJqqbe/IIEZhdk9D262uV4hG8x4VHQAk4
   OgBIAK3d8NsZVp3qBhdxTsFoP9+ho06kyfkSUPPCYRAvgMZxTvMus8TX0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296280412"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="296280412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 16:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="590710998"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Sep 2022 16:44:55 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUzIM-0003WT-1D;
	Sun, 04 Sep 2022 23:44:54 +0000
Date: Mon, 5 Sep 2022 07:44:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: jffs2_erase_pending_blocks() falls
 through to next function jffs2_free_jeb_node_refs()
Message-ID: <202209050703.qCmWM37o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: 08feafe8d1958febf3a9733a3d1564d8fc23340e objtool: Fix function fallthrough detection for vmlinux
date:   5 months ago
config: x86_64-randconfig-a016-20220905 (https://download.01.org/0day-ci/archive/20220905/202209050703.qCmWM37o-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08feafe8d1958febf3a9733a3d1564d8fc23340e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08feafe8d1958febf3a9733a3d1564d8fc23340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function jffs2_free_jeb_node_refs()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
