Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936B1A6806;
	Sun, 20 Sep 2026 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885358; cv=none; b=sisRUm07zkw+bIuyjwXVwAVFF20hYMhk9mntGvWHBqz6MeF/0sgT+Q7fBBajzmuPSCq1RZ0JZGugxSPieaRwK2UXUslONh8Y5UDKTMS9kZ5l50yZ+XeWsCgOZWhtCwWAcsRZQKWrFQwvPLmPSM9fxqtB7r7MF3hoKmMDEau++Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885358; c=relaxed/simple;
	bh=DAD1qQYOIfMJLd6V13t62KZMwlK+iSSfuAvjuCsYRNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pvFmRsHT/ixwVU6S4HLjCY9kBNeHsJ2O6t7Bm7fnxj/GQRqDbumef9/QEcsC6Fb3AWFUBTxP6mLs7UdrRqVhjLd/cFzkmOnEriSDGOCUK+NV26ncXZ+x1PGtVFTEn83KPrCQ3Xb/kwF3RTuC6m9mVgVf68K/rz6c7FrlX0iGCiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m754eoa2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m754eoa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789885356; x=1821421356;
  h=date:from:to:cc:subject:message-id;
  bh=DAD1qQYOIfMJLd6V13t62KZMwlK+iSSfuAvjuCsYRNU=;
  b=m754eoa2/LDAR7JMojfCr4q1ZPv7A7rLMx9/lgyHQRhBbAd01ehXGuEJ
   1+ISNDnUnqoXXtMXBQrx3imSAHKWMzPWcbily+k9ygRUKpSBHya2x/DRu
   1G0J/zN5Dckk3oDMJeJiVrxAIQBUf5OQ7Cx/eTqd2ggfPvKOK4tBdNc/3
   yJi/lDGgA01SE9fGv8IPw9CAPIX71dRSXZdTOzqxve40RuuX9TAa+uv9N
   iX2Cq6ji529Tgix0iLnes9bkqXDiXEfC91v2E59NYnLzhqLP4J0ndSovj
   QSaf89I9FYxCvScdi+xyafiai0+WH84ByAFDQkKXXM08mdgjSAq242gUH
   w==;
X-CSE-ConnectionGUID: L9kZTlzARp+8EaSy6qbhzA==
X-CSE-MsgGUID: XoBI0OppR/6znVu7x1se1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="89320570"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="89320570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 23:22:35 -0700
X-CSE-ConnectionGUID: MU5IGxRqT8GdhNHzqte7bA==
X-CSE-MsgGUID: Kq+MQYP7RcKWT4s89fmL8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="300134301"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2026 23:22:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8AwW-00000000C15-0zke;
	Sun, 20 Sep 2026 06:22:28 +0000
Date: Sun, 20 Sep 2026 14:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6196/6545] error[E0425]: cannot find type
 `initcall_modname` in crate `::kernel::bindings`
Message-ID: <202609201402.NyS4lCWY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: b83e83203582477b2ad0631e29e6fd88295cd9b1 [6196/6545] module: extend module_blacklist parameter to built-in modules
config: x86_64-randconfig-1010-20260919 (https://download.01.org/0day-ci/archive/20260920/202609201402.NyS4lCWY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201402.NyS4lCWY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201402.NyS4lCWY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> rust/doctests_kernel_generated.rs:7459:1
   |
   7459 | / module! {
   7460 | |    type: MyModule,
   7461 | |    name: "module_firmware_test",
   7462 | |    authors: ["Rust for Linux"],
   7463 | |    description: "module_firmware! test module",
   7464 | |    license: "GPL",
   7465 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> rust/doctests_kernel_generated.rs:7459:1
   |
   7459 | / module! {
   7460 | |    type: MyModule,
   7461 | |    name: "module_firmware_test",
   7462 | |    authors: ["Rust for Linux"],
   7463 | |    description: "module_firmware! test module",
   7464 | |    license: "GPL",
   7465 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> rust/doctests_kernel_generated.rs:12639:1
   |
   12639 | / kernel::module_phy_driver! {
   12640 | |     drivers: [PhySample],
   12641 | |     device_table: [
   12642 | |         DeviceId::new_with_driver::<PhySample>()
   ...     |
   12647 | |     license: "GPL",
   12648 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> rust/doctests_kernel_generated.rs:12639:1
   |
   12639 | / kernel::module_phy_driver! {
   12640 | |     drivers: [PhySample],
   12641 | |     device_table: [
   12642 | |         DeviceId::new_with_driver::<PhySample>()
   ...     |
   12647 | |     license: "GPL",
   12648 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_driver_serdev.rs:82:1
   |
   82 | / kernel::module_serdev_device_driver! {
   83 | |     type: SampleDriver,
   84 | |     name: "rust_driver_serdev",
   85 | |     authors: ["Markus Probst"],
   86 | |     description: "Rust Serial device bus device driver",
   87 | |     license: "GPL v2",
   88 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_serdev_device_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_driver_serdev.rs:82:1
   |
   82 | / kernel::module_serdev_device_driver! {
   83 | |     type: SampleDriver,
   84 | |     name: "rust_driver_serdev",
   85 | |     authors: ["Markus Probst"],
   86 | |     description: "Rust Serial device bus device driver",
   87 | |     license: "GPL v2",
   88 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_serdev_device_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_driver_faux.rs:11:1
   |
   11 | / module! {
   12 | |     type: SampleModule,
   13 | |     name: "rust_faux_driver",
   14 | |     authors: ["Lyude Paul"],
   15 | |     description: "Rust faux device sample",
   16 | |     license: "GPL",
   17 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_driver_faux.rs:11:1
   |
   11 | / module! {
   12 | |     type: SampleModule,
   13 | |     name: "rust_faux_driver",
   14 | |     authors: ["Lyude Paul"],
   15 | |     description: "Rust faux device sample",
   16 | |     license: "GPL",
   17 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_debugfs_scoped.rs:24:1
   |
   24 | / module! {
   25 | |     type: RustScopedDebugFs,
   26 | |     name: "rust_debugfs_scoped",
   27 | |     authors: ["Matthew Maurer"],
   28 | |     description: "Rust Scoped DebugFS usage sample",
   29 | |     license: "GPL",
   30 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_debugfs_scoped.rs:24:1
   |
   24 | / module! {
   25 | |     type: RustScopedDebugFs,
   26 | |     name: "rust_debugfs_scoped",
   27 | |     authors: ["Matthew Maurer"],
   28 | |     description: "Rust Scoped DebugFS usage sample",
   29 | |     license: "GPL",
   30 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_dma.rs:136:1
   |
   136 | / kernel::module_pci_driver! {
   137 | |     type: DmaSampleDriver,
   138 | |     name: "rust_dma",
   139 | |     authors: ["Abdiel Janulgue"],
   140 | |     description: "Rust DMA test",
   141 | |     license: "GPL v2",
   142 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_pci_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
