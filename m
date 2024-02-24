Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D98482C6;
	Sat, 24 Feb 2024 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708798104; cv=none; b=UGdjaWHVM1qRH03TcHzPyi3sQIh8C2fAUCZFcSznBRLl35eYqkKcxIQ/SVMpWeG0rt7Ywk9MDLZuS6kkBc2Wgq4wTwoM8sx8BupRkzddbVqGcM7vuQ74g3zYZRl+U1OnUiJofdHQ+SVcI7OaL5Wzz8275IbPmPdEkJwCuzbSPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708798104; c=relaxed/simple;
	bh=bVCQToqS1WKiTKdm09tgVJKyO+vwFm4Au7U5+/lBPDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mY24Cljvro2n0sCFQTetChCr0NDQL53dQymJgFjkIYjTfv5ThPfx4vPw2tSBYFT7Sj79VoxrcmYByERkUEVqt0RtCdeoISkaU5k1A1fSypst+4U+3581FpsWTWLEHVrnqzRUO6+0hFE6mqB5NCTv6AByvU9pt8zCwAlm8+74XYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLf8/GqB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLf8/GqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708798103; x=1740334103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bVCQToqS1WKiTKdm09tgVJKyO+vwFm4Au7U5+/lBPDc=;
  b=VLf8/GqBVZzKhcDLIGUCKUGehQMQR/w3Na16YXYtbF1J0hexGgfmBPZF
   qstL21ALKysEIKBSeqlXc/59msEjetoi14KjKEAuoDCmtJ3KJHlYm1fq0
   z5lcGwUzDwTIkIe93oY4hYbJ35m43EC5LSQd+NDF8Q4w3+y5Il6P2UEN1
   gohgBPqTn05juMEzgWYpdX5TS9JuCqPExHjgRBeZ5GG9I4aJ+vLbWWtyJ
   7Knhes5NjzD158vWG/irzroXl0j1e1YcFeMHgmlrVPTXZjwgsz+pz7z9g
   Tx4PqM9l0sr15JEdrbRZobeUbxYVqr34FjKphvURLI0mg1Yke/8CQcBDi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6906364"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6906364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 10:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="10791057"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2024 10:08:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdwRW-0008nI-1u;
	Sat, 24 Feb 2024 18:08:13 +0000
Date: Sun, 25 Feb 2024 02:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 30/33] samples/kfifo/dma-example.c:119:2:
 warning: variable '__tmp' is uninitialized when used within its own
 initialization
Message-ID: <202402250254.ZU9AWM30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   2d9bfd745d675f50d81466645e10fde77e75eea9
commit: a6be92e5510c1505cad39d7b707f78b70eb98725 [30/33] kfifo: introduce and use kfifo_skip_count()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240225/202402250254.ZU9AWM30-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250254.ZU9AWM30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250254.ZU9AWM30-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/kfifo/dma-example.c:119:2: warning: variable '__tmp' is uninitialized when used within its own initialization [-Wuninitialized]
     119 |         kfifo_dma_out_finish(&fifo, ret);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:801:19: note: expanded from macro 'kfifo_dma_out_finish'
     801 |         kfifo_skip_count(__tmp, (len) / sizeof(*__tmp->type)); \
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:312:30: note: expanded from macro 'kfifo_skip_count'
     312 |         typeof((fifo) + 1) __tmp = (fifo); \
         |                            ~~~~~    ^~~~
   1 warning generated.


vim +/__tmp +119 samples/kfifo/dma-example.c

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
399f1e30ac17b7 Ira W. Snyder   2010-09-30   63  	nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
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
5bf2b19320ec31 Stefani Seibold 2010-08-10 @119  	kfifo_dma_out_finish(&fifo, ret);
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

:::::: The code at line 119 was first introduced by commit
:::::: 5bf2b19320ec31d094d7370fdf536f7fd91fd799 kfifo: add example files to the kernel sample directory

:::::: TO: Stefani Seibold <stefani@seibold.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
