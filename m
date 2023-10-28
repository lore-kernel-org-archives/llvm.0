Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6797BE56B;
	Sat, 28 Oct 2023 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GauHUK0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698521558; x=1730057558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgtgeFMPJtKoetCDVf0MMa52FNLI3pxnQoTxW22fPzc=;
  b=GauHUK0NZkaYGvdgKNtFstiHvtTdI9QQ6IPnAPM4Juslu2aXyYApkF9g
   YmVR5kirvslDov7TcvXm268yrRyyr6FemsKDan/6BnyDqIjon1cEXMZFU
   tFtc45hNip1kL7Y0xzzCZ3RlneXVYAzbfjNnWaHdiQotVhQ5OKjJ5CviD
   0NtyRFM3izifszGoFlvSzn/W7q5P47DUweTZ1J8gE8NoGFUxbwa88fv2S
   R2htYg6PXIDvzxO+m5sHOgTx0sTXdg0vvutQTnlxVJ/7UeHFxXvDnCHQy
   S3wWjjXaBZd4/1Msr8e9i4szNTd0DqDOE3mGjeJAq8FPxt/UO9DXbxH9d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452165129"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="452165129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 12:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1091252516"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="1091252516"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Oct 2023 12:32:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwp2v-000C1r-2v;
	Sat, 28 Oct 2023 19:32:33 +0000
Date: Sun, 29 Oct 2023 03:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_unify_rfc 2/4] net/core/skbuff.c:301:15:
 error: use of undeclared identifier '__napi_alloc_frag_align'; did you mean
 'napi_alloc_frag_align'?
Message-ID: <202310290310.LCXWanPj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_unify_rfc
head:   7675d2f57391bcfccc739671a7b3b2a40acfc595
commit: 1ec6b07022b1485c830aa4c58fd4154ba67306cf [2/4] mm/page_alloc: modify page_frag_alloc_align() to accept align as an argument
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231029/202310290310.LCXWanPj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290310.LCXWanPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290310.LCXWanPj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> net/core/skbuff.c:301:15: error: use of undeclared identifier '__napi_alloc_frag_align'; did you mean 'napi_alloc_frag_align'?
     301 | EXPORT_SYMBOL(__napi_alloc_frag_align);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               napi_alloc_frag_align
   include/linux/export.h:86:44: note: expanded from macro 'EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                                        ^
   include/linux/export.h:83:54: note: expanded from macro '_EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:74:16: note: expanded from macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^
   net/core/skbuff.c:293:7: note: 'napi_alloc_frag_align' declared here
     293 | void *napi_alloc_frag_align(unsigned int fragsz, unsigned int align)
         |       ^
>> net/core/skbuff.c:322:15: error: use of undeclared identifier '__netdev_alloc_frag_align'; did you mean 'netdev_alloc_frag_align'?
     322 | EXPORT_SYMBOL(__netdev_alloc_frag_align);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               netdev_alloc_frag_align
   include/linux/export.h:86:44: note: expanded from macro 'EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                                        ^
   include/linux/export.h:83:54: note: expanded from macro '_EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:74:16: note: expanded from macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^
   net/core/skbuff.c:303:7: note: 'netdev_alloc_frag_align' declared here
     303 | void *netdev_alloc_frag_align(unsigned int fragsz, unsigned int align)
         |       ^
   12 warnings and 2 errors generated.


vim +301 net/core/skbuff.c

dbae2b062824fc Paolo Abeni       2022-09-28  292  
1ec6b07022b148 Yunsheng Lin      2023-10-28  293  void *napi_alloc_frag_align(unsigned int fragsz, unsigned int align)
50fad4b543b30e Alexander Lobakin 2021-02-13  294  {
50fad4b543b30e Alexander Lobakin 2021-02-13  295  	struct napi_alloc_cache *nc = this_cpu_ptr(&napi_alloc_cache);
50fad4b543b30e Alexander Lobakin 2021-02-13  296  
50fad4b543b30e Alexander Lobakin 2021-02-13  297  	fragsz = SKB_DATA_ALIGN(fragsz);
50fad4b543b30e Alexander Lobakin 2021-02-13  298  
1ec6b07022b148 Yunsheng Lin      2023-10-28  299  	return page_frag_alloc_align(&nc->page, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  300  }
50fad4b543b30e Alexander Lobakin 2021-02-13 @301  EXPORT_SYMBOL(__napi_alloc_frag_align);
50fad4b543b30e Alexander Lobakin 2021-02-13  302  
1ec6b07022b148 Yunsheng Lin      2023-10-28  303  void *netdev_alloc_frag_align(unsigned int fragsz, unsigned int align)
50fad4b543b30e Alexander Lobakin 2021-02-13  304  {
50fad4b543b30e Alexander Lobakin 2021-02-13  305  	void *data;
50fad4b543b30e Alexander Lobakin 2021-02-13  306  
50fad4b543b30e Alexander Lobakin 2021-02-13  307  	fragsz = SKB_DATA_ALIGN(fragsz);
afa79d08c6c8e1 Changbin Du       2021-08-13  308  	if (in_hardirq() || irqs_disabled()) {
32e3573f739209 Yajun Deng        2021-09-14  309  		struct page_frag_cache *nc = this_cpu_ptr(&netdev_alloc_cache);
32e3573f739209 Yajun Deng        2021-09-14  310  
1ec6b07022b148 Yunsheng Lin      2023-10-28  311  		data = page_frag_alloc_align(nc, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  312  	} else {
32e3573f739209 Yajun Deng        2021-09-14  313  		struct napi_alloc_cache *nc;
32e3573f739209 Yajun Deng        2021-09-14  314  
50fad4b543b30e Alexander Lobakin 2021-02-13  315  		local_bh_disable();
32e3573f739209 Yajun Deng        2021-09-14  316  		nc = this_cpu_ptr(&napi_alloc_cache);
1ec6b07022b148 Yunsheng Lin      2023-10-28  317  		data = page_frag_alloc_align(&nc->page, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  318  		local_bh_enable();
50fad4b543b30e Alexander Lobakin 2021-02-13  319  	}
50fad4b543b30e Alexander Lobakin 2021-02-13  320  	return data;
50fad4b543b30e Alexander Lobakin 2021-02-13  321  }
50fad4b543b30e Alexander Lobakin 2021-02-13 @322  EXPORT_SYMBOL(__netdev_alloc_frag_align);
50fad4b543b30e Alexander Lobakin 2021-02-13  323  

:::::: The code at line 301 was first introduced by commit
:::::: 50fad4b543b30e9323da485d4090c3a94b2b6271 skbuff: move NAPI cache declarations upper in the file

:::::: TO: Alexander Lobakin <alobakin@pm.me>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
