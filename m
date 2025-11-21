Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884028851C;
	Fri, 21 Nov 2025 04:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763698514; cv=none; b=nMRh9jm26zOxcyElxuzS4XjNoZnb/6Xy+DZnwDQU1/Cj7tZ0VACe77+Qc1gUykEb5XPo85mZ+Nqe7s0vcYGOcS0Vy6R6dDKgoVtDf1ogx43Bo34apnINGjOS/95e3Negc8UlXyQ+u1RJNhfYFmWNL91F0cLdasMVbp7X1OB59B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763698514; c=relaxed/simple;
	bh=s1PGl/FheMWH4eemr7b24kuLzXWaRp/AbhC2qyv82BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfWeGAwQTBYThxEu+jsdKdyTVEaZnFPp4d8Sr/Y5Y2OSG2KhqWQwlYGi4sDxir/gp3iWVIa9DqSthcb9OwW6aRh/pb3On9RBkzeqAS1PeKN9vhT7vXBEk2a/2Bjy/pQe9xuQLERnUbjG7wZMV62EwKeaT9B9OvEIfY810Ted2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYmP6F9t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYmP6F9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763698512; x=1795234512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1PGl/FheMWH4eemr7b24kuLzXWaRp/AbhC2qyv82BM=;
  b=JYmP6F9tnIgDKS6NaiaaqnDQyeA5OKghvfXDxJF+c5+GLtUzshyugb/o
   B+sCZIimXKN+ONlYfYaUZTRg6JK6M+4xcS1KM3bB62GVdQ8gUxworeIpr
   JY70AYyXP20kiquSCdPcwsUinJrURZ2WUQimVFc0l/VilMPckspvtPQtB
   VpA7UOTyMPPiFk+OO2tbrxGs6Cbk3AgkEGhibe/YHTiNSn8+F03Kb3cil
   jbf+6ljtZ3+m4aIQuRxHNFf5BTJoGYDptVKLsDZE1we/jTvVzS69/yjrJ
   7gYWEUNqrwh0WifAlbM/N7xeaf5GQ44e/J9iYKNS9XU+SvC/aKGlWG2/4
   A==;
X-CSE-ConnectionGUID: b7ZCmMofTLSPHLE+pkB9aw==
X-CSE-MsgGUID: FamFy/nwQyybdcUAtRXk0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69653445"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69653445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:15:07 -0800
X-CSE-ConnectionGUID: O/4g2fkMSYO6CpXmSBu6AQ==
X-CSE-MsgGUID: 1JQ160QtTtuO13KtqLrphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="192008764"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 20:15:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMIY3-0004wB-1g;
	Fri, 21 Nov 2025 04:15:03 +0000
Date: Fri, 21 Nov 2025 12:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>
Subject: error[E0560]: struct `kunit_suite` has no field named `name`
Message-ID: <202511211258.1InbEyUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 818783c804bc051f7faf0ac226b5597f8259c6f8 module: make structure definitions always visible
date:   4 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211258.1InbEyUs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211258.1InbEyUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211258.1InbEyUs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `kunit_suite` has no field named `name`
   --> rust/kernel/kunit.rs:282:21
   |
   282  |                     name: KUNIT_TEST_SUITE_NAME,
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `test_cases`
   --> rust/kernel/kunit.rs:287:21
   |
   287  |                     test_cases: unsafe {
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_init`
   --> rust/kernel/kunit.rs:291:21
   |
   291  |                     suite_init: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_exit`
   --> rust/kernel/kunit.rs:292:21
   |
   292  |                     suite_exit: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `init`
   --> rust/kernel/kunit.rs:293:21
   |
   293  |                     init: None,
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `exit`
   --> rust/kernel/kunit.rs:294:21
   |
   294  |                     exit: None,
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `attr`
   --> rust/kernel/kunit.rs:295:21
   |
   295  |                     attr: ::kernel::bindings::kunit_attributes {
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `status_comment`
   --> rust/kernel/kunit.rs:298:21
   |
   298  |                     status_comment: [0; 256usize],
   |                     ^^^^^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `debugfs`
   --> rust/kernel/kunit.rs:299:21
   |
   299  |                     debugfs: ::core::ptr::null_mut(),
   |                     ^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `log`
   --> rust/kernel/kunit.rs:300:21
   |
   300  |                     log: ::core::ptr::null_mut(),
   |                     ^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_init_err`
   --> rust/kernel/kunit.rs:301:21
   |
   301  |                     suite_init_err: 0,
   |                     ^^^^^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
