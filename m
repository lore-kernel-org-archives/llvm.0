Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D2363;
	Sun,  2 Jul 2023 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688287297; x=1719823297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOaUaMj3Gb91x0YCkqreJiCoHKbu3Yxo7doGAl0QtZs=;
  b=T3esFCwOjv7S9ASrTd5diwJE5O3cjrnneVvm4ntbt3IDFgjNfdzj/3Mp
   7diGsYg7out71JwcMhK7nqOnmCbj//N1ZGoiaJfnwhyIZC0xTuAf5H+NQ
   iSDa3hDIfIKFVYebPhMTiD4+xBcyhPJ0MoewdbicMD0gRZg0Lv6cMX0F0
   yVhXrAEAARHfjumwpkCMqldf9ljq582ot3S+QhS0rmBVXmmO1C+giUXA/
   bJseHCYfc0aVsO/6XnWxyKTFxwoPZBgCWQ5kOq7xmvu9Yw5x4WM1HIsQT
   WQQKLSJYgUpZkBRVNV1gopifbqbmEnMPTRDS6WxuoKQeqVJQFZa+N+AED
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="449062884"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="449062884"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 01:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="668449832"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="668449832"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jul 2023 01:41:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFseD-000GY9-1C;
	Sun, 02 Jul 2023 08:41:33 +0000
Date: Sun, 2 Jul 2023 16:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:virt_to_page_dma_map 1/2]
 drivers/net/ethernet/alteon/acenic.c:2360:19: error: too few arguments
 provided to function-like macro invocation
Message-ID: <202307021656.ThCdHSGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git virt_to_page_dma_map
head:   bdadb716f811b19b48c3f3290584f0fac4daef12
commit: 3f498fa9978b9e42ff1ee2046122bab6213c4d48 [1/2] net: remove virt_to_page when dma mapping
config: x86_64-randconfig-r006-20230702 (https://download.01.org/0day-ci/archive/20230702/202307021656.ThCdHSGL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307021656.ThCdHSGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307021656.ThCdHSGL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/alteon/acenic.c:2360:19: error: too few arguments provided to function-like macro invocation
                                    DMA_TO_DEVICE);
                                                 ^
   include/linux/dma-mapping.h:411:9: note: macro 'dma_map_single' defined here
   #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
           ^
>> drivers/net/ethernet/alteon/acenic.c:2359:12: error: use of undeclared identifier 'dma_map_single'; did you mean 'dma_map_sgtable'?
           mapping = dma_map_single(&ap->pdev->dev, skb->data skb->len,
                     ^~~~~~~~~~~~~~
                     dma_map_sgtable
   include/linux/dma-mapping.h:113:5: note: 'dma_map_sgtable' declared here
   int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
       ^
   2 errors generated.


vim +2360 drivers/net/ethernet/alteon/acenic.c

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2350  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2351  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2352  static inline dma_addr_t
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2353  ace_map_tx_skb(struct ace_private *ap, struct sk_buff *skb,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2354  	       struct sk_buff *tail, u32 idx)
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2355  {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2356  	dma_addr_t mapping;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2357  	struct tx_ring_info *info;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2358  
3f498fa9978b9e drivers/net/ethernet/alteon/acenic.c Yunsheng Lin       2023-07-02 @2359  	mapping = dma_map_single(&ap->pdev->dev, skb->data skb->len,
f4079e5d72ff97 drivers/net/ethernet/alteon/acenic.c Christophe JAILLET 2020-07-16 @2360  				 DMA_TO_DEVICE);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2361  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2362  	info = ap->skb->tx_skbuff + idx;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2363  	info->skb = tail;
430e55b11e9756 drivers/net/acenic.c                 FUJITA Tomonori    2010-03-31  2364  	dma_unmap_addr_set(info, mapping, mapping);
430e55b11e9756 drivers/net/acenic.c                 FUJITA Tomonori    2010-03-31  2365  	dma_unmap_len_set(info, maplen, skb->len);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2366  	return mapping;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2367  }
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2368  

:::::: The code at line 2360 was first introduced by commit
:::::: f4079e5d72ff973a8c2937e7aa9fc463dc6bcaa2 net: alteon: switch from 'pci_' to 'dma_' API

:::::: TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
