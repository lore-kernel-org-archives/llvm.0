Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEC1391;
	Mon, 23 Jan 2023 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674477130; x=1706013130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LdF/LrO9o7dKzP+t+DD21BJ8xMQE1m43Fiad1UUWHmk=;
  b=b2RsdPeipewolmdlb4vT4wLPPEW8EfChHMXE8DOwhJybFsUFzaVHu1Sf
   kz1+LFRdp5/q/0JlecL+txkKZVYeGdoVjUk0XwyWzRLAZyGC3nbWQfNO6
   TkFifg+C0ygD9XSU6gtmsE5SWbV/0IR+RxlvfwCkQk4YyyN5OCtC5keZL
   zCK1maZa7fb3B7cA2Ot2wwS3oE8KsJ8rPbCPWDqFpKeTUvOigp+I0T/xF
   F5r+FTN/UcQlPh82YpiaYXHLtGCNy0HZx1t73nv7de900u3hG18kr4ZVn
   A1sXpHuhVC/GptKUnF8d8tIKPxkRvnobjnsCXQX7chBU17pMpCJrqTbnT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353290592"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="353290592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 04:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="693833363"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="693833363"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 04:32:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJvza-0005dY-0f;
	Mon, 23 Jan 2023 12:32:06 +0000
Date: Mon, 23 Jan 2023 20:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] drivers/mmc/core/mmc.c:115:22: warning:
 shift count >= width of type
