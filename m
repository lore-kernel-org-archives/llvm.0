Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2F849C;
	Mon, 13 Apr 2026 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776113933; cv=none; b=n1T4DPwTPePdwbciqGRjMWOAxU7K4MfxdGHcWtkaj3qAaAEQ61iaRimuABtbPwNklHxcWY18U4zqQuTYbJ8JYI61/BvquHCqgMcFIP+H2sFo+CdXf3UVfe6IHZ4P6kRqn4hxhhAYRgJs8N1cYpi6ZdZs7IaF8T8HYYxWlnQYYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776113933; c=relaxed/simple;
	bh=0nFUNq9uEIASWRFhwO2TFEMh8F2N5o1b8k4Wqbwb7Co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l6az9Z7ymff3ynxMPN1rCYU0/2b/sADmtyuHTxwQfS22e5M7lwK1oPSfDZiy8F/mzuYWXEwGeMY4Y2cBNToU9yO+16nLyiE9zLavrkF/Aj2higSzKMnCRB6PtyXSTCAarRKuc0fAiKeZb79Ccw78n8WhKQNCGeM6h54+5KJVAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYMn/lf9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYMn/lf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776113931; x=1807649931;
  h=date:from:to:cc:subject:message-id;
  bh=0nFUNq9uEIASWRFhwO2TFEMh8F2N5o1b8k4Wqbwb7Co=;
  b=KYMn/lf991i8PIUZMJQn/kY2jUmrUSYP2NMzZjvIArdvRXQGJi8rQVFh
   alrdLcfg17FeLiuN96K2OagX9z6ZmB+0XvwxAX6eKPaxHobmA7gDGTubk
   KjAd9hna/g0hRrkVs3UiwJkZfwrC7ti/6eu2GFkGKGoFhpfTqSjUGQHS6
   kP5BvV/vUdvB7r5Pm7du5gTE42cxdi9itk+A3tmehqKzgPD2BoKWuemvB
   wlskOnfkj5qGuOnm4anfWneLTqpmhaltm8QG2gXX9RaTY5hkqwiKTGlyZ
   pKGjoSDll5CQG6N6kVKWn8xQbARvz0ShOmA0ub3SU+FC92WkOrWvXUEAN
   w==;
X-CSE-ConnectionGUID: +Nbq5lllStufK/XOpJInRw==
X-CSE-MsgGUID: tpBu695eTwycXFLPVZ1WEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94629295"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="94629295"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 13:58:51 -0700
X-CSE-ConnectionGUID: rGjjANCbQZK1bTj4h1NAXw==
X-CSE-MsgGUID: ZKAGbMLdS1G8TPte33hUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="253102546"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Apr 2026 13:58:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCOMp-000000000Aa-2faP;
	Mon, 13 Apr 2026 20:58:47 +0000
Date: Mon, 13 Apr 2026 22:57:51 +0200
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/page_alloc.c:1758:34: error: use of undeclared identifier
 'page_reporting_host_zeroes'; did you mean 'page_reporting_notify_free'?
Message-ID: <202604132244.y6063sr4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-S-Tsirkin/mm-page_alloc-propagate-PageReported-flag-across-buddy-splits/20260413-231432
head:   b595bf053bb60e812c690b177ae9b15d9df745d5
commit: 8abc113d8e46f1cc8c8d4264f87923849d312e56 mm: page_reporting: skip redundant zeroing of host-zeroed reported pages
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260413/202604132244.y6063sr4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132244.y6063sr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132244.y6063sr4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:1758:34: error: use of undeclared identifier 'page_reporting_host_zeroes'; did you mean 'page_reporting_notify_free'?
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                page_reporting_notify_free
   include/linux/jump_label.h:503:43: note: expanded from macro 'static_branch_unlikely'
     503 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   mm/page_reporting.h:51:20: note: 'page_reporting_notify_free' declared here
      51 | static inline void page_reporting_notify_free(unsigned int order)
         |                    ^
>> mm/page_alloc.c:1758:34: error: use of undeclared identifier 'page_reporting_host_zeroes'; did you mean 'page_reporting_notify_free'?
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                page_reporting_notify_free
   include/linux/jump_label.h:504:38: note: expanded from macro 'static_branch_unlikely'
     504 |                 branch = arch_static_branch_jump(&(x)->key, false);             \
         |                                                    ^
   mm/page_reporting.h:51:20: note: 'page_reporting_notify_free' declared here
      51 | static inline void page_reporting_notify_free(unsigned int order)
         |                    ^
>> mm/page_alloc.c:1758:10: error: member reference base type 'void (unsigned int)' is not a structure or union
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:504:40: note: expanded from macro 'static_branch_unlikely'
     504 |                 branch = arch_static_branch_jump(&(x)->key, false);             \
         |                                                   ~~~^ ~~~
>> mm/page_alloc.c:1758:34: error: use of undeclared identifier 'page_reporting_host_zeroes'; did you mean 'page_reporting_notify_free'?
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                page_reporting_notify_free
   include/linux/jump_label.h:505:48: note: expanded from macro 'static_branch_unlikely'
     505 |         else if (__builtin_types_compatible_p(typeof(*x), struct static_key_false)) \
         |                                                       ^
   mm/page_reporting.h:51:20: note: 'page_reporting_notify_free' declared here
      51 | static inline void page_reporting_notify_free(unsigned int order)
         |                    ^
>> mm/page_alloc.c:1758:34: error: use of undeclared identifier 'page_reporting_host_zeroes'; did you mean 'page_reporting_notify_free'?
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                page_reporting_notify_free
   include/linux/jump_label.h:506:33: note: expanded from macro 'static_branch_unlikely'
     506 |                 branch = arch_static_branch(&(x)->key, false);                  \
         |                                               ^
   mm/page_reporting.h:51:20: note: 'page_reporting_notify_free' declared here
      51 | static inline void page_reporting_notify_free(unsigned int order)
         |                    ^
>> mm/page_alloc.c:1758:10: error: member reference base type 'void (unsigned int)' is not a structure or union
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:506:35: note: expanded from macro 'static_branch_unlikely'
     506 |                 branch = arch_static_branch(&(x)->key, false);                  \
         |                                              ~~~^ ~~~
   6 errors generated.


vim +1758 mm/page_alloc.c

  1747	
  1748	static __always_inline void page_del_and_expand(struct zone *zone,
  1749							struct page *page, int low,
  1750							int high, int migratetype)
  1751	{
  1752		int nr_pages = 1 << high;
  1753		bool was_reported = page_reported(page);
  1754	
  1755		__del_page_from_free_list(page, zone, high, migratetype);
  1756	
  1757		was_reported = was_reported &&
> 1758			       static_branch_unlikely(&page_reporting_host_zeroes);
  1759	
  1760		nr_pages -= expand(zone, page, low, high, migratetype, was_reported);
  1761		account_freepages(zone, -nr_pages, migratetype);
  1762	
  1763		/*
  1764		 * If the page was reported and the host is known to zero reported
  1765		 * pages, mark it zeroed via page->private so that
  1766		 * post_alloc_hook() can skip redundant zeroing.
  1767		 */
  1768		if (was_reported)
  1769			set_page_private(page, MAGIC_PAGE_ZEROED);
  1770	}
  1771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
