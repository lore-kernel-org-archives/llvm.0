Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CF3BCD28;
	Fri, 29 May 2026 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780097160; cv=none; b=BIFiW8ivmjIPu/QjfEVkC3c2eoxK8X5Ts4fVtdzIeK0/xXOYi/yrazMsueRqakdIu0YGdV9T4AceZAj0NCefptvy9FBjHnf5j1m346x8jULOE+jPk4GoV8Ah/78rwjrvFx0Z2jN7FWvAWqRGK3kG5JZDkH1pJYKxJf1Z920f9/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780097160; c=relaxed/simple;
	bh=299o8NrKeyr9/wZUw9iihnzlc4aKPkfTtesMurdJoBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m2YYuCd39jKUPo8AHwG/S649mQzQe0w7l8UijD7TCdjqJ28wMBzT/SCk3yPftzyWCy33urbCUCvfhMZv8e0sZmYJDwGcppIhfuoHXV0fhQOxdJ0alYO7nSVIU4GE8GG+zcs7/XzTiKvBdl0c5Z8rU8mnxZp8BHouE54M/O2vars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xfy4N0in; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xfy4N0in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780097157; x=1811633157;
  h=date:from:to:cc:subject:message-id;
  bh=299o8NrKeyr9/wZUw9iihnzlc4aKPkfTtesMurdJoBA=;
  b=Xfy4N0inTNQQ0FO9IPMfO1wvJcUlmYf/CnY7M1p72ilzDxy1IJXrnH8A
   RXHohHaiwokVyxgAj4ZBuG3frpq58pStHuDoNFR4SSVWc1lrAtxp3BXPl
   Tr85ACHO5KVot8MA06/jl7lW/wJu4UVCxBazYYsu9trg0xl5oB/ozZSN0
   yuYQdD4hbTBt1jbH2TevmMptKCbwRIQUu4EBWP+bsWrMR85NFP0+whwuE
   lx08pgN5L+ia07yixrNIpQFlJP/geeLEIIGkhuNk/0xa0FpmUCCGQx0QX
   qt8I4XaGFjhClcYuUclZkUPggmzHr7c6DKnl4JV8do31V0zkseg/K1svG
   Q==;
X-CSE-ConnectionGUID: GZQG3rO5T7Cbk/xTcIrZwg==
X-CSE-MsgGUID: 0kPFLp28TUWcTKCQcV9ynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80927160"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80927160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 16:25:56 -0700
X-CSE-ConnectionGUID: gdIRhNohS/6URtf21Cuovw==
X-CSE-MsgGUID: frwVfL2RQteO3sgkVFvLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="244813184"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2026 16:25:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT6aO-000000007lW-2vhH;
	Fri, 29 May 2026 23:25:52 +0000
Date: Sat, 30 May 2026 07:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/40] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/msm8998.dtb', needed by
 'arch/hexagon/boot/dts/msm8998.dtb.S'.
Message-ID: <202605300748.SKFKa3Xh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   a81283ca24aeced3d15724ecb99d91190babce5a
commit: 9ed7172993b8e76f687f481352d61a880dbc3084 [20/40] hexagon: update build system and Kconfig
config: hexagon-randconfig-001-20260530 (https://download.01.org/0day-ci/archive/20260530/202605300748.SKFKa3Xh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300748.SKFKa3Xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300748.SKFKa3Xh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/msm8998.dtb', needed by 'arch/hexagon/boot/dts/msm8998.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
