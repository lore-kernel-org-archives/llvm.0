Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B66FCD1;
	Tue,  5 Dec 2023 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxOsYx+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813415; x=1733349415;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2OPXpTmJCIDcrRgxZxhB97w8GEbwddByqEeySBbzUik=;
  b=YxOsYx+hqs4/mfCWMWMrix4NVsobUtoGo5ASZEgPgjDqidGpD7rvza/c
   +OxS244Ez7vI1abM4uGLHpzPdB3vYWRx7V2ua63y28XdHZV9w42Ur95My
   wx5dEXQKTF/KdJDxCfJjmByP03gSTmzPYH3LYBu96iv9D7wNN8Gn3emSM
   /L1bD1Vd+5YvDOHr9YhGK4IlecMfXwWrORM4uMm0LOxlWgIXp0RojVTTS
   Vt+TVKAm3pEyK+yO0AIcUm214AnlLabfwCmW1HTetCiWKek4/g6aReYwp
   /f0/a9NoGfolEGrVKa7W+xpZoCr+JdxfvoEVXxMV5w16mVWEpSkJ3q8wJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393697566"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393697566"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889087074"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="889087074"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:56:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPQ-0009mS-08;
	Tue, 05 Dec 2023 21:56:52 +0000
Date: Wed, 6 Dec 2023 05:56:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 4/11]
 drivers/net/ethernet/chelsio/cxgb/cxgb.o: warning: objtool: t1_netpoll+0x4d:
 indirect call found in RETPOLINE build
Message-ID: <202312060525.gF4X125a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: 4e0928208ef241e2f7ea9367bda43386f8aec87c [4/11] objtool: Convert instrumentation_{begin,end}() to ANNOTATE
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060525.gF4X125a-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060525.gF4X125a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060525.gF4X125a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb/cxgb.o: warning: objtool: t1_netpoll+0x4d: indirect call found in RETPOLINE build

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
