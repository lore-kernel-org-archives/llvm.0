Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727C2F3C10;
	Tue,  4 Aug 2026 22:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881323; cv=none; b=pQ0biT0bFxcs9HnRXlEp05PfMxCOBtQsT7J1oexxzM81aPZVf1giagPVP4nHDHg1vQQHHYOvC9tivyJcrzOchQ8cUUdNeysTEhEkX/2ZuB4LqHy4Xd5uJgiKUHoFY/+PhOIztmvrsk4LUVJvActwgKP2aMpRV/iZiD+a2gzvnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881323; c=relaxed/simple;
	bh=LqeVkJSOrqZJnu0UaNmyGJcLXdWISZY51Q6Cz9gkw7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fe06LXUpVb0+xJ12KnTo1M9Oat7XWL2c20PTGfdYpWsl/V7pGhxFlvWrNtyxVVB3XSC4m32anXH+MEMv6oAEXM2LeNsR3PncnJnwtu4uzpi/n0lnxhCqXozaD+1ZpBmk4cydtOUFv4NhRCVty8LHJ9l2sbWYALhalsortdjVPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfVwymRh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfVwymRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785881321; x=1817417321;
  h=date:from:to:cc:subject:message-id;
  bh=LqeVkJSOrqZJnu0UaNmyGJcLXdWISZY51Q6Cz9gkw7M=;
  b=jfVwymRhoiKE6OowOHhWN8wljuuQdNn9P/Nyd+s9PS1RL7fsANfryYbm
   h/iF0ytG8GUzm2TGFXxX+Js44WhwMQjVHH3j9xfYAl3+lkI2SEfwZ1xkC
   Ifsn9Z6vxVlKos26CmH0Ml8oASCsELe+CF1QGBxSPToNhqWTJZ8qDIBFf
   nm4WpbrIQeZNlF+pF/07xffGpkk+BAXKLsbHtb2lCpQed6hkRnbLEKJAu
   JN7TuAsWzqrJzx8pA3BVQeejlPlPtUJZaxji0XbT1xQ3+bBoPBGrRPDkZ
   Mze7qpNPjk9XCINCs6I/AsdoRLRDKCzI42SqTA0e7BtENXMHIoJ/Bdwuo
   w==;
X-CSE-ConnectionGUID: rt9U+rnpQweJbkG6iKaklA==
X-CSE-MsgGUID: W5HEOhhcR3eF51Ls3XYwmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="88971399"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="88971399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:08:40 -0700
X-CSE-ConnectionGUID: PbxcCeQMRQGOgTjV2fiPEA==
X-CSE-MsgGUID: NwbPL0cMRN24tqmu9gbXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="260365779"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2026 15:08:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNJM-00000000ArN-0EO0;
	Tue, 04 Aug 2026 22:08:36 +0000
Date: Wed, 05 Aug 2026 06:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [linux-next:master 10012/12727] clang diag:
 arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro
 redefined
Message-ID: <202608050618.9dekfjtF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
commit: 73b741adb264967093ef4eb59905618a7e0d0de0 [10012/12727] rust: Add PowerPC support
config: powerpc-randconfig-001-20260805 (https://download.01.org/0day-ci/archive/20260805/202608050618.9dekfjtF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050618.9dekfjtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[3]: *** [rust/Makefile:721: rust/helpers/helpers.o] Error 1 shuffle=4010687375
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1416: prepare] Error 2 shuffle=4010687375
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4010687375
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4010687375
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
