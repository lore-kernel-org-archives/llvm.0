Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BB64CE9C;
	Wed, 26 Jul 2023 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690400896; x=1721936896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tslbBHTeKO0rnFLtwE4W9uY9EsUdOlY3wysB8WN0KQs=;
  b=Na2Kz/oa2mzM3cHDpjyGczKqeb7tCJrTrnlr2a3hhcqZciiqqba5wbJe
   16GynMnqz4KUuJkU5SDvxVqfny0iv0O5CJPU+NC8JqoS73jK+ytLOWA5f
   8YDAiPZnzKzBWv9K+OVg9LeWuI/O0vpO7HzJRp95ZSeEi8JHJtsiIKP41
   HuFPY5CtshE92Brni44moLzPDNxTHxVYGPJy2nJvOMbBQj4cCQC2Aa6QX
   hiIQ8uMPTOdGJTNayUZcNOVowqkgMhPgjDtNZXSdb33pjEY23+79IwHJa
   nxeHBBwgUU+WeTSLkz4mCiQ1i9VgQhiA4+4UcYfMJiDtwY9WAHTuaAeEF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353016763"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="353016763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840387926"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="840387926"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 12:48:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOkUX-0001H1-0a;
	Wed, 26 Jul 2023 19:48:13 +0000
Date: Thu, 27 Jul 2023 03:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Merello <andrea.merello@iit.it>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
Message-ID: <202307270345.mJwJ8FEB-lkp@intel.com>
References: <20230726090212.10641-1-andrea.merello@iit.it>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726090212.10641-1-andrea.merello@iit.it>

Hi Andrea,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc3]
[also build test WARNING on linus/master]
[cannot apply to jic23-iio/togreg next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Merello/IIO-MPU6050-fix-level-triggered-IRQ-support-caused-crash/20230726-172345
base:   v6.5-rc3
patch link:    https://lore.kernel.org/r/20230726090212.10641-1-andrea.merello%40iit.it
patch subject: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
config: riscv-randconfig-r022-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270345.mJwJ8FEB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270345.mJwJ8FEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270345.mJwJ8FEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:7:
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:7:
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:7:
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:7:
   In file included from drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:220:13: warning: no previous prototype for function 'inv_mpu6050_trigger_irq' [-Wmissing-prototypes]
     220 | irqreturn_t inv_mpu6050_trigger_irq(int irq, void *private)
         |             ^
   drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | irqreturn_t inv_mpu6050_trigger_irq(int irq, void *private)
         | ^
         | static 
>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:228:13: warning: no previous prototype for function 'inv_mpu6050_trigger_thread_fn' [-Wmissing-prototypes]
     228 | irqreturn_t inv_mpu6050_trigger_thread_fn(int irq, void *private)
         |             ^
   drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     228 | irqreturn_t inv_mpu6050_trigger_thread_fn(int irq, void *private)
         | ^
         | static 
   15 warnings generated.


vim +/inv_mpu6050_trigger_irq +220 drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c

   219	
 > 220	irqreturn_t inv_mpu6050_trigger_irq(int irq, void *private)
   221	{
   222		struct inv_mpu6050_state *st = private;
   223	
   224		iio_trigger_generic_data_rdy_poll(irq, st->trig);
   225		return IRQ_WAKE_THREAD;
   226	}
   227	
 > 228	irqreturn_t inv_mpu6050_trigger_thread_fn(int irq, void *private)
   229	{
   230		struct inv_mpu6050_state *st = private;
   231		int int_status;
   232	
   233		mutex_lock(&st->lock);
   234		regmap_read(st->map, st->reg->int_status, &int_status);
   235		mutex_unlock(&st->lock);
   236	
   237		return IRQ_HANDLED;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
