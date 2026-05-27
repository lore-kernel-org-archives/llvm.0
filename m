Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39C93612F5;
	Wed, 27 May 2026 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850932; cv=none; b=Pl3LjovP0XVzc/fTgbRDENS64laohQJgeCb5mfoBEf4WiKfjSM8YNowlkKDcwTVQC3KREfX+furBPC7OG68sY7WciZMaZY5c8ebPREAJelGBf1rZzjO6qLoZ78WH9y5NWFos996n7Mlvl9pDUWNdlkj2YHUUewfZbmFLOP22poI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850932; c=relaxed/simple;
	bh=02VxKTgHkiYArs8mO2aTIPsWW69QIsuN11HYkVba/10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cypH5BnR0AXWhmEPdgVSqsBJkLNr439C78OWZu1itRb0HvI34kC1wjLCBp5T8YM8fYPI5hPI3DNpBXE5XdRq8BpYOyG8b9PiFM6ZvTABMJLzJKZ7/3r1xUrIEFHd65MX8g4f8LoYv1IbQQq5n3myY+W+0gU9stMZgsLh2CNRmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c88hmZA7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c88hmZA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779850930; x=1811386930;
  h=date:from:to:cc:subject:message-id;
  bh=02VxKTgHkiYArs8mO2aTIPsWW69QIsuN11HYkVba/10=;
  b=c88hmZA7nWFhg1erJ4lecW9mmz6YS6sOml860xMYhaWUcgzcrLLzvZDO
   9jmTXIwNEUlrw9gkj3F3zDcC+52k3GNC1ekG7EvmF5Ir4kl3OidRcS+nF
   W+zcSog9SEGu7ZlnXbS6qVqXHyRBzqSxUn26/jmkEQzbpdHVLwNU3eZb5
   rSiHnyO1YMD4RmXjDWOf1SPmAwWZXbKls/PKmpyCadEiacN5KyKiNTCce
   Nu8NIoQCwHozjLwqCABlGDhMgtv7786BdIawgt3N7k2/dozl+xeGvfin6
   4d8y1mWOEsTezIq85mYrdWdd44g9UflVIhxYklye1Ue5pN8BeNOIW8EYB
   w==;
X-CSE-ConnectionGUID: daK2s2v3QhexcvqjOxVi6g==
X-CSE-MsgGUID: KoSqBTYqRDu+2KT72waYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80733771"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80733771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:02:10 -0700
X-CSE-ConnectionGUID: Xoaoqgt7RhK6VOX+zKgtew==
X-CSE-MsgGUID: FA+tpijzRYqEZgp7PvY03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="247188785"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 May 2026 20:02:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS4Wz-000000003IC-2EW5;
	Wed, 27 May 2026 03:02:05 +0000
Date: Wed, 27 May 2026 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 33/40]
 drivers/comedi/comedi_fops.c:2577:8: error: use of undeclared identifier
 'PAGE_SHARED'
Message-ID: <202605271018.Hdv96pQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   a81283ca24aeced3d15724ecb99d91190babce5a
commit: ff8d5c27567e8e17099e37861739ee70bd309ae8 [33/40] hexagon: fix page table model for hexagon VM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605271018.Hdv96pQp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271018.Hdv96pQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271018.Hdv96pQp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/comedi/comedi_fops.c:2577:8: error: use of undeclared identifier 'PAGE_SHARED'
    2577 |                                                  PAGE_SHARED);
         |                                                  ^
   1 error generated.
--
>> drivers/video/fbdev/udlfb.c:370:52: error: use of undeclared identifier 'PAGE_SHARED'
     370 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^
   1 error generated.
--
>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^
   1 error generated.


