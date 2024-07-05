Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E64B1755A;
	Fri,  5 Jul 2024 02:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720146900; cv=none; b=AJqV3S3bD3CXHHhKZIUdSJiL4k8w6UNmUy5mkU4R40OEFFJAZ3NES8E+BD3cnt4wSloEXbUvxBE7qDEvg8qffXnMsxc6vlx9zNyW7KWepD2wSvxjr/Vv3cVkDdhqWPsuJem1fJOvibrZBQEtOxW8sqwVrrKl3XYo8ZepXW31LBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720146900; c=relaxed/simple;
	bh=LbYgPI9hSW3FiHzvwLrVvecg5OnlW0eQKOQ+vgT8yIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOz21voBVjs34R0DgEPBRMgYUxZDokt1Xs7v/3LFOS4ClvrjL8nEZVC5ERI4bp1hcmzkfW4Qydby+GuWgqeehpKQsBvHsDQ60BJobobJ/HlYs9sMP33MMcBA8LM5YklhS1hn3QpqEfqJHYuRdcMAocJM4IIj2XoFrs8QLdw0OUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvSitYyH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvSitYyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146898; x=1751682898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LbYgPI9hSW3FiHzvwLrVvecg5OnlW0eQKOQ+vgT8yIA=;
  b=nvSitYyHjEy7o6AWVIRhcCgMQPbgeURzMXzklYR5ZWrMZ5Hl4yHVF9tz
   Gv8YcVSydIi7rjM9JF9OlLWN5U5q3PCpoarPlve8f807sYJPXLhZ/nYrl
   seaeOtN2Go2MV5ebjBrafrRyxYRcubjI9r0XxoZieixDvE9o3Zby/ZEkm
   autqo1AlMuFs1RgfJthJviVMopmAhfrjoA8izbIKroxfngoO+mZEw6E+Y
   I0jJHvaThP/HzZJZJbXgA0+ysACC5PT7x7UYxnHUIkuv8+vkGAvN3+nXs
   cVCHdj4I/Ql0hfHYMt5LVaSZBViQT1cSd+1eLilsFhXdqUC9GPpF3fIke
   Q==;
X-CSE-ConnectionGUID: rg/CAbIoTNKJZoWe/rNu8w==
X-CSE-MsgGUID: t7/q0GgZSmKB43pdwHh3Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42853939"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="42853939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:34:56 -0700
X-CSE-ConnectionGUID: h3kZiKu4Rq6hpFWEC59Vfg==
X-CSE-MsgGUID: 0WLwaQlBSG+5NtjLSs6wtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47394566"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 19:34:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYmi-000RoF-1X;
	Fri, 05 Jul 2024 02:34:52 +0000
Date: Fri, 5 Jul 2024 10:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pza:sl-dma-demo 1/3] drivers/dma/sl-dma.c:956:39: warning: format
 specifies type 'unsigned long long' but the argument has type 'dma_addr_t'
 (aka 'unsigned int')
Message-ID: <202407051010.KPSCrWft-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240705/202407051010.KPSCrWft-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051010.KPSCrWft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051010.KPSCrWft-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/dma/sl-dma.c:176:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         writeq(value, sl_dma->bar + offset);
         |         ^
>> drivers/dma/sl-dma.c:956:39: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
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
>> drivers/dma/sl-dma.c:1003:3: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
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
   12 warnings and 1 error generated.


vim +956 drivers/dma/sl-dma.c

   944	
   945	static struct dma_async_tx_descriptor *
   946	sl_dma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
   947			     unsigned int sg_len, enum dma_transfer_direction direction,
   948			     unsigned long flags, void *context)
   949	{
   950		struct sl_dma_chan *ch = to_sl_dma_chan(chan);
   951		struct sl_dma *sl_dma = to_sl_dma(chan->device);
   952		struct sl_dma_tx_descriptor *desc;
   953	
   954		dev_dbg(sl_dma->dev,
   955			"Preparing transfer for %s channel %u, address = 0x%llx, len = %u\n",
 > 956			sl_dma_direction_name(ch), ch->num, sg_dma_address(sgl),
   957			sg_dma_len(sgl));
   958	
   959		if (!is_slave_direction(direction))
   960			return NULL;
   961	
   962		if (!sg_dma_len(sgl))
   963			return NULL;
   964	
   965		if (sg_len != 1)
   966			return NULL;
   967	
   968		if (sg_dma_len(sgl) != ch->transfer_size) {
   969			dev_dbg(sl_dma->dev,
   970				"Size %u differs from channel transfer size %u\n",
   971				sg_dma_len(sgl), ch->transfer_size);
   972		}
   973	
   974		/* Allocate and fill a descriptor */
   975		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
   976		if (!desc)
   977			return NULL;
   978	
   979		dma_async_tx_descriptor_init(&desc->tx, chan);
   980		desc->tx.tx_submit = sl_dma_tx_submit;
   981		async_tx_ack(&desc->tx);
   982	
   983		desc->addr = sg_dma_address(sgl);
   984		desc->interrupt = flags & DMA_PREP_INTERRUPT;
   985	
   986		return &desc->tx;
   987	}
   988	
   989	static struct dma_async_tx_descriptor *
   990	sl_dma_prep_interleaved_dma(struct dma_chan *chan,
   991				    struct dma_interleaved_template *xt,
   992				    unsigned long flags)
   993	{
   994		struct sl_dma_chan *ch = to_sl_dma_chan(chan);
   995		struct sl_dma *sl_dma = to_sl_dma(chan->device);
   996		struct sl_dma_tx_descriptor *desc;
   997	
   998		dev_dbg(sl_dma->dev,
   999			"Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
  1000			sl_dma_direction_name(ch), ch->num,
  1001			ch->direction == DMA_DEV_TO_MEM ? "dst_start" : "src_start",
  1002			ch->direction == DMA_DEV_TO_MEM ? xt->dst_start : xt->src_start,
> 1003			xt->numf ? xt->sgl[0].size : 0);
  1004	
  1005		if (!is_slave_direction(xt->dir))
  1006			return NULL;
  1007	
  1008		if (!xt->numf || !xt->sgl[0].size)
  1009			return NULL;
  1010	
  1011		if (xt->frame_size != 1)
  1012			return NULL;
  1013	
  1014		if (xt->sgl[0].size != ch->transfer_size) {
  1015			dev_dbg(sl_dma->dev,
  1016				"Size %lu differs from channel transfer size %u\n",
  1017				xt->sgl[0].size, ch->transfer_size);
  1018		}
  1019	
  1020		/* Allocate and fill a descriptor */
  1021		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
  1022		if (!desc)
  1023			return NULL;
  1024	
  1025		dma_async_tx_descriptor_init(&desc->tx, chan);
  1026		desc->tx.tx_submit = sl_dma_tx_submit;
  1027		async_tx_ack(&desc->tx);
  1028	
  1029		if (ch->direction == DMA_DEV_TO_MEM)
  1030			desc->addr = xt->dst_start;
  1031		else
  1032			desc->addr = xt->src_start;
  1033		desc->interrupt = flags & DMA_PREP_INTERRUPT;
  1034	
  1035		return &desc->tx;
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
