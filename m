Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0126AD7;
	Sat, 15 Jun 2024 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718474016; cv=none; b=ax7K7qaNw5FHFwnyfJ44MEJCv8IHNzWIw5g/l+vIKGItOpZDERaSIxuNmHNyJyfeE+lC8XL9XR9V2NGFdtHPj5YIeWBtgGxf3SB3NeVNCM5UPhdrsUKTcjo0nX79CF9z3wJj2Zgtn9jRXvIS4yRACLGrcW0MCjIlZCJh2qo2d/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718474016; c=relaxed/simple;
	bh=18XFVSlEXxG3CE/Vp8V+kUa9jLFxKG9vXv9W/leCgMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgAftRbpXADAoVx/J0FYuL9cgPezQXLuT9C/+7jhxMCuok3VWVkfodU3/vG0zdK2aso+0i3fqR0PTT7Hox0JfZR8d0dIw0EYzm+JO3LvhPbl35P00LOhj+A4jxEC0V+dzlklLO/84DUbMPqIMUU4NtlhqWleXQcOvgedSHp5Otc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVRyJgWh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVRyJgWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718474014; x=1750010014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18XFVSlEXxG3CE/Vp8V+kUa9jLFxKG9vXv9W/leCgMg=;
  b=iVRyJgWhOgqj/+x79eXaT9y2pQCGeDLx6NcFAUy6Fn29ROIgZ0gDNz7V
   5hkUusA5yNUTEfPmDPi8q+N6rnW7yM1hSvDRtun3uJDFttKhVEvV8UQXO
   q7jO/r97Q5rbtpjHHJySrxnTO12+ZX5eJ+HMExlqouIQJwJb0JW/m2AKr
   N0/p+moSNMLuNUb9h7um8TzyVTeBFMVaa3pMOdpDEEahuhkbvn1oukZ9m
   5fIXTuned2b9rUUuxF3cfSX/9bNGlTXd6q4ZYv6BKTw15i7QB/M3C8r/I
   9FL/zIC19mL1fVYA2qXh7q0eQgW7AEqz0c6FO9hsYIHvjZZt9vRdlm7li
   w==;
X-CSE-ConnectionGUID: tD+5nq5/SrmRICDg/TKIUA==
X-CSE-MsgGUID: vmDI5sevQ1mhZJt/lXwRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26772052"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="26772052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 10:53:33 -0700
X-CSE-ConnectionGUID: B85YrT9CSMe72YifvqdesQ==
X-CSE-MsgGUID: 27ed8alASsGsVSML4U+EfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40678102"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jun 2024 10:53:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIXaj-0000MI-2P;
	Sat, 15 Jun 2024 17:53:29 +0000
Date: Sun, 16 Jun 2024 01:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:staging/rust-device 3/12] error[E0050]: method `init` has 1
 parameter but the declaration in trait
 `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
Message-ID: <202406160156.optetYTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-device
head:   6530ecc4ac729a040a955a5e2d13c37d671b6e5c
commit: c606f74489984d3b7a8f101d4fb1fe0c7d02860b [3/12] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240616/202406160156.optetYTW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160156.optetYTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160156.optetYTW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
   --> rust/doctests_kernel_generated.rs:1649:1
   |
   1649 | / kernel::module_phy_driver! {
   1650 | |     drivers: [PhySample],
   1651 | |     device_table: [
   1652 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1657 | |     license: "GPL",
   1658 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static rust_doctest_kernel_build_assert_rs_0::kernel::prelude::CStr, &'static rust_doctest_kernel_build_assert_rs_0::kernel::ThisModule) -> core::result::Result<Self, rust_doctest_kernel_build_assert_rs_0::kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> drivers/net/phy/ax88796b_rust.rs:14:1
   |
   14 | / kernel::module_phy_driver! {
   15 | |     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
   16 | |     device_table: [
   17 | |         DeviceId::new_with_driver::<PhyAX88772A>(),
   ...  |
   24 | |     license: "GPL",
   25 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static kernel::prelude::CStr, &'static kernel::ThisModule) -> core::result::Result<Self, kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
