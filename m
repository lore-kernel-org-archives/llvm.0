Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A11F419A;
	Wed, 26 Nov 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764161275; cv=none; b=JGwk8z7z13q0TYZtZzIk62+22EwY2DkTpj4nLEJZtCv1FD2BdeSskR7rpOEuDXOYolZGjf2wyHUmB0SsiQcrFmuoEQCK7y+U47ztbWgHItAJLHnucVN716Xggfxigm6awQrgahDNxngdgl8jRvjqdnomfnqrKMpReVRUufw8ke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764161275; c=relaxed/simple;
	bh=mCOTTsADR2bzj1PyZQv8CIQiWFMT6GRnekgWFM29eQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=caPddj4HM9nbL3Jdul2/PdThc2MCY66bu43Jhl/E5f7nbSz9fizF8Q/qVYcFyQ6jOCn319W+bK1iq2N5FZaOpx/L0hn1ULdmr7BnpfNjXo6Vn16LgjiZ4KFlARCIG4seCAlYYXX3nJdnRobPwqKWSA0n90MucukO8pQiSR4/7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X++f6BFQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X++f6BFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764161273; x=1795697273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mCOTTsADR2bzj1PyZQv8CIQiWFMT6GRnekgWFM29eQU=;
  b=X++f6BFQcGwpNZhqbShIqmxvfdUdXRai1BbOJ1GF+BP/8fB8wRdZnOpo
   dnAwiVENs9OlIkrtf/UW72qkRbR/s7vm6+YT+dDNpN2U2xp4tIjyEqMsh
   BCmWskeJl8Ck3BE/umtMcl8AHL9jEiUU+wUNSEutnn8IPNCDehyymLZIV
   Tork1D6Qc/ZCorKOwczDA5wdb3tIVEdT0Tpjlfj0OzVe4synksXlm1TQQ
   o0bt9XtNhzPxWjU7Ms9jBcpYDqVdtnTyKI1tzyTY//kkZBL8EegRpLsoh
   fVfkFTykn+c+PKvUQfc+U2zYrvledXaNqYK3E/uCb2R0LXB/VQIzUWIJA
   w==;
X-CSE-ConnectionGUID: ZN+Uwlk2TPayVSRAfPkuNQ==
X-CSE-MsgGUID: W8DmhRe+R6+xkkofdCLFmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76521248"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76521248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 04:47:53 -0800
X-CSE-ConnectionGUID: lsqypLh7Tqeb0j1HSK85Vw==
X-CSE-MsgGUID: pImxAFPOS6uMq8vdGKFzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="230186919"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2025 04:47:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOEw0-000000002pH-25yV;
	Wed, 26 Nov 2025 12:47:48 +0000
Date: Wed, 26 Nov 2025 20:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 1/1] mm/hugetlb.c:1842:6: warning:
 no previous prototype for function 'init_new_hugetlb_folio'
Message-ID: <202511262018.dNZmp9is-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux movable_gigantic
head:   ba138827f6a776a1b329ebd87f3510e2d45302bd
commit: ba138827f6a776a1b329ebd87f3510e2d45302bd [1/1] mm, hugetlb: implement movable_gigantic_pages sysctl
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20251126/202511262018.dNZmp9is-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262018.dNZmp9is-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262018.dNZmp9is-lkp@intel.com/

