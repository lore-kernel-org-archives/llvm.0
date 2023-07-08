Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC4A925;
	Sat,  8 Jul 2023 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688844396; x=1720380396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h73p14Pwr2Ja2iCPT7wZ+Is7+VKZvYyK9wvq8H8wi5o=;
  b=Y3bvhjVvQH0vcA8aCvqMAgEEEucPv7KWhwmi8sF5hrOvxgASGw5eCzct
   NhrPJXuouUZW62TOjg+1EO8iByBNyI2K8xeJ33IYmH8uuakW6ZXS3XyBi
   m1eIwcbvwJDcAy5laTLHW8gO1JlIj9JpjafykE/gnjiG5nGkS9GWNwxfx
   sMPqDj3U6ubQV5enZkUBRZeBxS2i7ehLnwzFBdzApj4vOtRSm6GeXqDI2
   CPQoVCta/1YMvAdny3YD2Ty0S77Ui3wZZipLLFfW2uTItg7TJIlYujIko
   YV+LeH2julDUeMeFfLFqf22AkOI/s3I+PPLmXebMHlqyaaf7q+4I57GY5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="353945068"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="353945068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 12:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="670487737"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="670487737"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2023 12:26:33 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIDZh-0002sC-0C;
	Sat, 08 Jul 2023 19:26:33 +0000
Date: Sun, 9 Jul 2023 03:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 9848/9999]
 arch/mips/alchemy/common/dbdma.c:632:7: error: use of undeclared identifier
 'dma_default_coherent'
Message-ID: <202307090359.ifBaEvxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   381518b4a9165cd793599c1668c82079fcbcbe1f
commit: 619672bf2d04cdc1bc3925defd0312c2ef11e5d0 [9848/9999] MIPS: Alchemy: fix dbdma2
config: mips-randconfig-r023-20230708 (https://download.01.org/0day-ci/archive/20230709/202307090359.ifBaEvxm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090359.ifBaEvxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090359.ifBaEvxm-lkp@intel.com/

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
