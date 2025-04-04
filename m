Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1824689;
	Fri,  4 Apr 2025 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743737859; cv=none; b=S5xrd90C+TfbxYWtkTryNzH6OdG3IbiZYCZhtqiK6PTuDO0dtSu3BIkoroOTmqPnTYcVt8GsiHSkvhWQ5lmFBLGwKIqxvYQfrD5/ZYfFcO8lma5bo50wRaEUT+rdZShpXymhmV/E35pFSaVw4QWVItj59qIYohW6PzrRuVYivz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743737859; c=relaxed/simple;
	bh=gaUqbhlmpYbyXdcwh4oY+66+ybScMq2zJQp1bAN1Css=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glZm8wG7N0tU6wfqFXYxTPXUDs+N34AxashETTifvLnabvrz0rBamGg74bHd5g2YJHLcajlg/xFLKaE78L285/SgT8g89bItSlJ858B40AtUAbsO3arAgEVIWO20GZpKfL7+SAbG1nY3/Li2zoyY/OuhnTgheC+0fmQkgi3lfRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no8YPtpc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no8YPtpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743737857; x=1775273857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gaUqbhlmpYbyXdcwh4oY+66+ybScMq2zJQp1bAN1Css=;
  b=no8YPtpc07lUqRf4DFZiEKdUhazrP6Cx5ZlPl8pS55Tmh41UYj9Ca2rl
   H1wq+RzvCsNjeuOHX8a/1a06AzZsA+pA4Rf2/lC0T7dT6TWx90HhaRVKz
   noF1vMiaVKOnL7r9RLbSUaTIDMROQYJu8+WQ3zRJBwCrAVf1AsYi+CzfA
   co9PPiYm/8jAWR4OyBMNDhCUi8j88DfTusQovmGtWF1rLUyn0FjVRiF9+
   glzj/QT4UzzZK9afJKHC3lPUkBmgMYX2G6u0wZcJRONOSDB+7Cshk1qle
   dD5Tj6r4YcAve0QyTZLcwrKRyflUM0DillT5wMVNbc0F3j0/t2+2EZg3M
   g==;
X-CSE-ConnectionGUID: jNuSYYgTQTqdpCGjtwe3aQ==
X-CSE-MsgGUID: BL9svxo0T1K9u81AfU9Yrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67643542"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="67643542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 20:37:35 -0700
X-CSE-ConnectionGUID: d35pSv77S+qcwzCDQfzw2g==
X-CSE-MsgGUID: nDYcY4n1SjGjkWNMBn7lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158190378"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Apr 2025 20:37:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Xs3-0000yJ-2R;
	Fri, 04 Apr 2025 03:37:31 +0000
Date: Fri, 4 Apr 2025 11:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <202504041302.vLhBU2QJ-lkp@intel.com>
References: <20250403202705.18488-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403202705.18488-3-matthew.brost@intel.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250403]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-xe-Add-devcoredump-chunking/20250404-042700
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250403202705.18488-3-matthew.brost%40intel.com
patch subject: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
config: x86_64-buildonly-randconfig-003-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041302.vLhBU2QJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041302.vLhBU2QJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041302.vLhBU2QJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_migrate.c:1819:12: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1819 |         if (len & XE_CACHELINE_MASK ||
         |                   ^
   drivers/gpu/drm/xe/xe_migrate.c:1820:34: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1820 |             ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
         |                                         ^
>> drivers/gpu/drm/xe/xe_migrate.c:1828:14: error: use of undeclared identifier 'XE_CACHELINE_BYTES'
    1828 |                         u8 bounce[XE_CACHELINE_BYTES];
         |                                   ^
   drivers/gpu/drm/xe/xe_migrate.c:1833:23: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1833 |                                                (offset & XE_CACHELINE_MASK));
         |                                                          ^
   drivers/gpu/drm/xe/xe_migrate.c:1832:13: error: use of undeclared identifier 'XE_CACHELINE_BYTES'
    1832 |                                                XE_CACHELINE_BYTES -
         |                                                ^
   drivers/gpu/drm/xe/xe_migrate.c:1834:30: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1834 |                         int ptr_offset = offset & XE_CACHELINE_MASK;
         |                                                   ^
   drivers/gpu/drm/xe/xe_migrate.c:1838:15: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1838 |                                                        ~XE_CACHELINE_MASK,
         |                                                         ^
   drivers/gpu/drm/xe/xe_migrate.c:1852:24: error: use of undeclared identifier 'XE_CACHELINE_MASK'
    1852 |                                                        offset & ~XE_CACHELINE_MASK,
         |                                                                  ^
>> drivers/gpu/drm/xe/xe_migrate.c:1888:13: error: call to undeclared function 'xe_migrate_vram'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1888 |                 __fence = xe_migrate_vram(m, current_bytes,
         |                           ^
   drivers/gpu/drm/xe/xe_migrate.c:1888:13: note: did you mean 'xe_migrate_to_vram'?
   drivers/gpu/drm/xe/xe_migrate.h:98:19: note: 'xe_migrate_to_vram' declared here
      98 | struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
         |                   ^
>> drivers/gpu/drm/xe/xe_migrate.c:1892:8: error: use of undeclared identifier 'XE_MIGRATE_COPY_TO_VRAM'
    1892 |                                           XE_MIGRATE_COPY_TO_VRAM :
         |                                           ^
>> drivers/gpu/drm/xe/xe_migrate.c:1893:8: error: use of undeclared identifier 'XE_MIGRATE_COPY_TO_SRAM'
    1893 |                                           XE_MIGRATE_COPY_TO_SRAM);
         |                                           ^
   11 errors generated.


