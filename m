Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A43596F8;
	Sun, 14 Jun 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781431627; cv=none; b=T4q5EuPg1Y7ir3H7gL4NbpG1F/XncSCZO03Spqur11+/tJwVsUh2BRQodTLf2Qegs+rI/2ESg7YzN8OEe4XRd29l+thEZdvv9wG9+19kmh1z9ztZlzV9kbdv7HVUUsAXOGYd9lIATzjFhRRRQ8lsy96sQBb8LI7ULcs5K6VGEKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781431627; c=relaxed/simple;
	bh=yMwFm4hsOfj/W3tIsswnw8E9mJE+MCAoIWkZ3jkOrSg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LvSWe8cn/xn9B0tbBIq2ueEFKUyLpywziGcUlrAEITGc7RMpEGiMdPvHRv8OaSObvrolb4bIJ4bBXkFLebI2K79XOCXMXWDqdHP8nv7fI7YEMplmN7vOSSFxAjyv385EdED/ShXWEllcZ23mJHkgSChgcA+Jc1nDYnrWq6pWZtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS+ubBwd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS+ubBwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781431624; x=1812967624;
  h=date:from:to:cc:subject:message-id;
  bh=yMwFm4hsOfj/W3tIsswnw8E9mJE+MCAoIWkZ3jkOrSg=;
  b=XS+ubBwd7Rs5lviBWleGnjh/GTenqkb/t1WKJCWmF7tP68IV9JSPWFPJ
   uUfhvRVAKrmvHSULsKHWFtRHTtGeClqF5HCootPUH1mphZXhI2bJlbiL/
   zENPc4X1u/17rczFTqtC2FT+Q6Wj45xX0/Wdii3wMN6SOwz/OrL5fwG3w
   +qZ/4iWRwN+/oJX5P9d/naRO83z3I29rmI88VTX+cNs0hAV3ZsQyPtwo5
   rYl0cfwihq9F2f9ZtkmChh17tKw5VgZze5N6KbysyGKR2xYgwlgey6e57
   jdJprRTuHldM1d/oINkxUeaovfYomlvcZpTlr6T3os8mkWebtk5BnflRy
   Q==;
X-CSE-ConnectionGUID: 4Mynb/MITqmZMSNi/nCV1A==
X-CSE-MsgGUID: fJ9zfNI6QDiXupzpuwYpgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82209732"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82209732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 03:07:03 -0700
X-CSE-ConnectionGUID: 2hgdEi0XT0Sv5/bsLlUD8w==
X-CSE-MsgGUID: RvRC6aG+TO+ElmG1Za55RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="240863379"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 03:07:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYhk3-00000000Qk2-33xB;
	Sun, 14 Jun 2026 10:06:59 +0000
Date: Sun, 14 Jun 2026 18:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 21/24] ERROR: modpost:
 "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!
Message-ID: <202606141740.ztdQfLkT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 6c327e2c66e67e1296c6bd57719991db3a0f250c [21/24] fs/configfs: add superblock as attribute to configfs_pin_fs()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260614/202606141740.ztdQfLkT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141740.ztdQfLkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141740.ztdQfLkT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
