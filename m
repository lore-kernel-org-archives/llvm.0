Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF191419B3;
	Fri, 23 Feb 2024 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708730571; cv=none; b=g/i7DRUXwh8T1X2FzcAWB8EE3bK7+WXlgedLuIyXIKJMh003bjk7BhfNygNU4pqebpBqHp6iRxfaH7UgG27It4PwsHUoOfHYQriYUbe6ooRHRQ2dKsAKu+WvMLvXye6SvcZu13uLGxYuJwGj4ukN+d+oKnuR1RB4HcXZT8l9vjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708730571; c=relaxed/simple;
	bh=RG2wTUV6TvUQCWMBeSjV9fAk96OxXzir2MdZkFCf/IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoiDHmdsK1LObLax6qNkY9IabZrI6rWbeTKWICGD8GywGDYdvTJjgpr9U01Z0zLdTQdwPPF3u22pIuQ1n2IWPQZJdW81LrM/y+asTHyw1TkeU1kjC1RA4iFVUB2DdF82SbL9N0aNur2Y+en8Fm08tXnO4haFQu8N776eQMjDJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGmYKGLo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGmYKGLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708730570; x=1740266570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RG2wTUV6TvUQCWMBeSjV9fAk96OxXzir2MdZkFCf/IQ=;
  b=jGmYKGLorXzBnaPUBi4EK2RLLVZMmcs8v/Ih1Um+c2dFHnU1Fj3F6Sd9
   /jYI+mpHmelD1Tn1xLN9SHAezJt+gQ+qhr3YRFAFUrt0HioSQi/K5jR1q
   yhXN3WJusM5e2R1lD4KDbnQ9juqVzQnATDHj2DQ+3Q1ksh0/9GgWx1Vho
   7mjH67O6Fgp7zMgn/uxtWTdj0YesprdzshcYNywpV7ODsJisbh3G5kTuk
   IYR40vQU1HeH6fvm2VPavt+AgJsjRnspJl8CyJxZshXmY128r7MFWY0Jr
   u3fZTDVLReth4dE78lcMjJk6Mlb7mF1ygl41CSpdjokT1JnNQELJIDun+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3201230"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3201230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 15:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5988942"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2024 15:22:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdesO-000804-1h;
	Fri, 23 Feb 2024 23:22:44 +0000
Date: Sat, 24 Feb 2024 07:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Kim <brian.kim@hardkernel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>, memeka <mihailescu2m@gmail.com>,
	Yang Deokgyu <secugyu@gmail.com>
Subject: [tobetter:odroid-5.15.y 21/204]
 drivers/char/exynos-gpiomem.c:121:22: error: implicit declaration of
 function 'phys_mem_access_prot'
Message-ID: <202402240703.lHthbyvx-lkp@intel.com>
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
commit: 61f45d975621becb00c0aef303769f10428b9cd8 [21/204] ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access
config: hexagon-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402240703.lHthbyvx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240703.lHthbyvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240703.lHthbyvx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/exynos-gpiomem.c:121:22: error: implicit declaration of function 'phys_mem_access_prot' [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
>> drivers/char/exynos-gpiomem.c:121:20: error: assigning to 'pgprot_t' from incompatible type 'int'
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/phys_mem_access_prot +121 drivers/char/exynos-gpiomem.c

   106	
   107	static int exynos_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   108	{
   109		int gpio_area = 0;
   110	
   111		while (gpio_area < inst->gpio_area_count) {
   112			if ((inst->gpio_regs_phys[gpio_area] >> PAGE_SHIFT) == vma->vm_pgoff)
   113				goto found;
   114	
   115			gpio_area++;
   116		}
   117	
   118		return -EACCES;
   119	
   120	found:
 > 121		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   122				PAGE_SIZE,
   123				vma->vm_page_prot);
   124	
   125		vma->vm_ops = &exynos_gpiomem_vm_ops;
   126	
   127		if (remap_pfn_range(vma, vma->vm_start,
   128					vma->vm_pgoff,
   129					PAGE_SIZE,
   130					vma->vm_page_prot)) {
   131			return -EAGAIN;
   132		}
   133	
   134		return 0;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
