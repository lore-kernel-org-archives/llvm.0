Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43C30ACE3;
	Fri,  3 Jul 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096381; cv=none; b=a0M69etRW17SfN+qSQY/3OzeSVS4G7BTKh+Ql4KXfD8ilDxrIO6bufM9m4s21+E4KEFgcnz4X9i28HKtOppvZQ+XS/TzKMjZc9Pums3QP6FxlUhNyry7XoHLGiZpCjOcTSRmCKgEKc9E5G1bInwmdOsIfHKIIBXJiS2FgkzcG7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096381; c=relaxed/simple;
	bh=kgRjdtYx37ZhHAv/u95dAfxGuCFc0nK/7vpAxnHfwQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dR1R7SikZ3fQrEM8HQABXY627HKP40ewgXXDxkb+990w17i5OM3SmmFWGo8f9CpbOYDYPv5I6+XoVIzDiEmE4cmGIq/4l8YE6k4h6b+OxDbhtCj8mixiQ/hu/25Xpfba5v6HmLfiT+0fdcPbKtnQChOkN2xPrHuySPxyutM8cN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6DftZMo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6DftZMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783096380; x=1814632380;
  h=date:from:to:cc:subject:message-id;
  bh=kgRjdtYx37ZhHAv/u95dAfxGuCFc0nK/7vpAxnHfwQk=;
  b=S6DftZMoWdSWFR5ON21HHBHvjQ960Nq+flL0F5KJuqht8C2Z/jd+Ge0s
   SvrwmooKkFXf5oALKTkJ7xIudTL/I7Td8eKPAaprAshtBnPA0A6P/Yu/Z
   +jF3KaZ8WJd1ebDveQP+wo9oDHuLUHcxm/l0QWjhrLRsbKueuNNqzSTXb
   x8a42dD3G51CqOZkL9kcaCkZ1kdfmo6WzsNkorHrYbw3AXKfiU2xgMtnx
   pjgXQoiKWYLpO23yb7/fz0TehKi/KlUWX8fMNEMW9Le8nqw4XsD1naog0
   Dvpz5QUhBYcSpHzKV3OsfYbISh9S143q1cjk8Fa48trzCrKTfGvP1Chco
   w==;
X-CSE-ConnectionGUID: neFMclUxQj+eE34t6/2CVg==
X-CSE-MsgGUID: y+Dj/ZA6StKJjIGTwCajhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83979812"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83979812"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:32:59 -0700
X-CSE-ConnectionGUID: E/wiK2vQSDqKGkrkGRoHmw==
X-CSE-MsgGUID: iK8G5HwETGyQ7dEhSA1gNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252086446"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2026 09:32:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfgow-00000000CMd-342L;
	Fri, 03 Jul 2026 16:32:54 +0000
Date: Sat, 04 Jul 2026 00:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 26/62]
 arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for
 function 'early_init_dt_add_memory_arch'
Message-ID: <202607040014.To1xcY2c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a74f943885b7a0e655c7c47d4d02f852c12c1ce1
commit: 5ff1ea15270dcaa04752f16f8a9b055a6b013c6f [26/62] hexagon: add memory management enhancements
config: hexagon-randconfig-002-20260703 (https://download.01.org/0day-ci/archive/20260704/202607040014.To1xcY2c-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040014.To1xcY2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040014.To1xcY2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         |             ^
   arch/hexagon/kernel/devtree.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         | ^
         | static 
   arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |             ^
   arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         dt_root = of_get_flat_dt_root();
         |                   ^
   arch/hexagon/kernel/devtree.c:132:15: error: call to undeclared function 'of_flat_dt_match_machine'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                      ^
   arch/hexagon/kernel/devtree.c:132:13: error: incompatible integer to pointer conversion assigning to 'const struct machine_desc *' from 'int' [-Wint-conversion]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:142:9: error: call to undeclared function 'early_init_dt_scan_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |         early_init_dt_scan_root();
         |         ^
   arch/hexagon/kernel/devtree.c:147:2: error: call to undeclared function 'early_init_dt_scan_chosen'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         early_init_dt_scan_chosen(boot_command_line);
         |         ^
   arch/hexagon/kernel/devtree.c:107:16: warning: variable 'dt_root' set but not used [-Wunused-but-set-variable]
     107 |         unsigned long dt_root;
         |                       ^
   2 warnings and 7 errors generated.


vim +/early_init_dt_add_memory_arch +17 arch/hexagon/kernel/devtree.c

9f79ac50516cbd Richard Kuo 2025-08-18  15  
9f79ac50516cbd Richard Kuo 2025-08-18  16  /*  called via early_init_dt_scan_memory?  */
9f79ac50516cbd Richard Kuo 2025-08-18 @17  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
9f79ac50516cbd Richard Kuo 2025-08-18  18  {
9f79ac50516cbd Richard Kuo 2025-08-18  19  	//  Cheesy solution is to just twiddle bootmem_lastpg
9f79ac50516cbd Richard Kuo 2025-08-18  20  	BUG();  ///  XXX Todo fixme
9f79ac50516cbd Richard Kuo 2025-08-18  21  }
9f79ac50516cbd Richard Kuo 2025-08-18  22  

:::::: The code at line 17 was first introduced by commit
:::::: 9f79ac50516cbd38e6d96df3e6da44a66921018d hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
