Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59341C30F;
	Sat,  3 Oct 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027011; cv=none; b=dSPOAhde/TPYZaVXuaL/E65CwKVqQvKIGdQgiBTjffAZM/erKdN28Q8925Gc4nqWR8vkPLboN9dNcP2UWk4tvyeJvzF5nkrcDY1IcZq7w5OMuoEh3lWM1eFYCkWObhP+0o/MDeFlJSzWvjuliXJNKzlYt2q9/uMuw9yqJ1+Utb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027011; c=relaxed/simple;
	bh=0LqGFutHxxyQqt0SDtiQbhP+XWm99zGnBx6PfVB3CO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZkyrqqCz89aY8j7gdtkoNIrRXn2J1RNYue54lK2WGNh7MgxmUt82PBbCn0mZ7XueO1oqsEWjSdmH4uYKKP7EVIDjtwGoASezg+eRMGjijZNK100Iq8M4j6dTMJpkZv0B5/Q9OXxb/jrpW7BxLeDJIXq+8dwi0u6KXpyB7h8DFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SK39xOzE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK39xOzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791027010; x=1822563010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LqGFutHxxyQqt0SDtiQbhP+XWm99zGnBx6PfVB3CO0=;
  b=SK39xOzEq/ZgntIaQY4v3+gTXLUv8v3Q/kDmPBtUtOcYJy6sEoICBmC0
   x+5egZnLw+OkDUJPNeK1wmTfX19KOIEJALOrbzDKa6cMwjyM+O0vUgLJD
   futmveBbIPAbN+H+3/b//XDR9IItNOUscGxso93XZQA/HSgJmXYzgXnKr
   T5XGX22FZ6eMTcC+r4YpGe9es8R/xAUbD8OPFx/3SvgI7S+wcZ5SPbsQm
   CV9EBfgZ3pJHelGY2WxDfi0rPQzxqrKX1AIA+tDfOH70wHYw/PJ4Hp2wq
   1l8bxX12YeoKXDBWjnMDrOUHxAFy3MpEFIkHUgg6svCmCZhwZNrfnC5cy
   g==;
X-CSE-ConnectionGUID: 1VXTGqdLSzy/3Zf0cfpHAg==
X-CSE-MsgGUID: tHtlw6GwQMK0OPEGyMavAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="113553450"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="113553450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 04:30:08 -0700
X-CSE-ConnectionGUID: fDFpd5iUSIWKgjalVjvb2g==
X-CSE-MsgGUID: dcz0y8RXRbq5EgjOtzlx5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275085828"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2026 04:30:05 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCxwI-0000000012V-0WcX;
	Sat, 03 Oct 2026 11:30:02 +0000
Date: Sat, 03 Oct 2026 13:29:47 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 14/15] error: expected
 expression, found `let` statement
