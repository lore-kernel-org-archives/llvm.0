Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E48154C0F;
	Mon, 16 Dec 2024 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734325718; cv=none; b=Bn1DB06aOVQvA7uaVlsz/LXkwPUvixmQHlYX998vtoayFKc0eISv7/9Eliei1PVOUExd6JQjE3EEidjQ1pX7fYipHpkCB+7RDXMz8SzJfGRydQIoehNOBSetBt+aLvYl75AoeCRKMaRD3CXm/8mr0aKpN9gztPa5+6tXI2r4cQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734325718; c=relaxed/simple;
	bh=46yJhNpihNx1ombScfXY7Zv6TScGpgOvF64UHSbNgFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/e/l+SOjARl1UNKurR0qK3r4KXOVETx8r9tKswmvTbzuc9v8mi73/69zW/nc56gNhk7sgTdRTqWVW133SidyeruOAJLpk4b7V5nDdRW22tAXH/0JgdWj+995G2WPzIwVltsVGwxEQVmjWoewfaLjrFJC9G3HAdnW5AGdSOMhjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LneR21bk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LneR21bk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734325717; x=1765861717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46yJhNpihNx1ombScfXY7Zv6TScGpgOvF64UHSbNgFM=;
  b=LneR21bk051+Z8XjI8vJOksRDRSHEdc1mTa/sQ1mExln+mqB2SxJgpfy
   x5K75r1GjxIw5BmXfd5DhzTx5Lme3UstTnE6IaUUAQN8G1yZcEdVCgLRU
   rbGNSXlgneSHE0vZaBIYaiIkDlGuCjVyTBxC6LL+gup79YLDAiCkQxNFh
   qq8fIlZH/tWt/KeI0laOX35uzY87UOZiY3BZ7eHrUl5rrDHrBOCTa4xLZ
   BPLXxv6OQIWCd/q8n/PknH/hLnSCWdlhBQhutQ73djp2CJiak0jWqwNO6
   rEdve4CKBRF83WLK8y54JPpf3pllWuvJSU5TWIeVoQmgwZ7valGQqHiAS
   Q==;
X-CSE-ConnectionGUID: N8M76ktyQeO297CEAYrjfA==
X-CSE-MsgGUID: mLLWxukQQtSJFv+XVCsqVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34612557"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34612557"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 21:08:37 -0800
X-CSE-ConnectionGUID: HZZa6vl6QeO3Bh3IPNn9PQ==
X-CSE-MsgGUID: 4Zu7E6RRR3CJtly5850OTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128078744"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Dec 2024 21:08:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN3LM-000E2U-29;
	Mon, 16 Dec 2024 05:08:32 +0000
Date: Mon, 16 Dec 2024 13:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 11/16] samples: rust: add Rust PCI sample driver
Message-ID: <202412161323.uc8c5aRn-lkp@intel.com>
References: <20241210224947.23804-12-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210224947.23804-12-dakr@kernel.org>

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/rust-pass-module-name-to-Module-init/20241211-065809
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241210224947.23804-12-dakr%40kernel.org
patch subject: [PATCH v5 11/16] samples: rust: add Rust PCI sample driver
config: x86_64-randconfig-004-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161323.uc8c5aRn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161323.uc8c5aRn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161323.uc8c5aRn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::pci`
   --> samples/rust/rust_driver_pci.rs:7:47
   |
   7  | use kernel::{bindings, c_str, devres::Devres, pci, prelude::*};
   |                                               ^^^ no `pci` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:86:9
   |
   86 | pub mod pci;
   |         ^^^
--
>> error[E0433]: failed to resolve: could not find `pci_device_table` in `kernel`
   --> samples/rust/rust_driver_pci.rs:33:9
   |
   33 | kernel::pci_device_table!(
   |         ^^^^^^^^^^^^^^^^ could not find `pci_device_table` in `kernel`
--
>> error[E0433]: failed to resolve: could not find `module_pci_driver` in `kernel`
   --> samples/rust/rust_driver_pci.rs:104:9
   |
   104 | kernel::module_pci_driver! {
   |         ^^^^^^^^^^^^^^^^^ could not find `module_pci_driver` in `kernel`
--
>> error[E0425]: cannot find value `PCI_TABLE` in this scope
   --> samples/rust/rust_driver_pci.rs:63:51
   |
   63 |     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
   |                                                   ^^^^^^^^^ not found in this scope
--
>> warning: unused import: `bindings`
   --> samples/rust/rust_driver_pci.rs:7:14
   |
   7 | use kernel::{bindings, c_str, devres::Devres, pci, prelude::*};
   |              ^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
