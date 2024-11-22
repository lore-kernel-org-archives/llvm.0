Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6E29A5;
	Fri, 22 Nov 2024 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732301767; cv=none; b=UqEaWrUVuifYG0Qa5dHHhUB0RE5LbC51+PO+onK3bp5lpQhR6up50+Nf/kBT/c2fSyGTWA2bT/hTG2Kb4ChLCsbqUeg2KqU9LWLnUOPIkGR08Ez2ZAdb5lKt/K9kZpQQ2S7c3yHE0BiKA8ddZ11UJCV/AIworhh9URkdiKLVjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732301767; c=relaxed/simple;
	bh=MbS/cvC5mXNoa5HYvUZXoxNU2/VPbLUVH7xHDNsVAQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdLmiMIHm8bep5xRCXQ5JClud02qE9f6y86BbnZeFQAH9gJn7l6vMkt3gDjDFl06HEi5uvm3zsLdbSdEql7v+iGNBYRuOiMZWdUcMWdZbowPQMWB3DMGcIQZR07d+CR9bL170TXRSUxottNFIvzulWXwINKb2GB4EJpxT/ethtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8DTL7v/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8DTL7v/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732301765; x=1763837765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MbS/cvC5mXNoa5HYvUZXoxNU2/VPbLUVH7xHDNsVAQ4=;
  b=b8DTL7v/sU9r1m4yOvkRTgpRQPmVpyqfJqQz9MJ7qllZM5Bj4zUzKT1R
   +zuhUON8S7sH7WanZu5EDc+M7v3sw93hIwnsHxneSij9HmVKkzddcS03a
   Ff8YTaZvauCG7B6pO0j3Hbw08Z6q8DUksfM/pdw2zOj7suNimwR8gXUnY
   PZljlBMNBSDI7G4j+vxCJgh/6ShAT9B3D3MjU1KhV3jeU6fcfPGuUqHyK
   Am7SHL6kq2aO0iCJYiIUXHIKnWIPPnaYINwztzde+RefOp9mo7CWp3WVj
   JEy6NQUPlJLFODIScjc6woIA763IBet9Dde3SB5wpOWmAXc+atY1cISTQ
   A==;
X-CSE-ConnectionGUID: jP6Jo1xiRRmHrNHOgMsq5Q==
X-CSE-MsgGUID: PxF69OpBQTKM0KRpDucc2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36243243"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="36243243"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:56:05 -0800
X-CSE-ConnectionGUID: bF39D+8pQE6atPUJsIp/Wg==
X-CSE-MsgGUID: h4ABHw8XQ4q6A0TYRHpsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="91079512"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2024 10:56:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEYoy-00048x-1I;
	Fri, 22 Nov 2024 18:56:00 +0000
