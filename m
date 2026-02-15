Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3CC14A4F9;
	Sun, 15 Feb 2026 03:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771127175; cv=none; b=ECXWlz03mZ5z1IXLwoe8z2C1uVd9jh4aRZD+FGLugXWGqtWIO9c1sapCz/ouXSu23VntuLkVsQ9n4z81tEaB9c67k1ucsxf4tet+ul0MhjEfda4Qtxi1tDM2Rh4aWBaC+W79xYyzDIp+uACxsr1NQ9w63+1/jdT/wFT1FkSZgfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771127175; c=relaxed/simple;
	bh=K5YNtWYPJzZgZE4FG/Lww+DeUXAi6GbIHOiOERw8mQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PgwMGB7A+dZTC3+ztH07vPNc6Upxi5vYhjneQizrbWOjpO5v0EPu0cnkUN4ZWfwzk5e6RrH0iOySv+N+3JKOzKi46jqki3VXe5HAMEqbxmKYAjO91PJgoXseapxg7zhFVmmJYUaeDRtNsvxzFk5IGwP07XyqJYPwkCfPK0ZKl3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdRq6mff; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdRq6mff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771127174; x=1802663174;
  h=date:from:to:cc:subject:message-id;
  bh=K5YNtWYPJzZgZE4FG/Lww+DeUXAi6GbIHOiOERw8mQA=;
  b=HdRq6mffY4zXyfueqqzM4nvvuXp7IAdDsjr6s8Sxg/OpgO1Se9FX0kaF
   S+z4eAUYEvhEk8oweDKiAXUJjL0jPYljcTk09d0R9O6f6jjkh88hFBAXg
   iHBKRTSKUKTVdveVIeSLCaitBiJMW4SBy/9y1drhjgSZyrJctU9gQ2bQt
   pnf8udakYlJM6fInFiQ2ynmq5PznPfbbvuVX/ZYAYuu36TBYOxZqHHcRk
   K2MCyjBaj1eI1Mc0MwQe/vs1q97AKMT6YbweLnTnIy8uKB6Xxa+wyXhhr
   slkiYeg0epNT4hegfrzQ6a6pXbvPXrvCvG/cg5KVEebqPIiHORupTZzUR
   g==;
X-CSE-ConnectionGUID: CTDxsqlAQmKRaF5KMNTiqQ==
X-CSE-MsgGUID: MNGkranmTqa09F6UnxPR3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="76105561"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="76105561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:46:12 -0800
X-CSE-ConnectionGUID: 6MZO8QwURk6wrRq9tm1iMw==
X-CSE-MsgGUID: uWgBYwAzTNe3DFekngV7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213377734"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2026 19:46:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrT5D-00000000xIu-0Sqh;
	Sun, 15 Feb 2026 03:46:07 +0000
Date: Sun, 15 Feb 2026 11:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 33/39]
 drivers/comedi/comedi_fops.c:2520:8: error: use of undeclared identifier
 'PAGE_SHARED'
Message-ID: <202602151112.eBPWYvm9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   04e61eabbab151166a0cfc4bb76348b0fb7451ce
commit: 7a85e2766bdd80dc608a823954864d7962d74f04 [33/39] hexagon: fix page table model for hexagon VM
config: hexagon-randconfig-001-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151112.eBPWYvm9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151112.eBPWYvm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151112.eBPWYvm9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/comedi/comedi_fops.c:2520:8: error: use of undeclared identifier 'PAGE_SHARED'
    2520 |                                                  PAGE_SHARED);
         |                                                  ^~~~~~~~~~~
   1 error generated.