vim +/XE_CACHELINE_MASK +1819 drivers/gpu/drm/xe/xe_migrate.c

  1785	
  1786	/**
  1787	 * xe_migrate_access_memory - Access memory of a BO via GPU
  1788	 *
  1789	 * @m: The migration context.
  1790	 * @bo: buffer object
  1791	 * @offset: access offset into buffer object
  1792	 * @buf: pointer to caller memory to read into or write from
  1793	 * @len: length of access
  1794	 * @write: write access
  1795	 *
  1796	 * Access memory of a BO via GPU either reading in or writing from a passed in
  1797	 * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
  1798	 * read to or write from pointer.
  1799	 *
  1800	 * Returns:
  1801	 * 0 if successful, negative error code on failure.
  1802	 */
  1803	int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
  1804				     unsigned long offset, void *buf, int len,
  1805				     int write)
  1806	{
  1807		struct xe_tile *tile = m->tile;
  1808		struct xe_device *xe = tile_to_xe(tile);
  1809		struct xe_res_cursor cursor;
  1810		struct dma_fence *fence = NULL;
  1811		dma_addr_t *dma_addr;
  1812		unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
  1813		int bytes_left = len, current_page = 0;
  1814		void *orig_buf = buf;
  1815	
  1816		xe_bo_assert_held(bo);
  1817	
  1818		/* Use bounce buffer for small access and unaligned access */
> 1819		if (len & XE_CACHELINE_MASK ||
  1820		    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
  1821			int buf_offset = 0;
  1822	
  1823			/*
  1824			 * Less than ideal for large unaligned access but this should be
  1825			 * fairly rare, can fixup if this becomes common.
  1826			 */
  1827			do {
> 1828				u8 bounce[XE_CACHELINE_BYTES];
  1829				void *ptr = (void *)bounce;
  1830				int err;
  1831				int copy_bytes = min_t(int, bytes_left,
  1832						       XE_CACHELINE_BYTES -
  1833						       (offset & XE_CACHELINE_MASK));
  1834				int ptr_offset = offset & XE_CACHELINE_MASK;
  1835	
  1836				err = xe_migrate_access_memory(m, bo,
  1837							       offset &
  1838							       ~XE_CACHELINE_MASK,
  1839							       (void *)ptr,
  1840							       sizeof(bounce), 0);
  1841				if (err)
  1842					return err;
  1843	
  1844				if (!write) {
  1845					memcpy(buf + buf_offset, ptr + ptr_offset,
  1846					       copy_bytes);
  1847					goto next;
  1848				}
  1849	
  1850				memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
  1851				err = xe_migrate_access_memory(m, bo,
  1852							       offset & ~XE_CACHELINE_MASK,
  1853							       (void *)ptr,
  1854							       sizeof(bounce), 0);
  1855				if (err)
  1856					return err;
  1857	
  1858	next:
  1859				bytes_left -= copy_bytes;
  1860				buf_offset += copy_bytes;
  1861				offset += copy_bytes;
  1862			} while (bytes_left);
  1863	
  1864			return 0;
  1865		}
  1866	
  1867		dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
  1868		if (IS_ERR(dma_addr))
  1869			return PTR_ERR(dma_addr);
  1870	
  1871		xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
  1872	
  1873		do {
  1874			struct dma_fence *__fence;
  1875			u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
  1876				cursor.start;
  1877			int current_bytes;
  1878	
  1879			if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
  1880				current_bytes = min_t(int, bytes_left,
  1881						      MAX_PREEMPTDISABLE_TRANSFER);
  1882			else
  1883				current_bytes = min_t(int, bytes_left, cursor.size);
  1884	
  1885			if (fence)
  1886				dma_fence_put(fence);
  1887	
> 1888			__fence = xe_migrate_vram(m, current_bytes,
  1889						  (unsigned long)buf & ~PAGE_MASK,
  1890						  dma_addr + current_page,
  1891						  vram_addr, write ?
> 1892						  XE_MIGRATE_COPY_TO_VRAM :
> 1893						  XE_MIGRATE_COPY_TO_SRAM);
  1894			if (IS_ERR(__fence)) {
  1895				if (fence)
  1896					dma_fence_wait(fence, false);
  1897				fence = __fence;
  1898				goto out_err;
  1899			}
  1900			fence = __fence;
  1901	
  1902			buf += current_bytes;
  1903			offset += current_bytes;
  1904			current_page = (int)(buf - orig_buf) / PAGE_SIZE;
  1905			bytes_left -= current_bytes;
  1906			if (bytes_left)
  1907				xe_res_next(&cursor, current_bytes);
  1908		} while (bytes_left);
  1909	
  1910		dma_fence_wait(fence, false);
  1911		dma_fence_put(fence);
  1912		xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
  1913	
  1914		return 0;
  1915	
  1916	out_err:
  1917		xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
  1918		return PTR_ERR(fence);
  1919	}
  1920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
