Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D126ED5F;
	Wed, 26 Nov 2025 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764158755; cv=none; b=I1kT7wVU/rICKDN+KDajke+EDEUb5BERoRjr0RiUVA1oMOk9rRdq7eCJDTD8439O8qHHPcudnYHrda5LsjSJao/dhtnctEmwMuY71GX42wk4IVysZoDb7zLBwWaiEQDUvT2vHj8szFc/WAlZbq0uvk3vciRVvlhw3fKbzQ6snW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764158755; c=relaxed/simple;
	bh=2CWuZ1g5DkkxYAtdSfBsjz2U4Ky7xypsZ8uStoR48s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jbu7qSu+L5p3DKNci3Vvr8qppRfr+CRJqoyQfBWfteT508KiH4z3KGuBVx5Pnjd8UpfaYhx7Fh7a+3+mXsfCqzF8e+XrN8Q6jIQanV//+FITBJSzClcgteMLliQxt6nkgDE8zARyQL/gq2c7/YgerMwGgxvON4UsykrunkpAw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6bBDVWU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6bBDVWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764158754; x=1795694754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CWuZ1g5DkkxYAtdSfBsjz2U4Ky7xypsZ8uStoR48s8=;
  b=P6bBDVWUX68EnF3vNjWBp7rFeIozd1RPIJf2k0anGXi1L85VwtlPl/2z
   T/HXqiZ3lGZE3tugCZskyu2lokjWV0NxbEV9bDWwEnbtrmTgryg6ADWLk
   bqSe7Rmwt+/nczICr9IHzlJeJJF6jbIimQOABFw4IQJIc2O72ZxYW+ZKK
   CsrLxoHULiQfjdDKdoIfILjmLquWPXsou+FokpQWyftsfsxO9isv89rPl
   9nmOr3CxR96/KKI0VDjHEE8b1YkIcKLW53IXJp6x2Dn/6mvfiWSWRooHc
   1IunnWBxR3LQl+yx7kNcP3/z1Jx2JDA1JWXn5UKMqtOXrrvU/dGvJ1Nym
   w==;
X-CSE-ConnectionGUID: IomcDkamQ3CVzIIZ50CExA==
X-CSE-MsgGUID: B7ldlfjWRcKXaMPxDJkaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77667530"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77667530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 04:05:50 -0800
X-CSE-ConnectionGUID: rncNXdnZQTO/836+ZbuoyA==
X-CSE-MsgGUID: Q4OJCb/UQvK7rzjqs+0RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192714404"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 04:05:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOEHK-000000002nn-1tP6;
	Wed, 26 Nov 2025 12:05:46 +0000
Date: Wed, 26 Nov 2025 20:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 1/1] mm/hugetlb.c:497:56: warning:
 declaration of 'struct hugetlb_cgroup' will not be visible outside of this
 function
Message-ID: <202511262003.ghkCp65x-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251126/202511262003.ghkCp65x-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262003.ghkCp65x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262003.ghkCp65x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:497:56: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^
   mm/hugetlb.c:505:9: error: incomplete definition of type 'struct hugetlb_cgroup'
     505 |                         &h_cg->rsvd_hugepage[hstate_index(h)];
         |                          ~~~~^
   mm/hugetlb.c:497:56: note: forward declaration of 'struct hugetlb_cgroup'
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^
   mm/hugetlb.c:506:19: error: incomplete definition of type 'struct hugetlb_cgroup'
     506 |                 nrg->css = &h_cg->css;
         |                             ~~~~^
   mm/hugetlb.c:497:56: note: forward declaration of 'struct hugetlb_cgroup'
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^
   mm/hugetlb.c:517:16: error: incomplete definition of type 'struct hugetlb_cgroup'
     517 |                 css_get(&h_cg->css);
         |                          ~~~~^
   mm/hugetlb.c:497:56: note: forward declaration of 'struct hugetlb_cgroup'
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^
   mm/hugetlb.c:580:42: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
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
   mm/hugetlb.c:1107:9: error: incomplete definition of type 'struct hugetlb_cgroup'
    1107 |                         &h_cg->rsvd_hugepage[hstate_index(h)];
         |                          ~~~~^
   mm/hugetlb.c:1097:15: note: forward declaration of 'struct hugetlb_cgroup'
    1097 |                                           struct hugetlb_cgroup *h_cg,
         |                                                  ^
   mm/hugetlb.c:1109:24: error: incomplete definition of type 'struct hugetlb_cgroup'
    1109 |                 resv_map->css = &h_cg->css;
         |                                  ~~~~^
   mm/hugetlb.c:1097:15: note: forward declaration of 'struct hugetlb_cgroup'
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
   include/linux/memcontrol.h:1689:20: note: 'get_obj_cgroup_from_folio' declared here
    1689 | struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *folio);
         |                    ^
   mm/hugetlb.c:1480:18: error: call to undeclared function 'hugetlb_cgroup_from_folio_rsvd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |                         ^
   mm/hugetlb.c:1483:6: error: call to undeclared function 'hstate_is_gigantic_no_runtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1483 |         if (hstate_is_gigantic_no_runtime(h))
         |             ^
