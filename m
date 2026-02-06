Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2FB242D89;
	Fri,  6 Feb 2026 23:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770418888; cv=none; b=SKpw/YsjQ/IIcP+FfKCshTcBUJwctQEcsrjKYoBkoURihY9raFPoE2x9ZDsnPqFf78ziE5linZFauRSYdkAmsmTot38O8jx6yDeqaVSMffD7rMUAP6pRq7XKn5PSlHx1s/RC6WEvnpIV5dMqrN+ESyLykQdo/rPpvN3pN+0514Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770418888; c=relaxed/simple;
	bh=ZqN9Ctx2YZYm6+Tm087TpRnIQRGtcP5lICJTnSc91SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLVvxT2cjbDYuXFfzNbeKzYTyCzGOEnmXcISx20UPHR8V1fUBjub5Tz+RBr2/SjpiejDoASZ+eZa9kQPe4n9x6U/GrXDUuqNAy5u34zSSB73n6toMLtOhC25MkG7Xp0DsQrFzWE7tDNyjtqJoKidbCNyq9Bht9XgQdSkhgkr7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCJysa3A; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCJysa3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770418888; x=1801954888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqN9Ctx2YZYm6+Tm087TpRnIQRGtcP5lICJTnSc91SY=;
  b=eCJysa3ALOIDGj7PJ1l2OmuDC7/eKFq/rEbQubZq0HNtwVqyHar+tae3
   mMm4+epZDLh7yElhBbnEmC/BYwy1ameJJUK9NyVCMRQ0DvJ/hbS/FduZ5
   RcHwLECqlEGpec7SeqCoKmv1h2FITLNXi4D874Bec3iOwn895+efpoZfi
   wgYDL2r4hHwkeDVn15cwPAwq9h1V2JboDOBL5n3Rv49gOdDnWw4qxh45C
   Wca+FxKbsc6FUayq3dl2t6PWBcpoVUaLa48v4FQEgnxCuYIp8NSdR+eKL
   eTEpMnHPXSBf107x9q84PnzOd5zQ3sjIzetjwyRPyKghSdhi1Xe2IF8yZ
   w==;
X-CSE-ConnectionGUID: AWLducP4SbONnLTKDO6C7Q==
X-CSE-MsgGUID: xFtnA+4DTGqFR/7oUVdk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89208605"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="89208605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 15:01:28 -0800
X-CSE-ConnectionGUID: oBpqT+SxQ0qQkm5TLzcCbQ==
X-CSE-MsgGUID: 0/RKPLOSRwmfFjypKpPhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210762833"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2026 15:01:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voUpC-00000000lF2-2S86;
	Fri, 06 Feb 2026 23:01:18 +0000
Date: Sat, 7 Feb 2026 07:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
Message-ID: <202602070633.mI75LmYQ-lkp@intel.com>
References: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/rust-types-Add-Ownable-Owned-types/20260204-200041
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260204-unique-ref-v14-2-17cb29ebacbb%40kernel.org
patch subject: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260207/202602070633.mI75LmYQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070633.mI75LmYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070633.mI75LmYQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0407]: method `inc_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:378:5
   |
   378 | /     fn inc_ref(&self) {
   ...   |
   383 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0407]: method `dec_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:385:5
   |
   385 | /     unsafe fn dec_ref(obj: NonNull<Self>) {
   386 | |         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
   387 | |         unsafe { bindings::usb_put_intf(obj.cast().as_ptr()) }
   388 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `Interface: RefCounted` is not satisfied
   --> rust/kernel/device.rs:700:17
   |
   700 |                 (&**dev).into()
   |                 ^^^^^^^^^^^^^^^ the trait `RefCounted` is not implemented for `Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `usb::Device: RefCounted` is not satisfied
   --> rust/kernel/device.rs:700:17
   |
   700 |                 (&**dev).into()
   |                 ^^^^^^^^^^^^^^^ the trait `RefCounted` is not implemented for `usb::Device`
   |
   ::: rust/kernel/usb.rs:425:1
   |
   425 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0407]: method `inc_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:429:5
   |
   429 | /     fn inc_ref(&self) {
   ...   |
   434 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0407]: method `dec_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:436:5
   |
   436 | /     unsafe fn dec_ref(obj: NonNull<Self>) {
   437 | |         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
   438 | |         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
   439 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `Interface: RefCounted` is not satisfied
   --> rust/kernel/device.rs:698:56
   |
   698 |         impl ::core::convert::From<&$device<$src>> for $crate::sync::aref::ARef<$device> {
   |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `RefCounted` is not implemented for `Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `Interface: RefCounted` is not satisfied
   --> rust/kernel/usb.rs:377:34
   |
   377 | unsafe impl AlwaysRefCounted for Interface {
   |                                  ^^^^^^^^^ the trait `RefCounted` is not implemented for `Interface`
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `AlwaysRefCounted`
   --> rust/kernel/sync/aref.rs:74:36
   |
   74  | pub unsafe trait AlwaysRefCounted: RefCounted {}
   |                                    ^^^^^^^^^^ required by this bound in `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `usb::Device: RefCounted` is not satisfied
   --> rust/kernel/device.rs:698:56
   |
   698 |         impl ::core::convert::From<&$device<$src>> for $crate::sync::aref::ARef<$device> {
   |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `RefCounted` is not implemented for `usb::Device`
   |
   ::: rust/kernel/usb.rs:425:1
   |
   425 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `usb::Device: RefCounted` is not satisfied
   --> rust/kernel/usb.rs:428:34
   |
   428 | unsafe impl AlwaysRefCounted for Device {
   |                                  ^^^^^^ the trait `RefCounted` is not implemented for `usb::Device`
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `AlwaysRefCounted`
   --> rust/kernel/sync/aref.rs:74:36
   |
   74  | pub unsafe trait AlwaysRefCounted: RefCounted {}
   |                                    ^^^^^^^^^^ required by this bound in `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `Interface: RefCounted` is not satisfied
   --> rust/kernel/device.rs:699:45
   |
   699 |             fn from(dev: &$device<$src>) -> Self {
   |                                             ^^^^ the trait `RefCounted` is not implemented for `Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `RefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 8 others
   note: required by a bound in `ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
