Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1F36B18;
	Fri, 15 Dec 2023 23:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjzL49Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702683635; x=1734219635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDEUdFb7ZTNeNe3awC3E1KJh9Pef2sWDdsuZYoz1y50=;
  b=UjzL49ZtpEu1ttnh26FYqGGLXLgT7z/O6dKQ3PR4kn3wKPr4niTvTEDz
   VIq6Ua8lcmg6S5X88ZMrBcyppuTL+u4hArCwTetwqmzEwJS8pjLcPplxX
   zER3p0OP4l3zM4z9inxLB0xIKO67+APXvpmZRAveChafkEHlLl1iv2UYE
   T3Vz6dmmOerFnJmpXKQzuk0UmG9RHuDL8EwZRbdswD603J0FbDRw9UTrm
   5HO8oFVZ2fpTfa58C0SX3+RJP5qRx+t6OlPD59CVqjq+cRNYEaJa150CB
   lRQ/r0AYBAZufpiXy0VlSH+cMyNFfeRKbwIgqNN1lPS3DDFvuwfpYg+XZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="385759596"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="385759596"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 15:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="1106280747"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="1106280747"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2023 15:40:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEHn9-0000tm-1r;
	Fri, 15 Dec 2023 23:40:27 +0000
Date: Sat, 16 Dec 2023 07:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: scripts/kernel-doc: drivers/mtd/nand/raw/marvell_nand.c:352:
 warning: Excess struct member 'sels' description in 'marvell_nand_chip'
Message-ID: <202312160703.nnQfaSja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: a8eaf3ef549980719c5fcca257d5b220ac0f3f1b mtd: rawnand: marvell: Annotate struct marvell_nand_chip with __counted_by
date:   3 months ago
config: arm-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231216/202312160703.nnQfaSja-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160703.nnQfaSja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160703.nnQfaSja-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/mtd/nand/raw/marvell_nand.c:352: warning: Excess struct member 'sels' description in 'marvell_nand_chip'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
