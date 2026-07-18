Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D9543F0A1;
	Sat, 18 Jul 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784392715; cv=none; b=rqqWZ3Ol9qr7yIiYPVv8UOlDixZ5KyugrHFdPk8eh6gGnJXARaRAqm/RbFnFd2m+Y0mXgCuFXe1VEkbe+mf7p2GMnwM+GgKwOghGlwzHi8inHKXONwiAqWmgKyqv6EQYmQgsYwi1KqATjpn71x4AD5WwTIfpRHoPvOxK50r2tKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784392715; c=relaxed/simple;
	bh=17IqanNKtc9XHh3c+DyHjKfx6Kum0T/weghGQ2cuU34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uPF51bYN5MzSIrE141TFPfIHmluEqiYQds8a6Vt1+qnXzJqSsWcXeW/gmThTLwo7Mba8I4ORBATHrZZWkoA2h845d3V6JipG1sFxgRKuNuLiOxXz1HQiQibK+EDlDzOUyHJ4kbgw4VoNS7hxtzTfus/iXRNfZyUgHCEja0ToB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PW1gnbel; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PW1gnbel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784392712; x=1815928712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17IqanNKtc9XHh3c+DyHjKfx6Kum0T/weghGQ2cuU34=;
  b=PW1gnbelkDd4VVYHGyPrSrRAICTYjnunzoKXC6qHLhH5sd8w58fGrSCX
   2KfP4mlYRNIhHaU8XZyVIHsmTzhNnb4i8cM/h1WLCiVM98r5dnLay5hTE
   m1t7hlCG+V5wQXDhHBx7MnoK2mZ+xkSWfDn2V6980E0jMwiZHA56CuDFj
   MVIqTuEkauEFhX9H8Kj64+NLxhJMJWJTOJE2j4pVN16GAvzY3MZHYV2i8
   q/q1MrCjjl+2NFOPeX0I2orCv0e80xFdo5q0WneBtXW9pE+0myNW0TcCc
   QGAzEauJxDU/Q8+0Sb8UbEK/b7H703l9HsZZaX3FXz+pr9+JNPVfJd1Ej
   g==;
X-CSE-ConnectionGUID: evJg7XzCQQGcxYyULteW+w==
X-CSE-MsgGUID: ZMUKdWo9QhOl5NB2fvYm0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84159440"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84159440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 09:38:30 -0700
X-CSE-ConnectionGUID: ttrb8ETlS7a2uMlbBjPPUw==
X-CSE-MsgGUID: eOZUhEUtR4OmFxuLfMDz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="262021122"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2026 09:38:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl83V-00000000Uv2-3r0H;
	Sat, 18 Jul 2026 16:38:25 +0000
Date: Sun, 19 Jul 2026 00:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Onur =?utf-8?Q?=C3=96zkan"?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>
Subject: [paulmckrcu:dev.2026.07.13b 75/86] warning: constant
 `WARN_ON_FLAGS` is never used
Message-ID: <202607190048.vAGhOcAV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/paulmckrcu/linux dev.2026.07.13b
head:   04b88652be5bc3b092a63198d1b2bebaf46b9e72
commit: f41634950050921c691e1fabdafc0304c2aedfdf [75/86] rust: sync: add SRCU abstraction
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190048.vAGhOcAV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: constant `WARN_ON_FLAGS` is never used
   --> rust/kernel/bug.rs:126:19
   |
   126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
   |                     ^^^^^^^^^^^^^
   |
   ::: rust/kernel/sync/srcu.rs:106:12
   |
   106 |           if crate::warn_on!(
   |  ____________-
   107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
   108 | |             // and `srcu_readers_active()` only checks the active reader count.
   109 | |             unsafe { bindings::srcu_readers_active(ptr) }
   110 | |         ) {
   | |_________- in this macro invocation
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
   = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
