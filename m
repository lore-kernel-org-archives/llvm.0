Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDD1FF7B7;
	Tue, 11 Feb 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277489; cv=none; b=ABqgLOLKhFHy8B5sO+xTexUvVFuj4lxb8NhDeYux3XFQpY4HdjcIB1QyWYypV7RLLVOSjseDtiMejqn5w6QTScwOCBbHm9Z7L22Ik3QW/HjiV+ZPXOqouONTludLvHthnjPFboWoOPp3X6TEDUTUOmlLIutbVTex57MQPZeY6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277489; c=relaxed/simple;
	bh=5lF49+R4dF5j1QuzHa5SxfxlmGdml88c2XvHLXZzZCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSR3pgIHAZmeL7DWit7PwvgWR6rk7hkCaRGgxp1pGDT9XcVOUPohohtRqy0F2ej2n6DY3h34pF7CVgV7l+zH5rY6EA6GNTN62EYMMDE/RN0wE1XfPsRFcEw2ilbjWErOrAXtHZQuNu8PqoP6Z3dqS9L82zYN4VMfRaVUxD0NH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WV4cGtAO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WV4cGtAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739277487; x=1770813487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5lF49+R4dF5j1QuzHa5SxfxlmGdml88c2XvHLXZzZCs=;
  b=WV4cGtAOjd81WMIPTF8gN4GgvEMnXCsKyjQLsZ24r3sNWjaiVXr7XOg5
   ZOQcN/MyFjfpMbY6ixGcyRpCDg/m8iPL1BVI+LsNUpRQlYHLmnQXpHth5
   7zdrktf+cru99ekQP1An81+Ik0Fjj2rMl/t/fOljQOfkkWqBJSUnBaCZ2
   4CkODVgdOcY/LkXg/HZH4LK78DvDjSFYWYZBPBOVIW3eaQhTV6QflYl+7
   0EPI5AS0bJti43ltTGvptExaILqdC/nNsKaXzZ82jFRsl+5SqDPnhV0Ax
   DQ1yVsyXcxm/cR2f+D2E7/L5ONqq6aVMBaap2i0jNTpYn4iZ5dryBUdKh
   A==;
X-CSE-ConnectionGUID: hZ/Cs3/ZRQquibxx6oJHeQ==
X-CSE-MsgGUID: VJBJBK9+QyCDBgU0zy+jaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39587990"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39587990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:38:07 -0800
X-CSE-ConnectionGUID: TlXDvU1wQXWgytPk2L3r4w==
X-CSE-MsgGUID: qkYDq0uNR5uadrZVKoJ/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112331802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 04:38:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thpWd-00149v-2F;
	Tue, 11 Feb 2025 12:38:03 +0000
Date: Tue, 11 Feb 2025 20:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] mm: Create snapshot_page()
Message-ID: <202502112000.w8too7ue-lkp@intel.com>
References: <20250210212142.4002210-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210212142.4002210-3-willy@infradead.org>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Constify-folio_mapping-and-swapcache_mapping/20250211-052512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250210212142.4002210-3-willy%40infradead.org
patch subject: [RFC PATCH 2/3] mm: Create snapshot_page()
config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112000.w8too7ue-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112000.w8too7ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112000.w8too7ue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:1275:6: warning: variable 'idx' is uninitialized when used here [-Wuninitialized]
    1275 |         if (idx < MAX_FOLIO_NR_PAGES || folio_test_hugetlb(folio)) {
         |             ^~~
   mm/util.c:1256:19: note: initialize the variable 'idx' to silence this warning
    1256 |         unsigned long idx, nr_pages = 1;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/idx +1275 mm/util.c

  1242	
  1243	/*
  1244	 * If you have an unstable reference to a page, use this to get a
  1245	 * somewhat-consistent (potentially outdated) snapshot.  The consistency
  1246	 * is limited to the page being contained in the folio.  You need to pass in
  1247	 * a scratch folio and scratch page, probably allocated on the stack.
  1248	 * You get back a pointer to the scratch folio you passed in, marked
  1249	 * as const to remind you not to modify this.
  1250	 */
  1251	const struct folio *snapshot_page(struct folio *foliop, struct page *precise,
  1252			unsigned long *idxp, const struct page *unstable)
  1253	{
  1254		struct folio *folio;
  1255		unsigned long head;
  1256		unsigned long idx, nr_pages = 1;
  1257		int loops = 5;
  1258	
  1259	again:
  1260		memcpy(precise, unstable, sizeof(struct page));
  1261		head = precise->compound_head;
  1262		/* Open-coded !PageTail because page_is_fake_head() doesn't work here */
  1263		if ((head & 1) == 0) {
  1264			folio = (struct folio *)precise;
  1265			*idxp = 0;
  1266			/* Not a tail, not a head, we have a single page */
  1267			if (!folio_test_large(folio))
  1268				goto out;
  1269			folio = (struct folio *)unstable;
  1270		} else {
  1271			folio = (struct folio *)(head - 1);
  1272			*idxp = folio_page_idx(folio, unstable);
  1273		}
  1274	
> 1275		if (idx < MAX_FOLIO_NR_PAGES || folio_test_hugetlb(folio)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
