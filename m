Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562C43173;
	Thu,  2 Jan 2025 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735862377; cv=none; b=KEyAevSgl5Uw+OTyMTL7bzEBO5WEs5Fhcd6B5S724wuuiguZjeekLPwMmLmmBrP5Epmtxly5sHqgUkwEMe9//YgtEl8DCB3ZTUZR0GCtitMjKA2buK+pvTlHopk0GcRLejwcAy7ZU7Cr0mgJXIzHtbqvqrP6Gkrc2pzStHs3cOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735862377; c=relaxed/simple;
	bh=m2XR+o72/0/ZmVylmsugDZ5iQ5PDvrgrSbjZQgk68M0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUiXfN37mlIcPFZmsym63d60ksKv7bCyww879H6dgnoLYMKy0DmTo+wz3Yv3Bnkpxi51fWt7g2qfnYWFTL5tNh8N2+68N9xZRAtLMqVzl2Xh0EwShndzQpmmvA9nUGlyXXGw7OW1OJ+uX+loUD//qzGrb9CZ3X8qPOWT787HJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XF+44xT3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XF+44xT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735862376; x=1767398376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2XR+o72/0/ZmVylmsugDZ5iQ5PDvrgrSbjZQgk68M0=;
  b=XF+44xT3O1Ji+PM1puKS2rvGRyOhfRM3GBoVXbShn+efi8L1FzUp3wze
   V2mWIvelaiVIFm64HcfSrnbeOoueO4UHjvXIusDN6a1hfeTrbuCOBOMj5
   qrUElQ3VGR2hkSBF/9HGl+qI4UPYqOPJRtpCi/tOF68IqPa+XaCHB58vO
   Z2B76lSa70iUzFiK/ZZ6IG25c3BAkXliCj+9F3fZhZhcrZ0pwv0HbIiRZ
   Q0WudXVKCuiNCNimNUIjPVfMtcoc7M6OPj806xhAxxvgrK8FQnf5HuZ7T
   E8hNW4aSnH7W1CiozXGQIBmzr3v9R9anO3ELrdYFfe/lpzyOrvDvdhBv9
   A==;
X-CSE-ConnectionGUID: +9YEALALQZSKq9c1LYUg3A==
X-CSE-MsgGUID: KQzv6o7tSTuQ3A6p0tnxSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36014751"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36014751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 15:59:36 -0800
X-CSE-ConnectionGUID: V3H1+PrpRoe1VD1IZYWciA==
X-CSE-MsgGUID: EOKqf0FaRBO2hu2+3E9DkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101825355"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2025 15:59:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTV6B-0008yd-3C;
	Thu, 02 Jan 2025 23:59:31 +0000
Date: Fri, 3 Jan 2025 07:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-next 20/29] error[E0433]: failed to
 resolve: could not find `pci_device_table` in `kernel`
Message-ID: <202501030744.4ucqC1cB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
head:   86a5f32ed8813d5534d3d6c77aad29184a9f99b6
commit: 685376d18e9ae2f08ab6ac36285dc3a949c8cb77 [20/29] samples: rust: add Rust PCI sample driver
config: x86_64-randconfig-005-20250102 (https://download.01.org/0day-ci/archive/20250103/202501030744.4ucqC1cB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030744.4ucqC1cB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030744.4ucqC1cB-lkp@intel.com/

All errors (new ones prefixed by >>):

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
