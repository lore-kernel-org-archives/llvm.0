Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD615B4;
	Sat,  9 Sep 2023 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694256611; x=1725792611;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+eXlc0jmB3hCfwJuROYxdQ2x4f9mpGgVkZPKupaTbXg=;
  b=J+CcR09W0JB7dfwP2Kwg58IUIMp022avhZ0h7BNq19/W/3qhBHfGoQ7n
   jEl2Lev/Z+c99DXvb3ecTbuJ6+xmZE8J4BzmWBek0Mws2uAFQe9lzvx/b
   fA1ZAwJlLn4ICi+Pk7V2Slco1zOmcyFs8cSaKgmWY9/2br7fJYiwIjRSQ
   esNcBmPwTHI3/xjQPlBVfLXiuuffhmgT9dEQSVHU8MS51xvEwk8XoY6H7
   MrtBQslclXEnRq7JW4Unlu+uIj1XAqlZRGrrPtCMyULKyHOw6C6Rhfpc+
   koVZzioiV8YiE412uG8zrCjwvPBQaikVLlfVcp4t2F+pCd0C6iie7vpzi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368072506"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="368072506"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 03:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916463121"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="916463121"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2023 03:50:10 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qevXT-0003Ks-2r;
	Sat, 09 Sep 2023 10:50:07 +0000
Date: Sat, 9 Sep 2023 18:49:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to
 elf_init_reloc_text_sym() for data symbol .rodata
Message-ID: <202309091858.5MfqkMXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 6342a20efbd8b70d169c325b2c27a8a8f96388d5 objtool: Add elf_create_section_pair()
date:   3 months ago
config: x86_64-randconfig-011-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091858.5MfqkMXT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091858.5MfqkMXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091858.5MfqkMXT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
