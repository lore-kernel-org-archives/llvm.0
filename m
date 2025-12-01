Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283C182B7;
	Mon,  1 Dec 2025 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764633107; cv=none; b=sLS23qbyIlm+hEEsvz6hddOYawnWj2MmjnucariUC+XB+kO12R8LFwYMjR016ZoHaj3h+RmzGj7LR2IuxJPyvR6BBmuEkYc+TbVDs9jTJP90UDfjkhPmuSoyz4RVcsjSAE+RcMV+2jqSsMDwQOzKwpe2HbtmXmZmhynI0hjlgQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764633107; c=relaxed/simple;
	bh=xrCQsd2CRIeVi/veuRBHsZy/8++mEbVR5kbG4+jOhSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twfC6iL2qqrBr+wZwGjfmpXgfKNt1KKzrWtHv+9D2cBW02ZIWLCDrIQUAnzN8afDOJbVxbAfygZpUcVPrEZoHqWemMJu2e9xs0yPXF5/Lt0Nmx/cGitrXKYnto5htLA36Yq7uUlBhZrmcxakUIv+FJieHZrMt0zC4Ap8IwQLZ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuFMe3ZE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuFMe3ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764633106; x=1796169106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrCQsd2CRIeVi/veuRBHsZy/8++mEbVR5kbG4+jOhSI=;
  b=EuFMe3ZEhfpvlRZRAtHmIlKcN2YW2IVRK7yzNPiX73QbmJ1/150S78F3
   FQLvgyHjUNCoy5IaoExYYCZEPXfZUGNtbk6nTzS75QRTTEUVL+euJEWrC
   QGceGEkQyddKH4ACjQPSmFEisOHOWkuec4b9HBvfbNOdB4RqwB93B0ons
   V3YPddZ6Znd1Xv+qdvbfmL/y0/qHAK/m4wWQ3idOw614iGZrxt41NF3+k
   ffPh6+nCnU+P/9ZZONVkSuusksjrV6Owe9t5pbSgP+1ZDer4Zq5lxFHRF
   yZa1bQmbfQSMTkQnvbD8UeC3j1/mSrWg4ITkKXIjGkirrTR8WClBLmlXg
   A==;
X-CSE-ConnectionGUID: S88u8vERQiuT2sVqtDzf8Q==
X-CSE-MsgGUID: 2MG4BDY8QheaEnTVAVGkaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66479951"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66479951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:51:46 -0800
X-CSE-ConnectionGUID: jJiavsjzSwy95F5o7RtFhA==
X-CSE-MsgGUID: X7nNMEh+QZmx/4LGte4LHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="225182195"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Dec 2025 15:51:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQDgD-000000009Ej-20rf;
	Mon, 01 Dec 2025 23:51:41 +0000
Date: Tue, 2 Dec 2025 07:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 8985/13171] error[E0609]: no field `id_table` on
 type `i2c_driver`
Message-ID: <202512020708.C7Q0UXB2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Igor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 57c5bd9aee944b0f5c2ab314e10a86fae51f7bf2 [8985/13171] rust: i2c: add basic I2C device and driver abstractions
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020708.C7Q0UXB2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020708.C7Q0UXB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020708.C7Q0UXB2-lkp@intel.com/

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
