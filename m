Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DE3D982;
	Sat,  7 Sep 2024 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731289; cv=none; b=c5lvXgYwSoogdjsf2iOz43JJ+dZUXT/ZLYf889aq1t6J26pwaqUdUrIJ6vdw5dvs9oUp8S0riBp/oXQcwYQTa35x5PUCXXO3gLyGPi06hEYZVeUMmPKphxuBvmrQ7m3Im2JyBJaaSICCS0RC6e464c+h35VILvRWL6kGBphLWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731289; c=relaxed/simple;
	bh=rWvxc5qQ76GxQFViaQIWgGD99/ej2hDGIu9YulFZXn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZBoBKESmgZl2Fsj/PrxsEbBie/Oea3hGNN9FrCfwsZhvg9pnh0gVFsIa1FrXrpNkagwSd4k7FjTGPMrWzDYDd1RRpVbxtUrUs6EP51Dndeb5kHljGvd7NYoZ3vRoItJMDHtmY6KssHs/yvGfZOtB+8+nWO/oHgYGx+Tdp6PnCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/m2Z8RZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/m2Z8RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725731289; x=1757267289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWvxc5qQ76GxQFViaQIWgGD99/ej2hDGIu9YulFZXn0=;
  b=L/m2Z8RZtG61kujRQ+5/CrzRhzlYMPHn4Mv4ev6YF9PSYd64bCfJrb1f
   0Yi216oMnh4kR2+uTetdsVGLqAj5+IJgNu7FZE/p5U5TEBqM9h+67JZc+
   XA2n3bh9tQjZnyKva54399DpOm0BZ4ikMbW9L6AlMeWS2Qfp9BdT3wio1
   7BuXo8EYxWEd4cqL6DgUd6xZ7PBxi1JLRvOr6DxGcTF1WzlqOIDYpdUcy
   XUiM4B91DCwvLzcDNPNX2WhPqQ06URakQvt2EwB+MbgANZytTqsoprhLW
   dmmnG+l3V5g032N/Q3mG6hMRDZoaOA9pC3eURAjCy22LUdke17adzuGyI
   g==;
X-CSE-ConnectionGUID: O1brRmTmQAyrQkHxWVbKHg==
X-CSE-MsgGUID: JwgLIhQMRxOAVKr/q72guA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35615194"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35615194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:48:08 -0700
X-CSE-ConnectionGUID: B/Y9vomSREqc3s3UuISvPA==
X-CSE-MsgGUID: APWCvyCqSha0F/x56vZWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66039835"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 10:48:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzXX-000Cnf-2S;
	Sat, 07 Sep 2024 17:48:03 +0000
Date: Sun, 8 Sep 2024 01:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/82] drivers/char/aml-gpiomem.c:129:22:
 error: implicit declaration of function 'phys_mem_access_prot' is invalid in
 C99
Message-ID: <202409080128.akaGy1t7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/82] ODROID-N2/C4: char: Add /dev/gpiomem device
config: riscv-randconfig-002-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080128.akaGy1t7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080128.akaGy1t7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080128.akaGy1t7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/aml-gpiomem.c:129:22: error: implicit declaration of function 'phys_mem_access_prot' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
   drivers/char/aml-gpiomem.c:129:20: error: assigning to 'pgprot_t' from incompatible type 'int'
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
