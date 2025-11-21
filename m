Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE108335BB2;
	Fri, 21 Nov 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763711913; cv=none; b=GmC/wPkj21jq9AtFSBL8lQFDQXWGoMG8o4eGniqpcKR1jqIlPq8P8ToANG9HD0qqNfgpzVn8pxcjWGrwpAGoEPc8B9o09JWZemCik7hhLy3Dw7l5kiOj27vbC5PbFdgBZHm6peb6rz3XV4lmDrKnLb4OT9o8mHlBpGFITc3wi/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763711913; c=relaxed/simple;
	bh=1EOObf89RHEBN2xH9tOznr1vsmOO8OzQvIxuZAkddoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BdEgKg0V4iff2BX+ZScB+u0/WlZ7L7FY+BXCfBrAFqY+KA9FSLGa8Zhm41/4oPk7ccvey4pxsJpUavDohfEBGq+xzH9sH8Q04GSAp2jWGmyChqq8RqYUC2lmAdo30szLGvAnzK2f+tkgUYYhlRL4Lr+eQccYK1h4F2ojfsjhgOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTLlCxaI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTLlCxaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763711912; x=1795247912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EOObf89RHEBN2xH9tOznr1vsmOO8OzQvIxuZAkddoM=;
  b=CTLlCxaI8D2pJQp+J2IWyujkD6YOFeKmBGF01YCxnxxqWjBIJXERR7LY
   1iXLrO5j6ylpcq/KB8D3uP4BMw7BJ85sHHFubPtVSSqsFQkodtJQg3eGJ
   Sdyq4OFHdLLzud9MNhfpFAacnwZTPQX2gWlbu+cTvjffuIjkgMkRLMOrm
   Vqq4ITI3naQfHqrvvjkgFmg0hqSoj1ehfjho3pMYwjP5rXAAhA7mYlR1y
   CwRnsHk9aPoAUmM8Hh2CIeIMSTENWrqLs9Z/cnPfIysTWSpRw6ZktGB8H
   VNbeiUU+jj2G2zc2wvHNhRildZ/ItyU5wOjeMZzsRZ0lfbZKlJx9Y+PwE
   w==;
X-CSE-ConnectionGUID: qbdqMNSGTfC41XZLyeqVjg==
X-CSE-MsgGUID: wls0FDdUQ6GqUcLWBTIsnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69413039"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69413039"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:58:31 -0800
X-CSE-ConnectionGUID: 2B2RuRwkT86VXvcJNc5GVA==
X-CSE-MsgGUID: Lt3mgF6bQfaOgQr4mMxVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190913431"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2025 23:58:30 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMM2E-00055x-1Y;
	Fri, 21 Nov 2025 07:58:26 +0000
Date: Fri, 21 Nov 2025 15:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: error[E0609]: no field `class` on type `bindings::pci_dev`
Message-ID: <202511211509.8aS3wqpm-lkp@intel.com>
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
commit: ed78a01887e2257cff0412b640db68b70a2654dc rust: pci: provide access to PCI Class and Class-related items
date:   3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211509.8aS3wqpm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211509.8aS3wqpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211509.8aS3wqpm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `class` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:471:51
   |
   471 |         Class::from_raw(unsafe { (*self.as_raw()).class })
   |                                                   ^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
