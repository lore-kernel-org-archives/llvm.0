Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2D267AF4;
	Sun,  8 Jun 2025 23:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426560; cv=none; b=pWaGzkbuZEwHUdldUduVmhglS0qsoIJlucBUuvr4RRLub8pwwBstUR5ZXQXTNN6Q8FtQE8KeWDWgIN3boiLkOFxsEdxFo13g4u3lJew6VTbhQsgv2V+uJwYJf8Y5JzpeTle9ClyjY+Htg9Bk/67+Jrg8SBB2tswxPFI/LkWODBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426560; c=relaxed/simple;
	bh=YR2/9ArncA/4YVfIxi3YvnkWZ11EK5r4Ilksbc8qbK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKFln2/r1B6L4+kQVilJTPfjoltAMsvw5wMLaNmOKs+6mzqdVfkel1o86ILRWGrIc+tUPLtee+vnmyTgZjEHWJidezLTMuBBs/fy9FMUlU2Szf4fTKMGocuiRQGD6/bgM9o333eP8q5rju3JpoyszINBKCev8RPCy/QIXyDtp7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gz2NLe6a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gz2NLe6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749426558; x=1780962558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YR2/9ArncA/4YVfIxi3YvnkWZ11EK5r4Ilksbc8qbK0=;
  b=Gz2NLe6avUxylqkc2rdFrXwyOU0cj4nKOxnIfMnk1l5Vkb/GDKb0myeJ
   rdEhq+KieFPeLHsLpkVXwJNbqyv8Vo0Q75bHTKCzt1VG7+3mB8B+t+NsZ
   dXMxaafaiYAnOf93wxkQ3Sgq2TMdlzQR0wM5Jk+OwSKBzqdpPd+fRXddn
   mOfR+3/KDwQRupwQkPBy7/RZs1PWj0DR305nkjx+5gBXn6RPNINXvR5/m
   TfUJbpkNiFJm0xJ3DWc6wkHwHe32GE82ktpwoU6uivHiyjEy2KQK7Q7nc
   Co3DshgdjLeDIjZtuGILkO/qlpzUg8y63Uv9fMWK9uVinpkusN1D9jmYN
   g==;
X-CSE-ConnectionGUID: 2LPx46y+SXKqK8g5IYAG8g==
X-CSE-MsgGUID: yOSROyOVT5W9Zk6ezpnS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51494572"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51494572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 16:49:17 -0700
X-CSE-ConnectionGUID: vz2PVR/MQryD2sSf/SEaRg==
X-CSE-MsgGUID: ABWGZFkiTRSIYZn9o/r+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="151352313"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2025 16:49:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOPlJ-0006dt-1L;
	Sun, 08 Jun 2025 23:49:13 +0000
Date: Mon, 9 Jun 2025 07:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 32/32] ({ BUILDclang diag:
 _include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is
 already applied with different arguments [-Wignored-attributes]B
Message-ID: <202506090716.JryOipkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   8172857ac52869c411762ce86802d127b0bb7546
commit: 8172857ac52869c411762ce86802d127b0bb7546 [32/32] riscv: optimize gcd() performance on RISC-V without Zbb extension
config: x86_64-buildonly-randconfig-001-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090716.JryOipkx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090716.JryOipkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090716.JryOipkx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]182
   | #defclang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]i
   ne __clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   raw_cpclang diag: uinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   _read_coclang diag: ninclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]s
   t(pcpclang diag: )include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> ({ BUILDclang diag: _include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]B
   UG(); (tyclang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   peof(clang diag: pinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]c
   p))0; })clang diag:
   include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   |                                            ^
   clang diag: include/linux/build_bug.hinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   :59:21: note: expanded from macro 'BUILD_BUG'
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: 59include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes] |
   #defclang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]i
   ne BUILclang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]D
   _BUG() clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]B
   UILclang diag: Dinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   _BUG_clang diag: Oinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   N_MSG(clang diag: 1include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes],
>> "BUILDclang diag: _include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]B
   UG faileclang diag: dinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]"
   )
   |                     ^
   note: clang diag: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   include/linux/compiler_types.h:565clang diag: :include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]2
   : note: clang diag: expanded from macro 'compiletime_assert'include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
--
   clang diag: 547include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes] |
   __comclang diag: pinclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]i
   letimclang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]e
>> _error(clang diag: minclude/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]s
   g);       clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag:       include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   |                         ^
   clang diag: include/linux/compiler_attributes.h:include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   138:56: note: clang diag: expanded from macro '__compiletime_error'include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
