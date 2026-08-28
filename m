Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30CC220F2A;
	Fri, 28 Aug 2026 04:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890681; cv=none; b=utSUkWCDE0Wy4PaAk2QRtcjtTAEO3wQgWkt+auzoqeRB7fG/A/GMr//fXEDZ560H+pyglrrne/XavjWBajrv0IjHEyqbodehI/ZbvuFxG3FJWmp/n4z2ekH07cbLAKxASJd9wOP+jvt2uJ8uJScAQeU28qc0y5rdoVHP7yNeDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890681; c=relaxed/simple;
	bh=yLq1wRcAH5NMvRuDwAWVzg5Q0zJ0orOzBAJrPVhWXf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=es68JV2oBXKjZozpTrnBrXrS5m8qvm9lCsOrs0r4hkkm+ZD5zA0iJhTfqVsOSKK5QIouM9FaETtIndW3q9NDvlnzz5l6HU3Qj5ueZM2Ld16ts9eM63t6hRIuJ6wQ9mdxqwfQWzSs7O8baebmKBrFwnSHrELRsT5IYxMDP8DOdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQwFAmVG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQwFAmVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787890680; x=1819426680;
  h=date:from:to:cc:subject:message-id;
  bh=yLq1wRcAH5NMvRuDwAWVzg5Q0zJ0orOzBAJrPVhWXf0=;
  b=nQwFAmVG+obtSMGQ+Pe+HNILbGstIQKWsf58kBSNrQGBL9syLGVulBvb
   AbvxxzNEQEUq20WPS304VVZA6/UdasvgId7WIEEDXKTGKqon3PxE+HLzn
   92y/U3hRCh+YsTfCMn6YeMsfTAGXYGUqxVPb/jPNIYrzzM3EFGen5RHRn
   EUmRFyaSZyWJ1iEpGoUYfp2BwZoFEO2btQz+hb83WqRGaJuSK1YCL8/Yn
   L8rZrsVCWiqJwXQmwbcPbhXPW6dqqZDrqU1PB/Z9Q6YVkFmHAU+ln+fGE
   atr6/Yh7q4ZDVA7lQdKYPnpDq0Kzzt/fxqhfYLS8jfouqOBmdyhaIf1z9
   g==;
X-CSE-ConnectionGUID: oma6F7RUSWi5b21zibrbcw==
X-CSE-MsgGUID: C+PkKlYcTkGraihz0lV8rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88521983"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88521983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 21:17:59 -0700
X-CSE-ConnectionGUID: O2Vd0PN9SoWG2jzCvNARHQ==
X-CSE-MsgGUID: b+CHsb/NQzyyw6Iyn/x0TQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2026 21:17:57 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzo2N-00000000AMT-1wkq;
	Fri, 28 Aug 2026 04:17:55 +0000
Date: Fri, 28 Aug 2026 12:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 28/79] error: cannot find macro
 `vec` in this scope
Message-ID: <202608281210.zhnKMxsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: ade253cc58e6089f3650bc816b34863e60d3ca13 [28/79] rust: alloc: vec: Add TryFrom trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260828/202608281210.zhnKMxsR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281210.zhnKMxsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281210.zhnKMxsR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1744:19
   |
   1744 | assert_eq!(r, Err(vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
   |                   ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1691:12
   |
   1691 | assert_eq!(vec![1, 2, 3].try_into(), Ok([1, 2, 3]));
   |            ^^^
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1692:13
   |
   1692 | assert_eq!(<Vec<i32>>::new().try_into(), Ok([]));
   |             ^^^ --- supplied 1 generic argument
   |             |
   |             expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:130:12
   |
   130 | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1692 | assert_eq!(<Vec<i32, A>>::new().try_into(), Ok([]));
   |                    +++
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1743:48
   |
   1743 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_>>().try_into();
   |                                                ^^^ - supplied 1 generic argument
   |                                                |
   |                                                expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:130:12
   |
   130 | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1743 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_, _>>().try_into();
   |                                                     +++
--
>> error[E0433]: cannot find type `String` in this scope
   --> rust/doctests_kernel_generated.rs:1795:13
   |
   1795 | let mut v = String::from("hello world").into_bytes();
   |             ^^^^^^ use of undeclared type `String`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
