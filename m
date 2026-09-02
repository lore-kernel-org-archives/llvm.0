Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC5133D4E2;
	Wed,  2 Sep 2026 04:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324970; cv=none; b=KBsLk1hluYtEHI0omczjrqE363R0L2WUfMeC1w/5NyEV18FNfKhu/BT6Kge4kD+PFfw1hn283bK3J5rnEnhp616JgaB4BxV6BTLfxmi5sTVRjgWYvzx1mKR5KLlYy57+frqNbsXgRAIiHTtxhgm+AB5DGDJ7sUrNGwUcgfMXyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324970; c=relaxed/simple;
	bh=RON1FVMyUgpyG+Se/itPQEfAd5JBmKz0sYokSRkzuhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qQLrX5kpjxyHFfHXeCExGmzIDLZzw7qlMqkjzVExI0F6msUsxqCPvWVlhq3ZQgF+JwNnswOiMKyD1IBGToFIcJm0p+afsKlo5lmNsbr04W3FZZBYgF+kFEsRfilXgrvth7jPSJ/O2FtOX3aSIQfUBNe1aLCnz2xL/QGtK4+P1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4bkgjb6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4bkgjb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788324969; x=1819860969;
  h=date:from:to:cc:subject:message-id;
  bh=RON1FVMyUgpyG+Se/itPQEfAd5JBmKz0sYokSRkzuhg=;
  b=Z4bkgjb6jRpMrnrQ3vinyJhsze6LT/43qNvO85b/Ta8HQioWsLmtp9CQ
   TyPdPHYrJapidwpRaZYFIiy5Op5HADZ/rALKaEhaoXmNrrQI0FMqoVBxU
   c/hZMdoj8w++y9WsGi/8GnqoNLRGgkGI68L+yXr8RsuV5K8av48O1ZDd1
   kw9sdkxODqXBHeeZvCk1naz0BLYoMSoSda/tAoxKJERMnc8f33aUxXiXb
   IPOEbebEstZjxtcizx9bFixGUx1dexLxqotzTUzyvma5kl+dozHugu1qc
   nvoxc4sOWKCgPJj4KUc57DpF0BBUX0vVYl0oTTKJwyeSQHGFqhnLruBcI
   w==;
X-CSE-ConnectionGUID: mqWhrgOOScWzKdJxORsg4A==
X-CSE-MsgGUID: nouizd9ZQ06Pmv6rlwvJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87909923"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="87909923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 21:56:08 -0700
X-CSE-ConnectionGUID: Nifm+uPpTsiMXLuFYnP70g==
X-CSE-MsgGUID: bCQ6sdxUQGmAESyjEyLm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="294124872"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2026 21:56:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1d11-00000000206-1jaj;
	Wed, 02 Sep 2026 04:56:03 +0000
Date: Wed, 02 Sep 2026 12:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [asahilinux:pr/583 625/972] error[E0277]: the trait bound
 `VMap<D, R, SIZE>: IoBackend` is not satisfied
