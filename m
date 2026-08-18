Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358835028C;
	Tue, 18 Aug 2026 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068191; cv=none; b=h/WYedkZNQQuEIJATJjekiBCLg3p/5+eO2No95CRr7467122WIApQ7z5Y39wETgW+6v3Uk4LCm8u5DUAiJlLnHYmul3R++ttYkStj7ZiRxzmQJtQvJnTuSlaiLeSb2f1YhJ+pJuTeF2Nd3L5KuXRSvxdFH31cw+Htcr3xRqMt/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068191; c=relaxed/simple;
	bh=wbTPFX20obqfFsPEUtBnIEP5HBVoFZKD8ToGqH7rbp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a4aNZmpft058NYd618t/bS7S8eG+JPV6V23wY/dH0+1n/pdj2EpYnVxoR78Mk9WsthUdLzwH0YfLcEOF6OwGw7aJq5XM+wDi/AfWe4OkPDHafdnE7pKyOUzs7al0dgR1TCXKCa+RnvIot5+ZDW9W4foJwUeT46iAZHLpA/r7DvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mES3yF03; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mES3yF03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787068190; x=1818604190;
  h=date:from:to:cc:subject:message-id;
  bh=wbTPFX20obqfFsPEUtBnIEP5HBVoFZKD8ToGqH7rbp0=;
  b=mES3yF03KPtuGL5YJMN1uT2ZMponmm1yBDQUxvfbF0aaFgMI2XY+cYYe
   Rr52By0k7gdNL8u0ASJMgUFjs2etsvnj2lDmYbPwmWgkQrRHKUbd4sO/w
   HpYPgjPIrYYa7Z6XrgiJt0Yu8kIAoDJzQ28b+PiNjn4rxkIwZ99BGtaYM
   4NaDiLgUCBRGwp7F46nbvZgtWh2FYp4SBRi6oXTmULkSPUHhwv/Z4n8ri
   ZNo3fmVG8rpQqVeqxKm6L7pwWHcJGKaFIbvCb7wZ1QqAQQtbnc5kDAQy+
   A6ptprcsWiuhfu90IIK2Ito6aIFs1abjs7Ed86dXnFKqsV9AErL7TnMUU
   Q==;
X-CSE-ConnectionGUID: ULvj5qUXT5q28fTGx9Tnaw==
X-CSE-MsgGUID: PW5wCewHTHW3dcS+UC+J+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110350922"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110350922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 08:49:49 -0700
X-CSE-ConnectionGUID: 64jxqES5RAG1xp6lr4G3VQ==
X-CSE-MsgGUID: yM1UHfsaRzqNNUCcx1jHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290064805"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Aug 2026 08:49:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwM4P-00000000eOM-1eJE;
	Tue, 18 Aug 2026 15:49:45 +0000
Date: Tue, 18 Aug 2026 23:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 26/76] include/linux/swapops.h:260:19:
 error: use of undeclared identifier 'SWP_HWPOISON'; did you mean
 'FOLL_HWPOISON'?
