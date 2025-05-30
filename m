Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57121B199;
	Fri, 30 May 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594992; cv=none; b=MxbmbOsBeRGrTc7ApgGzVQV7brm9qdpjsoKELILylsAmU5bFO0nyZl34/8RJ/fmZaGQCyL6ykzlmuHCxiWtFv1p6v1lkffvBuQgUgTpuV7stPuf+il7PjDhPoS3MJpVi6uMXqev3XNV3jl1tMMOf35qhAuVw63lkLdhL1l+prF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594992; c=relaxed/simple;
	bh=11WC83sSZ4eJ+tKiaQDjNqkqFB2JQ8SBa9JQnXsJGKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKkSZIEOflKBTjeXNJjrTAiaKK1ur0qYsUkIGrKwZPEDOwSGN9bKfqfpbTvRRHnlrypXMJWEKQ87sLoIUOokP2C0cRD0aji00bDlKGr4ezX5Y2UXZvvswORKFE2FFk3VnM/rOggm37eAKhTcyunZg1/FMfsHjXe5Wv2t8N0rEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0jhYKIB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0jhYKIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748594990; x=1780130990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=11WC83sSZ4eJ+tKiaQDjNqkqFB2JQ8SBa9JQnXsJGKg=;
  b=h0jhYKIB7zMnAW0+wi+UPWWTWNAxBn/f5bFTcVd/SARlZXEPIVqBDuDP
   y2Zf2uEoTDSvjLCQX68ht9+lbpLjyusBaPI/4TUyywLid3zs3O+0GyzBV
   GFle8ESBkRgT+CUk0G0lTr/nvPzhjD/15SdYh/dhKAAh14ovJQa+MFbjM
   eAIJhpfZczobzJLb88TQipiMu9w/tFdcYXRbsfaPKRcxZDhCeAykKvUDL
   0ZBAdWd2edGruFQZOT5hsSHs3+hOXm0YnBvabH2+YxGHufJL4G0aOLhJf
   x1grCrcDXMK42noY+AIsbgPApo4Rav4PIPTc+r9hskNiNC5BFu6/KglK6
   g==;
X-CSE-ConnectionGUID: Om6H+xR5RCu003G20mH40g==
X-CSE-MsgGUID: u7HFlfeHSOivxOm9pkiVhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54345550"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="54345550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:49:49 -0700
X-CSE-ConnectionGUID: LDOtJDDXSP+//d7qgKEKmw==
X-CSE-MsgGUID: 1J87hsfST4GiGgTsge4dxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148608280"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2025 01:49:48 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKvQv-0000rO-2A;
	Fri, 30 May 2025 08:49:45 +0000
Date: Fri, 30 May 2025 16:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sven/atcphy 31/31] ERROR: modpost:
 "typec_unregister_port" [drivers/extcon/extcon-rtk-type-c.ko] undefined!
Message-ID: <202505301616.z0CeUGnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/atcphy
head:   bb58cc6399a58218b8b5204a9fadf26f07c7f0f3
commit: bb58cc6399a58218b8b5204a9fadf26f07c7f0f3 [31/31] phy: apple: Add Apple Type-C PHY
config: um-randconfig-2005-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301616.z0CeUGnx-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301616.z0CeUGnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301616.z0CeUGnx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "typec_unregister_port" [drivers/extcon/extcon-rtk-type-c.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARM64 && ARCH_APPLE || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   WARNING: unmet direct dependencies detected for USB_COMMON
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [m]:
   - EXTCON_RTK_TYPE_C [=m] && EXTCON [=m] && (ARCH_REALTEK || COMPILE_TEST [=y]) && TYPEC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
