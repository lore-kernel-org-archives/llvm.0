Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E322F11;
	Wed, 13 Sep 2023 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694608305; x=1726144305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5NgqrTJ0esIoPR+LBJ3A85VBN5lGxnXjuGhgMNZkfw=;
  b=jDNBVsqh/qjUV1G9n5NLOSKdiU9/2U41G6/8YG34ogJyh/pbP98z/hMc
   IJBSX50n1rTVYXkKw/sGCMkX0Ir+ow4W2DOWJTuqAC6jYrJw1bRwRZKT6
   GtTJHFr6FDp6O/8RkCfY1SSWBE7XaNVt8xxPHcDNSnoev5bQX2fDhXxzP
   ide5Ua+w+IefSXMFnGiVQlgArfMJltA74UK5twQGuM//XQsh+VD8WBNNz
   eoi1rUw7KtxUq+TlxW3coBgtYaIZjrn506PU/qJlgLXMJn8WhCSWOcf28
   vbm26kYmPid6/ZKS0kTNoUktRtMN8BI9C0GeqAjrAyImBWOLXS8nLjYWY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375975521"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375975521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 05:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779171234"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="779171234"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 05:31:41 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgP1u-00002z-17;
	Wed, 13 Sep 2023 12:31:38 +0000
Date: Wed, 13 Sep 2023 20:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] workingset: simplify lru_gen_test_recent
Message-ID: <202309132012.STqLv8xb-lkp@intel.com>
References: <20230912184511.49333-4-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912184511.49333-4-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1]
[cannot apply to akpm-mm/mm-everything next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230913-024648
base:   linus/master
patch link:    https://lore.kernel.org/r/20230912184511.49333-4-ryncsn%40gmail.com
patch subject: [RFC PATCH v2 3/5] workingset: simplify lru_gen_test_recent
config: s390-randconfig-r013-20230913 (https://download.01.org/0day-ci/archive/20230913/202309132012.STqLv8xb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132012.STqLv8xb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132012.STqLv8xb-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/workingset.c:243:16: warning: unused variable 'workingset' [-Wunused-variable]
           unsigned long workingset, active, inactive, inactive_file, inactive_anon = 0;
                         ^
   mm/workingset.c:243:36: warning: unused variable 'inactive' [-Wunused-variable]
           unsigned long workingset, active, inactive, inactive_file, inactive_anon = 0;
                                             ^
>> mm/workingset.c:503:61: error: too few arguments to function call, expected 5, have 3
                   return lru_gen_test_recent(eviction_lruvec, file, eviction);
                          ~~~~~~~~~~~~~~~~~~~                                ^
   mm/workingset.c:415:13: note: 'lru_gen_test_recent' declared here
   static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
               ^
   2 warnings and 1 error generated.


vim +503 mm/workingset.c

   459	
   460	/**
   461	 * workingset_test_recent - tests if the shadow entry is for a folio that was
   462	 * recently evicted. Also fills in @workingset with the value unpacked from
   463	 * shadow.
   464	 * @shadow: the shadow entry to be tested.
   465	 * @file: whether the corresponding folio is from the file lru.
   466	 * @workingset: where the workingset value unpacked from shadow should
   467	 * be stored.
   468	 *
   469	 * Return: true if the shadow is for a recently evicted folio; false otherwise.
   470	 */
   471	bool workingset_test_recent(void *shadow, bool file, bool *workingset)
   472	{
   473		struct mem_cgroup *eviction_memcg;
   474		struct lruvec *eviction_lruvec;
   475		int memcgid;
   476		struct pglist_data *pgdat;
   477		unsigned long eviction;
   478	
   479		unpack_shadow(shadow, &memcgid, &pgdat, &eviction, workingset);
   480	
   481		/*
   482		 * Look up the memcg associated with the stored ID. It might
   483		 * have been deleted since the folio's eviction.
   484		 *
   485		 * Note that in rare events the ID could have been recycled
   486		 * for a new cgroup that refaults a shared folio. This is
   487		 * impossible to tell from the available data. However, this
   488		 * should be a rare and limited disturbance, and activations
   489		 * are always speculative anyway. Ultimately, it's the aging
   490		 * algorithm's job to shake out the minimum access frequency
   491		 * for the active cache.
   492		 *
   493		 * XXX: On !CONFIG_MEMCG, this will always return NULL; it
   494		 * would be better if the root_mem_cgroup existed in all
   495		 * configurations instead.
   496		 */
   497		eviction_memcg = mem_cgroup_from_id(memcgid);
   498		if (!mem_cgroup_disabled() && !eviction_memcg)
   499			return false;
   500		eviction_lruvec = mem_cgroup_lruvec(eviction_memcg, pgdat);
   501	
   502		if (lru_gen_enabled())
 > 503			return lru_gen_test_recent(eviction_lruvec, file, eviction);
   504	
   505		return lru_refault(eviction_memcg, eviction_lruvec, eviction, file,
   506				   EVICTION_BITS, bucket_order);
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
