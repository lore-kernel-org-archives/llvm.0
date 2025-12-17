Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868641DFFD;
	Wed, 17 Dec 2025 04:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765945096; cv=none; b=OEA5jKYEOXR0ogqKqNYDCZSW9JIaTqLj18TFL6ZnuxIVHvBd3Ch0cnur5lk2wU6ORPxrRbrZjAalowKx6VW1+bClunKqJSknYHTEglrrqGZWFU1S8mtsCov19YoXKQRG4jIrtxhip3KI+LvRAcvoDKihjfHFiRKNkHQiSIczMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765945096; c=relaxed/simple;
	bh=zjuDQ8gpO1WKU7cl5w7kHSJvQgyRxx5575sKyVR04gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uj86aHhRbiCGkeVAbH+StNpPPYLjdZuLuynAKb5OkOiou0kq5RiunJfnsQhh7AycMxRgG/KF7z43sdbQ8l2kW+M/xYLN896ryf2EGjWNjBA/xO1Q3FcwvncmHFcVYAG1wsQDZC8xFXo3ywCU4dJecOJfbH+nvFgdMDXWObIrxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7e7MdRW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7e7MdRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765945095; x=1797481095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjuDQ8gpO1WKU7cl5w7kHSJvQgyRxx5575sKyVR04gg=;
  b=W7e7MdRW6LOjkR3VbK6P3p3g+ne9xboSMD3b96U5nfHD4k/B5A9hFKm1
   cu2VUoM5s0SH+rnbLadE/aEWAr05c4dIgRP+GAMnkTXo6oDWY47YiBu0s
   QuUIiC3OQdLcCS+RhXrc9OCEa6QifEfxL56FeCOcGhyCRFSGzbdpC0KLn
   vgUc66nQXfFrZVoFtAP99fWozHpClwlDc6A/FNCoHj8m5pTVXXO4fqVLj
   CWlRU8nGHJkGodDHPQ7NQy28rAhMJTU6g7etOHR2tLmtekLVA5JmaEUN0
   gBlH5q7Yx6q5BRY5iSTfaPtrwQZkQkFIz+Bu8oKVJrIHIO8rq6sYKKH1S
   w==;
X-CSE-ConnectionGUID: bWY6qStpS/KSxeuk+SPqEg==
X-CSE-MsgGUID: RWuLqbOfQG67TYJQynBT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85290053"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="85290053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:18:14 -0800
X-CSE-ConnectionGUID: nQ4PBze+T4+/y/uSOs6ZTw==
X-CSE-MsgGUID: rLEGtNupQ8CU1UMhPxz1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="221579632"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2025 20:18:12 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vViz5-000000004Af-3AJX;
	Wed, 17 Dec 2025 04:17:56 +0000
Date: Wed, 17 Dec 2025 12:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/deferred-page/v0.1 2/2] WARNING: modpost: vmlinux: section
 mismatch in reference: kho_restore_page+0x1ca (section: .text) ->
 early_pfn_to_nid (section: .init.text)
Message-ID: <202512171225.Rk2wTxgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/deferred-page/v0.1
head:   db27b2424d1b2318cab0f62dae80af589c758a3d
commit: db27b2424d1b2318cab0f62dae80af589c758a3d [2/2] kho: enable support for deferred initialization of struct page
config: x86_64-buildonly-randconfig-001-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171225.Rk2wTxgr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171225.Rk2wTxgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171225.Rk2wTxgr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kho_restore_page+0x1ca (section: .text) -> early_pfn_to_nid (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
