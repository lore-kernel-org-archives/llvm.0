Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D7673463;
	Sat, 13 Jun 2026 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781357648; cv=none; b=MFK+JU+q0KbZ9hXscvu19BW/mNu9V1NN2wrXRr5WBKaFdHvZZpb+jMDZfi399c/diKkekxThWKRUhkf8J6wwq93Q5c01hL9uS6jgE/DPqTD22JuafOn0NRVUW2M3Cw+4W5I6Dlm8zYtEr6VDnaPXf1RlLXo7dkXltjgw9AH0j3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781357648; c=relaxed/simple;
	bh=cHctk6Y8X+zELlpiO6iGG+QHfdR67iD/q24td39uY7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZGfu2kQgcPAQNYZ13FQlt7V7JcpSBfIFNSwgUSM1iIhrGfXUK3v+s9mit0xRIzcKJZ0bgxWn1SPlp3Y+xdq77yzhE9fHmN98o8F0Cvor607i2ajNefQBJ28mDznqMrPVWA6e9sFiOksUBYlQXz672AKQ///Krix8gs1fCLE1bvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9F1D/c0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9F1D/c0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781357646; x=1812893646;
  h=date:from:to:cc:subject:message-id;
  bh=cHctk6Y8X+zELlpiO6iGG+QHfdR67iD/q24td39uY7M=;
  b=Q9F1D/c0ufUJEZ8fvVjchEEN/yGO4fOc2W812/seaCSqVRmHmJtz9slp
   cA4gQT37Oj1MNzq97fFB7J5TDfcyHJeH7vTZdukL0Rdxk9yLEg+5PrnQM
   2auKBmq7JNg1nL2PQI8ZjAzzylwtJi1kVfpUDoHYDu7i2aZvyhwVzeJ0q
   OUghe2u+tq0Lb+tHGdvSJFXHYDzMuOIWugBwytVUhsLeHJ/ZPBTuLy9xW
   fCjEgzWJn6YgtUFxNHHqWfILMbjNkdYIe0NqOo2xiLzYEPGJ13x4kLkAr
   Us483W/r7Lq4b9ss8qifcr4avt0ZfE2+uNX3Etg0XPHklEgiUW34ZXCi5
   A==;
X-CSE-ConnectionGUID: H3q63WqUQ5eKILcCdFfCfA==
X-CSE-MsgGUID: vztBzvC+QNKOFvwnSF7ExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93660747"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93660747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:34:05 -0700
X-CSE-ConnectionGUID: Vf+JZ+eYS/qEWpbZE5/wfw==
X-CSE-MsgGUID: rkJuuJxgTbKSW2iZ6yWkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="277251395"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 06:34:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYOUr-00000000PwS-2MIg;
	Sat, 13 Jun 2026 13:34:01 +0000
Date: Sat, 13 Jun 2026 21:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.2 21/21]
 include/linux/gpio/consumer.h:177:20: error: incomplete definition of type
 'const struct gpio_desc'
Message-ID: <202606132139.x0XHZayI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.2
head:   24fae1df029804f4339484870fcdc70fe15fab97
commit: 24fae1df029804f4339484870fcdc70fe15fab97 [21/21] gpiolib: introduce gpio_name() helper
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260613/202606132139.x0XHZayI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132139.x0XHZayI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132139.x0XHZayI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/env.c:9:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:18:
   In file included from include/linux/nvmem-provider.h:16:
>> include/linux/gpio/consumer.h:177:20: error: incomplete definition of type 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                       ~~~~^
   include/linux/gpio/consumer.h:16:8: note: forward declaration of 'struct gpio_desc'
      16 | struct gpio_desc;
         |        ^
   1 error generated.
--
   In file included from drivers/gpio/gpiolib-devres.c:15:
>> include/linux/gpio/consumer.h:177:20: error: incomplete definition of type 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                       ~~~~^
   include/linux/gpio/consumer.h:16:8: note: forward declaration of 'struct gpio_desc'
      16 | struct gpio_desc;
         |        ^
   In file included from drivers/gpio/gpiolib-devres.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:9:
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
   In file included from drivers/gpio/gpiolib-devres.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:9:
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
   In file included from drivers/gpio/gpiolib-devres.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:9:
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
   In file included from drivers/gpio/gpiolib-devres.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:9:
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
   In file included from drivers/gpio/gpiolib-devres.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:9:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
--
   In file included from drivers/gpio/gpiolib-cdev.c:14:
>> include/linux/gpio/consumer.h:177:20: error: incomplete definition of type 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                       ~~~~^
   include/linux/gpio/consumer.h:16:8: note: forward declaration of 'struct gpio_desc'
      16 | struct gpio_desc;
         |        ^
>> drivers/gpio/gpiolib-cdev.c:1650:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1650 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   1 warning and 1 error generated.


vim +177 include/linux/gpio/consumer.h

   174	
   175	static inline const char *gpiod_name(const struct gpio_desc *desc)
   176	{
 > 177		return desc ? desc->name : "(no gpio)";
   178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
