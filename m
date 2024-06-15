Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B57C1870;
	Sat, 15 Jun 2024 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718486566; cv=none; b=TIkYCzNmRMlIbM4ncRPXOFjfdva93VRbMxXM+dClOtKZZLUkocz6LSFR8E9wMlYUKG33BoR15oZBcx/d4z5abkfODjAWWGJ3RzGQlJtgN3lp68OIa6SrgqdkkXVz0GW5xEeGmbR0BdAd54YC7i4G2kIE9LW8V8WV3gsaXLXxejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718486566; c=relaxed/simple;
	bh=x1lWxE4yDf/J3NIPxBhUoWWKjVEhI2bd5Vy23s/3juQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2d2txRqAeVcx6BuDNc79W3fccRhxLwWLUFBTFPF2n57twA0qo5TEMy3ChLc5u7T2J+6L9IzlMZom5co4zN/xvuyVkHW2e/Lr4FipdEOpOVQppytQe6Gd20JCoFTpoC56EnO68ivhvTaUV6eiScvdripkI0LksrRZK4iaOxG3xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbM8WX9D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbM8WX9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718486565; x=1750022565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1lWxE4yDf/J3NIPxBhUoWWKjVEhI2bd5Vy23s/3juQ=;
  b=mbM8WX9DyhaGfYBn702/WxtMFG2jHN2KU//r665mR46Tx55qe6Y0Ryiw
   7A4S1/7Nf/DEmPYDOca2ft0rEfxKBUsW42XPaBYTeyfZSkcWiGqMgcuMT
   buFw1vGf3nhGrf6DoZrhgjyempTCLunKk3ZPFg0YDEXCps+i38CdDtODf
   bUZzww4/RBxgqdEE1ipYREKdSoSx/5D8gKbqF/qYY5Te14R1Y3CX+Rdk2
   bVDpB3/nzRjBuAp3ibM2VVVSJ51Aj4B8VTHqW3SPXphxPVqcVAzC4faLO
   RgUfncwUFSsQXG9fU68firnW2FbSMegCUke0D2xP2HCmGZ2tmEuRnN1Yp
   w==;
X-CSE-ConnectionGUID: 6Av/J7NkQk2AEVnXzzK79A==
X-CSE-MsgGUID: 7Q2kLKU5TtWDOcKisbFeDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19141972"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="19141972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 14:22:41 -0700
X-CSE-ConnectionGUID: /mos4FL8TIiybm/BGzr93w==
X-CSE-MsgGUID: vKVgfzfCQqGQ2s8656mCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40689517"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2024 14:22:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIar7-0000WE-2N;
	Sat, 15 Jun 2024 21:22:37 +0000
Date: Sun, 16 Jun 2024 05:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <walmeida@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@redhat.com>
Subject: [rust:staging/rust-device 5/12] error[E0425]: cannot find value
 `THIS_MODULE` in the crate root
Message-ID: <202406160537.FF7m5SCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-device
head:   6530ecc4ac729a040a955a5e2d13c37d671b6e5c
commit: e89012e5ba8514aeff4eb4c7247d3a98025d3201 [5/12] rust: introduce `InPlaceModule`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240616/202406160537.FF7m5SCK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160537.FF7m5SCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160537.FF7m5SCK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `THIS_MODULE` in the crate root
   --> rust/doctests_kernel_generated.rs:1649:1
   |
   1649 | / kernel::module_phy_driver! {
   1650 | |     drivers: [PhySample],
   1651 | |     device_table: [
   1652 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1657 | |     license: "GPL",
   1658 | | }
   | |_^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
