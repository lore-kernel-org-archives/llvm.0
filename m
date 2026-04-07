Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342237649C;
	Tue,  7 Apr 2026 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534262; cv=none; b=RwtbWj8C+6GdmMr8ARvapoyjBcKvpdm+lnuPKOKsf+SpSSBHLo9AnQKZNLeoAd4BfSHzqNq6Hj+CCucbWPW1ZvxBfQUVCdvr/aa6VjwJei2OHnkhq6DJK3vOivbM6NttruURVpV98zZw4BQXn5I2TIvy0IWN+CvUw+Wn8Fghhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534262; c=relaxed/simple;
	bh=pv+LWIH2qjESuvAPlreBObWNr1BDUATt2B0wV5IN43o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ogS+WkGxrfhjoekxk0+2oB03Lq9bSWbMGu6a61JbuZEaIyAw8nCIXhVJ3Jfk6MwRwLJiWeNt0P/q5+YfNhWT0StttwunWbXoDcc8KUGfq46C99sNntQ6sllgwkMRX5sdMUUfO3CVMtP4wl26z2v0EyAMbpMDB02tOcCZFXKLDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNo20B5N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNo20B5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534262; x=1807070262;
  h=date:from:to:cc:subject:message-id;
  bh=pv+LWIH2qjESuvAPlreBObWNr1BDUATt2B0wV5IN43o=;
  b=hNo20B5N4ipwp1kIyjpIkKNCGIXF4f+g2CSj/oUnL8lPVjPCHWT3b4BX
   6WUzipsjzsePi0WgY2wCCkeHN+1/Gum5thLbhfJXeNydSR8u8qVqBDKSq
   6Y3yYWBfQJGgOgVz4skjFRYqPjgqYCMr+vaiByJw83R4nuQn4TksqW5fC
   Zirl0Liq76D8rcushTp+FZD3ACLmQlj/phkX+HYpBLTnzjiRMyQXZB5hh
   RmLWT5tCTGcBAKUczvAHJ1kGpSaKrkmenF/Xa5JoqGD0uEr4D2wGApDfQ
   tq7AcXPT3CT6i2sfBqMXRxOFqWdcQc9OBtiSL1unuNPJvTL6Ie83ofObS
   Q==;
X-CSE-ConnectionGUID: 4hXGbQh2Ti6m4nkRuDTpiQ==
X-CSE-MsgGUID: it77FXFfReOK7m15B/BihA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081105"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:38 -0700
X-CSE-ConnectionGUID: 6Rhvl42IQjG8QHT0iEZwjA==
X-CSE-MsgGUID: immofMRTT5yFJvCMi/HO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995307"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005R-3dCX;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 15/68] error: cannot find macro
 `vec` in this scope
Message-ID: <202604050253.RkhQPGru-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 76aa8a8de9fb5488da45a470fada7e8d6bfcd5ca [15/68] rust: alloc: vec: Add TryFrom trait
config: x86_64-randconfig-073-20260404 (https://download.01.org/0day-ci/archive/20260405/202604050253.RkhQPGru-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050253.RkhQPGru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050253.RkhQPGru-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1557:19
   |
   1557 | assert_eq!(r, Err(vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
   |                   ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1504:12
   |
   1504 | assert_eq!(vec![1, 2, 3].try_into(), Ok([1, 2, 3]));
   |            ^^^
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1505:13
   |
   1505 | assert_eq!(<Vec<i32>>::new().try_into(), Ok([]));
   |             ^^^ --- supplied 1 generic argument
   |             |
   |             expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:104:12
   |
   104  | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1505 | assert_eq!(<Vec<i32, A>>::new().try_into(), Ok([]));
   |                    +++
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1556:48
   |
   1556 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_>>().try_into();
   |                                                ^^^ - supplied 1 generic argument
   |                                                |
   |                                                expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:104:12
   |
   104  | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1556 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_, _>>().try_into();
   |                                                     +++
--
>> error[E0433]: failed to resolve: use of undeclared type `String`
   --> rust/doctests_kernel_generated.rs:1608:13
   |
   1608 | let mut v = String::from("hello world").into_bytes();
   |             ^^^^^^ use of undeclared type `String`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
