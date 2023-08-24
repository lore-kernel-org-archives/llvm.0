Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DB97E;
	Thu, 24 Aug 2023 23:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692921050; x=1724457050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4VFOJbtovw2DN+qXbHP4f3kJSN5/g9kvpuxGRhrGok=;
  b=P4/3lRvVrjdfxfQA8zbPAuZXwG+42NAdbi4Wh6MjxV4wrmba+mJQPnwY
   2WEUMs0sgKqNIDjuRu95aYIfAiyh+cOY/r6LrJqS2EbSj6N6Rk+2z0Saj
   EGAmqlUd5xXMWp6PcFXEPVa6YafXvYJf9jTi/xEHbs8BUZT4ubJmWe2Sq
   ca68eklkcXpypt7pmxuJIAKYlFYx7CKC2YUXBKb4VzyNVDMMnTUtrdQ1J
   nX7um+gw+Y+OD4TCEvXdRV32qmd6h6PpOxKdn8flLULHQCPPD8DbypYS/
   URSJ1xQHPmLlA1WO9kuKZ28WejhkO3W0VFmYIIiB0a5HsQy3rTisOpGBB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438532203"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438532203"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 16:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687078982"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="687078982"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 16:50:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZK68-00033K-1P;
	Thu, 24 Aug 2023 23:50:45 +0000
Date: Fri, 25 Aug 2023 07:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 9024/9999]
 arch/mips/alchemy/common/dbdma.c:632:7: error: use of undeclared identifier
 'dma_default_coherent'
Message-ID: <202308250714.HOhcCYxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: 619672bf2d04cdc1bc3925defd0312c2ef11e5d0 [9024/9999] MIPS: Alchemy: fix dbdma2
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20230825/202308250714.HOhcCYxf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250714.HOhcCYxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250714.HOhcCYxf-lkp@intel.com/

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
