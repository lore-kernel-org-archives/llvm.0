Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856AB429CD2;
	Thu, 15 Oct 2026 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048871; cv=none; b=g6wC1Cjeix1esS2Bz3ff7O5yT+AG4+cdd+Iv6WF/T+nBaX5ja/msBQIn6tLARbZUjIoCbM4Gybx8X4szSMVIxi3az560xKULL4Jy9b2S+QayFobMv0WGNcMBzjssPmQfrV04OhVnsXpIlaZ3fAmH9Ivs4/io20f4zTC/hMDnnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048871; c=relaxed/simple;
	bh=34AUxHflVdWP1lXoa19NXhU9quDMKW/30UVYWtkeUMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiX2uFwltyf+oK/guW11wdVR/h55PKwlSXfO6Qj+f81l3qCbKkYOKJpG9/fhdUxfANqoc6oTuTIn8co6IWaZQEU2LUovLn89oB7mWiPEY5PBBDxDBgtzbKXU+w2sTOtVdUubiEkQ5AJn30WOzjiu+FLtWIV+RN6PnSORcsP3eWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diLCjEBE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diLCjEBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792048865; x=1823584865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=34AUxHflVdWP1lXoa19NXhU9quDMKW/30UVYWtkeUMA=;
  b=diLCjEBEzPRFDoqgPS8JF3cIF+sOojTWS06oQDEpqdwPUQzGQ1yr56qE
   KPRMM2ToLmR/IwltBC1l++jfQ1ZsR3ITE5oyUKUg0pSLpVZCV8sNwY/UQ
   FXabCCS5yQh+RJSNSuDsDeaj0bR9SYwPJ5+24Kn081M3iKL7fkOkm1ek8
   idxBPdiYxtqgeHfmpa+Ub/jMx+z9Ogbjq4kJhkvRQSVIFej4L5J9CSqSr
   hwyJBQM+Bc1jq4pgHpG3GW+GmnwBGUGRXoVNh5Mpzj6vds51CQHXHGVMJ
   VG4SqnO8p6HptPslzyhIAYqimt2sc/MZpV9SkIBMzU98SMVoiDtEyO/tu
   g==;
X-CSE-ConnectionGUID: iGD8d0YAQP26b2dRTiCRGQ==
X-CSE-MsgGUID: 8IDhwdsdSCasuiWIThYt2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="841253"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="841253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 00:21:04 -0700
X-CSE-ConnectionGUID: ed9z+jl1QyiXsjzevWMzlQ==
X-CSE-MsgGUID: iVgemiycSY21wKI4H6QM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1708841"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2026 00:21:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHFlr-00000000G0g-48fl;
	Thu, 15 Oct 2026 07:20:59 +0000
