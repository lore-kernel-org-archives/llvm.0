Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21F524F;
	Sun,  6 Jul 2025 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751800304; cv=none; b=U5Kpks2OEPoJ+RezS2HEGLgWnR+GV4mzNfqQzqKMtNILXpR53rx/ZYON0Wy9TaNcGxPNfwz+Kn0Fo3/x7Gix25PwOekUmz7IAQpHWuS6Lp4/nkYnM5DC1B4QvCx4OrE7+GrLFkXgF/jLoQ3dMtmmcvX4MQV3z97Vwyn/V0Wh10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751800304; c=relaxed/simple;
	bh=7ykIUaLsXqE/DW+4veJ7xsiMbBYc8DSS/9oNl2dQjlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c52SMXP947vGBXgAagrlCPOphF2tHNc693jY+EC/y/sTYy4uT8xG/2fEYuUJ4QbvLFzpFWSv0mD2Gy0TEroLn21PH+2OisfGMbHPOTlNDmPK+kUUjeB0oIpuWKGgDcxD4/AKV4Dl9gE27osbwa5znj8Fe+OrE74k0AYgu9+z138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLnGAJNL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLnGAJNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751800302; x=1783336302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ykIUaLsXqE/DW+4veJ7xsiMbBYc8DSS/9oNl2dQjlA=;
  b=YLnGAJNLxoCYena31QbRK+DaBOwXux5sgfteIwXo608F+LSr45ybqaeU
   2r96JM94ZGGB1x8vcoi5lVF/DMG6o+kqd2HND39APjfc6B4igjzmjNVaC
   //pta634BIILaqH6lK+DVger29Kxwva8WzzwgMmU0TLuwMTqnOxdq+RYU
   4ofbE14XSrDwX2cZNdf/ASVaQrDu3rpC15/fKVXauxJJ6IgwdRW84bG0e
   8n2W/u6S5TatocyIEM4fjUi7T1AieQfcNMPZKcli2cMDza0Ex4xd9WfQa
   rc7qKWnrsmGbW5eP79sk+JSyAPg22rtIAASBmYstuGKu8M64DZ2mqzyd9
   Q==;
X-CSE-ConnectionGUID: mAFAfmGuQ3erkw59T071pA==
X-CSE-MsgGUID: JV8X1NAnStmDABRB/GCXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53965786"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53965786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 04:11:41 -0700
X-CSE-ConnectionGUID: UEFBeprHQh2I+OTNG0kVTg==
X-CSE-MsgGUID: c1M9Qg/XTdiWHYF7hCSy7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="178646476"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2025 04:11:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYNHW-00052R-1G;
	Sun, 06 Jul 2025 11:11:38 +0000
Date: Sun, 6 Jul 2025 19:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.16-rc1-stable-hack
 16/17] arch/arm64/kernel/process.c:254:22: error: no member named
 'tpidr_el0' in 'struct pt_regs'
Message-ID: <202507061857.7wjLK0H9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.16-rc1-stable-hack
head:   178f7c4cb623ac979acb47a40a4d3b38a07da75c
commit: c56ccd37e218f2448f4268ff06d3f0997b4ef0b9 [16/17] arm64: Support dynamic kernel stacks
config: arm64-randconfig-002-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061857.7wjLK0H9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061857.7wjLK0H9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061857.7wjLK0H9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:254:22: error: no member named 'tpidr_el0' in 'struct pt_regs'
     254 |                 current_pt_regs()->tpidr_el0 = 0;
         |                 ~~~~~~~~~~~~~~~~~  ^
>> arch/arm64/kernel/process.c:270:23: error: no member named 'tpidrro_el0' in 'struct pt_regs'
     270 |                         current_pt_regs()->tpidrro_el0 = 0;
         |                         ~~~~~~~~~~~~~~~~~  ^
   arch/arm64/kernel/process.c:445:43: error: no member named 'tpidr_el0' in 'struct pt_regs'
     445 |                         *task_user_tls(p) = current_pt_regs()->tpidr_el0;
         |                                             ~~~~~~~~~~~~~~~~~  ^
   arch/arm64/kernel/process.c:531:48: error: no member named 'tpidr_el0' in 'struct pt_regs'
     531 |                 *task_user_tls(current) = current_pt_regs()->tpidr_el0;
         |                                           ~~~~~~~~~~~~~~~~~  ^
   arch/arm64/kernel/process.c:544:24: error: no member named 'tpidrro_el0' in 'struct pt_regs'
     544 |                         task_pt_regs(next)->tpidrro_el0 = next->thread.uw.tp_value;
         |                         ~~~~~~~~~~~~~~~~~~  ^
   arch/arm64/kernel/process.c:549:24: error: no member named 'tpidrro_el0' in 'struct pt_regs'
     549 |                         task_pt_regs(next)->tpidrro_el0 = 0;
         |                         ~~~~~~~~~~~~~~~~~~  ^
   arch/arm64/kernel/process.c:555:23: error: no member named 'tpidr_el0' in 'struct pt_regs'
     555 |                 task_pt_regs(next)->tpidr_el0 = *task_user_tls(next);
         |                 ~~~~~~~~~~~~~~~~~~  ^
   7 errors generated.


vim +254 arch/arm64/kernel/process.c

   250	
   251	static void tls_thread_flush(void)
   252	{
   253		if (IS_ENABLED(CONFIG_DYNAMIC_STACK))
 > 254			current_pt_regs()->tpidr_el0 = 0;
   255		else
   256			write_sysreg(0, tpidr_el0);
   257		if (system_supports_tpidr2())
   258			write_sysreg_s(0, SYS_TPIDR2_EL0);
   259	
   260		if (is_compat_task()) {
   261			current->thread.uw.tp_value = 0;
   262	
   263			/*
   264			 * We need to ensure ordering between the shadow state and the
   265			 * hardware state, so that we don't corrupt the hardware state
   266			 * with a stale shadow state during context switch.
   267			 */
   268			barrier();
   269			if (IS_ENABLED(CONFIG_DYNAMIC_STACK))
 > 270				current_pt_regs()->tpidrro_el0 = 0;
   271			else
   272				write_sysreg(0, tpidrro_el0);
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
