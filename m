Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4533F8D8;
	Sun,  1 Feb 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769951046; cv=none; b=KwsVyZVeWRitXfKwzklSGqtY3V00IPRiG829L4fFgkCaYs13g7DCQrjzoAZTJ6NhiwbZPKMj/SAQFvrdnak/FdaajR8VQY1N+267iO8kWYve4ofBJo2/+u11brN99kCiFvgHXUbgBrqSQqvv/NJWNH0e6PkmzkVZcDjCdqjXJFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769951046; c=relaxed/simple;
	bh=JxRbL3UiA7chywZx7s/1NhqsSsDE4+0tIBI21pQzhp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCkG+ZuFdPFXOqux8YH20ihcVM2rG93r+DRkAp7H5zlwhaMEIf/dgXAdNKA87HspLovJejhLM03oxfE+7g57Hp202LZXbkiZpQAN1YxB4G/A8mGJGhfwyLyAOjYtNZbB31NjQMighKqkuPYHAZaVp2/87pP+cY/zFKSB3LWZuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pea1/fW3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pea1/fW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769951042; x=1801487042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JxRbL3UiA7chywZx7s/1NhqsSsDE4+0tIBI21pQzhp8=;
  b=Pea1/fW3u05ogm+9/yHX7Vo8cFra9XH1ehfnqz3Co3xqx7RCU3cNDKJs
   5BAeGXL22leyBWYb+1wTwpuEE9G+XVvAFX75g+m68yUBrB3cgBWjCi/Or
   dx2q3yrVbmDujxy/SyKlj/uh6kdSa3xSqyJhYH7whoGMSInSj/WDZt+fn
   yIUUA1Yk/m/6AJbH6OSJ3ZRezRc8hwqbwSeOYyTRU6SYWEEevM6WhulP2
   6NrW8fpsePrH6y/Pom+waIg46goTyqHTmtkaadNHIzqIEEHmurri7qP20
   mE2yd00HhWkyKDMct1K+FEZK+WWMulo8aNV8UlIP0KBnu1b8MYHhNee5i
   g==;
X-CSE-ConnectionGUID: UA4ecby6S3aCOTr5UyKEpQ==
X-CSE-MsgGUID: nows1XRMQrWBpF16pg9YoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70149733"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="70149733"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 05:03:58 -0800
X-CSE-ConnectionGUID: 3kWg8PvUTxuKPPw4OIctOQ==
X-CSE-MsgGUID: TrdnJnaNRvGEGGazG0k4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209048462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 05:03:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmX7F-00000000elw-1KtL;
	Sun, 01 Feb 2026 13:03:49 +0000
Date: Sun, 1 Feb 2026 21:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, balbirs@nvidia.com,
	matthew.brost@intel.com, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
	mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
	jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH v5 13/13] mm: Remove device private pages from the
 physical address space
Message-ID: <202602012037.jpAjBFBa-lkp@intel.com>
References: <20260130111050.53670-14-jniethe@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130111050.53670-14-jniethe@nvidia.com>

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 344db0fba38920be64a429c64a8ca0531572896c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-migrate_device-Introduce-migrate_pfn_from_page-helper/20260130-191416
base:   344db0fba38920be64a429c64a8ca0531572896c
patch link:    https://lore.kernel.org/r/20260130111050.53670-14-jniethe%40nvidia.com
patch subject: [PATCH v5 13/13] mm: Remove device private pages from the physical address space
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602012037.jpAjBFBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1071 |                 if (IS_ERR(r))
         |                     ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1075:6: note: uninitialized use occurs here
    1075 |         if (ret) {
         |             ^~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:3: note: remove the 'if' if its condition is always true
    1071 |                 if (IS_ERR(r))
         |                 ^~~~~~~~~~~~~~
    1072 |                         ret = PTR_ERR(r);
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1035:9: note: initialize the variable 'ret' to silence this warning
    1035 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1071 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c

  1028	
  1029	int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
  1030	{
  1031		struct amdgpu_kfd_dev *kfddev = &adev->kfd;
  1032		struct dev_pagemap *pgmap;
  1033		unsigned long size;
  1034		void *r;
  1035		int ret;
  1036	
  1037		/* Page migration works on gfx9 or newer */
  1038		if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
  1039			return -EINVAL;
  1040	
  1041		if (adev->apu_prefer_gtt)
  1042			return 0;
  1043	
  1044		pgmap = &kfddev->pgmap;
  1045		memset(pgmap, 0, sizeof(*pgmap));
  1046	
  1047		/* TODO: register all vram to HMM for now.
  1048		 * should remove reserved size
  1049		 */
  1050		size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
  1051		if (adev->gmc.xgmi.connected_to_cpu) {
  1052			pgmap->range.start = adev->gmc.aper_base;
  1053			pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
  1054			pgmap->type = MEMORY_DEVICE_COHERENT;
  1055		} else {
  1056			pgmap->nr_pages = size / PAGE_SIZE;
  1057			pgmap->type = MEMORY_DEVICE_PRIVATE;
  1058		}
  1059	
  1060		pgmap->nr_range = 1;
  1061		pgmap->ops = &svm_migrate_pgmap_ops;
  1062		pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
  1063		pgmap->flags = 0;
  1064		/* Device manager releases device-specific resources, memory region and
  1065		 * pgmap when driver disconnects from device.
  1066		 */
  1067		if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
  1068			ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
  1069		} else {
  1070			r = devm_memremap_pages(adev->dev, pgmap);
> 1071			if (IS_ERR(r))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
