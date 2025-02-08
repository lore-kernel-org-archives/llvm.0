Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E6188938;
	Sat,  8 Feb 2025 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991168; cv=none; b=Wm0IOPDF4yCfgn73bFCE7fmxeVBxKOwgpfln/xHYkd1MK0nJiJnNPo9qwceBWqza6CytdqiQNxyFtDmGZoI8ORPnlHZmzevd9X0rqozs8Gp8e+nS5laD7059OMaqTKX8KCPJlM6uuRILqyN4I0C/Lu/aBFgv/xCqWJLQ/EYVpGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991168; c=relaxed/simple;
	bh=m0g7hmMIIdKW3hcbFcSJsacbfGpHX2VNfkJTRpDeFU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFhkFuLeoDcSuIaUt2tyY9BtqVtWBKZaZaMKTCVz8hNbIUH7+4+edwfiKbow6zaingXSlpbgUY7wPII1eYVHhHp1S+NORQ5eNrgmvE/1LZejgMaUx0QEiHhMCBOWsX75spq75opx4U9jF8FUcxnbZWN9TlNAaGxusBy/xsO3aEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6ozzINZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6ozzINZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738991167; x=1770527167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0g7hmMIIdKW3hcbFcSJsacbfGpHX2VNfkJTRpDeFU8=;
  b=k6ozzINZb17rO0SFitfIqAilsengqglwwJZyvD7oPwF8iRzb9g1ewMxD
   KcFD9UouCIDDbmjRFkcrlgo1tmuCvY78CM+h33KXWvlGDZNeBOfv7ohB7
   I2LxtqbBUCxmwCkzTGaZ+Znt5HVF7z2A8eq3KLXozCz70P0NwGddzyzXR
   nhDrnFI7Hm1BtMzewcZuDo+W6MUxZiRGBaKGQjiyEs7nWhcPibYb8+o58
   IVzS6uQh7N+N98gJIXDhD1KdxfDVpzo34AmpOv3tulBeGvCT1nblBke4D
   QzmNx98cAzjsA2OIsqc5p2j5rBJtHZdtivy0G4+WAHTeU5RcG6LPhLpX0
   w==;
X-CSE-ConnectionGUID: 2nwPl9L9RqW5wDwhK2pHGw==
X-CSE-MsgGUID: rZQXlqD3S7aI3Hg5cI7o/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39330043"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39330043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:06:04 -0800
X-CSE-ConnectionGUID: bTV46BUgSJaY3od3boUvGQ==
X-CSE-MsgGUID: aSTEt52AQ4idhLyhPiWo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116651551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 21:06:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgd2V-000zY7-1j;
	Sat, 08 Feb 2025 05:05:59 +0000
Date: Sat, 8 Feb 2025 13:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 146/165]
 drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared
 function 'mapping_wrprotect_range'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202502081229.nVX901zo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   8bf30f9d23eb5040d37e6e712789cee8e71e1577
commit: 85d65aec481df149bc5280cf1ad5f9b76f59f153 [146/165] fb_defio: do not use deprecated page->mapping, index fields
config: arm-randconfig-003-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081229.nVX901zo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081229.nVX901zo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081229.nVX901zo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c:136:34: error: too few arguments provided to function-like macro invocation
     136 |                 fb_err("no mapping available\n");
         |                                                ^
   include/linux/fb.h:887:9: note: macro 'fb_err' defined here
     887 | #define fb_err(fb_info, fmt, ...)                                       \
         |         ^
   drivers/video/fbdev/core/fb_defio.c:136:3: error: use of undeclared identifier 'fb_err'; did you mean 'xa_err'?
     136 |                 fb_err("no mapping available\n");
         |                 ^~~~~~
         |                 xa_err
   include/linux/xarray.h:223:19: note: 'xa_err' declared here
     223 | static inline int xa_err(void *entry)
         |                   ^
   drivers/video/fbdev/core/fb_defio.c:136:3: warning: expression result unused [-Wunused-value]
     136 |                 fb_err("no mapping available\n");
         |                 ^~~~~~
>> drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared function 'mapping_wrprotect_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 mapping_wrprotect_range(fbdefio->mapping, pgoff,
         |                 ^
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
   Selected by [y]:
   - FB_DMAMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]


vim +/mapping_wrprotect_range +272 drivers/video/fbdev/core/fb_defio.c

   258	
   259	/* workqueue callback */
   260	static void fb_deferred_io_work(struct work_struct *work)
   261	{
   262		struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
   263		struct fb_deferred_io_pageref *pageref, *next;
   264		struct fb_deferred_io *fbdefio = info->fbdefio;
   265	
   266		/* here we wrprotect the page's mappings, then do all deferred IO. */
   267		mutex_lock(&fbdefio->lock);
   268		list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
   269			struct page *page = pageref->page;
   270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
   271	
 > 272			mapping_wrprotect_range(fbdefio->mapping, pgoff,
   273						page_to_pfn(page), 1);
   274		}
   275	
   276		/* driver's callback with pagereflist */
   277		fbdefio->deferred_io(info, &fbdefio->pagereflist);
   278	
   279		/* clear the list */
   280		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
   281			fb_deferred_io_pageref_put(pageref, info);
   282	
   283		mutex_unlock(&fbdefio->lock);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
