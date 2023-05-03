Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE52927704;
	Wed,  3 May 2023 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683133433; x=1714669433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2UlgMVK12rFSIwNdRPU4T/oyYTu3FSGNPrxLdrLjqk=;
  b=TaUeSf7+SxjY63Py2BQC64IZUKMUR9fTMpvvqFzmYH9ceTACG9msPkX0
   pwq6YQlP9cfCXDnpx/RczCzAInYA48IPbqG024G6s2BaBo4f0Uu7WVIRx
   QQ0NBniJFP91lnSspjPPrNUT6EzhQ60gKcIBgpND8TpHzXy384fXXzAW8
   72wh9Ba4v5XLbB30ZQQvhDXZJekuzwO/n2Zgh6wm5NIpmnx64nqcvF7xU
   7gbGMbHPoUMWJ2rNrzc3ysJsaw03fIxUdFtqjmbuQRY1ujjVYsmAlGARb
   kjhI1fDuuxSJB4vnieyLU9QaEdTl7g6ks/3oHiOd0r5B0FBR5O+CBbm6z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329067134"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="329067134"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 10:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026578335"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="1026578335"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 May 2023 10:03:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puFsy-00029o-2u;
	Wed, 03 May 2023 17:03:24 +0000
Date: Thu, 4 May 2023 01:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 11/12]
 drivers/net/xen-netback/netback.c:692:23: error: incompatible integer to
 pointer conversion passing 'unsigned long' to parameter of type 'const void
 *'
Message-ID: <202305040041.ysofvjPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   042946296cd2b01e67500f6ca02c750fbd5d0046
commit: abe98e4b9a19f13cca92d0121e49563052302103 [11/12] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-randconfig-r001-20230502 (https://download.01.org/0day-ci/archive/20230504/202305040041.ysofvjPz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=abe98e4b9a19f13cca92d0121e49563052302103
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator b4/virt-to-pfn-v6-4-rc1
        git checkout abe98e4b9a19f13cca92d0121e49563052302103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040041.ysofvjPz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/xen-netback/netback.c:692:23: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
                   page = virt_to_page(idx_to_kaddr(queue, pending_idx));
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:364:50: note: expanded from macro 'virt_to_page'
   #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
                                                           ^
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
   #define __pfn_to_page(pfn)      (vmemmap + (pfn))
                                               ^~~
   arch/arm64/include/asm/memory.h:337:53: note: passing argument to parameter 'kaddr' here
   static inline unsigned long virt_to_pfn(const void *kaddr)
                                                       ^
   1 error generated.


vim +692 drivers/net/xen-netback/netback.c

f942dc2552b8bf Ian Campbell 2011-03-15  664  
e9ce7cb6b10740 Wei Liu      2014-06-04  665  static void xenvif_fill_frags(struct xenvif_queue *queue, struct sk_buff *skb)
f942dc2552b8bf Ian Campbell 2011-03-15  666  {
f942dc2552b8bf Ian Campbell 2011-03-15  667  	struct skb_shared_info *shinfo = skb_shinfo(skb);
f942dc2552b8bf Ian Campbell 2011-03-15  668  	int nr_frags = shinfo->nr_frags;
f942dc2552b8bf Ian Campbell 2011-03-15  669  	int i;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  670  	u16 prev_pending_idx = INVALID_PENDING_IDX;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  671  
f942dc2552b8bf Ian Campbell 2011-03-15  672  	for (i = 0; i < nr_frags; i++) {
f942dc2552b8bf Ian Campbell 2011-03-15  673  		skb_frag_t *frag = shinfo->frags + i;
f942dc2552b8bf Ian Campbell 2011-03-15  674  		struct xen_netif_tx_request *txp;
ea066ad158631f Ian Campbell 2011-10-05  675  		struct page *page;
ea066ad158631f Ian Campbell 2011-10-05  676  		u16 pending_idx;
f942dc2552b8bf Ian Campbell 2011-03-15  677  
ea066ad158631f Ian Campbell 2011-10-05  678  		pending_idx = frag_get_pending_idx(frag);
f942dc2552b8bf Ian Campbell 2011-03-15  679  
f53c3fe8dad725 Zoltan Kiss  2014-03-06  680  		/* If this is not the first frag, chain it to the previous*/
bdab82759b8e36 Zoltan Kiss  2014-04-02  681  		if (prev_pending_idx == INVALID_PENDING_IDX)
f53c3fe8dad725 Zoltan Kiss  2014-03-06  682  			skb_shinfo(skb)->destructor_arg =
e9ce7cb6b10740 Wei Liu      2014-06-04  683  				&callback_param(queue, pending_idx);
bdab82759b8e36 Zoltan Kiss  2014-04-02  684  		else
e9ce7cb6b10740 Wei Liu      2014-06-04  685  			callback_param(queue, prev_pending_idx).ctx =
e9ce7cb6b10740 Wei Liu      2014-06-04  686  				&callback_param(queue, pending_idx);
f53c3fe8dad725 Zoltan Kiss  2014-03-06  687  
e9ce7cb6b10740 Wei Liu      2014-06-04  688  		callback_param(queue, pending_idx).ctx = NULL;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  689  		prev_pending_idx = pending_idx;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  690  
e9ce7cb6b10740 Wei Liu      2014-06-04  691  		txp = &queue->pending_tx_info[pending_idx].req;
e9ce7cb6b10740 Wei Liu      2014-06-04 @692  		page = virt_to_page(idx_to_kaddr(queue, pending_idx));
ea066ad158631f Ian Campbell 2011-10-05  693  		__skb_fill_page_desc(skb, i, page, txp->offset, txp->size);
f942dc2552b8bf Ian Campbell 2011-03-15  694  		skb->len += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  695  		skb->data_len += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  696  		skb->truesize += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  697  
f53c3fe8dad725 Zoltan Kiss  2014-03-06  698  		/* Take an extra reference to offset network stack's put_page */
e9ce7cb6b10740 Wei Liu      2014-06-04  699  		get_page(queue->mmap_pages[pending_idx]);
f942dc2552b8bf Ian Campbell 2011-03-15  700  	}
f942dc2552b8bf Ian Campbell 2011-03-15  701  }
f942dc2552b8bf Ian Campbell 2011-03-15  702  

:::::: The code at line 692 was first introduced by commit
:::::: e9ce7cb6b107407e4798e8905b18ad8b642766f6 xen-netback: Factor queue-specific data into queue struct

:::::: TO: Wei Liu <wei.liu2@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
