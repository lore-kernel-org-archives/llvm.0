Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A3231835;
	Mon, 16 Jun 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068413; cv=none; b=INkwYbCVbeqjUDeuXFeH4SSfmXP+T9h3P7Q4A3sGQimWcZRlQ9sb7ScwBae+xNF834RYVPAL9opRL1vIT17Ag5jbSnALdGjGN2trsfMVnuUscLsyXvHDc60q6bB/ekDVbktQWij09lVRVmd2hZSo76YvllG+vqPNnYbRPUQ6eR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068413; c=relaxed/simple;
	bh=tKgiGHHemU6LZ8Tp4hRworSk7Y+ekah5B8xXdkidKSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hk5zY7X19pQQzX0vlCtqJ+h9nIfB8rxNIMqfrC3Lvgcn7XYTd1YHB5bytux4ypSs61G/NfjLu7FXSxnKgcpmZsFiyM2Bleg6eIDMARGS6VYaYVpLK9R42jNUpIOEcVjJoepxsjtC8VhkS51m8HF56tC39IvhNeLbgqtnWIh4cGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPPsRXTR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPPsRXTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750068411; x=1781604411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKgiGHHemU6LZ8Tp4hRworSk7Y+ekah5B8xXdkidKSE=;
  b=CPPsRXTRII4WscX6wzQhMw4QTefoNqFl6pSHftH88HoSEp5JdLZE3hxR
   aMtzhgePQ6jikC/RrrJ1rWRX1ExKeP2uH1rmFq5eUpDRfMQ2pOYzHLNT+
   /2Gj5aTg10iMRxVGSi3TVtsXmEROxEvrWeWfkuhZHpsyqHrezF2RuAvPl
   sHWj3G2sK3voEXBhlo/i6CVntRjh7CEGK7jqs3yFLWHIRDRtZ25Bcn6EW
   8I4Z9nwh/uFClTSfxqyNGUUWoYndUtdnBXAe0aW3WkEFzJ2yAW3QcZV1A
   jCqn9LQUMHv5GCupVlmGH742IG6PZtzcShYKUVKw/3mF6Xhf6wULvnMk/
   A==;
X-CSE-ConnectionGUID: iG6EZMNGR2O0dVl9TlVZOA==
X-CSE-MsgGUID: HbCtNPl8TTqqqB8HnIstjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74737987"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="74737987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 03:06:43 -0700
X-CSE-ConnectionGUID: 8K4uaiszTAG4cKvm9sXMag==
X-CSE-MsgGUID: 9nIrNpxbTZeuCw89XL78DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153300242"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2025 03:06:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR6je-000Euu-2q;
	Mon, 16 Jun 2025 10:06:38 +0000
Date: Mon, 16 Jun 2025 18:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn-type 1/5]
 drivers/misc/genwqe/card_base.h:154:6: error: redefinition of
 'dma_mapping_type'
