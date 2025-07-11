Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B52A1C9;
	Fri, 11 Jul 2025 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752197165; cv=none; b=vF4bYy2OzemZ2y1iaf4gxUCrWsXUvhJgiOufKuzlzwRiQR32OHaipFsCFmGRaS9SHFkgDr12Q3+/rpPUbjDcuyen3eXghlOL6mdTHkXpt4Gv/CDZb93sPW2dHBqhf3+AyuhwaFj1uXfgyrvwtlcLS9uunjgdXyI/qpY75bsAMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752197165; c=relaxed/simple;
	bh=fLnH74+MxP3xTlrEkwjHrR+qnatQhfYxO7LTuLCeKd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldXabGLY/lUAZipazhngUP68CI/FlXfCvtPysOaEbgt9mNo2cf73nz1yX+496oDV4XBlEK2Tr3o9mEDBAQK2DdG4fQbD5yJU/2WVHjp8t/l+W6mV1Cxi/35jTa2Ool9L8NK1uwoK0OYr3CHKmYiq4K1Lj3WU/BTlo3rbARGX/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2RjfRVz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2RjfRVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752197163; x=1783733163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLnH74+MxP3xTlrEkwjHrR+qnatQhfYxO7LTuLCeKd0=;
  b=n2RjfRVzkMyMGTxyA1uLBTze8XwVZf/cwCBMvQlTfdXLxwfJpWf47JqM
   pILIFE4tgsI835iS6GJBtY3gKy48/KWsoy6leq4bLW4Ijd713r6R4Hst3
   6AT8hOtrNvZKOGmB9lr7WJqjXMCNOC8LXAEHjeJ70pWea/jOss5DdYSVE
   UIcWVdadRSaChukn/ygQiV56g9HL0hKB/c6H1nLC+8fdJUrnMV/ONFhMA
   vntySuBn9vdKzZs9oAAD2KH3oMmn3jDJdTgB9gaQOLtRR3JNKzBZ6dD4u
   mFmWZcgJPySzr6VuVPMfTtfEoe21XDl1UsaL05I27hcHzV/fKnOEAD+WM
   Q==;
X-CSE-ConnectionGUID: pnt3el17QrOKHzYN9yBjFQ==
X-CSE-MsgGUID: 5CuJ6C7yTT+azFCqtM1WNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65075588"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65075588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 18:25:23 -0700
X-CSE-ConnectionGUID: TTWp1XIvRs2DoD2PYpek6Q==
X-CSE-MsgGUID: hzlaDGb2RN2KPFxUSlaYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155660555"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2025 18:25:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua2Vr-0005iZ-2U;
	Fri, 11 Jul 2025 01:25:19 +0000
Date: Fri, 11 Jul 2025 09:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Antonino Maniscalco <antomani103@gmail.com>
Subject: [linux-next:master 6614/8625] drivers/gpu/drm/msm/msm.o: warning:
 objtool: submit_lock_objects+0x520: sibling call from callable instruction
 with modified stack frame
Message-ID: <202507110920.eBMJaHSX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b551c4e2a98a177a06148cf16505643cd2108386
commit: 92395af63a9958615edfa9d4ef1ea72c92a00410 [6614/8625] drm/msm: Add VM_BIND submitqueue
config: x86_64-buildonly-randconfig-005-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110920.eBMJaHSX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110920.eBMJaHSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110920.eBMJaHSX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x520: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
