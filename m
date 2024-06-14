Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7741C75;
	Fri, 14 Jun 2024 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718409511; cv=none; b=fpqqCa111gIqFEC0rHIlQZ9Vkn8eCeVktdy2R1R/nn/a3ZNLsfn3eNZ4bJbC1/ZIh+u/qmahPtdfc5xsY6QTybS2uPnWEi+2Us4o3gtVpUQN2B4OO4pi+S99riWnh1m78ynz1XPazJyAMzx5eBxqqa5/zsCwa6iokH1Yl15qAG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718409511; c=relaxed/simple;
	bh=99uB7Cd/uOD/uoxvs4cOs2zbalcob2jqxeYr3FcXzhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gC03KWGC9wf0UCWb9IbBpPu/LU0MLCWebTVzwQ/90aEYpoOmY0lh6KzT9+Rv6p777XP5DY5O5HKB8ASGwHvcVFvcFLdY+Sh9ZS1aGlksUII5Mt9GMLttDeEmYcgPl72KL0CPoVoeLTyQZnfSzgaWxc3K3YO9xKsbEXaEThhn5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5AC/MEx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5AC/MEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718409511; x=1749945511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99uB7Cd/uOD/uoxvs4cOs2zbalcob2jqxeYr3FcXzhk=;
  b=F5AC/MExDCO6cli/R1nkSLBGux994jQQeQloDf3Er4rcIUt+qDNt/EEp
   Baz8BXMP36eSNX9X7oZXBsuI2Xc3f9vSK3hW/c3c7rxY51N69gS1F6yeB
   f7deJuhE36G0HaH/sBbPwQkC3RjdCChtM7SMURYgu+gDzRM5dxj+E6py5
   UBQMYd829a/wRhNA/191I5YPJwiojN8gqFgXVbvjzSXzIHfpyDFq4Bt+s
   IxE8+qlJGYFjJYYkqNuSuGMuvI7roCOAO9Wh+/5SzGaVac15OocTwa94/
   VoIh91HGauWHzGx4niWDFuGBjbcEvAw0aFrzBaBy6CnWaHSknAq+AGJCc
   Q==;
X-CSE-ConnectionGUID: 9AhOToqVTBqC8P19I3psjA==
X-CSE-MsgGUID: f6YEoFatTBCM3szhsQflkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19143787"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="19143787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 16:58:30 -0700
X-CSE-ConnectionGUID: s7eKz1ViRzW+lQaQsi6rIQ==
X-CSE-MsgGUID: PLEkrzrOSRi/OdhW/NA6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40754516"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2024 16:58:28 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIGoL-0001vR-2U;
	Fri, 14 Jun 2024 23:58:25 +0000
Date: Sat, 15 Jun 2024 07:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [drm-misc:topic/rust-drm 3/21] error[E0050]: method `init` has 1
 parameter but the declaration in trait `kernel::Module::init` has 2
Message-ID: <202406150700.bk4MlPf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   0a137e568c054362d0988cd65c2960de3172ff41
commit: f79700d8c6eee68d6d2c0eb92113211d22501860 [3/21] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406150700.bk4MlPf7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150700.bk4MlPf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150700.bk4MlPf7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> drivers/net/phy/ax88796b_rust.rs:14:1
   |
   14 | / kernel::module_phy_driver! {
   15 | |     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
   16 | |     device_table: [
   17 | |         DeviceId::new_with_driver::<PhyAX88772A>(),
   ...  |
   24 | |     license: "GPL",
   25 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static kernel::prelude::CStr, &'static kernel::ThisModule) -> core::result::Result<Self, kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
