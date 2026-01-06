Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8130B518;
	Tue,  6 Jan 2026 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686628; cv=none; b=KmlhOXbs4EkVr8LI4y0tC9pWF6l7vs/X+6iiKYw+IiljRqB7Uj+7sEOh3QMWLxGBrzUXekKcHy9kHgbfpuIOdAvXdhgMfFpiA74dYQVYdH7t4N+aqPaAHao5ocnRz5w/UGfQOijwayPXbWljITdei0FRnPGpXuDDQK9ttI3thxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686628; c=relaxed/simple;
	bh=PYTG9UkEpmWzDyfSSHQvdr2yMY2KoBg9cKyPr64hNaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7bV5RrORS4UycuxdXHe8qAnu+/obby8l9xytzi3k2xvzfuvumRtDFg8GckdR9m/RePItM6AcGpivGuoBPUgMTsV0FK4tHKJlv3nv8Z4F7YxwL3JgL70CnAlseHyGRLoiXeIRkMgvDPU6chfcr0bbu2jJgrNMvggmZmYCkq4RUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VirpBRUL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VirpBRUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767686626; x=1799222626;
  h=date:from:to:cc:subject:message-id;
  bh=PYTG9UkEpmWzDyfSSHQvdr2yMY2KoBg9cKyPr64hNaU=;
  b=VirpBRULNvKS8CSdZPQU3qRxuGyq/Ets28DXvr9/PIUD0dH32f+Mnjmz
   JtaGtlKpYLI4gHgVcwCAekzG9Z+Hb/tpKC4sDfPFpMHMFV8pfoSD4ek3N
   RNJw1QTKgnYmvDlklWjVYowOEWF+t40zrWwVnGA1F+rPLjuXmRW94sHfq
   Lo1Tyu8iNuYJdYtvKd9BuJPEnL37IUmB6rBNPZTCPph/9blNvqMcVMgB9
   wHjZOmc1P1PxU1abV9RB3Zmq1chG3m7k4vnt5v0kdTncj5jKbQegWryTV
   QB+jOWz/aLhpWh5sAfwhCp1UcF4Y8i+omgGULN1F8XgaxHug9Y0GfIKrt
   g==;
X-CSE-ConnectionGUID: eu0ns0xMS4eC8bQTj2N8bQ==
X-CSE-MsgGUID: l/HJvH70Sv6b98qVf+UA4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86637689"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="86637689"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:03:45 -0800
X-CSE-ConnectionGUID: McWXq5meR9+mnvlII64uZw==
X-CSE-MsgGUID: OkNQrmLeTzCfh302ikLtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="240085970"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Jan 2026 00:03:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd22Y-000000001HV-124Y;
	Tue, 06 Jan 2026 08:03:42 +0000
Date: Tue, 06 Jan 2026 09:03:13 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v2 6/9] Warning:
 mm/numa_memblks.c:216 expecting prototype for numa_add_memblk(). Prototype
 was for numa_add_spm_memblk() instead
Message-ID: <202601060942.ekTlV8Yd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v2
head:   6b68def975cda87017567ab015c605ab968219f2
commit: 7da176c9c704c86af78a82427b86c780fcd7153a [6/9] numa_memblks: add concept of SPM memory blocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601060942.ekTlV8Yd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060942.ekTlV8Yd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060942.ekTlV8Yd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/numa_memblks.c:216 expecting prototype for numa_add_memblk(). Prototype was for numa_add_spm_memblk() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
