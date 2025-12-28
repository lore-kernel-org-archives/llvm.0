Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7C4A07;
	Sun, 28 Dec 2025 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937632; cv=none; b=dzyxFpi76oNoAX1Df1RtaBKiF1ElsYwc/7zqTjUfvTodvbnqHqdaHHv55qjCbaU4EpkdXZr+76t+Unar30JeH5e+CHx1wkwwBd/9uFlTH39VIirwa8o6C84AxSzyj8BKQIre4HDPqRF8Sa5gQ9gWW6wX9Y0xfUpffo17Jf7srNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937632; c=relaxed/simple;
	bh=Y+X4n2c64XjvlwAe01XxJMUzi8POkH5Ol/N7tGDFfBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZOFGJ5i9zve3LecM8yP9mQWpnZj6AVsp9VCHserNuPQZfKdNpLqNiT1+RnU9Kp6L48nMK3rJwsZ1ToanUJDo2jgD6WibV6HPToLzPgPxxtZxJryNt/n+pnS7S4t/xwWS4/nyu1drABjIjChCqyjEnnJlF1Q2KOWpaObsI1Dhkco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO+hFfDZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO+hFfDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766937630; x=1798473630;
  h=date:from:to:cc:subject:message-id;
  bh=Y+X4n2c64XjvlwAe01XxJMUzi8POkH5Ol/N7tGDFfBQ=;
  b=HO+hFfDZS/RLkRo7GMXv+nLSHba3l28sNvQ20JD9zc24MY7kq97DKP5m
   mWIwOBvOIh45s+XlsRY20IKqzf4qAkclEboFuNE5PfEy3NPrvpU8VNKgT
   9NWfx1HDITpnTljI9noJomEIuy5sxDECQBOvTBQZEd4G8IY9ZtkDR2B2G
   pH60XO94OWmGCh/61Wjflet4OktE1Y4tkCeNB6WPWljrpZM58RRMR5VYl
   6HO2IxtBTecuPlHWfUF2nYeFmQkpGsRM0FcJkL4weSnRFI2ix+xOlBZCO
   aWdk1Y2I+sQWdx/i10m1tJvGbfGt8EnZm1scLo8B4MJkMcx6aYz6Hfk1r
   w==;
X-CSE-ConnectionGUID: X/RyFh29T36kfsVgAcgWjQ==
X-CSE-MsgGUID: rNA2Bj7RTH6/94zWu08aIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68515477"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68515477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 08:00:30 -0800
X-CSE-ConnectionGUID: D7vFfm0GRwCJBxf3wWzinQ==
X-CSE-MsgGUID: C+Au6Pu9TSyLCTAJAcXTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200369247"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Dec 2025 08:00:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZtBw-000000006Y9-2fjs;
	Sun, 28 Dec 2025 16:00:24 +0000
Date: Sun, 28 Dec 2025 23:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 39/62] error[E0061]: this function
 takes 1 argument but 2 arguments were supplied
Message-ID: <202512282309.0qjBzlMN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 3ecafd505020550f9bec8e4feca4d39c2db651a3 [39/62] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251228/202512282309.0qjBzlMN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282309.0qjBzlMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282309.0qjBzlMN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 1 argument but 2 arguments were supplied
   --> rust/doctests_kernel_generated.rs:7468:22
   |
   7468 |     let devres_mem = IoMem::<100>::new(res, device)?;
   |                      ^^^^^^^^^^^^^^^^^      ------ unexpected argument #2
   |
   note: associated function defined here
   --> rust/kernel/io/mem.rs:259:12
   |
   259  |     pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
   |            ^^^
   help: remove the extra argument
   |
   7468 -     let devres_mem = IoMem::<100>::new(res, device)?;
   7468 +     let devres_mem = IoMem::<100>::new(res)?;
   |
--
>> error[E0277]: the `?` operator can only be applied to values that implement `Try`
   --> rust/doctests_kernel_generated.rs:7468:22
   |
   7468 |     let devres_mem = IoMem::<100>::new(res, device)?;
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the `?` operator cannot be applied to type `impl PinInit<Devres<IoMem<100>>, Error>`
   |
   = help: the trait `Try` is not implemented for `impl PinInit<Devres<IoMem<100>>, Error>`
   = note: the full name for the type has been written to 'rust/doctests_kernel_generated.long-type-9262828175772610124.txt'
   = note: consider using `--verbose` to print the full type name to the console
--
>> error[E0412]: cannot find type `Device` in this scope
   --> rust/doctests_kernel_generated.rs:7466:18
   |
   7466 | fn test(device: &Device, res: Resource) -> Result {
   |                  ^^^^^^ not found in this scope
   |
   help: consider importing one of these items
   |
   3    + use kernel::auxiliary::Device;
   |
   3    + use kernel::device::Device;
   |
   3    + use kernel::dma::Device;
   |
   3    + use kernel::net::phy::Device;
   |
   and 2 other candidates
--
>> error[E0603]: struct `Resource` is private
   --> rust/doctests_kernel_generated.rs:7464:22
   |
   7464 | use kernel::io::mem::Resource;
   |                      ^^^^^^^^ private struct
   |
   note: the struct `Resource` is defined here
   --> rust/kernel/io/mem.rs:14:5
   |
   14   | use crate::io::resource::Resource;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   help: import `Resource` directly
   |
   7464 - use kernel::io::mem::Resource;
   7464 + use kernel::io::resource::Resource;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