Message-ID: <202609021249.C0H9atEC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux pr/583
head:   cddf57e96d46510a9378b0fda93f6db65e4976a8
commit: 7e2c3ece817a512b6b3facdc1f37969b14a88a49 [625/972] rust: drm/gem: remove DeviceContext from shmem::Object
config: arm64-randconfig-002-20260831 (https://download.01.org/0day-ci/archive/20260902/202609021249.C0H9atEC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 316b0edee400b3ef72ed0a082dae9bd337ac01a0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021249.C0H9atEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021249.C0H9atEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `VMap<D, R, SIZE>: IoBackend` is not satisfied
   --> rust/kernel/drm/gem/shmem.rs:522:58
   |
   522 |         impl<D, R, const SIZE: usize> IoCapable<$ty> for VMap<D, R, SIZE>
   |                                                          ^^^^^^^^^^^^^^^^ unsatisfied trait bound
   ...
   551 | impl_vmap_io_capable!(u16);
   | -------------------------- in this macro invocation
   |
   help: the trait `IoBackend` is not implemented for `VMap<D, R, SIZE>`
   --> rust/kernel/drm/gem/shmem.rs:431:1
   |
   431 | pub struct VMap<D, R, const SIZE: usize = 0>
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: the following other types implement trait `IoBackend`:
   CoherentIoBackend
   IoSysMapBackend
   MmioBackend
   RelaxedMmioBackend
   SysMemBackend
   note: required by a bound in `IoCapable`
   --> rust/kernel/io.rs:272:25
   |
   272 | pub trait IoCapable<T>: IoBackend {
   |                         ^^^^^^^^^ required by this bound in `IoCapable`
   = note: this error originates in the macro `impl_vmap_io_capable` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `VMap<D, R, SIZE>: IoBackend` is not satisfied
   --> rust/kernel/drm/gem/shmem.rs:522:58
   |
   522 |         impl<D, R, const SIZE: usize> IoCapable<$ty> for VMap<D, R, SIZE>
   |                                                          ^^^^^^^^^^^^^^^^ unsatisfied trait bound
   ...
   552 | impl_vmap_io_capable!(u32);
   | -------------------------- in this macro invocation
   |
   help: the trait `IoBackend` is not implemented for `VMap<D, R, SIZE>`
   --> rust/kernel/drm/gem/shmem.rs:431:1
   |
   431 | pub struct VMap<D, R, const SIZE: usize = 0>
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: the following other types implement trait `IoBackend`:
   CoherentIoBackend
   IoSysMapBackend
   MmioBackend
   RelaxedMmioBackend
   SysMemBackend
   note: required by a bound in `IoCapable`
   --> rust/kernel/io.rs:272:25
   |
   272 | pub trait IoCapable<T>: IoBackend {
   |                         ^^^^^^^^^ required by this bound in `IoCapable`
   = note: this error originates in the macro `impl_vmap_io_capable` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `VMap<D, R, SIZE>: IoBackend` is not satisfied
   --> rust/kernel/drm/gem/shmem.rs:522:58
   |
   522 |         impl<D, R, const SIZE: usize> IoCapable<$ty> for VMap<D, R, SIZE>
   |                                                          ^^^^^^^^^^^^^^^^ unsatisfied trait bound
   ...
   554 | impl_vmap_io_capable!(u64);
   | -------------------------- in this macro invocation
   |
   help: the trait `IoBackend` is not implemented for `VMap<D, R, SIZE>`
   --> rust/kernel/drm/gem/shmem.rs:431:1
   |
   431 | pub struct VMap<D, R, const SIZE: usize = 0>
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: the following other types implement trait `IoBackend`:
   CoherentIoBackend
   IoSysMapBackend
   MmioBackend
   RelaxedMmioBackend
   SysMemBackend
   note: required by a bound in `IoCapable`
   --> rust/kernel/io.rs:272:25
   |
   272 | pub trait IoCapable<T>: IoBackend {
   |                         ^^^^^^^^^ required by this bound in `IoCapable`
   = note: this error originates in the macro `impl_vmap_io_capable` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `VMap<D, R, SIZE>: IoBackend` is not satisfied
   --> rust/kernel/drm/gem/shmem.rs:522:58
   |
   522 |         impl<D, R, const SIZE: usize> IoCapable<$ty> for VMap<D, R, SIZE>
   |                                                          ^^^^^^^^^^^^^^^^ unsatisfied trait bound
   ...
   550 | impl_vmap_io_capable!(u8);
   | ------------------------- in this macro invocation
   |
   help: the trait `IoBackend` is not implemented for `VMap<D, R, SIZE>`
   --> rust/kernel/drm/gem/shmem.rs:431:1
   |
   431 | pub struct VMap<D, R, const SIZE: usize = 0>
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: the following other types implement trait `IoBackend`:
   CoherentIoBackend
   IoSysMapBackend
   MmioBackend
   RelaxedMmioBackend
   SysMemBackend
   note: required by a bound in `IoCapable`
   --> rust/kernel/io.rs:272:25
   |
   272 | pub trait IoCapable<T>: IoBackend {
   |                         ^^^^^^^^^ required by this bound in `IoCapable`
   = note: this error originates in the macro `impl_vmap_io_capable` (in Nightly builds, run with -Z macro-backtrace for more info)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
