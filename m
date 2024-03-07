Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B3161;
	Thu,  7 Mar 2024 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709770723; cv=none; b=skAkDk9Yhs69MCjejCiTTrqv9/9Z+ML/ee58fTDsdVXA8uO4QB6wqJUVbhYikbFSIWvpHxEUjkRaylG7iydpBpL5KehLISOK2PIopg7c957h83Np11IjA3CwSc5dk8CnLT12fprki23aHBToNxDoRd68810/CCW91I+oRu0JgWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709770723; c=relaxed/simple;
	bh=HTbHvX1dwk8gr08u5fLjGKBWnyLBIC28SBumN25jrgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzbBO7/kOALOSwDwP7QMupdp+v/zbiK+wLumyXVVJMTVR7WbePe2qbOF6zdiqVm+1MUOQLCtwpbMa4lNOTUwvIWrd4hZJ9HFXp4zVQpAMQLc1XL0iFJS68IFm3uUI7mHz/Xws3NVscNlZioARlE09m5OwFcGTKeeHzC01PSRWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGlyFB2I; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGlyFB2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709770721; x=1741306721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTbHvX1dwk8gr08u5fLjGKBWnyLBIC28SBumN25jrgA=;
  b=MGlyFB2I7QdbNNJAaZ04sDb0juvRnoTpK5OAsFTm19fdjec3aSq+imSN
   jBUbixy5fPx0TcToNCMPMTXl52ZfveT3Jd/XNZXI8jfvGvomwvVD32rrF
   kN7EGWegUr8JqhCBz4UFfX8v+v11NThkUJeI7aGe+ORGgkcddhPqfcda4
   N/WEsnDYsSrgoI1kn2zzdMYb7ds8s/AZD+mt1jV00V8D/C/49x9ib6sXk
   2TRlp6DxOgDXNFkO0uSWVqpjfrjkuZPdgwBduMuynIOzPjA6iIfhOFqsn
   pfleYZZO6hrgyaWDtF4M60m1SJCORva+B8ww4VcGWitac4QDPOTBoy8Dt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21940425"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="21940425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 16:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9912537"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2024 16:18:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri1T1-0004dt-1W;
	Thu, 07 Mar 2024 00:18:35 +0000
Date: Thu, 7 Mar 2024 08:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 20/41] samples/kfifo/dma-example.c:63:10: error:
 use of undeclared identifier 'DMA_MAPPING_ERROR'
Message-ID: <202403070812.4a5eqHFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ae68847cb7b2931e05cac969d0920beb7f40e7dc
commit: d4b6734160ab9e6ddd141d5551ccd1098f38191b [20/41] kfifo: add kfifo_dma_out_prepare_mapped()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070812.4a5eqHFv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070812.4a5eqHFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070812.4a5eqHFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/kfifo/dma-example.c:9:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
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
   In file included from samples/kfifo/dma-example.c:10:
   In file included from include/linux/kfifo.h:42:
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
   In file included from samples/kfifo/dma-example.c:10:
   In file included from include/linux/kfifo.h:42:
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
   In file included from samples/kfifo/dma-example.c:10:
   In file included from include/linux/kfifo.h:42:
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
>> samples/kfifo/dma-example.c:63:10: error: use of undeclared identifier 'DMA_MAPPING_ERROR'
      63 |         nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
         |                 ^
   include/linux/kfifo.h:740:53: note: expanded from macro 'kfifo_dma_in_prepare'
     740 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^
>> samples/kfifo/dma-example.c:63:10: error: use of undeclared identifier 'DMA_MAPPING_ERROR'
   include/linux/kfifo.h:740:53: note: expanded from macro 'kfifo_dma_in_prepare'
     740 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^
   samples/kfifo/dma-example.c:93:10: error: use of undeclared identifier 'DMA_MAPPING_ERROR'
      93 |         nents = kfifo_dma_out_prepare(&fifo, sg, ARRAY_SIZE(sg), 8);
         |                 ^
   include/linux/kfifo.h:796:54: note: expanded from macro 'kfifo_dma_out_prepare'
     796 |         kfifo_dma_out_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                             ^
   samples/kfifo/dma-example.c:93:10: error: use of undeclared identifier 'DMA_MAPPING_ERROR'
   include/linux/kfifo.h:796:54: note: expanded from macro 'kfifo_dma_out_prepare'
     796 |         kfifo_dma_out_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                             ^
   17 warnings and 4 errors generated.


