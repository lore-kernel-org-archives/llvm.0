Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC62A1448C7;
	Sat,  2 Nov 2024 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730536949; cv=none; b=Md4XUSxKWcEaMosqbnJyuZatSiuFagQnZyssNDHJLjcGOOo01rt7I5bRqG7NV9glsm5EsUUAXzuIks05YUTx+99TcO8xyEAWTGV4XduSQSPx+CVzMulZpF7TMkA8DlKvmiykfuU6oxWZy825ubtDiiQ/nXZ8kfxHFujEO0zMzDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730536949; c=relaxed/simple;
	bh=0JNDAs8d6UUOpTiIJQm0ettaGCIyVGp+Wfdzprg/x8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0dkeHU1DxAEDgigsdg1ZoTrMbQ6FE/KYUGHbPtCXd5rR90QVzN8CT1TPm6dWi3PUi/uofhuIFwwg3ZFX4BGLVXdbIozlVUD96o+Jp14O479oK/jYvBsG4/6QM7lLXjXEn2qdeLX5/SKfVYxC29K2yZB0gENeHeb6ZOoTIq+Lio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSkebuFK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSkebuFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730536947; x=1762072947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JNDAs8d6UUOpTiIJQm0ettaGCIyVGp+Wfdzprg/x8c=;
  b=OSkebuFKHczcIpPJoIDCeyYwP2YW+UlptXkxsgImcFB7sjNQAV3zMETD
   V3QkY4eiH5260T4kB06cSXab08Jr3PmLcu/bvLow7NN0EmmfG6/j0tEyE
   11pyeOQIwqqOd0hJbbnI8TPiigrrXEVsM16yYe6IPokoVmluU5zHmaxhz
   fot7St2HnQ2RIuNwprJcRiE9NxdsxQwm2Fq/0/vrF/o+xp/yr3NrLP78n
   mPsfQkqGa5PhduIp30EBG9TMK8sawPIjfJwu+I1KImFkYm/tra5NmSjkp
   nv2xikFUnT8Ep7esE4fhKrcWSxU/VwMhZ3J1v/HZi9vIi2jePB90xU+cL
   A==;
X-CSE-ConnectionGUID: jfY6qyIiS/uIyj+FT6h6rg==
X-CSE-MsgGUID: IHpLBEiGRQW86YQccj3Lgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="33138797"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="33138797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 01:42:26 -0700
X-CSE-ConnectionGUID: 2lcIXnEoTjO1yXZ9SM+jCg==
X-CSE-MsgGUID: BmW5hlZ8SMCK+HPst2niyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87943875"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2024 01:42:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t79iA-000icP-0r;
	Sat, 02 Nov 2024 08:42:22 +0000
Date: Sat, 2 Nov 2024 16:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 21/28] drivers/char/aaa.c:90:23: error: array has
 incomplete element type 'struct scatterlist'
Message-ID: <202411021639.DWTXE30H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   8a4f2c71acf243e19ca2de60aab89a6bdf7cf66c
commit: b1eb0844bab3ef8e30c18b6b4469089070c713aa [21/28] kfifo tester
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241102/202411021639.DWTXE30H-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021639.DWTXE30H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021639.DWTXE30H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/char/aaa.c:90:23: error: array has incomplete element type 'struct scatterlist'
      90 |         struct scatterlist sg[4] = {};
         |                              ^
   include/linux/kfifo.h:47:8: note: forward declaration of 'struct scatterlist'
      47 | struct scatterlist;
         |        ^
>> drivers/char/aaa.c:104:3: error: call to undeclared function 'page_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |                 page_address(virt_to_page(fifo.kfifo.data)) +
         |                 ^
>> drivers/char/aaa.c:105:3: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     105 |                 offset_in_page(fifo.kfifo.data),
         |                 ^
>> drivers/char/aaa.c:104:3: warning: format specifies type 'void *' but the argument has type 'int' [-Wformat]
     100 |         pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
         |                                                                           ~~
         |                                                                           %d
     101 |                 __func__,
     102 |                 ms(fifo.kfifo.in), ms(fifo.kfifo.out),
     103 |                 kfifo_len(&fifo), kfifo_avail(&fifo), n, fifo.kfifo.data,
     104 |                 page_address(virt_to_page(fifo.kfifo.data)) +
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     105 |                 offset_in_page(fifo.kfifo.data),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:563:34: note: expanded from macro 'pr_info'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/char/aaa.c:111:7: error: call to undeclared function 'sg_virt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |                         i, sg_virt(&sg[i]),// - fifo.kfifo.data,
         |                            ^
>> drivers/char/aaa.c:112:27: error: call to undeclared function 'sg_dma_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |                         i, (unsigned long long)sg_dma_address(&sg[i]),
         |                                                ^
>> drivers/char/aaa.c:113:7: error: call to undeclared function 'sg_dma_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |                         i, sg_dma_len(&sg[i]));
         |                            ^
   1 warning and 6 errors generated.


vim +90 drivers/char/aaa.c

    87	
    88	static void dump_fifo(void)
    89	{
  > 90		struct scatterlist sg[4] = {};
    91		dma_addr_t dma = 0xffUL << (32 - 8);
    92		unsigned int n;
    93	
    94		if (mutex_lock_interruptible(&my_mutex))
    95			return;
    96	
    97		n = kfifo_dma_out_prepare_mapped(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE,
    98						 dma);
    99	
   100		pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
   101			__func__,
   102			ms(fifo.kfifo.in), ms(fifo.kfifo.out),
   103			kfifo_len(&fifo), kfifo_avail(&fifo), n, fifo.kfifo.data,
 > 104			page_address(virt_to_page(fifo.kfifo.data)) +
 > 105			offset_in_page(fifo.kfifo.data),
   106			&dma);
   107	
   108		pr_info("\t");
   109		for (unsigned i = 0; i < n; i++) {
   110			pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
 > 111				i, sg_virt(&sg[i]),// - fifo.kfifo.data,
 > 112				i, (unsigned long long)sg_dma_address(&sg[i]),
 > 113				i, sg_dma_len(&sg[i]));
   114		}
   115		pr_cont("\n");
   116	
   117		mutex_unlock(&my_mutex);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
