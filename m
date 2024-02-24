Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636C14B815;
	Sat, 24 Feb 2024 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708758175; cv=none; b=W9HAANw2j7P0rpSUXoiK7790pYj40bp4XFloacA8Bpi1HNX/+D4+zi92rGK3T0DvwGsWMy2nKzCrKr0V8lqN4EJ2dcPstVi4a27tk6p762aY8BvAMvFbKJ01lwnjA8GqTQBfYI5I+p7KV09Q8zUjs/VFL3GsX8Wecn0nMTsBqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708758175; c=relaxed/simple;
	bh=ewgWoyyrlZc65Eh9H3Uaui+6uhed6up8fez9ZJbXe74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRKu35xpjPEyGIGwMsJh9jcLpdReraB/9kwCWeOK8P+J3kqU4jdaBc09UmvwtJXICIL47gGuPt/2L1DphDgqX5i1w/zuDcxdLhxR8LSLZBwLSuAqCANPc2alXZez8oM8q/+nftMGXQS4Lib0ceUeBrinpFbvpiBBjpvQc+pQspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fr6cKfJJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr6cKfJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708758173; x=1740294173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewgWoyyrlZc65Eh9H3Uaui+6uhed6up8fez9ZJbXe74=;
  b=Fr6cKfJJ0mQqv+6j7T2Oy64kHl5/uG0CcwBuC2obVYM3ejMtjjLGSmZE
   DagUnGjQZogu+fn7fWfP2J9CIul0cgYv6qr+rHZ8mvzJ2eevxJW530HU4
   7S2aHl6FdwcwGULfUqWJAGOI9vdRsNNlpCmfYMmA7nVkwRubV5G3aeGnD
   iILua7CCtwV9OGxIN7rBL7XUorRiM2h9S4HiPnJGadyUKWOpT3MIFF/xc
   Xmpsat8cLS6RccjXuBryqBoRh/GsOyIml21qv4ItCb23afWmGZ/YolLEb
   MAffmhgQ9CqKi+ggVFjGQ48pGi+xpZgtVHsHrISODZKuB4QQ6WL2ZFJD3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6043858"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6043858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 23:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6364952"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 23:02:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdm3c-0008Jc-1y;
	Sat, 24 Feb 2024 07:02:48 +0000
Date: Sat, 24 Feb 2024 15:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: "steve.jeong" <jkhpro1003@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 137/204] drivers/char/aml-gpiomem.c:128:22:
 error: implicit declaration of function 'phys_mem_access_prot'
Message-ID: <202402241457.7xJjia9V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: 0a01b3c15e7c03cfbd687185d96a66d0cca87069 [137/204] ODROID-N2/C4: char: Add /dev/gpiomem device for rootless user GPIO access.
config: hexagon-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241457.7xJjia9V-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241457.7xJjia9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241457.7xJjia9V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/aml-gpiomem.c:128:22: error: implicit declaration of function 'phys_mem_access_prot' [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
   drivers/char/aml-gpiomem.c:128:20: error: assigning to 'pgprot_t' from incompatible type 'int'
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/phys_mem_access_prot +128 drivers/char/aml-gpiomem.c

   111	
   112	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   113	{
   114		int gpio_area = 0;
   115		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   116		unsigned long end   = start + vma->vm_end - vma->vm_start;
   117	
   118		while (gpio_area < inst->gpio_area_count) {
   119			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   120			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   121				goto found;
   122			gpio_area++;
   123		}
   124	
   125		return -EACCES;
   126	
   127	found:
 > 128		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   129				vma->vm_end - vma->vm_start,
   130				vma->vm_page_prot);
   131	
   132		vma->vm_ops = &aml_gpiomem_vm_ops;
   133	
   134		if (remap_pfn_range(vma, vma->vm_start,
   135					vma->vm_pgoff,
   136					vma->vm_end - vma->vm_start,
   137					vma->vm_page_prot)) {
   138			return -EAGAIN;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
