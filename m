Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F40366
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 04:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663388157; x=1694924157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQDpK8w0a7wlRSYg04W1GIu8E15asfGUgzZTlQ9DWXc=;
  b=OrPkYZKYyABNfCv1/oJRTWyQDoDb5wXe6Y9gENjWVbSjhhoX+vfEf5Q/
   f6wrT5QGtm7bYlrOxYtCUhIKWhzd+3jOQeIGk1puW88R2hafu/3h2KrkO
   M+Y/mDe7ikZl0RoFaKVdi396oqBjKt0W/Q46x6vAQUvQe7IhsBQOQuFny
   f12HGyQZDakRMMZpVDVR7HqLAuSfTlW9zAS0/gJH9gGoX+qDThRFI5ShR
   AOaXe7jI0v4ej7Tkkw98vcTr1MVRhhWRyJdNEURtYMTVgz1ipUBQX81ii
   jg2Es5EndWIMMufyBy3pulEKIcOo2HaSK2ZdzvCYD8qNadeAjKOlNRHY1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="325401235"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="325401235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 21:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="648494343"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2022 21:15:55 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZPFC-0002TK-17;
	Sat, 17 Sep 2022 04:15:54 +0000
Date: Sat, 17 Sep 2022 12:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhong <floridsleeves@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	akpm@linux-foundation.org, Li Zhong <floridsleeves@gmail.com>
Subject: Re: [PATCH v1] mm/vmscan: check the return value of migrate_pages()
Message-ID: <202209171239.jS3610fm-lkp@intel.com>
References: <20220917021257.3840548-1-floridsleeves@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917021257.3840548-1-floridsleeves@gmail.com>

Hi Li,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc5]
[cannot apply to akpm-mm/mm-everything next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhong/mm-vmscan-check-the-return-value-of-migrate_pages/20220917-101433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a335366bad1364a07f49df9da1fdfa6d411a5f39
config: hexagon-randconfig-r041-20220916 (https://download.01.org/0day-ci/archive/20220917/202209171239.jS3610fm-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0ea516d584bd904c43954e312ac42fced822dcf7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Li-Zhong/mm-vmscan-check-the-return-value-of-migrate_pages/20220917-101433
        git checkout 0ea516d584bd904c43954e312ac42fced822dcf7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1564:26: error: use of undeclared identifier 'pagelist'; did you mean 'pageout'?
                   putback_movable_pages(&pagelist);
                                          ^~~~~~~~
                                          pageout
   mm/vmscan.c:1215:18: note: 'pageout' declared here
   static pageout_t pageout(struct folio *folio, struct address_space *mapping,
                    ^
   1 error generated.


vim +1564 mm/vmscan.c

  1539	
  1540	/*
  1541	 * Take pages on @demote_list and attempt to demote them to
  1542	 * another node.  Pages which are not demoted are left on
  1543	 * @demote_pages.
  1544	 */
  1545	static unsigned int demote_page_list(struct list_head *demote_pages,
  1546					     struct pglist_data *pgdat)
  1547	{
  1548		int target_nid = next_demotion_node(pgdat->node_id);
  1549		unsigned int nr_succeeded;
  1550		int ret;
  1551	
  1552		if (list_empty(demote_pages))
  1553			return 0;
  1554	
  1555		if (target_nid == NUMA_NO_NODE)
  1556			return 0;
  1557	
  1558		/* Demotion ignores all cpuset and mempolicy settings */
  1559		ret = migrate_pages(demote_pages, alloc_demote_page, NULL,
  1560				    target_nid, MIGRATE_ASYNC, MR_DEMOTION,
  1561				    &nr_succeeded);
  1562	
  1563		if (ret)
> 1564			putback_movable_pages(&pagelist);
  1565	
  1566		if (current_is_kswapd())
  1567			__count_vm_events(PGDEMOTE_KSWAPD, nr_succeeded);
  1568		else
  1569			__count_vm_events(PGDEMOTE_DIRECT, nr_succeeded);
  1570	
  1571		return nr_succeeded;
  1572	}
  1573	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
