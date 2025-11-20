Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864427F16C;
	Thu, 20 Nov 2025 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680235; cv=none; b=V0OOdXOmGxtfx/NQMXNzfWXrNO0/Tuw4Ib9jzYMQEU4dVv5uygEgqnyAJy9NTSAr7K5U5AfLmCrlS8Ak0FNntacvumLUxfKNpwuI7Ga03J7bASiOGSqCCFKw7iwkU6zAepVKpbf98AsnAH+ouiaqqMnszud1RHE3OIiibYkp9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680235; c=relaxed/simple;
	bh=IQ7oH5TWBhUirx1T6ZWl8j0rLb3d8E3qW3ItMFCGVTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPc7JrmSLhyClQm/FlLW9Msxdi2YonZS0jd9x39+KN7Q5KiDqJi6h0ljfVP7hGahDKvdWLkmIqyZgVc2AWoJwAQo0pG4K1GeFXnlAet5iwq1Zvqlk6iVqZ1CBXXV8pCsnxkH/kiy1XFIooVMHsSUvjPeFoAjSYZBuYLfZrD/cng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+lFLmRZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+lFLmRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763680234; x=1795216234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQ7oH5TWBhUirx1T6ZWl8j0rLb3d8E3qW3ItMFCGVTA=;
  b=L+lFLmRZBIMux4YzEAu3t+W4k6N8DDQN45KzPsU6jG5k3f00FT8Ial8x
   xb0D7c55tkqow0y6xgPwsN95ZLMaQzw1ckAFyHNXU2tLapsw1oxAu5lBs
   uiSUKiKB3mo+S9ptwR4j4WeyuHUcYLjcWB982XDFKelBIxcwSMlgQJQJD
   5j8XHQ69hcyLrY0Yu36V6WtQ8HDRVerGsvHNFawSUQ0B8Mt+RVwI3ez65
   DLzXAVZZHSS7YIPW9W0HCRPt5/AJj7wMtjXDi/HUQhwatA7bH6ms5bJkU
   +Lgi1Sx6V//2GsE13FZeV5D+EB0U34d+Zz4eUgk+bD8Fet5uJBr+A91Nf
   A==;
X-CSE-ConnectionGUID: 1axSbPT9SvCTUWxNVB8Q9g==
X-CSE-MsgGUID: G3joIBLzQ16b8y9GeuPfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69623929"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69623929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 15:10:34 -0800
X-CSE-ConnectionGUID: FTFGyJCjThm4K6NBLWiHUw==
X-CSE-MsgGUID: fdNfIjrvT5aIG7URyfs9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="228806635"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2025 15:10:32 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMDnK-0004gD-0Q;
	Thu, 20 Nov 2025 23:10:30 +0000
Date: Fri, 21 Nov 2025 07:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 9315/10599] error[E0609]: no field `id_table` on
 type `i2c_driver`
Message-ID: <202511210704.hwwiqDll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 57c5bd9aee944b0f5c2ab314e10a86fae51f7bf2 [9315/10599] rust: i2c: add basic I2C device and driver abstractions
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210704.hwwiqDll-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210704.hwwiqDll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210704.hwwiqDll-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `driver` on type `i2c_driver`
   --> rust/kernel/i2c.rs:123:27
   |
   123 |             (*idrv.get()).driver.name = name.as_char_ptr();
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `probe` on type `i2c_driver`
   --> rust/kernel/i2c.rs:124:27
   |
   124 |             (*idrv.get()).probe = Some(Self::probe_callback);
   |                           ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `remove` on type `i2c_driver`
   --> rust/kernel/i2c.rs:125:27
   |
   125 |             (*idrv.get()).remove = Some(Self::remove_callback);
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `shutdown` on type `i2c_driver`
   --> rust/kernel/i2c.rs:126:27
   |
   126 |             (*idrv.get()).shutdown = Some(Self::shutdown_callback);
   |                           ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `id_table` on type `i2c_driver`
   --> rust/kernel/i2c.rs:127:27
   |
   127 |             (*idrv.get()).id_table = i2c_table;
   |                           ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `driver` on type `i2c_driver`
   --> rust/kernel/i2c.rs:128:27
   |
   128 |             (*idrv.get()).driver.of_match_table = of_table;
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `driver` on type `i2c_driver`
   --> rust/kernel/i2c.rs:129:27
   |
   129 |             (*idrv.get()).driver.acpi_match_table = acpi_table;
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `i2c_client`
   --> rust/kernel/i2c.rs:393:73
   |
   393 |         unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).dev) }
   |                                                                         ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `i2c_client`
   --> rust/kernel/i2c.rs:402:44
   |
   402 |         let dev = unsafe { &raw mut (*raw).dev };
   |                                            ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `i2c_client`
   --> rust/kernel/i2c.rs:422:79
   |
   422 |         let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
   |                                                                               ^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `i2c_client`
   --> rust/kernel/i2c.rs:422:79
   |
   422 |         let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
   |                                                                               ^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
