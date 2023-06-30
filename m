Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1B914AB4;
	Fri, 30 Jun 2023 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688127687; x=1719663687;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+ZDLGPj7J48w0XqFNiONkapFVGymUoH4WRqyaLgIkv8=;
  b=DDud1ohCON0ScazMbP86rjrAXxLqzkzi98dbaMNKa/EmpY4TH0ifHash
   lkTbrstXKzkkz+SM4RfqnUEJ4ayBLFfmZ/sauROxiOA0JhxgCqf+Q/SFJ
   X6EVHxg3laUSf3wCXxWWckbBYgsvMbt6TW/8c9dZcz+qHhSZX7y0dCF5K
   DmRylXu4zOsKIbKCqfWDZmrhko1qnuWhiEDUQhc2IYMF38YjYzpsPMN16
   eeaeV6abSz6MO108MFwxkYno4daWkRMgrx2JAfozX4w//vyLgGyoMgA/7
   vQtU4ALfWerTO8YTpcNMfK9C8xOYZDjR1t3xIFq0YZnt7BMwqpkwL8iyv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364958173"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="364958173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048213668"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="1048213668"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2023 05:21:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFD7t-000Ex8-0b;
	Fri, 30 Jun 2023 12:21:25 +0000
Date: Fri, 30 Jun 2023 20:21:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-6.1.y 4267/7107] error: unknown target CPU '8540'
Message-ID: <202306302004.rqllCOkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   a1c449d00ff8ce2c5fcea5f755df682d1f6bc2ef
commit: da0beae2449376326086e9f57468fd2b64736d2a [4267/7107] powerpc/64: Set default CPU in Kconfig
config: powerpc-mpc8560_ads_defconfig (https://download.01.org/0day-ci/archive/20230630/202306302004.rqllCOkx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302004.rqllCOkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302004.rqllCOkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: error: unsupported argument '-me500' to option '-Wa,'
   make[2]: *** [scripts/Makefile.build:250: scripts/mod/empty.o] Error 1
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:118: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1288: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:238: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
