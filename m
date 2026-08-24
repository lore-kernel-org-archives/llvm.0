Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D34640E8FC;
	Mon, 24 Aug 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573772; cv=none; b=MaRa1L4Uj2NOszgbLBgUeG+cVrtGpP0q0dTR4Mi/RSRVt01jh0Y26iKyJiOFVLWztYl6ZIkAqINcUD8TkTTkshH3qxHwHai6BbpMl9rG/UCrB5R/28sswh+mN6t5V8+5wYQhztjiLiULLdmYFzOZ0PpNjO6MlXeTo91VZe+EVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573772; c=relaxed/simple;
	bh=gp1su7cs/8D7VylXuPHbbK+arTgY2+e1sqQPwNbMxG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UBJjUaz3OIcM+lG0cVCmJZQ8BqDwxfPGrTQzkYgRPE5G2d5NsVvJsf4/zcVgg5HjAbLuiVTItRoMw8KEGDx/d9DLQ9ecO83+DVREdlTbl2ZtEwWXgRH6ec6VWROsdpUrBZp5ae5/BsP1ZT7fuiSDzH8dVD3Qg8e+3Dqh7dikjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeFBcm2d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeFBcm2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573771; x=1819109771;
  h=date:from:to:cc:subject:message-id;
  bh=gp1su7cs/8D7VylXuPHbbK+arTgY2+e1sqQPwNbMxG4=;
  b=jeFBcm2dCoUXgpUOSdwBxg+TrpLtREhQidlOhJV4NlpAbD2s/gIWZf0S
   EfuAa1dKKAimkWCrkX7b2zCZ2wnHeL6UWnz2NvgFBn8ByyUpUf5tTE+4e
   s7DlwvvX7GYnzt2h7nt4Qil55vf7nC34YXb1fvxSYZdCOCVyQbAxH+EcU
   Q8SO1ir9chJ8QN07z5jSeEMNtuOExK5q4Rbf5X83Pzdo/58hF7dgiFXd+
   3aYU6KI/nGEp8QjPNmo8qfBupK5eY0nB9ed3mihOb/sX2fIj5w2dNVX6y
   4ZAn06FYPZwVcBXEIlhWDN06pbNaHHgrMwCuPD3QHJmIgJ8TgXr9/Q7vw
   Q==;
X-CSE-ConnectionGUID: Pzf9mrEwRoOEKNdOCSG15A==
X-CSE-MsgGUID: QAYQ+DBYSO2+yrm6otd1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="86973383"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="86973383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:16:09 -0700
X-CSE-ConnectionGUID: T0+Ef5q/RUa5Gz3VDrqFWg==
X-CSE-MsgGUID: AcA41ItFRTa3Jv9t/MP2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267027239"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Aug 2026 05:16:08 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyTaq-000000002yp-29hv;
	Mon, 24 Aug 2026 12:16:01 +0000
Date: Mon, 24 Aug 2026 20:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 33/87]
 drivers/comedi/comedi_fops.c:2577:8: error: use of undeclared identifier
 'PAGE_SHARED'
Message-ID: <202608242015.XjVt2GxM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   844bcfb5bee7bf0e713f61307dc2a4e16963c2f9
commit: 3c3a466cd42667b9df6f61b817cbd403056008a0 [33/87] hexagon: fix page table model for hexagon VM
config: hexagon-randconfig-001-20260824 (https://download.01.org/0day-ci/archive/20260824/202608242015.XjVt2GxM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242015.XjVt2GxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608242015.XjVt2GxM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/comedi/comedi_fops.c:2577:8: error: use of undeclared identifier 'PAGE_SHARED'
    2577 |                                                  PAGE_SHARED);
         |                                                  ^
   1 error generated.
--
>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^
   1 error generated.


