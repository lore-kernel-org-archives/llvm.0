Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D22E8DFC;
	Thu, 21 May 2026 01:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327417; cv=none; b=feMF5iYHYxxvaPIYP25IwLYOpUtP/WbctUo/zJae562TIBXIizX/gUXv8V/oAs4hMEx9daDh2UposBytmFwuVe2KlQ/S2M5twB7qv7gYmVoR1lxMlSvliUFMFKxrjLxHEYLsYKNhnojtsMalxjEmnXtnSkRwSO2LGpslA0jGd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327417; c=relaxed/simple;
	bh=YmfM6MvjatSyDeUoSoniZuNXpo86xYamzWWOe6UZAuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n74E1jGVjVx/Lrv97Ro9bVcKwhp2CqwyJMZASJZIKlX8ji/6khP56F4/6U0ii4wZ1rznb0dqYPZ1m2WI28KK1iR45w5LcMd99p8pBY7/YRmn65CX6U2Xz6WLSGBhI1MT+ap2+KAcscAkvNtzytpcULUkJVvNaptjD8PNYqmFIGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew8sRF1Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew8sRF1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779327414; x=1810863414;
  h=date:from:to:cc:subject:message-id;
  bh=YmfM6MvjatSyDeUoSoniZuNXpo86xYamzWWOe6UZAuY=;
  b=ew8sRF1YSs8gfzK6viUsD0aI9zMC62p99pSzGaUM1gUixJuGEnMKk7Z0
   3w/ruQvxnVzDEg5cqL+DGcnZC4+idsjTVkDf/iWkl6A8BnCI0DRbr9ZXa
   J+0Y/8f6EfqOb6XgRPfLeQVrTXuM6gyoDnqmtONuws0w6YVnB4Ia5wfhl
   YxxynJJqwf+w26NiH7K92R3rskpoSWj9Oi7aGHzy88Ej4RFh5doNP0Dm8
   fwGnO9dacZyCsquAMtU8wMbNTn93upe7piI/ZqKH9h2LV1gisSanaSacm
   oYhxJd78GeV18Hv6v0Djk9n3Lzzq2iTMD/NUTnsosucdVjNzSKcB7j5tc
   g==;
X-CSE-ConnectionGUID: LpbPv0bHTvaBuzf8vhGNPw==
X-CSE-MsgGUID: WBdI25pdTp+7e75KgpfIcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97809078"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97809078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:36:53 -0700
X-CSE-ConnectionGUID: q+m9+p05Qe2BRqOuGVJoCg==
X-CSE-MsgGUID: +slYbi9nSqePRijvJo2kSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237775978"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 18:36:51 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPsKq-000000004AJ-2eVo;
	Thu, 21 May 2026 01:36:37 +0000
Date: Thu, 21 May 2026 09:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (The Capable Hub)" <msp@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 2/3]
 arch/x86/kernel/signal_64.c:422:15: error: static assertion failed due to
 requirement '15 == 14': NSIGSEGV == 14
Message-ID: <202605210948.YFRGUzIF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 8b9ecbe3b33ed26fa45de2f3b928df3f6fd1713c [2/3] riscv/mm: Handle CHERI PTE faults
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605210948.YFRGUzIF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210948.YFRGUzIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210948.YFRGUzIF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/signal_64.c:422:15: error: static assertion failed due to requirement '15 == 14': NSIGSEGV == 14
     422 | static_assert(NSIGSEGV == 14);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/uapi/asm-generic/siginfo.h:248:18: note: expanded from macro 'NSIGSEGV'
     248 | #define NSIGSEGV        15
         |                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +422 arch/x86/kernel/signal_64.c

6be9a8f18fb2ea Brian Gerst        2022-12-19  413  
f6e2a56c2bad10 Brian Gerst        2022-12-19  414  /*
f6e2a56c2bad10 Brian Gerst        2022-12-19  415  * If adding a new si_code, there is probably new data in
f6e2a56c2bad10 Brian Gerst        2022-12-19  416  * the siginfo.  Make sure folks bumping the si_code
f6e2a56c2bad10 Brian Gerst        2022-12-19  417  * limits also have to look at this code.  Make sure any
f6e2a56c2bad10 Brian Gerst        2022-12-19  418  * new fields are handled in copy_siginfo_to_user32()!
f6e2a56c2bad10 Brian Gerst        2022-12-19  419  */
f6e2a56c2bad10 Brian Gerst        2022-12-19  420  static_assert(NSIGILL  == 11);
f6e2a56c2bad10 Brian Gerst        2022-12-19  421  static_assert(NSIGFPE  == 15);
cdce7a4bdf68ce Christian Ehrhardt 2025-06-11 @422  static_assert(NSIGSEGV == 14);
f6e2a56c2bad10 Brian Gerst        2022-12-19  423  static_assert(NSIGBUS  == 5);
f6e2a56c2bad10 Brian Gerst        2022-12-19  424  static_assert(NSIGTRAP == 6);
f6e2a56c2bad10 Brian Gerst        2022-12-19  425  static_assert(NSIGCHLD == 6);
f6e2a56c2bad10 Brian Gerst        2022-12-19  426  static_assert(NSIGSYS  == 2);
f6e2a56c2bad10 Brian Gerst        2022-12-19  427  

:::::: The code at line 422 was first introduced by commit
:::::: cdce7a4bdf68ce84ffd97a9b30b7cfc73951a674 [CHERRY-PICK] arm64: morello: Handle capability faults

:::::: TO: Christian Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
