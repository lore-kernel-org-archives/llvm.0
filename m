Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72339257844;
	Wed, 26 Nov 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162600; cv=none; b=rStRwPikUxxhh3BBY4xWO/yBqoW6uYp7qNFtHqueezadZZK4TcYGj3VPouqsN2cR/wcbEXsjYfu/KxZByRMvQmsi8i9ZXS2lllE/YHi+ijY58gzTX9XsqE+YKXBzDFsrjBq57FP3sV3FY97rqTyhcPBY4Mx+4BNjbXCsU2Sk0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162600; c=relaxed/simple;
	bh=0UcnrwIM9SHl7Sc2Z0gF+3/DOntjk2qlPnZ/m4yZnp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHHL1qW6hEcbOTgCwK+Wi2IauZDv6Xzz2qp/Slg5TtdS7vdDLeWxgVRQ5rIDNHuaVEADMTd/QKNtWFN6CbFzID8BooEGPjoNyUrp5YQDnGB5mbyuQ10OJfDqSMQaYgPUzfUmF/UP2mHK6nkTRXUEPh++pNXCReBRvHiIkCjco28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sv/4ye/5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sv/4ye/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162597; x=1795698597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UcnrwIM9SHl7Sc2Z0gF+3/DOntjk2qlPnZ/m4yZnp4=;
  b=Sv/4ye/5Q7/nmenzoUVNxn20FWvqKasHZWCubZ5ThEMzBQoBzp3WXKEC
   dLB+KUl3fvqt+6r6BT9ZoWyq5qsqmwBGD5XVvymfGF/TeNfgMxcdRZWgO
   uga13IqjY6xIU6m1VslAT8yCcrwUgwvnilw2Z1HAuFZg415ELYeRH4c6i
   vRpiKIh/AcOmkQPyo90v6w6zlAJ188uw97M+a4Uj19JM5Y2r9qcL3/grv
   O1M5CcL09Gsft7JxkcaGnPp0itZS+XPcCtUnsmdSxo7kBnZCtDmjIPaJg
   rl4GtEwGI5I/dnig1X+eeeS1TEo1m5ue/TCTfxr+2CVNcspNA7/P7vQpb
   A==;
X-CSE-ConnectionGUID: mX/ewZgtSy6bhbrL09ugZw==
X-CSE-MsgGUID: mspIY0pkQ5mxgXo/RWAvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76883868"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76883868"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:09:55 -0800
X-CSE-ConnectionGUID: clVZqZ+jTz2XI7IXD9eoUg==
X-CSE-MsgGUID: 9wKPUv6zTkGRuDWphSPEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193171799"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 05:09:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFHL-000000002t3-2Zlo;
	Wed, 26 Nov 2025 13:09:51 +0000
Date: Wed, 26 Nov 2025 21:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 1/1] mm/hugetlb.c:505:9: error:
 incomplete definition of type 'struct hugetlb_cgroup'
Message-ID: <202511262147.qCAsmUek-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251126/202511262147.qCAsmUek-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262147.qCAsmUek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262147.qCAsmUek-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c:497:56: warning: declaration of 'struct hugetlb_cgroup' will not be visible outside of this function [-Wvisibility]
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^
>> mm/hugetlb.c:505:9: error: incomplete definition of type 'struct hugetlb_cgroup'
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
>> mm/hugetlb.c:587:39: error: incompatible pointer types passing 'struct hugetlb_cgroup *' to parameter of type 'struct hugetlb_cgroup *' [-Werror,-Wincompatible-pointer-types]
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
>> mm/hugetlb.c:909:4: error: call to undeclared function 'hugetlb_cgroup_uncharge_file_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
>> mm/hugetlb.c:1287:3: error: call to undeclared function 'resv_map_put_hugetlb_cgroup_uncharge_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1287 |                 resv_map_put_hugetlb_cgroup_uncharge_info(reservations);
         |                 ^
   mm/hugetlb.c:1287:3: note: did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'?
   mm/hugetlb.c:1096:1: note: 'resv_map_set_hugetlb_cgroup_uncharge_info' declared here
    1096 | resv_map_set_hugetlb_cgroup_uncharge_info(struct resv_map *resv_map,
         | ^
>> mm/hugetlb.c:1479:18: error: call to undeclared function 'hugetlb_cgroup_from_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1479 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio(folio), folio);
         |                         ^
   mm/hugetlb.c:1479:18: note: did you mean 'get_obj_cgroup_from_folio'?
   include/linux/memcontrol.h:1689:20: note: 'get_obj_cgroup_from_folio' declared here
    1689 | struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *folio);
         |                    ^
>> mm/hugetlb.c:1480:18: error: call to undeclared function 'hugetlb_cgroup_from_folio_rsvd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |                         ^
>> mm/hugetlb.c:1483:6: error: call to undeclared function 'hstate_is_gigantic_no_runtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
>> mm/hugetlb.c:1807:2: error: call to undeclared function 'hugetlb_cgroup_uncharge_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1807 |         hugetlb_cgroup_uncharge_folio(hstate_index(h),
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +505 mm/hugetlb.c