vim +/PAGE_SHARED +2577 drivers/comedi/comedi_fops.c

ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2479  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2480  static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2481  {
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2482  	struct comedi_file *cfp = file->private_data;
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2483  	struct comedi_device *dev = cfp->dev;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2484  	struct comedi_subdevice *s;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2485  	struct comedi_async *async;
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2486  	struct comedi_buf_map *bm = NULL;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2487  	struct comedi_buf_page *buf;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2488  	unsigned long start = vma->vm_start;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2489  	unsigned long size;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2490  	int n_pages;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2491  	int i;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2492  	int retval = 0;
3ffab428f40849e drivers/staging/comedi/comedi_fops.c Bernd Porr         2011-11-08  2493  
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2494  	/*
c1e8d7c6a7a682e drivers/staging/comedi/comedi_fops.c Michel Lespinasse  2020-06-08  2495  	 * 'trylock' avoids circular dependency with current->mm->mmap_lock
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2496  	 * and down-reading &dev->attach_lock should normally succeed without
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2497  	 * contention unless the device is in the process of being attached
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2498  	 * or detached.
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2499  	 */
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2500  	if (!down_read_trylock(&dev->attach_lock))
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2501  		return -EAGAIN;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2502  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2503  	if (!dev->attached) {
272850f07c47ab1 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2504  		dev_dbg(dev->class_dev, "no driver attached\n");
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2505  		retval = -ENODEV;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2506  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2507  	}
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2508  
476b847733636ce drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2509  	if (vma->vm_flags & VM_WRITE)
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2510  		s = comedi_file_write_subdevice(file);
476b847733636ce drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2511  	else
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2512  		s = comedi_file_read_subdevice(file);
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2513  	if (!s) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2514  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2515  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2516  	}
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2517  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2518  	async = s->async;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2519  	if (!async) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2520  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2521  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2522  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2523  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2524  	if (vma->vm_pgoff != 0) {
272850f07c47ab1 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2525  		dev_dbg(dev->class_dev, "mmap() offset must be 0.\n");
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2526  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2527  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2528  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2529  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2530  	size = vma->vm_end - vma->vm_start;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2531  	if (size > async->prealloc_bufsz) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2532  		retval = -EFAULT;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2533  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2534  	}
44b8c793fc0d630 drivers/staging/comedi/comedi_fops.c Sandhya Bankar     2016-03-06  2535  	if (offset_in_page(size)) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2536  		retval = -EFAULT;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2537  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2538  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2539  
ec9d0754e0c6401 drivers/staging/comedi/comedi_fops.c sayli karnik       2016-09-20  2540  	n_pages = vma_pages(vma);
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2541  
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2542  	/* get reference to current buf map (if any) */
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2543  	bm = comedi_buf_map_from_subdev_get(s);
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2544  	if (!bm || n_pages > bm->n_pages) {
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2545  		retval = -EINVAL;
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2546  		goto done;
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2547  	}
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2548  	if (bm->dma_dir != DMA_NONE) {
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2549  		unsigned long vm_start = vma->vm_start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2550  		unsigned long vm_end = vma->vm_end;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2551  
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2552  		/*
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2553  		 * Buffer pages are not contiguous, so temporarily modify VMA
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2554  		 * start and end addresses for each buffer page.
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2555  		 */
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2556  		for (i = 0; i < n_pages; ++i) {
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2557  			buf = &bm->page_list[i];
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2558  			vma->vm_start = start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2559  			vma->vm_end = start + PAGE_SIZE;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2560  			retval = dma_mmap_coherent(bm->dma_hw_dev, vma,
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2561  						   buf->virt_addr,
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2562  						   buf->dma_addr, PAGE_SIZE);
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2563  			if (retval)
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2564  				break;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2565  
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2566  			start += PAGE_SIZE;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2567  		}
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2568  		vma->vm_start = vm_start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2569  		vma->vm_end = vm_end;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2570  	} else {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2571  		for (i = 0; i < n_pages; ++i) {
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2572  			unsigned long pfn;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2573  
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2574  			buf = &bm->page_list[i];
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2575  			pfn = page_to_pfn(virt_to_page(buf->virt_addr));
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2576  			retval = remap_pfn_range(vma, start, pfn, PAGE_SIZE,
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25 @2577  						 PAGE_SHARED);
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2578  			if (retval)
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2579  				break;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2580  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2581  			start += PAGE_SIZE;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2582  		}
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2583  	}
ce8f9fb651fac95 drivers/comedi/comedi_fops.c         Jann Horn          2024-10-17  2584  

:::::: The code at line 2577 was first introduced by commit
:::::: e36472145aa706c186a6bb4f6419c613b0b1305c staging: comedi: use dma_mmap_coherent for DMA-able buffer mmap

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
