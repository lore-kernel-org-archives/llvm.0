Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA3AD26;
	Thu,  6 Apr 2023 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680800407; x=1712336407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIo0azXdgfqlfOcBi5QdjLAAS+WMDxslbdBwmI1IcYU=;
  b=BKYTGuYhlISSygb8IW2HE9PLwQZMPwIcVg8Ja69/uttf+W+Dcsv246CV
   eBnjf4IG1W/4FuAq7p8pqkJHdgt6QFVLbI5f/FMmIQM0m7PyKfsQVS+uS
   0Kqu4HWtkzB08Ytx5mt0qO9odSrtWBJqi79Dl3hT/HPNtotaT9Mxg4YVY
   ltWGm0KLKkM1GpINtMpmE44cuAFCCnFQLtllJ/0G2tddk0XWlvhWYTb8W
   Hh5ttGob0QrTiYxbjsf/e0rYuvuYIuv3oDpNXs/E5qLhSn4JAi38b90Kn
   cDTFSjyEENdcpVGN9iWeP7c5X/l7qzZB7fxw8MnOYRgAnUWa4Y6louvaN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323164303"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323164303"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664546492"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664546492"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 10:00:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkSxr-000RXK-24;
	Thu, 06 Apr 2023 16:59:59 +0000
Date: Fri, 7 Apr 2023 00:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 4/56]
 drivers/net/ethernet/google/gve/gve_main.c:1271:11: error: no member named
 'va' in 'struct page_frag_cache'
Message-ID: <202304070036.bbxurxFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   68abe677de847ca05213a704176a7b8a14b02738
commit: c6a6836d1903ed2dae863aeffe775f91b4d2d596 [4/56] mm: Make the page_frag_cache allocator use multipage folios
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070036.bbxurxFa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=c6a6836d1903ed2dae863aeffe775f91b4d2d596
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout c6a6836d1903ed2dae863aeffe775f91b4d2d596
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/google/gve/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070036.bbxurxFa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/google/gve/gve_main.c:1271:11: error: no member named 'va' in 'struct page_frag_cache'
                   if (nc->va) {
                       ~~  ^
   drivers/net/ethernet/google/gve/gve_main.c:1272:45: error: no member named 'va' in 'struct page_frag_cache'
                           __page_frag_cache_drain(virt_to_page(nc->va),
                                                                ~~  ^
   arch/x86/include/asm/page.h:68:46: note: expanded from macro 'virt_to_page'
   #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
                                                    ^~~~~
   arch/x86/include/asm/page.h:41:46: note: expanded from macro '__pa'
   #define __pa(x)         __phys_addr((unsigned long)(x))
                                                       ^
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
   #define __pfn_to_page(pfn)      (vmemmap + (pfn))
                                               ^~~
   drivers/net/ethernet/google/gve/gve_main.c:1274:8: error: no member named 'va' in 'struct page_frag_cache'
                           nc->va = NULL;
                           ~~  ^
   drivers/net/ethernet/google/gve/gve_main.c:2217:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 3 errors generated.


vim +1271 drivers/net/ethernet/google/gve/gve_main.c

75eaae158b1b7d Praveen Kaligineedi 2023-03-15  1263  
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1264  static void gve_drain_page_cache(struct gve_priv *priv)
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1265  {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1266  	struct page_frag_cache *nc;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1267  	int i;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1268  
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1269  	for (i = 0; i < priv->rx_cfg.num_queues; i++) {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1270  		nc = &priv->rx[i].page_cache;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15 @1271  		if (nc->va) {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1272  			__page_frag_cache_drain(virt_to_page(nc->va),
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1273  						nc->pagecnt_bias);
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1274  			nc->va = NULL;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1275  		}
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1276  	}
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1277  }
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1278  

:::::: The code at line 1271 was first introduced by commit
:::::: 39a7f4aa3e4a7947614cf1d5c27abba3300adb1e gve: Add XDP REDIRECT support for GQI-QPL format

:::::: TO: Praveen Kaligineedi <pkaligineedi@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
