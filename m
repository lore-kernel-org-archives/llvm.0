Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217273B4E8F;
	Wed, 20 May 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268115; cv=none; b=Tl6JsThRxBuaJSiQjGL1H1uHq5gaqYJIJrtGwZBJRdEVvLHsqInJePbNi6jhz1CvmOIqlfag+I462lT9c7uz/8bGixo56U93NQVkXvNIJnQE4oxLuasIvDHGWW5zw115dV1lMQLhpcE3VVSv7cLTvo6DHWx3o7RDFi+TS/k0Dio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268115; c=relaxed/simple;
	bh=g9Y1rskBOICxiUtP1FdF88jHeZC0uNxznyzGCNiRgew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OSCeSANLYtTYJmrTSVM81wP7k9jHqR2ykK9Nu8TkZ2lmYQyllYpUwS7qvLz5XT8NbzAFTdLFSohSmqdfqJH+1TVPb2yNR9X3ulbead6a3tZ+4Aei2hZ0ttY1P5PIh01vOIbi1O4bvduYde59TTe8Y44h7PuX4LdCrJu4k1nfWH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOqIGrq8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOqIGrq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779268114; x=1810804114;
  h=date:from:to:cc:subject:message-id;
  bh=g9Y1rskBOICxiUtP1FdF88jHeZC0uNxznyzGCNiRgew=;
  b=IOqIGrq8ZrGFMs1HIzMr6+nmzLFKBuLRsjrcGacE2vVWAEjMh4OcwmsK
   JAJOvXGDrSHLMIOkce+PUa6Vra8f5Yksgw290vMScwSRA+tSdb3Ujh7UB
   lTZGPCkoFFxOhWz9rS4gQf/aPfEL0bl3w69/SXTmL1ZOepNAP5w7NKFU/
   FJjvzq6APuFlBo5/nymsg9tcs3nX7OWPDpuSpCg+TzJVvi8zpk5hwgX8F
   uGpM/MzyuCYXN1He32/cWt80Dz0Ro3HwG7TZRWTXxlGDS+Z4O+4JUCSuI
   RSgwQ/2zkTPTiSntbIWBGwZKhhEquuyyw1W04KNDK/Cl0Qa5oYx0Hoscp
   A==;
X-CSE-ConnectionGUID: cr/O7J0nTmWLHhH9b6EWGA==
X-CSE-MsgGUID: ibvIHFvETo23w+fEhQEC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91266034"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91266034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:08:33 -0700
X-CSE-ConnectionGUID: X37rMs8UT4qOESZfnsDH5g==
X-CSE-MsgGUID: UbpsvTwDRpi/qhoumMb/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="233744142"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 02:08:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPcuk-00000000AUT-10pi;
	Wed, 20 May 2026 09:08:30 +0000
Date: Wed, 20 May 2026 11:08:04 +0200
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: error[E0063]: missing field `failed_bio` in initializer of
 `block_device_operations`
Message-ID: <202605201146.akzjCrUm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/blk-mq-fix-status-for-unaligned-bio/20260520-012950
head:   89ba31ad7984d07e6f2dc223b2b47ee84cf8fe5c
commit: 89ba31ad7984d07e6f2dc223b2b47ee84cf8fe5c block, nvme: add failed_bio callback for multipath bio failover
date:   16 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260520/202605201146.akzjCrUm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201146.akzjCrUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201146.akzjCrUm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `failed_bio` in initializer of `block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `failed_bio`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
