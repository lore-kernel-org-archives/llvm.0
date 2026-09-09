Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C72D73B8;
	Wed,  9 Sep 2026 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917716; cv=none; b=UODR+vbI2DSQxV9eqE5bqtdWhGdjaSnjfA88JW+hfhroMF+mHVv8nP+zJQe7PD4gplBsZXw2A9RfL9bR1z92qMPmkmd2oC1cFzNeCFCJFB8MFxz1SqvL3UT2nQd8IyQSdWsoiu4M0mGqotd6jesAOpDBeqNg8ja7KJl2a4oCvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917716; c=relaxed/simple;
	bh=o39w0mFHR1dYfyksC/IVqr8MfutQWQkeUgU4kvt0uDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wio1Owz0yEanQXDFgyhQxLC+yK0n9hFpINSxXl/0D6ONqTKrHBkmA3OqXFJpUEAsFGCn6Q4ZdUvGUBcUAMQUSAChirFV8N3ztn50q0r3etxgHQjvoBATklvFRDJDwU3YlAWg8wO53Txxr37o1R3/+N/DYCMLho2gf5giGKlPMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTEzIwTT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTEzIwTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788917712; x=1820453712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o39w0mFHR1dYfyksC/IVqr8MfutQWQkeUgU4kvt0uDA=;
  b=RTEzIwTTty+PEX0Pq5wlqHMcAbEa8obb2jtfoWTKvbEXVbUpE89FToZ3
   szXGUJJ1b0txQkPAOaVntDqAsV/m+ZjCCe5dkUHGmyVOwTMJ2gJkaWJIH
   PuBj49Z1FOmZt8Jz7YR+nXYhsGyUWM+SEbxqLf825wcGrOIBJHuzTYtVj
   fspBwM9GdFiYgi8cxtYe+gnP3vIp9wvBg+G3ViWd365JLlAtvqinwPpEB
   kdhdbXc3Y1+U0j/hdneNShu2XS7jd9NtjheUscyg3nG27rqQrXBwMyUAP
   VTMRuXgiXfxP0Y50c9nb/X4G1POXQYBC8AZPnQEpb/1zgp2wPKZhCuJMz
   Q==;
X-CSE-ConnectionGUID: 8RRWr8H/QVSDV3Cv+YzHtQ==
X-CSE-MsgGUID: JIXgzTQNSoSR2QLKNPSjAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89091937"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89091937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 18:35:12 -0700
X-CSE-ConnectionGUID: DKqSixrxSgaSHwGK+Mijlw==
X-CSE-MsgGUID: 1KPB/RUgRyqkCwx56iWLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275304859"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2026 18:35:08 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x47DN-0000000010M-0ZPg;
	Wed, 09 Sep 2026 01:35:05 +0000
Date: Wed, 9 Sep 2026 03:35:01 +0200
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, arnd@arndb.de, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	peterz@infradead.org, ojeda@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, mhiramat@kernel.org, boqun@kernel.org,
	atomlin@atomlin.com, neelx@suse.com, da.anzani@gmail.com,
	sean@ashe.io, chjohnst@mail.com, steve@abita.co, mproche@mail.com,
	nick.lane@mail.com, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] module: Rename module_blacklist to
 module_denylist
Message-ID: <202609090311.bhj7AUr7-lkp@intel.com>
References: <20260903185557.183224-3-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903185557.183224-3-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on soc/for-next linus/master v7.3-rc2 next-20260908]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/module-Extend-module_blacklist-parameter-to-built-in-modules/20260903-145556
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260903185557.183224-3-atomlin%40atomlin.com
patch subject: [PATCH v10 2/2] module: Rename module_blacklist to module_denylist
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260909/202609090311.bhj7AUr7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090311.bhj7AUr7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609090311.bhj7AUr7-lkp@intel.com/

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
   --> rust/doctests_kernel_generated.rs:12739:1
   |
   12739 | / kernel::module_phy_driver! {
   12740 | |     drivers: [PhySample],
   12741 | |     device_table: [
   12742 | |         DeviceId::new_with_driver::<PhySample>()
   ...     |
   12747 | |     license: "GPL",
   12748 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> rust/doctests_kernel_generated.rs:12739:1
   |
   12739 | / kernel::module_phy_driver! {
   12740 | |     drivers: [PhySample],
   12741 | |     device_table: [
   12742 | |         DeviceId::new_with_driver::<PhySample>()
   ...     |
   12747 | |     license: "GPL",
   12748 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_minimal.rs:7:1
   |
   7 | / module! {
   8 | |     type: RustMinimal,
   9 | |     name: "rust_minimal",
   10 | |     authors: ["Rust for Linux Contributors"],
   ...  |
   22 | |     },
   23 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_minimal.rs:7:1
   |
   7 | / module! {
   8 | |     type: RustMinimal,
   9 | |     name: "rust_minimal",
   10 | |     authors: ["Rust for Linux Contributors"],
   ...  |
   22 | |     },
   23 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_misc_device.rs:136:1
   |
   136 | / module! {
   137 | |     type: RustMiscDeviceModule,
   138 | |     name: "rust_misc_device",
   139 | |     authors: ["Lee Jones"],
   140 | |     description: "Rust misc device sample",
   141 | |     license: "GPL",
   142 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_misc_device.rs:136:1
   |
   136 | / module! {
   137 | |     type: RustMiscDeviceModule,
   138 | |     name: "rust_misc_device",
   139 | |     authors: ["Lee Jones"],
   140 | |     description: "Rust misc device sample",
   141 | |     license: "GPL",
   142 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_print_main.rs:8:1
   |
   8 | / module! {
   9 | |     type: RustPrint,
   10 | |     name: "rust_print",
   11 | |     authors: ["Rust for Linux Contributors"],
   12 | |     description: "Rust printing macros sample",
   13 | |     license: "GPL",
   14 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0422]: cannot find struct, variant or union type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_print_main.rs:8:1
   |
   8 | / module! {
   9 | |     type: RustPrint,
   10 | |     name: "rust_print",
   11 | |     authors: ["Rust for Linux Contributors"],
   12 | |     description: "Rust printing macros sample",
   13 | |     license: "GPL",
   14 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find type `initcall_modname` in crate `::kernel::bindings`
   --> samples/rust/rust_debugfs.rs:58:1
   |
   58 | / kernel::module_platform_driver! {
   59 | |     type: RustDebugFs,
   60 | |     name: "rust_debugfs",
   61 | |     authors: ["Matthew Maurer"],
   62 | |     description: "Rust DebugFS usage sample",
   63 | |     license: "GPL",
   64 | | }
   | |_^ not found in `::kernel::bindings`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_platform_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
