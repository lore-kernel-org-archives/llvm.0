Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFB79E6;
	Fri, 30 Jun 2023 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688122525; x=1719658525;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4HEF6MdpQ7YI647g4i6s26cUF3n/1rzaTEkPD/XxYVc=;
  b=ljz/NGrz+zyhbLH3WG5VG6WGKtx0AZSkZ4NhIKmLER3oMVgp3o5Q2Gka
   DqxPQQ8LZqG4KVz+tr4JTYfmDafNEKTqQzm2lhvg4AWxZfkOuYEW/Yvcs
   1j/DOXIL0tV3t1DtdETUZdUeCQ+YelHo001RKJee/C9Ox7bud89yz9qp6
   QF9iDJTrbr0LlNUsU0nL9SXCizSIOMr4aNBaPys6kpyYhGgpH6XAIs3Z6
   uJvvlGBp1gEsgSC2Xv4nUnnF9BKsjPZDPFPSUQCGlofJa8aOHf6yzZ+3l
   6poQYV9h7Pto7F0IcjLC3gvrEE2xmVQN5pb3d+//i/qDfdMt9DxBgvO3f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364944603"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="364944603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 03:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="747384236"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="747384236"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jun 2023 03:55:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFBmc-000EtR-0N;
	Fri, 30 Jun 2023 10:55:22 +0000
Date: Fri, 30 Jun 2023 18:54:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU '8540'
Message-ID: <202306301838.vRSvqvaU-lkp@intel.com>
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
head:   e55e5df193d247a38a5e1ac65a5316a0adcc22fa
commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 powerpc/64: Set default CPU in Kconfig
date:   5 months ago
config: powerpc-mpc8560_ads_defconfig (https://download.01.org/0day-ci/archive/20230630/202306301838.vRSvqvaU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301838.vRSvqvaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301838.vRSvqvaU-lkp@intel.com/

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
