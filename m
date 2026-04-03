Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0874283CB1;
	Fri,  3 Apr 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205965; cv=none; b=QfchaeXn5U3wsWyYV4yhkxB8+JjY8B0sUvA+O4V7bCcHyR13dajMAsAhLhTPMCb2Dk7nIVep/cMSrH5nVz4vuaquHOhd0WO9r0lhdCE9RNM14xG5Slw18BCjG/WLIjZHBi6XfWZoBYAvGPk2VTH6eFmJYP4dC2dbAI+K1Ub/WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205965; c=relaxed/simple;
	bh=f63N1e+CPT/JZ57sPth+1/5onXLZR5NO+mPxVuu0orc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=McDhS/cy/5NeeueZk/IRb9bpGQGdBLgUlFhRR83i42ih2gpCVqqSIxRoR9UlO+bl8P+LfgA/zhBMKg12QMGTzdpIxyORQYDMFSchjaTdKEnSVNZaxToezUNXK8rGj7K+5rMfpfS19c1drV5Pn7FWoUkEyv2H39gGdqiy49QdNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4yjL3/t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4yjL3/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205964; x=1806741964;
  h=date:from:to:cc:subject:message-id;
  bh=f63N1e+CPT/JZ57sPth+1/5onXLZR5NO+mPxVuu0orc=;
  b=j4yjL3/t6sPncHjxISndRKYVDQNERa3pb8NdP6NhPDdz1S+n0kXroAY2
   4PWKpTcObGGxa3GKhRYIl+SIrXzqSH+BrUGaItmKnz49C9NjFdcMwDVKN
   EQcRnDuNZcOXYycm0HI9voHl/tMHBsiaRW51yrpEDeTGX3P2cBAzw6qBa
   98c4wDUjtH0bp93A5jM4yCFtAP19CJ5BccHoHDESZok9xznSt28BS5bE7
   Pz9ub+IyZrDN4qmoGFxFGy8NUSB6VOWWxDOMrstfcm9n8PDV7SIX0QRRx
   M04mcSeXvF4YFr9+h6yITCAaUt08dIYW5sX4zZQBcNo/pd2zwPMuaAAv3
   A==;
X-CSE-ConnectionGUID: 6IkBXs3cSX2+vOC8B3w0ow==
X-CSE-MsgGUID: q/gk2iKJQr2E4Xjc4uurdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889038"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: SRk9WSEAS0GvDccAGqLxWg==
X-CSE-MsgGUID: IVp0hdNcSMmxClGfqx5/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226369012"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000016J-2jip;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 2/53] error[E0063]: missing field
 `tlb_add_range` in initializer of `iommu_flush_ops`
Message-ID: <202604031048.e8fDziRK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   386de42c67a6d6b567ec9167593768eec79b8ce5
commit: 8d60c0982024bbd9eb8a2e118fc8b55e67b0edff [2/53] iommu: Always fill in gather when unmapping
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260403/202604031048.e8fDziRK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031048.e8fDziRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031048.e8fDziRK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `tlb_add_range` in initializer of `iommu_flush_ops`
   --> rust/kernel/iommu/pgtable.rs:225:52
   |
   225 | static NOOP_FLUSH_OPS: bindings::iommu_flush_ops = bindings::iommu_flush_ops {
   |                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^ missing `tlb_add_range`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
