Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752833EC;
	Sun, 20 Jul 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027990; cv=none; b=pLSHJxZKWTtU2NSH5nZ6JctkJTqCMYdpE3y/YjsunLuQG/4v+w4lfKzNl8T1qhHPz5/i1oMVCpeWvKULmVpkdvtMw284M7alFk3IDVGgJsT0a8bVKDEEKyPl4ipWdZNC3Tii7Oz2PU2NjQYahWcQgS9tAnbk939bFg6iyYbb9gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027990; c=relaxed/simple;
	bh=JH/AMqrHyditijGTYs/DWhZEpQ0vF+zTETdc7YNuxlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q57dOKDoS8EtwG8oC3GynYJWtbKZtTKe/SOmXA1eS3lZIyRi1zhIbM2d0fCT+ehI+6LFP9OWU5LER1LYwEgZNeu/6H9XtMgi/nshzzumvKE/4GIMlBv941pcgadVNaSHi1bdrzoORhr4iWYtFbi7bZ+7VeDGZpO6+818k8fQNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqgGB7/R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqgGB7/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753027988; x=1784563988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JH/AMqrHyditijGTYs/DWhZEpQ0vF+zTETdc7YNuxlo=;
  b=NqgGB7/R/M+a1rP6PWtrwqDF9WvLi49UJhiN4DtdBQKtfXP5bxleEQZo
   rPUdln6DLviwAqdVwjq6IiYAXX7sUjP699NxdQNF28fscOSjxX/K5wNSW
   gwDJdOwHZrX1n7DhPz1EyiAncS9ngnGiekM7S6FsI8FHkbXw59tDBdI/d
   Gylz6K2zu/veRGvmDvv2zhijm3gP1BuxROuN5L0JvrAkO+q9bu4jdE15Q
   58UpnEu3LV+gCtj4GD36ww9QFAWLbm1QHim6gBl7eSLqKriNm+F2CORzy
   G8UdmrWh3Y+eNjrPheTSvCT8l374vwYOCd2E1gJdEosQ39JurO7wpBHyy
   Q==;
X-CSE-ConnectionGUID: +PlVihg5S/WBvWj7/I/f/Q==
X-CSE-MsgGUID: iQr2JHVKQme8Zp+Wl6zEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="80696592"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="80696592"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 09:13:07 -0700
X-CSE-ConnectionGUID: zFqQ87b0TvKQF5ZgRQAzdQ==
X-CSE-MsgGUID: mSaj9pD1SX68v6Cx/8Zc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="158747575"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 20 Jul 2025 09:13:06 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udWet-0001HJ-1i;
	Sun, 20 Jul 2025 16:13:03 +0000
Date: Sun, 20 Jul 2025 18:12:27 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>
Subject: [boqun:rust-atomic-impl 2/11] warning: type `AtomicRepr<Self>` is
 more private than the item `AtomicArithmeticOps::atomic_add`
Message-ID: <202507201810.IcWDSM7C-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250720/202507201810.IcWDSM7C-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201810.IcWDSM7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201810.IcWDSM7C-lkp@intel.com/

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
