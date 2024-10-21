Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E9F629;
	Mon, 21 Oct 2024 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729486846; cv=none; b=tjEaV+W6kNyGd9X4Q1OPPAxTh3JOR1g7N3+mnrlIY9mmUIWh0iSBSjcsnolzOTOkIGdPpn6Cg6YnjQY/8bwBpcwq91ss8oWZDgc7t1QZcUyFj45X7Zk2i2TLlmJGETVN+KTQI+facsXcRO04LdYO63uomkoG+HDq0eh/EQik7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729486846; c=relaxed/simple;
	bh=4U/3PcWfZlYZ4WfDtR9bAAMNJ+5ntQixs46dtHZBgds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STKzU8ym00dHbrZ0sBqncelGAuu4n1cUpvnljDReyFdb1/dGQvEbHSwBDrP/6vhcyScdb0SvM1Dq0OCjPib/jiQbVNreDgVTGvGhW4x5X/RRkMjsJKpr7qlatgFvh9D7JxYbXMLc5DQiJ2pIi3bHQKQpAQQHtPDE92JdVEnat+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilG1pzRo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilG1pzRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729486844; x=1761022844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4U/3PcWfZlYZ4WfDtR9bAAMNJ+5ntQixs46dtHZBgds=;
  b=ilG1pzRo1JZS9pXSAsjD511rz6qwepG4tC/Cok/1br8a0aq+mIVQrexn
   uDu96Ccdy3SeeF9l7gljPK88TamGEYARxBAYYH487Wsxg5PxNtffqwXYG
   sbaPHVV2+ilooT11TzEyS56s5HXtoyBRxpAz5bQ5NX6G+OC8UeNOAKQp9
   qv0hhje+AtXiLEzBiHqf3QAEmpf9LziU7rm1/Xyl8udePxOrEyuWeGXRG
   s1KcE47s93yvT4EWgkN/jAb5LGXEGDLUrjanedyh5FmNz/kLf9WwkjHA9
   d3sC1nwah/UsJAafUTRMEwLMQMP6B1Z9DO+HOvndSr4bpvB9wGEqfMKP5
   A==;
X-CSE-ConnectionGUID: utHN04mwSCinl6/1yUnpwA==
X-CSE-MsgGUID: QpAR3zWrTn+pEUMYHNe1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28831836"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="28831836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 22:00:43 -0700
X-CSE-ConnectionGUID: ig1KX80tRiOl1h60Lktmcw==
X-CSE-MsgGUID: iNrY/yq/Slyga0kJ1pK+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79560774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2024 22:00:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2kX0-000RCl-1f;
	Mon, 21 Oct 2024 05:00:38 +0000
Date: Mon, 21 Oct 2024 13:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 02/10] clockevents: Shutdown and unregister current
 clockevents at CPUHP_AP_TICK_DYING
Message-ID: <202410211134.JXHThFcy-lkp@intel.com>
References: <20241017165041.6954-3-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017165041.6954-3-frederic@kernel.org>

