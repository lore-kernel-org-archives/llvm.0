Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E194EADB;
	Thu, 10 Oct 2024 00:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728520781; cv=none; b=eW9DwfePGjFFZYseUyP7a3i5vuIwh1SaUUZg90kCo/3bGjzv5oSwumU2AgoL2MBhk0gOOjcQI6OxbiXc80cRv/krCzqddHZ37Y61HFi4/E14j6r5siTe0gBQoWrkj2a8+YLNSTnK1L9+SS4H2TUXLYY1+c73KMGFuQjOPLRAgxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728520781; c=relaxed/simple;
	bh=xjFlrItIBV0pAGOX0LCWxUernUT1V5AEqxoU9oXejVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tueR/U+pB7OyjqjnbSMPNCdVxvkW4BzBuZI6KaATD8+jNMoHIpTl1PsacnS4TIkSd3OjlGO6z/pIJq0d9Q9WwnzeU1schksqrVND0jWVSjMQndRfadFSJSjkV+ZcqWga1bu/FPOsJUCu+R1e/6HmSVBBJ+6FJmQ+EQJTs0BqaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSoWgePc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSoWgePc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728520779; x=1760056779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xjFlrItIBV0pAGOX0LCWxUernUT1V5AEqxoU9oXejVE=;
  b=CSoWgePcfCKCokCi7IOEc2jj4SzWiPaa/jxObibcOXmCIcK2Ur7MLSsW
   90A2NmuBwq9nwfsZMmS9YBwZPig9zHUvt0J+dDPjom3ademBf7YGobcX0
   t/OgpqfbR2knB0sZEOAUOSRYwpIJmG/8SjfUxARHmqxPoCihM4OFfnW2E
   Gg2Vf50nlim1PDhcZq4h/EozIB+pedK6dOELlHRH/fZ0/DXh4CZW09Cix
   EFrb6KBInrjjcWacbjGHY3MAwSSlqd/g2oWO1d5pGrDwk9PkzpBMqWEab
   eKHG9OG3WD+3PVN/pKxyPdCeFOUo4toaomcm/CDHjGx2p85y1IJZG23i7
   A==;
X-CSE-ConnectionGUID: xETIs8VGSB2v2Zm7KnSk8w==
X-CSE-MsgGUID: 9SQlnlDCSyWQsU09T7cujQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27805826"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27805826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 17:39:37 -0700
X-CSE-ConnectionGUID: bwHguJ4yQECSGbUQO39TNw==
X-CSE-MsgGUID: 5BEQecfdSPyOCDxG034Flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80944309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 17:39:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syhDJ-0009z2-1e;
	Thu, 10 Oct 2024 00:39:33 +0000
Date: Thu, 10 Oct 2024 08:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 2858/3432] arch/x86/mm/init_64.c:992:28: error:
 call to undeclared function 'bootmem_type'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410100816.bZNgCXpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: cdaa5412be9ac6dcf7649c5f5ab8f8874b9716a8 [2858/3432] bootmem: stop using page->index
config: x86_64-buildonly-randconfig-003-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100816.bZNgCXpD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100816.bZNgCXpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100816.bZNgCXpD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/init_64.c:992:28: error: call to undeclared function 'bootmem_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     992 |                 enum bootmem_type type = bootmem_type(page);
         |                                          ^
   1 error generated.


vim +/bootmem_type +992 arch/x86/mm/init_64.c

   987	
   988	static void __meminit free_pagetable(struct page *page, int order)
   989	{
   990		/* bootmem page has reserved flag */
   991		if (PageReserved(page)) {
 > 992			enum bootmem_type type = bootmem_type(page);
   993			unsigned long nr_pages = 1 << order;
   994	
   995			if (type == SECTION_INFO || type == MIX_SECTION_INFO) {
   996				while (nr_pages--)
   997					put_page_bootmem(page++);
   998			} else
   999				while (nr_pages--)
  1000					free_reserved_page(page++);
  1001		} else
  1002			free_pages((unsigned long)page_address(page), order);
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