All warnings (new ones prefixed by >>):

     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                        ^
   mm/hugetlb.c:587:39: error: incompatible pointer types passing 'struct hugetlb_cgroup *' to parameter of type 'struct hugetlb_cgroup *' [-Werror,-Wincompatible-pointer-types]
     587 |                 record_hugetlb_cgroup_uncharge_info(cg, h, map, nrg);
         |                                                     ^~
   mm/hugetlb.c:497:72: note: passing argument to parameter 'h_cg' here
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                                        ^
   mm/hugetlb.c:605:17: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
     605 |                                      struct hugetlb_cgroup *h_cg,
         |                                             ^
   mm/hugetlb.c:646:26: error: incompatible pointer types passing 'struct hugetlb_cgroup *' to parameter of type 'struct hugetlb_cgroup *' [-Werror,-Wincompatible-pointer-types]
     646 |                                                     iter->from, h, h_cg,
         |                                                                    ^~~~
   mm/hugetlb.c:580:58: note: passing argument to parameter 'cg' here
     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                                        ^
   mm/hugetlb.c:659:16: error: incompatible pointer types passing 'struct hugetlb_cgroup *' to parameter of type 'struct hugetlb_cgroup *' [-Werror,-Wincompatible-pointer-types]
     659 |                                             t, h, h_cg, regions_needed);
         |                                                   ^~~~
   mm/hugetlb.c:580:58: note: passing argument to parameter 'cg' here
     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                                        ^
   mm/hugetlb.c:739:17: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
     739 |                        struct hugetlb_cgroup *h_cg)
         |                               ^
   mm/hugetlb.c:776:45: error: incompatible pointer types passing 'struct hugetlb_cgroup *' to parameter of type 'struct hugetlb_cgroup *' [-Werror,-Wincompatible-pointer-types]
     776 |         add = add_reservation_in_range(resv, f, t, h_cg, h, NULL);
         |                                                    ^~~~
   mm/hugetlb.c:605:33: note: passing argument to parameter 'h_cg' here
     605 |                                      struct hugetlb_cgroup *h_cg,
         |                                                             ^
   mm/hugetlb.c:909:4: error: call to undeclared function 'hugetlb_cgroup_uncharge_file_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     909 |                         hugetlb_cgroup_uncharge_file_region(
         |                         ^
   mm/hugetlb.c:930:4: error: call to undeclared function 'hugetlb_cgroup_uncharge_file_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     930 |                         hugetlb_cgroup_uncharge_file_region(resv, rg,
         |                         ^
   mm/hugetlb.c:938:4: error: call to undeclared function 'hugetlb_cgroup_uncharge_file_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     938 |                         hugetlb_cgroup_uncharge_file_region(resv, rg,
         |                         ^
   mm/hugetlb.c:944:4: error: call to undeclared function 'hugetlb_cgroup_uncharge_file_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     944 |                         hugetlb_cgroup_uncharge_file_region(resv, rg,
         |                         ^
   mm/hugetlb.c:1097:15: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
    1097 |                                           struct hugetlb_cgroup *h_cg,
         |                                                  ^
   mm/hugetlb.c:1287:3: error: call to undeclared function 'resv_map_put_hugetlb_cgroup_uncharge_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1287 |                 resv_map_put_hugetlb_cgroup_uncharge_info(reservations);
         |                 ^
   mm/hugetlb.c:1287:3: note: did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'?
   mm/hugetlb.c:1096:1: note: 'resv_map_set_hugetlb_cgroup_uncharge_info' declared here
    1096 | resv_map_set_hugetlb_cgroup_uncharge_info(struct resv_map *resv_map,
         | ^
   mm/hugetlb.c:1479:18: error: call to undeclared function 'hugetlb_cgroup_from_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1479 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio(folio), folio);
         |                         ^
   mm/hugetlb.c:1479:18: note: did you mean 'get_obj_cgroup_from_folio'?
   include/linux/memcontrol.h:1792:34: note: 'get_obj_cgroup_from_folio' declared here
    1792 | static inline struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *folio)
         |                                  ^
   mm/hugetlb.c:1480:18: error: call to undeclared function 'hugetlb_cgroup_from_folio_rsvd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |                         ^
   mm/hugetlb.c:1483:6: error: call to undeclared function 'hstate_is_gigantic_no_runtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1483 |         if (hstate_is_gigantic_no_runtime(h))
         |             ^
   mm/hugetlb.c:1474:6: warning: no previous prototype for function 'remove_hugetlb_folio' [-Wmissing-prototypes]
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^
   mm/hugetlb.c:1474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         | ^
         | static 
   mm/hugetlb.c:1510:6: warning: no previous prototype for function 'add_hugetlb_folio' [-Wmissing-prototypes]
    1510 | void add_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^
   mm/hugetlb.c:1510:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1510 | void add_hugetlb_folio(struct hstate *h, struct folio *folio,
         | ^
         | static 
   mm/hugetlb.c:1545:6: error: call to undeclared function 'hstate_is_gigantic_no_runtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1545 |         if (hstate_is_gigantic_no_runtime(h))
         |             ^
   mm/hugetlb.c:1807:2: error: call to undeclared function 'hugetlb_cgroup_uncharge_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1807 |         hugetlb_cgroup_uncharge_folio(hstate_index(h),
         |         ^
   mm/hugetlb.c:1807:2: note: did you mean 'mem_cgroup_uncharge_folios'?
   include/linux/memcontrol.h:1153:20: note: 'mem_cgroup_uncharge_folios' declared here
    1153 | static inline void mem_cgroup_uncharge_folios(struct folio_batch *folios)
         |                    ^
   mm/hugetlb.c:1809:2: error: call to undeclared function 'hugetlb_cgroup_uncharge_folio_rsvd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1809 |         hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
         |         ^
   mm/hugetlb.c:1847:2: error: call to undeclared function 'set_hugetlb_cgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1847 |         set_hugetlb_cgroup(folio, NULL);
         |         ^
   mm/hugetlb.c:1848:2: error: call to undeclared function 'set_hugetlb_cgroup_rsvd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1848 |         set_hugetlb_cgroup_rsvd(folio, NULL);
         |         ^
>> mm/hugetlb.c:1842:6: warning: no previous prototype for function 'init_new_hugetlb_folio' [-Wmissing-prototypes]
    1842 | void init_new_hugetlb_folio(struct folio *folio)
         |      ^
   mm/hugetlb.c:1842:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1842 | void init_new_hugetlb_folio(struct folio *folio)
         | ^
         | static 
>> mm/hugetlb.c:1954:6: warning: no previous prototype for function 'prep_and_add_allocated_folios' [-Wmissing-prototypes]
    1954 | void prep_and_add_allocated_folios(struct hstate *h,
         |      ^
   mm/hugetlb.c:1954:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1954 | void prep_and_add_allocated_folios(struct hstate *h,
         | ^
         | static 
   mm/hugetlb.c:1984:2: error: call to undeclared function 'for_each_node_mask_to_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1984 |         for_each_node_mask_to_alloc(next_node, nr_nodes, node, nodes_allowed) {
         |         ^
   mm/hugetlb.c:1984:71: error: expected ';' after expression
    1984 |         for_each_node_mask_to_alloc(next_node, nr_nodes, node, nodes_allowed) {
         |                                                                              ^
         |                                                                              ;
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   9 warnings and 20 errors generated.


vim +/init_new_hugetlb_folio +1842 mm/hugetlb.c

d3d99fcc4e28f1 Oscar Salvador          2021-05-04  1841  
ecd6703f64d76e Hui Zhu                 2025-11-06 @1842  void init_new_hugetlb_folio(struct folio *folio)
b7ba30c679ed1e Andi Kleen              2008-07-23  1843  {
d99e3140a4d33e Matthew Wilcox (Oracle  2024-03-21  1844) 	__folio_set_hugetlb(folio);
de656ed376c4cb Sidhartha Kumar         2022-11-01  1845  	INIT_LIST_HEAD(&folio->lru);
de656ed376c4cb Sidhartha Kumar         2022-11-01  1846  	hugetlb_set_folio_subpool(folio, NULL);
de656ed376c4cb Sidhartha Kumar         2022-11-01  1847  	set_hugetlb_cgroup(folio, NULL);
de656ed376c4cb Sidhartha Kumar         2022-11-01  1848  	set_hugetlb_cgroup_rsvd(folio, NULL);
d3d99fcc4e28f1 Oscar Salvador          2021-05-04  1849  }
d3d99fcc4e28f1 Oscar Salvador          2021-05-04  1850  
c0d0381ade7988 Mike Kravetz            2020-04-01  1851  /*
c0d0381ade7988 Mike Kravetz            2020-04-01  1852   * Find and lock address space (mapping) in write mode.
c0d0381ade7988 Mike Kravetz            2020-04-01  1853   *
6e8cda4c2c87b2 Matthew Wilcox (Oracle  2024-04-12  1854)  * Upon entry, the folio is locked which means that folio_mapping() is
336bf30eb76580 Mike Kravetz            2020-11-13  1855   * stable.  Due to locking order, we can only trylock_write.  If we can
336bf30eb76580 Mike Kravetz            2020-11-13  1856   * not get the lock, simply return NULL to caller.
c0d0381ade7988 Mike Kravetz            2020-04-01  1857   */
6e8cda4c2c87b2 Matthew Wilcox (Oracle  2024-04-12  1858) struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio)
c0d0381ade7988 Mike Kravetz            2020-04-01  1859  {
6e8cda4c2c87b2 Matthew Wilcox (Oracle  2024-04-12  1860) 	struct address_space *mapping = folio_mapping(folio);
c0d0381ade7988 Mike Kravetz            2020-04-01  1861  
c0d0381ade7988 Mike Kravetz            2020-04-01  1862  	if (!mapping)
c0d0381ade7988 Mike Kravetz            2020-04-01  1863  		return mapping;
c0d0381ade7988 Mike Kravetz            2020-04-01  1864  
c0d0381ade7988 Mike Kravetz            2020-04-01  1865  	if (i_mmap_trylock_write(mapping))
c0d0381ade7988 Mike Kravetz            2020-04-01  1866  		return mapping;
c0d0381ade7988 Mike Kravetz            2020-04-01  1867  
c0d0381ade7988 Mike Kravetz            2020-04-01  1868  	return NULL;
c0d0381ade7988 Mike Kravetz            2020-04-01  1869  }
c0d0381ade7988 Mike Kravetz            2020-04-01  1870  
4a25f995bd5984 Kefeng Wang             2025-09-10  1871  static struct folio *alloc_buddy_hugetlb_folio(int order, gfp_t gfp_mask,
4a25f995bd5984 Kefeng Wang             2025-09-10  1872  		int nid, nodemask_t *nmask, nodemask_t *node_alloc_noretry)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1873  {
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1874) 	struct folio *folio;
f60858f9d327c4 Mike Kravetz            2019-09-23  1875  	bool alloc_try_hard = true;
f96efd585b8d84 Joe Jin                 2007-07-15  1876  
f60858f9d327c4 Mike Kravetz            2019-09-23  1877  	/*
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1878) 	 * By default we always try hard to allocate the folio with
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1879) 	 * __GFP_RETRY_MAYFAIL flag.  However, if we are allocating folios in
f60858f9d327c4 Mike Kravetz            2019-09-23  1880  	 * a loop (to adjust global huge page counts) and previous allocation
f60858f9d327c4 Mike Kravetz            2019-09-23  1881  	 * failed, do not continue to try hard on the same node.  Use the
f60858f9d327c4 Mike Kravetz            2019-09-23  1882  	 * node_alloc_noretry bitmap to manage this state information.
f60858f9d327c4 Mike Kravetz            2019-09-23  1883  	 */
f60858f9d327c4 Mike Kravetz            2019-09-23  1884  	if (node_alloc_noretry && node_isset(nid, *node_alloc_noretry))
f60858f9d327c4 Mike Kravetz            2019-09-23  1885  		alloc_try_hard = false;
f60858f9d327c4 Mike Kravetz            2019-09-23  1886  	if (alloc_try_hard)
f60858f9d327c4 Mike Kravetz            2019-09-23  1887  		gfp_mask |= __GFP_RETRY_MAYFAIL;
2b21624fc23277 Mike Kravetz            2022-09-16  1888  
e7a446030bdaf6 Oscar Salvador          2025-04-11  1889  	folio = (struct folio *)__alloc_frozen_pages(gfp_mask, order, nid, nmask);
2b21624fc23277 Mike Kravetz            2022-09-16  1890  
f60858f9d327c4 Mike Kravetz            2019-09-23  1891  	/*
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1892) 	 * If we did not specify __GFP_RETRY_MAYFAIL, but still got a
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1893) 	 * folio this indicates an overall state change.  Clear bit so
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1894) 	 * that we resume normal 'try hard' allocations.
f60858f9d327c4 Mike Kravetz            2019-09-23  1895  	 */
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1896) 	if (node_alloc_noretry && folio && !alloc_try_hard)
f60858f9d327c4 Mike Kravetz            2019-09-23  1897  		node_clear(nid, *node_alloc_noretry);
f60858f9d327c4 Mike Kravetz            2019-09-23  1898  
f60858f9d327c4 Mike Kravetz            2019-09-23  1899  	/*
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1900) 	 * If we tried hard to get a folio but failed, set bit so that
f60858f9d327c4 Mike Kravetz            2019-09-23  1901  	 * subsequent attempts will not try as hard until there is an
f60858f9d327c4 Mike Kravetz            2019-09-23  1902  	 * overall state change.
f60858f9d327c4 Mike Kravetz            2019-09-23  1903  	 */
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1904) 	if (node_alloc_noretry && !folio && alloc_try_hard)
f60858f9d327c4 Mike Kravetz            2019-09-23  1905  		node_set(nid, *node_alloc_noretry);
f60858f9d327c4 Mike Kravetz            2019-09-23  1906  
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1907) 	if (!folio) {
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1908  		__count_vm_event(HTLB_BUDDY_PGALLOC_FAIL);
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1909  		return NULL;
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1910  	}
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1911  
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1912  	__count_vm_event(HTLB_BUDDY_PGALLOC);
f6a8dd98a2ce7a Matthew Wilcox (Oracle  2024-04-02  1913) 	return folio;
63b4613c3f0d4b Nishanth Aravamudan     2007-10-16  1914  }
63b4613c3f0d4b Nishanth Aravamudan     2007-10-16  1915  
cf54f310d0d313 Yu Zhao                 2024-08-13  1916  static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
f60858f9d327c4 Mike Kravetz            2019-09-23  1917  		gfp_t gfp_mask, int nid, nodemask_t *nmask,
f60858f9d327c4 Mike Kravetz            2019-09-23  1918  		nodemask_t *node_alloc_noretry)
0c397daea1d456 Michal Hocko            2018-01-31  1919  {
7f325a8d25631e Sidhartha Kumar         2022-11-29  1920  	struct folio *folio;
4a25f995bd5984 Kefeng Wang             2025-09-10  1921  	int order = huge_page_order(h);
0c397daea1d456 Michal Hocko            2018-01-31  1922  
4fe2a8107f332a Kefeng Wang             2025-09-10  1923  	if (nid == NUMA_NO_NODE)
4fe2a8107f332a Kefeng Wang             2025-09-10  1924  		nid = numa_mem_id();
4fe2a8107f332a Kefeng Wang             2025-09-10  1925  
4a25f995bd5984 Kefeng Wang             2025-09-10  1926  	if (order_is_gigantic(order))
4a25f995bd5984 Kefeng Wang             2025-09-10  1927  		folio = alloc_gigantic_folio(order, gfp_mask, nid, nmask);
0c397daea1d456 Michal Hocko            2018-01-31  1928  	else
4a25f995bd5984 Kefeng Wang             2025-09-10  1929  		folio = alloc_buddy_hugetlb_folio(order, gfp_mask, nid, nmask,
4a25f995bd5984 Kefeng Wang             2025-09-10  1930  						  node_alloc_noretry);
d67e32f26713c3 Mike Kravetz            2023-10-18  1931  	if (folio)
dd4d324bc02c7b Kefeng Wang             2025-09-10  1932  		init_new_hugetlb_folio(folio);
d67e32f26713c3 Mike Kravetz            2023-10-18  1933  	return folio;
d67e32f26713c3 Mike Kravetz            2023-10-18  1934  }
d67e32f26713c3 Mike Kravetz            2023-10-18  1935  
af0fb9df784174 Michal Hocko            2018-01-31  1936  /*
902020f027457d Kefeng Wang             2025-09-10  1937   * Common helper to allocate a fresh hugetlb folio. All specific allocators
902020f027457d Kefeng Wang             2025-09-10  1938   * should use this function to get new hugetlb folio
d67e32f26713c3 Mike Kravetz            2023-10-18  1939   *
902020f027457d Kefeng Wang             2025-09-10  1940   * Note that returned folio is 'frozen':  ref count of head page and all tail
902020f027457d Kefeng Wang             2025-09-10  1941   * pages is zero, and the accounting must be done in the caller.
af0fb9df784174 Michal Hocko            2018-01-31  1942   */
d67e32f26713c3 Mike Kravetz            2023-10-18  1943  static struct folio *alloc_fresh_hugetlb_folio(struct hstate *h,
6584a14a377d08 Oscar Salvador          2024-05-16  1944  		gfp_t gfp_mask, int nid, nodemask_t *nmask)
b2261026825ed3 Joonsoo Kim             2013-09-11  1945  {
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  1946  	struct folio *folio;
d67e32f26713c3 Mike Kravetz            2023-10-18  1947  
902020f027457d Kefeng Wang             2025-09-10  1948  	folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, NULL);
902020f027457d Kefeng Wang             2025-09-10  1949  	if (folio)
902020f027457d Kefeng Wang             2025-09-10  1950  		hugetlb_vmemmap_optimize_folio(h, folio);
d67e32f26713c3 Mike Kravetz            2023-10-18  1951  	return folio;
d67e32f26713c3 Mike Kravetz            2023-10-18  1952  }
d67e32f26713c3 Mike Kravetz            2023-10-18  1953  
ecd6703f64d76e Hui Zhu                 2025-11-06 @1954  void prep_and_add_allocated_folios(struct hstate *h,
d67e32f26713c3 Mike Kravetz            2023-10-18  1955  				   struct list_head *folio_list)
d67e32f26713c3 Mike Kravetz            2023-10-18  1956  {
d67e32f26713c3 Mike Kravetz            2023-10-18  1957  	unsigned long flags;
d67e32f26713c3 Mike Kravetz            2023-10-18  1958  	struct folio *folio, *tmp_f;
d67e32f26713c3 Mike Kravetz            2023-10-18  1959  
79359d6d24df2f Mike Kravetz            2023-10-18  1960  	/* Send list for bulk vmemmap optimization processing */
79359d6d24df2f Mike Kravetz            2023-10-18  1961  	hugetlb_vmemmap_optimize_folios(h, folio_list);
79359d6d24df2f Mike Kravetz            2023-10-18  1962  
d67e32f26713c3 Mike Kravetz            2023-10-18  1963  	/* Add all new pool pages to free lists in one lock cycle */
d67e32f26713c3 Mike Kravetz            2023-10-18  1964  	spin_lock_irqsave(&hugetlb_lock, flags);
d67e32f26713c3 Mike Kravetz            2023-10-18  1965  	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
4094d3434b25a1 Kefeng Wang             2025-09-10  1966  		account_new_hugetlb_folio(h, folio);
d67e32f26713c3 Mike Kravetz            2023-10-18  1967  		enqueue_hugetlb_folio(h, folio);
d67e32f26713c3 Mike Kravetz            2023-10-18  1968  	}
d67e32f26713c3 Mike Kravetz            2023-10-18  1969  	spin_unlock_irqrestore(&hugetlb_lock, flags);
d67e32f26713c3 Mike Kravetz            2023-10-18  1970  }
d67e32f26713c3 Mike Kravetz            2023-10-18  1971  

:::::: The code at line 1842 was first introduced by commit
:::::: ecd6703f64d76ee4fc8cc2205bfb892d3bb9f538 mm/hugetlb: extract sysfs into hugetlb_sysfs.c

:::::: TO: Hui Zhu <zhuhui@kylinos.cn>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