Hi Frederic,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on tip/smp/core tegra/for-next linus/master v6.12-rc4 next-20241018]
[cannot apply to tip/timers/nohz daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frederic-Weisbecker/clockevents-Improve-clockevents_notify_released-comment/20241018-010807
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20241017165041.6954-3-frederic%40kernel.org
patch subject: [PATCH 02/10] clockevents: Shutdown and unregister current clockevents at CPUHP_AP_TICK_DYING
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410211134.JXHThFcy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211134.JXHThFcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211134.JXHThFcy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/clockevents.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/time/clockevents.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/time/clockevents.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/time/clockevents.c:13:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/time/clockevents.c:632:6: error: redefinition of 'tick_offline_cpu'
     632 | void tick_offline_cpu(unsigned int cpu)
         |      ^
   kernel/time/tick-internal.h:148:20: note: previous definition is here
     148 | static inline void tick_offline_cpu(unsigned int cpu) { }
         |                    ^
   13 warnings and 1 error generated.


vim +/tick_offline_cpu +632 kernel/time/clockevents.c

1b72d43237980e Thomas Gleixner     2019-03-21  623  
1b72d43237980e Thomas Gleixner     2019-03-21  624  /**
86e36067908464 Frederic Weisbecker 2024-10-17  625   * tick_offline_cpu - Shutdown all clock events related
86e36067908464 Frederic Weisbecker 2024-10-17  626   *                    to this CPU and take it out of the
86e36067908464 Frederic Weisbecker 2024-10-17  627   *                    broadcast mechanism.
1b72d43237980e Thomas Gleixner     2019-03-21  628   * @cpu:	The outgoing CPU
1b72d43237980e Thomas Gleixner     2019-03-21  629   *
86e36067908464 Frederic Weisbecker 2024-10-17  630   * Called by the dying CPU during teardown.
1b72d43237980e Thomas Gleixner     2019-03-21  631   */
1b72d43237980e Thomas Gleixner     2019-03-21 @632  void tick_offline_cpu(unsigned int cpu)
d316c57ff6bfad Thomas Gleixner     2007-02-16  633  {
bb6eddf7676e1c Thomas Gleixner     2009-12-10  634  	struct clock_event_device *dev, *tmp;
0b858e6ff9a38b Li Zefan            2008-02-08  635  
86e36067908464 Frederic Weisbecker 2024-10-17  636  	raw_spin_lock(&clockevents_lock);
d316c57ff6bfad Thomas Gleixner     2007-02-16  637  
86e36067908464 Frederic Weisbecker 2024-10-17  638  	tick_broadcast_offline(cpu);
a49b116dcb1265 Thomas Gleixner     2015-04-03  639  	tick_shutdown(cpu);
86e36067908464 Frederic Weisbecker 2024-10-17  640  
d316c57ff6bfad Thomas Gleixner     2007-02-16  641  	/*
d316c57ff6bfad Thomas Gleixner     2007-02-16  642  	 * Unregister the clock event devices which were
86e36067908464 Frederic Weisbecker 2024-10-17  643  	 * released above.
d316c57ff6bfad Thomas Gleixner     2007-02-16  644  	 */
bb6eddf7676e1c Thomas Gleixner     2009-12-10  645  	list_for_each_entry_safe(dev, tmp, &clockevents_released, list)
bb6eddf7676e1c Thomas Gleixner     2009-12-10  646  		list_del(&dev->list);
86e36067908464 Frederic Weisbecker 2024-10-17  647  
bb6eddf7676e1c Thomas Gleixner     2009-12-10  648  	/*
bb6eddf7676e1c Thomas Gleixner     2009-12-10  649  	 * Now check whether the CPU has left unused per cpu devices
bb6eddf7676e1c Thomas Gleixner     2009-12-10  650  	 */
bb6eddf7676e1c Thomas Gleixner     2009-12-10  651  	list_for_each_entry_safe(dev, tmp, &clockevent_devices, list) {
bb6eddf7676e1c Thomas Gleixner     2009-12-10  652  		if (cpumask_test_cpu(cpu, dev->cpumask) &&
ea9d8e3f45404d Xiaotian Feng       2010-01-07  653  		    cpumask_weight(dev->cpumask) == 1 &&
ea9d8e3f45404d Xiaotian Feng       2010-01-07  654  		    !tick_is_broadcast_device(dev)) {
472c4a9437d3c6 Viresh Kumar        2015-05-21  655  			BUG_ON(!clockevent_state_detached(dev));
bb6eddf7676e1c Thomas Gleixner     2009-12-10  656  			list_del(&dev->list);
bb6eddf7676e1c Thomas Gleixner     2009-12-10  657  		}
bb6eddf7676e1c Thomas Gleixner     2009-12-10  658  	}
86e36067908464 Frederic Weisbecker 2024-10-17  659  
86e36067908464 Frederic Weisbecker 2024-10-17  660  	raw_spin_unlock(&clockevents_lock);
d316c57ff6bfad Thomas Gleixner     2007-02-16  661  }
a49b116dcb1265 Thomas Gleixner     2015-04-03  662  #endif
501f867064e95f Thomas Gleixner     2013-04-25  663  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
