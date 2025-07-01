Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9A212FB3;
	Tue,  1 Jul 2025 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399571; cv=none; b=RTonpwW+zf4ws4ulON2DaKH4S0oNrJDxD0e1zDAYhtTpJSdS3xnEIN3t29ILLSBMtaGnypWG2EjByw7sWpQg4Bff1uI5CO2RNBYQibAq178cwffYVI/Khuhinbr50awOFXjUon5pdbF0kQ9mEoL5qB7Yjgt9c15t1O5fTN6EgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399571; c=relaxed/simple;
	bh=GifqKRJ8E1f0v+YQE5RiQLEX+cdwaFetyEzmQSOKZYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWnOt9x6u53PWM4GX2LgqmRdvwxZlMOwpbUPZkVYsrTZSUhP/N8DNcf6W5azLKCwdGpyj3ZTvIhutR/iwR9NgBZxPdM2RUFrWyk8K8VJ23BHRVC5JK6KnTzv6sH2sZoSjfeNlPaa8RU6/QjwCBrQWnCdkdLYSNDSWMYwacF0K4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNrurgpS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNrurgpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751399569; x=1782935569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GifqKRJ8E1f0v+YQE5RiQLEX+cdwaFetyEzmQSOKZYk=;
  b=GNrurgpSunnq/p4fJWli2I5xHf+MC4CzWmziP2dxHBiZL0iHF6FuRkd4
   G7cP9KACxwukci9knzSK5nxtiA4C7bUGGEZlPjir/6YZUhRyrwii+uaBu
   N3pwCRoqXemJS9fOPSGAumrpZf/vp0pmps+ec5CDbgwjT/MB6YXQwrJFJ
   nSyNwjttk6/HjDbiJrtU1EftJB8g9yNfzIoqLEgyWc1+F9J3YcSbXCx77
   rePXcoomA3EQ7MoKimBiTMmKUUyVVDHQcE8cZPbetpRnwC31tL9Z/ey3c
   0jmuoC32vCiv4qUTZWgRBQXnl3xUUil41TnxL46PbWG4RuCQ5FSTg6mId
   Q==;
X-CSE-ConnectionGUID: GAI8s4hXQ/2brmj95BLM4Q==
X-CSE-MsgGUID: ER5oX3pxT0qMFdaxM+kp0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57457577"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57457577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 12:52:49 -0700
X-CSE-ConnectionGUID: ZhB9Z/IIRpGxFQL55iBufQ==
X-CSE-MsgGUID: EEHC7k22RAS006DOKE04GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184908369"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2025 12:52:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWh25-000acU-0W;
	Tue, 01 Jul 2025 19:52:45 +0000
Date: Wed, 2 Jul 2025 03:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6319/6384] drivers/md/dm-path-selector.c:127:6:
 error: unexpected token
Message-ID: <202507020329.VJ2a3wwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f804361f3b9af33e00b90ec9cb5afcc96831e60
commit: 878b9569818d2886a4ad305f2a01b75f3b92380d [6319/6384] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020329.VJ2a3wwo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020329.VJ2a3wwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020329.VJ2a3wwo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/dm-path-selector.c:127:6: error: unexpected token
     127 |         if (WARN_ON(!psi)) {
         |             ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:149:1: note: expanded from here
     149 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/md/dm-path-selector.c\"; .popsection; .long 10002b - .; .short 127; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/md/dm-path-selector.c"; .popsection; .long 10002b - .; .short 127; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   1 error generated.


vim +127 drivers/md/dm-path-selector.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  119  
f86272350f38d3 Mikulas Patocka 2025-06-30  120  void dm_unregister_path_selector(struct path_selector_type *pst)
^1da177e4c3f41 Linus Torvalds  2005-04-16  121  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  122  	struct ps_internal *psi;
^1da177e4c3f41 Linus Torvalds  2005-04-16  123  
^1da177e4c3f41 Linus Torvalds  2005-04-16  124  	down_write(&_ps_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  125  
^1da177e4c3f41 Linus Torvalds  2005-04-16  126  	psi = __find_path_selector_type(pst->name);
f86272350f38d3 Mikulas Patocka 2025-06-30 @127  	if (WARN_ON(!psi)) {

:::::: The code at line 127 was first introduced by commit
:::::: f86272350f38d3fa4049944257a1b4260f3eba2e dm-mpath: make dm_unregister_path_selector return void

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mikulas Patocka <mpatocka@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
