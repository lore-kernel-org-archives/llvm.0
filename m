Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCCC33E36F;
	Wed, 26 Nov 2025 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174132; cv=none; b=S7Bwt78n+f6C5nTz08i4R/YRvAF4U4159KXfO/2F13OXO1RO+SqPSgxML8EvjhUzlczY8/KuO3vgQx5NV2OBm5p0BNcj7swqGRJRNv2aNxlHW9HWwNEG22t6JCjaTxzBq/3Y1RWpPr2ANao2a3HKpSkjgr9EmDr2cTHlsDX5t08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174132; c=relaxed/simple;
	bh=zw6BhefijnLG+S4eYXFq6rpx+ApEO8bQGmGoFyuX9rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nd8FV8MeGS/nK3UAum8wVuypO5bneJgYlCuioYnF1vvooXnTiLG6IBAEw26EDXv4APoTQkGcxwUDxkXvqbUVRbYLt5CXUpTJZGZkIZlGSBdVpTgUYHuJpGAoYpbJmNX6SlauklM6wU/Nzt+GHAfp5qyfl+ukain3+ZLv4+N7UpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSu8ck4g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSu8ck4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764174131; x=1795710131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zw6BhefijnLG+S4eYXFq6rpx+ApEO8bQGmGoFyuX9rc=;
  b=TSu8ck4gI9rrRFC/m7lOYkDSHVZ8kJF/K7R3J6fjsNW/oq2V6klNBOte
   4VD8XhD0A4GviKExxEBvQDHMsor3oFydQuXsGY9b0RqRrJKik9yitCccJ
   DrLVZI4IYaVCtqWPrLXM6FJMcvhg1IJXPn0rQjonmhNwsjNUdNy/Vhjir
   pgW0g3a5VIsvDuO1fSX3jKYNmDLipqHnhCgsMinI2vsyMptP+7NG5vBGX
   aBYQOziGZMvvICGlc8015a+EdoZDMUiCNHHYFjmDHYZE7+KxThKL0hUca
   oiIHBImy0O7/KId/cPQwYCV9qBa0qb4clWPiMHRmW9hvKwKKoiijpNnMc
   g==;
X-CSE-ConnectionGUID: drrw9B7SQI+7bKRyEE7Oeg==
X-CSE-MsgGUID: cQdeDFa/TyW3COkmxhfqgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66293163"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66293163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:08 -0800
X-CSE-ConnectionGUID: HgtPmpJvShehwcNKjUKPFA==
X-CSE-MsgGUID: 8y8gb/ZMRsqrzURpBQN1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197313626"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 08:22:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOIHN-0000000036b-1JlB;
	Wed, 26 Nov 2025 16:22:05 +0000
Date: Thu, 27 Nov 2025 00:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] guest_memfd: add support for userfaultfd minor
 mode
Message-ID: <202511270012.rGTVhLaw-lkp@intel.com>
References: <20251125183840.2368510-5-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125183840.2368510-5-rppt@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/userfaultfd-move-vma_can_userfault-out-of-line/20251126-024059
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125183840.2368510-5-rppt%40kernel.org
patch subject: [PATCH v2 4/5] guest_memfd: add support for userfaultfd minor mode
config: x86_64-randconfig-011-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270012.rGTVhLaw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270012.rGTVhLaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270012.rGTVhLaw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:401:22: error: redefinition of 'kvm_gmem_get_folio'
     401 | static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t pgoff)
         |                      ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:100:22: note: previous definition is here
     100 | static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
         |                      ^
   1 error generated.


vim +/kvm_gmem_get_folio +401 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   399	
   400	#ifdef CONFIG_USERFAULTFD
 > 401	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t pgoff)
   402	{
   403		struct folio *folio;
   404	
   405		folio = kvm_gmem_get_folio(inode, pgoff);
   406		if (IS_ERR_OR_NULL(folio))
   407			return folio;
   408	
   409		if (!folio_test_uptodate(folio)) {
   410			clear_highpage(folio_page(folio, 0));
   411			kvm_gmem_mark_prepared(folio);
   412		}
   413	
   414		return folio;
   415	}
   416	#endif
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
