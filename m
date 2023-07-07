Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6267F;
	Fri,  7 Jul 2023 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688690750; x=1720226750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1e3KkHI23fkd3j5pPgK0IycWh6t/OsbKe13wRbARDQ=;
  b=aIYkdui0a/5N2A5osk+98XP9omoTgXX6REb5twtWoGMiL0TbulBCgRT1
   Z0wFUrsfGlzFqGu/aSbp5it4IXOwO4eojQAmf3OV14CDk777bBKXZRxge
   lAhkR5HPZHa3Irwkv4Qx/tUvyJZHrpcHckrcpK/79qBkwVZ+I6ny+n40X
   PUq1TjCfCxIS87Ta8Z5bjUt7pGQ4ZTNtQTPgrrRwCQ6/62B6Aqbu+AGJc
   rEnUTaaPVvuhiZrszoEQ+ghgLiabupz0l9TNnCeRqXRxdzRWkl3i3cCNJ
   uJkotoXFWfrR54wXqiHBVyqhAr/3wYodd7i2GkPC4aTye1xXr8nIEacoO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427444955"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427444955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 17:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="843909867"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="843909867"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Jul 2023 17:45:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHZbV-0001dv-1c;
	Fri, 07 Jul 2023 00:45:45 +0000
Date: Fri, 7 Jul 2023 08:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 105/116] drivers/pcmcia/cistpl.c:72:3: error:
 call to undeclared function 'iounmap'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307070824.xaZvuODM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   347e208de0e407689f4e4c596e9e38deafebe4f2
commit: c594d5c4b6305a57e15aace4baae6bc88277bf01 [105/116] s390: mm: convert to GENERIC_IOREMAP
config: s390-randconfig-r013-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070824.xaZvuODM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070824.xaZvuODM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070824.xaZvuODM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pcmcia/cistpl.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pcmcia/cistpl.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pcmcia/cistpl.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/pcmcia/cistpl.c:72:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |                 iounmap(s->cis_virt);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/pcmcia/cistpl.c:72:3: note: did you mean 'vunmap'?
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
     167 | extern void vunmap(const void *addr);
         |             ^
>> drivers/pcmcia/cistpl.c:103:17: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |                 s->cis_virt = ioremap(mem->res->start, s->map_size);
         |                               ^
>> drivers/pcmcia/cistpl.c:103:15: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     103 |                 s->cis_virt = ioremap(mem->res->start, s->map_size);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pcmcia/cistpl.c:110:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |                 iounmap(s->cis_virt);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/pcmcia/cistpl.c:117:4: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |                         iounmap(s->cis_virt);
         |                         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/pcmcia/cistpl.c:118:15: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     118 |                 s->cis_virt = ioremap(mem->static_start, s->map_size);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 6 errors generated.
--
   In file included from drivers/net/arcnet/arc-rimi.c:35:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/arcnet/arc-rimi.c:35:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/arcnet/arc-rimi.c:35:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/arcnet/arc-rimi.c:107:6: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     107 |         p = ioremap(addr, size);
         |             ^
>> drivers/net/arcnet/arc-rimi.c:107:4: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     107 |         p = ioremap(addr, size);
         |           ^ ~~~~~~~~~~~~~~~~~~~
>> drivers/net/arcnet/arc-rimi.c:113:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |                 iounmap(p);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/net/arcnet/arc-rimi.c:131:6: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |         p = ioremap(dev->mem_start, MIRROR_SIZE);
         |             ^
   drivers/net/arcnet/arc-rimi.c:131:4: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     131 |         p = ioremap(dev->mem_start, MIRROR_SIZE);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arc-rimi.c:140:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                 iounmap(p);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/net/arcnet/arc-rimi.c:193:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     193 |         iounmap(p);
         |         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/net/arcnet/arc-rimi.c:202:16: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     202 |         lp->mem_start = ioremap(dev->mem_start,
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~
     203 |                                 dev->mem_end - dev->mem_start + 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arc-rimi.c:350:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     350 |         iounmap(lp->mem_start);
         |         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   12 warnings and 9 errors generated.
--
   In file included from drivers/tty/ipwireless/main.c:26:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/tty/ipwireless/main.c:26:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/tty/ipwireless/main.c:26:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/tty/ipwireless/main.c:115:23: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
         |                              ^
>> drivers/tty/ipwireless/main.c:115:21: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                                 resource_size(p_dev->resource[2]));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/ipwireless/main.c:139:19: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     139 |         ipw->attr_memory = ioremap(p_dev->resource[3]->start,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                                 resource_size(p_dev->resource[3]));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/ipwireless/main.c:155:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         iounmap(ipw->attr_memory);
         |         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/tty/ipwireless/main.c:228:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |                 iounmap(ipw->common_memory);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/tty/ipwireless/main.c:233:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     233 |                 iounmap(ipw->attr_memory);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/tty/ipwireless/main.c:246:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |                 iounmap(ipw->common_memory);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/tty/ipwireless/main.c:251:3: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |                 iounmap(ipw->attr_memory);
         |                 ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   12 warnings and 8 errors generated.


