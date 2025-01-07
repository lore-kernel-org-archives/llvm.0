Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4A1531DB;
	Tue,  7 Jan 2025 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736222261; cv=none; b=auT2vt3rR8B3ytPYF4VbmuNr1A937DXhd9l82tWME0z0T5uW8jR+CHBsWFzSj29jVrPIRyrZ5OQDUbIY1hKGTtG5xjMFTlwApxSrcfrlxD+FtTiUPTOIUGM/8jvi6KKjvBdjlmgSljYOSJK4mD0fnhriNKYH+Y8JthoBmXwPXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736222261; c=relaxed/simple;
	bh=MWTzrxNygKWibcWESozb3D2ldJ5eVEhRKk6ArEm3ch0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LzhVFC3qJRKMMSCyKAvHxKkK4n5PAxMuUKJZuDl7sleamzpUukpSRZUbRzudRatOYSFO9E8KHrwknfo8wnVBFtx5qwBcIAjF24qIyKUBmkUZgsceTC3jhxJDaWnEnZFHRaZ+GkYO489BNlfe7NyDQxd16rY7yYqCBA2U/o448yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI8BWJC4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI8BWJC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736222258; x=1767758258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MWTzrxNygKWibcWESozb3D2ldJ5eVEhRKk6ArEm3ch0=;
  b=WI8BWJC4nDLydZq8vnlfTW0fOQden0mpGz2fLcKn39D70kqde3L4CatJ
   uGBeflWTvjJSnErkxihUjR+npu4ALc+fzQGCUgCVARqIFaVT0B3Pkbw99
   Y/ZqA0c0X0aTFMHv762qSut0C3GhhlnUfmrzQZCE1luvf0P50S3nvocQn
   l5fCe0QzMkY7N3GaFd3RzAn9tfI7z+WSvlMtGkDSngrLueWrypbmAWgrW
   Ei5ab0WZeEInSHCdYFqs24ApfuKuH4s6wt4EkeZkBoONKDPSz1tHia0N1
   SLjDuEwAtmqC4Ty5n8RY25UUU4+ys5dDUZvEBhtxUkup+ArlwioOe4Ds7
   A==;
X-CSE-ConnectionGUID: 9gOIw8ovT8Gw8fOUeOvPHA==
X-CSE-MsgGUID: sfsdS273Q067AbHIVnHAGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36501532"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36501532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:57:37 -0800
X-CSE-ConnectionGUID: 9qxkMR5uQXm7ZZgR+7h88A==
X-CSE-MsgGUID: YaP7nx+hSHay8bsDDFCvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="103139913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 19:57:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0ij-000ED0-1Z;
	Tue, 07 Jan 2025 03:57:33 +0000
Date: Tue, 7 Jan 2025 11:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 5/6] ld.lld: error: duplicate
 symbol: __cfi_migrate_misplaced_folio_batch
Message-ID: <202501071118.rzxzX57x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0b481ba53a1ea6337129cbe63f9234a748df4843
commit: 853ef17ea1577e0a625e695acd45250f2610f004 [5/6] migrate: implement migrate_misplaced_folio_batch
config: x86_64-buildonly-randconfig-003-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071118.rzxzX57x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071118.rzxzX57x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071118.rzxzX57x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at filemap.c
   >>>            mm/filemap.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at debug.c
   >>>            mm/debug.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at gup.c
   >>>            mm/gup.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at memory.c
   >>>            mm/memory.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at mprotect.c
   >>>            mm/mprotect.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at rmap.c
   >>>            mm/rmap.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at folio-compat.c
   >>>            mm/folio-compat.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at vmscan.c
   >>>            mm/vmscan.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at shmem.c
   >>>            mm/shmem.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_migrate_misplaced_folio_batch
   >>> defined at compat.c
   >>>            kernel/compat.o:(__cfi_migrate_misplaced_folio_batch) in archive vmlinux.a
   >>> defined at compaction.c
   >>>            mm/compaction.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
