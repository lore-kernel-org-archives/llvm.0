Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C4482D0;
	Tue, 20 Feb 2024 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708400965; cv=none; b=pdN8XH5krXev/UB35pQBNbqEI7iOkW6MT+yqSCuk2m+i5ULvaeMZmRo09+AhtZ9YYCnZUciVDjLlPlYI+K5P+rRGIw3LM1myeVZr2NNZkQfdS7HRTwW1ZYwObb5KJlQDEn8iv3H9cnasXvVWxPjgU0Q8ZmQtPdhrcHDoH8XQlwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708400965; c=relaxed/simple;
	bh=HoJ7m22KyzW7ojOy6kzfH7WomttcDPgBOlpy5qsGtVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oiOhM3c4zE1igvGAa18CBGKg/ERNYGS37XZxEWD9JsjieuTS45OWCT1I8G/4d6l0jIFBG1QOq+BNexwm7rYctd03h6xGnycihgeXehJ1vg6qf/9n7ZRgZwKzZ/XtQIEFhh9Yjv2FiBVfIpQFq9IazoxnszinX8b8dZUM6Yx6DCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JG+efCTG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JG+efCTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708400963; x=1739936963;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HoJ7m22KyzW7ojOy6kzfH7WomttcDPgBOlpy5qsGtVU=;
  b=JG+efCTGkLiXr+CC3n5WU1Q+DewnnAp8U3H3FYZmE0wCUqllRGTOSsdn
   k01/rosAXEumUXcZrkuQ2QPr2iyWFYFp42o/LBccWiAuJD5zZleTr/lWj
   Ozd7ihUN7LRC1591wR8fl4QVIpiJ/eqQByzD+56/QPP3QlJkjkRyhCNhJ
   SzvTW8h5ci+FHMQ1loLZrtOta/9wmRvzy+iLvreSFTZJYOqMXMlmSh2lQ
   PzxWemtLK73LG8JggE+Cj7kRwsV2iefpc5/0zE89ZRnC3tJjP5PrwRS8v
   yeBLppuucubKS06J1tsM/gr76th/IYigbf4Wm/z+Fs1ZsmgceRg1MMQfN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13041886"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="13041886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 19:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="35681943"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2024 19:49:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcH87-0004Eq-1G;
	Tue, 20 Feb 2024 03:49:15 +0000
Date: Tue, 20 Feb 2024 11:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6 3/21] include/asm-generic/io.h:793:18: error:
 static declaration of 'ioread8' follows non-static declaration
