Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D887BB1B;
	Wed, 21 Feb 2024 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521923; cv=none; b=cHkImwahTOCHoRhAK6BtbDvxHADAiBu+dXEkBfOzbdP2ngdBLBLDfjM0iQUilp850L/2Neg7jSJg9JQXNASrUJYjADCY9FjcuuZxyrd+eP+K+4eMbnP2vDGZybrr72slwaLiMdY1KTNrJm8RabvqnyGqYlU29dMRLCf34VR1bc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521923; c=relaxed/simple;
	bh=Dntzg+l/t8glJYXYo4ElyIah3hisxsF8qKIBhv1bpZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/sJwQeXBOrPQtAS4ktfIWwflbZJGW2Wa4cNBhQP35IMbMZkNuhTS7fiJAtYenZBBEB1tFN6Wi9I08ftVLyIgOSnxaD2O6hZb/quM5rfPqXnalUXOLaIglzwxHsgVU1w32+QFrGG/Zprp+MjY5YcNbHXCI2pXXBqp4ky48ADB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N33FeIW4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N33FeIW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708521920; x=1740057920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dntzg+l/t8glJYXYo4ElyIah3hisxsF8qKIBhv1bpZY=;
  b=N33FeIW4YM55ijBCltlSpNGIYISqafqP8t+8Gcv8aovjKVzyROEVL+ub
   UGbnYkLCIQsvXyec6iTlk+I/FQEwcEx2jwwSuspX7LV53CwEe2XAWe8zp
   yrimEYm4G5dSiqPBmu8bLNwj3fdu9KiRfJdt3phzlJzSDzRWcGJXYJslP
   fT+R1944ch3oIGJtoi7RWsUmTX/9de+frIeAdg/OjRwTnHjCtqzqYrq2A
   JCqgUDzMI2QXbjgePdFRuiaLR59YBCDLDDDC2R2wwcjvSTiKbDJOSR8W6
   Jt7y6SLzyqexFGpFJXwwa70aVa/YZSDmxav423xL2bGz9YLUQfxlxXv+s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2803996"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2803996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5511402"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Feb 2024 05:25:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcmb5-0005MO-1I;
	Wed, 21 Feb 2024 13:25:15 +0000
Date: Wed, 21 Feb 2024 21:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 2/51] include/linux/dma-mapping.h:381:2: error:
 call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202402212143.NUaaEBoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: 9a3aa944b33041331d3bf1c1ad194ecffee0cbf0 [2/51] dma: compile-out DMA sync operations when not used
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240221/202402212143.NUaaEBoi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212143.NUaaEBoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212143.NUaaEBoi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from init/main.c:102:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:381:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:381:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:227:20: note: 'dma_sync_single_for_cpu' declared here
   static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
                      ^
>> include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_device(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:231:20: note: 'dma_sync_single_for_device' declared here
   static inline void dma_sync_single_for_device(struct device *dev,
                      ^
   12 warnings and 2 errors generated.
--
   In file included from arch/um/os-Linux/drivers/ethertap_kern.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/um/os-Linux/drivers/ethertap_kern.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/um/os-Linux/drivers/ethertap_kern.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from arch/um/os-Linux/drivers/ethertap_kern.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:381:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:381:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:227:20: note: 'dma_sync_single_for_cpu' declared here
   static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
                      ^
>> include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_device(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:231:20: note: 'dma_sync_single_for_device' declared here
   static inline void dma_sync_single_for_device(struct device *dev,
                      ^
   arch/um/os-Linux/drivers/ethertap_kern.c:66:5: warning: no previous prototype for function 'ethertap_setup' [-Wmissing-prototypes]
   int ethertap_setup(char *str, char **mac_out, void *data)
       ^
   arch/um/os-Linux/drivers/ethertap_kern.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ethertap_setup(char *str, char **mac_out, void *data)
   ^
   static 
   13 warnings and 2 errors generated.
--
   In file included from arch/um/os-Linux/drivers/tuntap_kern.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/um/os-Linux/drivers/tuntap_kern.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/um/os-Linux/drivers/tuntap_kern.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from arch/um/os-Linux/drivers/tuntap_kern.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:381:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:381:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:227:20: note: 'dma_sync_single_for_cpu' declared here
   static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
                      ^
>> include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_device(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:231:20: note: 'dma_sync_single_for_device' declared here
   static inline void dma_sync_single_for_device(struct device *dev,
                      ^
   arch/um/os-Linux/drivers/tuntap_kern.c:56:5: warning: no previous prototype for function 'tuntap_setup' [-Wmissing-prototypes]
   int tuntap_setup(char *str, char **mac_out, void *data)
       ^
   arch/um/os-Linux/drivers/tuntap_kern.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tuntap_setup(char *str, char **mac_out, void *data)
   ^
   static 
   13 warnings and 2 errors generated.
..


vim +/__dma_sync_single_for_cpu +381 include/linux/dma-mapping.h

   375	
   376	static inline void
   377	__dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t addr,
   378					unsigned long offset, size_t size,
   379					enum dma_data_direction dir)
   380	{
 > 381		__dma_sync_single_for_cpu(dev, addr + offset, size, dir);
   382	}
   383	
   384	static inline void
   385	__dma_sync_single_range_for_device(struct device *dev, dma_addr_t addr,
   386					   unsigned long offset, size_t size,
   387					   enum dma_data_direction dir)
   388	{
 > 389		__dma_sync_single_for_device(dev, addr + offset, size, dir);
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
