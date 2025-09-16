Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E7307ACC;
	Tue, 16 Sep 2025 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758060970; cv=none; b=EAKBz8p+/5k8JYw0/74oV2I0lISMPXinSeGgaCaDSGM3hUuTxxJFLenwR96Al8hurWDlEG4+1jxFBpXiPeVE7H3IcYghFmj7CMOgttwJ4nbMRXb0kSG/cfdNUX1H6TJrv7rZR3zgwI4UUfUQcNKMN+UJQzszEfPtnm0NJxY6QMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758060970; c=relaxed/simple;
	bh=G/ZOM1MAov07T+kT+zqo+bBgX9qlH/y7ciMBqASwwm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5B72q8xJFrzKyB2i51XkXcakxP4CBE4Bcst4bAt0a2JLoBJUBSGnM6Ke+x5iCACOWH7i/+1/y1dyU7KptMLZAfGiAC7BuKIU5pxuN5bZ+4QWcz0h/v7l1qDTmySdSi2xPbqovlorehRlysE24v2qiCGGOkJq8xts4CHDtCQV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS7HNlb7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS7HNlb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758060967; x=1789596967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/ZOM1MAov07T+kT+zqo+bBgX9qlH/y7ciMBqASwwm4=;
  b=dS7HNlb7H0s30izDNZVLKltYEQ67fpd1Vz8AQwpIr4vgR854ibFYunw9
   xBRO9qknp3Z1HBri2skLFo4uSXnuCDM7SW2sAkjb1Br2jspU4KcCQRrF9
   hatBBTXRkGp79Vv5MtXwasXP+ZOcwJTlOUlpe6U1MvEEXdY0QxV2P2wg8
   y7Am0Mnjyp8cHwbzyPqmIdepUPUhpKFbW27HMAkIttXaVBWlRN4lnUyJm
   rNubKEXLH32z522v0stiXBcLeec3RM7fYDo+j0Rh8XjprH7LluMqVqEXp
   3L9btJFLj1sSzWOH4lueMOw/5/p4ncSxcRYaxhQ3LwlRF1lcLq81iYfRZ
   Q==;
X-CSE-ConnectionGUID: 6Q2emMBBTWSqsnwqwkbj4g==
X-CSE-MsgGUID: N5QU7GcdTA22wH+ZrJ4+XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60272957"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60272957"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 15:16:04 -0700
X-CSE-ConnectionGUID: n6oy8y19ToOYnXDxEsG8HQ==
X-CSE-MsgGUID: XTt+bNywRsO2hovLYFOFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175840554"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 15:16:03 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uydxx-0000n6-0L;
	Tue, 16 Sep 2025 22:16:01 +0000
Date: Wed, 17 Sep 2025 06:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 7677/9696] mm/kmsan/hooks.c:372:6: error: too
 many arguments to function call, expected 3, have 4
Message-ID: <202509170638.AMGNCMEE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 6eb1e769b2c13a33cb2ca694454a7561d3d72c0a [7677/9696] kmsan: convert kmsan_handle_dma to use physical addresses
config: x86_64-buildonly-randconfig-002-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170638.AMGNCMEE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170638.AMGNCMEE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170638.AMGNCMEE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kmsan/hooks.c:372:6: error: too many arguments to function call, expected 3, have 4
     371 |                 kmsan_handle_dma(sg_page(item), item->offset, item->length,
         |                 ~~~~~~~~~~~~~~~~
     372 |                                  dir);
         |                                  ^~~
   mm/kmsan/hooks.c:362:19: note: 'kmsan_handle_dma' declared here
     362 | EXPORT_SYMBOL_GPL(kmsan_handle_dma);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:21: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   1 error generated.


vim +372 mm/kmsan/hooks.c

7ade4f10779cb4 Alexander Potapenko 2022-09-15  363  
7ade4f10779cb4 Alexander Potapenko 2022-09-15  364  void kmsan_handle_dma_sg(struct scatterlist *sg, int nents,
7ade4f10779cb4 Alexander Potapenko 2022-09-15  365  			 enum dma_data_direction dir)
7ade4f10779cb4 Alexander Potapenko 2022-09-15  366  {
7ade4f10779cb4 Alexander Potapenko 2022-09-15  367  	struct scatterlist *item;
7ade4f10779cb4 Alexander Potapenko 2022-09-15  368  	int i;
7ade4f10779cb4 Alexander Potapenko 2022-09-15  369  
7ade4f10779cb4 Alexander Potapenko 2022-09-15  370  	for_each_sg(sg, item, nents, i)
7ade4f10779cb4 Alexander Potapenko 2022-09-15  371  		kmsan_handle_dma(sg_page(item), item->offset, item->length,
7ade4f10779cb4 Alexander Potapenko 2022-09-15 @372  				 dir);
7ade4f10779cb4 Alexander Potapenko 2022-09-15  373  }
7ade4f10779cb4 Alexander Potapenko 2022-09-15  374  

:::::: The code at line 372 was first introduced by commit
:::::: 7ade4f10779cb46f5c29ced9b7a41f68501cf0ed dma: kmsan: unpoison DMA mappings

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
