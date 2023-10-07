Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252D2134C;
	Sat,  7 Oct 2023 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsjqB18c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696687746; x=1728223746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vFXnH8usACxMwET+ea0JtQNom2jtP8MBfVrmKaT3krI=;
  b=hsjqB18cCos14BdCTDlsbZuhQs5lAoSC7uaEHH3oNFyd0/5Q5CCdXCB/
   BOSq5KrFhZF5Wtu2PK8y9CsR3g48KPTlyFwmq5sfdbVqU7mgds4r0dIpD
   tHWb/GKjnYbjXhSnznrVBq+7o9YlRBUa5V5cpAFVBHFy+Dy9vajvVbq3R
   GL5rXsr/JKYw9b7poIBjVbtT2eXziWv/zuokngz1Zf9/NN+4CxkNk8B2+
   Z20PeyQWHSVbX7dUUa+jKO2rENhfgWgcK0GrCiNTCtpoi5Ku2R4NOZpgc
   5rgtQaGLd70POqi7IVKgX+P1hKIFL63nmho13RqO0VgZVfTeWvIFiW7hB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="450419980"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="450419980"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 07:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="702388542"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="702388542"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Oct 2023 07:09:03 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp7zI-0004R7-2g;
	Sat, 07 Oct 2023 14:09:00 +0000
Date: Sat, 7 Oct 2023 22:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-stable 175/204] mm/list_lru.c:98:7: error: call to
 undeclared function 'list_lru_from_kmem'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202310072139.CXKkky51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   2b76550922a81fd63e16b81b6b39f1eb19df52f0
commit: a39744c1a652d8847098d9f1a022b50a9ceb3f10 [175/204] mm/list_lru: remove unused function
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231007/202310072139.CXKkky51-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310072139.CXKkky51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310072139.CXKkky51-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/list_lru.c:14:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
   In file included from mm/list_lru.c:14:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
   In file included from mm/list_lru.c:14:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
>> mm/list_lru.c:98:7: error: call to undeclared function 'list_lru_from_kmem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      98 |                 l = list_lru_from_kmem(lru, nid, item, &memcg);
         |                     ^
>> mm/list_lru.c:98:5: error: incompatible integer to pointer conversion assigning to 'struct list_lru_one *' from 'int' [-Wint-conversion]
      98 |                 l = list_lru_from_kmem(lru, nid, item, &memcg);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/list_lru.c:121:7: error: call to undeclared function 'list_lru_from_kmem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |                 l = list_lru_from_kmem(lru, nid, item, NULL);
         |                     ^
   mm/list_lru.c:121:5: error: incompatible integer to pointer conversion assigning to 'struct list_lru_one *' from 'int' [-Wint-conversion]
     121 |                 l = list_lru_from_kmem(lru, nid, item, NULL);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 4 errors generated.


vim +/list_lru_from_kmem +98 mm/list_lru.c

60d3fd32a7a9da Vladimir Davydov 2015-02-12   88  
a38e40824844a5 Dave Chinner     2013-08-28   89  bool list_lru_add(struct list_lru *lru, struct list_head *item)
a38e40824844a5 Dave Chinner     2013-08-28   90  {
3b1d58a4c96799 Dave Chinner     2013-08-28   91  	int nid = page_to_nid(virt_to_page(item));
3b1d58a4c96799 Dave Chinner     2013-08-28   92  	struct list_lru_node *nlru = &lru->node[nid];
fae91d6d8be5e2 Kirill Tkhai     2018-08-17   93  	struct mem_cgroup *memcg;
60d3fd32a7a9da Vladimir Davydov 2015-02-12   94  	struct list_lru_one *l;
3b1d58a4c96799 Dave Chinner     2013-08-28   95  
3b1d58a4c96799 Dave Chinner     2013-08-28   96  	spin_lock(&nlru->lock);
a38e40824844a5 Dave Chinner     2013-08-28   97  	if (list_empty(item)) {
6a6b7b77cc0fdc Muchun Song      2022-03-22  @98  		l = list_lru_from_kmem(lru, nid, item, &memcg);
60d3fd32a7a9da Vladimir Davydov 2015-02-12   99  		list_add_tail(item, &l->list);
fae91d6d8be5e2 Kirill Tkhai     2018-08-17  100  		/* Set shrinker bit if the first element was added */
fae91d6d8be5e2 Kirill Tkhai     2018-08-17  101  		if (!l->nr_items++)
2bfd36374edd9e Yang Shi         2021-05-04  102  			set_shrinker_bit(memcg, nid,
fae91d6d8be5e2 Kirill Tkhai     2018-08-17  103  					 lru_shrinker_id(lru));
2c80cd57c74339 Sahitya Tummala  2017-07-10  104  		nlru->nr_items++;
3b1d58a4c96799 Dave Chinner     2013-08-28  105  		spin_unlock(&nlru->lock);
a38e40824844a5 Dave Chinner     2013-08-28  106  		return true;
a38e40824844a5 Dave Chinner     2013-08-28  107  	}
3b1d58a4c96799 Dave Chinner     2013-08-28  108  	spin_unlock(&nlru->lock);
a38e40824844a5 Dave Chinner     2013-08-28  109  	return false;
a38e40824844a5 Dave Chinner     2013-08-28  110  }
a38e40824844a5 Dave Chinner     2013-08-28  111  EXPORT_SYMBOL_GPL(list_lru_add);
a38e40824844a5 Dave Chinner     2013-08-28  112  

:::::: The code at line 98 was first introduced by commit
:::::: 6a6b7b77cc0fdc13f50c66c219c8c05500a8dfce mm: list_lru: transpose the array of per-node per-memcg lru lists

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
