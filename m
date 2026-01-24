Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92F321421;
	Sat, 24 Jan 2026 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769264603; cv=none; b=NSBZYIhEuOZM4qkY6+JH+kmRPi1AMowCWZbaP5n8z3RDizESGx1KSa5kd7pcWnnB60AJPKAp+IQml36H6hGim8pU+l8rzJ2d07Czefm8jiy5kn6a4thyD1PbMnrlO5r5ZzXVFAGdkHQg8B1O30LOdo/TOefsmG5No2Zj7sXHy4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769264603; c=relaxed/simple;
	bh=9Ss6wR1OPlAbCdqA0e3A63ScSNbIoK2x2Kd2dLi8vAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQhuhzaoq0pCtWkBIYgFsPaivbPqi9wpjZm7LHbyfwuH+N9uWjqWPhrPgjXvA9hiSdsH2ZOshsJRURgydKjy4lMSNBv4VOtSiSA8WO+k6U79TiS5RZYlvJsr8NTOk7ORNXY//zY27urlwF+zv+0oRTjQQpk/ESxkeHJRNAtmNHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RW2YYmr6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RW2YYmr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769264601; x=1800800601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Ss6wR1OPlAbCdqA0e3A63ScSNbIoK2x2Kd2dLi8vAg=;
  b=RW2YYmr6dKEIxoLnHslcSU4BzwUs2uMkkoDl663+hfypCamQS82iK96J
   /uI24hO2iFqE4lwwh5kmbQEAVjpyQFJatYQdHwaqGm+Zz09T6McCrraNO
   XUSSitcK0m4+vlHEj87RySb3YN6i7USizBY9mp8x+bLF6a2OjOHsY3b3p
   9U1VhGEXr0/zi2+eElTZQqB3v0M5Z0yIoQctlnwxfYB2ARiEnALOuT7Dj
   gNXaVHmtMYbjQNClv6VapciPV28yybzoqcRrjMZtZ0Be+XHRuyF7bqQsE
   Cg5jFFqJGzyCNBVOxAytd6PuM813nZr7VP+bgfpAz6lxFT4oUyPSwbMaS
   A==;
X-CSE-ConnectionGUID: 51+lXDGrTo+o9o+d9X5QqA==
X-CSE-MsgGUID: 9sreESqDSKm3M4wJgn4N8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81860911"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81860911"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 06:23:18 -0800
X-CSE-ConnectionGUID: V7Y5pzkiRyCDFXPrzH92jg==
X-CSE-MsgGUID: EPHWjhy7QPCaPKF7FS4PBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="237925289"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2026 06:23:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjeXi-00000000VFA-0eGR;
	Sat, 24 Jan 2026 14:23:14 +0000
Date: Sat, 24 Jan 2026 22:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/3] drm/pagemap: Add helper to access
 zone_device_data
