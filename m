Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1FC1DA42;
	Fri, 28 Jul 2023 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690579393; x=1722115393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=au3jS5c503/YSiZLn/WbX/Bf8rD1c3n81dbW1VtJHqM=;
  b=LPsJDKwOwT7lygcgUmD8x5Ejdv16Ow7mdeD8WsFfi0J5vTIRhVyjo0ls
   Cder0Oqr6jj8N/cFqu98orOLMcqXdi+K9I4kNJVlD63pmPVkLEh0WSU38
   U0bB1foe65A8mBnbm/BA+GAr2NZgs2X2E2QBObX58AgOym7rEdAOSAtb1
   mhFIKGa1I0ShIkNUKy/f+8bWESKRJRxwj92sXoMf8RiTrRzQ1GMedV3O7
   5pciQ+bP/Znb1VSE6yKeGQtnL7fpolQeWhPeVBBQi8lpACMmQnohePIGM
   QHPLI3rGaAo9kblCgbFPhrv+G/sLHoMlIiyfCYanFFP10OZBJWGbFxymh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353592841"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="353592841"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 14:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="817641292"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="817641292"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2023 14:23:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPUvU-0003aV-05;
	Fri, 28 Jul 2023 21:23:08 +0000
Date: Sat, 29 Jul 2023 05:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [stable:linux-5.15.y 3221/9999] lib/locking-selftest.c:2792:6:
 warning: stack frame size (10112) exceeds limit (8192) in 'locking_selftest'
Message-ID: <202307290545.6BFaYjDe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   09996673e3139a6d86fc3d95c852b3a020e2fe5f
commit: 7434626c5eaaf4178c643f79828f8cf288308dfd [3221/9999] hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero
config: s390-randconfig-r015-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290545.6BFaYjDe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290545.6BFaYjDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290545.6BFaYjDe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/locking-selftest.c:2792:6: warning: stack frame size (10112) exceeds limit (8192) in 'locking_selftest' [-Wframe-larger-than]
    2792 | void locking_selftest(void)
         |      ^
   1 warning generated.


vim +/locking_selftest +2792 lib/locking-selftest.c

8946ccc25ed22d Boqun Feng  2021-06-19  2791  
cae2ed9aa57341 Ingo Molnar 2006-07-03 @2792  void locking_selftest(void)

:::::: The code at line 2792 was first introduced by commit
:::::: cae2ed9aa573415c6e5de9a09b7ff0d74af793bc [PATCH] lockdep: locking API self tests

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
