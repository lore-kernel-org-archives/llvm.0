Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B439B29405;
	Sun, 21 Sep 2025 02:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758423071; cv=none; b=maIMeeuxOYMQeB6w0ZvzqSGI6oiP4i4vhv5NzmmwnJXDdoqXyw+0oCddDQ0/uDtWn2RpO4srnWBufRnLJ0f1x4DNO+IJpzo8PgGRZXwCiD1fokR7Ue2WrgauiLV1JHQ2FROcaafZ+FV6uD2zm0VTuyGQbkSn0PghHvf51N3MHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758423071; c=relaxed/simple;
	bh=8fhQLFIuGNNY2mxfTC5RKkbbwX1z1TpSWw5hUNknMTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjIeh7YsCX6ukbOkgvbeImHy4OhBfpcca5O5HLeC2oqQQXUIgV6x2drERim86YfJwjZwZ7mLsWoZJ6PWB478pJUSM1lLCKN27Yk7kuq2Bx+VgNMYkKGqh01oamyXOvnP0ggISC97DvC+3x9SY7uWm2h8TUFIz/ogxO9Xd/U8+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8haxR7j; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8haxR7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758423069; x=1789959069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fhQLFIuGNNY2mxfTC5RKkbbwX1z1TpSWw5hUNknMTo=;
  b=U8haxR7jdtC5ZEM8nRuCqsrUEndUMl7HmRVw8is9NgSIMtmSE7ppYvU+
   C69jzWxo7ywL47S9cEOjH3HHalBYy5uM6GHY6H2H4ani01xAJCuIBH5VU
   GO3fMTrHnIE3PHljAvypAhKpRiy/c9wMSMlRzhBwPSZdFcURkTsqmlm8i
   u7A7m3W9hKcuFCwpB6RI6DVBrqZK8tXiP58v1/ikHlkQCOgn8Q/7jwzNl
   ZcY4mXtHN76oU9qx5rB1pfzHjxZz99k04FzfDCLOQb5KCVYiwi1peOtJh
   a09g7OdHxb82M0JML+odaNbmriT+T0dhV9gbkrNiPnE+lhvmuffN7LdvW
   g==;
X-CSE-ConnectionGUID: XxuU0iUrRkey4Hzqd74gnQ==
X-CSE-MsgGUID: 7N8P4tP8Tau5fix0oHW/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="78166134"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="78166134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 19:51:09 -0700
X-CSE-ConnectionGUID: f2oCyktZSsyWwJcUGgAP7g==
X-CSE-MsgGUID: /jHam8pIQyKqcQj10J8CcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175312280"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Sep 2025 19:51:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0AAK-0000Nh-0p;
	Sun, 21 Sep 2025 02:51:04 +0000
Date: Sun, 21 Sep 2025 10:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [akpm-mm:mm-nonmm-unstable 53/56] kernel/kexec_handover.c:934:26:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202509211055.qaTxLxQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   aceb0f48c0c648f4677bef10dc13f96c49ab4587
commit: 9bb6be995614ed83f0ecddee3c48a706ac2587a0 [53/56] kho-add-support-for-preserving-vmalloc-allocations-fix
config: arm64-randconfig-003-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211055.qaTxLxQS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project efd96afedf2c0f6f2cc34cf5a9a7e3e78f592255)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211055.qaTxLxQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211055.qaTxLxQS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kexec_handover.c:934:26: error: too few arguments to function call, expected 2, have 1
     934 |                                 kho_restore_page(phys);
         |                                 ~~~~~~~~~~~~~~~~     ^
   kernel/kexec_handover.c:214:13: note: 'kho_restore_page' declared here
     214 | static void kho_restore_page(struct page *page, unsigned int order)
         |             ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec_handover.c:942:38: error: too few arguments to function call, expected 2, have 1
     942 |                 kho_restore_page(page_to_phys(page));
         |                 ~~~~~~~~~~~~~~~~                   ^
   kernel/kexec_handover.c:214:13: note: 'kho_restore_page' declared here
     214 | static void kho_restore_page(struct page *page, unsigned int order)
         |             ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +934 kernel/kexec_handover.c

   890	
   891	/**
   892	 * kho_restore_vmalloc - recreates and populates an area in vmalloc address
   893	 * space from the preserved memory.
   894	 * @preservation: preservation metadata.
   895	 *
   896	 * Recreates an area in vmalloc address space and populates it with memory that
   897	 * was preserved using kho_preserve_vmalloc().
   898	 *
   899	 * Return: pointer to the area in the vmalloc address space, NULL on failure.
   900	 */
   901	void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
   902	{
   903		struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
   904		unsigned int align, order, shift, vm_flags;
   905		unsigned int idx = 0, nr;
   906		unsigned long addr, size;
   907		struct vm_struct *area;
   908		struct page **pages;
   909		int err;
   910	
   911		vm_flags = kho_flags_to_vmalloc(preservation->flags);
   912		if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
   913			return NULL;
   914	
   915		nr = preservation->total_pages;
   916		pages = kvmalloc_array(nr, sizeof(*pages), GFP_KERNEL);
   917		if (!pages)
   918			return NULL;
   919		order = preservation->order;
   920		shift = PAGE_SHIFT + order;
   921		align = 1 << shift;
   922	
   923		while (chunk) {
   924			struct page *page;
   925	
   926			for (int i = 0; chunk->phys[i]; i++) {
   927				phys_addr_t phys = chunk->phys[i];
   928	
   929				if (idx + (1 << order) > nr)
   930					goto err_free_pages_array;
   931	
   932				for (int j = 0; j < (1 << order); j++) {
   933					page = phys_to_page(phys);
 > 934					kho_restore_page(phys);
   935					pages[idx++] = page;
   936					phys += PAGE_SIZE;
   937				}
   938			}
   939	
   940			page = virt_to_page(chunk);
   941			chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
   942			kho_restore_page(page_to_phys(page));
   943			__free_page(page);
   944		}
   945	
   946		if (idx != nr)
   947			goto err_free_pages_array;
   948	
   949		area = __get_vm_area_node(nr * PAGE_SIZE, align, shift, vm_flags,
   950					  VMALLOC_START, VMALLOC_END, NUMA_NO_NODE,
   951					  GFP_KERNEL, __builtin_return_address(0));
   952		if (!area)
   953			goto err_free_pages_array;
   954	
   955		addr = (unsigned long)area->addr;
   956		size = get_vm_area_size(area);
   957		err = vmap_pages_range(addr, addr + size, PAGE_KERNEL, pages, shift);
   958		if (err)
   959			goto err_free_vm_area;
   960	
   961		area->pages = pages;
   962		area->nr_pages = nr;
   963	
   964		return area->addr;
   965	
   966	err_free_vm_area:
   967		free_vm_area(area);
   968	err_free_pages_array:
   969		kvfree(pages);
   970		return NULL;
   971	}
   972	EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
   973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
