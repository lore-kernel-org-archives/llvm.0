Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93F633375D;
	Mon,  5 Jan 2026 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630359; cv=none; b=hBVFSEjBKka+Vyf3wsFFT8hjPTXJiCSFDkbgGKEjHGuTiFYhxoS+xZfMZGAgPoYUosZChhZYgU4+Zl96jzxFtACemCI4GsILkTWFN0Eg+istKCv4kbiT0vyPdIzBHNTB4PfnZCDtRAJcyrPk1hU4Xng1ISy94rKkMDaBIBSXWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630359; c=relaxed/simple;
	bh=dRS57BsW3l8US9F6e1ht7sYwJUzm4odQr1wnw81tOPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qX8TGHa6GprJS624qvf6QRab/MTPoLJNKg2CtjTJBvmHq5/7g5I1NPdiHvW6u0nMhNi6dRxqjR9HESPdMIj++rvAlJ4BUQnotrlBID6qBgs69qjK7Kp1jHDCXSXh2P+cge1kS5CVuVGI8OCAbZtieg4ScWRTYXMuv6sU8+UpPvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cpj/l+Ux; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cpj/l+Ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767630358; x=1799166358;
  h=date:from:to:cc:subject:message-id;
  bh=dRS57BsW3l8US9F6e1ht7sYwJUzm4odQr1wnw81tOPY=;
  b=Cpj/l+UxU/MTsl6qMWgqwZKbTTKpFgd4MoAjQLz4KYdkO9IZdpTImGMO
   dZ8mgypSGfTDV1cFsNn/4edkE+99HzOTTJZCO9vT6V7LjtP+nrxp+h4uU
   rH6hMyqZdEwWGQ0aY0imqJ5l5tLf0kM6Nl0QHJBhidTh6UzNKbi9+acIl
   afkdijrmPyhrJYJ24e1KlhV9Mn8axtDHQNn/tOsgEpwNsxOt9wSSUZugp
   7R63x9Q+2GGp11186SKFe5at5BrAO68bobCv3z0H+qfNS3fNz7j8WydYV
   VHi86aWJ440hfRalwHX5w8kFS7xUEK58T5ABoCbu0qcGbTymHlRTpTFn5
   Q==;
X-CSE-ConnectionGUID: 01AV5dqXSOitxY7dS3ZHmw==
X-CSE-MsgGUID: VhY0NsilSbetD8aiLvM1sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69046621"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="69046621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:25:57 -0800
X-CSE-ConnectionGUID: xcpWLKBcQMC5x/CksR2cGw==
X-CSE-MsgGUID: +j3S1FY6RTqAvhzxjSxWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="225968197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2026 08:25:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcnOy-000000001LH-1VWB;
	Mon, 05 Jan 2026 16:25:52 +0000
Date: Tue, 06 Jan 2026 00:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boqun Feng <boqun.feng@gmail.com>
Subject: [boqun:rust-sync.20260105a 18/22] error[E0277]: the trait
 bound `i8: AtomicImpl` is not satisfied
