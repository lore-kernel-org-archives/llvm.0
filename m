Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4037B024;
	Fri,  6 Mar 2026 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792431; cv=none; b=szaHF8gAD+dcguZYIvOUaUli+AXNcJl44RlTaUrTVGvfSa1rGi5TZHboaIIFCGP225S3VGk90D0cgPFomnWJzZGb6S+c7sX+itLalNaYtGZI1/MSX0FlGhOVtPsvQ1NZvfSBYxg77mzJipTSeIRyTnAwpH2u80SPCb+hjp+/DtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792431; c=relaxed/simple;
	bh=eXSivT1lkOOCGEWiA9HWEYZORAW6JCCvi05y5MarI+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Imlord9DQwoCyvYEJbK1qNkkOuD2u0icPH+MfDaC/MGx24wSOmKG4rPZsUlcJFRXXPhGolbwipYz9ahttYNw/rQOCql7KeYYUDa6gybRNFzThZYQTdv+XwguWvcxGYkT67b4hVdsvs3oarduruHjBBIkUBJ50TRac4R5c5WzZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+TLFW3i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+TLFW3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772792430; x=1804328430;
  h=date:from:to:cc:subject:message-id;
  bh=eXSivT1lkOOCGEWiA9HWEYZORAW6JCCvi05y5MarI+0=;
  b=G+TLFW3ivSRmT9YTZWZH6PtWkgq4aPpWewjG/PP70b2PUUQJPJHjDVm0
   UuzT95Z0xq2HVPkvDeRqiN3+B5NZTJhztfzcAfZWscOttqNpxE91eui97
   LTBhQEooItYzmMqt9ZMG7qIIA9KNznEaY7xYvircua5Jh99I/JHz5vRTX
   e+9j24LcMhg+CCHahYJegDFoYqA0cJlgOyDZP9kSdZIzDDRSAOF3dLMRm
   iS4v12ZhnRY1IqlUuQ9ZvbXxFdBNJBzcbZgg/VMJCjP3vKbxSGy4UMoku
   IvwF7c0XsXrzRHfHS1oR+OKozy1/7WfUVa9btYWLFD6ZouSpdDaHYdLr3
   Q==;
X-CSE-ConnectionGUID: FnIRFzm2RUiO+KTBAdUPuQ==
X-CSE-MsgGUID: EvsqP/o7QPun1GmORzczKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77499643"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="77499643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 02:20:28 -0800
X-CSE-ConnectionGUID: vZ3M3SuOSzKR48ELdVo02Q==
X-CSE-MsgGUID: CA31TczQSQyLswUpZzcLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="241979658"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 02:20:27 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vySIC-000000000il-3fN9;
	Fri, 06 Mar 2026 10:20:24 +0000
Date: Fri, 06 Mar 2026 18:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:free-late/v0.1 7/7] WARNING: modpost: vmlinux: section
 mismatch in reference: memblock_phys_free+0x109 (section: .text) ->
 memblock_free_late (section: .init.text)
Message-ID: <202603061854.VrlXakOA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git free-late/v0.1
head:   57b25b03a9652c639d3c8e9004a542ef17db0cd3
commit: 57b25b03a9652c639d3c8e9004a542ef17db0cd3 [7/7] dev: memblock, treewide: don't call memblock_free_late()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603061854.VrlXakOA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061854.VrlXakOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061854.VrlXakOA-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_phys_free+0x109 (section: .text) -> memblock_free_late (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
