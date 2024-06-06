Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37EB1BC3C;
	Thu,  6 Jun 2024 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717700095; cv=none; b=EqGCZ8aDZ58iek6WjxjPxxE04be2RqfS4PLRxbT9FW7TS46xNxsLU6WuRBnnMJWPWv1t+gqjTfHcFWQW+QIuYdMiPmnDzN96U5mny2cGHiFkg7+Th11WAdIGoiucE+fK0SO2IEakUZ+b2CVahBzqiNZdQ0Ue6BjlYVMuAzOW8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717700095; c=relaxed/simple;
	bh=g5BwVqJnXTE5snpEbA9pizrYnNqVLH127HaqzAmQyDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXjsMwxzZf57KpS2mfTv89gZphiLJDEVpXLu9PicTd55pu/uBAWSJ/2tkAUNP7MW5krSipluC3OdZ1xnP/JU9XzWuLWbkkkdZ9F5/mlmk9+66bvD54QDtQmn14tLKiKPtK8NTyBv1aPE3YhUd6NEQMjnoPc82Nyaa7EBdwxhdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPHIDRQK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPHIDRQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717700093; x=1749236093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g5BwVqJnXTE5snpEbA9pizrYnNqVLH127HaqzAmQyDI=;
  b=JPHIDRQK1QHVnHNBgF/9Q/4Xd97bC9e3liIp5zWFNwimjL7JhVqdTysL
   q1fweoIDH+MxKf7JA5CN4My0GkPyy0zaZFbOLaruFbwuRSGEq/1TNvTNW
   IF/6W7uc9r+/OIgejqBr2Dbnb8aTzMKRMWmQI6if5+sdQYI4pQQZsCriM
   GrPf8rYoPLj9QFh3pcTGfZRPQvDtR2dKGKup5zM4xm5nm4PNhJ6q0o0Fq
   i0PRG7cz7WvXmFg9MYy0kZLa5u42xoezkCDqlHmouDVLbjKxCCwa5RqsL
   KmIy+V4FZmPxZZ6m/HajjT3nCOVDiSn+wEStt2agcNLc8XnLm8askAK/e
   Q==;
X-CSE-ConnectionGUID: QGMVri7nRSCEWnf4x700Dg==
X-CSE-MsgGUID: 58mqvIkRQqiQjgxVV56wFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="11947906"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="11947906"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:54:52 -0700
X-CSE-ConnectionGUID: U5gDJqksSdGPelHvQOfIIw==
X-CSE-MsgGUID: OTtGMAbtR3OHQN46lIbooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="75537448"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Jun 2024 11:54:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFIG8-0003ae-0n;
	Thu, 06 Jun 2024 18:54:48 +0000
Date: Fri, 7 Jun 2024 02:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a
 given (cpu, cachelevel)
Message-ID: <202406070224.2qwlmQxA-lkp@intel.com>
References: <20240606164047.318378-2-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606164047.318378-2-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build errors:

