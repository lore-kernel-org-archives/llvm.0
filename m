Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987630C37A;
	Thu, 30 Jul 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435369; cv=none; b=R1dv3DUP1w0nt3rKBGRf7KuXQzrFyPVxOMNP5bL5LM4rwFiT/KpCe/1yVqyhg2N2eurYsId0inXMp4QMl5dOc1VRQSWlH412Csx/vn5zaQNDximUZ7dM211iF44GhahKYTVFxvTWhEhOQe5ArqTqaq66hu9rsX7fjhRh7XS4LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435369; c=relaxed/simple;
	bh=ebAAlUxxYJGpL3dMrDI+nYl3lP+WSyjuKhH5eAaM3zI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DlUwF5fbqlZTnLcR6ZtdGTCBaHjDT0SpHPFVExrXzcBLKcM+SNklrTdSGMvT+FvcoYrjx2HwAwXRPKsE8AhCXN5gK+lCj0gf3Mwi/mmqDIU0ncfXXEiOF6Gmyt/bQCn9XgvO80IdI23fiFfyu+h44OERoA0fNhxs6DdLtZBC30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7xD9yFI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7xD9yFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785435367; x=1816971367;
  h=date:from:to:cc:subject:message-id;
  bh=ebAAlUxxYJGpL3dMrDI+nYl3lP+WSyjuKhH5eAaM3zI=;
  b=a7xD9yFIyIHJ1qTh5UqOY7lNLut4T1Ci7UkopNPu62lxtkVVgFpGUMaK
   xHhcLreLBKv3ngBpyKbespg8KWpHN9ZY7QmaPhCsO6Q4uKYE0WQspYp6R
   aNrOsxYJotT1Ozti+7ATSefjVPP7fHw4q4fHcVfOjElCjulTrYBmWhKi1
   yOCC8sKmDW6GYOD9qHTRMSfaELLuvMAdPUdnZUkXk5jR+kO/He6WAoO2G
   hsf1Y88kJgmc8f5FRwtl08Pk45jJI5secp278mZxwXEiQfZoZrITSu7NH
   Wt4Sc8vjpGRcQ72Nk82uneLkcLytoAn/4V3da8DVpAwt3IgM5OXmCYFom
   Q==;
X-CSE-ConnectionGUID: 1g/og560TKCBx8yQ9FqZbA==
X-CSE-MsgGUID: NOFAuQQQRNezKttCtD5icQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89875905"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="89875905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 11:16:06 -0700
X-CSE-ConnectionGUID: 4qCazLXtQ6GRk/G9z4F46w==
X-CSE-MsgGUID: iREKTXLQTweJ29tgA23lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="298557744"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 11:16:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpVIT-00000000hQP-0kN6;
	Thu, 30 Jul 2026 18:15:59 +0000
Date: Fri, 31 Jul 2026 02:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:overflow-stack 10/13]
 arch/arm64/include/asm/sdei.h:49:15: error: expected identifier or '('
Message-ID: <202607310259.hYhBng05-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git overflow-stack
head:   7c0748c59a858f301fc801a9818ea1c11ff88ff0
commit: d017f75e2f157a38b824c8f4253f07fac65622eb [10/13] arm64: entry: Point SP_EL0 at the overflow stack
config: arm64-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310259.hYhBng05-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310259.hYhBng05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310259.hYhBng05-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:52:
   In file included from arch/arm64/include/asm/stacktrace.h:16:
>> arch/arm64/include/asm/sdei.h:49:15: error: expected identifier or '('
      49 | unsigned long sdei_arch_get_entry_point(int conduit);
         |               ^
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   In file included from arch/arm64/kernel/smp.c:52:
   In file included from arch/arm64/include/asm/stacktrace.h:16:
>> arch/arm64/include/asm/sdei.h:49:15: error: expected ')'
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   arch/arm64/include/asm/sdei.h:49:15: note: to match this '('
   include/linux/arm_sdei.h:16:44: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                 ^
   In file included from arch/arm64/kernel/smp.c:52:
   In file included from arch/arm64/include/asm/stacktrace.h:16:
   arch/arm64/include/asm/sdei.h:50:9: warning: 'sdei_arch_get_entry_point' macro redefined [-Wmacro-redefined]
      50 | #define sdei_arch_get_entry_point(x)    sdei_arch_get_entry_point(x)
         |         ^
   include/linux/arm_sdei.h:16:9: note: previous definition is here
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |         ^
   1 warning and 2 errors generated.


vim +49 arch/arm64/include/asm/sdei.h

5cd474e57368f0 D Scott Phillips 2023-06-26  37  
f5df26961853d6 James Morse      2018-01-08  38  /*
f5df26961853d6 James Morse      2018-01-08  39   * The above entry point does the minimum to call C code. This function does
f5df26961853d6 James Morse      2018-01-08  40   * anything else, before calling the driver.
f5df26961853d6 James Morse      2018-01-08  41   */
f5df26961853d6 James Morse      2018-01-08  42  struct sdei_registered_event;
f5df26961853d6 James Morse      2018-01-08  43  asmlinkage unsigned long __sdei_handler(struct pt_regs *regs,
f5df26961853d6 James Morse      2018-01-08  44  					struct sdei_registered_event *arg);
f5df26961853d6 James Morse      2018-01-08  45  
d60b228fd19985 Mark Rutland     2021-06-07  46  unsigned long do_sdei_event(struct pt_regs *regs,
d60b228fd19985 Mark Rutland     2021-06-07  47  			    struct sdei_registered_event *arg);
d60b228fd19985 Mark Rutland     2021-06-07  48  
f5df26961853d6 James Morse      2018-01-08 @49  unsigned long sdei_arch_get_entry_point(int conduit);
f5df26961853d6 James Morse      2018-01-08  50  #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
f5df26961853d6 James Morse      2018-01-08  51  

:::::: The code at line 49 was first introduced by commit
:::::: f5df26961853d6809d704cedcaf082c57f635a64 arm64: kernel: Add arch-specific SDEI entry code and CPU masking

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