Message-ID: <202601060041.k0JkAkUD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync.20260105a
head:   243aa6a057d46d3a4de9297422e480d469eddaf7
commit: 06ed7e7e7aa656f7054af7d3d3387a07244d85b1 [18/22] rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
config: um-randconfig-001-20260105 (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060041.k0JkAkUD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> error[E0277]: the trait bound `i8: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/internal.rs:265:7
   |
   265 |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
   |       ^^ the trait `AtomicImpl` is not implemented for `i8`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicBasicOps`
   --> rust/kernel/sync/atomic/internal.rs:190:26
   |
   190 |           $pub trait $ops: AtomicImpl {
   |                            ^^^^^^^^^^ required by this bound in `AtomicBasicOps`
   ...
   264 | / declare_and_impl_atomic_methods!(
   265 | |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
   266 | |     /// Basic atomic operations
   267 | |     pub trait AtomicBasicOps {
   | |               -------------- required by a bound in this trait
   ...   |
   280 | | );
   | |_- in this macro invocation
   = note: this error originates in the macro `declare_atomic_ops_trait` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `i16: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/internal.rs:265:24
   |
   265 |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
   |                        ^^^ the trait `AtomicImpl` is not implemented for `i16`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicBasicOps`
   --> rust/kernel/sync/atomic/internal.rs:190:26
   |
   190 |           $pub trait $ops: AtomicImpl {
   |                            ^^^^^^^^^^ required by this bound in `AtomicBasicOps`
   ...
   264 | / declare_and_impl_atomic_methods!(
   265 | |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
   266 | |     /// Basic atomic operations
   267 | |     pub trait AtomicBasicOps {
   | |               -------------- required by a bound in this trait
   ...   |
   280 | | );
   | |_- in this macro invocation
   = note: this error originates in the macro `declare_atomic_ops_trait` which comes from the expansion of the macro `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `i16: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/internal.rs:289:48
   |
   289 |         fn xchg[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self) -> Self {
   |                                                ^^^^^^^^^^^^^^^^ the trait `AtomicImpl` is not implemented for `i16`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicRepr`
   --> rust/kernel/sync/atomic/internal.rs:66:26
   |
   66  | pub struct AtomicRepr<T: AtomicImpl>(UnsafeCell<T>);
   |                          ^^^^^^^^^^ required by this bound in `AtomicRepr`
--
>> error[E0277]: the trait bound `i16: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/internal.rs:301:17
   |
   301 |             a: &AtomicRepr<Self>, old: &mut Self, new: Self
   |                 ^^^^^^^^^^^^^^^^ the trait `AtomicImpl` is not implemented for `i16`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicRepr`
   --> rust/kernel/sync/atomic/internal.rs:66:26
   |
   66  | pub struct AtomicRepr<T: AtomicImpl>(UnsafeCell<T>);
   |                          ^^^^^^^^^^ required by this bound in `AtomicRepr`
--
>> error[E0277]: the trait bound `i8: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/predefine.rs:11:17
   |
   11  |     type Repr = i8;
   |                 ^^ the trait `AtomicImpl` is not implemented for `i8`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicType::Repr`
   --> rust/kernel/sync/atomic.rs:113:16
   |
   113 |     type Repr: AtomicImpl;
   |                ^^^^^^^^^^ required by this bound in `AtomicType::Repr`
--
>> error[E0277]: the trait bound `i16: AtomicImpl` is not satisfied
   --> rust/kernel/sync/atomic/predefine.rs:17:17
   |
   17  |     type Repr = i16;
   |                 ^^^ the trait `AtomicImpl` is not implemented for `i16`
   |
   = help: the following other types implement trait `AtomicImpl`:
   i32
   i64
   note: required by a bound in `AtomicType::Repr`
   --> rust/kernel/sync/atomic.rs:113:16
   |
   113 |     type Repr: AtomicImpl;
   |                ^^^^^^^^^^ required by this bound in `AtomicType::Repr`
--
>> error[E0599]: the method `as_ptr` exists for reference `&AtomicRepr<i8>`, but its trait bounds were not satisfied
   --> rust/kernel/sync/atomic/internal.rs:271:40
   |
   271 |             unsafe { bindings::#call(a.as_ptr().cast()) }
   |                                        ^^^^^^ method cannot be called on `&AtomicRepr<i8>` due to unsatisfied trait bounds
   |
   note: trait bound `i8: AtomicImpl` was not satisfied
   --> rust/kernel/sync/atomic/internal.rs:68:9
   |
   68  | impl<T: AtomicImpl> AtomicRepr<T> {
   |         ^^^^^^^^^^  -------------
   |         |
   |         unsatisfied trait bound introduced here
   = help: items from traits can only be used if the trait is implemented and in scope
   note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to implement it
   --> rust/kernel/device_id.rs:165:1
   |
   165 | pub trait IdTable<T: RawDeviceId, U> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0599]: the method `as_ptr` exists for reference `&AtomicRepr<i8>`, but its trait bounds were not satisfied
   --> rust/kernel/sync/atomic/internal.rs:277:40
   |
   277 |             unsafe { bindings::#call(a.as_ptr().cast(), v) }
   |                                        ^^^^^^ method cannot be called on `&AtomicRepr<i8>` due to unsatisfied trait bounds
   |
   note: trait bound `i8: AtomicImpl` was not satisfied
   --> rust/kernel/sync/atomic/internal.rs:68:9
   |
   68  | impl<T: AtomicImpl> AtomicRepr<T> {
   |         ^^^^^^^^^^  -------------
   |         |
   |         unsatisfied trait bound introduced here
   = help: items from traits can only be used if the trait is implemented and in scope
   note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to implement it
   --> rust/kernel/device_id.rs:165:1
   |
   165 | pub trait IdTable<T: RawDeviceId, U> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0599]: the method `as_ptr` exists for reference `&AtomicRepr<i16>`, but its trait bounds were not satisfied
   --> rust/kernel/sync/atomic/internal.rs:271:40
   |
   271 |             unsafe { bindings::#call(a.as_ptr().cast()) }
   |                                        ^^^^^^ method cannot be called on `&AtomicRepr<i16>` due to unsatisfied trait bounds
   |
   note: trait bound `i16: AtomicImpl` was not satisfied
   --> rust/kernel/sync/atomic/internal.rs:68:9
   |
   68  | impl<T: AtomicImpl> AtomicRepr<T> {
   |         ^^^^^^^^^^  -------------
   |         |
   |         unsatisfied trait bound introduced here
   = help: items from traits can only be used if the trait is implemented and in scope
   note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to implement it
   --> rust/kernel/device_id.rs:165:1
   |
   165 | pub trait IdTable<T: RawDeviceId, U> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0599]: the method `as_ptr` exists for reference `&AtomicRepr<i16>`, but its trait bounds were not satisfied
   --> rust/kernel/sync/atomic/internal.rs:277:40
   |
   277 |             unsafe { bindings::#call(a.as_ptr().cast(), v) }
   |                                        ^^^^^^ method cannot be called on `&AtomicRepr<i16>` due to unsatisfied trait bounds
   |
   note: trait bound `i16: AtomicImpl` was not satisfied
   --> rust/kernel/sync/atomic/internal.rs:68:9
   |
   68  | impl<T: AtomicImpl> AtomicRepr<T> {
   |         ^^^^^^^^^^  -------------
   |         |
   |         unsatisfied trait bound introduced here
   = help: items from traits can only be used if the trait is implemented and in scope
   note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to implement it
   --> rust/kernel/device_id.rs:165:1
   |
   165 | pub trait IdTable<T: RawDeviceId, U> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0599]: the method `as_ptr` exists for reference `&AtomicRepr<i8>`, but its trait bounds were not satisfied
   --> rust/kernel/sync/atomic/internal.rs:291:40
   |
   291 |             unsafe { bindings::#call(a.as_ptr().cast(), v) }
   |                                        ^^^^^^ method cannot be called on `&AtomicRepr<i8>` due to unsatisfied trait bounds
   |
   note: trait bound `i8: AtomicImpl` was not satisfied
   --> rust/kernel/sync/atomic/internal.rs:68:9
   |
   68  | impl<T: AtomicImpl> AtomicRepr<T> {
   |         ^^^^^^^^^^  -------------
   |         |
   |         unsatisfied trait bound introduced here
   = help: items from traits can only be used if the trait is implemented and in scope
   note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to implement it
   --> rust/kernel/device_id.rs:165:1
   |
   165 | pub trait IdTable<T: RawDeviceId, U> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
