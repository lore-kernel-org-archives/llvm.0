Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183F28FE
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649853677; x=1681389677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kygg0jvQzZ7rbnwl4I6R7v01TkLwmZRfCasLFD62+aQ=;
  b=JmUTe01qd+szz5ZA+29S9ItxteTkhwHub0kIIKujKLNcINLcc1R9P0Dh
   qrDJMjOUsJdIJl4CA0jgJ3ZQdf9+GDj60JRhvUeWkQ+3d5mbhOOtiSY7P
   jXSujdkMo/SaW3yC1ZX3LaI/8r6DoP44hb/Xul/CUQgbUT0rWSjrnxdJe
   dKZdaDKYxr9trKnmAVMD03C066bdsxF76ZybnR3ooz9aKtdwrR5ERrkzu
   cHxQScGJ1U6WV7itn3go+BVF1NmXvb4PpS7QU3UH0q4XHBmv5EwE9mMTS
   TozyxsLt3eBbk0yRvIq14pDaMVh6W/Fs/NEIh3Htyuk7uuk4KZ3rC7IWM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="323096173"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="323096173"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 05:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700230868"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2022 05:41:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1necJ8-0000HU-JR;
	Wed, 13 Apr 2022 12:41:14 +0000
Date: Wed, 13 Apr 2022 20:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next v3 14/18] sfc: Remove usage of list iterator for
 list_add() after the loop body
Message-ID: <202204132006.lzf9FA9Y-lkp@intel.com>
References: <20220412121557.3553555-15-jakobkoschel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412121557.3553555-15-jakobkoschel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jakob,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakob-Koschel/Remove-use-of-list-iterator-after-loop-body/20220412-203605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git b66bfc131c69bd9a5ed3ae90be4cf47ec46c1526
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220413/202204132006.lzf9FA9Y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/37e6782c31906d38fba33faf3b6d7af0c463598e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakob-Koschel/Remove-use-of-list-iterator-after-loop-body/20220412-203605
        git checkout 37e6782c31906d38fba33faf3b6d7af0c463598e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/sfc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/sfc/rx_common.c:561:28: error: use of undeclared identifier 'pos'
           struct list_head *head = *pos = &efx->rss_context.list;
                                     ^
   drivers/net/ethernet/sfc/rx_common.c:570:4: error: use of undeclared identifier 'pos'
                           pos = &ctx->list;
                           ^
   drivers/net/ethernet/sfc/rx_common.c:590:28: error: use of undeclared identifier 'pos'
           list_add_tail(&new->list, pos);
                                     ^
   3 errors generated.


vim +/pos +561 drivers/net/ethernet/sfc/rx_common.c

   555	
   556	/* RSS contexts.  We're using linked lists and crappy O(n) algorithms, because
   557	 * (a) this is an infrequent control-plane operation and (b) n is small (max 64)
   558	 */
   559	struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
   560	{
 > 561		struct list_head *head = *pos = &efx->rss_context.list;
   562		struct efx_rss_context *ctx, *new;
   563		u32 id = 1; /* Don't use zero, that refers to the master RSS context */
   564	
   565		WARN_ON(!mutex_is_locked(&efx->rss_lock));
   566	
   567		/* Search for first gap in the numbering */
   568		list_for_each_entry(ctx, head, list) {
   569			if (ctx->user_id != id) {
   570				pos = &ctx->list;
   571				break;
   572			}
   573			id++;
   574			/* Check for wrap.  If this happens, we have nearly 2^32
   575			 * allocated RSS contexts, which seems unlikely.
   576			 */
   577			if (WARN_ON_ONCE(!id))
   578				return NULL;
   579		}
   580	
   581		/* Create the new entry */
   582		new = kmalloc(sizeof(*new), GFP_KERNEL);
   583		if (!new)
   584			return NULL;
   585		new->context_id = EFX_MCDI_RSS_CONTEXT_INVALID;
   586		new->rx_hash_udp_4tuple = false;
   587	
   588		/* Insert the new entry into the gap */
   589		new->user_id = id;
   590		list_add_tail(&new->list, pos);
   591		return new;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
