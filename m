Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A81FB7;
	Tue, 25 Jul 2023 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690254178; x=1721790178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ODPAsqJocpzeNBmu2pe09nw3fQT5wS3+dXTq738Ai0=;
  b=lEa37uFbBmKmBvk8V0P1nkObsWqC5yOJQoo2V92lFT6LGJtRx30zUo0/
   JXB5h/ZzFCTuqMMoO5bvkynTqUI2lVDT0o5/IPx/OlJL7eMvHNuCI5aFl
   VBKErAjBBiA1V2rnJ+RTRAHGrJK644fK7sz4OQRKr91BmXk32i11GQRp7
   hO1ZlrDJZbYsSEPIavfHoRg4+RHyKBaMPE3Jzlz3igAJ3ppcLpEpBd3QC
   CN2gbjZSW6bThGiwO5h1R32OXxGTGoiHiI3QD4gHH1cufdcvvnw0M40ST
   tHN/uoKZSeeTCtoIdsg2W/TaxknJZ+N9Zd6WHuI0qwH0jUUxhpYc3DGYo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366490789"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="366490789"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 20:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849835403"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="849835403"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 20:02:55 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8Jx-000AFm-35;
	Tue, 25 Jul 2023 03:02:47 +0000
Date: Tue, 25 Jul 2023 11:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 9844/9999]
 arch/mips/alchemy/common/dbdma.c:632:7: error: use of undeclared identifier
 'dma_default_coherent'
Message-ID: <202307251038.3Olk0EwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manuel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   140d69b4e41d185d886880460461fab70f3b5e84
commit: 619672bf2d04cdc1bc3925defd0312c2ef11e5d0 [9844/9999] MIPS: Alchemy: fix dbdma2
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20230725/202307251038.3Olk0EwW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251038.3Olk0EwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251038.3Olk0EwW-lkp@intel.com/

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
