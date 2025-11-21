Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B0340A4C;
	Fri, 21 Nov 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717572; cv=none; b=LH9eFnwKfFa2Gr76AUDczTaRsvJLNr4tzy8wOoIyaitS0sZuQZ3wILJ3HQemOLNY4lPhXy3Mz3TLmGbRkG8WQOjDwNEgcFuJIzfVveTcGKyWpmgZYCpv2j5TrdIXziwvfdHJnkoMbjl3lzUOFfJVpaJIteT8XeeCldHfwtm8X6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717572; c=relaxed/simple;
	bh=l0iVDv5nFWY3QUxvbihYT4S0RzKGXIL9T+AtTGVBS/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QaxXHr0N7ekXru7EyRRxir9AhzTaxds63K/OyYoQzYxWWE+niCeRi0iQkBQEhdCokrF207xBuB36hyNAtdHHF7QMDpDkj7qT96262JSRNsmL45BubiXFErgZrvoJZzPhqQ3rOjeMv0YADjt7ujwx1MNKDsMfIOGU7RTbavMDHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRy8STgY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRy8STgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763717570; x=1795253570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0iVDv5nFWY3QUxvbihYT4S0RzKGXIL9T+AtTGVBS/0=;
  b=LRy8STgYGKr+7KuoxYBEM4u7Q8iI78yUyJssGaTjs5CNtE01NeqYrAuX
   BjnKLEBDXTo206dFUMdYRQQ+b2mtoW4bSSOOZz8f4AuIhSGAFCkiG/3Gh
   6loY25bzGuaxHjnxJhiJnlPqEdmNuDaQfw8WSoA8tQvWpwB8ZomhMufmc
   H4GPHFi92aQRe0RjpayCnR876QBlaQgSQ7GNO9EXvMA8f7kLIQEi+jDUb
   U2rxHqfB52Ls3sQMCKdP+rP01ttFp7DoSmwjT8FSgrBMyBB4C8eA6x396
   hnF8i+IYU0HGEYsRVQMVvfG+akF0b6cpdDMoybjXKG8vwAM9c40emSb0j
   A==;
X-CSE-ConnectionGUID: 1xGmDUnpQBSwaJJKdewNCw==
X-CSE-MsgGUID: AmpdhCkYTs+N+9XaEvKSSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83197118"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83197118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 01:32:40 -0800
X-CSE-ConnectionGUID: KUZzFNpCQbafCgnIhpuJug==
X-CSE-MsgGUID: GdxlwKZZS1uLhhHWmVc9CQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2025 01:32:38 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMNVL-0005Ar-2T;
	Fri, 21 Nov 2025 09:32:35 +0000
Date: Fri, 21 Nov 2025 17:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: error[E0609]: no field `name` on type `pci_driver`
Message-ID: <202511211732.sS8sQiq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211732.sS8sQiq7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211732.sS8sQiq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211732.sS8sQiq7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `name` on type `pci_driver`
   --> rust/kernel/pci.rs:42:27
   |
   42 |             (*pdrv.get()).name = name.as_char_ptr();
   |                           ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `probe` on type `pci_driver`
   --> rust/kernel/pci.rs:43:27
   |
   43 |             (*pdrv.get()).probe = Some(Self::probe_callback);
   |                           ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `remove` on type `pci_driver`
   --> rust/kernel/pci.rs:44:27
   |
   44 |             (*pdrv.get()).remove = Some(Self::remove_callback);
   |                           ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `id_table` on type `pci_driver`
   --> rust/kernel/pci.rs:45:27
   |
   45 |             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
   |                           ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `vendor` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:371:35
   |
   371 |         unsafe { (*self.as_raw()).vendor }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `device` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:377:35
   |
   377 |         unsafe { (*self.as_raw()).device }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:462:58
   |
   462 |         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
   |                                                          ^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
