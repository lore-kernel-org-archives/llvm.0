Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A9337BBB;
	Mon,  1 Dec 2025 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612812; cv=none; b=jAutgTTRwYMCXjSIUu9lhV2G70iQwTdjhIvbsadpfdPV5MNvUWPZzP2RAHKl/zj9Fw3I7aLe2nkBi34NZlYcmdLjf5+3/1oJHMr+tg0myHxXOA954pGul6x1eD1CxNRFx7zcckchKsaof19oUVD36Dlb3i5M1SRJPHo0rnMiJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612812; c=relaxed/simple;
	bh=4yXgY+I7vgg70Wnm0/5VRGKpJOtv2f+8DC+xGkvvEcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvKalx0N0/z36s2nYONh5R8yhunom0GPzg7M3TWNfVAHQVpzCw62I2ROFOd6KX5uRdR4KoIooaRTdj/Fl/Vbg/45fRAfNKcgJkevUnj1mMjuyHm5sgRyRHqBCuHaKp3lwfcgLMMB/eMcl+KtvMNreLK/f0hY5dFjjn0KaUJZCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+LLKs29; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+LLKs29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764612811; x=1796148811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4yXgY+I7vgg70Wnm0/5VRGKpJOtv2f+8DC+xGkvvEcI=;
  b=E+LLKs29SmhmP7vXF8shvvrb8j+hyiCI7ww1p/niv4HTb6fYNfuh4Iiy
   xM4lQ5VDDOLnKuwemwjlt2dPIyMyRc01HWTsoQ73uYJurqZGFNsiZYDRW
   Z+Dnl0nPa09HG+le57E57mjgWhgTyWmJKCBbO2FBvYueXlC+xDay4yfLn
   jW1po3KbL62ZnXBDfBWrky22hHmF8b8/k0gUGvDAT4YpD5sbJEgn3krEa
   Q4Gz7M5nlteL0hgyfuyliy6PEZBVsLqF5mNeDghVpU6mcjgRb39EhSJ9z
   3GFMe6LZHq4xUo92BBO1GIT6iWLmUKWnOSO9KUHB2960Mvmm6SsaejbNO
   A==;
X-CSE-ConnectionGUID: N/WC2aeJSbKkQxVfecQdTw==
X-CSE-MsgGUID: bWRmDMwTSzydmuwzreG6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65749880"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65749880"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:13:28 -0800
X-CSE-ConnectionGUID: 26WTxcWUSfqPD8gFkeO1SQ==
X-CSE-MsgGUID: tjwbhVdiSQGoLYOBD6KaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199077181"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 10:13:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ8Oq-0000000091l-2OOg;
	Mon, 01 Dec 2025 18:13:24 +0000
Date: Tue, 2 Dec 2025 02:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: error[E0609]: no field `id_table` on type `pci_driver`
Message-ID: <202512020235.XKIERYQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: 1bd8b6b2c5d38d9881d59928b986eacba40f9da8 rust: pci: add basic PCI device / driver abstractions
date:   12 months ago
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020235.XKIERYQ4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020235.XKIERYQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020235.XKIERYQ4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `name` on type `pci_driver`
   --> rust/kernel/pci.rs:32:27
   |
   32 |             (*pdrv.get()).name = name.as_char_ptr();
   |                           ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `probe` on type `pci_driver`
   --> rust/kernel/pci.rs:33:27
   |
   33 |             (*pdrv.get()).probe = Some(Self::probe_callback);
   |                           ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `remove` on type `pci_driver`
   --> rust/kernel/pci.rs:34:27
   |
   34 |             (*pdrv.get()).remove = Some(Self::remove_callback);
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `id_table` on type `pci_driver`
   --> rust/kernel/pci.rs:35:27
   |
   35 |             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
   |                           ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:57:76
   |
   57 |         let dev = unsafe { device::Device::get_device(addr_of_mut!((*pdev).dev)) };
   |                                                                            ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:255:68
   |
   255 |         unsafe { container_of!(self.0.as_raw(), bindings::pci_dev, dev) as _ }
   |                                                                    ^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `vendor` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:261:35
   |
   261 |         unsafe { (*self.as_raw()).vendor }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `device` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:267:35
   |
   267 |         unsafe { (*self.as_raw()).device }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
