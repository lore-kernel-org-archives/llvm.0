Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF2AD2D;
	Sun,  1 Dec 2024 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068311; cv=none; b=E/WTINcieEitZFSZ2G9I+Zr9rdOKZt4YJYPb46iCflXuw7qPG4fZoSNF1rlDM83ODiJpP+k3eOgertxKHhsYAN0zzVn6mIZeKqoQmZOcsO6p4i8NRv9/Ma6eieXdoEVh02s8CsdOvjfIffAKAjVXAZx1IZXgNBkARXWKWwgL618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068311; c=relaxed/simple;
	bh=SvH3z17PIp59WdNHXebc/82/G3FtkJ+nS/FSzOtFmD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8znZpj4/KbtBqo8LRgw8WXb7/WwDhmujJ5+GxqVYuL0pir0rYLbxXLeCFbIoy9OPqqrRZbQooaz8sbS1JMSQDl9ZCroRgPRhTwbeqJzE9/r4pkPw6ApCFivTNU1Y5gE/hTbYAPnWoo70ITZa2SZacSVFMGLO6jZXIwz7ITKc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avsHJdB6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avsHJdB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733068309; x=1764604309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvH3z17PIp59WdNHXebc/82/G3FtkJ+nS/FSzOtFmD0=;
  b=avsHJdB6UdKT7LYjyZfDdypun5e3XDAETor1RPo4QTP4un+XmWkL5wWu
   gSIbh1+OeNGGoBgdAkvtssp+Uydlk4p8A5IS+H4wX5C/9mhkFUQztzk76
   snI7RxHmDrTokhRU9SwQ6ALTnXJGzySpgqyfzIfu0CThuNBVuf0gWVlu+
   rjPsEmgYAl6oeeXG3OzjBeayUfbr7n+bF4j8Gj3jS2jDXsiZBpFdW+wL/
   mwyyIlVUaQgrNjsf9UXHJIVr5idf3xc+EVnsfc04xTzE3FPStQHZysOh1
   c51DhjR7iB8y0MIyasKH9I6TmHl2NyJIec5qI0kZrmKa2lgoydabDuGKn
   g==;
X-CSE-ConnectionGUID: sBNDo2kxQd27ZKFxA+fo8A==
X-CSE-MsgGUID: ibOlMQEJQCiSKE/GQui8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58629982"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58629982"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 07:51:48 -0800
X-CSE-ConnectionGUID: 0zJt2QkZTregv2C3UU9J+A==
X-CSE-MsgGUID: mKsdUznnSuWHoDHzMuRvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92779850"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2024 07:51:47 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmEa-0001dh-2E;
	Sun, 01 Dec 2024 15:51:44 +0000
Date: Sun, 1 Dec 2024 23:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:pcp_prototype_241117 1/1] mm/memory-failure.c:181:3:
 error: call to undeclared function 'drain_all_pages'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202412012318.hZL8wrgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git pcp_prototype_241117
head:   0bd7954c9b0be944e9c39400721255546f1624d8
commit: 0bd7954c9b0be944e9c39400721255546f1624d8 [1/1] mm: split out per cpu page
config: arm64-randconfig-001-20241201 (https://download.01.org/0day-ci/archive/20241201/202412012318.hZL8wrgR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012318.hZL8wrgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012318.hZL8wrgR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory-failure.c:181:3: error: call to undeclared function 'drain_all_pages'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   drain_all_pages(page_zone(page));
                   ^
   mm/memory-failure.c:181:3: note: did you mean 'drain_local_pages'?
   include/linux/gfp.h:400:6: note: 'drain_local_pages' declared here
   void drain_local_pages(struct zone *zone);
        ^
   1 error generated.


vim +/drain_all_pages +181 mm/memory-failure.c

8cbc82f3ec0d58 Kefeng Wang     2023-03-20  156  
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  157  /*
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  158   * Return values:
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  159   *   1:   the page is dissolved (if needed) and taken off from buddy,
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  160   *   0:   the page is dissolved (if needed) and not taken off from buddy,
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  161   *   < 0: failed to dissolve.
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  162   */
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  163  static int __page_handle_poison(struct page *page)
510d25c92ec4ac Naoya Horiguchi 2021-06-30  164  {
f87060d345232c Michael Wang    2021-09-02  165  	int ret;
510d25c92ec4ac Naoya Horiguchi 2021-06-30  166  
1983184c22dd84 Miaohe Lin      2024-04-07  167  	/*
1983184c22dd84 Miaohe Lin      2024-04-07  168  	 * zone_pcp_disable() can't be used here. It will
54fa49b2e0ef3a Sidhartha Kumar 2024-04-11  169  	 * hold pcp_batch_high_lock and dissolve_free_hugetlb_folio() might hold
1983184c22dd84 Miaohe Lin      2024-04-07  170  	 * cpu_hotplug_lock via static_key_slow_dec() when hugetlb vmemmap
1983184c22dd84 Miaohe Lin      2024-04-07  171  	 * optimization is enabled. This will break current lock dependency
1983184c22dd84 Miaohe Lin      2024-04-07  172  	 * chain and leads to deadlock.
1983184c22dd84 Miaohe Lin      2024-04-07  173  	 * Disabling pcp before dissolving the page was a deterministic
1983184c22dd84 Miaohe Lin      2024-04-07  174  	 * approach because we made sure that those pages cannot end up in any
1983184c22dd84 Miaohe Lin      2024-04-07  175  	 * PCP list. Draining PCP lists expels those pages to the buddy system,
1983184c22dd84 Miaohe Lin      2024-04-07  176  	 * but nothing guarantees that those pages do not get back to a PCP
1983184c22dd84 Miaohe Lin      2024-04-07  177  	 * queue if we need to refill those.
1983184c22dd84 Miaohe Lin      2024-04-07  178  	 */
54fa49b2e0ef3a Sidhartha Kumar 2024-04-11  179  	ret = dissolve_free_hugetlb_folio(page_folio(page));
1983184c22dd84 Miaohe Lin      2024-04-07  180  	if (!ret) {
1983184c22dd84 Miaohe Lin      2024-04-07 @181  		drain_all_pages(page_zone(page));
510d25c92ec4ac Naoya Horiguchi 2021-06-30  182  		ret = take_page_off_buddy(page);
1983184c22dd84 Miaohe Lin      2024-04-07  183  	}
510d25c92ec4ac Naoya Horiguchi 2021-06-30  184  
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  185  	return ret;
510d25c92ec4ac Naoya Horiguchi 2021-06-30  186  }
510d25c92ec4ac Naoya Horiguchi 2021-06-30  187  

:::::: The code at line 181 was first introduced by commit
:::::: 1983184c22dd84a4d95a71e5c6775c2638557dc7 mm/memory-failure: fix deadlock when hugetlb_optimize_vmemmap is enabled

:::::: TO: Miaohe Lin <linmiaohe@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
