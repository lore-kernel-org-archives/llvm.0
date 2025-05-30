Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A58834;
	Fri, 30 May 2025 08:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593730; cv=none; b=sKV8pSHOmbmmPAYjoJ/aYQpLhWo8D4r8W78sDs5R8z7HFR0H89tj70UXq+Y/JsHd8lU08b5AyIwjkenutnUi0cLUD+/SjvC+p6Lg4DHuE8cxVGstAwz81kYXnmpIKd7kHjInMazO5tfbY0zGnJrX87CuBuLvniGFugkEcfWcOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593730; c=relaxed/simple;
	bh=WsGvXelSUoPxGUHO+lDdSWhLukmWqhdEjmRJrS37UuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhkgdJX9kSq85t54I2ViA4SEXOB0bYfpaG+I9mrZ7aimMU+/fi1uen+QPbjpZV6aHRDKfiT68gnhkSCXXoL93Xd1czmKPxKPL6iaMh+xSRQpdsQ4wkX4x1VjcNSRnxb4tM+kGk9qUXkFeUNQtbTcHV6FHe01SUxdrCcNzx14Yk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NydVyiSY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NydVyiSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748593729; x=1780129729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsGvXelSUoPxGUHO+lDdSWhLukmWqhdEjmRJrS37UuA=;
  b=NydVyiSY1evWIIfdP3JmB/dGJxsyuaesSI1Ca9230MdqTp83o7K2vP6u
   C8b6ILX7AZMzvtyl6hv/MuRV8P5/CVg8xrDrlG1GRIhsmlR6vY8NEEnOs
   p2JiccboaQTpehyudeixs8DsyTyiAMywiKwfPyEZ7DBBZSB9VP+zQbgJs
   CrOuA0Cai/uVNDCSAoaN6MBG1/pdt/RoyyDbEDIOhH6/Q9gP6/rzi12ut
   hl6T6oPY0WK+Ddrj6s2+u1p2xGAezNQDYMkbYL5ziTLla8LTB+tQXjv5s
   Iu6CNyGr6A23YCdExtPcHm+fAgqPxLmz90CS66kOAdj8V3UmLOGwG35L7
   w==;
X-CSE-ConnectionGUID: kwUHWIUHRZeIVuzAHPWKtg==
X-CSE-MsgGUID: MxAkGkr+TU6ecJPHH2/LEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50828389"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50828389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:28:48 -0700
X-CSE-ConnectionGUID: fMGqZXp1Tk+28oRPOSOdbg==
X-CSE-MsgGUID: ErrnlQouRLCBqzE9Rq+pwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="149084363"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2025 01:28:47 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKv6a-0000rG-0y;
	Fri, 30 May 2025 08:28:44 +0000
Date: Fri, 30 May 2025 16:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sven/atcphy 30/31] ld.lld: error: undefined symbol:
 drm_connector_oob_hotplug_event
Message-ID: <202505301647.5wyXKscs-lkp@intel.com>
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
commit: 10afb98e90699baea02c783a19381cb8b81c6af8 [30/31] usb: typec: tipd: Forward DP hotplug events to DRM
config: x86_64-buildonly-randconfig-2004-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301647.5wyXKscs-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301647.5wyXKscs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301647.5wyXKscs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_connector_oob_hotplug_event
   >>> referenced by core.c:793 (drivers/usb/typec/tipd/core.c:793)
   >>>               drivers/usb/typec/tipd/core.o:(cd321x_update_work) in archive vmlinux.a
   >>> referenced by core.c:853 (drivers/usb/typec/tipd/core.c:853)
   >>>               drivers/usb/typec/tipd/core.o:(cd321x_update_work) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