Message-ID: <202601242245.rgQdhaTK-lkp@intel.com>
References: <20260123215907.1643088-2-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123215907.1643088-2-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-pagemap-Add-helper-to-access-zone_device_data/20260124-060207
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20260123215907.1643088-2-matthew.brost%40intel.com
patch subject: [RFC PATCH v2 1/3] drm/pagemap: Add helper to access zone_device_data
config: x86_64-randconfig-004-20260124 (https://download.01.org/0day-ci/archive/20260124/202601242245.rgQdhaTK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601242245.rgQdhaTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601242245.rgQdhaTK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpusvm.c:1492:5: error: call to undeclared function 'drm_pagemap_page_zone_device_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1492 |                                 drm_pagemap_page_zone_device_data(page);
         |                                 ^
   drivers/gpu/drm/drm_gpusvm.c:1492:5: note: did you mean 'drm_pagemap_page_to_dpagemap'?
   include/drm/drm_pagemap.h:264:35: note: 'drm_pagemap_page_to_dpagemap' declared here
     264 | static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
         |                                   ^
>> drivers/gpu/drm/drm_gpusvm.c:1491:28: error: incompatible integer to pointer conversion initializing 'struct drm_pagemap_zdd *' with an expression of type 'int' [-Wint-conversion]
    1491 |                         struct drm_pagemap_zdd *__zdd =
         |                                                 ^
    1492 |                                 drm_pagemap_page_zone_device_data(page);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/drm_pagemap_page_zone_device_data +1492 drivers/gpu/drm/drm_gpusvm.c

  1366	
  1367	/**
  1368	 * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
  1369	 * @gpusvm: Pointer to the GPU SVM structure
  1370	 * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
  1371	 * @mm: The mm corresponding to the CPU range
  1372	 * @notifier: The corresponding notifier for the given CPU range
  1373	 * @pages_start: Start CPU address for the pages
  1374	 * @pages_end: End CPU address for the pages (exclusive)
  1375	 * @ctx: GPU SVM context
  1376	 *
  1377	 * This function gets and maps pages for CPU range and ensures they are
  1378	 * mapped for DMA access.
  1379	 *
  1380	 * Return: 0 on success, negative error code on failure.
  1381	 */
  1382	int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
  1383				 struct drm_gpusvm_pages *svm_pages,
  1384				 struct mm_struct *mm,
  1385				 struct mmu_interval_notifier *notifier,
  1386				 unsigned long pages_start, unsigned long pages_end,
  1387				 const struct drm_gpusvm_ctx *ctx)
  1388	{
  1389		struct hmm_range hmm_range = {
  1390			.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
  1391				HMM_PFN_REQ_WRITE),
  1392			.notifier = notifier,
  1393			.start = pages_start,
  1394			.end = pages_end,
  1395			.dev_private_owner = ctx->device_private_page_owner,
  1396		};
  1397		void *zdd;
  1398		unsigned long timeout =
  1399			jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
  1400		unsigned long i, j;
  1401		unsigned long npages = npages_in_range(pages_start, pages_end);
  1402		unsigned long num_dma_mapped;
  1403		unsigned int order = 0;
  1404		unsigned long *pfns;
  1405		int err = 0;
  1406		struct dev_pagemap *pagemap;
  1407		struct drm_pagemap *dpagemap;
  1408		struct drm_gpusvm_pages_flags flags;
  1409		enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
  1410								   DMA_BIDIRECTIONAL;
  1411	
  1412	retry:
  1413		if (time_after(jiffies, timeout))
  1414			return -EBUSY;
  1415	
  1416		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
  1417		if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
  1418			goto set_seqno;
  1419	
  1420		pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
  1421		if (!pfns)
  1422			return -ENOMEM;
  1423	
  1424		if (!mmget_not_zero(mm)) {
  1425			err = -EFAULT;
  1426			goto err_free;
  1427		}
  1428	
  1429		hmm_range.hmm_pfns = pfns;
  1430		while (true) {
  1431			mmap_read_lock(mm);
  1432			err = hmm_range_fault(&hmm_range);
  1433			mmap_read_unlock(mm);
  1434	
  1435			if (err == -EBUSY) {
  1436				if (time_after(jiffies, timeout))
  1437					break;
  1438	
  1439				hmm_range.notifier_seq =
  1440					mmu_interval_read_begin(notifier);
  1441				continue;
  1442			}
  1443			break;
  1444		}
  1445		mmput(mm);
  1446		if (err)
  1447			goto err_free;
  1448	
  1449	map_pages:
  1450		/*
  1451		 * Perform all dma mappings under the notifier lock to not
  1452		 * access freed pages. A notifier will either block on
  1453		 * the notifier lock or unmap dma.
  1454		 */
  1455		drm_gpusvm_notifier_lock(gpusvm);
  1456	
  1457		flags.__flags = svm_pages->flags.__flags;
  1458		if (flags.unmapped) {
  1459			drm_gpusvm_notifier_unlock(gpusvm);
  1460			err = -EFAULT;
  1461			goto err_free;
  1462		}
  1463	
  1464		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
  1465			drm_gpusvm_notifier_unlock(gpusvm);
  1466			kvfree(pfns);
  1467			goto retry;
  1468		}
  1469	
  1470		if (!svm_pages->dma_addr) {
  1471			/* Unlock and restart mapping to allocate memory. */
  1472			drm_gpusvm_notifier_unlock(gpusvm);
  1473			svm_pages->dma_addr =
  1474				kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
  1475			if (!svm_pages->dma_addr) {
  1476				err = -ENOMEM;
  1477				goto err_free;
  1478			}
  1479			goto map_pages;
  1480		}
  1481	
  1482		zdd = NULL;
  1483		pagemap = NULL;
  1484		num_dma_mapped = 0;
  1485		for (i = 0, j = 0; i < npages; ++j) {
  1486			struct page *page = hmm_pfn_to_page(pfns[i]);
  1487	
  1488			order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
  1489			if (is_device_private_page(page) ||
  1490			    is_device_coherent_page(page)) {
> 1491				struct drm_pagemap_zdd *__zdd =
> 1492					drm_pagemap_page_zone_device_data(page);
  1493	
  1494				if (!ctx->allow_mixed &&
  1495				    zdd != __zdd && i > 0) {
  1496					err = -EOPNOTSUPP;
  1497					goto err_unmap;
  1498				}
  1499				zdd = __zdd;
  1500				if (pagemap != page_pgmap(page)) {
  1501					if (i > 0) {
  1502						err = -EOPNOTSUPP;
  1503						goto err_unmap;
  1504					}
  1505	
  1506					pagemap = page_pgmap(page);
  1507					dpagemap = drm_pagemap_page_to_dpagemap(page);
  1508					if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
  1509						/*
  1510						 * Raced. This is not supposed to happen
  1511						 * since hmm_range_fault() should've migrated
  1512						 * this page to system.
  1513						 */
  1514						err = -EAGAIN;
  1515						goto err_unmap;
  1516					}
  1517				}
  1518				svm_pages->dma_addr[j] =
  1519					dpagemap->ops->device_map(dpagemap,
  1520								  gpusvm->drm->dev,
  1521								  page, order,
  1522								  dma_dir);
  1523				if (dma_mapping_error(gpusvm->drm->dev,
  1524						      svm_pages->dma_addr[j].addr)) {
  1525					err = -EFAULT;
  1526					goto err_unmap;
  1527				}
  1528			} else {
  1529				dma_addr_t addr;
  1530	
  1531				if (is_zone_device_page(page) ||
  1532				    (pagemap && !ctx->allow_mixed)) {
  1533					err = -EOPNOTSUPP;
  1534					goto err_unmap;
  1535				}
  1536	
  1537				if (ctx->devmem_only) {
  1538					err = -EFAULT;
  1539					goto err_unmap;
  1540				}
  1541	
  1542				addr = dma_map_page(gpusvm->drm->dev,
  1543						    page, 0,
  1544						    PAGE_SIZE << order,
  1545						    dma_dir);
  1546				if (dma_mapping_error(gpusvm->drm->dev, addr)) {
  1547					err = -EFAULT;
  1548					goto err_unmap;
  1549				}
  1550	
  1551				svm_pages->dma_addr[j] = drm_pagemap_addr_encode
  1552					(addr, DRM_INTERCONNECT_SYSTEM, order,
  1553					 dma_dir);
  1554			}
  1555			i += 1 << order;
  1556			num_dma_mapped = i;
  1557			flags.has_dma_mapping = true;
  1558		}
  1559	
  1560		if (pagemap) {
  1561			flags.has_devmem_pages = true;
  1562			drm_pagemap_get(dpagemap);
  1563			drm_pagemap_put(svm_pages->dpagemap);
  1564			svm_pages->dpagemap = dpagemap;
  1565		}
  1566	
  1567		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
  1568		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
  1569	
  1570		drm_gpusvm_notifier_unlock(gpusvm);
  1571		kvfree(pfns);
  1572	set_seqno:
  1573		svm_pages->notifier_seq = hmm_range.notifier_seq;
  1574	
  1575		return 0;
  1576	
  1577	err_unmap:
  1578		__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
  1579		drm_gpusvm_notifier_unlock(gpusvm);
  1580	err_free:
  1581		kvfree(pfns);
  1582		if (err == -EAGAIN)
  1583			goto retry;
  1584		return err;
  1585	}
  1586	EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
  1587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