075a61d07a8eca Mina Almasry  2020-04-01  495  
075a61d07a8eca Mina Almasry  2020-04-01  496  /* Helper that records hugetlb_cgroup uncharge info. */
075a61d07a8eca Mina Almasry  2020-04-01  497  static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
075a61d07a8eca Mina Almasry  2020-04-01  498  						struct hstate *h,
075a61d07a8eca Mina Almasry  2020-04-01  499  						struct resv_map *resv,
075a61d07a8eca Mina Almasry  2020-04-01  500  						struct file_region *nrg)
075a61d07a8eca Mina Almasry  2020-04-01  501  {
075a61d07a8eca Mina Almasry  2020-04-01  502  #ifdef CONFIG_CGROUP_HUGETLB
075a61d07a8eca Mina Almasry  2020-04-01  503  	if (h_cg) {
075a61d07a8eca Mina Almasry  2020-04-01  504  		nrg->reservation_counter =
075a61d07a8eca Mina Almasry  2020-04-01 @505  			&h_cg->rsvd_hugepage[hstate_index(h)];
075a61d07a8eca Mina Almasry  2020-04-01  506  		nrg->css = &h_cg->css;
d85aecf2844ff0 Miaohe Lin    2021-03-24  507  		/*
d85aecf2844ff0 Miaohe Lin    2021-03-24  508  		 * The caller will hold exactly one h_cg->css reference for the
d85aecf2844ff0 Miaohe Lin    2021-03-24  509  		 * whole contiguous reservation region. But this area might be
d85aecf2844ff0 Miaohe Lin    2021-03-24  510  		 * scattered when there are already some file_regions reside in
d85aecf2844ff0 Miaohe Lin    2021-03-24  511  		 * it. As a result, many file_regions may share only one css
d85aecf2844ff0 Miaohe Lin    2021-03-24  512  		 * reference. In order to ensure that one file_region must hold
d85aecf2844ff0 Miaohe Lin    2021-03-24  513  		 * exactly one h_cg->css reference, we should do css_get for
d85aecf2844ff0 Miaohe Lin    2021-03-24  514  		 * each file_region and leave the reference held by caller
d85aecf2844ff0 Miaohe Lin    2021-03-24  515  		 * untouched.
d85aecf2844ff0 Miaohe Lin    2021-03-24  516  		 */
d85aecf2844ff0 Miaohe Lin    2021-03-24  517  		css_get(&h_cg->css);
075a61d07a8eca Mina Almasry  2020-04-01  518  		if (!resv->pages_per_hpage)
075a61d07a8eca Mina Almasry  2020-04-01  519  			resv->pages_per_hpage = pages_per_huge_page(h);
075a61d07a8eca Mina Almasry  2020-04-01  520  		/* pages_per_hpage should be the same for all entries in
075a61d07a8eca Mina Almasry  2020-04-01  521  		 * a resv_map.
075a61d07a8eca Mina Almasry  2020-04-01  522  		 */
075a61d07a8eca Mina Almasry  2020-04-01  523  		VM_BUG_ON(resv->pages_per_hpage != pages_per_huge_page(h));
075a61d07a8eca Mina Almasry  2020-04-01  524  	} else {
075a61d07a8eca Mina Almasry  2020-04-01  525  		nrg->reservation_counter = NULL;
075a61d07a8eca Mina Almasry  2020-04-01  526  		nrg->css = NULL;
075a61d07a8eca Mina Almasry  2020-04-01  527  	}
075a61d07a8eca Mina Almasry  2020-04-01  528  #endif
075a61d07a8eca Mina Almasry  2020-04-01  529  }
075a61d07a8eca Mina Almasry  2020-04-01  530  
d85aecf2844ff0 Miaohe Lin    2021-03-24  531  static void put_uncharge_info(struct file_region *rg)
d85aecf2844ff0 Miaohe Lin    2021-03-24  532  {
d85aecf2844ff0 Miaohe Lin    2021-03-24  533  #ifdef CONFIG_CGROUP_HUGETLB
d85aecf2844ff0 Miaohe Lin    2021-03-24  534  	if (rg->css)
d85aecf2844ff0 Miaohe Lin    2021-03-24  535  		css_put(rg->css);
d85aecf2844ff0 Miaohe Lin    2021-03-24  536  #endif
d85aecf2844ff0 Miaohe Lin    2021-03-24  537  }
d85aecf2844ff0 Miaohe Lin    2021-03-24  538  
a9b3f867404b35 Mina Almasry  2020-04-01  539  static bool has_same_uncharge_info(struct file_region *rg,
a9b3f867404b35 Mina Almasry  2020-04-01  540  				   struct file_region *org)
a9b3f867404b35 Mina Almasry  2020-04-01  541  {
a9b3f867404b35 Mina Almasry  2020-04-01  542  #ifdef CONFIG_CGROUP_HUGETLB
0739eb437f3d39 Baolin Wang   2021-11-05  543  	return rg->reservation_counter == org->reservation_counter &&
a9b3f867404b35 Mina Almasry  2020-04-01  544  	       rg->css == org->css;
a9b3f867404b35 Mina Almasry  2020-04-01  545  
a9b3f867404b35 Mina Almasry  2020-04-01  546  #else
a9b3f867404b35 Mina Almasry  2020-04-01  547  	return true;
a9b3f867404b35 Mina Almasry  2020-04-01  548  #endif
a9b3f867404b35 Mina Almasry  2020-04-01  549  }
a9b3f867404b35 Mina Almasry  2020-04-01  550  
a9b3f867404b35 Mina Almasry  2020-04-01  551  static void coalesce_file_region(struct resv_map *resv, struct file_region *rg)
a9b3f867404b35 Mina Almasry  2020-04-01  552  {
3259914f8cab1b XU pengfei    2022-09-14  553  	struct file_region *nrg, *prg;
a9b3f867404b35 Mina Almasry  2020-04-01  554  
a9b3f867404b35 Mina Almasry  2020-04-01  555  	prg = list_prev_entry(rg, link);
a9b3f867404b35 Mina Almasry  2020-04-01  556  	if (&prg->link != &resv->regions && prg->to == rg->from &&
a9b3f867404b35 Mina Almasry  2020-04-01  557  	    has_same_uncharge_info(prg, rg)) {
a9b3f867404b35 Mina Almasry  2020-04-01  558  		prg->to = rg->to;
a9b3f867404b35 Mina Almasry  2020-04-01  559  
a9b3f867404b35 Mina Almasry  2020-04-01  560  		list_del(&rg->link);
d85aecf2844ff0 Miaohe Lin    2021-03-24  561  		put_uncharge_info(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  562  		kfree(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  563  
7db5e7b67e3e8d Wei Yang      2020-10-13  564  		rg = prg;
a9b3f867404b35 Mina Almasry  2020-04-01  565  	}
a9b3f867404b35 Mina Almasry  2020-04-01  566  
a9b3f867404b35 Mina Almasry  2020-04-01  567  	nrg = list_next_entry(rg, link);
a9b3f867404b35 Mina Almasry  2020-04-01  568  	if (&nrg->link != &resv->regions && nrg->from == rg->to &&
a9b3f867404b35 Mina Almasry  2020-04-01  569  	    has_same_uncharge_info(nrg, rg)) {
a9b3f867404b35 Mina Almasry  2020-04-01  570  		nrg->from = rg->from;
a9b3f867404b35 Mina Almasry  2020-04-01  571  
a9b3f867404b35 Mina Almasry  2020-04-01  572  		list_del(&rg->link);
d85aecf2844ff0 Miaohe Lin    2021-03-24  573  		put_uncharge_info(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  574  		kfree(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  575  	}
a9b3f867404b35 Mina Almasry  2020-04-01  576  }
a9b3f867404b35 Mina Almasry  2020-04-01  577  
2103cf9c3f3ba0 Peter Xu      2021-03-12  578  static inline long
84448c8ecd9a13 Jakob Koschel 2022-04-28  579  hugetlb_resv_map_add(struct resv_map *map, struct list_head *rg, long from,
2103cf9c3f3ba0 Peter Xu      2021-03-12  580  		     long to, struct hstate *h, struct hugetlb_cgroup *cg,
2103cf9c3f3ba0 Peter Xu      2021-03-12  581  		     long *regions_needed)
2103cf9c3f3ba0 Peter Xu      2021-03-12  582  {
2103cf9c3f3ba0 Peter Xu      2021-03-12  583  	struct file_region *nrg;
2103cf9c3f3ba0 Peter Xu      2021-03-12  584  
2103cf9c3f3ba0 Peter Xu      2021-03-12  585  	if (!regions_needed) {
2103cf9c3f3ba0 Peter Xu      2021-03-12  586  		nrg = get_file_region_entry_from_cache(map, from, to);
2103cf9c3f3ba0 Peter Xu      2021-03-12 @587  		record_hugetlb_cgroup_uncharge_info(cg, h, map, nrg);
84448c8ecd9a13 Jakob Koschel 2022-04-28  588  		list_add(&nrg->link, rg);
2103cf9c3f3ba0 Peter Xu      2021-03-12  589  		coalesce_file_region(map, nrg);
2103cf9c3f3ba0 Peter Xu      2021-03-12  590  	} else
2103cf9c3f3ba0 Peter Xu      2021-03-12  591  		*regions_needed += 1;
2103cf9c3f3ba0 Peter Xu      2021-03-12  592  
2103cf9c3f3ba0 Peter Xu      2021-03-12  593  	return to - from;
2103cf9c3f3ba0 Peter Xu      2021-03-12  594  }
2103cf9c3f3ba0 Peter Xu      2021-03-12  595  

:::::: The code at line 505 was first introduced by commit
:::::: 075a61d07a8eca2fe980acd94105ed5d6429c55d hugetlb_cgroup: add accounting for shared mappings

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