vim +/DMA_MAPPING_ERROR +63 samples/kfifo/dma-example.c

5bf2b19320ec31 Stefani Seibold 2010-08-10   20  
5bf2b19320ec31 Stefani Seibold 2010-08-10   21  static int __init example_init(void)
5bf2b19320ec31 Stefani Seibold 2010-08-10   22  {
5bf2b19320ec31 Stefani Seibold 2010-08-10   23  	int			i;
5bf2b19320ec31 Stefani Seibold 2010-08-10   24  	unsigned int		ret;
399f1e30ac17b7 Ira W. Snyder   2010-09-30   25  	unsigned int		nents;
5bf2b19320ec31 Stefani Seibold 2010-08-10   26  	struct scatterlist	sg[10];
5bf2b19320ec31 Stefani Seibold 2010-08-10   27  
5bf2b19320ec31 Stefani Seibold 2010-08-10   28  	printk(KERN_INFO "DMA fifo test start\n");
5bf2b19320ec31 Stefani Seibold 2010-08-10   29  
5bf2b19320ec31 Stefani Seibold 2010-08-10   30  	if (kfifo_alloc(&fifo, FIFO_SIZE, GFP_KERNEL)) {
a25effa4d265eb Andrea Righi    2010-08-19   31  		printk(KERN_WARNING "error kfifo_alloc\n");
a25effa4d265eb Andrea Righi    2010-08-19   32  		return -ENOMEM;
5bf2b19320ec31 Stefani Seibold 2010-08-10   33  	}
5bf2b19320ec31 Stefani Seibold 2010-08-10   34  
5bf2b19320ec31 Stefani Seibold 2010-08-10   35  	printk(KERN_INFO "queue size: %u\n", kfifo_size(&fifo));
5bf2b19320ec31 Stefani Seibold 2010-08-10   36  
5bf2b19320ec31 Stefani Seibold 2010-08-10   37  	kfifo_in(&fifo, "test", 4);
5bf2b19320ec31 Stefani Seibold 2010-08-10   38  
5bf2b19320ec31 Stefani Seibold 2010-08-10   39  	for (i = 0; i != 9; i++)
498d319bb51299 Stefani Seibold 2013-11-14   40  		kfifo_put(&fifo, i);
5bf2b19320ec31 Stefani Seibold 2010-08-10   41  
5bf2b19320ec31 Stefani Seibold 2010-08-10   42  	/* kick away first byte */
a25effa4d265eb Andrea Righi    2010-08-19   43  	kfifo_skip(&fifo);
5bf2b19320ec31 Stefani Seibold 2010-08-10   44  
5bf2b19320ec31 Stefani Seibold 2010-08-10   45  	printk(KERN_INFO "queue len: %u\n", kfifo_len(&fifo));
5bf2b19320ec31 Stefani Seibold 2010-08-10   46  
a25effa4d265eb Andrea Righi    2010-08-19   47  	/*
a25effa4d265eb Andrea Righi    2010-08-19   48  	 * Configure the kfifo buffer to receive data from DMA input.
a25effa4d265eb Andrea Righi    2010-08-19   49  	 *
a25effa4d265eb Andrea Righi    2010-08-19   50  	 *  .--------------------------------------.
a25effa4d265eb Andrea Righi    2010-08-19   51  	 *  | 0 | 1 | 2 | ... | 12 | 13 | ... | 31 |
a25effa4d265eb Andrea Righi    2010-08-19   52  	 *  |---|------------------|---------------|
a25effa4d265eb Andrea Righi    2010-08-19   53  	 *   \_/ \________________/ \_____________/
a25effa4d265eb Andrea Righi    2010-08-19   54  	 *    \          \                  \
a25effa4d265eb Andrea Righi    2010-08-19   55  	 *     \          \_allocated data   \
a25effa4d265eb Andrea Righi    2010-08-19   56  	 *      \_*free space*                \_*free space*
a25effa4d265eb Andrea Righi    2010-08-19   57  	 *
a25effa4d265eb Andrea Righi    2010-08-19   58  	 * We need two different SG entries: one for the free space area at the
a25effa4d265eb Andrea Righi    2010-08-19   59  	 * end of the kfifo buffer (19 bytes) and another for the first free
a25effa4d265eb Andrea Righi    2010-08-19   60  	 * byte at the beginning, after the kfifo_skip().
a25effa4d265eb Andrea Righi    2010-08-19   61  	 */
7b34d5257a90c4 Andrea Righi    2010-08-19   62  	sg_init_table(sg, ARRAY_SIZE(sg));
399f1e30ac17b7 Ira W. Snyder   2010-09-30  @63  	nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
399f1e30ac17b7 Ira W. Snyder   2010-09-30   64  	printk(KERN_INFO "DMA sgl entries: %d\n", nents);
399f1e30ac17b7 Ira W. Snyder   2010-09-30   65  	if (!nents) {
a25effa4d265eb Andrea Righi    2010-08-19   66  		/* fifo is full and no sgl was created */
a25effa4d265eb Andrea Righi    2010-08-19   67  		printk(KERN_WARNING "error kfifo_dma_in_prepare\n");
a25effa4d265eb Andrea Righi    2010-08-19   68  		return -EIO;
a25effa4d265eb Andrea Righi    2010-08-19   69  	}
5bf2b19320ec31 Stefani Seibold 2010-08-10   70  
a25effa4d265eb Andrea Righi    2010-08-19   71  	/* receive data */
5bf2b19320ec31 Stefani Seibold 2010-08-10   72  	printk(KERN_INFO "scatterlist for receive:\n");
399f1e30ac17b7 Ira W. Snyder   2010-09-30   73  	for (i = 0; i < nents; i++) {
5bf2b19320ec31 Stefani Seibold 2010-08-10   74  		printk(KERN_INFO
5bf2b19320ec31 Stefani Seibold 2010-08-10   75  		"sg[%d] -> "
9263969a46fc89 Logan Gunthorpe 2017-07-12   76  		"page %p offset 0x%.8x length 0x%.8x\n",
9263969a46fc89 Logan Gunthorpe 2017-07-12   77  			i, sg_page(&sg[i]), sg[i].offset, sg[i].length);
5bf2b19320ec31 Stefani Seibold 2010-08-10   78  
5bf2b19320ec31 Stefani Seibold 2010-08-10   79  		if (sg_is_last(&sg[i]))
5bf2b19320ec31 Stefani Seibold 2010-08-10   80  			break;
5bf2b19320ec31 Stefani Seibold 2010-08-10   81  	}
5bf2b19320ec31 Stefani Seibold 2010-08-10   82  
a25effa4d265eb Andrea Righi    2010-08-19   83  	/* put here your code to setup and exectute the dma operation */
5bf2b19320ec31 Stefani Seibold 2010-08-10   84  	/* ... */
5bf2b19320ec31 Stefani Seibold 2010-08-10   85  
5bf2b19320ec31 Stefani Seibold 2010-08-10   86  	/* example: zero bytes received */
5bf2b19320ec31 Stefani Seibold 2010-08-10   87  	ret = 0;
5bf2b19320ec31 Stefani Seibold 2010-08-10   88  
5bf2b19320ec31 Stefani Seibold 2010-08-10   89  	/* finish the dma operation and update the received data */
5bf2b19320ec31 Stefani Seibold 2010-08-10   90  	kfifo_dma_in_finish(&fifo, ret);
5bf2b19320ec31 Stefani Seibold 2010-08-10   91  
a25effa4d265eb Andrea Righi    2010-08-19   92  	/* Prepare to transmit data, example: 8 bytes */
399f1e30ac17b7 Ira W. Snyder   2010-09-30   93  	nents = kfifo_dma_out_prepare(&fifo, sg, ARRAY_SIZE(sg), 8);
399f1e30ac17b7 Ira W. Snyder   2010-09-30   94  	printk(KERN_INFO "DMA sgl entries: %d\n", nents);
399f1e30ac17b7 Ira W. Snyder   2010-09-30   95  	if (!nents) {
a25effa4d265eb Andrea Righi    2010-08-19   96  		/* no data was available and no sgl was created */
a25effa4d265eb Andrea Righi    2010-08-19   97  		printk(KERN_WARNING "error kfifo_dma_out_prepare\n");
a25effa4d265eb Andrea Righi    2010-08-19   98  		return -EIO;
a25effa4d265eb Andrea Righi    2010-08-19   99  	}
5bf2b19320ec31 Stefani Seibold 2010-08-10  100  
5bf2b19320ec31 Stefani Seibold 2010-08-10  101  	printk(KERN_INFO "scatterlist for transmit:\n");
399f1e30ac17b7 Ira W. Snyder   2010-09-30  102  	for (i = 0; i < nents; i++) {
5bf2b19320ec31 Stefani Seibold 2010-08-10  103  		printk(KERN_INFO
5bf2b19320ec31 Stefani Seibold 2010-08-10  104  		"sg[%d] -> "
9263969a46fc89 Logan Gunthorpe 2017-07-12  105  		"page %p offset 0x%.8x length 0x%.8x\n",
9263969a46fc89 Logan Gunthorpe 2017-07-12  106  			i, sg_page(&sg[i]), sg[i].offset, sg[i].length);
5bf2b19320ec31 Stefani Seibold 2010-08-10  107  
5bf2b19320ec31 Stefani Seibold 2010-08-10  108  		if (sg_is_last(&sg[i]))
5bf2b19320ec31 Stefani Seibold 2010-08-10  109  			break;
5bf2b19320ec31 Stefani Seibold 2010-08-10  110  	}
5bf2b19320ec31 Stefani Seibold 2010-08-10  111  
a25effa4d265eb Andrea Righi    2010-08-19  112  	/* put here your code to setup and exectute the dma operation */
5bf2b19320ec31 Stefani Seibold 2010-08-10  113  	/* ... */
5bf2b19320ec31 Stefani Seibold 2010-08-10  114  
5bf2b19320ec31 Stefani Seibold 2010-08-10  115  	/* example: 5 bytes transmitted */
5bf2b19320ec31 Stefani Seibold 2010-08-10  116  	ret = 5;
5bf2b19320ec31 Stefani Seibold 2010-08-10  117  
5bf2b19320ec31 Stefani Seibold 2010-08-10  118  	/* finish the dma operation and update the transmitted data */
5bf2b19320ec31 Stefani Seibold 2010-08-10  119  	kfifo_dma_out_finish(&fifo, ret);
5bf2b19320ec31 Stefani Seibold 2010-08-10  120  
a25effa4d265eb Andrea Righi    2010-08-19  121  	ret = kfifo_len(&fifo);
5bf2b19320ec31 Stefani Seibold 2010-08-10  122  	printk(KERN_INFO "queue len: %u\n", kfifo_len(&fifo));
5bf2b19320ec31 Stefani Seibold 2010-08-10  123  
a25effa4d265eb Andrea Righi    2010-08-19  124  	if (ret != 7) {
a25effa4d265eb Andrea Righi    2010-08-19  125  		printk(KERN_WARNING "size mismatch: test failed");
a25effa4d265eb Andrea Righi    2010-08-19  126  		return -EIO;
a25effa4d265eb Andrea Righi    2010-08-19  127  	}
a25effa4d265eb Andrea Righi    2010-08-19  128  	printk(KERN_INFO "test passed\n");
a25effa4d265eb Andrea Righi    2010-08-19  129  
5bf2b19320ec31 Stefani Seibold 2010-08-10  130  	return 0;
5bf2b19320ec31 Stefani Seibold 2010-08-10  131  }
5bf2b19320ec31 Stefani Seibold 2010-08-10  132  

:::::: The code at line 63 was first introduced by commit
:::::: 399f1e30ac17b77d383444aff480c7390f5adf2a kfifo: fix scatterlist usage

:::::: TO: Ira W. Snyder <iws@ovro.caltech.edu>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
