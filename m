Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE495336A;
	Fri,  5 Jul 2024 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720156444; cv=none; b=PGikqDO1QmJUgeJLUm5rp0L54a8vQqpkS8avRI+FZxgBR3BcHp1CkatWKaxb00l8N//N7xJXC4a4FnfQhvwSaiiiPFOOnt1nLhf0sPYQ/n+VvuAhTNJuWeGUS5cqK0/s/7YQ6x2BkeVf1ryh00u5/q8+4l78Igimo+Ide/4Ph1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720156444; c=relaxed/simple;
	bh=0QiehtPQWVwVVbvSJaYwZEESd7T6YpVbOToGzvzWNJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2/DQfN31tvWEWDXa4cbqAPrLHF6K5o7aNIl+C8GB46uXVNr6ADLqUBnAmRTbZ2V6Fo0YkbaALYnRCrN8e2lyFBFDVf6S45GBK1n+geaGWrRa+yIAeFI9QQNnfUOC39/oBpYdrP3t4UsJxK6Go6i29WRdHvjFTiKPjJrmIcRfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz8UpOrF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz8UpOrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720156442; x=1751692442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QiehtPQWVwVVbvSJaYwZEESd7T6YpVbOToGzvzWNJU=;
  b=Kz8UpOrFICspAWTVs0l3oGJbAL65l5SW9mKshIi8YcV/pWii/+h4BPOO
   LwL+yT3ENKq9vjaTmZkjjFWNe4PW9pBaWGGFFLc3gt/xpRP9nxteM3pbw
   l+UbcuMdYQWEBIz6085+Kj+abIgkvOSoJodauFPI4WgrIDBA/GlHA0fkt
   W8y4jfnDVdv9SPaQSUE0vaBxCsblK9ka2YNm8JzPmas8VG5VM3dB146gj
   jkL3FrpVb+t6WwyUwmMVnCE+uP9aX8ZCnft2d1fNlXau0Ctf116+qEVQO
   BpMsbtRu1kwjp6aOWiDcEai6suR1MA+8UOpIABtBN9sED4lwRshH8O1HK
   Q==;
X-CSE-ConnectionGUID: ngZJcTHMQticRR0ID+d7Cw==
X-CSE-MsgGUID: CMzt2ALAR629JN5jct1gIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42861789"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="42861789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 22:13:59 -0700
X-CSE-ConnectionGUID: CFRtXw1+TLyHS2JwuXVIIA==
X-CSE-MsgGUID: OTqRayQrSSywb9/+FHcQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="69976611"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 22:13:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPbGe-000RxE-0a;
	Fri, 05 Jul 2024 05:13:56 +0000
Date: Fri, 5 Jul 2024 13:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pza:sl-dma-demo 1/3] drivers/dma/sl-dma.c:176:2: error: call to
 undeclared function 'writeq'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202407051257.TRpgbYnD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/pza/linux sl-dma-demo
head:   378de31c99885b2a8fbe24ebaead11139d892f28
commit: 3b9d53b21baa3734a355a4466f9e741161df4dc8 [1/3] dmaengine: sl-dma: Add Smartlogic HCC DMA IP Core driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240705/202407051257.TRpgbYnD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051257.TRpgbYnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051257.TRpgbYnD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma/sl-dma.c:23:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/dma/sl-dma.c:23:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/dma/sl-dma.c:23:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/dma/sl-dma.c:23:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/dma/sl-dma.c:176:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         writeq(value, sl_dma->bar + offset);
         |         ^
   drivers/dma/sl-dma.c:956:39: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     955 |                 "Preparing transfer for %s channel %u, address = 0x%llx, len = %u\n",
         |                                                                    ~~~~
         |                                                                    %x
     956 |                 sl_dma_direction_name(ch), ch->num, sg_dma_address(sgl),
         |                                                     ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/scatterlist.h:31:28: note: expanded from macro 'sg_dma_address'
      31 | #define sg_dma_address(sg)      ((sg)->dma_address)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/dma/sl-dma.c:1002:3: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                                                               ~~~~
         |                                                               %x
    1000 |                 sl_dma_direction_name(ch), ch->num,
    1001 |                 ch->direction == DMA_DEV_TO_MEM ? "dst_start" : "src_start",
    1002 |                 ch->direction == DMA_DEV_TO_MEM ? xt->dst_start : xt->src_start,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/dma/sl-dma.c:1003:3: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                                                                            ~~~
         |                                                                            %zu
    1000 |                 sl_dma_direction_name(ch), ch->num,
    1001 |                 ch->direction == DMA_DEV_TO_MEM ? "dst_start" : "src_start",
    1002 |                 ch->direction == DMA_DEV_TO_MEM ? xt->dst_start : xt->src_start,
    1003 |                 xt->numf ? xt->sgl[0].size : 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/dma/sl-dma.c:1017:4: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1016 |                         "Size %lu differs from channel transfer size %u\n",
         |                               ~~~
         |                               %zu
    1017 |                         xt->sgl[0].size, ch->transfer_size);
         |                         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/dma/sl-dma.c:1149:40: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1148 |                 dev_dbg(sl_dma->dev, "Issue transfer on %s channel %u, addr = 0x%llx\n",
         |                                                                                 ~~~~
         |                                                                                 %x
    1149 |                         sl_dma_direction_name(ch), ch->num, desc->addr);
         |                                                             ^~~~~~~~~~


vim +/writeq +176 drivers/dma/sl-dma.c

   173	
   174	static inline void sl_dma_writeq(struct sl_dma *sl_dma, u32 offset, u64 value)
   175	{
 > 176		writeq(value, sl_dma->bar + offset);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
