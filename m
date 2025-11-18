Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2462D94A0;
	Tue, 18 Nov 2025 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490809; cv=none; b=tUuNQWRJan2izRV6N6r/hehPRicM5y2tjnjIp+5pi6HHvwS7NLNVKkiSO36n9uTvfFJloukHqFjx9WVzjeKWFJQMLMKo45WvNBWmHZ7235B1EwE2OEF5u97rkwJwLbUcT2LV6QBVzuzxWaC6KpmCMxVm5R91xeRmk89VGdK3MWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490809; c=relaxed/simple;
	bh=JVwYByYVCl5zPmfDkJ2hQpPelXKojp9pjN4rBBEzTTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUTz+NW/2hvPmsFirwXOhtSA8G01KQ+lJ75Tx0Dp9B8RHqXpw4Gqw7R7QOx8prPd6eg9wergTBDSqGr8D7DL7ZbwGtil1zkjFhqWSbNMXaYrRJXSbopVomBqQ1CIp0fbPT1eG+Hi7PIU95vbIx0VZ02p5LZPiXT0COeuSV8C/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S13Ibrvh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S13Ibrvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763490807; x=1795026807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVwYByYVCl5zPmfDkJ2hQpPelXKojp9pjN4rBBEzTTQ=;
  b=S13IbrvhQsyvrwstQy2fmyoFWDMJo1hn3+l9CYpypa2dIwWkliq5TgVo
   XP1kNpWMvMMZT3DItgHIj2WwIIJGsJej+2v15S8Q8ZkVNf8CWpRJTUH8U
   O+HGU60JftH3g+bNhuCu4gcJ0TerYo7AKRUIqAhfZyp7UCgxX39gsZVjE
   WB/YhcseddCRhuknNukh7Pb9iO0JLDqOVAk9AlyFTScLzg/PFUASl8JOd
   8gRvBG3qxdKUlHYSdichESYuY4qohvSK4k1ZzpULkgKvTAN6mnXBbQInc
   sf0LcXPWlusipL6KIrPy8Nxrd9ploDWLI9oGj3vWJz2Jrw3k8AZJZpMc2
   w==;
X-CSE-ConnectionGUID: +xObzjrvSAayCCDKrR8CoA==
X-CSE-MsgGUID: Ti/65iLeR22ZuzKzEbMrXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83149867"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="83149867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:32:04 -0800
X-CSE-ConnectionGUID: y33yI55HS9OrJyt4hmKxsA==
X-CSE-MsgGUID: 3N3npXcFS06KMIfGDGycRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195283785"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2025 10:32:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLQUi-00025D-0R;
	Tue, 18 Nov 2025 18:32:00 +0000
Date: Wed, 19 Nov 2025 02:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: ld.lld: warning: src/consumer/drivers/gpu/drm/tiny/pixpaper.c:580:0:
 stack frame size (15992) exceeds limit (8192) in function
 'pixpaper_panel_hw_init'
Message-ID: <202511190228.rmGXuK8U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: c9e70639f5915f2d084a0126e62fe53a52c29cea drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
date:   2 months ago
config: x86_64-randconfig-122-20251115 (https://download.01.org/0day-ci/archive/20251119/202511190228.rmGXuK8U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190228.rmGXuK8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190228.rmGXuK8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: src/consumer/drivers/gpu/drm/tiny/pixpaper.c:580:0: stack frame size (15992) exceeds limit (8192) in function 'pixpaper_panel_hw_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
