Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98785A23;
	Fri,  7 Jul 2023 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688689487; x=1720225487;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nTK1sfEt4oWY7Qcu5WaG7K9SSbtUiF+NreFB9ZwfDwo=;
  b=WMx8lS3h/qqCE2rh0fRNcLZUi1YRhH+/MetIO5ZoBeRrTzt0TQ/gTRFT
   vffMyXrWiJ+RwR8n6htati+r22z74PQcZ66kWwbdKQznF0BRHWqc8vQqK
   hMd9gAXfArI09kZSXD70fTIoIsXJ0593mMlJGpmuL4FDqZ1s34YhBM2wJ
   j/+m3anT5jqpPAu/t3q2wlGj6BeR88W1a2xQjdn+Lw0h66LvjPrxD5LUi
   5qPOgslbEgP+wEvpvqnuJK2IyRWfGfaMm1kWcivXVibvbf22JhqQzT4E2
   xCcSbPLalIR8ebVp9iD3LgubJjSbTPclo423X7DSCRcUq620uYhhX70Hl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394527583"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="394527583"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 17:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="785122595"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="785122595"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jul 2023 17:24:45 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHZHA-0001cs-3A;
	Fri, 07 Jul 2023 00:24:44 +0000
Date: Fri, 7 Jul 2023 08:24:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202307070855.Ugsll6JH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a452483508d7b70b0f6c69e249ec0b3ea2330b5c
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   1 year, 7 months ago
config: mips-ip28_defconfig (https://download.01.org/0day-ci/archive/20230707/202307070855.Ugsll6JH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070855.Ugsll6JH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070855.Ugsll6JH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-mr10k-cache-barrier=store'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
