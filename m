Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807831E7C19;
	Wed, 30 Jul 2025 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753904651; cv=none; b=Eh8waczJruukkuUs4YqMDi2zEwH439xPUjRgVu1kTYave6C2dpEoatf+EYoncGG5QSS/2pzL0aVAXqEvV8RuQxLvstQnAYUCRHTfRwOCCteGfY/S8G9CcG2mXdij0i6Qrh6TW7FSQgYf4vow/65iiQuvhxqkw9YlJ4J1480QkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753904651; c=relaxed/simple;
	bh=ASw2LEonGX9FVWSZ4sCVDAIlxaxsqwTPpVp0huFlEIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCPxAbxBtKvJ04L9VUg9Intdzn130Kyyof8Zs9k5DexfyjoUR3ZcHhS/D+2yF/a5NsApyFaRPcDw9LVWWPV1AO/CtTp/BpI0CmPASDxplMUrkTrFaw7YbQSgjgZ98L1N0J690Fkbnx+twjPGlDnNFAbcDGzTUs+1fiXys3Kr2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXNJmJ1g; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXNJmJ1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753904649; x=1785440649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ASw2LEonGX9FVWSZ4sCVDAIlxaxsqwTPpVp0huFlEIg=;
  b=eXNJmJ1gqwAeeQEb0LNJCHUxmplUXUj6VAGHvv/45i1+SLUx5FiDSq9y
   X4DGcLHJZZW2rSU/r73cmzqh3ZvSVhI7GENdTMhcdsoUzjU6hLbF4OmFP
   yrvRKs9LCwLuRswNC4G8Y7YH3AF79Tzo4V50RkP1PyKNPuyhqmR3M4k1M
   4zd48ZPHqnKx3pShA2stKxDU2sJvXIA0dnAydosEhf6tvdJwYhmjYXVqW
   QJ8nz6VfcHf4pVxwE4TufdFt6v4BGVjBJFe0LegVqV5LZfxka4dJHTy9M
   H5ZD6C3dNMS4aj78DDQzHvbppWnzUsm7koDNKqZpP45zSU8+PyVdQYfrU
   Q==;
X-CSE-ConnectionGUID: RS+yNi8FTJGigyKWYQzZGQ==
X-CSE-MsgGUID: XEuFS8ssQsS1Mwre/8jPHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56308268"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56308268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 12:44:08 -0700
X-CSE-ConnectionGUID: 9L8abYuzSCCzI4mhmeYXjg==
X-CSE-MsgGUID: A8+2pdSEQfCc2zhSz5ZSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163861146"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2025 12:44:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhCiZ-00035k-24;
	Wed, 30 Jul 2025 19:44:03 +0000
Date: Thu, 31 Jul 2025 03:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel
 pass a cookie to of_xlate
Message-ID: <202507310336.MGXNWyoj-lkp@intel.com>
References: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>

Hi Konrad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 79fb37f39b77bbf9a56304e9af843cd93a7a1916]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-dma-qcom-gpi-Retire-passing-the-protocol-ID/20250730-173806
base:   79fb37f39b77bbf9a56304e9af843cd93a7a1916
patch link:    https://lore.kernel.org/r/20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f%40oss.qualcomm.com
patch subject: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel pass a cookie to of_xlate
config: i386-buildonly-randconfig-003-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310336.MGXNWyoj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310336.MGXNWyoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310336.MGXNWyoj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-mxs.c:26:
>> include/linux/dmaengine.h:1555:18: warning: no previous prototype for function 'dma_request_chan_w_data' [-Wmissing-prototypes]
    1555 | struct dma_chan *dma_request_chan_w_data(struct device *dev,
         |                  ^
   include/linux/dmaengine.h:1555:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1555 | struct dma_chan *dma_request_chan_w_data(struct device *dev,
         | ^
         | static 
   1 warning generated.


vim +/dma_request_chan_w_data +1555 include/linux/dmaengine.h

  1529	
  1530	void dma_release_channel(struct dma_chan *chan);
  1531	int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
  1532	#else
  1533	static inline struct dma_chan *dma_find_channel(enum dma_transaction_type tx_type)
  1534	{
  1535		return NULL;
  1536	}
  1537	static inline enum dma_status dma_sync_wait(struct dma_chan *chan, dma_cookie_t cookie)
  1538	{
  1539		return DMA_COMPLETE;
  1540	}
  1541	static inline enum dma_status dma_wait_for_async_tx(struct dma_async_tx_descriptor *tx)
  1542	{
  1543		return DMA_COMPLETE;
  1544	}
  1545	static inline void dma_issue_pending_all(void)
  1546	{
  1547	}
  1548	static inline struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
  1549							     dma_filter_fn fn,
  1550							     void *fn_param,
  1551							     struct device_node *np)
  1552	{
  1553		return NULL;
  1554	}
> 1555	struct dma_chan *dma_request_chan_w_data(struct device *dev,
  1556						 const char *name,
  1557						 void *data)
  1558	{
  1559		return ERR_PTR(-ENODEV);
  1560	}
  1561	static inline struct dma_chan *dma_request_chan(struct device *dev,
  1562							const char *name)
  1563	{
  1564		return ERR_PTR(-ENODEV);
  1565	}
  1566	static inline struct dma_chan *dma_request_chan_by_mask(
  1567							const dma_cap_mask_t *mask)
  1568	{
  1569		return ERR_PTR(-ENODEV);
  1570	}
  1571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
