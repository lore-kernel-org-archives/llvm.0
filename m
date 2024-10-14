Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAAE14A609;
	Mon, 14 Oct 2024 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893397; cv=none; b=jUnNkMyYzksFsVkXDBmK1ylfRxq67jG7y0aXMygpO+LMAMsqbGsw7ofXTqRwajP4Nt+hlXVw/f0Y18Gers3/5NEE3Ip2EjSlmZBcvfvCX7RP/u+o6Hnit2hl8F+6omTum6pY7n7VXefz+kHPAOjbdxnKoQ5qipIU4OhyJhk9NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893397; c=relaxed/simple;
	bh=MTiR1yVtoESeHYG0VPqNluUGP7puK5Ws5VffxcAAxd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhB16QJxWvC+kZmfOUjhYyYFtirUiGxl0DOk9aQJvl/GN0BPchi1QokDZW30Ep2QGlGMOHzMxs0OoHfZRGZa3xdOENu4/yoXiM/c5CpflMeEHW6BqilDM42hwDIPjhA6qzieXnVWRNddQ5MxsAg4h980Fg/DRlbQSE10Wnl8Y2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNRhtS3f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNRhtS3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728893396; x=1760429396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTiR1yVtoESeHYG0VPqNluUGP7puK5Ws5VffxcAAxd8=;
  b=GNRhtS3fHn2ldJIVx10gavi5/Jo8rCxmzaF+Gc9lc0oqXpzc0aTP7DAF
   K5ERLCuXYjhm1ftsWFqnXWDMTYT49ZgroHm/yQAMKy40hMiQuc9mjblDg
   aRTTjv4Z9DSAnAm70OceK/l4MHOdZKxeeOYn/GH/MHGQYRo+oUVWqrNwR
   qXLUK5XbMevBAXUFe/sVivCcFvzxCYp3yndi1Ik+MI6W2+Ua5jIPqQVb2
   0zYff+mAGuU0T7XNsbGLGeff/iMfCDn3GIBImXIo6YMEIAYW9Du8cIeXt
   Na7DMqmctM5Nk/chll6al/76Ri9GKvPSBFyDmW9Dq94p5NSP0u+H7khlR
   g==;
X-CSE-ConnectionGUID: ot3Y+kcvSru4HuRZ1TTSQQ==
X-CSE-MsgGUID: fmPiqdsASuSy0WhbpknLNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28114024"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="28114024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:09:55 -0700
X-CSE-ConnectionGUID: 3lEZVTa0Q9KUticmygZXew==
X-CSE-MsgGUID: 3dyj50oaR7+5DRBhD0KQHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77155266"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2024 01:09:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0G9I-000F45-0J;
	Mon, 14 Oct 2024 08:09:52 +0000
Date: Mon, 14 Oct 2024 16:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/88] drivers/char/aml-gpiomem.c:129:22:
 error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202410141526.fhtGrLIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   506d08468b830f4f71052cf0f23e9f1053f9c9b6
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/88] ODROID-N2/C4: char: Add /dev/gpiomem device
config: arm-randconfig-001-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141526.fhtGrLIX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141526.fhtGrLIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141526.fhtGrLIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/aml-gpiomem.c:51:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/char/aml-gpiomem.c:129:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^
   1 warning and 1 error generated.


vim +/phys_mem_access_prot +129 drivers/char/aml-gpiomem.c

   112	
   113	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   114	{
   115		int gpio_area = 0;
   116		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   117		unsigned long end   = start + vma->vm_end - vma->vm_start;
   118	
   119		while (gpio_area < inst->gpio_area_count) {
   120			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   121			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   122				goto found;
   123			gpio_area++;
   124		}
   125	
   126		return -EACCES;
   127	
   128	found:
 > 129		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   130				vma->vm_end - vma->vm_start,
   131				vma->vm_page_prot);
   132	
   133		vma->vm_ops = &aml_gpiomem_vm_ops;
   134	
   135		if (remap_pfn_range(vma, vma->vm_start,
   136					vma->vm_pgoff,
   137					vma->vm_end - vma->vm_start,
   138					vma->vm_page_prot)) {
   139			return -EAGAIN;
   140		}
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
