Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B192CA52;
	Thu, 30 Apr 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540479; cv=none; b=F1tWvSaJNBDqpSwG/68kGJfcHb18ac/ZRCP/uWpEmn16ADZOIuKgEQPgjLhGVL/m5WcyDfCPjs0h2AAYXYFwXoju6r/Br/K3ctECnSRf96qFD0zclBPb4dked1ISL14+gbF5QpKc87/CmWdI36GOI5RHcBXB4kSFMQe1yeTyMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540479; c=relaxed/simple;
	bh=lzfUZdoIPxG/vxWtWAvK/W00h3YY1CXXzucfzaDvt+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unX9iHiG9zpEAxyxy4i/ZfK/k/Ud9NTWHvx/KLtQfk88P0j976eDXI28qQWmV1WllMUyUi9lyyLtlpNhTecG29eM0303DMki3a1vUfmf7j/LF13i5j+PomgYpsr024OPPsmYKqrUWcTGICq6SZIfkm1ReKhtgg47CdSVoPtP4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmIf6cDZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmIf6cDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777540476; x=1809076476;
  h=date:from:to:cc:subject:message-id;
  bh=lzfUZdoIPxG/vxWtWAvK/W00h3YY1CXXzucfzaDvt+M=;
  b=FmIf6cDZleMP9My+VBevV/jpiqmfXUXMHqXriIbVGpX+8bU8AwHe2X7a
   iDP0v/koXLp0v5rL6uuvr5x8H/oi7hF1pC1N1LfiGo1VFLjM4ecxArUQg
   usF4rk2T1Dou2rjWh1ifb257L4zFc0ODXpWaS8kIoTz1tWwFFuYyO1dSU
   GP361BuHkjIHqmiKlVwMPxYgQF2LowE05D+YDVPRxBs2RsXIvFCvJmSie
   H4WnqRZb7ewfefe0Yuxzzl9kUpWnkCHqp1PdAYjZ2MkGrEjuGFLj2ZPQl
   uGtOLztuFY3RPQK1n0kW9Whh7YvaLl1UVXFIhzTxUrnkEQbNU7krFPZjF
   g==;
X-CSE-ConnectionGUID: Aaku0bOfSNih9UgJ1okgHw==
X-CSE-MsgGUID: iXRfv4o0Tueq+ajKmBVaXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78378400"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78378400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 02:14:36 -0700
X-CSE-ConnectionGUID: RaTjWuHpR6KS7K/WRGbpVw==
X-CSE-MsgGUID: JN+PxAvnQM2Uv90Bct0LAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239517657"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2026 02:14:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wINTc-000000004mz-0eop;
	Thu, 30 Apr 2026 09:14:32 +0000
Date: Thu, 30 Apr 2026 11:13:57 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/memblock.c:1837 function parameter 'nid' not
 described in 'memblock_alloc_nid_user'
Message-ID: <202604301114.eIacbOX6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a586b345757dd389b6a3981b387cc4b39c538fab mm/hugetlb: make bootmem allocation work with KHO
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604301114.eIacbOX6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301114.eIacbOX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301114.eIacbOX6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memblock.c:1837 function parameter 'nid' not described in 'memblock_alloc_nid_user'
>> Warning: mm/memblock.c:1837 function parameter 'nid' not described in 'memblock_alloc_nid_user'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