Message-ID: <202402201152.TbIjMUta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6
head:   1de35c5842016bbcca093edfda2226be9a1b5550
commit: d76a532829a888a20000276aec939f817ddc1c4d [3/21] hexagon: Don't select GENERIC_IOMAP without HAS_IOPORT support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240220/202402201152.TbIjMUta-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201152.TbIjMUta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201152.TbIjMUta-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> include/asm-generic/io.h:793:18: error: static declaration of 'ioread8' follows non-static declaration
     793 | static inline u8 ioread8(const volatile void __iomem *addr)
         |                  ^
   include/asm-generic/io.h:792:17: note: expanded from macro 'ioread8'
     792 | #define ioread8 ioread8
         |                 ^
   include/asm-generic/iomap.h:29:21: note: previous declaration is here
      29 | extern unsigned int ioread8(const void __iomem *);
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:801:19: error: static declaration of 'ioread16' follows non-static declaration
     801 | static inline u16 ioread16(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:800:18: note: expanded from macro 'ioread16'
     800 | #define ioread16 ioread16
         |                  ^
   include/asm-generic/iomap.h:30:21: note: previous declaration is here
      30 | extern unsigned int ioread16(const void __iomem *);
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:809:19: error: static declaration of 'ioread32' follows non-static declaration
     809 | static inline u32 ioread32(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:808:18: note: expanded from macro 'ioread32'
     808 | #define ioread32 ioread32
         |                  ^
   include/asm-generic/iomap.h:32:21: note: previous declaration is here
      32 | extern unsigned int ioread32(const void __iomem *);
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:827:20: error: static declaration of 'iowrite8' follows non-static declaration
     827 | static inline void iowrite8(u8 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:826:18: note: expanded from macro 'iowrite8'
     826 | #define iowrite8 iowrite8
         |                  ^
   include/asm-generic/iomap.h:50:13: note: previous declaration is here
      50 | extern void iowrite8(u8, void __iomem *);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:835:20: error: static declaration of 'iowrite16' follows non-static declaration
     835 | static inline void iowrite16(u16 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:834:19: note: expanded from macro 'iowrite16'
     834 | #define iowrite16 iowrite16
         |                   ^
   include/asm-generic/iomap.h:51:13: note: previous declaration is here
      51 | extern void iowrite16(u16, void __iomem *);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:843:20: error: static declaration of 'iowrite32' follows non-static declaration
     843 | static inline void iowrite32(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:842:19: note: expanded from macro 'iowrite32'
     842 | #define iowrite32 iowrite32
         |                   ^
   include/asm-generic/iomap.h:53:13: note: previous declaration is here
      53 | extern void iowrite32(u32, void __iomem *);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:861:19: error: static declaration of 'ioread16be' follows non-static declaration
     861 | static inline u16 ioread16be(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:860:20: note: expanded from macro 'ioread16be'
     860 | #define ioread16be ioread16be
         |                    ^
   include/asm-generic/iomap.h:31:21: note: previous declaration is here
      31 | extern unsigned int ioread16be(const void __iomem *);
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:869:19: error: static declaration of 'ioread32be' follows non-static declaration
     869 | static inline u32 ioread32be(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:868:20: note: expanded from macro 'ioread32be'
     868 | #define ioread32be ioread32be
         |                    ^
   include/asm-generic/iomap.h:33:21: note: previous declaration is here
      33 | extern unsigned int ioread32be(const void __iomem *);
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:887:20: error: static declaration of 'iowrite16be' follows non-static declaration
     887 | static inline void iowrite16be(u16 value, void volatile __iomem *addr)
         |                    ^
   include/asm-generic/io.h:886:21: note: expanded from macro 'iowrite16be'
     886 | #define iowrite16be iowrite16be
         |                     ^
   include/asm-generic/iomap.h:52:13: note: previous declaration is here
      52 | extern void iowrite16be(u16, void __iomem *);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:895:20: error: static declaration of 'iowrite32be' follows non-static declaration
     895 | static inline void iowrite32be(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:894:21: note: expanded from macro 'iowrite32be'
     894 | #define iowrite32be iowrite32be
         |                     ^
   include/asm-generic/iomap.h:54:13: note: previous declaration is here
      54 | extern void iowrite32be(u32, void __iomem *);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:913:20: error: static declaration of 'ioread8_rep' follows non-static declaration
     913 | static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
         |                    ^
   include/asm-generic/io.h:912:21: note: expanded from macro 'ioread8_rep'
     912 | #define ioread8_rep ioread8_rep
         |                     ^
   include/asm-generic/iomap.h:82:13: note: previous declaration is here
      82 | extern void ioread8_rep(const void __iomem *port, void *buf, unsigned long count);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:922:20: error: static declaration of 'ioread16_rep' follows non-static declaration
     922 | static inline void ioread16_rep(const volatile void __iomem *addr,
         |                    ^
   include/asm-generic/io.h:921:22: note: expanded from macro 'ioread16_rep'
     921 | #define ioread16_rep ioread16_rep
         |                      ^
   include/asm-generic/iomap.h:83:13: note: previous declaration is here
      83 | extern void ioread16_rep(const void __iomem *port, void *buf, unsigned long count);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:925:9: error: passing 'const volatile void *' to parameter of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     925 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/hexagon/include/asm/io.h:37:38: note: expanded from macro 'readsw'
      37 | #define readsw(p, d, l) __raw_readsw(p, d, l)
         |                                      ^
   arch/hexagon/include/asm/io.h:31:46: note: passing argument to parameter 'addr' here
      31 | extern void __raw_readsw(const void __iomem *addr, void *data, int wordlen);
         |                                              ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:931:20: error: static declaration of 'ioread32_rep' follows non-static declaration
     931 | static inline void ioread32_rep(const volatile void __iomem *addr,
         |                    ^
   include/asm-generic/io.h:930:22: note: expanded from macro 'ioread32_rep'
     930 | #define ioread32_rep ioread32_rep
         |                      ^
   include/asm-generic/iomap.h:84:13: note: previous declaration is here
      84 | extern void ioread32_rep(const void __iomem *port, void *buf, unsigned long count);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:934:9: error: passing 'const volatile void *' to parameter of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     934 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/hexagon/include/asm/io.h:40:40: note: expanded from macro 'readsl'
      40 | #define readsl(p, d, l)   __raw_readsl(p, d, l)
         |                                        ^
   arch/hexagon/include/asm/io.h:34:46: note: passing argument to parameter 'addr' here
      34 | extern void __raw_readsl(const void __iomem *addr, void *data, int wordlen);
         |                                              ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:951:20: error: static declaration of 'iowrite8_rep' follows non-static declaration
     951 | static inline void iowrite8_rep(volatile void __iomem *addr,
         |                    ^
   include/asm-generic/io.h:950:22: note: expanded from macro 'iowrite8_rep'
     950 | #define iowrite8_rep iowrite8_rep
         |                      ^
   include/asm-generic/iomap.h:86:13: note: previous declaration is here
      86 | extern void iowrite8_rep(void __iomem *port, const void *buf, unsigned long count);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:961:20: error: static declaration of 'iowrite16_rep' follows non-static declaration
     961 | static inline void iowrite16_rep(volatile void __iomem *addr,
         |                    ^
   include/asm-generic/io.h:960:23: note: expanded from macro 'iowrite16_rep'
     960 | #define iowrite16_rep iowrite16_rep
         |                       ^
   include/asm-generic/iomap.h:87:13: note: previous declaration is here
      87 | extern void iowrite16_rep(void __iomem *port, const void *buf, unsigned long count);
         |             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:965:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     965 |         writesw(addr, buffer, count);
         |                 ^~~~
   arch/hexagon/include/asm/io.h:38:40: note: expanded from macro 'writesw'
      38 | #define writesw(p, d, l) __raw_writesw(p, d, l)
         |                                        ^
   arch/hexagon/include/asm/io.h:32:41: note: passing argument to parameter 'addr' here
      32 | extern void __raw_writesw(void __iomem *addr, const void *data, int wordlen);
         |                                         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:971:20: error: static declaration of 'iowrite32_rep' follows non-static declaration
     971 | static inline void iowrite32_rep(volatile void __iomem *addr,
         |                    ^
   include/asm-generic/io.h:970:23: note: expanded from macro 'iowrite32_rep'
     970 | #define iowrite32_rep iowrite32_rep
         |                       ^
   include/asm-generic/iomap.h:88:13: note: previous declaration is here
      88 | extern void iowrite32_rep(void __iomem *port, const void *buf, unsigned long count);
         |             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/ioread8 +793 include/asm-generic/io.h

9ab3a7a0d2b417 Thierry Reding 2014-07-04  789  
9216efafc52ff9 Thierry Reding 2014-10-01  790  #ifndef CONFIG_GENERIC_IOMAP
9216efafc52ff9 Thierry Reding 2014-10-01  791  #ifndef ioread8
9216efafc52ff9 Thierry Reding 2014-10-01  792  #define ioread8 ioread8
9216efafc52ff9 Thierry Reding 2014-10-01 @793  static inline u8 ioread8(const volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  794  {
9216efafc52ff9 Thierry Reding 2014-10-01  795  	return readb(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  796  }
9216efafc52ff9 Thierry Reding 2014-10-01  797  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  798  
9216efafc52ff9 Thierry Reding 2014-10-01  799  #ifndef ioread16
9216efafc52ff9 Thierry Reding 2014-10-01  800  #define ioread16 ioread16
9216efafc52ff9 Thierry Reding 2014-10-01 @801  static inline u16 ioread16(const volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  802  {
9216efafc52ff9 Thierry Reding 2014-10-01  803  	return readw(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  804  }
9216efafc52ff9 Thierry Reding 2014-10-01  805  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  806  
9216efafc52ff9 Thierry Reding 2014-10-01  807  #ifndef ioread32
9216efafc52ff9 Thierry Reding 2014-10-01  808  #define ioread32 ioread32
9216efafc52ff9 Thierry Reding 2014-10-01 @809  static inline u32 ioread32(const volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  810  {
9216efafc52ff9 Thierry Reding 2014-10-01  811  	return readl(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  812  }
9216efafc52ff9 Thierry Reding 2014-10-01  813  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  814  
9e44fb1816dba8 Horia Geantă   2016-05-19  815  #ifdef CONFIG_64BIT
9e44fb1816dba8 Horia Geantă   2016-05-19  816  #ifndef ioread64
9e44fb1816dba8 Horia Geantă   2016-05-19  817  #define ioread64 ioread64
9e44fb1816dba8 Horia Geantă   2016-05-19  818  static inline u64 ioread64(const volatile void __iomem *addr)
9e44fb1816dba8 Horia Geantă   2016-05-19  819  {
9e44fb1816dba8 Horia Geantă   2016-05-19  820  	return readq(addr);
9e44fb1816dba8 Horia Geantă   2016-05-19  821  }
9e44fb1816dba8 Horia Geantă   2016-05-19  822  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  823  #endif /* CONFIG_64BIT */
9e44fb1816dba8 Horia Geantă   2016-05-19  824  
9216efafc52ff9 Thierry Reding 2014-10-01  825  #ifndef iowrite8
9216efafc52ff9 Thierry Reding 2014-10-01  826  #define iowrite8 iowrite8
9216efafc52ff9 Thierry Reding 2014-10-01 @827  static inline void iowrite8(u8 value, volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  828  {
9216efafc52ff9 Thierry Reding 2014-10-01  829  	writeb(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  830  }
9216efafc52ff9 Thierry Reding 2014-10-01  831  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  832  
9216efafc52ff9 Thierry Reding 2014-10-01  833  #ifndef iowrite16
9216efafc52ff9 Thierry Reding 2014-10-01  834  #define iowrite16 iowrite16
9216efafc52ff9 Thierry Reding 2014-10-01 @835  static inline void iowrite16(u16 value, volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  836  {
9216efafc52ff9 Thierry Reding 2014-10-01  837  	writew(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  838  }
9216efafc52ff9 Thierry Reding 2014-10-01  839  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  840  
9216efafc52ff9 Thierry Reding 2014-10-01  841  #ifndef iowrite32
9216efafc52ff9 Thierry Reding 2014-10-01  842  #define iowrite32 iowrite32
9216efafc52ff9 Thierry Reding 2014-10-01 @843  static inline void iowrite32(u32 value, volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  844  {
9216efafc52ff9 Thierry Reding 2014-10-01  845  	writel(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  846  }
9216efafc52ff9 Thierry Reding 2014-10-01  847  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  848  
9e44fb1816dba8 Horia Geantă   2016-05-19  849  #ifdef CONFIG_64BIT
9e44fb1816dba8 Horia Geantă   2016-05-19  850  #ifndef iowrite64
9e44fb1816dba8 Horia Geantă   2016-05-19  851  #define iowrite64 iowrite64
9e44fb1816dba8 Horia Geantă   2016-05-19  852  static inline void iowrite64(u64 value, volatile void __iomem *addr)
9e44fb1816dba8 Horia Geantă   2016-05-19  853  {
9e44fb1816dba8 Horia Geantă   2016-05-19  854  	writeq(value, addr);
9e44fb1816dba8 Horia Geantă   2016-05-19  855  }
9e44fb1816dba8 Horia Geantă   2016-05-19  856  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  857  #endif /* CONFIG_64BIT */
9e44fb1816dba8 Horia Geantă   2016-05-19  858  
9216efafc52ff9 Thierry Reding 2014-10-01  859  #ifndef ioread16be
9216efafc52ff9 Thierry Reding 2014-10-01  860  #define ioread16be ioread16be
9216efafc52ff9 Thierry Reding 2014-10-01 @861  static inline u16 ioread16be(const volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  862  {
7a1aedba706194 Horia Geantă   2016-05-19  863  	return swab16(readw(addr));
9216efafc52ff9 Thierry Reding 2014-10-01  864  }
9216efafc52ff9 Thierry Reding 2014-10-01  865  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  866  
9216efafc52ff9 Thierry Reding 2014-10-01  867  #ifndef ioread32be
9216efafc52ff9 Thierry Reding 2014-10-01  868  #define ioread32be ioread32be
9216efafc52ff9 Thierry Reding 2014-10-01 @869  static inline u32 ioread32be(const volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  870  {
7a1aedba706194 Horia Geantă   2016-05-19  871  	return swab32(readl(addr));
9216efafc52ff9 Thierry Reding 2014-10-01  872  }
9216efafc52ff9 Thierry Reding 2014-10-01  873  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  874  
9e44fb1816dba8 Horia Geantă   2016-05-19  875  #ifdef CONFIG_64BIT
9e44fb1816dba8 Horia Geantă   2016-05-19  876  #ifndef ioread64be
9e44fb1816dba8 Horia Geantă   2016-05-19  877  #define ioread64be ioread64be
9e44fb1816dba8 Horia Geantă   2016-05-19  878  static inline u64 ioread64be(const volatile void __iomem *addr)
9e44fb1816dba8 Horia Geantă   2016-05-19  879  {
9e44fb1816dba8 Horia Geantă   2016-05-19  880  	return swab64(readq(addr));
9e44fb1816dba8 Horia Geantă   2016-05-19  881  }
9e44fb1816dba8 Horia Geantă   2016-05-19  882  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  883  #endif /* CONFIG_64BIT */
9e44fb1816dba8 Horia Geantă   2016-05-19  884  
9216efafc52ff9 Thierry Reding 2014-10-01  885  #ifndef iowrite16be
9216efafc52ff9 Thierry Reding 2014-10-01  886  #define iowrite16be iowrite16be
9216efafc52ff9 Thierry Reding 2014-10-01 @887  static inline void iowrite16be(u16 value, void volatile __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  888  {
7a1aedba706194 Horia Geantă   2016-05-19  889  	writew(swab16(value), addr);
9216efafc52ff9 Thierry Reding 2014-10-01  890  }
9216efafc52ff9 Thierry Reding 2014-10-01  891  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  892  
9216efafc52ff9 Thierry Reding 2014-10-01  893  #ifndef iowrite32be
9216efafc52ff9 Thierry Reding 2014-10-01  894  #define iowrite32be iowrite32be
9216efafc52ff9 Thierry Reding 2014-10-01 @895  static inline void iowrite32be(u32 value, volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  896  {
7a1aedba706194 Horia Geantă   2016-05-19  897  	writel(swab32(value), addr);
9216efafc52ff9 Thierry Reding 2014-10-01  898  }
9216efafc52ff9 Thierry Reding 2014-10-01  899  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  900  
9e44fb1816dba8 Horia Geantă   2016-05-19  901  #ifdef CONFIG_64BIT
9e44fb1816dba8 Horia Geantă   2016-05-19  902  #ifndef iowrite64be
9e44fb1816dba8 Horia Geantă   2016-05-19  903  #define iowrite64be iowrite64be
9e44fb1816dba8 Horia Geantă   2016-05-19  904  static inline void iowrite64be(u64 value, volatile void __iomem *addr)
9e44fb1816dba8 Horia Geantă   2016-05-19  905  {
9e44fb1816dba8 Horia Geantă   2016-05-19  906  	writeq(swab64(value), addr);
9e44fb1816dba8 Horia Geantă   2016-05-19  907  }
9e44fb1816dba8 Horia Geantă   2016-05-19  908  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  909  #endif /* CONFIG_64BIT */
9e44fb1816dba8 Horia Geantă   2016-05-19  910  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  911  #ifndef ioread8_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  912  #define ioread8_rep ioread8_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @913  static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  914  			       unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  915  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  916  	readsb(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  917  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  918  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  919  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  920  #ifndef ioread16_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  921  #define ioread16_rep ioread16_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @922  static inline void ioread16_rep(const volatile void __iomem *addr,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  923  				void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  924  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @925  	readsw(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  926  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  927  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  928  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  929  #ifndef ioread32_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  930  #define ioread32_rep ioread32_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @931  static inline void ioread32_rep(const volatile void __iomem *addr,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  932  				void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  933  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  934  	readsl(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  935  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  936  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  937  
9e44fb1816dba8 Horia Geantă   2016-05-19  938  #ifdef CONFIG_64BIT
9e44fb1816dba8 Horia Geantă   2016-05-19  939  #ifndef ioread64_rep
9e44fb1816dba8 Horia Geantă   2016-05-19  940  #define ioread64_rep ioread64_rep
9e44fb1816dba8 Horia Geantă   2016-05-19  941  static inline void ioread64_rep(const volatile void __iomem *addr,
9e44fb1816dba8 Horia Geantă   2016-05-19  942  				void *buffer, unsigned int count)
9e44fb1816dba8 Horia Geantă   2016-05-19  943  {
9e44fb1816dba8 Horia Geantă   2016-05-19  944  	readsq(addr, buffer, count);
9e44fb1816dba8 Horia Geantă   2016-05-19  945  }
9e44fb1816dba8 Horia Geantă   2016-05-19  946  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  947  #endif /* CONFIG_64BIT */
9e44fb1816dba8 Horia Geantă   2016-05-19  948  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  949  #ifndef iowrite8_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  950  #define iowrite8_rep iowrite8_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @951  static inline void iowrite8_rep(volatile void __iomem *addr,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  952  				const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  953  				unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  954  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  955  	writesb(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  956  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  957  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  958  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  959  #ifndef iowrite16_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  960  #define iowrite16_rep iowrite16_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @961  static inline void iowrite16_rep(volatile void __iomem *addr,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  962  				 const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  963  				 unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  964  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @965  	writesw(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  966  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  967  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  968  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  969  #ifndef iowrite32_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04  970  #define iowrite32_rep iowrite32_rep
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @971  static inline void iowrite32_rep(volatile void __iomem *addr,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  972  				 const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  973  				 unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  974  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  975  	writesl(addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  976  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  977  #endif
9e44fb1816dba8 Horia Geantă   2016-05-19  978  

:::::: The code at line 793 was first introduced by commit
:::::: 9216efafc52ff99e9351ef60de5fcafc2bc8adb6 asm-generic/io.h: Reconcile I/O accessor overrides

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
