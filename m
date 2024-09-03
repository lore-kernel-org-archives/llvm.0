Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9E19F422;
	Tue,  3 Sep 2024 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363546; cv=none; b=pD22gugQIfphWMPi7AK5sLapfiFcQOxzDiVhAT05gzTesAIWUkOoGEZEbsP4SlORpBuSMD2kTsj73qO2IQPmItj+mZEakz8RxLdmwX+HV/DVlgs7Xx8Cr41CPV8EdyDbW0Dpk2dqd8cSQgQpA/F1uy7rcX4wsyqt+E0p641Hjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363546; c=relaxed/simple;
	bh=ed+Z5etHkhqz5neZovqUwoUCHc8OaP/857OcDJHi4q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9FnQT28q+2JSvaYqfrPeFLG59/jx72hLTJH2JVekFO1HijJhlIG0C0EwCCMkT6dafsyYX94RhifWf5W2Z70JOU9ceWSgWE/qsl9B6Swv8dMMOvQ1F5JdTwdqyVNGYQoARX8jfqH80BjWeyejA7lfGVJz9EsnAJS55zSDqsqneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1DvKNAP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1DvKNAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725363544; x=1756899544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ed+Z5etHkhqz5neZovqUwoUCHc8OaP/857OcDJHi4q4=;
  b=c1DvKNAPt2rqfJan59192sEua2ZR8ByoRE3SoUbmlVvThZr/3+QiHQUb
   GKqn+E5fxr8kODvkM7yWC6wHtXVybJvcz4d8vu2tkJ8I/wlM2eyhYEKuP
   160SuB9wDInne49PduQUHLeMhZ3KMI1t0FSDcpRWyEoEcbjpUoiNYx7ZO
   PUca9qY8P4b3/eiY1+KqVaQZtzw3zWrfzNsmNn1TVxqlPrR1Ksm2eD6/z
   rgwsfSbN5yos5fzbVv4vNx1QmGtrhKebG+BIjTCvKk5F4HQgiwG2Leoo9
   LwARheRKxo86IiVvUy2QCUETz1fAMYgJ41HJmS4k0/y5QDI93TKaC8zIa
   w==;
X-CSE-ConnectionGUID: ZHQz1ORZSV2fzdNZQlqtkQ==
X-CSE-MsgGUID: pHn/OmanRcC2gURofSsLUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24140307"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24140307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:39:02 -0700
X-CSE-ConnectionGUID: RNQpGxcDR8C45orDxJFE2w==
X-CSE-MsgGUID: LvHX2WViTVOEzq0M8H5HVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64869494"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 04:39:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRs9-0006Zu-34;
	Tue, 03 Sep 2024 11:38:57 +0000
Date: Tue, 3 Sep 2024 19:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 151/158]
 fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared
 with 'error' attribute: Need native word sized stores/loads for atomicity.
Message-ID: <202409031947.j5QxANMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   55f90d8db66f23e9ceb96dd8d25c905d2de218df
commit: c4773f36d3d05003aee600b6f38608725e936c18 [151/158] percpu: per_cpu_sum()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409031947.j5QxANMp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031947.j5QxANMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031947.j5QxANMp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/alloc_foreground.c:14:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/alloc_foreground.c:14:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/alloc_foreground.c:14:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/alloc_foreground.c:14:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from fs/bcachefs/alloc_foreground.c:14:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     589 |         return per_cpu_sum(*src);
         |                ^
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   7 warnings and 1 error generated.
--
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     589 |         return per_cpu_sum(*src);
         |                ^
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/buckets.c:8:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   7 warnings and 2 errors generated.
--
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     589 |         return per_cpu_sum(*src);
         |                ^
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   In file included from fs/bcachefs/disk_accounting.c:3:
   In file included from fs/bcachefs/bcachefs.h:207:
   In file included from fs/bcachefs/bcachefs_format.h:80:
   In file included from fs/bcachefs/vstructs.h:5:
>> fs/bcachefs/util.h:589:9: error: call to '__compiletime_assert_366' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/linux/percpu.h:169:2: note: expanded from macro 'per_cpu_sum'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:71:1: note: expanded from here
      71 | __compiletime_assert_366
         | ^
   7 warnings and 8 errors generated.
..


vim +589 fs/bcachefs/util.h

   586	
   587	static inline u64 percpu_u64_get(u64 __percpu *src)
   588	{
 > 589		return per_cpu_sum(*src);
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
