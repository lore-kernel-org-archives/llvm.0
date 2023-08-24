Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BCA7F;
	Thu, 24 Aug 2023 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692839870; x=1724375870;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ccwVnLBF1HgX97r9KDJxH3rQXRmo6jP4yaQ1KhhtW7g=;
  b=gXXGnmQW61Te3Fh7FwOxBJhvA34OT1lxTvoeIQV6fSHn+1Rqf46FESNK
   Ot+g/FmrVBmvTewQCAM2c9yegYmMCN6oB2Zh9gy+domyAG9Bu4lX/rVqE
   Xk7cV4IvCOEIksmGTVDCCph2YDFbvk9IuRP5r691XGwIBTJeBITNXn6wC
   PYOx3VRMCUcz24f26rEvCZs7wGNrZtHb9MuENYmbR01T1d9zy67EBPUrI
   FDnv1JDkZulX0cO6kDbnj7NDjpm6/+YzeKBwGppycgSTY/idVs5KW7m32
   tWbS75SM6xzXTxFcRX5RAqvT9NBRFhBCeFLfe9Noza9qe3phl+wu7jSnB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354645263"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354645263"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 18:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739991419"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739991419"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 18:17:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYyyp-0001eC-02;
	Thu, 24 Aug 2023 01:17:47 +0000
Date: Thu, 24 Aug 2023 09:17:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to
 next function __cfi_bmi160_data_rdy_trigger_set_state()
Message-ID: <202308240918.1K7FeIxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   93f5de5f648d2b1ce3540a4ac71756d4a852dc23
commit: 3c516f89e17e56b4738f05588e51267e295b5e63 x86: Add support for CONFIG_CFI_CLANG
date:   11 months ago
config: x86_64-randconfig-014-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240918.1K7FeIxT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240918.1K7FeIxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240918.1K7FeIxT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to next function __cfi_bmi160_data_rdy_trigger_set_state()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
