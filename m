Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626F27F19F;
	Thu, 21 May 2026 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340537; cv=none; b=h8/h57z70G0ig6Sh5PEIJRElAn6WAsu12fEq/3lv9AeldkF889JFlqcKJiGjfduNZO062PwcNVtkmRw1cL7B3E4zlIUO/XMzANQmDyEuPdlEWZ7bg8sw1pSPtoWr1FpdhkKMejQxbsf9FludOtVnsHy5y4Ua/b2dtovNCscvxAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340537; c=relaxed/simple;
	bh=mUe7oM73sAA4Iy4TFIHJvepuXuIp41XUS/I7dOlFoaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRmG10nb3ej3WUdwNvN+sVCNHQqjwLFDxyZdYSpM3oPo01H47uLk+ieg30UiXXg6GQwjysKIG/q1M7Djr9JJWK0dENVey/voomTidjqMG8MzowybtXE8VdoSJzglTudKQHAlOZrv2UBFH2p0425EcLarr4N09RGUYQh1IbSZs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKvvR3T6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKvvR3T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779340536; x=1810876536;
  h=date:from:to:cc:subject:message-id;
  bh=mUe7oM73sAA4Iy4TFIHJvepuXuIp41XUS/I7dOlFoaY=;
  b=fKvvR3T6FLepAL3aAi+i1O4icgS0Srex6AiECVOBqhZawe9tWNS6AS4N
   rWSRKsQUtSJ2Z71ROKuv839V32f18gshOGhZVVEPt5CE/zdZ+p8y4dxwU
   K3KTjgDSjZGh7b9KJUWNsYhe6iVDQtjs4MZBA1wqzZ71bhTizq9yqsC/n
   EHZ6ppRCWDlXEFrBfc/EAnTihFM8D7WgGaIgJUUk7rtxizqTvKONhpfjF
   HFpg2CsdXjazaJh0eCcsfUEk8hNRc2e50/mee9LHq7NFSKgo70kBEmu2D
   SpxY7ZelhzeLoTJLCfhXJm2C8K7I0ID8LeYfIKwttcagru4QUQUTBzjTD
   A==;
X-CSE-ConnectionGUID: gkC0sphyTkq1tk88nE4E3A==
X-CSE-MsgGUID: xYxBtCldQvGqzc2G3zRVGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90827699"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90827699"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:15:35 -0700
X-CSE-ConnectionGUID: LQnlslM2TKmIfFW7hSPebQ==
X-CSE-MsgGUID: 3wY/mLQVSK2bCuGr0xv77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="264223139"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2026 22:15:33 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvkX-000000004RT-0Ho1;
	Thu, 21 May 2026 05:15:17 +0000
Date: Thu, 21 May 2026 13:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 473/1130]
 arch/arm64/include/uapi/asm/posix_types.h:12:9: error: unknown type name
 '__uint128_t'
Message-ID: <202605211315.O5VOW3zW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 0d283af99c34aeeaf0f47c8eaf0eda0789d565e7 [473/1130] [CHERRY-PICK] arm64: lib: Switch to capability-based copy_*_user in PCuABI
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211315.O5VOW3zW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211315.O5VOW3zW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211315.O5VOW3zW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:147:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:775:9: warning: 'get_user_ptr' macro redefined [-Wmacro-redefined]
     775 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^
   arch/arm64/include/asm/uaccess.h:478:9: note: previous definition is here
     478 | #define get_user_ptr    __get_user_ptr
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:147:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:776:9: warning: 'put_user_ptr' macro redefined [-Wmacro-redefined]
     776 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^
   arch/arm64/include/asm/uaccess.h:487:9: note: previous definition is here
     487 | #define put_user_ptr    __put_user_ptr
         |         ^
   2 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:775:9: warning: 'get_user_ptr' macro redefined [-Wmacro-redefined]
     775 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^
   arch/arm64/include/asm/uaccess.h:478:9: note: previous definition is here
     478 | #define get_user_ptr    __get_user_ptr
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:776:9: warning: 'put_user_ptr' macro redefined [-Wmacro-redefined]
     776 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^
   arch/arm64/include/asm/uaccess.h:487:9: note: previous definition is here
     487 | #define put_user_ptr    __put_user_ptr
         |         ^
   2 warnings generated.
   In file included from arch/arm64/kernel/vdso32/note.c:11:
   In file included from include/linux/elfnote.h:62:
   In file included from include/uapi/linux/elf.h:5:
   In file included from include/linux/types.h:20:
   In file included from include/uapi/linux/types.h:14:
   In file included from include/uapi/linux/posix_types.h:36:
>> arch/arm64/include/uapi/asm/posix_types.h:12:9: error: unknown type name '__uint128_t'
      12 | typedef __uint128_t __kernel_uintcap_t;
         |         ^
   1 error generated.
   In file included from <built-in>:3:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/auxclock.h:5:
   In file included from include/uapi/linux/time.h:5:
   In file included from include/linux/types.h:20:
   In file included from include/uapi/linux/types.h:14:
   In file included from include/uapi/linux/posix_types.h:36:
>> arch/arm64/include/uapi/asm/posix_types.h:12:9: error: unknown type name '__uint128_t'
      12 | typedef __uint128_t __kernel_uintcap_t;
         |         ^
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:132: arch/arm64/kernel/vdso32/note.o] Error 1
   1 error generated.
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:134: arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:213: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__uint128_t +12 arch/arm64/include/uapi/asm/posix_types.h

34c65c43f1518b Will Deacon        2014-06-02   8  
0296769ee41e70 Christian Ehrhardt 2025-06-11   9  #ifdef __CHERI__
0296769ee41e70 Christian Ehrhardt 2025-06-11  10  typedef __uintcap_t __kernel_uintcap_t;
0296769ee41e70 Christian Ehrhardt 2025-06-11  11  #else
0296769ee41e70 Christian Ehrhardt 2025-06-11 @12  typedef __uint128_t __kernel_uintcap_t;
0296769ee41e70 Christian Ehrhardt 2025-06-11  13  #endif
0296769ee41e70 Christian Ehrhardt 2025-06-11  14  

:::::: The code at line 12 was first introduced by commit
:::::: 0296769ee41e70a071b9890a57952787c64cc156 [CHERRY-PICK] arm64: morello: Signal handling support

:::::: TO: Christian Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