vim +/iounmap +72 drivers/pcmcia/cistpl.c

^1da177e4c3f41 Linus Torvalds    2005-04-16   60  
^1da177e4c3f41 Linus Torvalds    2005-04-16   61  void release_cis_mem(struct pcmcia_socket *s)
^1da177e4c3f41 Linus Torvalds    2005-04-16   62  {
6b8e087b86c59c Dominik Brodowski 2010-01-12   63  	mutex_lock(&s->ops_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16   64  	if (s->cis_mem.flags & MAP_ACTIVE) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   65  		s->cis_mem.flags &= ~MAP_ACTIVE;
^1da177e4c3f41 Linus Torvalds    2005-04-16   66  		s->ops->set_mem_map(s, &s->cis_mem);
^1da177e4c3f41 Linus Torvalds    2005-04-16   67  		if (s->cis_mem.res) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   68  			release_resource(s->cis_mem.res);
^1da177e4c3f41 Linus Torvalds    2005-04-16   69  			kfree(s->cis_mem.res);
^1da177e4c3f41 Linus Torvalds    2005-04-16   70  			s->cis_mem.res = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16   71  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  @72  		iounmap(s->cis_virt);
^1da177e4c3f41 Linus Torvalds    2005-04-16   73  		s->cis_virt = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16   74  	}
6b8e087b86c59c Dominik Brodowski 2010-01-12   75  	mutex_unlock(&s->ops_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16   76  }
^1da177e4c3f41 Linus Torvalds    2005-04-16   77  
cc448baf85c8f2 Lee Jones         2021-03-12   78  /*
6e83ee075ed749 Dominik Brodowski 2010-03-02   79   * set_cis_map() - map the card memory at "card_offset" into virtual space.
6e83ee075ed749 Dominik Brodowski 2010-03-02   80   *
^1da177e4c3f41 Linus Torvalds    2005-04-16   81   * If flags & MAP_ATTRIB, map the attribute space, otherwise
^1da177e4c3f41 Linus Torvalds    2005-04-16   82   * map the memory space.
7ab24855482fbc Dominik Brodowski 2010-02-17   83   *
7ab24855482fbc Dominik Brodowski 2010-02-17   84   * Must be called with ops_mutex held.
^1da177e4c3f41 Linus Torvalds    2005-04-16   85   */
6e83ee075ed749 Dominik Brodowski 2010-03-02   86  static void __iomem *set_cis_map(struct pcmcia_socket *s,
6e83ee075ed749 Dominik Brodowski 2010-03-02   87  				unsigned int card_offset, unsigned int flags)
^1da177e4c3f41 Linus Torvalds    2005-04-16   88  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   89  	pccard_mem_map *mem = &s->cis_mem;
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27   90  	int ret;
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27   91  
2e5a3e79091615 Dominik Brodowski 2005-07-28   92  	if (!(s->features & SS_CAP_STATIC_MAP) && (mem->res == NULL)) {
6e83ee075ed749 Dominik Brodowski 2010-03-02   93  		mem->res = pcmcia_find_mem_region(0, s->map_size,
6e83ee075ed749 Dominik Brodowski 2010-03-02   94  						s->map_size, 0, s);
^1da177e4c3f41 Linus Torvalds    2005-04-16   95  		if (mem->res == NULL) {
f2e6cf76751d47 Joe Perches       2014-10-10   96  			dev_notice(&s->dev, "cs: unable to map card memory!\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16   97  			return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16   98  		}
2e5a3e79091615 Dominik Brodowski 2005-07-28   99  		s->cis_virt = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  100  	}
2e5a3e79091615 Dominik Brodowski 2005-07-28  101  
2e5a3e79091615 Dominik Brodowski 2005-07-28  102  	if (!(s->features & SS_CAP_STATIC_MAP) && (!s->cis_virt))
2e5a3e79091615 Dominik Brodowski 2005-07-28 @103  		s->cis_virt = ioremap(mem->res->start, s->map_size);
2e5a3e79091615 Dominik Brodowski 2005-07-28  104  
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  	mem->card_start = card_offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  106  	mem->flags = flags;
2e5a3e79091615 Dominik Brodowski 2005-07-28  107  
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  108  	ret = s->ops->set_mem_map(s, mem);
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  109  	if (ret) {
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  110  		iounmap(s->cis_virt);
2e5a3e79091615 Dominik Brodowski 2005-07-28  111  		s->cis_virt = NULL;
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  112  		return NULL;
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  113  	}
2ad0a0a793cbd8 Dominik Brodowski 2005-06-27  114  
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  	if (s->features & SS_CAP_STATIC_MAP) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  		if (s->cis_virt)
^1da177e4c3f41 Linus Torvalds    2005-04-16  117  			iounmap(s->cis_virt);
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  		s->cis_virt = ioremap(mem->static_start, s->map_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  	}
2e5a3e79091615 Dominik Brodowski 2005-07-28  120  
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  	return s->cis_virt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  

:::::: The code at line 72 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