[auto build test ERROR on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/cacheinfo-Add-function-to-get-cacheinfo-for-a-given-cpu-cachelevel/20240607-004316
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606164047.318378-2-tony.luck%40intel.com
patch subject: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a given (cpu, cachelevel)
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240607/202406070224.2qwlmQxA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070224.2qwlmQxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070224.2qwlmQxA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
>> include/linux/cacheinfo.h:126:2: error: call to undeclared function 'lockdep_assert_cpus_held'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
>> include/linux/cpu.h:143:13: error: conflicting types for 'lockdep_assert_cpus_held'
     143 | extern void lockdep_assert_cpus_held(void);
         |             ^
   include/linux/cacheinfo.h:126:2: note: previous implicit declaration is here
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io_uring.c:56:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   3 warnings and 2 errors generated.
--
   In file included from io_uring/opdef.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/opdef.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:96:16: error: field has incomplete type 'struct device'
      96 |         struct device   dev;
         |                         ^
   include/linux/bitmap.h:17:8: note: forward declaration of 'struct device'
      17 | struct device;
         |        ^
   In file included from io_uring/opdef.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
>> include/linux/cpu.h:30:16: error: field has incomplete type 'struct device'
      30 |         struct device dev;
         |                       ^
   include/linux/bitmap.h:17:8: note: forward declaration of 'struct device'
      17 | struct device;
         |        ^
   In file included from io_uring/opdef.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
>> include/linux/cpu.h:45:36: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^
   include/linux/cpu.h:46:40: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^
   include/linux/cpu.h:52:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^
   include/linux/cpu.h:54:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^
   include/linux/cpu.h:56:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^
   include/linux/cpu.h:58:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^
   include/linux/cpu.h:60:16: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^
   include/linux/cpu.h:62:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^
   include/linux/cpu.h:64:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      64 |                                         struct device_attribute *attr,
         |                                                ^
   include/linux/cpu.h:67:18: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^
   include/linux/cpu.h:68:58: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^
   include/linux/cpu.h:70:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      70 |                                         struct device_attribute *attr,
         |                                                ^
   include/linux/cpu.h:73:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^
   include/linux/cpu.h:75:18: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^
   include/linux/cpu.h:77:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^
   include/linux/cpu.h:79:20: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^
   17 warnings and 2 errors generated.
--
   In file included from io_uring/poll.c:6:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/poll.c:12:
   In file included from include/trace/events/io_uring.h:8:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
>> include/linux/cacheinfo.h:126:2: error: call to undeclared function 'lockdep_assert_cpus_held'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/poll.c:12:
   In file included from include/trace/events/io_uring.h:8:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
>> include/linux/cpu.h:143:13: error: conflicting types for 'lockdep_assert_cpus_held'
     143 | extern void lockdep_assert_cpus_held(void);
         |             ^
   include/linux/cacheinfo.h:126:2: note: previous implicit declaration is here
     126 |         lockdep_assert_cpus_held();
         |         ^
   1 warning and 2 errors generated.
--
   In file included from io_uring/timeout.c:7:
   In file included from include/trace/events/io_uring.h:8:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
>> include/linux/cacheinfo.h:126:2: error: call to undeclared function 'lockdep_assert_cpus_held'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/timeout.c:7:
   In file included from include/trace/events/io_uring.h:8:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
>> include/linux/cpu.h:143:13: error: conflicting types for 'lockdep_assert_cpus_held'
     143 | extern void lockdep_assert_cpus_held(void);
         |             ^
   include/linux/cacheinfo.h:126:2: note: previous implicit declaration is here
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/timeout.c:7:
   In file included from include/trace/events/io_uring.h:10:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
>> include/linux/cacheinfo.h:126:2: error: call to undeclared function 'lockdep_assert_cpus_held'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
>> include/linux/cpu.h:143:13: error: conflicting types for 'lockdep_assert_cpus_held'
     143 | extern void lockdep_assert_cpus_held(void);
         |             ^
   include/linux/cacheinfo.h:126:2: note: previous implicit declaration is here
     126 |         lockdep_assert_cpus_held();
         |         ^
   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   io_uring/register.c:175:24: warning: arithmetic between different enumeration types ('enum io_uring_register_restriction_op' and 'enum io_uring_register_op') [-Wenum-enum-conversion]
     175 |         if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/register.c:31:58: note: expanded from macro 'IORING_MAX_RESTRICTIONS'
      31 | #define IORING_MAX_RESTRICTIONS (IORING_RESTRICTION_LAST + \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~ ^
      32 |                                  IORING_REGISTER_LAST + IORING_OP_LAST)
         |                                  ~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.
--
   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:96:16: error: field has incomplete type 'struct device'
      96 |         struct device   dev;
         |                         ^
   include/linux/bitmap.h:17:8: note: forward declaration of 'struct device'
      17 | struct device;
         |        ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
>> include/linux/cpu.h:30:16: error: field has incomplete type 'struct device'
      30 |         struct device dev;
         |                       ^
   include/linux/bitmap.h:17:8: note: forward declaration of 'struct device'
      17 | struct device;
         |        ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:16:
   In file included from arch/riscv/include/asm/cacheinfo.h:9:
   In file included from include/linux/cacheinfo.h:6:
>> include/linux/cpu.h:45:36: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^
   include/linux/cpu.h:46:40: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^
   include/linux/cpu.h:52:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^
   include/linux/cpu.h:54:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^
   include/linux/cpu.h:56:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^
   include/linux/cpu.h:58:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^
   include/linux/cpu.h:60:16: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^
   include/linux/cpu.h:62:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^
   include/linux/cpu.h:64:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      64 |                                         struct device_attribute *attr,
         |                                                ^
   include/linux/cpu.h:67:18: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^
   include/linux/cpu.h:68:58: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^
   include/linux/cpu.h:70:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      70 |                                         struct device_attribute *attr,
         |                                                ^
   include/linux/cpu.h:73:13: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^
   include/linux/cpu.h:75:18: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^
   include/linux/cpu.h:77:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^
   include/linux/cpu.h:79:20: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^
   In file included from mm/filemap.c:26:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   19 warnings and 2 errors generated.
..


vim +/lockdep_assert_cpus_held +126 include/linux/cacheinfo.h

   115	
   116	/*
   117	 * Get the cacheinfo structure for the cache associated with @cpu at
   118	 * level @level.
   119	 * cpuhp lock must be held.
   120	 */
   121	static inline struct cacheinfo *get_cpu_cacheinfo_level(int cpu, int level)
   122	{
   123		struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
   124		int i;
   125	
 > 126		lockdep_assert_cpus_held();
   127	
   128		for (i = 0; i < ci->num_leaves; i++) {
   129			if (ci->info_list[i].level == level) {
   130				if (ci->info_list[i].attributes & CACHE_ID)
   131					return &ci->info_list[i];
   132				return NULL;
   133			}
   134		}
   135	
   136		return NULL;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
