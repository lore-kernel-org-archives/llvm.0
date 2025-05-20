Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183B4A06;
	Tue, 20 May 2025 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743696; cv=none; b=lH5ZpeS5bJEEsiL6Czd+iJ1hddpkdCjnqCBj1LZ5CL9+uLYpSdo3ezCeAY1QN2QVLkIT0k3hczWZ/8lIdUoAIbYOTjEh+qvqT3uYdL3LqGiM8tPXJaXLI4nfkXHq5zmCvDTqLNWE2RBi12QT09Pje87NhDG5UVnXngWr+Ck3+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743696; c=relaxed/simple;
	bh=oTmRk/Srl0nR5C4WJZ/QDtH0cRof1QTR4D+1ez+LjeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4zTlg0djLi2adt3SJdpUuGMAsjJi/QPkOj/NPu22+Ve9NSbRAcgTpLdZTeZxoZohGQH5J/iTWh0+mz0zrVe8PnGEp85M6ch9aCnM3QLFmr7TT8KGE0sh5G7G+KSv5FTRgt7XFmldMd06/lSbHf8SKYD0RbjpNm07B8HphYadM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlC0ECyA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlC0ECyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747743695; x=1779279695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oTmRk/Srl0nR5C4WJZ/QDtH0cRof1QTR4D+1ez+LjeA=;
  b=TlC0ECyAyiNX7eIEr3gegGZReWACRid/4Dm4YVpqIIJE31MCJv/Httfu
   nOAq2RPUz3YiTYNyKgaeJzsu0bIgBY4iNEnFyMnQ7Wiw4vetJIj5xEUWf
   xZOj4JqI/EiNqcs+iFnorIojSkRqWmedn1+CiUlF9zNyH3v72taxMj46p
   MZxkKtunadmPPEm9MWhJWSINij/ye/RX5r6zI8zIcGSbMMNpJqJcSxZQa
   7+dMW7UWoAsLVBM4Xt3B9Zp81RwqQK9NvWYRZILEA51k1zxEHfaDQYWup
   ESkLLIne2Rk55CfiptwtIUUonTsneLBl2WMxUuCr8lL5FJ09KzXtpCFrE
   A==;
X-CSE-ConnectionGUID: a6t78v2FQoSfkn4ZkWkLww==
X-CSE-MsgGUID: Ar/dbYpaRb64Xeex3R7lvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61069247"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61069247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 05:21:34 -0700
X-CSE-ConnectionGUID: UJTeQrpwSpaNONXLLB/xdA==
X-CSE-MsgGUID: 5KvUs5owToWI8HDWj4oIvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144932688"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 05:21:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHLyN-000MZI-05;
	Tue, 20 May 2025 12:21:31 +0000
Date: Tue, 20 May 2025 20:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11661/11779] error[E0432]: unresolved import
 `crate::clk`
Message-ID: <202505202016.3Hj5hZ1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 42f7134aebed505e36c8f8333aac141ed49bc8f6 [11661/11779] Merge branch 'cpufreq/arm/linux-next' of git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
config: um-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202016.3Hj5hZ1g-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202016.3Hj5hZ1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202016.3Hj5hZ1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::clk`
   --> rust/kernel/opp.rs:12:5
   |
   12 |     clk::Hertz,
   |     ^^^ could not find `clk` in the crate root

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
