Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF8361;
	Sun,  1 Oct 2023 02:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696129172; x=1727665172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cF4xsJ+QGh23hP9HxqIqqh5So0ThEb2qXawGzp2SM+M=;
  b=E72o4u02x8A4mabF6KoG+DeyxmuTMGrjySSsH8UrNSWtpULEeZ4DCXYc
   fohzS++0ZNykNqvXwQnZrdcICom9y41beKnYFBSOUkF8c96g7l6lhB6nB
   CcVNMdpjnkaB52D6xyHdlGiNenNdPmfEeebLLlKZrvPXVAvlO7oVWjX2h
   x2NSXUGsAH7jNnrFizTvzbcl0H0uoxNIE2/eclHFC+PP3WyDtgBahAwxu
   28fdQ9CRcjGIuZDwzNn827n9RB1lSHbvocZilRmjYSGBm6nwkRn/9+4a4
   eYS+cP3CaJGeVwNImZBlFRSd6ClRsXkq4EMP/DPBphWlnI3YboN8wH1TU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="448978271"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="448978271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 19:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1194842"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2023 19:58:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmmg3-0004h7-2T;
	Sun, 01 Oct 2023 02:59:27 +0000
Date: Sun, 1 Oct 2023 10:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fixup: mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
Message-ID: <202310011038.Q1iDUi0v-lkp@intel.com>
References: <20230928141517.12164-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928141517.12164-1-zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20230929]
[cannot apply to linus/master v6.6-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/fixup-mm-shrinker-add-a-secondary-array-for-shrinker_info-map-nr_deferred/20230928-221637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230928141517.12164-1-zhengqi.arch%40bytedance.com
patch subject: [PATCH] fixup: mm: shrinker: add a secondary array for shrinker_info::{map, nr_deferred}
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231001/202310011038.Q1iDUi0v-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011038.Q1iDUi0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011038.Q1iDUi0v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shrinker.c:99:12: error: use of undeclared identifier 'shrinker_rwsem'
           up_write(&shrinker_rwsem);
                     ^
   1 error generated.


vim +/shrinker_rwsem +99 mm/shrinker.c

    76	
    77	int alloc_shrinker_info(struct mem_cgroup *memcg)
    78	{
    79		struct shrinker_info *info;
    80		int nid, ret = 0;
    81		int array_size = 0;
    82	
    83		mutex_lock(&shrinker_mutex);
    84		array_size = shrinker_unit_size(shrinker_nr_max);
    85		for_each_node(nid) {
    86			info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
    87			if (!info)
    88				goto err;
    89			info->map_nr_max = shrinker_nr_max;
    90			if (shrinker_unit_alloc(info, NULL, nid))
    91				goto err;
    92			rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
    93		}
    94		mutex_unlock(&shrinker_mutex);
    95	
    96		return ret;
    97	
    98	err:
  > 99		up_write(&shrinker_rwsem);
   100		free_shrinker_info(memcg);
   101		return -ENOMEM;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
