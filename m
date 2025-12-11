Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A8225390;
	Thu, 11 Dec 2025 05:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431645; cv=none; b=aRJMQENRrG5uuOppnBVr12NLJ+cUJfZJ0MVoqTAp7kFMMxBiPUWrljHAlKC/mLV3wpNQZap5yDeEeEcYEc4SZcYN6vkEItHwMu91m0OBllCNHAPSOqQAF4F+9+x/dR9bxHeRMLD5DgZ4uGrUv2ObqUeQQVOafdxqtfNB4YnVGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431645; c=relaxed/simple;
	bh=QCM+hMCucFhEQpywdHG/UmvptFHJAYvcfquvUIC9I6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ssj1ajfK2eEhhRlBUGqQ+tg5j+yw2Ul+Cq7mTUB58YDx2xK1QNHgM1L87OABJHqmryjtBg3S4os74hLK6R5V7nGBXABI86/Se+ISTkPSSZNe/kZWan6rfvWRv0x3N6T/hSRvrlFdPHAotBO/pqxmSrcxQ2uLTkmrhwstpuEdU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2Tr/NOT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2Tr/NOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765431641; x=1796967641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCM+hMCucFhEQpywdHG/UmvptFHJAYvcfquvUIC9I6c=;
  b=d2Tr/NOTNa6l9Fv6//2pn/BQl1UpLRyLDJw2xDofMId6afdVhu3pLs1M
   ieJVF3ZqXmk4RidfaLz09jqlq6jKfp5MSMO39GEPH/xZbHwFWRRo2dPvl
   k+gpAUhT5L9o53tT1juKRTSKYBjDAYZCEfu2PXX+u9RXWRq4/uW/3yJ+j
   orSdavZhvR2jsKF3vEF39eugsGYwmVJotU8j8k9+AugApuVuj6upBs3O7
   ePflU0mreVWbVElG/UU4q3LIdlfVe3FfsEubik/HfLqWGlCJpiTWUjNQo
   TZCjFPFnicK4W3N49t1+UzjyyYzHM3TTXf8olBqeiiUR2AjDVxxDP+oaP
   w==;
X-CSE-ConnectionGUID: xD++0uDyRmGfqgAjZpMeLQ==
X-CSE-MsgGUID: 7YRu8Vz8TKm/aGLESOfgmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84817137"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84817137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:40:40 -0800
X-CSE-ConnectionGUID: EaJfNjl4RACp/PN0NJTU2Q==
X-CSE-MsgGUID: m3wWc/wBQCGS/qPJJL2HSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201630349"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 21:40:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZPo-000000004Eh-3te5;
	Thu, 11 Dec 2025 05:40:36 +0000
Date: Thu, 11 Dec 2025 13:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/16] error[E0425]: cannot find function
 `kunit_get_current_test` in crate `$crate::bindings`
Message-ID: <202512111300.sL1upN1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 3ba70776dd9c02b64ba2b9dd8541be5da1126f4e [12/16] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251211/202512111300.sL1upN1Q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111300.sL1upN1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111300.sL1upN1Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `super::bindings_helper::*`
   --> rust/bindings/lib.rs:49:13
   |
   49 |     pub use super::bindings_helper::*;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `super::bindings_raw::*`
   --> rust/bindings/lib.rs:62:9
   |
   62 |     use super::bindings_raw::*;
   |         ^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0425]: cannot find function `kunit_get_current_test` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:68:57
   |
   68  |             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
   |                                                         ^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:551:9
   |
   551 |         assert_eq!(Some(0), b.next_zero_bit(0));
   |         --------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_do_failed_assertion` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:133:35
   |
   133 |                 $crate::bindings::__kunit_do_failed_assertion(
   |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:551:9
   |
   551 |         assert_eq!(Some(0), b.next_zero_bit(0));
   |         --------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `kunit_get_current_test` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:68:57
   |
   68  |             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
   |                                                         ^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:552:9
   |
   552 |         assert_eq!(None, b.last_bit());
   |         ------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_do_failed_assertion` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:133:35
   |
   133 |                 $crate::bindings::__kunit_do_failed_assertion(
   |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:552:9
   |
   552 |         assert_eq!(None, b.last_bit());
   |         ------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `kunit_get_current_test` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:68:57
   |
   68  |             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
   |                                                         ^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/alloc/allocator.rs:289:9
   |
   289 |         assert!(ta.is_aligned_to(128));
   |         ------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `kunit_get_current_test` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:68:57
   |
   68  |             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
   |                                                         ^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:556:9
   |
   556 |         assert_eq!(Some(17), b.next_bit(0));
   |         ----------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_do_failed_assertion` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:133:35
   |
   133 |                 $crate::bindings::__kunit_do_failed_assertion(
   |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:556:9
   |
   556 |         assert_eq!(Some(17), b.next_bit(0));
   |         ----------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `kunit_get_current_test` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:68:57
   |
   68  |             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
   |                                                         ^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/bitmap.rs:557:9
   |
   557 |         assert_eq!(Some(17), b.next_bit(17));
   |         ------------------------------------ in this macro invocation
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `__kunit_do_failed_assertion` in crate `$crate::bindings`
   --> rust/kernel/kunit.rs:133:35
   |
   133 |                 $crate::bindings::__kunit_do_failed_assertion(
   |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
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