vim +/PAGE_SHARED +2520 drivers/comedi/comedi_fops.c

ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2422  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2423  static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2424  {
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2425  	struct comedi_file *cfp = file->private_data;
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2426  	struct comedi_device *dev = cfp->dev;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2427  	struct comedi_subdevice *s;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2428  	struct comedi_async *async;
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2429  	struct comedi_buf_map *bm = NULL;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2430  	struct comedi_buf_page *buf;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2431  	unsigned long start = vma->vm_start;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2432  	unsigned long size;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2433  	int n_pages;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2434  	int i;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2435  	int retval = 0;
3ffab428f40849e drivers/staging/comedi/comedi_fops.c Bernd Porr         2011-11-08  2436  
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2437  	/*
c1e8d7c6a7a682e drivers/staging/comedi/comedi_fops.c Michel Lespinasse  2020-06-08  2438  	 * 'trylock' avoids circular dependency with current->mm->mmap_lock
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2439  	 * and down-reading &dev->attach_lock should normally succeed without
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2440  	 * contention unless the device is in the process of being attached
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2441  	 * or detached.
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2442  	 */
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2443  	if (!down_read_trylock(&dev->attach_lock))
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2444  		return -EAGAIN;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2445  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2446  	if (!dev->attached) {
272850f07c47ab1 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2447  		dev_dbg(dev->class_dev, "no driver attached\n");
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2448  		retval = -ENODEV;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2449  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2450  	}
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2451  
476b847733636ce drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2452  	if (vma->vm_flags & VM_WRITE)
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2453  		s = comedi_file_write_subdevice(file);
476b847733636ce drivers/staging/comedi/comedi_fops.c Greg Kroah-Hartman 2008-11-13  2454  	else
20f083c07565cb7 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-11-04  2455  		s = comedi_file_read_subdevice(file);
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2456  	if (!s) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2457  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2458  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2459  	}
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2460  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2461  	async = s->async;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2462  	if (!async) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2463  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2464  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2465  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2466  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2467  	if (vma->vm_pgoff != 0) {
272850f07c47ab1 drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2013-11-26  2468  		dev_dbg(dev->class_dev, "mmap() offset must be 0.\n");
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2469  		retval = -EINVAL;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2470  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2471  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2472  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2473  	size = vma->vm_end - vma->vm_start;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2474  	if (size > async->prealloc_bufsz) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2475  		retval = -EFAULT;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2476  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2477  	}
44b8c793fc0d630 drivers/staging/comedi/comedi_fops.c Sandhya Bankar     2016-03-06  2478  	if (offset_in_page(size)) {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2479  		retval = -EFAULT;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2480  		goto done;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2481  	}
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2482  
ec9d0754e0c6401 drivers/staging/comedi/comedi_fops.c sayli karnik       2016-09-20  2483  	n_pages = vma_pages(vma);
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2484  
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2485  	/* get reference to current buf map (if any) */
b34aa86f12e8848 drivers/staging/comedi/comedi_fops.c Ian Abbott         2014-04-10  2486  	bm = comedi_buf_map_from_subdev_get(s);
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2487  	if (!bm || n_pages > bm->n_pages) {
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2488  		retval = -EINVAL;
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2489  		goto done;
af93da31634d6d5 drivers/staging/comedi/comedi_fops.c Ian Abbott         2013-11-08  2490  	}
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2491  	if (bm->dma_dir != DMA_NONE) {
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2492  		unsigned long vm_start = vma->vm_start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2493  		unsigned long vm_end = vma->vm_end;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2494  
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2495  		/*
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2496  		 * Buffer pages are not contiguous, so temporarily modify VMA
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2497  		 * start and end addresses for each buffer page.
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2498  		 */
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2499  		for (i = 0; i < n_pages; ++i) {
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2500  			buf = &bm->page_list[i];
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2501  			vma->vm_start = start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2502  			vma->vm_end = start + PAGE_SIZE;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2503  			retval = dma_mmap_coherent(bm->dma_hw_dev, vma,
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2504  						   buf->virt_addr,
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2505  						   buf->dma_addr, PAGE_SIZE);
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2506  			if (retval)
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2507  				break;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2508  
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2509  			start += PAGE_SIZE;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2510  		}
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2511  		vma->vm_start = vm_start;
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2512  		vma->vm_end = vm_end;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2513  	} else {
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2514  		for (i = 0; i < n_pages; ++i) {
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2515  			unsigned long pfn;
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2516  
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2517  			buf = &bm->page_list[i];
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2518  			pfn = page_to_pfn(virt_to_page(buf->virt_addr));
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2519  			retval = remap_pfn_range(vma, start, pfn, PAGE_SIZE,
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25 @2520  						 PAGE_SHARED);
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2521  			if (retval)
e36472145aa706c drivers/staging/comedi/comedi_fops.c Ian Abbott         2019-06-25  2522  				break;
a52840a98bbb50a drivers/staging/comedi/comedi_fops.c H Hartley Sweeten  2012-12-19  2523  
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2524  			start += PAGE_SIZE;
ed9eccbe8970f6e drivers/staging/comedi/comedi_fops.c David Schleef      2008-11-04  2525  		}
fd1575e28a325b9 drivers/comedi/comedi_fops.c         Ian Abbott         2025-04-15  2526  	}
ce8f9fb651fac95 drivers/comedi/comedi_fops.c         Jann Horn          2024-10-17  2527  

:::::: The code at line 2520 was first introduced by commit
:::::: e36472145aa706c186a6bb4f6419c613b0b1305c staging: comedi: use dma_mmap_coherent for DMA-able buffer mmap

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
