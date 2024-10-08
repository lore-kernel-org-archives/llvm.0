Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF1213EC1;
	Tue,  8 Oct 2024 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728415811; cv=none; b=JR2eXyQNANPUz9q8jRf0iPYsolQjsJ5s2WvBQyvwbDgAiwPVGvq7fdfFwGGWXtJO0tAHqEmF5PYmnHJDToixnasfecygV76n3nRxtgOwINJxto6Zy+lYUm+2bZuwiwtDgdmPkXB4suSXmTIZBN9rQpZIbjtMq5DYhgrAwtFMFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728415811; c=relaxed/simple;
	bh=dXtAb0QVDHqUCH+D1YOwgAbi29h8B3NCCdv1wgQL7eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaSJulX8k3Nje3UprTprP3sZJi7SRxXHXfxy1FVynDZzROWqrrlwGL5EUzQDGi55nemoMhmFTT/z/dyOT0hktFbhLPzqhB2pJSzGY/J9G9v/Qjt4oATQxvz/wHSvgaGre2S5P+SZjY+34zkkNH4z/AGPx3ECTj2W4lLx9kHXdpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESSlpcru; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESSlpcru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728415809; x=1759951809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dXtAb0QVDHqUCH+D1YOwgAbi29h8B3NCCdv1wgQL7eY=;
  b=ESSlpcrusj/kd4aAIJ8J00jTlFA9uOLpvmYMrvF6Kn+FCsuHm0DJk/gk
   fyOBq/BC8Ufah2V2X74+LBrw7jX+zXxmfvdhlByBhOPzerSaeKiSQp5Gd
   7liXLaumXkCozUoZhhOOl8DQlHTy3J9lW2AvnvfbJ1PBIWBfbXX1mthnT
   XNp9pLKROE0vDw7oK+7xn5Nou6deqqdOGjbY4iYb+2NBXphoP7Gz8q0gm
   2wm+TGs18H7smNbMKNktJ8KqW2WTB+h+kHr9fGttu7gETw1Sp/K+TQBsh
   b6PSug6860w7EMt9s/gKOkrU/i3Q1aHkNNjjmv4lSSRyHrDAqmn0WRXr+
   Q==;
X-CSE-ConnectionGUID: gom+yfgJTzW1sqaM32Mw0Q==
X-CSE-MsgGUID: lMTEWgDATG6RzJGwEOGi0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27600552"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27600552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 12:30:08 -0700
X-CSE-ConnectionGUID: G+AnJdxlSwaMXXdfJ0fIag==
X-CSE-MsgGUID: 5Uq+7RNCQ2i7djkSKD2oSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75835543"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2024 12:30:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syFuG-0008JI-2H;
	Tue, 08 Oct 2024 19:30:04 +0000
Date: Wed, 9 Oct 2024 03:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 5/7] bootmem: Stop using page->index
Message-ID: <202410090311.eaqcL7IZ-lkp@intel.com>
References: <20241005200121.3231142-6-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005200121.3231142-6-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/locking/core tip/x86/mm dennis-percpu/for-next linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Convert-page_to_pgoff-to-page_pgoff/20241006-040239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241005200121.3231142-6-willy%40infradead.org
patch subject: [PATCH v2 5/7] bootmem: Stop using page->index
config: x86_64-randconfig-014-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090311.eaqcL7IZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090311.eaqcL7IZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090311.eaqcL7IZ-lkp@intel.com/

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
