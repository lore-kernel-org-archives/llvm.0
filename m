Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F8739E185;
	Fri,  6 Mar 2026 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807692; cv=none; b=SjutvKAehEHyoABT+g9CVNCbwgaQygwc8Lb2BMbRaDH6EzKhJIXKyserEHCxizQ81GSiHHLAygL7/OvRaOjZXBKqahxVDCkfyuKpFc/911te0xQUskcZzMbgPFvoJvV651ddl8Ywc2+gqSSyoSN1wk5B1BEC6uoSYMA+im+honY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807692; c=relaxed/simple;
	bh=+g8Kk2hBp3w1Ppd+PiGFMaMv/4z4EUcVOnxEmaXWarA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tQPA+KGFtEKPcuvkQj78tUL8B4He4QKKO6Njv1TYE/KhDiwfY+j4+AkKmMbO4tMMUUTrq0D0rK6m/MlQNjy5c18zgH3TN9d0brQSCpvrsyOC/VdJrTJEj3pid5KedEzo1GVqTnTTPITTcZ6YRwwwuGFK2i4Yn1tTjpNW+SRWTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx3llu65; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx3llu65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772807690; x=1804343690;
  h=date:from:to:cc:subject:message-id;
  bh=+g8Kk2hBp3w1Ppd+PiGFMaMv/4z4EUcVOnxEmaXWarA=;
  b=Wx3llu6593SEI4zWrtyiomL97NHvMAI4wEYND4MqPWhT7GXHWbKKAacA
   vaCqRXbdrreKGuAV5mIKQWH0FXQyMrH/c5FLSLr4uFXPfsofzIqOpwH6V
   LoYnOM1clo6L/swgt0rt9h2JiOsIV8/IXmr4H50MVoFwiS2+uevJIsrfn
   Te2n08y71bEWqXqlWJvZBI4QHMLYYvIOlat0af4+Jz517whNpKZf0iIlh
   BcDiSQ+Fi6NKW0yaxTsUm8SgQc9KbE+8QJTiwSNqTZ2oxviGVrvVnNWpl
   0rZOG1tq+7ysZpQhxFwIpXTFdYFEGkc29oCT4iPocbZVz1vMDfJedGXSG
   Q==;
X-CSE-ConnectionGUID: LUoOk44BQTe5sy80l857lw==
X-CSE-MsgGUID: LFaWRxZfQs+GETkuy2HPbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74103908"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="74103908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:34:49 -0800
X-CSE-ConnectionGUID: 31RfomxnS/O8YVRCnIZczg==
X-CSE-MsgGUID: XFf4E7rBSeyutAY1Udz+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223144565"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 06:34:48 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWGK-000000000wR-3Bbi;
	Fri, 06 Mar 2026 14:34:44 +0000
Date: Fri, 06 Mar 2026 22:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:coherent-for-danilo 6/6] error[E0432]: unresolved
 import `kernel::io::KnownSize`
Message-ID: <202603062226.Wy4jEuB1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux coherent-for-danilo
head:   acf194b29ba2c0d657ac4b3d61234d6e655ed79a
commit: acf194b29ba2c0d657ac4b3d61234d6e655ed79a [6/6] WIP: gpu: nova-core: convert to new dma coherent and I/O projection API
config: x86_64-randconfig-074-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062226.Wy4jEuB1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062226.Wy4jEuB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062226.Wy4jEuB1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::io::KnownSize`
   --> drivers/gpu/nova-core/gsp/fw.rs:13:5
   |
   13 |     io::KnownSize,
   |     ^^^^---------
   |     |   |
   |     |   help: a similar name exists in the module: `IoKnownSize`
   |     no `KnownSize` in `io`
   |
   = help: consider importing this trait instead:
   kernel::ptr::KnownSize

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
