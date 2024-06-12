Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB746436;
	Wed, 12 Jun 2024 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217072; cv=none; b=Etu4rSrYKnhLPQWfZAHxgfqaJyO/shz/VO1U9tbAy0Rbg6o8cSqi2DYBq//bI6KiRtCN63Kv55p2mMoSqV0q/iDTj8sVfgHBLIlE/ixaswZIIGdqkFQixvH8MprJp7ORQDBOtBHUElMrQ6xs2FL2ruOkLcjSjVt7ckSdsZItdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217072; c=relaxed/simple;
	bh=p3dWe+63QeDhzAeSSz5f4FpmOpXQTay3pv96SHXwz+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxcsEg8g4B1nM1rbQLj5uVZnbZSAzqdCPgC4BgrVlNY20J3d94SAt2EQRZEBgjX6ojDoqYovCd1xBkX8sfPv+pLClwPrbCWvouQWC/6r7JV1A6N0AV5ekqFPFpNPs2ldOANGDsFZmeN0KI7LGXVgC5u9yrsuPBCRav6VDrgh5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8nB5H6A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8nB5H6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718217070; x=1749753070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3dWe+63QeDhzAeSSz5f4FpmOpXQTay3pv96SHXwz+U=;
  b=A8nB5H6ADn7wfCtdN2Nqx3oSZbYt+QLpp2OFlVEAsEsMJ9MJ649cXr7i
   OQb2EHcZ70RWoB2/WVhiLfslIkW2S9S8YBSbSpbyGt1E21y8th1y/Qqj4
   gMCBFixmCL5EjNC5eESYHM6TaXKf31rWQ8EPt2LAI6jc83spx3FRGa1gV
   cC6DV6g08w5R9xZZP/Up6EJpfL8eusYW7AUdNgL5pVGrQRsi1UU5WZ0y9
   Lpjy0DUBgumo6iBHUNmnZ7vQ6kGvkrnkGOxHOXt8E2Sv/4eeExJ+pVXzk
   GFz3gHLRBprqgq5y/x7WlRqWagThrt33Tqc5I5pUVVbhRQf8aGNf4oHKi
   g==;
X-CSE-ConnectionGUID: nhNrUyqmRSKlQOFUlb4+bA==
X-CSE-MsgGUID: WPD4tREERIaCwACFfqZvKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14722619"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14722619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:31:10 -0700
X-CSE-ConnectionGUID: kkuxxgBnQEanR0lh1dGImg==
X-CSE-MsgGUID: T8L4/o74T5W2IPWNGBFmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44268202"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 11:31:08 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHSkU-0001ou-1d;
	Wed, 12 Jun 2024 18:31:06 +0000
Date: Thu, 13 Jun 2024 02:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [drm-misc:topic/rust-drm 3/21] error[E0050]: method `init` has 1
 parameter but the declaration in trait
 `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
Message-ID: <202406130231.e4T7rPcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   8f5d38cf42672216b6162952b8ad13a9b15ba78c
commit: 7d4e13685931d292d28484e486b5eb9ad7dba420 [3/21] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240613/202406130231.e4T7rPcH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130231.e4T7rPcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130231.e4T7rPcH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
   --> rust/doctests_kernel_generated.rs:1700:1
   |
   1700 | / kernel::module_phy_driver! {
   1701 | |     drivers: [PhySample],
   1702 | |     device_table: [
   1703 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1708 | |     license: "GPL",
   1709 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static rust_doctest_kernel_build_assert_rs_0::kernel::prelude::CStr, &'static rust_doctest_kernel_build_assert_rs_0::kernel::ThisModule) -> core::result::Result<Self, rust_doctest_kernel_build_assert_rs_0::kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
