Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DE63D;
	Sat, 23 Mar 2024 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711221441; cv=none; b=ME3G+mGiZVbKvSxiDpdrX0QrIDsyhj9ZRhms81WZU++tQu1Ulrtf8JkI5w0k5MPQdb/uNrNjpk5dnZ6Wm2GfTbtRKO+2DQRE4tR5N6bKTfLdyvYf3r61y9PJ2xWjMiL7+MCOJLyHkmnfvTnAdTYOfHl1sX1tRiKzpTkemsAJfZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711221441; c=relaxed/simple;
	bh=qDGfHHB+Ru7zttckyoSE6tv5xSeqcXweMo2euMf/gZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EWTkFJoBqJYFTBmSrC5ma0BehuXekPOPavewk/qhmJQVLZVyU3e/bdVICjtkdaPx8XnxPb4hnJk7ksjoXZaMKtP72gte7CVyTqh1Xj3X0gK1m0ZUSZ1iTLWoOCfRnnlt7tDf8n47Yk0wNQCn9VMTYuIDySaBW1yDaD6xOUNZrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMWhtb0X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMWhtb0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711221438; x=1742757438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDGfHHB+Ru7zttckyoSE6tv5xSeqcXweMo2euMf/gZ8=;
  b=hMWhtb0XSuZecWRR7gwzdCIqbPsg8qahLIw+SooiNeHiCYULZFdOj6Y1
   FVTYfigfPUvNsBFasApGhgQIEyTjUW+yAjD44Pl/9Iq0+EwkWLK4a9Np8
   gW+VlqweH+OZPU1jO9jveRC6WVyyQkRRkMdoRosGLua/dpXrfEREWNZZ0
   c2oYXCodVmtUz+/5lbFBgaxVNLQIM4eq5ZGKjgQHM0uF7wRo7AIoRfb3p
   dzESFFHQxzzhI7lZZi0d3y/MS3IeoqxkPZhAfKrxADEyYVByZSGVBpfba
   4buZHrJ8LSbsZ+mV1Xnrlggpq8sHOK332W1IFVQBhVJUhISnz737lYdH0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6112490"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6112490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 12:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="19694432"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2024 12:17:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro6rg-000LQD-0f;
	Sat, 23 Mar 2024 19:17:12 +0000
