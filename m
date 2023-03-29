Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985167B;
	Wed, 29 Mar 2023 02:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680056853; x=1711592853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=achCbhQ67jEto55XySYRGN7StNhkA8ld6XXQldWF7+U=;
  b=mWVOLhf4Hrzesf0oUfystwuCqf7Qi/rfjl8VqeKJqvkUlclBPMJyDQff
   mGvmmlAFC7iZmPojvdreJPfI76ltfjQtgbnQxs2vcY5BBReO/kAETr4sB
   VdRH3cNcbJWsq8TxP3GsEzKoW8vMcSN3H0zzEKyUABGwU1fRUSdyH8qKM
   ukK6if3Hxn71jO4gsMZwW1HtW4QNXhpbiaCbl2nvaUPxNwqSw9vELCCd9
   L5nmCBjNzEuQ34UUBOAzYWSksn4tF4+s7hXW4lDKRgDBGxaAJplynkRPw
   Yo6YZHHFAup5505ZYlMm6MeUCidNDWKcmwowWHygrPeVk7oF3iSEzIc22
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="324653366"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="324653366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 19:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="795043233"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="795043233"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2023 19:27:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phLX9-000J6J-0M;
	Wed, 29 Mar 2023 02:27:31 +0000
Date: Wed, 29 Mar 2023 10:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 7/8]
 drivers/net/xen-netback/netback.c:671:23: error: incompatible integer to
 pointer conversion passing 'unsigned long' to parameter of type 'const void
 *'
Message-ID: <202303291026.ZZrWLTH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: 60f9989b35b939232c61e3e886c921b38584d834 [7/8] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-randconfig-r014-20230327 (https://download.01.org/0day-ci/archive/20230329/202303291026.ZZrWLTH5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=60f9989b35b939232c61e3e886c921b38584d834
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout 60f9989b35b939232c61e3e886c921b38584d834
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/dsa/ drivers/net/xen-netback/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291026.ZZrWLTH5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/xen-netback/netback.c:671:23: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
                   page = virt_to_page(idx_to_kaddr(queue, pending_idx));
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:362:50: note: expanded from macro 'virt_to_page'
   #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
                                                           ^
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
   #define __pfn_to_page(pfn)      (vmemmap + (pfn))
                                               ^~~
   arch/arm64/include/asm/memory.h:335:53: note: passing argument to parameter 'kaddr' here
   static inline unsigned long virt_to_pfn(const void *kaddr)
                                                       ^
   1 error generated.


vim +671 drivers/net/xen-netback/netback.c

f942dc2552b8bf Ian Campbell 2011-03-15  643  
e9ce7cb6b10740 Wei Liu      2014-06-04  644  static void xenvif_fill_frags(struct xenvif_queue *queue, struct sk_buff *skb)
f942dc2552b8bf Ian Campbell 2011-03-15  645  {
f942dc2552b8bf Ian Campbell 2011-03-15  646  	struct skb_shared_info *shinfo = skb_shinfo(skb);
f942dc2552b8bf Ian Campbell 2011-03-15  647  	int nr_frags = shinfo->nr_frags;
f942dc2552b8bf Ian Campbell 2011-03-15  648  	int i;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  649  	u16 prev_pending_idx = INVALID_PENDING_IDX;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  650  
f942dc2552b8bf Ian Campbell 2011-03-15  651  	for (i = 0; i < nr_frags; i++) {
f942dc2552b8bf Ian Campbell 2011-03-15  652  		skb_frag_t *frag = shinfo->frags + i;
f942dc2552b8bf Ian Campbell 2011-03-15  653  		struct xen_netif_tx_request *txp;
ea066ad158631f Ian Campbell 2011-10-05  654  		struct page *page;
ea066ad158631f Ian Campbell 2011-10-05  655  		u16 pending_idx;
f942dc2552b8bf Ian Campbell 2011-03-15  656  
ea066ad158631f Ian Campbell 2011-10-05  657  		pending_idx = frag_get_pending_idx(frag);
f942dc2552b8bf Ian Campbell 2011-03-15  658  
f53c3fe8dad725 Zoltan Kiss  2014-03-06  659  		/* If this is not the first frag, chain it to the previous*/
bdab82759b8e36 Zoltan Kiss  2014-04-02  660  		if (prev_pending_idx == INVALID_PENDING_IDX)
f53c3fe8dad725 Zoltan Kiss  2014-03-06  661  			skb_shinfo(skb)->destructor_arg =
e9ce7cb6b10740 Wei Liu      2014-06-04  662  				&callback_param(queue, pending_idx);
bdab82759b8e36 Zoltan Kiss  2014-04-02  663  		else
e9ce7cb6b10740 Wei Liu      2014-06-04  664  			callback_param(queue, prev_pending_idx).ctx =
e9ce7cb6b10740 Wei Liu      2014-06-04  665  				&callback_param(queue, pending_idx);
f53c3fe8dad725 Zoltan Kiss  2014-03-06  666  
e9ce7cb6b10740 Wei Liu      2014-06-04  667  		callback_param(queue, pending_idx).ctx = NULL;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  668  		prev_pending_idx = pending_idx;
f53c3fe8dad725 Zoltan Kiss  2014-03-06  669  
e9ce7cb6b10740 Wei Liu      2014-06-04  670  		txp = &queue->pending_tx_info[pending_idx].req;
e9ce7cb6b10740 Wei Liu      2014-06-04 @671  		page = virt_to_page(idx_to_kaddr(queue, pending_idx));
ea066ad158631f Ian Campbell 2011-10-05  672  		__skb_fill_page_desc(skb, i, page, txp->offset, txp->size);
f942dc2552b8bf Ian Campbell 2011-03-15  673  		skb->len += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  674  		skb->data_len += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  675  		skb->truesize += txp->size;
f942dc2552b8bf Ian Campbell 2011-03-15  676  
f53c3fe8dad725 Zoltan Kiss  2014-03-06  677  		/* Take an extra reference to offset network stack's put_page */
e9ce7cb6b10740 Wei Liu      2014-06-04  678  		get_page(queue->mmap_pages[pending_idx]);
f942dc2552b8bf Ian Campbell 2011-03-15  679  	}
f942dc2552b8bf Ian Campbell 2011-03-15  680  }
f942dc2552b8bf Ian Campbell 2011-03-15  681  

:::::: The code at line 671 was first introduced by commit
:::::: e9ce7cb6b107407e4798e8905b18ad8b642766f6 xen-netback: Factor queue-specific data into queue struct

:::::: TO: Wei Liu <wei.liu2@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
