Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5517740;
	Sat, 13 Jan 2024 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc+38j+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705190336; x=1736726336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6O6Ume23oIi/TX0w9+NGtJlB364xE4xgpeQjLAOuO8=;
  b=bc+38j+NJQPjyPxKAJUbY3Lgvp1OxVsJJsyUxbTo6nNuCiVlPoZ6Rmbz
   Uw+QtFQbWRIZ/pRtu2xFDZVsxZ6ffLlMOyXcJm5FtxUegNaLQMFCVfPoz
   gdjx4Ws+O/Ia3URJ+NA/HLQgoNw4bZ4odgPtayQKFEYW8D9L7nNIZJ6gT
   HnkVk2AfyCpRYvFyAe+5b9deeQR4ao0YDkiR0vqp1lN1WICb6wIrHE5/V
   Vr2pyGIshMX8E2vfak8DIqsixlFDND5gqkiHm/lD28mtHsTqm0UMUAUcT
   7UNepQntdd1M1DdEU8wBb0e58DlIHoXBYCuRtQ0Dg2Su5tEVYuiMhEf8J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="18020097"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="18020097"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 15:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="17774631"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2024 15:58:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOnts-000B1c-0F;
	Sat, 13 Jan 2024 23:58:52 +0000
Date: Sun, 14 Jan 2024 07:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4606/12555]
 drivers/char/aml-gpiomem.c:128:22: error: call to undeclared function
 'phys_mem_access_prot'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401140719.hH6tmSvs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   b0ba08f75cf1fc43c19f57ea6930f3358bd2e196
commit: 7ff99842a2f49291177856844102f1aa00687214 [4606/12555] ODROID-N2/C4: char: Add /dev/gpiomem device
config: arm-randconfig-002-20240114 (https://download.01.org/0day-ci/archive/20240114/202401140719.hH6tmSvs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140719.hH6tmSvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140719.hH6tmSvs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/aml-gpiomem.c:128:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^
   1 error generated.


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
