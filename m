Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1EED2;
	Fri, 15 Sep 2023 02:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694746524; x=1726282524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLKY0hRp8/R8+WbLPIjcPIdpei2Ch16j6F7Zhk8MChQ=;
  b=lSoqb29zOGjQcVHOaKc9tlsWpSIqNGfYkyQeyMTDGIuCYFikqaWmrtDP
   SLCMEwkx59KWW9B8o9MdQFZDGzB4h5kP6GyLDsRn2VzdnWXr+mJVcIfd6
   DcBHP78ILvGeGnDK7FpMVo5Y/Ie6iLJg6cLur5JCHTnd2hC1/QM115hjw
   66/q1nHCnHrpgCzccgXTGA7svNilNg99sZFM6KCZ0ocFEhvlvjoqwpPuB
   bGiYQQ3iUu/NFHSKoGiByJjkOi+aRvq3hj0L3fLueR5jQLKVSv02Yt0T6
   TM4EPHMIdiGVqrUUeWsBRIMDKwQY0cb2VC4CcRyHOXoyaDaL/aaSXj7rV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443202128"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="443202128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 19:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721513511"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="721513511"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Sep 2023 19:55:12 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgyz7-0002LP-2n;
	Fri, 15 Sep 2023 02:55:09 +0000
Date: Fri, 15 Sep 2023 10:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>
Subject: [device-mapper-dm:for-next 2/4]
 drivers/md/persistent-data/dm-extent-allocator.c:530:24: error: expected ';'
 after expression
Message-ID: <202309151023.QPBCNoCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   edcabec81f12dfc9b86b05084bba3232efdc5e4e
commit: 59d814674dd66fc64ba229605174bfe0b8e566d5 [2/4] dm persistent data: Introduce extent allocator
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230915/202309151023.QPBCNoCN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151023.QPBCNoCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151023.QPBCNoCN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/persistent-data/dm-extent-allocator.c:530:24: error: expected ';' after expression
           spin_unlock(&ea->lock)
                                 ^
                                 ;
   drivers/md/persistent-data/dm-extent-allocator.c:544:24: error: expected ';' after expression
           spin_unlock(&ea->lock)
                                 ^
                                 ;
   2 errors generated.


vim +530 drivers/md/persistent-data/dm-extent-allocator.c

   511	
   512	void dm_alloc_context_get(struct dm_extent_allocator *ea,
   513				  struct dm_alloc_context *ac)
   514	{
   515		spin_lock(&ea->lock);
   516		ac->ea = ea;
   517	
   518		ea->nr_allocation_contexts++;
   519	
   520		/*
   521		 * We try and maintain a couple of nodes per alloc context to avoid sharing.
   522		 * If allocation fails it's no big deal; we'll just get more fragmentation.
   523		 */
   524		if (ea->nr_preallocated_nodes < ea->nr_allocation_contexts * 2)
   525			__prealloc_nodes(ea, 2, GFP_NOIO);
   526	
   527		list_add(&ac->list, &ea->allocation_contexts);
   528		INIT_LIST_HEAD(&ac->holders_list);
   529		ac->leaf = NULL;
 > 530		spin_unlock(&ea->lock)
   531	}
   532	EXPORT_SYMBOL_GPL(dm_alloc_context_get);
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
