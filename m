Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261119E6A;
	Wed, 21 Jun 2023 23:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687388444; x=1718924444;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vi/qJrj873iiFfCZnbEd8a6B/g7bDlRGrgXO0YmXl6E=;
  b=GoKh+noa01IDYW0mmAkyj3KkvZRzhr3BQ9N+wWJZ4LVwRJSvhV9gLc5G
   OsxOQNIl0pn6s098Lmisucl1rII2gZSxIGxwOAmpqTC4aFa7Wjc3G8eqO
   hNGdLnKrisWJ+TUQ+7S/9bkQxsQTpuRcHScVWfKVRwzbdAqjLNFQnMp44
   qmLd8n6go5zEZEjyTr1+WpHn6iEHwKipNSwQWpdNcDTjEIZ8IyeI9RMYt
   I1t6+8HTs2tIVSaMXXIBSsLPjkTRYYXFEu6suMoIKH5y/dZeQkbwR1I01
   GfMVZo6kbUmk7mHtkUOMgaNKxhrzSH5jyW+lXZpjfkVAKyDy+c6d+uc21
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357825612"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="357825612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 16:00:23 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="748917852"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="748917852"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jun 2023 16:00:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC6oG-00078v-32;
	Wed, 21 Jun 2023 23:00:20 +0000
Date: Thu, 22 Jun 2023 06:59:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU '8540'
Message-ID: <202306220604.MnabNEhP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 powerpc/64: Set default CPU in Kconfig
date:   5 months ago
config: powerpc-ge_imp3a_defconfig (https://download.01.org/0day-ci/archive/20230622/202306220604.MnabNEhP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220604.MnabNEhP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220604.MnabNEhP-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: error: unsupported argument '-me500' to option '-Wa,'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
