Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91135E1AA;
	Sat, 16 May 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778914951; cv=none; b=Lejs3UrYG8qxOzIkLZdbhHQ6XE5Y5qcZdPTKlwHk2XpKx6lgxlVX3j5JxtmcjKIMeRyhVF4B12cSQ+4E29zGBTfWfXVTaB+ALNCMFQ9+PzCT00fVdpweR5xSSenXDb0oHBGbq7JH0Zb7T4+1dVo1DLbNjn3GFoqroEJnXO0oCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778914951; c=relaxed/simple;
	bh=3DA4D0pS9QFdOg1p5dk+89aw//uF7Q4VFXvLQxIB9EA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uK6xWmNbmvReAYy3Nc0ookwuLcpFHoFGUsYeQhsz7b1iHwk+O/MMSntl/S0R7fvtOrfEBmU8Bx52ufTX25MgyL83SHHLhynT3uUtKqmXKqQbG0wGnb4qk6qtUUA+lnnhFL4O30pDgdoXRfrw3eGd03TVGKBByIs6EVz4TxhCY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXUvzhP3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXUvzhP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778914950; x=1810450950;
  h=date:from:to:cc:subject:message-id;
  bh=3DA4D0pS9QFdOg1p5dk+89aw//uF7Q4VFXvLQxIB9EA=;
  b=aXUvzhP31VsInnoigzHjiLqBg9njjQWfYz9/SdCPm5x4jWBgiTtDc0k1
   cJIqj8nQCHUSuRybb/37HLeXfelGxU1pBCOtKNLyhpTowUe+Davu7EFNN
   VQxliuBRc2MfsAV1OTfxlNsG8Hci3147kyQDfzFq9SYuSjrZ2fcilHmRk
   JeH9UdL29hR5xCOrti9bHyf6uq+HYLx9wX84qE4Z3K4/NR+AnkgtqlOwU
   f9SnI2/KURCYy4WW42VDBsTNxhSZmANkV4fXUlUUtpEg6QtqKwyRWCobW
   bcayB0TMe6rO6F+iMCkU3MFkE0r95rzswu5SdIy5ujBFZeXwoTH0fBNae
   Q==;
X-CSE-ConnectionGUID: wEoB9ajvSkmmpT19jxwNNQ==
X-CSE-MsgGUID: aHn3ukokRqa5KvxqjpSbZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90963723"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90963723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 00:02:27 -0700
X-CSE-ConnectionGUID: qxlCqR1fSWOTmUN/C+kZtA==
X-CSE-MsgGUID: VFUf9G0vQr6LvqZQXQun/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238792339"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2026 00:02:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO92U-000000009Fd-2jAg;
	Sat, 16 May 2026 07:02:22 +0000
Date: Sat, 16 May 2026 09:01:43 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/shmem.c:1594 function parameter 'ctx' not
 described in 'shmem_writeout'
Message-ID: <202605160836.jJKMcml6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/mm-merge-writeout-into-pageout/20260516-003650
head:   dfa0de1c1f86f5c4e96d214b3549d4c5d3be0068
commit: b44db93170f358db8179510ea15bb73b2194941c mm/swap: intoduce struct swap_io_ctx
date:   14 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260516/202605160836.jJKMcml6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160836.jJKMcml6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160836.jJKMcml6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/shmem.c:1594 function parameter 'ctx' not described in 'shmem_writeout'
>> Warning: mm/shmem.c:1594 function parameter 'ctx' not described in 'shmem_writeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
