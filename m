Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045089;
	b=h4/drt2Zaxdoi/vp/UDLXT9Dm7ExuWheg6Ydh6YOjkuArYcDyMu0ClSXExt+RUrCEum4
	 hgR9JTSfJyUpEaPnnaJCmG/EYTXGetvhhUPSb1QllDHzgyVhoRNfJgREokVjiRzmcF8Su
	 YmxXTysd7XVC+DInlohk5rS0YmCAQpjQff/VHBgqSY60Km+QtFk8FZgSdC1/YvZsm5l/Q
	 ZDbsaxJx7neAjH43/3Hl+lUOzstZLhPsWOBMjcwa4MVzhFUvlG7wJVwijYXuhlOsS5JUj
	 UEiYOSYXMC0edJ+B8ej0KB/wSxzlpr6IplUpGy6+ZxcZgD812hw/mplACrgksSXTNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=84XKS3Ny07xbRf87KqKKB32bj0u0YsCwy4nVOlZKsMk=;
	b=CoNkGT4SVbaDe9YkGtYdA4ErGH9dyOmm3GxFYdQs0b77+rEwMvyOEoRjqw8Ua5ObZWqJ
	 ljg+XzHm2XS0fiSGFv80nDOa70U1kOiICU/TPkD97zbCvwZAtCZtYNVp6Dd+VokspPsLh
	 /mhZ7w/BTf9z1Q35c/VfqcNbKuHTCdNWihlauxlgeVRfP0VnmMhFWREtTmpT8ZMPZZM4i
	 KpzIPU0hM/4lhGMyNDmfxlHkG+nKEKSFLY7i7mw8EINFZvzqk6B8/umAEcSkBWw16XbzX
	 1k2wF4PlE4YpvQu8i9fVTpmOt/qrypPGIXXeVz47Kb2EtCl3ENIRe97KrRlnosJlC4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="iM9ZdN/p";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A721606A32F;
	Sat,  7 Nov 2026 09:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A721606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iM9ZdN/p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794045088; x=1825581088;
  h=date:from:to:cc:subject:message-id;
  bh=ep4uHUzZwNSf8xIZ0csL6LCecUe/UPzRGkeyq+qfd2M=;
  b=iM9ZdN/pT5/Ca9FtN/2q9hVuZCbgCkHQfFXdxkN4/3oKFLC7O0BPtyCi
   hXj6eOWIoO9BzeWjJB6z0dm4kRPCMe0LeNx6lbSEoy06wychFxNEYdcgZ
   K9hu/RzZmZ5v3xDMyVTFQ82b7F1UDrsynZGQ+xkgS9ELbHk5vuInssxyN
   acw+s+CzvH9i5qULe8vG3LfcDGLF2Z9Vl86e+99ciaDcUXj2yMjSoHup+
   mQIqTZuImUQxrI2FXdZH0hRWCinZ1uGVfEhH6iGTxEFi2UYVcL2TwPbfk
   cHBkBb9Zl0ByjhIhKn2w75Qq4D2Snw0riBmiXLXqL1+LILfnrPEqArt0G
   Q==;
X-CSE-ConnectionGUID: OAZpfwSHRvm85OCq34CEmA==
X-CSE-MsgGUID: GA/dt0mZTEemjOJGp+QJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2884413"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2884413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 01:51:25 -0800
X-CSE-ConnectionGUID: t95IFQAmTHOG8XXh5O5wgA==
X-CSE-MsgGUID: BrKsLq5vQSyyrTR/CB660A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7337394"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2026 01:51:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPd4y-00000000qfZ-4AE4;
	Sat, 07 Nov 2026 09:51:20 +0000
Date: Sat, 07 Nov 2026 17:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 2/56] error[E0599]: the
 associated function or constant `new_zeroed_slice` exists for struct
 `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8],
 Kmalloc>`, but its trait bounds were not satisfied
Message-ID: <202611071750.G3OBAifp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 9985fb1d439627f74610170aeabe7b590f6b5145 [2/56] rust: alloc: add Box::new_zeroed_slice()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261107/202611071750.G3OBAifp-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071750.G3OBAifp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071750.G3OBAifp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: the associated function or constant `new_zeroed_slice` exists for struct `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8], Kmalloc>`, but its trait bounds were not satisfied
   --> rust/doctests_kernel_generated.rs:469:23
   |
   469 | let b = KBox::<[u8]>::new_zeroed_slice(10, GFP_KERNEL)?;
   |                       ^^^^^^^^^^^^^^^^ associated function or constant cannot be called due to unsatisfied trait bounds
   |
   note: if you're trying to build a new `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8], Kmalloc>`, consider using `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box::<T, A>::from_raw` which returns `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<_, _>`
   --> rust/kernel/alloc/kbox.rs:177:5
   |
   177 |     pub const unsafe fn from_raw(raw: *mut T) -> Self {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: the following trait bounds were not satisfied:
   `[u8]: Sized`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
