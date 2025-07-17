Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E328A1F5;
	Thu, 17 Jul 2025 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737449; cv=none; b=gKuhTcEC+fYMPyXXOQb45A7h5g/21ZwTORaXEzyacAZEsqs9RF3YubvVf3wfWcZJ3vphSocE1B5+RpD2vlauDRPnDv9XDNveTyVdRGuH10Q/AM+A/7x7RbBAso1r6SIN83EUcqWyPpTKGHO9IEBmjXm+3W3iYYlc0cnjNYUULoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737449; c=relaxed/simple;
	bh=EYjDKAfca6QL7zFj1vQ00B59iloVTexHpQCcpEuNUys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Szz0a0RWsePaVleLbwk3aQA0iWXV4Rkqm0OQ/HuaWUUTq5cOGH47Hfd9GIDFTMsBgnKB/GfSnNl4ztAiRwLIcaC+YUueeUNzEM3AnpbK4KXPuNvFhmV0Ea+72mBFfx45K5w0Q4r8zLpHBmSaSA989/zfg/687fSNMDpx/HniIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muxj5GKA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muxj5GKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752737447; x=1784273447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYjDKAfca6QL7zFj1vQ00B59iloVTexHpQCcpEuNUys=;
  b=muxj5GKATOyOAb4h3L0xaayg5ykntaHzUxYl3UNkFxmfYfBUscDo5CIZ
   /XTVHsl+/8idB4SDarwXgoJgon7JZYpS8EBh/uvEyp3ePs0FgkXCKYoMX
   H7i7CpkzYTTs13ADMsomSFa4F1vx4b2+RwIclOJ/5RmGUnUbV6pcReO2A
   GOAEOKL709qu0Kcib0VZdLc6SaTxIKMMXgyzcNQC0xgF3CKDuVKg8Jlg/
   /2Sjypdi5w/FL09NKOdRjuWN38t4b3xrw8wq9abCok78/0AC/v16+sIh+
   v6XRwpyaiWxwoby42bO9JC50lIK3pML2N/MPSH03OvdznecLX3oLST5gz
   Q==;
X-CSE-ConnectionGUID: XDhFtD6hQiGQLlCp5TYl5A==
X-CSE-MsgGUID: 3Osm2F6OSkScQec8UoddCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55150076"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="55150076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:30:47 -0700
X-CSE-ConnectionGUID: v9JiT+vUQk66nfyUvkJ/wQ==
X-CSE-MsgGUID: RvBGLREFTj2gN7EHk6hopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="158422340"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 00:30:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucJ4k-000DIl-2c;
	Thu, 17 Jul 2025 07:30:42 +0000
Date: Thu, 17 Jul 2025 15:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-impl 11/11] warning: type `AtomicRepr<*mut
 c_void>` is more private than the item `<*mut c_void as
 AtomicBasicOps>::atomic_read_acquire`
Message-ID: <202507171542.e9nQnSUg-lkp@intel.com>
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
commit: 9908e69eba39eeef235e409a753621914c6e8926 [11/11] WIP: rust: sync: atomic: Wire up atomic_ptr_ helpers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250717/202507171542.e9nQnSUg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171542.e9nQnSUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171542.e9nQnSUg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicBasicOps>::atomic_read_acquire`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicBasicOps>::atomic_read_acquire` is reachable at visibility `pub`
   ...
   215 | / declare_and_impl_atomic_methods!(
   216 | |     /// Basic atomic operations
   217 | |     pub trait AtomicBasicOps
   218 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   232 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicBasicOps>::atomic_read`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicBasicOps>::atomic_read` is reachable at visibility `pub`
   ...
   215 | / declare_and_impl_atomic_methods!(
   216 | |     /// Basic atomic operations
   217 | |     pub trait AtomicBasicOps
   218 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   232 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicBasicOps>::atomic_set_release`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `<*mut c_void as AtomicBasicOps>::atomic_set_release` is reachable at visibility `pub`
   ...
   215 | / declare_and_impl_atomic_methods!(
   216 | |     /// Basic atomic operations
   217 | |     pub trait AtomicBasicOps
   218 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   232 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicBasicOps>::atomic_set`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ associated function `<*mut c_void as AtomicBasicOps>::atomic_set` is reachable at visibility `pub`
   ...
   215 | / declare_and_impl_atomic_methods!(
   216 | |     /// Basic atomic operations
   217 | |     pub trait AtomicBasicOps
   218 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   232 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_xchg_acquire`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_xchg_acquire` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_xchg_release`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_xchg_release` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_xchg_relaxed`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_xchg_relaxed` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_xchg`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_xchg` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_acquire`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_acquire` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_release`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_release` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: type `AtomicRepr<*mut c_void>` is more private than the item `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_relaxed`
   --> rust/kernel/sync/atomic/ops.rs:110:13
   |
   110 |               fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
   |               ^^ associated function `<*mut c_void as AtomicExchangeOps>::atomic_try_cmpxchg_relaxed` is reachable at visibility `pub`
   ...
   234 | / declare_and_impl_atomic_methods!(
   235 | |     /// Exchange and compare-and-exchange atomic operations
   236 | |     pub trait AtomicExchangeOps
   237 | |     [i32 => atomic, i64 => atomic64, *mut crate::ffi::c_void => atomic_ptr]
   ...   |
   261 | | );
   | |_- in this macro invocation
   |
   note: but type `AtomicRepr<*mut c_void>` is only usable at visibility `pub(in crate::sync::atomic)`
   --> rust/kernel/sync/atomic/ops.rs:50:1
   |
   50  | pub(super) struct AtomicRepr<T: AtomicImpl>(core::cell::UnsafeCell<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: this warning originates in the macro `impl_atomic_method` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