Date: Thu, 15 Oct 2026 15:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 6/6] rust: drm: Add JobQueue
Message-ID: <202610151526.B43xvcc0-lkp@intel.com>
References: <20261009191124.1022902-8-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009191124.1022902-8-phasta@kernel.org>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261008]
[cannot apply to rust/rust-next drm/drm-next v7.3-rc6 v7.3-rc5 v7.3-rc4 linus/master v7.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/rust-DmaFence-remove-static-lifetime/20261009-211119
base:   next-20261008
patch link:    https://lore.kernel.org/r/20261009191124.1022902-8-phasta%40kernel.org
patch subject: [RFC PATCH v5 6/6] rust: drm: Add JobQueue
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261015/202610151526.B43xvcc0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151526.B43xvcc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151526.B43xvcc0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved imports `kernel::workqueue::new_scoped_work`, `kernel::workqueue::ScopedWork`, `kernel::workqueue::ScopedWorkItem`, `kernel::workqueue::ScopedWorkRef`
   --> rust/kernel/drm/job_queue.rs:60:9
   |
   60 |         new_scoped_work,
   |         ^^^^^^^^^^^^^^^ no `new_scoped_work` in `workqueue`
   61 | //        ScopedQueue,
   62 |         ScopedWork,
   |         ^^^^^^^^^^ no `ScopedWork` in `workqueue`
   63 |         ScopedWorkItem,
   |         ^^^^^^^^^^^^^^ no `ScopedWorkItem` in `workqueue`
   64 |         ScopedWorkRef,
   |         ^^^^^^^^^^^^^ no `ScopedWorkRef` in `workqueue`
   |
   help: a similar name exists in the module
   |
   60 -         new_scoped_work,
   60 +         new_delayed_work,
   |
--
>> error[E0425]: cannot find function `system_dfl` in module `workqueue`
   --> rust/kernel/drm/job_queue.rs:257:29
   |
   257 |         unsafe { workqueue::system_dfl().enqueue_scoped(&*self.submit_worker) };
   |                             ^^^^^^^^^^
   |
   ::: rust/kernel/workqueue.rs:1102:1
   |
   1102 | pub fn system_bh() -> &'static Queue {
   | ------------------------------------ similarly named function `system_bh` defined here
   |
   help: a function with a similar name exists
   |
   257 -         unsafe { workqueue::system_dfl().enqueue_scoped(&*self.submit_worker) };
   257 +         unsafe { workqueue::system_bh().enqueue_scoped(&*self.submit_worker) };
   |
--
>> error[E0277]: `impl PinInit<Revocable<Lock<impl PinInit<..., ...>, ...>>>` cannot be used to initialize `Revocable<lock::Lock<JobQueueInner<'_, T>, SpinLockIrqBackend>>` with error `_`
   --> rust/kernel/drm/job_queue.rs:416:22
   |
   416 |               inner <- Revocable::new(new_spinlock_irq!(try_pin_init!(JobQueueInner {
   |  ___________________--_^
   | |                   |
   | |                   required by a bound introduced by this call
   417 | |                 submit_worker_active: false,
   418 | |                 // SAFETY: `this` is valid. The lifetimes ensure that the reference remains valid.
   419 | |                 submit_worker <- new_scoped_work!("JobQueueSubmitWorker", Ok(SubmitWorker { jq: unsafe { &*this.as_ptr() } })),
   ...    |
   422 | |                 capacity,
   423 | |             }))),
   | |________________^ unsatisfied trait bound
   |
   = help: the trait `pin_init::PinInit<Revocable<lock::Lock<JobQueueInner<'_, T>, SpinLockIrqBackend>>, _>` is not implemented for `impl PinInit<Revocable<Lock<impl PinInit<..., ...>, ...>>>`
   help: the following other types implement trait `pin_init::PinInit<T, E>`
   --> rust/pin-init/src/lib.rs:1063:1
   |
   1063 | / unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
   1064 | | where
   1065 | |     I: PinInit<T, E>,
   1066 | |     F: FnOnce(Pin<&mut T>) -> Result<(), E>,
   | |____________________________________________^ `ChainPinInit<I, F, T, E>`
   ...
   1162 | / unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainInit<I, F, T, E>
   1163 | | where
   1164 | |     I: Init<T, E>,
   1165 | |     F: FnOnce(&mut T) -> Result<(), E>,
   | |_______________________________________^ `ChainInit<I, F, T, E>`
   ...
   1502 |   unsafe impl<T, E> PinInit<T, E> for Result<T, E> {
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::result::Result<T, E>`
   note: required by a bound in `pin_init::__internal::Slot::<pin_init::__internal::Pinned, T>::init`
   --> rust/pin-init/src/__internal.rs:266:37
   |
   266 |     pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<DropGuard<Pinned, T>, E> {
   |                                     ^^^^^^^^^^^^^ required by this bound in `Slot::<Pinned, T>::init`
   = note: the full name for the type has been written to 'kernel.long-type-12147038180072536476.txt'
   = note: consider using `--verbose` to print the full type name to the console

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
