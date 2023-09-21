Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE506A956;
	Thu, 21 Sep 2023 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695297507; x=1726833507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=15GQx/l1YNSIk8sv3sd4qIKbiFJogTENX7+YRpLX3IQ=;
  b=XwMYO8eewlO2/RWT9j//AcC1wmFywl4XIuhD3VoKXNKcmEavtnmrR7Cj
   6c+XXxF9M9e+s6DJzsqYNzu5H+7jQyA06ytwoERCetxuqzbfJChaMJO3t
   kCiCEnzixMQHkY3wVeT+sck7mtqcENa3k349BMVX5H+Vfy6eoqYwPHmLE
   IsCarQGZqkK17NqrrIPdD0SbtZrdwWpQKYb/FKwQ7bVqaObUOgG9WHHNU
   dVmMpjzOhfU00LDzgsbwUPi4R5Mv+gl3RPBz/jydcKDuOYCQosP9+OVlk
   9T7/CI0tUZI3LaDb7ATf7ig+AGQ6zqvi1l2nZR0VnMqF1+eXa5G/5svjq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377788588"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="377788588"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 04:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="747064235"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="747064235"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2023 04:58:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjIK6-0009vs-11;
	Thu, 21 Sep 2023 11:58:22 +0000
Date: Thu, 21 Sep 2023 19:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/6] workingset: simplify and use a more intuitive
 model
Message-ID: <202309211955.PP1nkFx4-lkp@intel.com>
References: <20230920190244.16839-2-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920190244.16839-2-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc2 next-20230921]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230921-030515
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920190244.16839-2-ryncsn%40gmail.com
patch subject: [RFC PATCH v3 1/6] workingset: simplify and use a more intuitive model
config: mips-pic32mzda_defconfig (https://download.01.org/0day-ci/archive/20230921/202309211955.PP1nkFx4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211955.PP1nkFx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211955.PP1nkFx4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:345:6: warning: no previous prototype for function 'workingset_age_nonresident' [-Wmissing-prototypes]
     345 | void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
         |      ^
   mm/workingset.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     345 | void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
         | ^
         | static 
   1 warning generated.


vim +/workingset_age_nonresident +345 mm/workingset.c

ac35a490237446 Yu Zhao         2022-09-18  334  
31d8fcac00fcf4 Johannes Weiner 2020-06-25  335  /**
31d8fcac00fcf4 Johannes Weiner 2020-06-25  336   * workingset_age_nonresident - age non-resident entries as LRU ages
e755f4af08b74e Xiaofei Tan     2020-10-15  337   * @lruvec: the lruvec that was aged
31d8fcac00fcf4 Johannes Weiner 2020-06-25  338   * @nr_pages: the number of pages to count
31d8fcac00fcf4 Johannes Weiner 2020-06-25  339   *
31d8fcac00fcf4 Johannes Weiner 2020-06-25  340   * As in-memory pages are aged, non-resident pages need to be aged as
31d8fcac00fcf4 Johannes Weiner 2020-06-25  341   * well, in order for the refault distances later on to be comparable
31d8fcac00fcf4 Johannes Weiner 2020-06-25  342   * to the in-memory dimensions. This function allows reclaim and LRU
31d8fcac00fcf4 Johannes Weiner 2020-06-25  343   * operations to drive the non-resident aging along in parallel.
31d8fcac00fcf4 Johannes Weiner 2020-06-25  344   */
31d8fcac00fcf4 Johannes Weiner 2020-06-25 @345  void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
b910718a948a91 Johannes Weiner 2019-11-30  346  {
b910718a948a91 Johannes Weiner 2019-11-30  347  	/*
b910718a948a91 Johannes Weiner 2019-11-30  348  	 * Reclaiming a cgroup means reclaiming all its children in a
b910718a948a91 Johannes Weiner 2019-11-30  349  	 * round-robin fashion. That means that each cgroup has an LRU
b910718a948a91 Johannes Weiner 2019-11-30  350  	 * order that is composed of the LRU orders of its child
b910718a948a91 Johannes Weiner 2019-11-30  351  	 * cgroups; and every page has an LRU position not just in the
b910718a948a91 Johannes Weiner 2019-11-30  352  	 * cgroup that owns it, but in all of that group's ancestors.
b910718a948a91 Johannes Weiner 2019-11-30  353  	 *
b910718a948a91 Johannes Weiner 2019-11-30  354  	 * So when the physical inactive list of a leaf cgroup ages,
b910718a948a91 Johannes Weiner 2019-11-30  355  	 * the virtual inactive lists of all its parents, including
b910718a948a91 Johannes Weiner 2019-11-30  356  	 * the root cgroup's, age as well.
b910718a948a91 Johannes Weiner 2019-11-30  357  	 */
b910718a948a91 Johannes Weiner 2019-11-30  358  	do {
31d8fcac00fcf4 Johannes Weiner 2020-06-25  359  		atomic_long_add(nr_pages, &lruvec->nonresident_age);
31d8fcac00fcf4 Johannes Weiner 2020-06-25  360  	} while ((lruvec = parent_lruvec(lruvec)));
b910718a948a91 Johannes Weiner 2019-11-30  361  }
b910718a948a91 Johannes Weiner 2019-11-30  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