Date: Sun, 24 Mar 2024 03:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 59/69]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion
 failed due to requirement 'sizeof(struct idpf_tx_queue) == (((((((64) +
 ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((96) + ((int)((1 <<
 (6))) - 1)) & ~((int)((1 << (6)...
Message-ID: <202403240320.CbQFIrYL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: fb04183614a274111bd5df6b85df717ebf614499 [59/69] idpf: prepare structures to support xdp
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240324/202403240320.CbQFIrYL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240320.CbQFIrYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240320.CbQFIrYL-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_xdp.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == ((((672)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == ALIGN(672, __LIBETH_LARGEST_ALIGN)
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: note: expression evaluates to '768 == 672'
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_xdp.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_tx_queue *)0)->__cacheline_group_begin__read_write))) == ((((96)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) == ALIGN(96, __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '160 == 96'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_xdp.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement 'sizeof(struct idpf_tx_queue) == (((((((64) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((96) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((32) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)))) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': sizeof(struct idpf_tx_queue) == ALIGN((((64) + ((__typeof__(64))((1 << (6))) - 1)) & ~((__typeof__(64))((1 << (6))) - 1)) + (((96) + ((__typeof__(96))((1 << (6))) - 1)) & ~((__typeof__(96))((1 << (6))) - 1)) + (((32) + ((__typeof__(32))((1 << (6))) - 1)) & ~((__typeof__(32))((1 << (6))) - 1)), __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:16: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '320 == 256'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:29: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   5 warnings and 3 errors generated.
--
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == ((((672)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == ALIGN(672, __LIBETH_LARGEST_ALIGN)
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: note: expression evaluates to '768 == 672'
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_tx_queue *)0)->__cacheline_group_begin__read_write))) == ((((96)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) == ALIGN(96, __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '160 == 96'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement 'sizeof(struct idpf_tx_queue) == (((((((64) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((96) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((32) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)))) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': sizeof(struct idpf_tx_queue) == ALIGN((((64) + ((__typeof__(64))((1 << (6))) - 1)) & ~((__typeof__(64))((1 << (6))) - 1)) + (((96) + ((__typeof__(96))((1 << (6))) - 1)) & ~((__typeof__(96))((1 << (6))) - 1)) + (((32) + ((__typeof__(32))((1 << (6))) - 1)) & ~((__typeof__(32))((1 << (6))) - 1)), __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:16: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '320 == 256'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:29: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_main.c:168:39: warning: shift count >= width of type [-Wshift-count-overflow]
     168 |         err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   6 warnings and 3 errors generated.
--
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == ((((672)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1)))) - 1))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == ALIGN(672, __LIBETH_LARGEST_ALIGN)
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: note: expression evaluates to '768 == 672'
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_tx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_tx_queue *)0)->__cacheline_group_begin__read_write))) == ((((96)) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) == ALIGN(96, __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '160 == 96'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:36:2: note: expanded from macro '__libeth_cacheline_set_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:22:59: note: expanded from macro '__libeth_cacheline_group_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       offsetofend(type, __cacheline_group_begin__##grp) ==  \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
      23 |                       ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:24:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: error: static assertion failed due to requirement 'sizeof(struct idpf_tx_queue) == (((((((64) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((96) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)) + (((32) + ((int)((1 << (6))) - 1)) & ~((int)((1 << (6))) - 1)))) + ((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1)) & ~((int)((sizeof(struct (unnamed at drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1)))) - 1))': sizeof(struct idpf_tx_queue) == ALIGN((((64) + ((__typeof__(64))((1 << (6))) - 1)) & ~((__typeof__(64))((1 << (6))) - 1)) + (((96) + ((__typeof__(96))((1 << (6))) - 1)) & ~((__typeof__(96))((1 << (6))) - 1)) + (((32) + ((__typeof__(32))((1 << (6))) - 1)) & ~((__typeof__(32))((1 << (6))) - 1)), __LIBETH_LARGEST_ALIGN)
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:16: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: expression evaluates to '320 == 256'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:38:2: note: expanded from macro '__libeth_cacheline_set_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      39 |                                          L1_CACHE_ALIGN(ro) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                          L1_CACHE_ALIGN(rw) +               \
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          L1_CACHE_ALIGN(c))
         |                                          ~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:29: note: expanded from macro '__libeth_cacheline_struct_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:2924:49: warning: bitwise operation between different enumeration types ('enum idpf_tx_desc_dtype_value' and 'enum idpf_tx_flex_ctx_desc_cmd_bits') [-Wenum-enum-conversion]
    2924 |                                 cpu_to_le16(IDPF_TX_DESC_DTYPE_FLEX_TSO_CTX |
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    2925 |                                             IDPF_TX_FLEX_CTX_DESC_CMD_TSO);
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_to_le16'
      90 | #define cpu_to_le16 __cpu_to_le16
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   6 warnings and 3 errors generated.


vim +733 drivers/net/ethernet/intel/idpf/idpf_txrx.h

900667c5aec4db Alexander Lobakin 2023-11-29  492  
900667c5aec4db Alexander Lobakin 2023-11-29  493  /**
900667c5aec4db Alexander Lobakin 2023-11-29  494   * struct idpf_rx_queue - software structure represting a receive queue
900667c5aec4db Alexander Lobakin 2023-11-29  495   * @bufq_sets: Pointer to the array of buffer queues in splitq mode
7cd38a2a460fbc Alexander Lobakin 2023-12-06  496   * @rx_buf: see struct &libeth_fqe
900667c5aec4db Alexander Lobakin 2023-11-29  497   * @rx: Received packets descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  498   * @single_buf: Posted buffers descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  499   * @desc_ring: Descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  500   * @napi: NAPI instance corresponding to this queue (splitq)
900667c5aec4db Alexander Lobakin 2023-11-29  501   * @pp: Page pool pointer in singleq mode
900667c5aec4db Alexander Lobakin 2023-11-29  502   * @tail: Tail offset. Used for both queue models single and split.
900667c5aec4db Alexander Lobakin 2023-11-29  503   * @flags: See enum idpf_queue_flags_t
900667c5aec4db Alexander Lobakin 2023-11-29  504   * @idx: For RX queue, it is used to index to total RX queue across groups and
95af467d9a4e3b Alan Brady        2023-08-07  505   *	 used for skb reporting.
900667c5aec4db Alexander Lobakin 2023-11-29  506   * @desc_count: Number of descriptors
900667c5aec4db Alexander Lobakin 2023-11-29  507   * @next_to_use: Next descriptor to use
900667c5aec4db Alexander Lobakin 2023-11-29  508   * @next_to_clean: Next descriptor to clean
900667c5aec4db Alexander Lobakin 2023-11-29  509   * @next_to_alloc: RX buffer to allocate at
fb04183614a274 Michal Kubiak     2023-10-03  510   * @rxdids: Supported RX descriptor ids
900667c5aec4db Alexander Lobakin 2023-11-29  511   * @rx_ptype_lkup: LUT of Rx ptypes
fb04183614a274 Michal Kubiak     2023-10-03  512   * @xdp_rxq: XDP queue info
fb04183614a274 Michal Kubiak     2023-10-03  513   * @xdpqs: shortcut for XDP Tx queues array
fb04183614a274 Michal Kubiak     2023-10-03  514   * @num_xdp_txq: total number of XDP Tx queues
7cd38a2a460fbc Alexander Lobakin 2023-12-06  515   * @truesize: data buffer truesize in singleq
fb04183614a274 Michal Kubiak     2023-10-03  516   * @skb: Pointer to the skb
900667c5aec4db Alexander Lobakin 2023-11-29  517   * @stats_sync: See struct u64_stats_sync
900667c5aec4db Alexander Lobakin 2023-11-29  518   * @q_stats: See union idpf_rx_queue_stats
1c325aac10a82f Alan Brady        2023-08-07  519   * @q_id: Queue id
900667c5aec4db Alexander Lobakin 2023-11-29  520   * @size: Length of descriptor ring in bytes
900667c5aec4db Alexander Lobakin 2023-11-29  521   * @dma: Physical address of ring
900667c5aec4db Alexander Lobakin 2023-11-29  522   * @q_vector: Backreference to associated vector
900667c5aec4db Alexander Lobakin 2023-11-29  523   * @rx_buffer_low_watermark: RX buffer low watermark
900667c5aec4db Alexander Lobakin 2023-11-29  524   * @rx_hbuf_size: Header buffer size
900667c5aec4db Alexander Lobakin 2023-11-29  525   * @rx_buf_size: Buffer size
900667c5aec4db Alexander Lobakin 2023-11-29  526   * @rx_max_pkt_size: RX max packet size
900667c5aec4db Alexander Lobakin 2023-11-29  527   */
900667c5aec4db Alexander Lobakin 2023-11-29  528  struct idpf_rx_queue {
e064d1b1541453 Alexander Lobakin 2024-03-21  529  	__libeth_cacheline_group_begin(read_mostly);
900667c5aec4db Alexander Lobakin 2023-11-29  530  	union {
900667c5aec4db Alexander Lobakin 2023-11-29  531  		union virtchnl2_rx_desc *rx;
900667c5aec4db Alexander Lobakin 2023-11-29  532  		struct virtchnl2_singleq_rx_buf_desc *single_buf;
900667c5aec4db Alexander Lobakin 2023-11-29  533  
900667c5aec4db Alexander Lobakin 2023-11-29  534  		void *desc_ring;
900667c5aec4db Alexander Lobakin 2023-11-29  535  	};
900667c5aec4db Alexander Lobakin 2023-11-29  536  	union {
900667c5aec4db Alexander Lobakin 2023-11-29  537  		struct {
900667c5aec4db Alexander Lobakin 2023-11-29  538  			struct idpf_bufq_set *bufq_sets;
900667c5aec4db Alexander Lobakin 2023-11-29  539  			struct napi_struct *napi;
900667c5aec4db Alexander Lobakin 2023-11-29  540  		};
900667c5aec4db Alexander Lobakin 2023-11-29  541  		struct {
7cd38a2a460fbc Alexander Lobakin 2023-12-06  542  			struct libeth_fqe *rx_buf;
900667c5aec4db Alexander Lobakin 2023-11-29  543  			struct page_pool *pp;
900667c5aec4db Alexander Lobakin 2023-11-29  544  		};
900667c5aec4db Alexander Lobakin 2023-11-29  545  	};
900667c5aec4db Alexander Lobakin 2023-11-29  546  	void __iomem *tail;
900667c5aec4db Alexander Lobakin 2023-11-29  547  
900667c5aec4db Alexander Lobakin 2023-11-29  548  	DECLARE_BITMAP(flags, __IDPF_Q_FLAGS_NBITS);
900667c5aec4db Alexander Lobakin 2023-11-29  549  	u16 idx;
900667c5aec4db Alexander Lobakin 2023-11-29  550  	u16 desc_count;
e064d1b1541453 Alexander Lobakin 2024-03-21  551  
fb04183614a274 Michal Kubiak     2023-10-03  552  	u32 num_xdp_txq;
fb04183614a274 Michal Kubiak     2023-10-03  553  	union {
fb04183614a274 Michal Kubiak     2023-10-03  554  		struct idpf_tx_queue **xdpqs;
fb04183614a274 Michal Kubiak     2023-10-03  555  		struct {
e064d1b1541453 Alexander Lobakin 2024-03-21  556  			u32 rxdids;
fb04183614a274 Michal Kubiak     2023-10-03  557  			u32 truesize;
fb04183614a274 Michal Kubiak     2023-10-03  558  		};
fb04183614a274 Michal Kubiak     2023-10-03  559  	};
bc08fcb7713775 Alexander Lobakin 2023-11-29  560  	const struct libeth_rpt *rx_ptype_lkup;
fb04183614a274 Michal Kubiak     2023-10-03  561  
fb04183614a274 Michal Kubiak     2023-10-03  562  	struct xdp_rxq_info xdp_rxq;
e064d1b1541453 Alexander Lobakin 2024-03-21  563  	__libeth_cacheline_group_end(read_mostly);
e064d1b1541453 Alexander Lobakin 2024-03-21  564  
e064d1b1541453 Alexander Lobakin 2024-03-21  565  	__libeth_cacheline_group_begin(read_write);
900667c5aec4db Alexander Lobakin 2023-11-29  566  	u16 next_to_use;
900667c5aec4db Alexander Lobakin 2023-11-29  567  	u16 next_to_clean;
900667c5aec4db Alexander Lobakin 2023-11-29  568  	u16 next_to_alloc;
900667c5aec4db Alexander Lobakin 2023-11-29  569  
900667c5aec4db Alexander Lobakin 2023-11-29  570  	struct sk_buff *skb;
900667c5aec4db Alexander Lobakin 2023-11-29  571  
900667c5aec4db Alexander Lobakin 2023-11-29  572  	struct u64_stats_sync stats_sync;
900667c5aec4db Alexander Lobakin 2023-11-29  573  	struct idpf_rx_queue_stats q_stats;
e064d1b1541453 Alexander Lobakin 2024-03-21  574  	__libeth_cacheline_group_end(read_write);
900667c5aec4db Alexander Lobakin 2023-11-29  575  
e064d1b1541453 Alexander Lobakin 2024-03-21  576  	__libeth_cacheline_group_begin(cold);
900667c5aec4db Alexander Lobakin 2023-11-29  577  	u32 q_id;
900667c5aec4db Alexander Lobakin 2023-11-29  578  	u32 size;
900667c5aec4db Alexander Lobakin 2023-11-29  579  	dma_addr_t dma;
900667c5aec4db Alexander Lobakin 2023-11-29  580  
900667c5aec4db Alexander Lobakin 2023-11-29  581  	struct idpf_q_vector *q_vector;
900667c5aec4db Alexander Lobakin 2023-11-29  582  
900667c5aec4db Alexander Lobakin 2023-11-29  583  	u16 rx_buffer_low_watermark;
900667c5aec4db Alexander Lobakin 2023-11-29  584  	u16 rx_hbuf_size;
900667c5aec4db Alexander Lobakin 2023-11-29  585  	u16 rx_buf_size;
900667c5aec4db Alexander Lobakin 2023-11-29  586  	u16 rx_max_pkt_size;
e064d1b1541453 Alexander Lobakin 2024-03-21  587  	__libeth_cacheline_group_end(cold);
900667c5aec4db Alexander Lobakin 2023-11-29  588  } ____cacheline_aligned;
fb04183614a274 Michal Kubiak     2023-10-03  589  __libeth_cacheline_set_assert(struct idpf_rx_queue,
fb04183614a274 Michal Kubiak     2023-10-03  590  			      ALIGN(64, L1_CACHE_BYTES) + L1_CACHE_BYTES,
fb04183614a274 Michal Kubiak     2023-10-03  591  			      80, 32);
900667c5aec4db Alexander Lobakin 2023-11-29  592  
900667c5aec4db Alexander Lobakin 2023-11-29  593  /**
900667c5aec4db Alexander Lobakin 2023-11-29  594   * struct idpf_tx_queue - software structure represting a transmit queue
900667c5aec4db Alexander Lobakin 2023-11-29  595   * @tx_buf: See struct idpf_tx_buf
900667c5aec4db Alexander Lobakin 2023-11-29  596   * @base_tx: Base transmit descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  597   * @base_ctx: Base context descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  598   * @flex_tx: Flex transmit descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  599   * @flex_ctx: Flex context descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  600   * @desc_ring: Descriptor ring memory
900667c5aec4db Alexander Lobakin 2023-11-29  601   * @txq_grp: See struct idpf_txq_group
fb04183614a274 Michal Kubiak     2023-10-03  602   * @complq: corresponding completion queue in XDP mode
900667c5aec4db Alexander Lobakin 2023-11-29  603   * @dev: Device back pointer for DMA mapping
900667c5aec4db Alexander Lobakin 2023-11-29  604   * @tail: Tail offset. Used for both queue models single and split
1c325aac10a82f Alan Brady        2023-08-07  605   * @flags: See enum idpf_queue_flags_t
900667c5aec4db Alexander Lobakin 2023-11-29  606   * @idx: For TX queue, it is used as index to map between TX queue group and
900667c5aec4db Alexander Lobakin 2023-11-29  607   *	 hot path TX pointers stored in vport. Used in both singleq/splitq.
900667c5aec4db Alexander Lobakin 2023-11-29  608   * @desc_count: Number of descriptors
900667c5aec4db Alexander Lobakin 2023-11-29  609   * @next_to_use: Next descriptor to use
900667c5aec4db Alexander Lobakin 2023-11-29  610   * @next_to_clean: Next descriptor to clean
900667c5aec4db Alexander Lobakin 2023-11-29  611   * @netdev: &net_device corresponding to this queue
c2d548cad1508d Joshua Hay        2023-08-07  612   * @cleaned_bytes: Splitq only, TXQ only: When a TX completion is received on
c2d548cad1508d Joshua Hay        2023-08-07  613   *		   the TX completion queue, it can be for any TXQ associated
c2d548cad1508d Joshua Hay        2023-08-07  614   *		   with that completion queue. This means we can clean up to
c2d548cad1508d Joshua Hay        2023-08-07  615   *		   N TXQs during a single call to clean the completion queue.
c2d548cad1508d Joshua Hay        2023-08-07  616   *		   cleaned_bytes|pkts tracks the clean stats per TXQ during
c2d548cad1508d Joshua Hay        2023-08-07  617   *		   that single call to clean the completion queue. By doing so,
c2d548cad1508d Joshua Hay        2023-08-07  618   *		   we can update BQL with aggregate cleaned stats for each TXQ
c2d548cad1508d Joshua Hay        2023-08-07  619   *		   only once at the end of the cleaning routine.
900667c5aec4db Alexander Lobakin 2023-11-29  620   * @clean_budget: singleq only, queue cleaning budget
c2d548cad1508d Joshua Hay        2023-08-07  621   * @cleaned_pkts: Number of packets cleaned for the above said case
1c325aac10a82f Alan Brady        2023-08-07  622   * @tx_max_bufs: Max buffers that can be transmitted with scatter-gather
1c325aac10a82f Alan Brady        2023-08-07  623   * @tx_min_pkt_len: Min supported packet length
1c325aac10a82f Alan Brady        2023-08-07  624   * @compl_tag_bufid_m: Completion tag buffer id mask
1c325aac10a82f Alan Brady        2023-08-07  625   * @compl_tag_gen_s: Completion tag generation bit
1c325aac10a82f Alan Brady        2023-08-07  626   *	The format of the completion tag will change based on the TXQ
1c325aac10a82f Alan Brady        2023-08-07  627   *	descriptor ring size so that we can maintain roughly the same level
1c325aac10a82f Alan Brady        2023-08-07  628   *	of "uniqueness" across all descriptor sizes. For example, if the
1c325aac10a82f Alan Brady        2023-08-07  629   *	TXQ descriptor ring size is 64 (the minimum size supported), the
1c325aac10a82f Alan Brady        2023-08-07  630   *	completion tag will be formatted as below:
1c325aac10a82f Alan Brady        2023-08-07  631   *	15                 6 5         0
1c325aac10a82f Alan Brady        2023-08-07  632   *	--------------------------------
1c325aac10a82f Alan Brady        2023-08-07  633   *	|    GEN=0-1023     |IDX = 0-63|
1c325aac10a82f Alan Brady        2023-08-07  634   *	--------------------------------
1c325aac10a82f Alan Brady        2023-08-07  635   *
1c325aac10a82f Alan Brady        2023-08-07  636   *	This gives us 64*1024 = 65536 possible unique values. Similarly, if
1c325aac10a82f Alan Brady        2023-08-07  637   *	the TXQ descriptor ring size is 8160 (the maximum size supported),
1c325aac10a82f Alan Brady        2023-08-07  638   *	the completion tag will be formatted as below:
1c325aac10a82f Alan Brady        2023-08-07  639   *	15 13 12                       0
1c325aac10a82f Alan Brady        2023-08-07  640   *	--------------------------------
1c325aac10a82f Alan Brady        2023-08-07  641   *	|GEN |       IDX = 0-8159      |
1c325aac10a82f Alan Brady        2023-08-07  642   *	--------------------------------
1c325aac10a82f Alan Brady        2023-08-07  643   *
1c325aac10a82f Alan Brady        2023-08-07  644   *	This gives us 8*8160 = 65280 possible unique values.
1c325aac10a82f Alan Brady        2023-08-07  645   * @compl_tag_cur_gen: Used to keep track of current completion tag generation
1c325aac10a82f Alan Brady        2023-08-07  646   * @compl_tag_gen_max: To determine when compl_tag_cur_gen should be reset
900667c5aec4db Alexander Lobakin 2023-11-29  647   * @stash: Tx buffer stash for Flow-based scheduling mode
fb04183614a274 Michal Kubiak     2023-10-03  648   * @pending: number of pending descriptors to send in QB
fb04183614a274 Michal Kubiak     2023-10-03  649   * @xdp_tx: number of pending &xdp_buff or &xdp_frame buffers
fb04183614a274 Michal Kubiak     2023-10-03  650   * @thresh: XDP queue cleaning threshold
fb04183614a274 Michal Kubiak     2023-10-03  651   * @timer: timer for XDP Tx queue cleanup
fb04183614a274 Michal Kubiak     2023-10-03  652   * @xdp_lock: lock for XDP Tx queues sharing
900667c5aec4db Alexander Lobakin 2023-11-29  653   * @stats_sync: See struct u64_stats_sync
900667c5aec4db Alexander Lobakin 2023-11-29  654   * @q_stats: See union idpf_tx_queue_stats
900667c5aec4db Alexander Lobakin 2023-11-29  655   * @q_id: Queue id
900667c5aec4db Alexander Lobakin 2023-11-29  656   * @size: Length of descriptor ring in bytes
900667c5aec4db Alexander Lobakin 2023-11-29  657   * @dma: Physical address of ring
900667c5aec4db Alexander Lobakin 2023-11-29  658   * @q_vector: Backreference to associated vector
1c325aac10a82f Alan Brady        2023-08-07  659   */
900667c5aec4db Alexander Lobakin 2023-11-29  660  struct idpf_tx_queue {
e064d1b1541453 Alexander Lobakin 2024-03-21  661  	__libeth_cacheline_group_begin(read_mostly);
95af467d9a4e3b Alan Brady        2023-08-07  662  	union {
900667c5aec4db Alexander Lobakin 2023-11-29  663  		struct idpf_base_tx_desc *base_tx;
900667c5aec4db Alexander Lobakin 2023-11-29  664  		struct idpf_base_tx_ctx_desc *base_ctx;
900667c5aec4db Alexander Lobakin 2023-11-29  665  		union idpf_tx_flex_desc *flex_tx;
900667c5aec4db Alexander Lobakin 2023-11-29  666  		struct idpf_flex_tx_ctx_desc *flex_ctx;
900667c5aec4db Alexander Lobakin 2023-11-29  667  
900667c5aec4db Alexander Lobakin 2023-11-29  668  		void *desc_ring;
95af467d9a4e3b Alan Brady        2023-08-07  669  	};
2e171079251cef Alexander Lobakin 2023-12-13  670  	struct libeth_sqe *tx_buf;
fb04183614a274 Michal Kubiak     2023-10-03  671  	union {
900667c5aec4db Alexander Lobakin 2023-11-29  672  		struct idpf_txq_group *txq_grp;
fb04183614a274 Michal Kubiak     2023-10-03  673  		struct idpf_compl_queue *complq;
fb04183614a274 Michal Kubiak     2023-10-03  674  	};
900667c5aec4db Alexander Lobakin 2023-11-29  675  	struct device *dev;
1c325aac10a82f Alan Brady        2023-08-07  676  	void __iomem *tail;
900667c5aec4db Alexander Lobakin 2023-11-29  677  
900667c5aec4db Alexander Lobakin 2023-11-29  678  	DECLARE_BITMAP(flags, __IDPF_Q_FLAGS_NBITS);
900667c5aec4db Alexander Lobakin 2023-11-29  679  	u16 idx;
900667c5aec4db Alexander Lobakin 2023-11-29  680  	u16 desc_count;
e064d1b1541453 Alexander Lobakin 2024-03-21  681  
fb04183614a274 Michal Kubiak     2023-10-03  682  	union {
fb04183614a274 Michal Kubiak     2023-10-03  683  		struct {
e064d1b1541453 Alexander Lobakin 2024-03-21  684  			u16 tx_min_pkt_len;
e064d1b1541453 Alexander Lobakin 2024-03-21  685  			u16 compl_tag_gen_s;
fb04183614a274 Michal Kubiak     2023-10-03  686  		};
fb04183614a274 Michal Kubiak     2023-10-03  687  		u32 thresh;
fb04183614a274 Michal Kubiak     2023-10-03  688  	};
900667c5aec4db Alexander Lobakin 2023-11-29  689  
900667c5aec4db Alexander Lobakin 2023-11-29  690  	struct net_device *netdev;
e064d1b1541453 Alexander Lobakin 2024-03-21  691  	__libeth_cacheline_group_end(read_mostly);
e064d1b1541453 Alexander Lobakin 2024-03-21  692  
e064d1b1541453 Alexander Lobakin 2024-03-21  693  	__libeth_cacheline_group_begin(read_write);
e064d1b1541453 Alexander Lobakin 2024-03-21  694  	u16 next_to_use;
e064d1b1541453 Alexander Lobakin 2024-03-21  695  	u16 next_to_clean;
900667c5aec4db Alexander Lobakin 2023-11-29  696  
fb04183614a274 Michal Kubiak     2023-10-03  697  	union {
fb04183614a274 Michal Kubiak     2023-10-03  698  		struct {
95af467d9a4e3b Alan Brady        2023-08-07  699  			union {
900667c5aec4db Alexander Lobakin 2023-11-29  700  				u32 cleaned_bytes;
900667c5aec4db Alexander Lobakin 2023-11-29  701  				u32 clean_budget;
900667c5aec4db Alexander Lobakin 2023-11-29  702  			};
900667c5aec4db Alexander Lobakin 2023-11-29  703  			u16 cleaned_pkts;
900667c5aec4db Alexander Lobakin 2023-11-29  704  
900667c5aec4db Alexander Lobakin 2023-11-29  705  			u16 tx_max_bufs;
e064d1b1541453 Alexander Lobakin 2024-03-21  706  			struct idpf_txq_stash *stash;
900667c5aec4db Alexander Lobakin 2023-11-29  707  
900667c5aec4db Alexander Lobakin 2023-11-29  708  			u16 compl_tag_bufid_m;
900667c5aec4db Alexander Lobakin 2023-11-29  709  			u16 compl_tag_cur_gen;
900667c5aec4db Alexander Lobakin 2023-11-29  710  			u16 compl_tag_gen_max;
fb04183614a274 Michal Kubiak     2023-10-03  711  		};
fb04183614a274 Michal Kubiak     2023-10-03  712  		struct {
fb04183614a274 Michal Kubiak     2023-10-03  713  			u32 pending;
fb04183614a274 Michal Kubiak     2023-10-03  714  			u32 xdp_tx;
fb04183614a274 Michal Kubiak     2023-10-03  715  
fb04183614a274 Michal Kubiak     2023-10-03  716  			struct libeth_xdpsq_timer *timer;
fb04183614a274 Michal Kubiak     2023-10-03  717  			struct libeth_xdpsq_lock xdp_lock;
fb04183614a274 Michal Kubiak     2023-10-03  718  		};
fb04183614a274 Michal Kubiak     2023-10-03  719  	};
900667c5aec4db Alexander Lobakin 2023-11-29  720  
900667c5aec4db Alexander Lobakin 2023-11-29  721  	struct u64_stats_sync stats_sync;
900667c5aec4db Alexander Lobakin 2023-11-29  722  	struct idpf_tx_queue_stats q_stats;
e064d1b1541453 Alexander Lobakin 2024-03-21  723  	__libeth_cacheline_group_end(read_write);
900667c5aec4db Alexander Lobakin 2023-11-29  724  
e064d1b1541453 Alexander Lobakin 2024-03-21  725  	__libeth_cacheline_group_begin(cold);
900667c5aec4db Alexander Lobakin 2023-11-29  726  	u32 q_id;
900667c5aec4db Alexander Lobakin 2023-11-29  727  	u32 size;
900667c5aec4db Alexander Lobakin 2023-11-29  728  	dma_addr_t dma;
900667c5aec4db Alexander Lobakin 2023-11-29  729  
900667c5aec4db Alexander Lobakin 2023-11-29  730  	struct idpf_q_vector *q_vector;
e064d1b1541453 Alexander Lobakin 2024-03-21  731  	__libeth_cacheline_group_end(cold);
900667c5aec4db Alexander Lobakin 2023-11-29  732  } ____cacheline_aligned;
e064d1b1541453 Alexander Lobakin 2024-03-21 @733  __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
900667c5aec4db Alexander Lobakin 2023-11-29  734  

:::::: The code at line 733 was first introduced by commit
:::::: e064d1b15414531f7ec592b68b936940c8ee0072 idpf: strictly assert cachelines of queue and queue vector structures

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
