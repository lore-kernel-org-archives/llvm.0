Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C1F846D;
	Wed,  6 Dec 2023 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huUvZKnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701832643; x=1733368643;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pYYLxhvLkWBneHWGwqq0cLzhzncn8zZIlSSn0wvWev8=;
  b=huUvZKnjKN9jwDr3Is8asAZvSbdqbjR2zmNcCGfU5zPiA8lbtfe8vqs6
   FiQKehpiwh8N9QQxS1AACBsfkpFH25pQa2WcPHxzv/mks1pTVYQARcDdd
   iIeSkxzy+dbYz0zSAgVsJEFiYQ1CU2KN+w5P9eh/C1X5Fm1bH98b5Almi
   dBLqVworYMCbx7cHBm8mFBN7H2DktpbOwXzzTZpSp6FrPVUNe5CLymJcK
   S1M8Aw0DMeF57rx39sHxjNEPjoL+Cg22KzSqiaYwQ1XSn02SKj+SJlEAc
   8ELTdu/KYBYkmD0TtdJQ5kUhYQsgNtPEdJilzwja/pzZToiTVIC+sDRxo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396788968"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="396788968"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944499419"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="944499419"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 19:17:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiPX-000A9M-0f;
	Wed, 06 Dec 2023 03:17:19 +0000
Date: Wed, 6 Dec 2023 11:17:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to
 elf_init_reloc_text_sym() for data symbol .rodata
Message-ID: <202312061153.52MKrRYd-lkp@intel.com>
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

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 6342a20efbd8b70d169c325b2c27a8a8f96388d5 objtool: Add elf_create_section_pair()
date:   6 months ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312061153.52MKrRYd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061153.52MKrRYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061153.52MKrRYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