>> mm/hugetlb.c:1474:6: warning: no previous prototype for function 'remove_hugetlb_folio' [-Wmissing-prototypes]
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^
   mm/hugetlb.c:1474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         | ^
         | static 
>> mm/hugetlb.c:1510:6: warning: no previous prototype for function 'add_hugetlb_folio' [-Wmissing-prototypes]
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +497 mm/hugetlb.c

075a61d07a8eca Mina Almasry 2020-04-01  495  
075a61d07a8eca Mina Almasry 2020-04-01  496  /* Helper that records hugetlb_cgroup uncharge info. */
075a61d07a8eca Mina Almasry 2020-04-01 @497  static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
075a61d07a8eca Mina Almasry 2020-04-01  498  						struct hstate *h,
075a61d07a8eca Mina Almasry 2020-04-01  499  						struct resv_map *resv,
075a61d07a8eca Mina Almasry 2020-04-01  500  						struct file_region *nrg)
075a61d07a8eca Mina Almasry 2020-04-01  501  {
075a61d07a8eca Mina Almasry 2020-04-01  502  #ifdef CONFIG_CGROUP_HUGETLB
075a61d07a8eca Mina Almasry 2020-04-01  503  	if (h_cg) {
075a61d07a8eca Mina Almasry 2020-04-01  504  		nrg->reservation_counter =
075a61d07a8eca Mina Almasry 2020-04-01  505  			&h_cg->rsvd_hugepage[hstate_index(h)];
075a61d07a8eca Mina Almasry 2020-04-01  506  		nrg->css = &h_cg->css;
d85aecf2844ff0 Miaohe Lin   2021-03-24  507  		/*
d85aecf2844ff0 Miaohe Lin   2021-03-24  508  		 * The caller will hold exactly one h_cg->css reference for the
d85aecf2844ff0 Miaohe Lin   2021-03-24  509  		 * whole contiguous reservation region. But this area might be
d85aecf2844ff0 Miaohe Lin   2021-03-24  510  		 * scattered when there are already some file_regions reside in
d85aecf2844ff0 Miaohe Lin   2021-03-24  511  		 * it. As a result, many file_regions may share only one css
d85aecf2844ff0 Miaohe Lin   2021-03-24  512  		 * reference. In order to ensure that one file_region must hold
d85aecf2844ff0 Miaohe Lin   2021-03-24  513  		 * exactly one h_cg->css reference, we should do css_get for
d85aecf2844ff0 Miaohe Lin   2021-03-24  514  		 * each file_region and leave the reference held by caller
d85aecf2844ff0 Miaohe Lin   2021-03-24  515  		 * untouched.
d85aecf2844ff0 Miaohe Lin   2021-03-24  516  		 */
d85aecf2844ff0 Miaohe Lin   2021-03-24  517  		css_get(&h_cg->css);
075a61d07a8eca Mina Almasry 2020-04-01  518  		if (!resv->pages_per_hpage)
075a61d07a8eca Mina Almasry 2020-04-01  519  			resv->pages_per_hpage = pages_per_huge_page(h);
075a61d07a8eca Mina Almasry 2020-04-01  520  		/* pages_per_hpage should be the same for all entries in
075a61d07a8eca Mina Almasry 2020-04-01  521  		 * a resv_map.
075a61d07a8eca Mina Almasry 2020-04-01  522  		 */
075a61d07a8eca Mina Almasry 2020-04-01  523  		VM_BUG_ON(resv->pages_per_hpage != pages_per_huge_page(h));
075a61d07a8eca Mina Almasry 2020-04-01  524  	} else {
075a61d07a8eca Mina Almasry 2020-04-01  525  		nrg->reservation_counter = NULL;
075a61d07a8eca Mina Almasry 2020-04-01  526  		nrg->css = NULL;
075a61d07a8eca Mina Almasry 2020-04-01  527  	}
075a61d07a8eca Mina Almasry 2020-04-01  528  #endif
075a61d07a8eca Mina Almasry 2020-04-01  529  }
075a61d07a8eca Mina Almasry 2020-04-01  530  

:::::: The code at line 497 was first introduced by commit
:::::: 075a61d07a8eca2fe980acd94105ed5d6429c55d hugetlb_cgroup: add accounting for shared mappings

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