Message-ID: <202301232003.VhrDpnUt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   2cb3404accfc161b66866cd03c42953f57700677
commit: 2cb3404accfc161b66866cd03c42953f57700677 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: hexagon-randconfig-r041-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232003.VhrDpnUt-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2cb3404accfc161b66866cd03c42953f57700677
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 2cb3404accfc161b66866cd03c42953f57700677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/comedi/ drivers/mmc/core/ drivers/mmc/host/ drivers/net/wireless/broadcom/b43/ drivers/platform/goldfish/ drivers/vdpa/vdpa_user/ drivers/vhost/ fs/ kernel/dma/ kernel/events/ lib/ mm/ net/bpf/ net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/core/mmc.c:18:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   include/linux/mm.h:1632:34: error: expected expression
           return page_to_pfn(&folio->page);
                                           ^
   include/linux/mm.h:1720:35: error: expected expression
           if (is_zero_pfn(page_to_pfn(page)))
                                            ^
   include/linux/mm.h:1860:9: error: expected expression
           return page_to_virt(page);
                  ^
   arch/hexagon/include/asm/page.h:131:33: note: expanded from macro 'page_to_virt'
   #define page_to_virt(page)      __va(page_to_phys(page))
                                        ^
   arch/hexagon/include/asm/page.h:126:52: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
                                                      ^
   In file included from drivers/mmc/core/mmc.c:18:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mmc/core/mmc.c:18:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mmc/core/mmc.c:18:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mmc/core/mmc.c:115:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   card->cid.serial        = UNSTUFF_BITS(resp, 16, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:57:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   7 warnings and 3 errors generated.
--
   In file included from drivers/mmc/core/sd.c:16:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:1632:34: error: expected expression
           return page_to_pfn(&folio->page);
                                           ^
   include/linux/mm.h:1720:35: error: expected expression
           if (is_zero_pfn(page_to_pfn(page)))
                                            ^
   include/linux/mm.h:1860:9: error: expected expression
           return page_to_virt(page);
                  ^
   arch/hexagon/include/asm/page.h:131:33: note: expanded from macro 'page_to_virt'
   #define page_to_virt(page)      __va(page_to_phys(page))
                                        ^
   arch/hexagon/include/asm/page.h:126:52: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
                                                      ^
   In file included from drivers/mmc/core/sd.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mmc/core/sd.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mmc/core/sd.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from drivers/mmc/core/sd.c:16:
   include/linux/scatterlist.h:329:9: error: expected expression
           return page_to_phys(sg_page(sg)) + sg->offset;
                  ^
   arch/hexagon/include/asm/page.h:126:52: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
                                                      ^
>> drivers/mmc/core/sd.c:106:22: warning: shift count >= width of type [-Wshift-count-overflow]
           card->cid.serial                = UNSTUFF_BITS(resp, 24, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd.c:61:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   7 warnings and 4 errors generated.
--
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   include/linux/mm.h:1632:34: error: expected expression
           return page_to_pfn(&folio->page);
                                           ^
   include/linux/mm.h:1720:35: error: expected expression
           if (is_zero_pfn(page_to_pfn(page)))
                                            ^
   include/linux/mm.h:1860:9: error: expected expression
           return page_to_virt(page);
                  ^
   arch/hexagon/include/asm/page.h:131:33: note: expanded from macro 'page_to_virt'
   #define page_to_virt(page)      __va(page_to_phys(page))
                                        ^
   arch/hexagon/include/asm/page.h:126:52: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
                                                      ^
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/statfs.c:131:3: warning: 'memcpy' will always overflow; destination buffer has size 64, but size argument is 88 [-Wfortify-source]
                   memcpy(&buf, st, sizeof(*st));
                   ^
   7 warnings and 3 errors generated.
--
   In file included from fs/exec.c:30:
   include/linux/mm.h:1632:34: error: expected expression
           return page_to_pfn(&folio->page);
                                           ^
   include/linux/mm.h:1720:35: error: expected expression
           if (is_zero_pfn(page_to_pfn(page)))
                                            ^
   include/linux/mm.h:1860:9: error: expected expression
           return page_to_virt(page);
                  ^
   arch/hexagon/include/asm/page.h:131:33: note: expanded from macro 'page_to_virt'
   #define page_to_virt(page)      __va(page_to_phys(page))
                                        ^
   arch/hexagon/include/asm/page.h:126:52: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
                                                      ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from fs/exec.c:70:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   arch/hexagon/include/asm/pgalloc.h:51:54: error: expected expression
           set_pmd(pmd, __pmd(((unsigned long)page_to_pfn(pte) << PAGE_SHIFT) |
                                                               ^
   arch/hexagon/include/asm/pgalloc.h:51:2: error: expected '}'
           set_pmd(pmd, __pmd(((unsigned long)page_to_pfn(pte) << PAGE_SHIFT) |
           ^
   arch/hexagon/include/asm/pgtable.h:343:54: note: expanded from macro 'set_pmd'
   #define set_pmd(pmdptr, pmdval) (*(pmdptr) = (pmdval))
                                                        ^
   arch/hexagon/include/asm/pgalloc.h:51:15: note: to match this '{'
           set_pmd(pmd, __pmd(((unsigned long)page_to_pfn(pte) << PAGE_SHIFT) |
                        ^
   include/asm-generic/pgtable-nopmd.h:53:30: note: expanded from macro '__pmd'
   #define __pmd(x)                                ((pmd_t) { __pud(x) } )
                                                            ^
   fs/exec.c:245:52: error: expected expression
           flush_cache_page(bprm->vma, pos, page_to_pfn(page));
                                                             ^
>> fs/exec.c:405:51: warning: declaration of 'struct user_arg_ptr' will not be visible outside of this function [-Wvisibility]
   static const char __user *get_user_arg_ptr(struct user_arg_ptr argv, int nr)
                                                     ^
   fs/exec.c:406:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:429:25: warning: declaration of 'struct user_arg_ptr' will not be visible outside of this function [-Wvisibility]
   static int count(struct user_arg_ptr argv, int max)
                           ^
   fs/exec.c:430:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:456:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:473:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:518:42: warning: declaration of 'struct user_arg_ptr' will not be visible outside of this function [-Wvisibility]
   static int copy_strings(int argc, struct user_arg_ptr argv,
                                            ^
   fs/exec.c:520:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:614:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:652:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:679:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:749:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:901:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:948:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:977:1: error: function definition is not allowed here
   {
   ^
   fs/exec.c:1041:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   9 warnings and 20 errors generated.
..


vim +115 drivers/mmc/core/mmc.c

7ea239d9e6d699 Pierre Ossman   2006-12-31   53  
7ea239d9e6d699 Pierre Ossman   2006-12-31   54  #define UNSTUFF_BITS(resp,start,size)					\
7ea239d9e6d699 Pierre Ossman   2006-12-31   55  	({								\
7ea239d9e6d699 Pierre Ossman   2006-12-31   56  		const int __size = size;				\
7ea239d9e6d699 Pierre Ossman   2006-12-31   57  		const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1;	\
7ea239d9e6d699 Pierre Ossman   2006-12-31   58  		const int __off = 3 - ((start) / 32);			\
7ea239d9e6d699 Pierre Ossman   2006-12-31   59  		const int __shft = (start) & 31;			\
7ea239d9e6d699 Pierre Ossman   2006-12-31   60  		u32 __res;						\
7ea239d9e6d699 Pierre Ossman   2006-12-31   61  									\
7ea239d9e6d699 Pierre Ossman   2006-12-31   62  		__res = resp[__off] >> __shft;				\
7ea239d9e6d699 Pierre Ossman   2006-12-31   63  		if (__size + __shft > 32)				\
7ea239d9e6d699 Pierre Ossman   2006-12-31   64  			__res |= resp[__off-1] << ((32 - __shft) % 32);	\
7ea239d9e6d699 Pierre Ossman   2006-12-31   65  		__res & __mask;						\
7ea239d9e6d699 Pierre Ossman   2006-12-31   66  	})
7ea239d9e6d699 Pierre Ossman   2006-12-31   67  
7ea239d9e6d699 Pierre Ossman   2006-12-31   68  /*
7ea239d9e6d699 Pierre Ossman   2006-12-31   69   * Given the decoded CSD structure, decode the raw CID to our CID structure.
7ea239d9e6d699 Pierre Ossman   2006-12-31   70   */
bd766312618d2e Pierre Ossman   2007-05-01   71  static int mmc_decode_cid(struct mmc_card *card)
7ea239d9e6d699 Pierre Ossman   2006-12-31   72  {
7ea239d9e6d699 Pierre Ossman   2006-12-31   73  	u32 *resp = card->raw_cid;
7ea239d9e6d699 Pierre Ossman   2006-12-31   74  
ac9d25557dcc9f Linus Walleij   2022-04-25   75  	/*
ac9d25557dcc9f Linus Walleij   2022-04-25   76  	 * Add the raw card ID (cid) data to the entropy pool. It doesn't
ac9d25557dcc9f Linus Walleij   2022-04-25   77  	 * matter that not all of it is unique, it's just bonus entropy.
ac9d25557dcc9f Linus Walleij   2022-04-25   78  	 */
ac9d25557dcc9f Linus Walleij   2022-04-25   79  	add_device_randomness(&card->raw_cid, sizeof(card->raw_cid));
ac9d25557dcc9f Linus Walleij   2022-04-25   80  
7ea239d9e6d699 Pierre Ossman   2006-12-31   81  	/*
7ea239d9e6d699 Pierre Ossman   2006-12-31   82  	 * The selection of the format here is based upon published
7ea239d9e6d699 Pierre Ossman   2006-12-31   83  	 * specs from sandisk and from what people have reported.
7ea239d9e6d699 Pierre Ossman   2006-12-31   84  	 */
7ea239d9e6d699 Pierre Ossman   2006-12-31   85  	switch (card->csd.mmca_vsn) {
7ea239d9e6d699 Pierre Ossman   2006-12-31   86  	case 0: /* MMC v1.0 - v1.2 */
7ea239d9e6d699 Pierre Ossman   2006-12-31   87  	case 1: /* MMC v1.4 */
7ea239d9e6d699 Pierre Ossman   2006-12-31   88  		card->cid.manfid	= UNSTUFF_BITS(resp, 104, 24);
7ea239d9e6d699 Pierre Ossman   2006-12-31   89  		card->cid.prod_name[0]	= UNSTUFF_BITS(resp, 96, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   90  		card->cid.prod_name[1]	= UNSTUFF_BITS(resp, 88, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   91  		card->cid.prod_name[2]	= UNSTUFF_BITS(resp, 80, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   92  		card->cid.prod_name[3]	= UNSTUFF_BITS(resp, 72, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   93  		card->cid.prod_name[4]	= UNSTUFF_BITS(resp, 64, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   94  		card->cid.prod_name[5]	= UNSTUFF_BITS(resp, 56, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   95  		card->cid.prod_name[6]	= UNSTUFF_BITS(resp, 48, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31   96  		card->cid.hwrev		= UNSTUFF_BITS(resp, 44, 4);
7ea239d9e6d699 Pierre Ossman   2006-12-31   97  		card->cid.fwrev		= UNSTUFF_BITS(resp, 40, 4);
7ea239d9e6d699 Pierre Ossman   2006-12-31   98  		card->cid.serial	= UNSTUFF_BITS(resp, 16, 24);
7ea239d9e6d699 Pierre Ossman   2006-12-31   99  		card->cid.month		= UNSTUFF_BITS(resp, 12, 4);
7ea239d9e6d699 Pierre Ossman   2006-12-31  100  		card->cid.year		= UNSTUFF_BITS(resp, 8, 4) + 1997;
7ea239d9e6d699 Pierre Ossman   2006-12-31  101  		break;
7ea239d9e6d699 Pierre Ossman   2006-12-31  102  
7ea239d9e6d699 Pierre Ossman   2006-12-31  103  	case 2: /* MMC v2.0 - v2.2 */
7ea239d9e6d699 Pierre Ossman   2006-12-31  104  	case 3: /* MMC v3.1 - v3.3 */
7ea239d9e6d699 Pierre Ossman   2006-12-31  105  	case 4: /* MMC v4 */
7ea239d9e6d699 Pierre Ossman   2006-12-31  106  		card->cid.manfid	= UNSTUFF_BITS(resp, 120, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  107  		card->cid.oemid		= UNSTUFF_BITS(resp, 104, 16);
7ea239d9e6d699 Pierre Ossman   2006-12-31  108  		card->cid.prod_name[0]	= UNSTUFF_BITS(resp, 96, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  109  		card->cid.prod_name[1]	= UNSTUFF_BITS(resp, 88, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  110  		card->cid.prod_name[2]	= UNSTUFF_BITS(resp, 80, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  111  		card->cid.prod_name[3]	= UNSTUFF_BITS(resp, 72, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  112  		card->cid.prod_name[4]	= UNSTUFF_BITS(resp, 64, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31  113  		card->cid.prod_name[5]	= UNSTUFF_BITS(resp, 56, 8);
51e7e8b632d8e5 Bernie Thompson 2013-02-27  114  		card->cid.prv		= UNSTUFF_BITS(resp, 48, 8);
7ea239d9e6d699 Pierre Ossman   2006-12-31 @115  		card->cid.serial	= UNSTUFF_BITS(resp, 16, 32);
7ea239d9e6d699 Pierre Ossman   2006-12-31  116  		card->cid.month		= UNSTUFF_BITS(resp, 12, 4);
7ea239d9e6d699 Pierre Ossman   2006-12-31  117  		card->cid.year		= UNSTUFF_BITS(resp, 8, 4) + 1997;
7ea239d9e6d699 Pierre Ossman   2006-12-31  118  		break;
7ea239d9e6d699 Pierre Ossman   2006-12-31  119  
7ea239d9e6d699 Pierre Ossman   2006-12-31  120  	default:
a3c76eb9d4a1e6 Girish K S      2011-10-11  121  		pr_err("%s: card has unknown MMCA version %d\n",
7ea239d9e6d699 Pierre Ossman   2006-12-31  122  			mmc_hostname(card->host), card->csd.mmca_vsn);
bd766312618d2e Pierre Ossman   2007-05-01  123  		return -EINVAL;
7ea239d9e6d699 Pierre Ossman   2006-12-31  124  	}
bd766312618d2e Pierre Ossman   2007-05-01  125  
bd766312618d2e Pierre Ossman   2007-05-01  126  	return 0;
7ea239d9e6d699 Pierre Ossman   2006-12-31  127  }
7ea239d9e6d699 Pierre Ossman   2006-12-31  128  

:::::: The code at line 115 was first introduced by commit
:::::: 7ea239d9e6d6993469a6a8ca83ff23834dfc3fce mmc: add bus handler

:::::: TO: Pierre Ossman <drzeus@drzeus.cx>
:::::: CC: Pierre Ossman <drzeus@drzeus.cx>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
