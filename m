Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892283168E0;
	Mon,  3 Nov 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187117; cv=none; b=YhGp03HHix1G7avaHwFOJvKj4ZdBRJUYsw7GpOQD6tQKXn4TUpvt2KFz6jZ9nAFkhL4Q8OEYO7nAdyxkYl3AFL6VsjSbt2n8VEKeoq8SFIZAhwqVoMxG1YoJbIA98sJ+OZAYbhHKDknmjcUgCiCmGiOais/BaYZ0hc6nohxPcPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187117; c=relaxed/simple;
	bh=t926oHxXyeoHO/tZR4YDfvuIUGOhvh1nCNJiG044Dv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/JiN7Nvzgjl6pOY4gZ4g0Kp3nc3rTGG5gUxVYWDM/y590blHYDurzVnq3Cgf38rMETfMpFchioqAIWQBWPkap162Jl6sE6DVsDSQjHXQp9P6wGEPlkutD1JZcM83TeomKoSKv//+0k14trKZNLoJYLOBMecXISBjLNwPjF7uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AquaoUMh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AquaoUMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762187115; x=1793723115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t926oHxXyeoHO/tZR4YDfvuIUGOhvh1nCNJiG044Dv4=;
  b=AquaoUMhpcOsUmN+pbyzfsWUQpOGNzrjGKKsbjmr/0Vv6COpIYETUt01
   dszHgKvrUTco80SZVeKJG0CLvpqBi0yYO5ppLGTeHoZeBlNNqTHACQz41
   WhJIwu+QYIWbgWNPV+UO+3aYI05vxEaA8WGmEwtdwKovJIZP5q15uMDhH
   80TqN2bU9mIKINWugEYQVOFTeMPz7aTaZfWpNadxqFP3Q+/UdLekoo9rT
   Cla+3pNc2dyFToG+xwajbXEssH6nAjB9PlkSKN0LUybZ9rq+G/+dt2yRM
   75hiAWMt5kCPrYrzqk0Q1axdXk+LU/XkkO6o7Y8Uxj9wWTtIC+ELZS8UY
   g==;
X-CSE-ConnectionGUID: xBNZG6zeR/mBI1Ki+pJ01Q==
X-CSE-MsgGUID: 3HklEMlmRMa0+IYes3rOhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63962873"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63962873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:25:15 -0800
X-CSE-ConnectionGUID: PnTRSjgDTD+C/2KQbGtg6A==
X-CSE-MsgGUID: kJFZyWkqRdKS4C+GNCdU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="191251179"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2025 08:25:07 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxMe-000QKi-0o;
	Mon, 03 Nov 2025 16:25:04 +0000
Date: Tue, 4 Nov 2025 00:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Arnd Bergmann <arnd@arndb.de>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 10/16] mm: replace pmd_to_swp_entry() with
 leafent_from_pmd()
Message-ID: <202511032303.n4dF1k87-lkp@intel.com>
References: <38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-correctly-handle-UFFD-PTE-markers/20251103-204118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 10/16] mm: replace pmd_to_swp_entry() with leafent_from_pmd()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251103/202511032303.n4dF1k87-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511032303.n4dF1k87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511032303.n4dF1k87-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/folio-compat.c:7:
   In file included from include/linux/migrate.h:9:
   In file included from include/linux/leafops.h:6:
>> include/linux/swapops.h:90:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:90:49: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                                                        ^
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:100:23: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     100 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:109:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     109 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
>> include/linux/swapops.h:395:19: error: use of undeclared identifier 'SWP_PTE_MARKER'
     395 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^
   include/linux/swapops.h:448:15: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     448 |         BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
         |                      ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:491:28: error: use of undeclared identifier 'MAX_SWAPFILES'
     491 |         return swp_type(entry) >= MAX_SWAPFILES;
         |                                   ^
   7 errors generated.


vim +/MAX_SWAPFILES_SHIFT +90 include/linux/swapops.h

099dd6878b9b12 Peter Xu       2021-06-15   82  
^1da177e4c3f41 Linus Torvalds 2005-04-16   83  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16   84   * Store a type+offset into a swp_entry_t in an arch-independent format
^1da177e4c3f41 Linus Torvalds 2005-04-16   85   */
^1da177e4c3f41 Linus Torvalds 2005-04-16   86  static inline swp_entry_t swp_entry(unsigned long type, pgoff_t offset)
^1da177e4c3f41 Linus Torvalds 2005-04-16   87  {
^1da177e4c3f41 Linus Torvalds 2005-04-16   88  	swp_entry_t ret;
^1da177e4c3f41 Linus Torvalds 2005-04-16   89  
3159f943aafdba Matthew Wilcox 2017-11-03  @90  	ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
^1da177e4c3f41 Linus Torvalds 2005-04-16   91  	return ret;
^1da177e4c3f41 Linus Torvalds 2005-04-16   92  }
^1da177e4c3f41 Linus Torvalds 2005-04-16   93  
^1da177e4c3f41 Linus Torvalds 2005-04-16   94  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16   95   * Extract the `type' field from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds 2005-04-16   96   * arch-independent format
^1da177e4c3f41 Linus Torvalds 2005-04-16   97   */
^1da177e4c3f41 Linus Torvalds 2005-04-16   98  static inline unsigned swp_type(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds 2005-04-16   99  {
3159f943aafdba Matthew Wilcox 2017-11-03  100  	return (entry.val >> SWP_TYPE_SHIFT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  101  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  102  
^1da177e4c3f41 Linus Torvalds 2005-04-16  103  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  104   * Extract the `offset' field from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds 2005-04-16  105   * arch-independent format
^1da177e4c3f41 Linus Torvalds 2005-04-16  106   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  107  static inline pgoff_t swp_offset(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  {
3159f943aafdba Matthew Wilcox 2017-11-03 @109  	return entry.val & SWP_OFFSET_MASK;
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
