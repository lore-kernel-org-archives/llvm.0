Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CD2BD11;
	Sun,  2 Feb 2025 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738524992; cv=none; b=MudjP73vyIvQLRQKco5ohrMcBOuyF0mz39h4vdiPXxvR6z31dagOrzPN5EEYP7dbYPMbVaE++2StbIe1zBGWiVzz3dpI2gk9+/Fg/IgZlKXmCIkw1ZvnmDI5jZ0BiNMKQE+PtbSkaYWZ3xy7Y146aqpzTZpraR7nXIYDbWtYKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738524992; c=relaxed/simple;
	bh=423H48RKVlBKH9lUqUH62aqWKmvwsnAKJUfe7Vsrx6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LdKF5EPELKdk1uwgMQIqTiG/jxMpQ/vqFhtNjEjNlVdiCbKoqc5C4BYjAn+NYPu8HBZ44mu3dnn6EnYrTo41+43cX8k5lbr9IHSLeixQxAJQK1m1uiPz7rwhviyuc6YCE0RfRUTVhPKFy7zMYN+mG2cQpKx7SdibfwYEl/Z4TGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jK+oJBeU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jK+oJBeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738524991; x=1770060991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=423H48RKVlBKH9lUqUH62aqWKmvwsnAKJUfe7Vsrx6c=;
  b=jK+oJBeUBO4XijiBUgV7EfP0QLpE8B5IKuKFhmZnOxcv57nKFXENNCqA
   vPEK/tvSRAG5c59/xwfja+OPpDpAq5kIuyIpSPWIIHG/qmuYR4Uk0kBBW
   s4u+xhjlmVYG9y4Yu0n7xSpIdpmKdJKkp0mFEF+iM4Sy8wTvl6ALcSRD5
   +pyhcy3DakqIvio47XRDGvlb+MsEmtKwIZowKGQuTtc699L/XyybHVrSc
   jrV/YsM3PwncfUYSeSTuECkwJVE34rQbKabh3s5VUdaXiF819KpLK66Yc
   hov+H9+1ouNBmT15xnGs3iOuQVcL2IHpv0SmJM4FS39eWA4wOZf4kKGKg
   g==;
X-CSE-ConnectionGUID: D37koi3TR1qV8iUcwKiIVw==
X-CSE-MsgGUID: GATb4k8VTySdoKP+mrSFPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50436894"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50436894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 11:36:30 -0800
X-CSE-ConnectionGUID: aZ8zY5owTve3tVIgXLazDw==
X-CSE-MsgGUID: cAl0q1E8SKiJc3FjKJO4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110559517"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Feb 2025 11:36:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tefla-000q1r-02;
	Sun, 02 Feb 2025 19:36:26 +0000
Date: Mon, 3 Feb 2025 03:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 75/80]
 drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared
 function 'mapping_wrprotect_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502030356.JNL7I49s-lkp@intel.com>
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
head:   7de6fd8ab65003f050aa58e705592745717ed318
commit: 6a9318f28d7e371692838677c364145fe04b1093 [75/80] fb_defio: do not use deprecated page->mapping, index fields
config: arm-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502030356.JNL7I49s-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030356.JNL7I49s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030356.JNL7I49s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared function 'mapping_wrprotect_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
         |                 ^
   1 error generated.


vim +/mapping_wrprotect_page +272 drivers/video/fbdev/core/fb_defio.c

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
 > 272			mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
   273		}
   274	
   275		/* driver's callback with pagereflist */
   276		fbdefio->deferred_io(info, &fbdefio->pagereflist);
   277	
   278		/* clear the list */
   279		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
   280			fb_deferred_io_pageref_put(pageref, info);
   281	
   282		mutex_unlock(&fbdefio->lock);
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
