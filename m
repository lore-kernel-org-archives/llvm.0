Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA017E;
	Mon,  4 Sep 2023 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693786262; x=1725322262;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wez0kwwEu7HexGaAquIS97Xk5XJytZmtmIZX83iAPjY=;
  b=Vg6A/be8P/i3yi/fUmLSNEurfjzkwC+5Py/dhutPfU0evmsV0uuans/a
   L8E734mYMGj+FxZePht3PqQJmyq7ju2VXn1NTTyJDImQNLqtIBZGQQHOG
   n9BwqlVhJNEyBK5yxQVpNTLvIis9INgG2v2Zj7ERAxzbwaHYfeMV3BfqP
   1rqnum475wbIC3uKM3Xk3LekFiUVzxAi5Q6LzYDf0QUaOWGgT0Ap8RUtb
   E3wmUc105+RCHXsZm0VZGTKOJcIbzGaoyHCsI98fV+L9tpCOgOw6yY2Tc
   iqGy67euudp9hP4bG6qGeXIJM3ow8hOU1UCIFboSumiIBjmz7vd3GvCN1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="379205621"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="379205621"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 17:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810710129"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="810710129"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2023 17:11:00 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcxBC-0003Wh-1C;
	Mon, 04 Sep 2023 00:10:58 +0000
Date: Mon, 4 Sep 2023 08:10:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.o:(.rodata.cst4): offset is outside the
 section
Message-ID: <202309040843.rLv0NQjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   708283abf896dd4853e673cc8cba70acaf9bf4ea
commit: 9f8fe647797a4bc049bc7cceaf3a63584678ba04 Makefile.debug: support for -gz=zstd
date:   10 months ago
config: i386-randconfig-016-20230904 (https://download.01.org/0day-ci/archive/20230904/202309040843.rLv0NQjl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309040843.rLv0NQjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309040843.rLv0NQjl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(.rodata.cst4): offset is outside the section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
