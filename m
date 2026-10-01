Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49743DEB8;
	Thu,  1 Oct 2026 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834839; cv=none; b=cNTESD4jiexXVstcynZ7QwREbJxfa3S//U8qYyTaFwxFiuzMDG/I/A/l8TTxw6neBzGXaL3lglcRVLt/edRzbP6MrF6RUrR9w42SQflVlHZ1fhs+J2zL6J8qJl9GKKLwFFphaQiqTtiKmXLHc2f6aSgDiAIbf47K2B4LZkcT7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834839; c=relaxed/simple;
	bh=HsSDsOV6pc0DdZMHE0ivQmx837ezyWOA9VbvzpSVId0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FKzekfOD4arVzJnZmdheCO/Rkrspx+JZTqVyWM71Mr4DZEbiC+JQETSgLtmDmQuImeoDzY1ndLvJP7QUi6jEh6FGzlnmTBsAU4v7jFpRNa0rAA0UYV+26i4uDVZDEq+71sysvmOmaO8WOB55cXjNf+4kMAYmrlgl6RE/vVgWz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqxhqXiN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqxhqXiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790834838; x=1822370838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsSDsOV6pc0DdZMHE0ivQmx837ezyWOA9VbvzpSVId0=;
  b=EqxhqXiNjCnvZVY8FdAskPitOyAYBajIPl/JdbNIeofdr3BrtYcbevxE
   0MgYghogMOIGiBRf7O2u+ObWgCMNk7LTdHzKlrRqlHYKQUdwWFuaqQvSc
   FtiYRnqPWUieKVIrrziOEBPQJHN62kzNRb+9MOFlKA29UkssjP+oHzpmA
   fndLplCmvN48FfpuP+uT+5CdsbMWYKD2N+tK9MSDNFP/1VV1SA8JpT+sP
   Efh1lIhbI605ZXxOixNAPK1JG/meic0Yq3j+7Cah6SU1PtP2IUoo9l0aW
   nevlJv6cFXSNJIjwPyRNO1T9S8OZffFu/k89CyQOqzqI9mcfmbeokokgO
   w==;
X-CSE-ConnectionGUID: y/pelooGQASqxxzW23/efQ==
X-CSE-MsgGUID: w7OFE4soT2W486NSp8qdkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100915762"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100915762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:07:15 -0700
X-CSE-ConnectionGUID: xiquKNX0SZG3a5e/jwugOA==
X-CSE-MsgGUID: CXyCn2TEQi6A5eKZPybfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="280654630"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2026 23:07:13 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC9wl-000000002G5-0Z6c;
	Thu, 01 Oct 2026 06:07:11 +0000
Date: Thu, 01 Oct 2026 08:06:50 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 11/15] error:
 `core::num::<impl u32>::bit_width` is not yet stable as a const fn
Message-ID: <202610010836.aVOF8yYD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   8d3e0685c6f97f4b02dcb87274268a7ff4d7bd47
commit: 27766faadd51e77948e26881062ae8e4bc2c0f80 [11/15] rust: add support for dynamic debug
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261001/202610010836.aVOF8yYD-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010836.aVOF8yYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010836.aVOF8yYD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: use of unstable library feature `uint_bit_width`
   --> rust/kernel/dynamic_debug.rs:26:14
   |
   26 |         if c.bit_width() > 8 {
   |              ^^^^^^^^^
   |
   = note: see issue #142326 <https://github.com/rust-lang/rust/issues/142326> for more information
   = help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   = note: this compiler was built on 2026-05-25; consider upgrading it if it is out of date
--
>> error: `core::num::<impl u32>::bit_width` is not yet stable as a const fn
   --> rust/kernel/dynamic_debug.rs:26:12
   |
   26 |         if c.bit_width() > 8 {
   |            ^^^^^^^^^^^^^
   |
   help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   --> rust/kernel/lib.rs:38:1
   |
   38 + #![feature(uint_bit_width)]
   |
--
>> error[E0658]: use of unstable library feature `uint_bit_width`
   --> rust/kernel/dynamic_debug.rs:45:19
   |
   45 |         if lineno.bit_width() > 18 || class_id.bit_width() > 6 {
   |                   ^^^^^^^^^
   |
   = note: see issue #142326 <https://github.com/rust-lang/rust/issues/142326> for more information
   = help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   = note: this compiler was built on 2026-05-25; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature `uint_bit_width`
   --> rust/kernel/dynamic_debug.rs:45:48
   |
   45 |         if lineno.bit_width() > 18 || class_id.bit_width() > 6 {
   |                                                ^^^^^^^^^
   |
   = note: see issue #142326 <https://github.com/rust-lang/rust/issues/142326> for more information
   = help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   = note: this compiler was built on 2026-05-25; consider upgrading it if it is out of date
--
>> error: `core::num::<impl u32>::bit_width` is not yet stable as a const fn
   --> rust/kernel/dynamic_debug.rs:45:12
   |
   45 |         if lineno.bit_width() > 18 || class_id.bit_width() > 6 {
   |            ^^^^^^^^^^^^^^^^^^
   |
   help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   --> rust/kernel/lib.rs:38:1
   |
   38 + #![feature(uint_bit_width)]
   |
--
>> error: `core::num::<impl u32>::bit_width` is not yet stable as a const fn
   --> rust/kernel/dynamic_debug.rs:45:39
   |
   45 |         if lineno.bit_width() > 18 || class_id.bit_width() > 6 {
   |                                       ^^^^^^^^^^^^^^^^^^^^
   |
   help: add `#![feature(uint_bit_width)]` to the crate attributes to enable
   --> rust/kernel/lib.rs:38:1
   |
   38 + #![feature(uint_bit_width)]
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
