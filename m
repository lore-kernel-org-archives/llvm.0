Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DD186F;
	Mon, 19 Jun 2023 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687141320; x=1718677320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxeuJ28qA5Cf40oQpPgK+lX3oGeVRGJoqXD3+8a4YGg=;
  b=OrEWSQp+1caSrZvEJ/ViH4EatLKTfg+F+2/oVwDs5FUQIVptlbgMCJP1
   5h+KwaHpOLdhYUYdpT/YERrZRsP7i3x34tmklGwJzcZ7CiwNY+Y/uR/RB
   v5YV957hce1+SAPpO4scHJkI6iYGbGnVWjsOAxN3ziopBz4Syr4/sQ5ZO
   Sf2rgozRkueAxTVfzBoknEiOzxDT7Rbkp8xuOhV4w1gnRrsVs1OYjAFro
   kFXDnZS9lP9nqDr/4NTtS4HTHeadUlb8bQ9sC6Zyqc+r3gHKOjCWA37Zl
   EGWWNFUrnBeSgW8gijZgsvSk/ITb7cpJdDTFiLfmYgwICAuxPl1SxjxiY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="362063646"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="362063646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 19:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="887759390"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="887759390"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2023 19:21:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB4Wj-0004DW-1t;
	Mon, 19 Jun 2023 02:21:57 +0000
Date: Mon, 19 Jun 2023 10:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.10.y 9946/9999]
 arch/mips/alchemy/common/dbdma.c:632:7: error: use of undeclared identifier
 'dma_default_coherent'
Message-ID: <202306191002.BX85xJwV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   b03b7f10db06b3155cb49bad4a1b8b36eaecb8bc
commit: 37e789f7f7324db1566d446574d2b2b5a6c68a7a [9946/9999] MIPS: Alchemy: fix dbdma2
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20230619/202306191002.BX85xJwV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191002.BX85xJwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191002.BX85xJwV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/alchemy/common/dbdma.c:632:7: error: use of undeclared identifier 'dma_default_coherent'
           if (!dma_default_coherent)
                ^
   arch/mips/alchemy/common/dbdma.c:695:7: error: use of undeclared identifier 'dma_default_coherent'
           if (!dma_default_coherent)
                ^
   2 errors generated.


vim +/dma_default_coherent +632 arch/mips/alchemy/common/dbdma.c

   586	
   587	/*
   588	 * Put a source buffer into the DMA ring.
   589	 * This updates the source pointer and byte count.  Normally used
   590	 * for memory to fifo transfers.
   591	 */
   592	u32 au1xxx_dbdma_put_source(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
   593	{
   594		chan_tab_t		*ctp;
   595		au1x_ddma_desc_t	*dp;
   596	
   597		/*
   598		 * I guess we could check this to be within the
   599		 * range of the table......
   600		 */
   601		ctp = *(chan_tab_t **)chanid;
   602	
   603		/*
   604		 * We should have multiple callers for a particular channel,
   605		 * an interrupt doesn't affect this pointer nor the descriptor,
   606		 * so no locking should be needed.
   607		 */
   608		dp = ctp->put_ptr;
   609	
   610		/*
   611		 * If the descriptor is valid, we are way ahead of the DMA
   612		 * engine, so just return an error condition.
   613		 */
   614		if (dp->dscr_cmd0 & DSCR_CMD0_V)
   615			return 0;
   616	
   617		/* Load up buffer address and byte count. */
   618		dp->dscr_source0 = buf & ~0UL;
   619		dp->dscr_cmd1 = nbytes;
   620		/* Check flags */
   621		if (flags & DDMA_FLAGS_IE)
   622			dp->dscr_cmd0 |= DSCR_CMD0_IE;
   623		if (flags & DDMA_FLAGS_NOIE)
   624			dp->dscr_cmd0 &= ~DSCR_CMD0_IE;
   625	
   626		/*
   627		 * There is an erratum on certain Au1200/Au1550 revisions that could
   628		 * result in "stale" data being DMA'ed. It has to do with the snoop
   629		 * logic on the cache eviction buffer.  dma_default_coherent is set
   630		 * to false on these parts.
   631		 */
 > 632		if (!dma_default_coherent)
   633			dma_cache_wback_inv(KSEG0ADDR(buf), nbytes);
   634		dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
   635		wmb(); /* drain writebuffer */
   636		dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
   637		ctp->chan_ptr->ddma_dbell = 0;
   638		wmb(); /* force doorbell write out to dma engine */
   639	
   640		/* Get next descriptor pointer. */
   641		ctp->put_ptr = phys_to_virt(DSCR_GET_NXTPTR(dp->dscr_nxtptr));
   642	
   643		/* Return something non-zero. */
   644		return nbytes;
   645	}
   646	EXPORT_SYMBOL(au1xxx_dbdma_put_source);
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