Message-ID: <202608182349.Ot06AoJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: 056b294111d8d94a963c8e885186a1a723a59808 [26/76] mm/collapse: sketch the new anonymous collapse engine
config: i386-buildonly-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260818/202608182349.Ot06AoJF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608182349.Ot06AoJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608182349.Ot06AoJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:88:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:88:49: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                                                        ^~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:98:23: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      98 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:107:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     107 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:173:19: error: use of undeclared identifier 'SWP_MIGRATION_READ'; did you mean 'THP_MIGRATION_FAIL'?
     173 |         return swp_entry(SWP_MIGRATION_READ, offset);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_FAIL
   include/linux/vm_event_item.h:62:3: note: 'THP_MIGRATION_FAIL' declared here
      62 |                 THP_MIGRATION_FAIL,
         |                 ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:178:19: error: use of undeclared identifier 'SWP_MIGRATION_READ_EXCLUSIVE'
     178 |         return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:183:19: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     183 |         return swp_entry(SWP_MIGRATION_WRITE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:204:26: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     204 |                                  swp_offset(entry) | SWP_MIG_YOUNG);
         |                                                      ^~~~~~~~~~~~~
   include/linux/swapops.h:66:29: note: expanded from macro 'SWP_MIG_YOUNG'
      66 | #define SWP_MIG_YOUNG                   BIT(SWP_MIG_YOUNG_BIT)
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/swapops.h:62:29: note: expanded from macro 'SWP_MIG_YOUNG_BIT'
      62 | #define SWP_MIG_YOUNG_BIT               (SWP_PFN_BITS)
         |                                          ^~~~~~~~~~~~
   include/linux/swapops.h:40:11: note: expanded from macro 'SWP_PFN_BITS'
      40 |                                       SWP_TYPE_SHIFT)
         |                                       ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:212:26: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     212 |                                  swp_offset(entry) | SWP_MIG_DIRTY);
         |                                                      ^~~~~~~~~~~~~
   include/linux/swapops.h:67:29: note: expanded from macro 'SWP_MIG_DIRTY'
      67 | #define SWP_MIG_DIRTY                   BIT(SWP_MIG_DIRTY_BIT)
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/swapops.h:63:29: note: expanded from macro 'SWP_MIG_DIRTY_BIT'
      63 | #define SWP_MIG_DIRTY_BIT               (SWP_PFN_BITS + 1)
         |                                          ^~~~~~~~~~~~
   include/linux/swapops.h:40:11: note: expanded from macro 'SWP_PFN_BITS'
      40 |                                       SWP_TYPE_SHIFT)
         |                                       ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
>> include/linux/swapops.h:260:19: error: use of undeclared identifier 'SWP_HWPOISON'; did you mean 'FOLL_HWPOISON'?
     260 |         return swp_entry(SWP_HWPOISON, page_to_pfn(page));
         |                          ^~~~~~~~~~~~
         |                          FOLL_HWPOISON
   include/linux/mm_types.h:1904:2: note: 'FOLL_HWPOISON' declared here
    1904 |         FOLL_HWPOISON = 1 << 6,
         |         ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:265:28: error: use of undeclared identifier 'SWP_HWPOISON'; did you mean 'FOLL_HWPOISON'?
     265 |         return swp_type(entry) == SWP_HWPOISON;
         |                                   ^~~~~~~~~~~~
         |                                   FOLL_HWPOISON
   include/linux/mm_types.h:1904:2: note: 'FOLL_HWPOISON' declared here
    1904 |         FOLL_HWPOISON = 1 << 6,
         |         ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:304:19: error: use of undeclared identifier 'SWP_PTE_MARKER'
     304 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^~~~~~~~~~~~~~
   12 errors generated.


vim +260 include/linux/swapops.h

07a57a338adb6e Oscar Salvador 2024-04-07  253  
07a57a338adb6e Oscar Salvador 2024-04-07  254  /*
07a57a338adb6e Oscar Salvador 2024-04-07  255   * Support for hardware poisoned pages
07a57a338adb6e Oscar Salvador 2024-04-07  256   */
07a57a338adb6e Oscar Salvador 2024-04-07  257  static inline swp_entry_t make_hwpoison_entry(struct page *page)
07a57a338adb6e Oscar Salvador 2024-04-07  258  {
07a57a338adb6e Oscar Salvador 2024-04-07  259  	BUG_ON(!PageLocked(page));
07a57a338adb6e Oscar Salvador 2024-04-07 @260  	return swp_entry(SWP_HWPOISON, page_to_pfn(page));
07a57a338adb6e Oscar Salvador 2024-04-07  261  }
07a57a338adb6e Oscar Salvador 2024-04-07  262  

:::::: The code at line 260 was first introduced by commit
:::::: 07a57a338adb6ec9e766d6a6790f76527f45ceb5 mm,swapops: update check in is_pfn_swap_entry for hwpoison entries

:::::: TO: Oscar Salvador <osalvador@suse.de>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
