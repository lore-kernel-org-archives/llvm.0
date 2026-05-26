Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7F38D407;
	Tue, 26 May 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810937; cv=none; b=AWFt7gim0KBwUEtHCEBKz9i0A3lP/fxNbuMOz9n43dG2IRB0o69ZQ6+fcHBwXM2XwmXtEmCwwYqj0HcPyz/nKXZpVDZor9IIkyeI+JrIlZIvMq+xmL7SIvB6IHfQfxgL2oz4gHAEIsE0iwgp/Efgxa1EE2QH73dsRfz3fepPgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810937; c=relaxed/simple;
	bh=/N9cPJ4AXVuOXQ4wpwz0pyb5Giq6oYar0RRDWDq94QI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f7inKJ66hXCaYhcN52EkMItsyMqIp/Yn/SOuLNWs8+/TEnqv0BXcgMjIlNyxoNWR5z3oND3yFilbs3IbjXfR1swS55Re7Mqmiboa9ohayJDxUPUDD0xEqijYwukwv+ge3IQQ221x99Yc7dNGkELuarCLkY3pEru/S4ToF6LFy2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lShGBBv0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lShGBBv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779810936; x=1811346936;
  h=date:from:to:cc:subject:message-id;
  bh=/N9cPJ4AXVuOXQ4wpwz0pyb5Giq6oYar0RRDWDq94QI=;
  b=lShGBBv0FbfrLZQoKph2OZzYyuv46SrqTR9ASeZzvjOFFdq7f+dXH0si
   /8W9OK2jjVIUJTQ6k8U7puJyIUhLn0GI1L4EenDqMDmSbdKhBp/60GGBm
   7cFyj0MM2ouWfGydMEGGUGOBbvYWHGgw0JNF3bwp0FRTo9b8T2kIzb/q4
   OAcJC9rkI1y6GfRWQunCWNBbT/GE9V/DVrd3r2Wqh/0Depp5GuSgIRzVT
   C+V7NXeDxeSGd+pxZF8aiaOurYhaq0RfHORnKyROthjuMu6y2gxYRgoUI
   6ZluRYhPAmOUbu2kEPCTPRgmSoqlNoM2TAFBJ1gNIeobngZBg4wz5RCXW
   Q==;
X-CSE-ConnectionGUID: o3dDTf/GTBe1s6kTTSW3Hw==
X-CSE-MsgGUID: JHMpheW/QhG+0yRe1SNE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80477065"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80477065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:55:35 -0700
X-CSE-ConnectionGUID: EUIZ1JdSSmqdUshOhxGI5g==
X-CSE-MsgGUID: QFLWBaTmTd2+erDzOu+lyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241789917"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 08:55:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRu7v-00000000CRR-37vX;
	Tue, 26 May 2026 15:55:31 +0000
Date: Tue, 26 May 2026 17:54:38 +0200
From: kernel test robot <lkp@intel.com>
To: Anisa Su <anisa.su887@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Warning: drivers/dax/bus.c:286 function parameter
 'dax_region' not described in 'dax_region_rm_resources'
Message-ID: <202605261738.KL6HWwWQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anisa-Su/cxl-mbox-Flag-support-for-Dynamic-Capacity-Devices-DCD/20260523-175452
head:   c6e544d5bb3b4245f3978f6f6074bf72ef145be1
commit: c5371359cf04e4d7a5bb70052e2a49721967093e cxl + dax: Release dax_resources on DCD Release Capacity events
date:   3 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260526/202605261738.KL6HWwWQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261738.KL6HWwWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261738.KL6HWwWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dax/bus.c:286 function parameter 'dax_region' not described in 'dax_region_rm_resources'
>> Warning: drivers/dax/bus.c:286 function parameter 'devs' not described in 'dax_region_rm_resources'
>> Warning: drivers/dax/bus.c:286 function parameter 'n' not described in 'dax_region_rm_resources'
>> Warning: drivers/dax/bus.c:286 function parameter 'dax_region' not described in 'dax_region_rm_resources'
>> Warning: drivers/dax/bus.c:286 function parameter 'devs' not described in 'dax_region_rm_resources'
>> Warning: drivers/dax/bus.c:286 function parameter 'n' not described in 'dax_region_rm_resources'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
