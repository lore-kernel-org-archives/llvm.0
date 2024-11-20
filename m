Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCF33998;
	Wed, 20 Nov 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732140347; cv=none; b=a+zcjYggQVj3VqXGP5vOkJQBurq0rX7BGOsAXQCjnofJnbQEX2Q/uAqcqUZoKM9GcH9H9hwaaE1SA2UaZtSpHg2WucgKQJpIzti9DZ4TPdXAUS+Ohv3u/PJ8775NtSUDHGOAlv1YOxt2YyICO18BCh5FfTHrxdVETripE1fhpOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732140347; c=relaxed/simple;
	bh=UFfXPPa+WwAn3ee4uh3/OvEpnmL5gkXiHPRq4g/pZdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDc9WqgQgq0Jyl9gk+QZHRZH5GH7ovzk04vBAa2aBdlDfGKxDowhuOcEs1X/az9degoaN1dDWneh67aLRtQ3Y2jkCCRLw6xBE25R5Vkmf9Js1vOa5KFHAMgRl5URGhhIPBvs2EdEilkTfBeROzLKbjJ9Crkne74o2dz/BrQiLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+ggq1z6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+ggq1z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732140345; x=1763676345;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UFfXPPa+WwAn3ee4uh3/OvEpnmL5gkXiHPRq4g/pZdY=;
  b=W+ggq1z6B4eL/P10QFO+lmiwudYxccCCtZYEmtpJ086HXisgan/Wn0Wp
   9hgkGtky0pyzIi7XVOhJHFPfN5qHZTJ4zRa1BUPB9kDU3sFefErU/adEe
   jVzGlt4zI1K5MC40b70YBgHbMKzAtWv3L/SPLoS7pH0B763pPdvNLv6uF
   5mwuKl0EnBPutLoL07BvIVZrBOqTS8gpyP+LgJk5hFMjMyGqksmtNqEDl
   Ya7lGo3ugWTqbRZAK1/OFeKWptlIe6SaZ0fp//dAKU5GyyekgyI6quXJ+
   SoPcHYiKqMZIIYGeVV44c5IIXsXR0vQvC4lBhysHQwfXfaxiYO6bw+cZ2
   A==;
X-CSE-ConnectionGUID: talEZkgdSyGUVzS5tkTfbQ==
X-CSE-MsgGUID: 35zMQGEBSFeCqv5JuwKlMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32158103"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32158103"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 14:05:45 -0800
X-CSE-ConnectionGUID: QDmzHaMtRQKmWq6haJ01VQ==
X-CSE-MsgGUID: ArKJOdbVStidofpihXI5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="95114958"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2024 14:05:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDspQ-0001BZ-1i;
	Wed, 20 Nov 2024 22:05:40 +0000
Date: Thu, 21 Nov 2024 06:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 86/91] include/linux/riscv_sse.h:65:10:
 error: use of undeclared identifier 'EOPNOTSUPP'
Message-ID: <202411210505.RFjUdct5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   1327ec8b5a02d00ad7ac1ce8e4d0591487ea884f
commit: 81bb986dce08d54e4f8d3d6971dae18608b99244 [86/91] riscv: Introduce HEST SSE notification handlers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411210505.RFjUdct5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210505.RFjUdct5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210505.RFjUdct5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sse.h:65:10: error: use of undeclared identifier 'EOPNOTSUPP'
      65 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:73:10: error: use of undeclared identifier 'EOPNOTSUPP'
      73 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:78:10: error: use of undeclared identifier 'EOPNOTSUPP'
      78 |         return -EOPNOTSUPP;
         |                 ^
>> include/linux/riscv_sse.h:83:44: warning: declaration of 'struct ghes' will not be visible outside of this function [-Wvisibility]
      83 | static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
         |                                            ^
   include/linux/riscv_sse.h:86:10: error: use of undeclared identifier 'EOPNOTSUPP'
      86 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:89:46: warning: declaration of 'struct ghes' will not be visible outside of this function [-Wvisibility]
      89 | static inline int sse_unregister_ghes(struct ghes *ghes)
         |                                              ^
   include/linux/riscv_sse.h:91:10: error: use of undeclared identifier 'EOPNOTSUPP'
      91 |         return -EOPNOTSUPP;
         |                 ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:


vim +/EOPNOTSUPP +65 include/linux/riscv_sse.h

9fb4ca437efa2c Clément Léger    2023-06-13  57  
d8850d34eb078f Himanshu Chauhan 2023-10-26  58  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
d8850d34eb078f Himanshu Chauhan 2023-10-26  59  		      sse_event_handler *hi_cb);
d8850d34eb078f Himanshu Chauhan 2023-10-26  60  int sse_unregister_ghes(struct ghes *ghes);
9fb4ca437efa2c Clément Léger    2023-06-13  61  #else
9fb4ca437efa2c Clément Léger    2023-06-13  62  static inline int sse_event_register(struct sse_event *evt, u32 priority,
9fb4ca437efa2c Clément Léger    2023-06-13  63  				     sse_event_handler *handler, void *arg)
9fb4ca437efa2c Clément Léger    2023-06-13  64  {
9fb4ca437efa2c Clément Léger    2023-06-13 @65  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  66  }
9fb4ca437efa2c Clément Léger    2023-06-13  67  
9fb4ca437efa2c Clément Léger    2023-06-13  68  static inline void sse_event_unregister(struct sse_event *evt) {}
9fb4ca437efa2c Clément Léger    2023-06-13  69  
9fb4ca437efa2c Clément Léger    2023-06-13  70  static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
9fb4ca437efa2c Clément Léger    2023-06-13  71  					   unsigned int cpu)
9fb4ca437efa2c Clément Léger    2023-06-13  72  {
9fb4ca437efa2c Clément Léger    2023-06-13  73  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  74  }
9fb4ca437efa2c Clément Léger    2023-06-13  75  
9fb4ca437efa2c Clément Léger    2023-06-13  76  static inline int sse_event_enable(struct sse_event *sse_evt)
9fb4ca437efa2c Clément Léger    2023-06-13  77  {
9fb4ca437efa2c Clément Léger    2023-06-13  78  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  79  }
9fb4ca437efa2c Clément Léger    2023-06-13  80  
9fb4ca437efa2c Clément Léger    2023-06-13  81  static inline void sse_event_disable(struct sse_event *sse_evt) {}
9fb4ca437efa2c Clément Léger    2023-06-13  82  
d8850d34eb078f Himanshu Chauhan 2023-10-26 @83  static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
d8850d34eb078f Himanshu Chauhan 2023-10-26  84  				    sse_event_handler *hi_cb)
d8850d34eb078f Himanshu Chauhan 2023-10-26  85  {
d8850d34eb078f Himanshu Chauhan 2023-10-26  86  	return -EOPNOTSUPP;
d8850d34eb078f Himanshu Chauhan 2023-10-26  87  }
d8850d34eb078f Himanshu Chauhan 2023-10-26  88  

:::::: The code at line 65 was first introduced by commit
:::::: 9fb4ca437efa2cc79d5cc0e2c775dda48271faea riscv: add support for SBI Supervisor Software Events extension

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
