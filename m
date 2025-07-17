Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3F3A932;
	Thu, 17 Jul 2025 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752714547; cv=none; b=IkbdMQXFhO2qJ35A0mi6drhACWZv+EpNFiUwCAYuZZRehsMWOxrOyGAU5mhBDOX8+S0zkzWRyV4qEhK8Mkru71J58UpXYkmOAfgoQzTmDvNg9CJXn67E6Ds6vw8B+HaMmtLZhq00CEV0o+IaBmJrx49FdiaBGmkkJ4jPgUxyZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752714547; c=relaxed/simple;
	bh=gLt3lXZiolTmgebgTGyabMl/xAq79EqatzhdJJtzxys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPMCIgM1lavtlHyNW8HZE8TQ35bqyydEm945GOY2w5VhlXr14/MOosHaCKakJBjDddfkPnuy1NHhNNsajS/tKIfUOSFBIWWN4/MYjKmf7bbOlX2Uqfbro5rfBlWgmWQHIEdnxvblvOayspndBMBB0FsYfy96ycKghn+0kSifhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUCGLPzN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUCGLPzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752714545; x=1784250545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLt3lXZiolTmgebgTGyabMl/xAq79EqatzhdJJtzxys=;
  b=GUCGLPzNBKf0PMBm4taNgMQsAw5tWAgXtvX5kb0eiB9ztHmTT3U34mJW
   U2XU37C9SFKb87+mYkfr6X56M5tUxRK4NLjT7prgBHuoPFaj0L5gmrVUi
   EkqtngDq/rFEt41USRhhmtim4o/A6kQ+jNr/Er1WjpqvYZEymtdm21mxp
   6d3SV3tCW6PjbmaZyJwz1gRYtoBOMKX6kG62DTAu8esUMX3DeX7zbZcda
   tdFEaiQY9QWCz89RStWmJgj88mugpMCTZdtZkbygmsIPhFs7MI95XMW0a
   Dg2qSXrrOKfluUPXZ2yO19YCz6e/yiZyJo58Xri8FJSXsGbUoXQc7DVNy
   g==;
X-CSE-ConnectionGUID: mJDfwkVXR/m4SAsGOIhkLQ==
X-CSE-MsgGUID: F/cYlIwMSFqoJkJXxMmapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54948706"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="54948706"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 18:09:05 -0700
X-CSE-ConnectionGUID: 9p4KaiQSTaK/i3C54dPyFg==
X-CSE-MsgGUID: zMN1lcl+RsCL33TnW+y1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="157052507"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2025 18:09:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucD7M-000D15-0q;
	Thu, 17 Jul 2025 01:09:00 +0000
Date: Thu, 17 Jul 2025 09:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>
Subject: [boqun:rust-atomic-impl 2/11] warning: type `AtomicRepr<Self>` is
 more private than the item `AtomicArithmeticOps::atomic_add`
Message-ID: <202507170826.TEFtVuee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-impl
head:   9908e69eba39eeef235e409a753621914c6e8926
commit: 43940d5844482f5eb43e365e11575cec3a5bc91d [2/11] rust: sync: Add basic atomic operation mapping framework
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250717/202507170826.TEFtVuee-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507170826.TEFtVuee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507170826.TEFtVuee-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicBasicOps::atomic_read_acquire`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicBasicOps::atomic_read_acquire` is reachable at visibility `pub`
   ...
   185 | / declare_and_impl_atomic_methods!(
   186 | |     /// Basic atomic operations
   187 | |     pub trait AtomicBasicOps {
   188 | |         /// Atomic read (load).
   ...   |
   200 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: `#[warn(private_interfaces)]` on by default
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicBasicOps::atomic_read`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicBasicOps::atomic_read` is reachable at visibility `pub`
   ...
   185 | / declare_and_impl_atomic_methods!(
   186 | |     /// Basic atomic operations
   187 | |     pub trait AtomicBasicOps {
   188 | |         /// Atomic read (load).
   ...   |
   200 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<i64>` is more private than the item `<i64 as AtomicBasicOps>::atomic_set_release`
   --> rust/kernel/sync/atomic/ops.rs:105:13
   |
   105 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `<i64 as AtomicBasicOps>::atomic_set_release` is reachable at visibility `pub`
   ...
   185 | / declare_and_impl_atomic_methods!(
   186 | |     /// Basic atomic operations
   187 | |     pub trait AtomicBasicOps {
   188 | |         /// Atomic read (load).
   ...   |
   200 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<i64>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<i64>` is more private than the item `<i64 as AtomicBasicOps>::atomic_set`
   --> rust/kernel/sync/atomic/ops.rs:105:13
   |
   105 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `<i64 as AtomicBasicOps>::atomic_set` is reachable at visibility `pub`
   ...
   185 | / declare_and_impl_atomic_methods!(
   186 | |     /// Basic atomic operations
   187 | |     pub trait AtomicBasicOps {
   188 | |         /// Atomic read (load).
   ...   |
   200 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<i64>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_xchg_acquire`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_xchg_acquire` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_xchg_release`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_xchg_release` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_xchg_relaxed`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_xchg_relaxed` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_xchg`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_xchg` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_try_cmpxchg_acquire`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_try_cmpxchg_acquire` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_try_cmpxchg_release`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_try_cmpxchg_release` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<Self>` is more private than the item `AtomicExchangeOps::atomic_try_cmpxchg_relaxed`
   --> rust/kernel/sync/atomic/ops.rs:65:13
   |
   65  |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `AtomicExchangeOps::atomic_try_cmpxchg_relaxed` is reachable at visibility `pub`
   ...
   202 | / declare_and_impl_atomic_methods!(
   203 | |     /// Exchange and compare-and-exchange atomic operations
   204 | |     pub trait AtomicExchangeOps {
   205 | |         /// Atomic exchange.
   ...   |
   227 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<Self>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:45:1
   |
   45  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `declare_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
