Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24E35504D;
	Sun, 10 May 2026 05:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778391696; cv=none; b=oQP+ca+sz73YlpGQlyJ6i2fkcUnrv4aai+RSNTuaOCiYRR1CXIi01yGpHymgTc6b/Tq9TWJHhKo7tI4zdq3rWlsr4SyxtRn/7kVwUAJzucYmZnCfOK4C72HMHoq5V95a1K1LK4iGUbK8e0O8VAoYLJAftPmmkYiuq1nD2BLU120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778391696; c=relaxed/simple;
	bh=FaSFBF1RN1ZsvA/4UwfdV6WVzjUxu01Algt9IxV1aLc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BIAcYGOVUXbQ1daIZbyHn5qZhn/tPE5xX5Rwm7P0HY+dQ29oCqpmKJfviwzw0Gpr6+VxetFJ5i2Oq3ZvXWgSzvOvIL2Y6bbFSVdBxMaCdoxIJFfJ/XWhyqCLb86c7ejl8EuaTCLpEpbXJDbBY9DtOf3tCBGnkQ2RqFxVRMHZeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fETNcViA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fETNcViA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778391694; x=1809927694;
  h=date:from:to:cc:subject:message-id;
  bh=FaSFBF1RN1ZsvA/4UwfdV6WVzjUxu01Algt9IxV1aLc=;
  b=fETNcViAC5s7yauFtZoRaeEL1sdzamzG1X2r37gMNhDb88NwsL9+J2Bd
   iPWDajQyLCcSOdpx8m46DvA4KKU6tcEmAcdmeb6HwbZBvhqXlqFHfZ0fc
   Tp5St/3Jmp3AJDZHaMe9qFWXfpmRvb1Ia6ggZqC8ElhuLMmz0PouVbu+8
   miGKNIjYbO7CHFaFrzHe9nUccArD14JP7beFkB8//nqeeXlNbnmHRnOYC
   juKpWI3WYp7imWA3svG1VNeQvB9nU+lalTXkPNxWc7qvBP/Z+N085dC4O
   POujbTjJ9FZ/kJcIydZWXEsCSQ3KFioOuR5T1eMtG/+GHrclaJFf+pAKi
   w==;
X-CSE-ConnectionGUID: ngH/pAOMSPGfZoEH/erR0A==
X-CSE-MsgGUID: 7SUftu4NS2iQDRquXDW60w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82930675"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="82930675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:41:33 -0700
X-CSE-ConnectionGUID: tvTUKEaGSlGS6YZgwkRb1w==
X-CSE-MsgGUID: T7z2icqFSn6UJEPbFT459Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="237247199"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 22:41:31 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLwuu-000000001nX-3cHU;
	Sun, 10 May 2026 05:41:28 +0000
Date: Sun, 10 May 2026 13:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 31/54] error[E0277]: `T` doesn't
 implement `Debug`
Message-ID: <202605101342.P4GWbBZn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   571e5d3c9fc1383a0f7a0a52d30fb5ad9f74bef4
commit: 4af9e85767726a5767b07a6c51479a842b4a896a [31/54] rust: Introduce iosys_map bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260510/202605101342.P4GWbBZn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101342.P4GWbBZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101342.P4GWbBZn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `T` doesn't implement `Debug`
   --> rust/kernel/iosys_map.rs:516:13
   |
   516 |             assert_eq!(*self.vec.as_ref(), *src)
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `T` cannot be formatted using `{:?}` because it doesn't implement `Debug`
   |
   = note: this error originates in the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: consider further restricting type parameter `T` with trait `Debug`
   |
   489 |     impl<T: AsBytes + FromBytes + Clone + PartialEq + core::fmt::Debug> VecIoSysMap<T> {
   |                                                     ++++++++++++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
