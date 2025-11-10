Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807928000B;
	Mon, 10 Nov 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806278; cv=none; b=hpbZXVDGgkmz+sy6Jk/epc40ddstzfdyg2oLudZhUEYDtgvgIoCTEeAIyBXS6uYv8+vBNABKXjZbs9LmIxGqXACimHmwuHj8epERm8wiKZMlpUza1nm9IZb/k4crvn+yiQQu6qPRAFUOGiMy+wItmUpXb92EKbmTQ1wH7kWz0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806278; c=relaxed/simple;
	bh=HG4xZHzhnhKw1LK8sML0aZS5JEtaF7jrHFlxgcmZ93E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBeYhLow/s45T0v8tqPhOm6LD22wxF+JpwOhK8Xzq1BIWVxxwc85GhEsDW8hjq3OhYjsuvQcdKpGGPNZiOtVjcYSs1O9hN4sU980rcjyfviQe39u38R86pXVsjmcab30DzvTcwdKy9JYzpM4BI6nOEBcejEEKlBb9jGDPvrJm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMNek7hH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMNek7hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762806276; x=1794342276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HG4xZHzhnhKw1LK8sML0aZS5JEtaF7jrHFlxgcmZ93E=;
  b=nMNek7hHV0QPR2QZbOaRAq2N/InekFdL+09M1oytRbAIlsoPC9kcADpb
   rBDbu5v2UTXkKKBQmrMl637EKdRKOBAiCpEoSgJscXzdINrftihS0P6Jk
   GwROjOCu6qIyaRscn+2XqqY2ySI5M+OeEMUvlCZstYYYoG1cSnyqG2M7r
   ysRhbmQMX6CGH1vuQVEBpokVyuT7ww06Gb5ep0I/wi81CB9nmVJjRmZKY
   X8+h756wslkr/j8aI6DRuiiRUR+OkJQZsuNT9GRQ/mvWckJbjnayAbLPe
   /tbMeQGgbMUGC1fMZur61TJ6vTz/wiOo7fIbtGUgmu8gMiqWau8bn/mcx
   g==;
X-CSE-ConnectionGUID: nyas9mLsRKOqyVhlLA+Ggg==
X-CSE-MsgGUID: /ijc2WPKQo+Ao/y98ztpHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="87494127"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="87494127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 12:24:36 -0800
X-CSE-ConnectionGUID: tByTOAwpTr29dqYhLveYQQ==
X-CSE-MsgGUID: HX9JjsLHQqO/9gChp8R1Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="219421682"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 12:24:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIYRE-0000xz-0o;
	Mon, 10 Nov 2025 20:24:32 +0000
Date: Tue, 11 Nov 2025 04:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of
 __dma_request_channel()
Message-ID: <202511110425.MwuWYv97-lkp@intel.com>
References: <20251109222944.3222436-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109222944.3222436-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/dmaengine-Use-dma_request_channel-instead-of-__dma_request_channel/20251110-063117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251109222944.3222436-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
config: powerpc-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511110425.MwuWYv97-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110425.MwuWYv97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110425.MwuWYv97-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/dmaengine.c:889:9: error: incompatible pointer types passing 'const dma_cap_mask_t **' to parameter of type 'const dma_cap_mask_t *'; remove & [-Wincompatible-pointer-types]
     889 |         chan = dma_request_channel(mask, NULL, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dmaengine.h:1627:24: note: expanded from macro 'dma_request_channel'
    1627 |         __dma_request_channel(&(mask), x, y, NULL)
         |                               ^~~~~~~
   drivers/dma/dmaengine.c:786:19: note: passing argument to parameter here
     786 | EXPORT_SYMBOL_GPL(__dma_request_channel);
         |                   ^
   1 error generated.


vim +889 drivers/dma/dmaengine.c

   875	
   876	/**
   877	 * dma_request_chan_by_mask - allocate a channel satisfying certain capabilities
   878	 * @mask:	capabilities that the channel must satisfy
   879	 *
   880	 * Returns pointer to appropriate DMA channel on success or an error pointer.
   881	 */
   882	struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
   883	{
   884		struct dma_chan *chan;
   885	
   886		if (!mask)
   887			return ERR_PTR(-ENODEV);
   888	
 > 889		chan = dma_request_channel(mask, NULL, NULL);
   890		if (!chan) {
   891			mutex_lock(&dma_list_mutex);
   892			if (list_empty(&dma_device_list))
   893				chan = ERR_PTR(-EPROBE_DEFER);
   894			else
   895				chan = ERR_PTR(-ENODEV);
   896			mutex_unlock(&dma_list_mutex);
   897		}
   898	
   899		return chan;
   900	}
   901	EXPORT_SYMBOL_GPL(dma_request_chan_by_mask);
   902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
