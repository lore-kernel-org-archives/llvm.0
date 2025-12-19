Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982D17AE11;
	Fri, 19 Dec 2025 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122743; cv=none; b=kt15uAD9OJbYpm41tCwm4YDWzo9ZH1oAPInHzTM9IEOavapTatdYrk2GWlruYk4/LPvf9a+f/hE4QzJTvpd9jIOsyIY1vbvfZWEYkwauxAWE0Fd0wSnIQ8B/qtlDUUHbeNP11uQH5meTCMqMrX54SQQbrZF2didI6iV3IisRS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122743; c=relaxed/simple;
	bh=C+aAvcO64a5Zylyj+NYq6rp7D0lJfbztLDlMeJE2wq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGOD3JxfQGlw1y+H25llwn58JhqGaiLQwnDszYS2rDb4p1SP/0k5ySQwRHR47uQVg2yxNzS4zAC5uWoWiI0XkJxxQvrg2RlABL5Tk8ugC1pQh+qHCaAnlgBTjfQBEww3NuHJivYbo7clv//bSVKHBFhzRfYWyFgrcZZ4m/BaEO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdMrJQ35; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdMrJQ35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766122740; x=1797658740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+aAvcO64a5Zylyj+NYq6rp7D0lJfbztLDlMeJE2wq0=;
  b=cdMrJQ35cJw3wnDH5KwVKAJ8gaHGnR6envX/CdnPXepObMkAfPI1XeRg
   bnX40D860bKnmlN++6e00ZgMdjy+8VPtdW1+9gL5/7xcBAUWy+5qyMRh7
   D7941EsTP8o0EUpkcWpq+yUTgdlPz2Lvf9Kyj2b/NiHSCG2jtsfrD6CTl
   p8RfuCWSA/w/2hmxOWHnbAc5vNFUOT8V4OOiL6p/abnQWvSV5/OnEya/I
   GJSFSM//4qc+xRIuAJOsIoKey1D7w2W0mVLdiAgfu+J9NqZFGm60vsape
   xoJ8uUFwXBqWeuzzkn6Y9y0dyeymhdKxpdG0jn9JVakvZJsd4jVW5vM/q
   Q==;
X-CSE-ConnectionGUID: NArzaNcSQLWEFlXopE7V2g==
X-CSE-MsgGUID: 7ao150NoQD2fqhSJcUYamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68127347"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68127347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:38:56 -0800
X-CSE-ConnectionGUID: dKeS/oMAT/++Gp1LyJ4QBw==
X-CSE-MsgGUID: bAoDlSHSR2GYW4pY3RNTpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198830880"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2025 21:38:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTCW-0000000035Z-277o;
	Fri, 19 Dec 2025 05:38:52 +0000
Date: Fri, 19 Dec 2025 13:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/15] error[E0425]: cannot find function
 `__kunit_abort` in crate `$crate::bindings`
Message-ID: <202512191312.zHjY6jrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   5ed57ce1a7de9e649ede6b45207ee2f3bdf4cd2f
commit: 8719a5ceb7c22dc1c37a41c1e921c77d6a59ac1d [12/15] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251219/202512191312.zHjY6jrc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191312.zHjY6jrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191312.zHjY6jrc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/alloc/allocator.rs:281:17
   |
   281 |                 assert!(align.is_power_of_two());
   |                 -------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `kunit_unary_assert_format` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:138:44
   |
   138 |                     Some($crate::bindings::kunit_unary_assert_format),
   |                                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:550:9
   |
   550 |         assert_eq!(None, b.next_bit(0));
   |         ------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:550:9
   |
   550 |         assert_eq!(None, b.next_bit(0));
   |         ------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `kunit_unary_assert_format` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:138:44
   |
   138 |                     Some($crate::bindings::kunit_unary_assert_format),
   |                                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:551:9
   |
   551 |         assert_eq!(Some(0), b.next_zero_bit(0));
   |         --------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:551:9
   |
   551 |         assert_eq!(Some(0), b.next_zero_bit(0));
   |         --------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `kunit_unary_assert_format` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:138:44
   |
   138 |                     Some($crate::bindings::kunit_unary_assert_format),
   |                                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:552:9
   |
   552 |         assert_eq!(None, b.last_bit());
   |         ------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:552:9
   |
   552 |         assert_eq!(None, b.last_bit());
   |         ------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `kunit_unary_assert_format` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:138:44
   |
   138 |                     Some($crate::bindings::kunit_unary_assert_format),
   |                                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:556:9
   |
   556 |         assert_eq!(Some(17), b.next_bit(0));
   |         ----------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:556:9
   |
   556 |         assert_eq!(Some(17), b.next_bit(0));
   |         ----------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `kunit_unary_assert_format` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:138:44
   |
   138 |                     Some($crate::bindings::kunit_unary_assert_format),
   |                                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:557:9
   |
   557 |         assert_eq!(Some(17), b.next_bit(17));
   |         ------------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_abort` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:147:35
   |
   147 |                 $crate::bindings::__kunit_abort(kunit_test);
   |                                   ^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:557:9
   |
   557 |         assert_eq!(Some(17), b.next_bit(17));
   |         ------------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