vim +/PAGE_SHARED +2577 drivers/comedi/comedi_fops.c

ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2479  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2480  static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2481  {
20f083c07565cb drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2482  	struct comedi_file *cfp = file->private_data;
20f083c07565cb drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2483  	struct comedi_device *dev = cfp->dev;
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2484  	struct comedi_subdevice *s;
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2485  	struct comedi_async *async;
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2486  	struct comedi_buf_map *bm = NULL;
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2487  	struct comedi_buf_page *buf;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2488  	unsigned long start = vma->vm_start;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2489  	unsigned long size;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2490  	int n_pages;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2491  	int i;
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2492  	int retval = 0;
3ffab428f40849 drivers/staging/comedi/comedi_fops.c Bernd Porr         2011-11-08  2493  
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2494  	/*
c1e8d7c6a7a682 drivers/staging/comedi/comedi_fops.c Michel Lespinasse  2020-06-08  2495  	 * 'trylock' avoids circular dependency with current->mm->mmap_lock
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2496  	 * and down-reading &dev->attach_lock should normally succeed without
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2497  	 * contention unless the device is in the process of being attached
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2498  	 * or detached.
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2499  	 */
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2500  	if (!down_read_trylock(&dev->attach_lock))
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2501  		return -EAGAIN;
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2502  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2503  	if (!dev->attached) {
272850f07c47ab drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2504  		dev_dbg(dev->class_dev, "no driver attached\n");
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2505  		retval = -ENODEV;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2506  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2507  	}
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2508  
476b847733636c drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2509  	if (vma->vm_flags & VM_WRITE)
20f083c07565cb drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2510  		s = comedi_file_write_subdevice(file);
476b847733636c drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2511  	else
20f083c07565cb drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2512  		s = comedi_file_read_subdevice(file);
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2513  	if (!s) {
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2514  		retval = -EINVAL;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2515  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2516  	}
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2517  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2518  	async = s->async;
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2519  	if (!async) {
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2520  		retval = -EINVAL;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2521  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2522  	}
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2523  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2524  	if (vma->vm_pgoff != 0) {
272850f07c47ab drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2525  		dev_dbg(dev->class_dev, "mmap() offset must be 0.\n");
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2526  		retval = -EINVAL;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2527  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2528  	}
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2529  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2530  	size = vma->vm_end - vma->vm_start;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2531  	if (size > async->prealloc_bufsz) {
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2532  		retval = -EFAULT;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2533  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2534  	}
44b8c793fc0d63 drivers/staging/comedi/comedi_fops.c Sandhya Bankar     2016-03-06  2535  	if (offset_in_page(size)) {
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2536  		retval = -EFAULT;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2537  		goto done;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2538  	}
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2539  
ec9d0754e0c640 drivers/staging/comedi/comedi_fops.c sayli karnik       2016-09-20  2540  	n_pages = vma_pages(vma);
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2541  
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2542  	/* get reference to current buf map (if any) */
b34aa86f12e884 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2543  	bm = comedi_buf_map_from_subdev_get(s);
af93da31634d6d drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2544  	if (!bm || n_pages > bm->n_pages) {
af93da31634d6d drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2545  		retval = -EINVAL;
af93da31634d6d drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2546  		goto done;
af93da31634d6d drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2547  	}
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2548  	if (bm->dma_dir != DMA_NONE) {
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2549  		unsigned long vm_start = vma->vm_start;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2550  		unsigned long vm_end = vma->vm_end;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2551  
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2552  		/*
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2553  		 * Buffer pages are not contiguous, so temporarily modify VMA
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2554  		 * start and end addresses for each buffer page.
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2555  		 */
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2556  		for (i = 0; i < n_pages; ++i) {
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2557  			buf = &bm->page_list[i];
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2558  			vma->vm_start = start;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2559  			vma->vm_end = start + PAGE_SIZE;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2560  			retval = dma_mmap_coherent(bm->dma_hw_dev, vma,
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2561  						   buf->virt_addr,
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2562  						   buf->dma_addr, PAGE_SIZE);
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2563  			if (retval)
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2564  				break;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2565  
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2566  			start += PAGE_SIZE;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2567  		}
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2568  		vma->vm_start = vm_start;
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2569  		vma->vm_end = vm_end;
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2570  	} else {
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2571  		for (i = 0; i < n_pages; ++i) {
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2572  			unsigned long pfn;
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2573  
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2574  			buf = &bm->page_list[i];
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2575  			pfn = page_to_pfn(virt_to_page(buf->virt_addr));
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2576  			retval = remap_pfn_range(vma, start, pfn, PAGE_SIZE,
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25 @2577  						 PAGE_SHARED);
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2578  			if (retval)
e36472145aa706 drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2579  				break;
a52840a98bbb50 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2580  
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2581  			start += PAGE_SIZE;
ed9eccbe8970f6 drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2582  		}
fd1575e28a325b drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2583  	}
ce8f9fb651fac9 drivers/comedi/comedi_fops.c         Jann Horn          2024-10-17  2584  

:::::: The code at line 2577 was first introduced by commit
:::::: e36472145aa706c186a6bb4f6419c613b0b1305c staging: comedi: use dma_mmap_coherent for DMA-able buffer mmap

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
