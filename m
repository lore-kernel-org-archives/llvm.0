Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4E195;
	Sun, 20 Jul 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753036397; cv=none; b=FJbC5f5N4M7LYWQcrOPJLGHqb6YefZfEPcsPZtV9jMFC1apeAOH66q4W6PxhioiGZCHm3+s/UFbBUY++TdxNbOabg1VwY9eCbFsDO3hmaZDYfnXYkuEeQXOwSYg4V1IOe49lSJprlF3SVNiusBaY3gv0d++6B+YRMIUnyDxP/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753036397; c=relaxed/simple;
	bh=vP7fWNMEEnUV8T2n22ES61zicSyrGThE2plw6DdKsd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4p4T5V2rQAtTQZEvm3H+xsj5iiSkznqVTK345zPVqME4+Kv2+mDevlN/aDj6Z/YgZDQA5uFXhiF1yhRF1ES4IZM/leRFyif/xJqKoJLvbY9sSRgafTx8L+jZksTWh5r9vAGy+SFTGpf1q20Wv/O86U5BaELJfwgM5drnqE/pBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFCRBSUx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFCRBSUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753036396; x=1784572396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vP7fWNMEEnUV8T2n22ES61zicSyrGThE2plw6DdKsd0=;
  b=JFCRBSUxh5E2+Wsy8xEgNlFArBknASDbAG+YPjIMgsdhxzqE3cQQ3vYZ
   JCAXLKc8Wag0VqgPzt11gZEj/q0YSy2rplb0CruPoW/LCu6bL/MFg5MDg
   Rqu95z/HtHDZz9eOcLDdCJPqxLJLW7F5x4NQTNqLzVw31/US6Y5JfOAtJ
   0jKMK4eQg5vFr6ObnSzbmVPyphcVN4dLU/C+SkGYhSccOOGNsR/1Qgn6T
   dotijpTB3+kwNI3+QH1W4UcPiNh94DxfccwDsPw7eEahle8IjAUBgKii7
   FzHt5E/dir0hY9XAgb1TYZSUBo6uf61xAbCbKmYI7PkSCBq1yjsVTL088
   A==;
X-CSE-ConnectionGUID: i2Kyd8T2TYKP9/Fq7Cd96w==
X-CSE-MsgGUID: ubt0bkwRTSm0LG+7pWExxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="54970647"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="54970647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 11:33:15 -0700
X-CSE-ConnectionGUID: 3mmC5ie3SIeTQbZ3TNBYcQ==
X-CSE-MsgGUID: TUSSJSo+Rp+AZRR1YlVq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="158983932"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2025 11:33:13 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udYqV-0001Ht-0l;
	Sun, 20 Jul 2025 18:33:11 +0000
Date: Sun, 20 Jul 2025 20:32:49 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-impl 11/11] warning: type `AtomicRepr<*mut
 c_void>` is more private than the item `<*mut c_void as
 AtomicBasicOps>::atomic_read_acquire`
Message-ID: <202507202029.J3vB76rD-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250720/202507202029.J3vB76rD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507202029.J3vB76rD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507202029.J3vB76rD-lkp@intel.com/

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