Message-ID: <202506161857.kd6UYvnU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn-type
head:   87481a3ed31857c530009e3a934f3b0a5e069f9e
commit: 84d24bf3741b926f7b79b46347460779a4b3e52d [1/5] dma-mapping: Define DMA transaction address types
config: x86_64-buildonly-randconfig-001-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161857.kd6UYvnU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161857.kd6UYvnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161857.kd6UYvnU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/genwqe/card_base.c:32:
>> drivers/misc/genwqe/card_base.h:154:6: error: redefinition of 'dma_mapping_type'
     154 | enum dma_mapping_type {
         |      ^
   include/linux/dma-mapping.h:91:6: note: previous definition is here
      91 | enum dma_mapping_type {
         |      ^
   drivers/misc/genwqe/card_base.c:1112:47: warning: shift count >= width of type [-Wshift-count-overflow]
    1112 |         if (dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64)) &&
         |                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/misc/genwqe/card_utils.c:33:
>> drivers/misc/genwqe/card_base.h:154:6: error: redefinition of 'dma_mapping_type'
     154 | enum dma_mapping_type {
         |      ^
   include/linux/dma-mapping.h:91:6: note: previous definition is here
      91 | enum dma_mapping_type {
         |      ^
   1 error generated.


vim +/dma_mapping_type +154 drivers/misc/genwqe/card_base.h

12eb4683251ebfb Frank Haverkamp 2013-12-09  103  
12eb4683251ebfb Frank Haverkamp 2013-12-09  104  /*
12eb4683251ebfb Frank Haverkamp 2013-12-09  105   * Genwqe card description and management data.
12eb4683251ebfb Frank Haverkamp 2013-12-09  106   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  107   * Error-handling in case of card malfunction
12eb4683251ebfb Frank Haverkamp 2013-12-09  108   * ------------------------------------------
12eb4683251ebfb Frank Haverkamp 2013-12-09  109   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  110   * If the card is detected to be defective the outside environment
12eb4683251ebfb Frank Haverkamp 2013-12-09  111   * will cause the PCI layer to call deinit (the cleanup function for
12eb4683251ebfb Frank Haverkamp 2013-12-09  112   * probe). This is the same effect like doing a unbind/bind operation
12eb4683251ebfb Frank Haverkamp 2013-12-09  113   * on the card.
12eb4683251ebfb Frank Haverkamp 2013-12-09  114   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  115   * The genwqe card driver implements a health checking thread which
12eb4683251ebfb Frank Haverkamp 2013-12-09  116   * verifies the card function. If this detects a problem the cards
12eb4683251ebfb Frank Haverkamp 2013-12-09  117   * device is being shutdown and restarted again, along with a reset of
12eb4683251ebfb Frank Haverkamp 2013-12-09  118   * the card and queue.
12eb4683251ebfb Frank Haverkamp 2013-12-09  119   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  120   * All functions accessing the card device return either -EIO or -ENODEV
12eb4683251ebfb Frank Haverkamp 2013-12-09  121   * code to indicate the malfunction to the user. The user has to close
12eb4683251ebfb Frank Haverkamp 2013-12-09  122   * the file descriptor and open a new one, once the card becomes
12eb4683251ebfb Frank Haverkamp 2013-12-09  123   * available again.
12eb4683251ebfb Frank Haverkamp 2013-12-09  124   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  125   * If the open file descriptor is setup to receive SIGIO, the signal is
12eb4683251ebfb Frank Haverkamp 2013-12-09  126   * genereated for the application which has to provide a handler to
12eb4683251ebfb Frank Haverkamp 2013-12-09  127   * react on it. If the application does not close the open
12eb4683251ebfb Frank Haverkamp 2013-12-09  128   * file descriptor a SIGKILL is send to enforce freeing the cards
12eb4683251ebfb Frank Haverkamp 2013-12-09  129   * resources.
12eb4683251ebfb Frank Haverkamp 2013-12-09  130   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  131   * I did not find a different way to prevent kernel problems due to
12eb4683251ebfb Frank Haverkamp 2013-12-09  132   * reference counters for the cards character devices getting out of
12eb4683251ebfb Frank Haverkamp 2013-12-09  133   * sync. The character device deallocation does not block, even if
12eb4683251ebfb Frank Haverkamp 2013-12-09  134   * there is still an open file descriptor pending. If this pending
12eb4683251ebfb Frank Haverkamp 2013-12-09  135   * descriptor is closed, the data structures used by the character
12eb4683251ebfb Frank Haverkamp 2013-12-09  136   * device is reinstantiated, which will lead to the reference counter
12eb4683251ebfb Frank Haverkamp 2013-12-09  137   * dropping below the allowed values.
12eb4683251ebfb Frank Haverkamp 2013-12-09  138   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  139   * Card recovery
12eb4683251ebfb Frank Haverkamp 2013-12-09  140   * -------------
12eb4683251ebfb Frank Haverkamp 2013-12-09  141   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  142   * To test the internal driver recovery the following command can be used:
12eb4683251ebfb Frank Haverkamp 2013-12-09  143   *   sudo sh -c 'echo 0xfffff > /sys/class/genwqe/genwqe0_card/err_inject'
12eb4683251ebfb Frank Haverkamp 2013-12-09  144   */
12eb4683251ebfb Frank Haverkamp 2013-12-09  145  
12eb4683251ebfb Frank Haverkamp 2013-12-09  146  
12eb4683251ebfb Frank Haverkamp 2013-12-09  147  /**
12eb4683251ebfb Frank Haverkamp 2013-12-09  148   * struct dma_mapping_type - Mapping type definition
12eb4683251ebfb Frank Haverkamp 2013-12-09  149   *
12eb4683251ebfb Frank Haverkamp 2013-12-09  150   * To avoid memcpying data arround we use user memory directly. To do
12eb4683251ebfb Frank Haverkamp 2013-12-09  151   * this we need to pin/swap-in the memory and request a DMA address
12eb4683251ebfb Frank Haverkamp 2013-12-09  152   * for it.
12eb4683251ebfb Frank Haverkamp 2013-12-09  153   */
12eb4683251ebfb Frank Haverkamp 2013-12-09 @154  enum dma_mapping_type {
12eb4683251ebfb Frank Haverkamp 2013-12-09  155  	GENWQE_MAPPING_RAW = 0,		/* contignous memory buffer */
12eb4683251ebfb Frank Haverkamp 2013-12-09  156  	GENWQE_MAPPING_SGL_TEMP,	/* sglist dynamically used */
12eb4683251ebfb Frank Haverkamp 2013-12-09  157  	GENWQE_MAPPING_SGL_PINNED,	/* sglist used with pinning */
12eb4683251ebfb Frank Haverkamp 2013-12-09  158  };
12eb4683251ebfb Frank Haverkamp 2013-12-09  159  

:::::: The code at line 154 was first introduced by commit
:::::: 12eb4683251ebfb12afba9c56556fade7a3d7372 GenWQE PCI support, health monitoring and recovery

:::::: TO: Frank Haverkamp <haver@linux.vnet.ibm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
