Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D933ACA68;
	Sun, 30 Aug 2026 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104994; cv=none; b=Igr0D1MrZ6FXORQRpBOiBrfd6HYTaP7B4UKeG3gyafAYvbEUMQYvfGOM+2+zJaGVW4U99iVop4oDFVb3WmqJSdo3GGXguaa2q+sIYIjj7Y6Ft+4y+mgwnnEtrsdzaFvCPD49VvW546crLglcAiUZ1RjnxXLHBt9xuSzR24jipD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104994; c=relaxed/simple;
	bh=sSVI3d2kgXfiHI85EhYn30qCsOL2DTaTAli6fyq/4iU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5SuXqeMGNsXhFnfcIIUAJrzViZm79CmJI6kbgDaFKP18zy1VA1lmf+tG88OfqesDCBjlLzmA13PLP0Wqr6ZtNpzugdwatfUXHL51+JMtMyp7TP4+uX2rIp8FoLl0RTnXcqrGM7ksNNt3ShIMS11bamYWzzIsm2RNue65TS2xhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsej9iFv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsej9iFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788104992; x=1819640992;
  h=date:from:to:cc:subject:message-id;
  bh=sSVI3d2kgXfiHI85EhYn30qCsOL2DTaTAli6fyq/4iU=;
  b=dsej9iFvbdoskEZY+EJTyTRBb7WjrhcVlxYpYtp90xb7rW/efbjFzO8I
   3TAMkz0IKYWwvEIG6ilrxHRdSitnrKufCNx9c9Mu2v21wqJHl12efr2L9
   u/B2SNiVlnbzA7gvFuEYa6/HYWqk5k60IUCwPV6KK5LC5gWNEaz9olvG1
   7EfWMUI6dnMkBsWwZkE1ZFtvffjxUGgBQAXDt2cK5XH+VqtPLjC9wQPET
   4+s4tAx7l5i+Cm9lO0wbrIGILzQqjYmr7m4n9Bf6u9DtNuSOy9qsKHkha
   S7UWj6OtQCV5JuR2H3m/Ia+1szRFTl6Iy62w7pN4EU5JzxJpq/qpze3Vn
   A==;
X-CSE-ConnectionGUID: eQsPqhBRSfC1KRR/8vQwQg==
X-CSE-MsgGUID: 2xGAfiqxSCKQJOu92hM9LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88402353"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88402353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 08:49:51 -0700
X-CSE-ConnectionGUID: es9ozYrKSOWRakWaRCCJHA==
X-CSE-MsgGUID: tLKj2Sk+QsqLBp533tnNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266778527"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Aug 2026 08:49:50 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0hn1-00000000E1c-1SsC;
	Sun, 30 Aug 2026 15:49:47 +0000
Date: Sun, 30 Aug 2026 23:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 13/20] include/linux/irqflags.h:205:2:
 error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608302354.u0E8K78u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 882d92b84f9618f000a4de66daeee48df6d81357 [13/20] irqflags: Cleanup wrappers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260830/202608302354.u0E8K78u-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302354.u0E8K78u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302354.u0E8K78u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
>> include/linux/irqflags.h:205:2: error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |         arch_safe_halt();
         |         ^
   include/linux/irqflags.h:205:2: note: did you mean 'raw_safe_halt'?
   include/linux/irqflags.h:203:29: note: 'raw_safe_halt' declared here
     203 | static __always_inline void raw_safe_halt(void)
         |                             ^
     204 | {
     205 |         arch_safe_halt();
         |         ~~~~~~~~~~~~~~
         |         raw_safe_halt
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:


vim +/arch_safe_halt +205 include/linux/irqflags.h

   202	
   203	static __always_inline void raw_safe_halt(void)
   204	{
 > 205		arch_safe_halt();
   206	}
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
