Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792110EA
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 02:01:57 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L7rJD0Vb6zgYMg;
	Thu, 26 May 2022 09:41:32 +0800 (CST)
Received: from [10.174.177.76] (10.174.177.76) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 09:43:03 +0800
Subject: Re: [PATCH v3 3/4] mm/migration: return errno when isolate_huge_page
 failed
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
References: <20220525081822.53547-4-linmiaohe@huawei.com>
 <202205260528.uxNyPadV-lkp@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <f012b764-9547-3080-9e97-279e2273ed9f@huawei.com>
Date: Thu, 26 May 2022 09:43:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202205260528.uxNyPadV-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.76]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected

On 2022/5/26 5:30, kernel test robot wrote:
> Hi Miaohe,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v5.18 next-20220525]
> [cannot apply to hch-configfs/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Miaohe-Lin/A-few-cleanup-and-fixup-patches-for-migration/20220525-162042
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220526/202205260528.uxNyPadV-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/bd48c43874403db1bccb576eae4a0e475942a64b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Miaohe-Lin/A-few-cleanup-and-fixup-patches-for-migration/20220525-162042
>         git checkout bd48c43874403db1bccb576eae4a0e475942a64b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

Thanks robot! I forgot to enable the CONFIG_MEMORY_HOTREMOVE. Sorry about it. Will fix this in next version.

Thanks!

> 
> All errors (new ones prefixed by >>):
> 
>>> mm/memory_hotplug.c:1646:4: error: call to undeclared function 'isolate_huge_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                            isolate_huge_page(head, &source);
>                            ^
>    1 error generated.
> 
> 
> vim +/isolate_huge_page +1646 mm/memory_hotplug.c
> 
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1624  
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1625  static int
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1626  do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1627  {
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1628  	unsigned long pfn;
> 6c357848b44b401 Matthew Wilcox (Oracle  2020-08-14  1629) 	struct page *page, *head;
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1630  	int ret = 0;
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1631  	LIST_HEAD(source);
> 786dee864804f8e Liam Mark               2021-06-30  1632  	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
> 786dee864804f8e Liam Mark               2021-06-30  1633  				      DEFAULT_RATELIMIT_BURST);
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1634  
> a85009c377929d1 Michal Hocko            2018-12-28  1635  	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1636) 		struct folio *folio;
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1637) 
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1638  		if (!pfn_valid(pfn))
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1639  			continue;
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1640  		page = pfn_to_page(pfn);
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1641) 		folio = page_folio(page);
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1642) 		head = &folio->page;
> c8721bbbdd36382 Naoya Horiguchi         2013-09-11  1643  
> c8721bbbdd36382 Naoya Horiguchi         2013-09-11  1644  		if (PageHuge(page)) {
> d8c6546b1aea843 Matthew Wilcox (Oracle  2019-09-23  1645) 			pfn = page_to_pfn(head) + compound_nr(head) - 1;
> daf3538ad5a4800 Oscar Salvador          2019-03-05 @1646  			isolate_huge_page(head, &source);
> c8721bbbdd36382 Naoya Horiguchi         2013-09-11  1647  			continue;
> 94723aafb9e7641 Michal Hocko            2018-04-10  1648  		} else if (PageTransHuge(page))
> 6c357848b44b401 Matthew Wilcox (Oracle  2020-08-14  1649) 			pfn = page_to_pfn(head) + thp_nr_pages(page) - 1;
> c8721bbbdd36382 Naoya Horiguchi         2013-09-11  1650  
> b15c87263a69272 Michal Hocko            2018-12-28  1651  		/*
> b15c87263a69272 Michal Hocko            2018-12-28  1652  		 * HWPoison pages have elevated reference counts so the migration would
> b15c87263a69272 Michal Hocko            2018-12-28  1653  		 * fail on them. It also doesn't make any sense to migrate them in the
> b15c87263a69272 Michal Hocko            2018-12-28  1654  		 * first place. Still try to unmap such a page in case it is still mapped
> b15c87263a69272 Michal Hocko            2018-12-28  1655  		 * (e.g. current hwpoison implementation doesn't unmap KSM pages but keep
> b15c87263a69272 Michal Hocko            2018-12-28  1656  		 * the unmap as the catch all safety net).
> b15c87263a69272 Michal Hocko            2018-12-28  1657  		 */
> b15c87263a69272 Michal Hocko            2018-12-28  1658  		if (PageHWPoison(page)) {
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1659) 			if (WARN_ON(folio_test_lru(folio)))
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1660) 				folio_isolate_lru(folio);
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1661) 			if (folio_mapped(folio))
> 869f7ee6f647734 Matthew Wilcox (Oracle  2022-02-15  1662) 				try_to_unmap(folio, TTU_IGNORE_MLOCK);
> b15c87263a69272 Michal Hocko            2018-12-28  1663  			continue;
> b15c87263a69272 Michal Hocko            2018-12-28  1664  		}
> b15c87263a69272 Michal Hocko            2018-12-28  1665  
> 700c2a46e882653 Konstantin Khlebnikov   2011-05-24  1666  		if (!get_page_unless_zero(page))
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1667  			continue;
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1668  		/*
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1669  		 * We can skip free pages. And we can deal with pages on
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1670  		 * LRU and non-lru movable pages.
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1671  		 */
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1672  		if (PageLRU(page))
> 62695a84eb8f2e7 Nicholas Piggin         2008-10-18  1673  			ret = isolate_lru_page(page);
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1674  		else
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1675  			ret = isolate_movable_page(page, ISOLATE_UNEVICTABLE);
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1676  		if (!ret) { /* Success */
> 62695a84eb8f2e7 Nicholas Piggin         2008-10-18  1677  			list_add_tail(&page->lru, &source);
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1678  			if (!__PageMovable(page))
> 599d0c954f91d06 Mel Gorman              2016-07-28  1679  				inc_node_page_state(page, NR_ISOLATED_ANON +
> 9de4f22a60f7319 Huang Ying              2020-04-06  1680  						    page_is_file_lru(page));
> 6d9c285a632b39a KOSAKI Motohiro         2009-12-14  1681  
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1682  		} else {
> 786dee864804f8e Liam Mark               2021-06-30  1683  			if (__ratelimit(&migrate_rs)) {
> 2932c8b05056d4b Michal Hocko            2018-12-28  1684  				pr_warn("failed to isolate pfn %lx\n", pfn);
> 0efadf48bca01f1 Yisheng Xie             2017-02-24  1685  				dump_page(page, "isolation failed");
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1686  			}
> 786dee864804f8e Liam Mark               2021-06-30  1687  		}
> 1723058eab19de7 Oscar Salvador          2019-02-01  1688  		put_page(page);
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1689  	}
> f3ab2636c5c1dd9 Bob Liu                 2010-10-26  1690  	if (!list_empty(&source)) {
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1691  		nodemask_t nmask = node_states[N_MEMORY];
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1692  		struct migration_target_control mtc = {
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1693  			.nmask = &nmask,
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1694  			.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1695  		};
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1696  
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1697  		/*
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1698  		 * We have checked that migration range is on a single zone so
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1699  		 * we can use the nid of the first page to all the others.
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1700  		 */
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1701  		mtc.nid = page_to_nid(list_first_entry(&source, struct page, lru));
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1702  
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1703  		/*
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1704  		 * try to allocate from a different node but reuse this node
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1705  		 * if there are no other online nodes to be used (e.g. we are
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1706  		 * offlining a part of the only existing node)
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1707  		 */
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1708  		node_clear(mtc.nid, nmask);
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1709  		if (nodes_empty(nmask))
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1710  			node_set(mtc.nid, nmask);
> 203e6e5ca4eac64 Joonsoo Kim             2020-10-17  1711  		ret = migrate_pages(&source, alloc_migration_target, NULL,
> 5ac95884a784e82 Yang Shi                2021-09-02  1712  			(unsigned long)&mtc, MIGRATE_SYNC, MR_MEMORY_HOTPLUG, NULL);
> 2932c8b05056d4b Michal Hocko            2018-12-28  1713  		if (ret) {
> 2932c8b05056d4b Michal Hocko            2018-12-28  1714  			list_for_each_entry(page, &source, lru) {
> 786dee864804f8e Liam Mark               2021-06-30  1715  				if (__ratelimit(&migrate_rs)) {
> 786dee864804f8e Liam Mark               2021-06-30  1716  					pr_warn("migrating pfn %lx failed ret:%d\n",
> 2932c8b05056d4b Michal Hocko            2018-12-28  1717  						page_to_pfn(page), ret);
> 2932c8b05056d4b Michal Hocko            2018-12-28  1718  					dump_page(page, "migration failure");
> 2932c8b05056d4b Michal Hocko            2018-12-28  1719  				}
> 786dee864804f8e Liam Mark               2021-06-30  1720  			}
> c8721bbbdd36382 Naoya Horiguchi         2013-09-11  1721  			putback_movable_pages(&source);
> f3ab2636c5c1dd9 Bob Liu                 2010-10-26  1722  		}
> 2932c8b05056d4b Michal Hocko            2018-12-28  1723  	}
> 1723058eab19de7 Oscar Salvador          2019-02-01  1724  
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1725  	return ret;
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1726  }
> 0c0e61958965354 KAMEZAWA Hiroyuki       2007-10-16  1727  
> 

