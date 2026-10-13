Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F733A1690;
	Tue, 13 Oct 2026 01:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855260; cv=none; b=TQtA5betR+kc3zlQGdxKgiqDu3GrTvTE5U6/LBdHXhSfppsF0H4AUylRQP13cpUoCtGZG0spOhQ2ta6MroGhsu511brruN/6XoECAw66LnNspxKq0lxviAwpOWtx2HxHKBhtVOYUUuU8ZpfCUR1/t3IRtA2oBR2ca82cfhjeO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855260; c=relaxed/simple;
	bh=9Sn4J2Qi5biZEbub9Fr0LR+1NfCb8ePeAvdfpspcvZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hGmYdAT/vJp6+jjNWUcjdr9jtM44hAvnsFzvvWIbLhwdcH1jTBDV/5SpOmHMjpQcanXRFuRLd6DbdeepYfVD3ysAGh9qMpbMozd0oRQ9gkdJZjiy2dhRbnxTCnJ8tfR8uDocS3Idw4JWx87uij+Y6wMo8ydeQN5wV1aNMram6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQSg7NXC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQSg7NXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791855258; x=1823391258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Sn4J2Qi5biZEbub9Fr0LR+1NfCb8ePeAvdfpspcvZU=;
  b=BQSg7NXC3fks41J4Te50CVuhYhX+8nmAcgthiNU331q5Eydtr939EGh0
   u6MvyLo/swUBw57DKRuWJHjo1tIH2IHy9BVOq0y5TLk5QO0OxuFJk9itA
   7UXCKyTMmElcXP2gLL9+bs1pk5FtI9eNs+5Ed/zSTWSVWqIld4oKTLyPu
   Lltpq93+shiALRc0gATQaYZ7lxPfD9QoyJmfW3rozCJJh3adW33oUPY3c
   r1J5vsm8RLQjDU6WBa9fndnxjwEZhsZz8WCqXJA0aOJwQzC2+5TGKP3Er
   kWo5YNpRn+m2/BzF6bASr/CrYSe+iltrDfSJ1YMx3qhFk33W4pCa+BZCB
   A==;
X-CSE-ConnectionGUID: 5hv+vxMTQXisp+UYDN3aQQ==
X-CSE-MsgGUID: 1sk626/jRm6dAZtsztzCVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="456834"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="456834"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 18:34:17 -0700
X-CSE-ConnectionGUID: MAU8hMn+SBSWdnXSXHprDw==
X-CSE-MsgGUID: 82aQGqlzRZK7cgkETbLpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2875601"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 12 Oct 2026 18:34:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGRPB-00000000CMA-24a5;
	Tue, 13 Oct 2026 01:34:13 +0000
Date: Tue, 13 Oct 2026 09:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 14/16] error[E0425]:
 cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
Message-ID: <202610130904.gpqVPnQD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   20c3aae54d617189168dfe8539a9086baeab6d39
commit: ba27e0dd2dfd3ac15e54eb9d375fc34d5de33004 [14/16] x
config: arm64-randconfig-1003-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130904.gpqVPnQD-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130904.gpqVPnQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130904.gpqVPnQD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/driver.rs:75:13
   |
   75 |             dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
   |             ----------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 |   macro_rules! dev_dbg {
   |   -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                           $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                             ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/firmware/booter.rs:96:9
   |
   96 | /         dev_dbg!(
   97 | |             dev,
   98 | |             "loaded {} firmware v{}\n",
   99 | |             fw_name,
   100 | |             tlv.get_string(b"VERS")?
   101 | |         );
   | |_________- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/fsp.rs:541:9
   |
   541 |         dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
   |         ------------------------------------------------------------------ in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/fsp.rs:547:9
   |
   547 |         dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
   |         ------------------------------------------------------------ in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gpu.rs:398:21
   |
   398 |                     dev_dbg!(dev, "Usable FB regions:\n");
   |                     ------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gpu.rs:400:25
   |
   400 |                         dev_dbg!(dev, "  - {:#x?}\n", region);
   |                         ------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 |   macro_rules! dev_dbg {
   |   -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                           $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                             ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gpu.rs:403:21
   |
   403 | /                     dev_dbg!(
   404 | |                         dev,
   405 | |                         "Total usable VRAM: {} MiB\n",
   406 | |                         info.usable_fb_regions.iter().fold(0u64, |res, region| res
   407 | |                             .saturating_add(region.end - region.start))
   408 | |                             / u64::SZ_1M
   409 | |                     );
   | |_____________________- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gsp/boot.rs:74:9
   |
   74 |         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
   |         -------------------------------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gsp/hal/gh100.rs:80:5
   |
   80 |     dev_dbg!(dev, "Waiting for GSP lockdown release\n");
   |     --------------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gsp/hal/gh100.rs:110:5
   |
   110 |     dev_dbg!(dev, "GSP lockdown released\n");
   |     ---------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_dev_dbg` in crate `$crate::bindings`
   --> rust/kernel/device.rs:926:43
   |
   917 | macro_rules! dev_dbg {
   | -------------------- in this expansion of `dev_dbg!`
   ...
   926 |                         $crate::bindings::__dynamic_dev_dbg(desc, dev.as_ref().as_raw(), c"%pA".as_char_ptr(), &raw const args)
   |                                           ^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/gpu/nova-core/gsp/hal/gh100.rs:155:9
   |
   155 |         dev_dbg!(dev, "{:#x?}\n", fb_sizes);
   |         ----------------------------------- in this macro invocation
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
