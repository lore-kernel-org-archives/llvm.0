Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127B17BED0;
	Tue, 24 Dec 2024 18:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735065474; cv=none; b=NQU6qZHCHzDAg7BJD7Xs6+27d7a9d4BkuJ43v9/YtaBSsrS+fRIaUgIY64sClJGa36lcajG+Y06vgblHxsbx9UQt39U4rI18jFOnteCPTL673R6vAvSULXzL/v9suwVl9n4zgmZW5mnwcFnOFkuFMSHSJiUmgld9bEfgc8mNj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735065474; c=relaxed/simple;
	bh=VybZGCy406lx+fThsIm7u/69Oi3HaqHpDH1+fK1WYR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RronH6YWtxPFfFR59TZgF04YvRQaHqc2elyhO7pcrrw7yoWVOTDg3KT915DJFPlLQEOZB5qvhF123S1xdJOgJ1Dfz86zd9C0Dx7eUpHdSb4Coo/K+nUgz8NZ0CRNGTTKSVQRbTdaPIuER9PEddkFdpBwOdiHhvrRuAgnAX9Nb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hu4EglZx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hu4EglZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735065473; x=1766601473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VybZGCy406lx+fThsIm7u/69Oi3HaqHpDH1+fK1WYR4=;
  b=Hu4EglZxryhr650mM5o4G9pfNyQwpuid13bZix0UY/g8y2fDhJ5/JALw
   Ql8L44nEJYXsiZcu16CXbu+f89qSo/MlBDyj5XHHGZAYCiWYZd063K9kP
   ooSLFngOPkWEEdSs5623p4AsqhNStwOnnjIRi+V7X73n1VSEXoUdH+dOc
   46AVicts+wCkKl8Ue2OUcSiaBWVDx8QXy/GT7fnMxLgP14gc42nFycwUX
   VWjQ+xhfw/bvgPArGkYGN0ufnD8RWXyCdIMzVEojvl6QbG9yGnQQ+6Ee6
   NyIftiZYciUq5MrE2cf406zGrjKr5WSa5/e0nhbUiUqssGoLdwGcugdD8
   Q==;
X-CSE-ConnectionGUID: S/5eumIkQMCelQLpwc0bKg==
X-CSE-MsgGUID: +caskUlWSsyvgq+XN6OP6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39215883"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="39215883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 10:37:53 -0800
X-CSE-ConnectionGUID: 9dIt92IKSuWN99ZMV8jMIg==
X-CSE-MsgGUID: lEkNXpUlQ5iDMuuAC1dtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104622467"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Dec 2024 10:37:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ9mu-0001Mq-38;
	Tue, 24 Dec 2024 18:37:48 +0000
Date: Wed, 25 Dec 2024 02:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mohan Kumar D <mkumard@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 33/46] ERROR: modpost: "__udivdi3"
 [drivers/dma/tegra210-adma.ko] undefined!
Message-ID: <202412250204.GCQhdKe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mohan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   98d187a989036096feaa2fef1ec3b2240ecdeacf
commit: 68811c928f88828f188656dd3c9c184eeec2ce86 [33/46] dmaengine: tegra210-adma: Support channel page
config: i386-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250204.GCQhdKe3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250204.GCQhdKe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250204.GCQhdKe3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "__udivdi3" [drivers/dma/tegra210-adma.ko] undefined!
ERROR: modpost: "pcmcia_register_driver" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_unregister_driver" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_loop_config" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_enable_device" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_request_io" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_disable_device" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "pcmcia_register_driver" [drivers/staging/gpib/ines/ines_gpib.ko] undefined!
ERROR: modpost: "pcmcia_unregister_driver" [drivers/staging/gpib/ines/ines_gpib.ko] undefined!
ERROR: modpost: "pcmcia_disable_device" [drivers/staging/gpib/ines/ines_gpib.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
