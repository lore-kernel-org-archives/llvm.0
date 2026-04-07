Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CED375F97;
	Tue,  7 Apr 2026 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534259; cv=none; b=CC+qwXDspB0CYpHv0Xr2dt+wCImDqKwGA4AzkD/VX3OGUekQ1TYFWQ99Y+tLUZrGbUKlFq05MoBn7Vts4+05uqB/GV7MUbjhMsns3fVRE3ne28pviiX/WDyICMLDvOjZyoti5ZoBS3awdbVsMXTs82ge1hc15+AEegdbPy+3HDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534259; c=relaxed/simple;
	bh=Mpo9A58qi3jAnvQ4NX+kv4qrjhAF2KCbc8BhuKJdvlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RpKjDym113yKWTq44qyuBO4VDuLRFtTj8sOQkZic7eXXo3dMNwiBXdiQ1pMo4/dDbg0IbhnwH6jlsKL2B0xCZOfv3UCKB3Om+b0heHKPObrCzYQbbpvll++tWp0K5Wa4678RfDqu/bIKc2+B1iTl7RPkVLIZE/mnXuib6mWbJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWD+9TUG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWD+9TUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534258; x=1807070258;
  h=date:from:to:cc:subject:message-id;
  bh=Mpo9A58qi3jAnvQ4NX+kv4qrjhAF2KCbc8BhuKJdvlc=;
  b=QWD+9TUGRZQPBHAbKAJ3ergJU3AedRAXVP8OwXXXmdVfRVSgF3lB7vIj
   g6sbefOEI1E9zO15Xm/ASKodHMxfMjtkX5Sv3nllPv9oiaW5nhxLf6C8v
   tAsW3BTvUKP6nkEDoqmLD7bC3pP0aE0knmAs4VsZEfHNEMahPFN0HQay6
   RXYXx+/VFTubSbaSQXe+zVKz66ddKNcqEtCZZg2UnYpU8vobG+CoInJfW
   9oBODknmazlNrhFHmz+YMQHUP1jrA2tDfLxq4+Eb6DdpzcZYgwD9hI42D
   qVS5qmWooYPvmNmY/WCRtX2Jduhj2bynOe6a4fuEbUlgCWVK8XvBgNPO6
   g==;
X-CSE-ConnectionGUID: QsP4lbUXSxyxCuZdB7Vn3Q==
X-CSE-MsgGUID: u/bm2FJxQV2+rlmAPlQysA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081094"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081094"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:37 -0700
X-CSE-ConnectionGUID: 9L1T0dxLTLmEr+m7zdfdQA==
X-CSE-MsgGUID: DCTdB9B0SP+DNpGI5jxrQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995297"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005T-3kx6;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 17/68] error[E0433]: failed to
 resolve: use of unresolved module or unlinked crate `std`
Message-ID: <202604050527.k349kbPq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 59f3ec049634f1b22d7d6078e833fb5f21a71c84 [17/68] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-randconfig-073-20260404 (https://download.01.org/0day-ci/archive/20260405/202604050527.k349kbPq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050527.k349kbPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050527.k349kbPq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: failed to resolve: use of unresolved module or unlinked crate `std`
   --> rust/doctests_kernel_generated.rs:962:11
   |
   962 | let iter: std::vec::Drain<'_, _> = v.drain(..);
   |           ^^^ use of unresolved module or unlinked crate `std`
   |
   = help: you might be missing a crate named `std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
