Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE896AD4B;
	Mon,  8 Dec 2025 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765155521; cv=none; b=nKfENOdnGCryLFjMuYB1151tcrxs5HSYWo1SIP4ngOWM3LjpKMVr0W8jhppwlhWTcLv0Mxcva5qvwtPW30uOOrZ17H4rtSf2xaejeKtrf3sg3XXq7EKzJW3WzcN1bQ6y+XM1yycKHxFbf3YUvqLKu2VF5t/vKChntgBho4rk3gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765155521; c=relaxed/simple;
	bh=hbAioPhKO9fSb4zT/6PHBn7XlZKWGL+tAyvGM9obxMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVUNusmNti5/+Z+0Yz2cLuTDOIHrbBiyG9PyhvmdWDxv0tvZuaMR1JOhPQYs+8NWzmcPZd2u1QHY9nQfNhA1B2pNV0MyNhuS2hgBJajWd/9jLWzk5a1ii8LmF1iLFE0zVNRCnu9ky208i+SUoWaOtbFAz2rrnLbVH+kqeA2g4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T784gBWR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T784gBWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765155519; x=1796691519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbAioPhKO9fSb4zT/6PHBn7XlZKWGL+tAyvGM9obxMY=;
  b=T784gBWRpvIMsJlh5Mq7RAb6ZhYh6nnc2zwAos9frvw/8BYcID1wekB3
   rfqSk7B1Em8tkNtdSAl9fTHNYNxavq3vGIti4iP1MYca0yDj1vEKkqdq7
   axb8Fu9SIdtmdFky0fTs8Lc05p1Rz+I+Gw8Xnl1bNSeP9sukR2Gmmkzxu
   dYIQFJ/MFpRlolNqt+XlDgzVsozMnhBMKvwNJGDBZ0TY1SMCKF6SfOeLl
   JfTVNA1UC6jKzpJQxuwFWfNAfXbbDxl5foyt2OeWE7Q/avOu6hivpGz9v
   4jPLphOnzxyIJDAIpOu/QZE239bgVCIarUqUSCyk82sIlV/4lDCHfCzPI
   w==;
X-CSE-ConnectionGUID: +r3/Hye0TEyqRuWsfREasA==
X-CSE-MsgGUID: dNBxzPSTRLKK35ePWpUZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84506905"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84506905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 16:58:39 -0800
X-CSE-ConnectionGUID: kh9BuagNTPKDQK14tmG8mw==
X-CSE-MsgGUID: AGxkkWZYSHO5q8/CiV5nBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="219153008"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Dec 2025 16:58:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSPaF-00000000Jkh-2ef4;
	Mon, 08 Dec 2025 00:58:35 +0000
Date: Mon, 8 Dec 2025 08:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/9] mm/page_owner: add swap hooks
Message-ID: <202512080831.Fl7k0uXy-lkp@intel.com>
References: <20251205231721.104505-6-mfo@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205231721.104505-6-mfo@igalia.com>

Hi Mauricio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauricio-Faria-de-Oliveira/mm-add-config-option-SWAP_PAGE_OWNER/20251206-072021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251205231721.104505-6-mfo%40igalia.com
patch subject: [PATCH RFC 5/9] mm/page_owner: add swap hooks
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251208/202512080831.Fl7k0uXy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080831.Fl7k0uXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080831.Fl7k0uXy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_owner.c:593:7: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     593 |         long i = 0, nr_pages = folio_nr_pages(folio);
         |              ^
   1 warning generated.


vim +/i +593 mm/page_owner.c

   584	
   585	/* Load the initial stack information from xarray to page_owner. */
   586	void __page_owner_swap_restore(swp_entry_t entry, struct folio *folio)
   587	{
   588		struct page_ext_iter iter;
   589		struct page_ext *page_ext;
   590		struct page_owner *page_owner;
   591		struct swap_page_owner *spo;
   592		depot_stack_handle_t handle = 0;
 > 593		long i = 0, nr_pages = folio_nr_pages(folio);
   594	
   595		rcu_read_lock();
   596		for_each_page_ext(&folio->page, nr_pages, page_ext, iter) {
   597			spo = (struct swap_page_owner *) load_swap_page_owner(entry);
   598			if (!spo) {
   599				rcu_read_unlock();
   600				return;
   601			}
   602	
   603			page_owner = get_page_owner(page_ext);
   604			copy_from_swap_page_owner(page_owner, spo);
   605	
   606			if (!handle)
   607				handle = page_owner->handle;
   608			i++;
   609			entry.val++;
   610		}
   611		rcu_read_unlock();
   612	
   613		/*
   614		 * Fix-up: decrement refcount of the swap-in allocation.
   615		 * It was incremented by the page-alloc at swap-in.
   616		 * (early_handle: see __reset_page_owner().)
   617		 *
   618		 * FIXME(mfo): 'dec_stack_record_count: refcount went to 0 ...'
   619		 * with stack_depot oops is hit occasionaly on tests or shutdown.
   620		 */
   621		if (handle != early_handle)
   622			dec_stack_record_count(handle, nr_pages);
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
