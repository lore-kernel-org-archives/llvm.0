Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10E4134A2;
	Tue,  8 Aug 2023 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691509115; x=1723045115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgQ8vLnXeVYjjORMmCVqMdzawcHqzARmozpW2maYf9E=;
  b=fM/mRnJmC+ih7FPlRkz9gw92dttvZxZvCfvmAd0rDgN4f/Vc2FsdTs5D
   LbNkqMrwfYCCO2RQxH8AGCUrXCeb1MhRIK7yljnJGsG7LhtdqgDPJfnfE
   rKIHUPwjil+IfC2A6sUD6XF3WqW9pxcvSjhp4DMVgTA6aNdcSpqhVI1L2
   I8ruea7adYP7T+LqgCV4UAtbm7NiSOYCO0iS/DbbRNSx+dp9TvaQWi2my
   Edq8BNNdzla/U44OItAiXYLVV32ACceGAfKgujIbHUJdtfCF9+1CeubE+
   PjzDIGx3PdCg3+wQdlJ4GE3FNTyPXTSp8RPEHPPOVeKFMxUximJqDxr3I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350450918"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="350450918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 08:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734579883"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="734579883"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 08:38:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTOmZ-0005QO-0Q;
	Tue, 08 Aug 2023 15:38:03 +0000
Date: Tue, 8 Aug 2023 23:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 3/5] ld.lld: error: undefined symbol:
 kmem_cache_setup_percpu_array
Message-ID: <202308082343.iwu8K2kE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: d8feeb2f5066b99e1bfc6cdd23297ab01ba98e25 [3/5] maple_tree: use slub percpu array
config: hexagon-randconfig-r026-20230808 (https://download.01.org/0day-ci/archive/20230808/202308082343.iwu8K2kE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308082343.iwu8K2kE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308082343.iwu8K2kE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kmem_cache_setup_percpu_array
   >>> referenced by maple_tree.c:6189 (lib/maple_tree.c:6189)
   >>>               maple_tree.o:(maple_tree_init) in archive lib/lib.a
   >>> referenced by maple_tree.c:6189 (lib/maple_tree.c:6189)
   >>>               maple_tree.o:(maple_tree_init) in archive lib/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