Date: Sat, 23 Nov 2024 02:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-s390x 11/11] fs/proc/vmcore.c:1610:2:
 error: incomplete definition of type 'typeof (*cur)' (aka 'struct
 vmcore_mem_node')
Message-ID: <202411230217.X048amH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x
head:   b7d49c2309397709ff11a8a28f1de6a6a226e446
commit: 972500a8a77a5ce566464b024c2116cce168d4ca [11/11] s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)
config: s390-defconfig (https://download.01.org/0day-ci/archive/20241123/202411230217.X048amH4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230217.X048amH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230217.X048amH4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/vmcore.c:11:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/proc/vmcore.c:20:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from fs/proc/vmcore.c:20:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/proc/vmcore.c:20:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
>> fs/proc/vmcore.c:1610:2: error: incomplete definition of type 'typeof (*cur)' (aka 'struct vmcore_mem_node')
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:778:13: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:458:74: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: offsetof of incomplete type 'typeof (*cur)' (aka 'struct vmcore_mem_node')
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:778:13: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^                   ~~~
   include/linux/list.h:779:8: note: expanded from macro 'list_for_each_entry'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^                  ~~~
   include/linux/list.h:769:19: note: expanded from macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                       ~~~^
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:18: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:18: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:458:63: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:18: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:458:63: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
>> fs/proc/vmcore.c:1610:2: error: offsetof of incomplete type 'typeof (*(cur))' (aka 'struct vmcore_mem_node')
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:2: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1611:31: error: incomplete definition of type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                          ~~~^
   include/linux/align.h:13:30: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                            ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1611:44: error: incomplete definition of type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                                       ~~~^
   include/linux/align.h:13:30: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                            ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1611:31: error: incomplete definition of type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                          ~~~^
   include/linux/align.h:13:44: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                          ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1611:44: error: incomplete definition of type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                                       ~~~^
   include/linux/align.h:13:44: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                          ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1612:52: error: incomplete definition of type 'struct vmcore_mem_node'
    1612 |                 elfcorehdr_fill_device_ram_ptload_elf64(phdr, cur->paddr, cur->size);
         |                                                               ~~~^
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1612:64: error: incomplete definition of type 'struct vmcore_mem_node'
    1612 |                 elfcorehdr_fill_device_ram_ptload_elf64(phdr, cur->paddr, cur->size);
         |                                                                           ~~~^
   fs/proc/vmcore.c:1580:9: note: forward declaration of 'struct vmcore_mem_node'
    1580 |         struct vmcore_mem_node *cur;
         |                ^
   fs/proc/vmcore.c:1656:10: error: incomplete definition of type 'struct vmcore_mem_node'
    1656 |         first = list_first_entry(&list, struct vmcore_mem_node, list);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:74: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
>> fs/proc/vmcore.c:1656:10: error: offsetof of incomplete type 'struct vmcore_mem_node'
    1656 |         first = list_first_entry(&list, struct vmcore_mem_node, list);
         |                 ^                       ~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^                       ~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                 ~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^        ~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
>> fs/proc/vmcore.c:1657:2: error: incomplete definition of type 'typeof (*m)' (aka 'struct vmcore_mem_node')
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:778:13: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:458:74: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
>> fs/proc/vmcore.c:1657:2: error: offsetof of incomplete type 'typeof (*m)' (aka 'struct vmcore_mem_node')
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:778:13: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
   fs/proc/vmcore.c:1657:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^                   ~
   include/linux/list.h:779:8: note: expanded from macro 'list_for_each_entry'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^                  ~~~
   include/linux/list.h:769:19: note: expanded from macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                       ~~~^
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
   fs/proc/vmcore.c:1657:2: error: incomplete definition of type 'struct vmcore_mem_node'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:18: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   fs/proc/vmcore.c:1633:9: note: forward declaration of 'struct vmcore_mem_node'
    1633 |         struct vmcore_mem_node *first, *m;
         |                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   16 warnings and 20 errors generated.


vim +1610 fs/proc/vmcore.c

d1284e5619e95e David Hildenbrand 2024-10-16  1575  
d1284e5619e95e David Hildenbrand 2024-10-16  1576  static int vmcore_add_device_ram_elf64(struct list_head *list, size_t count)
d1284e5619e95e David Hildenbrand 2024-10-16  1577  {
d1284e5619e95e David Hildenbrand 2024-10-16  1578  	Elf64_Phdr *phdr_start = (Elf64_Phdr *)(elfcorebuf + sizeof(Elf64_Ehdr));
d1284e5619e95e David Hildenbrand 2024-10-16  1579  	Elf64_Ehdr *ehdr = (Elf64_Ehdr *)elfcorebuf;
d1284e5619e95e David Hildenbrand 2024-10-16 @1580  	struct vmcore_mem_node *cur;
d1284e5619e95e David Hildenbrand 2024-10-16  1581  	Elf64_Phdr *phdr;
d1284e5619e95e David Hildenbrand 2024-10-16  1582  	size_t new_size;
d1284e5619e95e David Hildenbrand 2024-10-16  1583  	int rc;
d1284e5619e95e David Hildenbrand 2024-10-16  1584  
d1284e5619e95e David Hildenbrand 2024-10-16  1585  	if ((Elf32_Half)(ehdr->e_phnum + count) != ehdr->e_phnum + count) {
d1284e5619e95e David Hildenbrand 2024-10-16  1586  		pr_err("Kdump: too many device ram ranges\n");
d1284e5619e95e David Hildenbrand 2024-10-16  1587  		return -ENOSPC;
d1284e5619e95e David Hildenbrand 2024-10-16  1588  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1589  
d1284e5619e95e David Hildenbrand 2024-10-16  1590  	/* elfcorebuf_sz must always cover full pages. */
d1284e5619e95e David Hildenbrand 2024-10-16  1591  	new_size = sizeof(Elf64_Ehdr) +
d1284e5619e95e David Hildenbrand 2024-10-16  1592  		   (ehdr->e_phnum + count) * sizeof(Elf64_Phdr);
d1284e5619e95e David Hildenbrand 2024-10-16  1593  	new_size = roundup(new_size, PAGE_SIZE);
d1284e5619e95e David Hildenbrand 2024-10-16  1594  
d1284e5619e95e David Hildenbrand 2024-10-16  1595  	/*
d1284e5619e95e David Hildenbrand 2024-10-16  1596  	 * Make sure we have sufficient space to include the new PT_LOAD
d1284e5619e95e David Hildenbrand 2024-10-16  1597  	 * entries.
d1284e5619e95e David Hildenbrand 2024-10-16  1598  	 */
d1284e5619e95e David Hildenbrand 2024-10-16  1599  	rc = vmcore_realloc_elfcore_buffer_elf64(new_size);
d1284e5619e95e David Hildenbrand 2024-10-16  1600  	if (rc) {
d1284e5619e95e David Hildenbrand 2024-10-16  1601  		pr_err("Kdump: resizing elfcore failed\n");
d1284e5619e95e David Hildenbrand 2024-10-16  1602  		return rc;
d1284e5619e95e David Hildenbrand 2024-10-16  1603  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1604  
d1284e5619e95e David Hildenbrand 2024-10-16  1605  	/* Modify our used elfcore buffer size to cover the new entries. */
d1284e5619e95e David Hildenbrand 2024-10-16  1606  	elfcorebuf_sz = new_size;
d1284e5619e95e David Hildenbrand 2024-10-16  1607  
d1284e5619e95e David Hildenbrand 2024-10-16  1608  	/* Fill the added PT_LOAD entries. */
d1284e5619e95e David Hildenbrand 2024-10-16  1609  	phdr = phdr_start + ehdr->e_phnum;
d1284e5619e95e David Hildenbrand 2024-10-16 @1610  	list_for_each_entry(cur, list, list) {
d1284e5619e95e David Hildenbrand 2024-10-16  1611  		WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
d1284e5619e95e David Hildenbrand 2024-10-16  1612  		elfcorehdr_fill_device_ram_ptload_elf64(phdr, cur->paddr, cur->size);
d1284e5619e95e David Hildenbrand 2024-10-16  1613  
d1284e5619e95e David Hildenbrand 2024-10-16  1614  		/* p_offset will be adjusted later. */
d1284e5619e95e David Hildenbrand 2024-10-16  1615  		phdr++;
d1284e5619e95e David Hildenbrand 2024-10-16  1616  		ehdr->e_phnum++;
d1284e5619e95e David Hildenbrand 2024-10-16  1617  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1618  	list_splice_tail(list, &vmcore_list);
d1284e5619e95e David Hildenbrand 2024-10-16  1619  
d1284e5619e95e David Hildenbrand 2024-10-16  1620  	/* We changed elfcorebuf_sz and added new entries; reset all offsets. */
d1284e5619e95e David Hildenbrand 2024-10-16  1621  	vmcore_reset_offsets_elf64();
d1284e5619e95e David Hildenbrand 2024-10-16  1622  
d1284e5619e95e David Hildenbrand 2024-10-16  1623  	/* Finally, recalculated the total vmcore size. */
d1284e5619e95e David Hildenbrand 2024-10-16  1624  	vmcore_size = get_vmcore_size(elfcorebuf_sz, elfnotes_sz,
d1284e5619e95e David Hildenbrand 2024-10-16  1625  				      &vmcore_list);
d1284e5619e95e David Hildenbrand 2024-10-16  1626  	proc_vmcore->size = vmcore_size;
d1284e5619e95e David Hildenbrand 2024-10-16  1627  	return 0;
d1284e5619e95e David Hildenbrand 2024-10-16  1628  }
d1284e5619e95e David Hildenbrand 2024-10-16  1629  
d1284e5619e95e David Hildenbrand 2024-10-16  1630  static void vmcore_process_device_ram(struct vmcore_cb *cb)
d1284e5619e95e David Hildenbrand 2024-10-16  1631  {
d1284e5619e95e David Hildenbrand 2024-10-16  1632  	unsigned char *e_ident = (unsigned char *)elfcorebuf;
d1284e5619e95e David Hildenbrand 2024-10-16 @1633  	struct vmcore_mem_node *first, *m;
d1284e5619e95e David Hildenbrand 2024-10-16  1634  	LIST_HEAD(list);
d1284e5619e95e David Hildenbrand 2024-10-16  1635  	int count;
d1284e5619e95e David Hildenbrand 2024-10-16  1636  
d1284e5619e95e David Hildenbrand 2024-10-16  1637  	if (cb->get_device_ram(cb, &list)) {
d1284e5619e95e David Hildenbrand 2024-10-16  1638  		pr_err("Kdump: obtaining device ram ranges failed\n");
d1284e5619e95e David Hildenbrand 2024-10-16  1639  		return;
d1284e5619e95e David Hildenbrand 2024-10-16  1640  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1641  	count = list_count_nodes(&list);
d1284e5619e95e David Hildenbrand 2024-10-16  1642  	if (!count)
d1284e5619e95e David Hildenbrand 2024-10-16  1643  		return;
d1284e5619e95e David Hildenbrand 2024-10-16  1644  
d1284e5619e95e David Hildenbrand 2024-10-16  1645  	/* We only support Elf64 dumps for now. */
d1284e5619e95e David Hildenbrand 2024-10-16  1646  	if (WARN_ON_ONCE(e_ident[EI_CLASS] != ELFCLASS64)) {
d1284e5619e95e David Hildenbrand 2024-10-16  1647  		pr_err("Kdump: device ram ranges only support Elf64\n");
d1284e5619e95e David Hildenbrand 2024-10-16  1648  		goto out_free;
d1284e5619e95e David Hildenbrand 2024-10-16  1649  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1650  
d1284e5619e95e David Hildenbrand 2024-10-16  1651  	/*
d1284e5619e95e David Hildenbrand 2024-10-16  1652  	 * For some reason these ranges are already know? Might happen
d1284e5619e95e David Hildenbrand 2024-10-16  1653  	 * with unusual register->unregister->register sequences; we'll simply
d1284e5619e95e David Hildenbrand 2024-10-16  1654  	 * sanity check using the first range.
d1284e5619e95e David Hildenbrand 2024-10-16  1655  	 */
d1284e5619e95e David Hildenbrand 2024-10-16 @1656  	first = list_first_entry(&list, struct vmcore_mem_node, list);
d1284e5619e95e David Hildenbrand 2024-10-16 @1657  	list_for_each_entry(m, &vmcore_list, list) {
d1284e5619e95e David Hildenbrand 2024-10-16  1658  		unsigned long long m_end = m->paddr + m->size;
d1284e5619e95e David Hildenbrand 2024-10-16  1659  		unsigned long long first_end = first->paddr + first->size;
d1284e5619e95e David Hildenbrand 2024-10-16  1660  
d1284e5619e95e David Hildenbrand 2024-10-16  1661  		if (first->paddr < m_end && m->paddr < first_end)
d1284e5619e95e David Hildenbrand 2024-10-16  1662  			goto out_free;
d1284e5619e95e David Hildenbrand 2024-10-16  1663  	}
d1284e5619e95e David Hildenbrand 2024-10-16  1664  
d1284e5619e95e David Hildenbrand 2024-10-16  1665  	/* If adding the mem nodes succeeds, they must not be freed. */
d1284e5619e95e David Hildenbrand 2024-10-16  1666  	if (!vmcore_add_device_ram_elf64(&list, count))
d1284e5619e95e David Hildenbrand 2024-10-16  1667  		return;
d1284e5619e95e David Hildenbrand 2024-10-16  1668  out_free:
d1284e5619e95e David Hildenbrand 2024-10-16  1669  	vmcore_free_mem_nodes(&list);
d1284e5619e95e David Hildenbrand 2024-10-16  1670  }
d1284e5619e95e David Hildenbrand 2024-10-16  1671  #else /* !CONFIG_PROC_VMCORE_DEVICE_RAM */
d1284e5619e95e David Hildenbrand 2024-10-16  1672  static void vmcore_process_device_ram(struct vmcore_cb *cb)
d1284e5619e95e David Hildenbrand 2024-10-16  1673  {
d1284e5619e95e David Hildenbrand 2024-10-16  1674  }
d1284e5619e95e David Hildenbrand 2024-10-16  1675  #endif /* CONFIG_PROC_VMCORE_DEVICE_RAM */
d1284e5619e95e David Hildenbrand 2024-10-16  1676  

:::::: The code at line 1610 was first introduced by commit
:::::: d1284e5619e95ea9289e6ffba9f152f64d70845c fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: David Hildenbrand <david@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
