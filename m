Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25623ABA8;
	Tue, 10 Mar 2026 01:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106139; cv=none; b=kb19MIF+mQjOBjI8IW/68QZuYvlRL1YwnbaXCKezsYEr4Fj3fXXZyAklgoDdgGNmcmXkPZLK60QJfTh5oWb2hpgwgrz2sGkbeatoG4coqFY8CBZNtGsPU/p2q3akHNi3BvOw3tt7nTpcUuIFbWLPJjB1ntedEg7hyVeLIZxgfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106139; c=relaxed/simple;
	bh=OYRRL25JJhnSqbeItTgbclgKam+DyOlXO0iBeOjfMPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l2Pwdy0fpweohxfWqOyEd/O3bMEyJ2jxAxD8mJeBUOGlFsPA+AiDp+EweEWLbpsomMrSQuie/BckH+2ArCmgYVAoSLcjH68O3CokuSKEVdjV/ptRyJcqOQ8hYGJPuZUWMOsmN8jvxKNz9juma4YgmPXUPl+/n9w0GsCKBVtvs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js3KZ6fG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js3KZ6fG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773106138; x=1804642138;
  h=date:from:to:cc:subject:message-id;
  bh=OYRRL25JJhnSqbeItTgbclgKam+DyOlXO0iBeOjfMPA=;
  b=Js3KZ6fG6T2dxY6jbIOuSN72xcClsYdgI7XAcQ4E2QOeg0oSn/b9rS/G
   61HrwlimSEOSCMRZgPYi63sQj60arSVrIvvbEBuAfgUblM+1uYbB4C6ba
   KJzXncOSSfTmLFyvxOS22yfTADLEGqtwbeR2rt4K5lVsyYsg3gh3EfQEE
   wWDt+m9yn+HIwGIntNPBNSzwE6t1LeOcHifKnw3go7P+/VWJEL9sVpUtC
   fnhXY+Mbdq3yVei9qCmt0HVcVGvGgh3B0NeRU5V8VHJEpqeDbKUjJrUTr
   zYR7YEZ4custhThNdVdceL55n31ra0ncdnBv0mdwwqw6xnu86j56OmkW+
   w==;
X-CSE-ConnectionGUID: 68miSEJgQmOI0f7708YFLA==
X-CSE-MsgGUID: bxRj80LPS8ukAtCcxNZ2rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84470054"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84470054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 18:28:58 -0700
X-CSE-ConnectionGUID: ZWnGJ0l+Qp6GGHnh9ocuaA==
X-CSE-MsgGUID: hohpq4/UT3u/HOj/niNLGQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2026 18:28:55 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzlu1-0000000014c-2aKf;
	Tue, 10 Mar 2026 01:28:53 +0000
Date: Tue, 10 Mar 2026 09:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 2/27] error[E0433]: failed to resolve: use of
 undeclared type `GpuBuddyAllocFlags`
Message-ID: <202603100953.sdLvQZHq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   a39e8ca680493b58999f85267d9841a8926dbd45
commit: eb57be6bde8518e01bac666cf1acfb2425ba6731 [2/27] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260310/202603100953.sdLvQZHq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100953.sdLvQZHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100953.sdLvQZHq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyAllocFlags`
   --> rust/doctests_kernel_generated.rs:6635:9
   |
   6635 |         GpuBuddyAllocFlags::default(),
   |         ^^^^^^^^^^^^^^^^^^ use of undeclared type `GpuBuddyAllocFlags`
   |
   help: an enum with a similar name exists
   |
   6635 -         GpuBuddyAllocFlags::default(),
   6635 +         GpuBuddyAllocFlag::default(),
   |
   help: consider importing this struct
   |
   3    + use kernel::gpu::buddy::GpuBuddyAllocFlags;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyAllocFlags`
   --> rust/doctests_kernel_generated.rs:6648:9
   |
   6648 |         GpuBuddyAllocFlags::default(),
   |         ^^^^^^^^^^^^^^^^^^ use of undeclared type `GpuBuddyAllocFlags`
   |
   help: an enum with a similar name exists
   |
   6648 -         GpuBuddyAllocFlags::default(),
   6648 +         GpuBuddyAllocFlag::default(),
   |
   help: consider importing this struct
   |
   3    + use kernel::gpu::buddy::GpuBuddyAllocFlags;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
