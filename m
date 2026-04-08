Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1B3B9600;
	Wed,  8 Apr 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648401; cv=none; b=SMDZUMBebeVLvjVaYKQA2qJwyOl2MAiU8iuk9i1twj++8aAJrgX2p2BWYTeLBdvgRLJCyDnZviASXOn3jospy9e3PZYWg50H4NZK9wj6lP1C5V8R/4KYJJ1Q0RybeFtuno1d97wjDOCZJecdrP8JAaujV87kSyHaKtFunaq6Bg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648401; c=relaxed/simple;
	bh=b+RecTKEamqmyLaTPX3iCg4q4fZ77CppkFB3CIgG9qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PcQvLqJTEv4nAY9X36/fg3gNfVjFeo/aBUjjeMbFniqWHVWhwaQpf0j1XSkRiwEJ7IDXROGaHSlhkyhJM9cZa97p+5yM8CrWCl4mgFyCvq6VhC+Tiuo5sGRw6Ln/h+W+iBo2/4xoMF2khFhVf/wZWzxAxXx4or33EjFBrZe66Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+ecEV57; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+ecEV57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775648397; x=1807184397;
  h=date:from:to:cc:subject:message-id;
  bh=b+RecTKEamqmyLaTPX3iCg4q4fZ77CppkFB3CIgG9qw=;
  b=R+ecEV57ifKlat0OdAuLxmRR1Y17LfWdUo/erHkOMWnf6nOC9j0Yx0mk
   2ylzUssLDmtExWX+IEI6ECyCxRox+gUoh/me5VDxGyxWH41OzYLk1rR6x
   Zw9N7XZLfawErh/wpQ5ADw7j9vGmcBwRjOy6g8l7s3i+qEx3URa03mMt9
   0YXq6/f9WQmRwDtc6uX20OodmThKqGPkHqx9qnBYCBtYRf8UImRXA79k8
   QRPg12VSZ4f7C8OG/6Se39z749QgaU8ogkndYT0bDIvnzsE5fp+EE150c
   JyPX21yDZ5xbqnTMEAKNUhUmE36aQ0HvMIbXkHJsvpOol4u7rdu4IBG2/
   g==;
X-CSE-ConnectionGUID: zb0nbnRxQp2rzKF9o6Nayg==
X-CSE-MsgGUID: d60oHEa7ROmBpC81pHYDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76520518"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76520518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:39:55 -0700
X-CSE-ConnectionGUID: UIJ01+qERzqtIMNMCKd7Iw==
X-CSE-MsgGUID: XpxJCpgGTrGUlTeN6AHcuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223684346"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2026 04:39:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wARGA-000000001nN-3hUZ;
	Wed, 08 Apr 2026 11:39:50 +0000
Date: Wed, 08 Apr 2026 19:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>
Subject: [daeinki-drm-exynos:exynos-drm-next 3/4]
 drivers/gpu/drm/exynos/exynos_drm_gem.c:70:41: warning: format specifies type
 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202604081946.qVUp1v71-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
head:   0867757f1eec0a246c70b2407a1bbed949170821
commit: 11e898373fba6b1d27b15ab4beff592701a57293 [3/4] drm/exynos: Drop exynos_drm_gem.size field
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260408/202604081946.qVUp1v71-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081946.qVUp1v71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081946.qVUp1v71-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_drm_gem.c:70:41: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
         |                                                                          ~~~
         |                                                                          %zx
      70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
         |                                                              ^~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:599:38: note: expanded from macro 'DRM_DEV_DEBUG_KMS'
     599 |         drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                      ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:563:39: note: expanded from macro 'drm_dev_dbg'
     563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_gem.c:84:41: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
         |                                                              ~~~
         |                                                              %zx
      84 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
         |                                                              ^~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:599:38: note: expanded from macro 'DRM_DEV_DEBUG_KMS'
     599 |         drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                      ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:563:39: note: expanded from macro 'drm_dev_dbg'
     563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +70 drivers/gpu/drm/exynos/exynos_drm_gem.c

    26	
    27	static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
    28	{
    29		struct drm_device *dev = exynos_gem->base.dev;
    30		unsigned long attr = 0;
    31	
    32		if (exynos_gem->dma_addr) {
    33			DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "already allocated.\n");
    34			return 0;
    35		}
    36	
    37		/*
    38		 * if EXYNOS_BO_CONTIG, fully physically contiguous memory
    39		 * region will be allocated else physically contiguous
    40		 * as possible.
    41		 */
    42		if (!(exynos_gem->flags & EXYNOS_BO_NONCONTIG))
    43			attr |= DMA_ATTR_FORCE_CONTIGUOUS;
    44	
    45		/*
    46		 * if EXYNOS_BO_WC or EXYNOS_BO_NONCACHABLE, writecombine mapping
    47		 * else cachable mapping.
    48		 */
    49		if (exynos_gem->flags & EXYNOS_BO_WC ||
    50				!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
    51			attr |= DMA_ATTR_WRITE_COMBINE;
    52	
    53		/* FBDev emulation requires kernel mapping */
    54		if (!kvmap)
    55			attr |= DMA_ATTR_NO_KERNEL_MAPPING;
    56	
    57		exynos_gem->dma_attrs = attr;
    58		exynos_gem->cookie = dma_alloc_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size,
    59						     &exynos_gem->dma_addr, GFP_KERNEL,
    60						     exynos_gem->dma_attrs);
    61		if (!exynos_gem->cookie) {
    62			DRM_DEV_ERROR(drm_dev_dma_dev(dev), "failed to allocate buffer.\n");
    63			return -ENOMEM;
    64		}
    65	
    66		if (kvmap)
    67			exynos_gem->kvaddr = exynos_gem->cookie;
    68	
    69		DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
  > 70				(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
    71		return 0;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
