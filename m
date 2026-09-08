Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E61A9F87;
	Tue,  8 Sep 2026 04:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843538; cv=none; b=ElwVPeG2T2U+ZWaNswMlASFtL35RXBcAioW+9dHkm2K60e/gAvBqGzY197vtxE5RE/LtO2lvam9JSJ/osr6n57O+vxJuZXQ/ghfk9SNjjTrXozIeNKxb0Dk5mgmT7Nr5G9yT1l34YgozJ9byJo102LNX/pr4v/aUzbrtu2ZtY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843538; c=relaxed/simple;
	bh=Y6rHxan4dByq+YRVlTujYYjNXzLUNPXoi3XE+Zkd+ZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rw3m40cNuU36jhEoYA4Xem9Kwf0kAo6ZRgiPz8TNg38onsgW+EmT1X8LE/RNnNM+HbZ1M2a8EBvr2v8x/XeQAeSF10iaj+5OT0ZPYfE0OwN4JX7fUHCc3xOKYcFMLWulDVvWj3EGcwzlFdItw8+lhyZ2YZFk4v6mXj28D0v1IcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXcl5as3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXcl5as3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788843536; x=1820379536;
  h=date:from:to:cc:subject:message-id;
  bh=Y6rHxan4dByq+YRVlTujYYjNXzLUNPXoi3XE+Zkd+ZU=;
  b=LXcl5as3vczB1nP5ZEIgj2z3LHRKpXdyl/U1DmBWAa9bcEuTn7tGcXiN
   nv2z9n1+JHMhCHXdrj88+wkcEUzKtFtRXWOfHcJLQ7DOWR5faVnV1QjaJ
   n16TKVXtAoVQhYkB3jxnUHmDe/sVo/EECbGVJd+2VCbbD87cLlaaRuICN
   rtxVcrgUb1Pjpo1LPJxJM/daoi1dVcLoBVbxh2rxIuiPtqOYLNnBAqCGc
   GxUr3S6cAk2a40M1xnHSGdEDGTfL9ecOQ9zuz49sYcVQs3FPryMPDMDla
   uYcm8dHw1hlQiUTd56XirsH5wNYPshfXJ15fURu02UQXIouFjMUbf+Ws3
   A==;
X-CSE-ConnectionGUID: 1MgF1evlShWdhczCGCtRjg==
X-CSE-MsgGUID: mvOjN2APQkGNECYqdByLCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93099626"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93099626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 21:58:55 -0700
X-CSE-ConnectionGUID: iDyUgtg+Sb+r62TP4oFwHg==
X-CSE-MsgGUID: mXcFTRy3TLqAqo/bAEOsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="271393415"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2026 21:58:53 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3nv1-000000001gH-1HBk;
	Tue, 08 Sep 2026 04:58:51 +0000
Date: Tue, 08 Sep 2026 12:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dean Luick <dean.luick@cornelisnetworks.com>,
 Breandan Cunningham <brendan.cunningham@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream-20260903-1349 24/24] Warning:
 drivers/infiniband/hw/hfi2/sdma.c:1338 Excess function parameter
 'num_engines' description in 'hfi2_sdma_clean'
Message-ID: <202609081216.mkblap39-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260903-1349
head:   4c46e723b2fe9eb07bfde612e9255e5a485720d0
commit: 4c46e723b2fe9eb07bfde612e9255e5a485720d0 [24/24] RDMA/hfi2: Support ipoib
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609081216.mkblap39-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081216.mkblap39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081216.mkblap39-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/infiniband/hw/hfi2/sdma.c:1338 Excess function parameter 'num_engines' description in 'hfi2_sdma_clean'
>> Warning: drivers/infiniband/hw/hfi2/sdma.c:1338 Excess function parameter 'num_engines' description in 'hfi2_sdma_clean'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
