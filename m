Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C95253F10;
	Tue,  4 Mar 2025 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099376; cv=none; b=f9+JDg7D5ZRLP2wutfjab8yjb0u8Iw55Ks7SGvXFTTHeaRnPjpXXJaMPnW6lCjAFwGGcMqx9axL22s/B/B8DHjPeDm7OaKRdL6HAI5VbgW0xHyPMXtire4udFdzrDN9bSmJrI0Zahx01ph6mcEMVzXrZL5YKcmpFFm1zNkuP/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099376; c=relaxed/simple;
	bh=YSnhZsUjyUL6Mu+1UEaqCNP9DKkYnb+Vju3GpoI0nfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1pAiwK6FjV2U58ySEIJb7Pn9OfguEdLa2oer4GZtxKTzUBwaMLqDepvPgw0+77fHhktoyY8MXTJBVaEawerDedy4dxCYstugaCEnvCJ05sI7m1TCZdUHeYGAgPQppC10kDc4iWTLtDwyKhLMgFc7seFs3L5+kUjl+Uga9gcriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbN+bzML; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbN+bzML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741099375; x=1772635375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSnhZsUjyUL6Mu+1UEaqCNP9DKkYnb+Vju3GpoI0nfo=;
  b=kbN+bzMLkNnyDMGR0Y184LcCmvvFkgTOwV9G4qJWkNzBtQQqKC4V7182
   e4tMvWrrZD2ccGaqYL/GXN+nnKnIQyjFG94XOrt6HZIRQWzTskVJGrOa0
   N3uBTD/O2lsxAtTO9ZQ3m3AUBuPlV5FpTr6AGzxMhHvlahsTKW5OI+/0y
   +rzl9spQ7z7pYobizwb7+9mf3aDNwRnuba4En3M5Io2sJgFXr6Ie/pyFd
   7WkFWL5GEl9ogFK26nCZ4JyMumqn2gcXSzOSed+QBQLG8R/JId0Kj5GJZ
   fPaApgOHN7fOZEmmEj3Xji6n1hcqFDD7zj2xNa8hTGIVmNKuQcbxhZUIn
   Q==;
X-CSE-ConnectionGUID: 8dk5RnxyR/qDCL89AHmldg==
X-CSE-MsgGUID: drtFg3EjRVCz9kg6njY1UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44826573"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="44826573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:42:54 -0800
X-CSE-ConnectionGUID: 89cKP9PuSiCO+csob+RIUQ==
X-CSE-MsgGUID: SaND+0svTXu9hqHmmev+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="123001210"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Mar 2025 06:42:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpTTv-000Ju2-06;
	Tue, 04 Mar 2025 14:42:51 +0000
Date: Tue, 4 Mar 2025 22:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm_init/mem_init/v0.1 2/13] arch/um/kernel/physmem.c:27:41:
 warning: variable 'total_pages' set but not used
Message-ID: <202503042228.XJgKY4mi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm_init/mem_init/v0.1
head:   55eb95380e481029d5e7b8b442b0fdfbe79a9d3e
commit: 6daa1f5d8ea5504c283f562a925f9b8b0d1602d2 [2/13] dev: arch, mm: set max_mapnr when allocating memory map
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250304/202503042228.XJgKY4mi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503042228.XJgKY4mi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503042228.XJgKY4mi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/kernel/physmem.c:27:41: warning: variable 'total_pages' set but not used [-Wunused-but-set-variable]
      27 |         unsigned long phys_pages, iomem_pages, total_pages;
         |                                                ^
   1 warning generated.


vim +/total_pages +27 arch/um/kernel/physmem.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  24  
cd05cbed42b731 Tiwei Bie      2024-09-16  25  void __init mem_total_pages(unsigned long physmem, unsigned long iomem)
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  {
cd05cbed42b731 Tiwei Bie      2024-09-16 @27  	unsigned long phys_pages, iomem_pages, total_pages;
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  	phys_pages  = physmem >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  30  	iomem_pages = iomem   >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  31  
cd05cbed42b731 Tiwei Bie      2024-09-16  32  	total_pages = phys_pages + iomem_pages;
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  34  

:::::: The code at line 27 was first introduced by commit
:::::: cd05cbed42b73168b0772b83bc24769fea3871bf um: Remove highmem leftovers

:::::: TO: Tiwei Bie <tiwei.btw@antgroup.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
