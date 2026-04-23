Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F0F368977;
	Thu, 23 Apr 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946879; cv=none; b=K3VsXmvB/04ifl4ak5Prfhay5a0kaGg3RInG4/1cFb+hOxY0Iz78XCSRE8MBtQL+V0XfombC4L4pYDTHB8r4wcezEbI+VXGuGIM0PKYwIiO/xtOpvw+kQ//BNuc3X7xdA19NxuGqmNBywZGbF7R2weKqWwIYjUQPczxYQuDYIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946879; c=relaxed/simple;
	bh=7yml3KCwQFMRM8CLV/Tk69TcRqzhsWCqpHGHJ5hYBM4=;
	h=Date:From:Cc:Subject:Message-ID; b=SHVpfuAxMrLAhXOWoGh2Q6JVtRIxv1cOcYASUdWyLsWUFTaf0MCbA2yMDZCh5MG7KGVlVZC8vWIjcD5tcbomv9nf4GE4g3IXzE6sHkWZo/jEqxVOof1IxYI/LtrLq9mS2hv/fW1VorKLuaCdrQwI+UHut9paAy+qYWUU1V6edjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8ziVMwB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8ziVMwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776946878; x=1808482878;
  h=date:from:cc:subject:message-id;
  bh=7yml3KCwQFMRM8CLV/Tk69TcRqzhsWCqpHGHJ5hYBM4=;
  b=H8ziVMwBugqwZbdz5K+QY5wqjx0t0oy1g3HXIzmpVybOmrBQSmQG1ie2
   9IiDcffSF7vt2PFqDCzAWW1THBhxg+MaS02Xp+EYJ+M4ZdCm2khgEf+Oo
   CALSwVWtaC0HgtJUkyI9/s2W88znfXGi2JJ5A1yeqALVUxmQU2k5tLX65
   qmil9PmXoejC+dUPWRnCF1Ru50LMzlKepU2fobCYb1D1dPnJn7wfrzg72
   Mb5/VEGgBf6X/9WdLmMldyjhIqaYU5xpwetDjDss6gW6t/8UAeX0D2Lmt
   wqym0ceWPl7rdQ+XBDd+6OgM4RvqmcG199a/h1pxtLAg/EZwflWchNlJ8
   g==;
X-CSE-ConnectionGUID: Hf0tAgGGQ/+YfGpGZv46Pg==
X-CSE-MsgGUID: hiB9g3yxRrG7drUlZcpjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77975645"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77975645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 05:21:18 -0700
X-CSE-ConnectionGUID: Rl+7cm2ZRO+aBgh3Fx3/wg==
X-CSE-MsgGUID: GZt++8peQjuDDy3sDEJuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="231613985"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Apr 2026 05:21:17 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFt3S-000000002yP-24IH;
	Thu, 23 Apr 2026 12:21:14 +0000
Date: Thu, 23 Apr 2026 20:21:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 14465/14612] clang: error: ignoring
 '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s)
Message-ID: <202604232041.ESJDwVG4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   70c8a7ec6715b5fb14e501731b5b9210a16684f7
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd [14465/14612] LoongArch: Adjust build infrastructure for 32BIT/64BIT
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260423/202604232041.ESJDwVG4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604232041.ESJDwVG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604232041.ESJDwVG4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     641 | static int dts_version = 1;
         |            ^
   1 warning generated.
>> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
