Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F872D5C97;
	Mon, 20 Oct 2025 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991087; cv=none; b=BTlg7e2xA3etgQvgztoVXa0Ylot1L0k6U8LlPC6vewnKIOBiRwm6vt7vp0ToVsLbYiX3GynjTCKws4BOLzbKn2UQ69mNdL+QUh1gUjVVQ1jEBWrhKP9Hu71hT42/4EZwuPlevRw6YNp89xlWnQJlJR759hrSByoEgYRcADZejxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991087; c=relaxed/simple;
	bh=rAof/wFe8d1Lg9fIBWp0u8gzJC3DIyE6skiRcnkaQ44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvR/ECiJ7xJlFLHzIFf0KM4B1cv5GFGl+EYkQA2WbRYegSWM5SOJqa3WLi1OW7l33OUGejinjCSn+kXAYJPJwMXXZUkxEYpCoFc6v9apvbxC28A9PTVaMAnqwQbIOTv+niOKBGxSbda6AhMp1pbjFDDnF7qY+oaEYx6i5EXlBxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWDjfbSp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWDjfbSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760991087; x=1792527087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAof/wFe8d1Lg9fIBWp0u8gzJC3DIyE6skiRcnkaQ44=;
  b=dWDjfbSpgaxg15FRQOLmibt18wUxAr2hz08OWbqv8Q9YcWnoQV210GgP
   Y/5Yh8v1qs27A/C/huVWQY87PGVHFq7moImUrbleFWe93U9RYZOVMEDgq
   KmlJEPtJCRe/+69MHFHIfnU2lB+ov72XquZ4D02r0kJx5of/HwKjEzDrT
   GTdMsZWlFrEEfjLq1EEFRhbvqT5eIJrYzg0Bynehd5GNs0KQDyeo8IloS
   2b8NH9Uun57Fh/cnZwFeApSYerZqofd0gVGgvRZSpoFgdnz8uCs8yjK6X
   YvDa9uw3z4dL97rKZ7klX+5go2SBPwft3GmeqQeB804/VAZXsl1jr9gZA
   g==;
X-CSE-ConnectionGUID: +QCI2LU0SIKbwt1lSUCQew==
X-CSE-MsgGUID: tYI+0x8zSqG3LaFDTrizXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63210017"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63210017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:11:26 -0700
X-CSE-ConnectionGUID: VR2G52cgTqiP7k/2sbn2jA==
X-CSE-MsgGUID: RRxsUXTiTnuOhT8doq9jLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183116151"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2025 13:11:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAwDy-000A85-2O;
	Mon, 20 Oct 2025 20:11:22 +0000
Date: Tue, 21 Oct 2025 04:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 4/4] mm/page_alloc.c:6998:9: error:
 use of undeclared identifier 'CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION'
Message-ID: <202510210449.M2pCsgzB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux movable_gigantic
head:   cf3e52163565dce5fff0f9f15a92cbbd452fc470
commit: cf3e52163565dce5fff0f9f15a92cbbd452fc470 [4/4] page_alloc: allow migration of smaller hugepages during contig alloc.
config: hexagon-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210449.M2pCsgzB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210449.M2pCsgzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210449.M2pCsgzB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:6998:9: error: use of undeclared identifier 'CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION'
    6998 |                         if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION +6998 mm/page_alloc.c

  6978	
  6979	static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
  6980					   unsigned long nr_pages)
  6981	{
  6982		unsigned long i, end_pfn = start_pfn + nr_pages;
  6983		struct page *page;
  6984	
  6985		for (i = start_pfn; i < end_pfn; i++) {
  6986			page = pfn_to_online_page(i);
  6987			if (!page)
  6988				return false;
  6989	
  6990			if (page_zone(page) != z)
  6991				return false;
  6992	
  6993			if (PageReserved(page))
  6994				return false;
  6995	
  6996			if (PageHuge(page)) {
  6997				/* Don't consider moving same size/larger pages */
> 6998				if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
  6999				    ((1 << compound_order(page)) >= nr_pages))
  7000					return false;
  7001			}
  7002		}
  7003		return true;
  7004	}
  7005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
