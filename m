Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E016DC28;
	Tue, 29 Apr 2025 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960473; cv=none; b=e0L7JwK9W5iQVpNm/VOGcUEbotWC9KRGO7x/bFNiTRC5yu/20Py0lnz6Z9FhY6S6PVfpBP+v79qeTHFsQv34tqQuVENHOObG/EhzHteW+OinoMRsT1gnGiKrJOGt62LOs9s4O+jbJSmDfQXJOB3aOP6Fy/FZPr+ujb3OhhlpFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960473; c=relaxed/simple;
	bh=8NPs19GRqDAlN4gd1C84gVc/e3xXY9E3fk3G+ADSQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/d7PnBP7hzeq5zuM0I9lHlSMiFdd+uGKcb92+Oid2kRsNLrLcBdYiNsiZ4aDCWlhB/me75m/1ivhL4NnM/6Ckz95YjLVkkg1VU7MfueCM5ZLp3FPu0YcLbo5DR8IDOB6+kRkGJ1EEChW0H/JA3GhLYghGmb2JEYXkTv3XCLe7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjW+blae; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjW+blae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745960471; x=1777496471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NPs19GRqDAlN4gd1C84gVc/e3xXY9E3fk3G+ADSQS4=;
  b=cjW+blae/6I44pwghVPx8cT9x2+Nodnkjw5G/cuP1vf43wRwqeGz+n9r
   3WT4lBh1pXzIcUOzGFXi5p5xRgKcCrZvC3YVdPNwVNbKTk99NlULU5thk
   XK0ZuOfQrjgPiL0cOFg4eo2m1NaVxd3zVRKatb3Q+C9UIhj4u0V8vYgaC
   eJRchJ00X3sDq+sWmXQ8TAIBmxVLvj0HJVb0ZCQWTSXhMTjNy4Dznp5Hd
   klhLp8A1vM3Ker/iunkz6eM22fVsFS/mk7TuhsXARh2Kpdc99eydjyZIE
   6tYNf/vST3YfeJI5QBQ+OohQ6Iyw0/QOzTcOsQ6TGk1/JSx/fqdPG95pu
   w==;
X-CSE-ConnectionGUID: J3kiG3sxTdWUnfELq9aNCQ==
X-CSE-MsgGUID: rmhOxiJxRh28XaR9s693fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65139410"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="65139410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 14:01:10 -0700
X-CSE-ConnectionGUID: bYULjHDQRtO6bZ6ZJOo3EQ==
X-CSE-MsgGUID: HZQk+DNcQdqFB22RxiGpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134883724"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2025 14:01:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9s4g-0002wN-3B;
	Tue, 29 Apr 2025 21:01:06 +0000
Date: Wed, 30 Apr 2025 05:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks 15/15]
 <instantiation>:2:2: error: unrecognized instruction mnemonic
Message-ID: <202504300459.y3FBPyKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks
head:   ff39529daf16e0cce0e73b67f31f970453c27415
commit: ff39529daf16e0cce0e73b67f31f970453c27415 [15/15] HACK: aarch64 dynamic stack
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300459.y3FBPyKB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300459.y3FBPyKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300459.y3FBPyKB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry.S:582:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, t, 64, sync
    ^
   arch/arm64/kernel/entry.S:587:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, h, 64, sync
    ^
>> <instantiation>:2:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, t, 64, sync
    ^
   arch/arm64/kernel/entry.S:937:2: note: while in macro instantiation
    generate_el1_vector bhb=1
    ^
   <instantiation>:7:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, h, 64, sync
    ^
   arch/arm64/kernel/entry.S:937:2: note: while in macro instantiation
    generate_el1_vector bhb=1
    ^
>> <instantiation>:2:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, t, 64, sync
    ^
   arch/arm64/kernel/entry.S:938:2: note: while in macro instantiation
    generate_el1_vector bhb=2
    ^
   <instantiation>:7:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, h, 64, sync
    ^
   arch/arm64/kernel/entry.S:938:2: note: while in macro instantiation
    generate_el1_vector bhb=2
    ^
>> <instantiation>:2:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, t, 64, sync
    ^
   arch/arm64/kernel/entry.S:939:2: note: while in macro instantiation
    generate_el1_vector bhb=3
    ^
   <instantiation>:7:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, h, 64, sync
    ^
   arch/arm64/kernel/entry.S:939:2: note: while in macro instantiation
    generate_el1_vector bhb=3
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