Message-ID: <202610031358.rujOiXGc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   455dc868b8bce1724156c72696d8df25e44aeee3
commit: 37f2c7cb7f50692279e993451b69b94856c115d3 [14/15] rust: device: remove logging methods
config: um-randconfig-2000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031358.rujOiXGc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031358.rujOiXGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610031358.rujOiXGc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:812:9
   |
   810 |   macro_rules! dev_warn {
   |   --------------------- in this expansion of `dev_warn!`
   811 |       ($dev:expr, $($f:tt)*) => {
   812 |           let dev = &$dev;
   |           ^^^
   |
   ::: drivers/gpu/nova-core/fb.rs:81:17
   |
   81 | /                 dev_warn!(
   82 | |                     &self.device,
   83 | |                     "failed to unregister sysmem flush page: {:?}\n",
   84 | |                     e
   85 | |                 )
   | |_________________- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
--
>> error: macro expansion ignores keyword `let` and any tokens following
   --> rust/kernel/device.rs:813:9
   |
   813 |           let args = $crate::prelude::fmt!($($f)*);
   |           ^^^
   |
   ::: drivers/gpu/nova-core/fb.rs:81:17
   |
   81 | /                 dev_warn!(
   82 | |                     &self.device,
   83 | |                     "failed to unregister sysmem flush page: {:?}\n",
   84 | |                     e
   85 | |                 )
   | |_________________- caused by the macro expansion here
   |
   = note: the usage of `dev_warn!` is likely invalid in expression context
   help: you might be missing a semicolon here
   --> drivers/gpu/nova-core/fb.rs:85:18
   |
   85 |                 );
   |                  +
--
>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:781:9
   |
   779 | macro_rules! dev_err {
   | -------------------- in this expansion of `dev_err!`
   780 |     ($dev:expr, $($f:tt)*) => {
   781 |         let dev = &$dev;
   |         ^^^
   |
   ::: drivers/gpu/nova-core/firmware/fwsec.rs:397:30
   |
   397 |             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
   |                              --------------------------------------------------------- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
--
>> error: macro expansion ignores keyword `let` and any tokens following
   --> rust/kernel/device.rs:782:9
   |
   782 |         let args = $crate::prelude::fmt!($($f)*);
   |         ^^^
   |
   ::: drivers/gpu/nova-core/firmware/fwsec.rs:397:30
   |
   397 |             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
   |                              --------------------------------------------------------- caused by the macro expansion here
   |
   = note: the usage of `dev_err!` is likely invalid in expression context
   help: you might be missing a semicolon here
   --> drivers/gpu/nova-core/firmware/fwsec.rs:397:87
   |
   397 |             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e);)?;
   |                                                                                       +
--
>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:781:9
   |
   779 | macro_rules! dev_err {
   | -------------------- in this expansion of `dev_err!`
   780 |     ($dev:expr, $($f:tt)*) => {
   781 |         let dev = &$dev;
   |         ^^^
   |
   ::: drivers/gpu/nova-core/firmware/fwsec.rs:400:30
   |
   400 |             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
   |                              --------------------------------------------------------- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
--
>> error: macro expansion ignores keyword `let` and any tokens following
   --> rust/kernel/device.rs:782:9
   |
   782 |         let args = $crate::prelude::fmt!($($f)*);
   |         ^^^
   |
   ::: drivers/gpu/nova-core/firmware/fwsec.rs:400:30
   |
   400 |             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
   |                              --------------------------------------------------------- caused by the macro expansion here
   |
   = note: the usage of `dev_err!` is likely invalid in expression context
   help: you might be missing a semicolon here
   --> drivers/gpu/nova-core/firmware/fwsec.rs:400:87
   |
   400 |             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e);)?;
   |                                                                                       +
--
>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:781:9
   |
   779 | macro_rules! dev_err {
   | -------------------- in this expansion of `dev_err!`
   780 |     ($dev:expr, $($f:tt)*) => {
   781 |         let dev = &$dev;
   |         ^^^
   |
   ::: drivers/gpu/nova-core/gpu.rs:321:30
   |
   321 |             .inspect_err(|e| dev_err!(device, "failed to unload GSP: {:?}\n", e));
   |                              --------------------------------------------------- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
--
>> error: macro expansion ignores keyword `let` and any tokens following
   --> rust/kernel/device.rs:782:9
   |
   782 |         let args = $crate::prelude::fmt!($($f)*);
   |         ^^^
   |
   ::: drivers/gpu/nova-core/gpu.rs:321:30
   |
   321 |             .inspect_err(|e| dev_err!(device, "failed to unload GSP: {:?}\n", e));
   |                              --------------------------------------------------- caused by the macro expansion here
   |
   = note: the usage of `dev_err!` is likely invalid in expression context
   help: you might be missing a semicolon here
   --> drivers/gpu/nova-core/gpu.rs:321:81
   |
   321 |             .inspect_err(|e| dev_err!(device, "failed to unload GSP: {:?}\n", e););
   |                                                                                 +
--
>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:781:9
   |
   779 | macro_rules! dev_err {
   | -------------------- in this expansion of `dev_err!`
   780 |     ($dev:expr, $($f:tt)*) => {
   781 |         let dev = &$dev;
   |         ^^^
   |
   ::: drivers/gpu/nova-core/gpu.rs:347:38
   |
   347 |                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
   |                                      -------------------------------------------- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
--
>> error: macro expansion ignores keyword `let` and any tokens following
   --> rust/kernel/device.rs:782:9
   |
   782 |         let args = $crate::prelude::fmt!($($f)*);
   |         ^^^
   |
   ::: drivers/gpu/nova-core/gpu.rs:347:38
   |
   347 |                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
   |                                      -------------------------------------------- caused by the macro expansion here
   |
   = note: the usage of `dev_err!` is likely invalid in expression context
   help: you might be missing a semicolon here
   --> drivers/gpu/nova-core/gpu.rs:347:82
   |
   347 |                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n");)?;
   |                                                                                  +
--
>> error: expected expression, found `let` statement
   --> rust/kernel/device.rs:874:9
   |
   872 | macro_rules! dev_info {
   | --------------------- in this expansion of `dev_info!`
   873 |     ($dev:expr, $($f:tt)*) => {
   874 |         let dev = &$dev;
   |         ^^^
   |
   ::: drivers/gpu/nova-core/gpu.rs:393:33
   |
   393 |                     Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
   |                                 -------------------------------------- in this macro invocation
   |
   = note: only supported directly in conditions of `if` and `while` expressions
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
