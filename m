Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA836B042;
	Sun, 22 Mar 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774209206; cv=none; b=e8kUdtKozmXfE53uBjFI6HPmRsLy3AM5P+VMBXSIjVXvfpTh7rS5bUdyJ1KTvyb4HIzhuHDcXVVG/ILCvRZ6xBZwmz8pj9njC8kAS75Q9v+JXSapHkPl1rWiwdVhAJ/Ms+v1YchB3xsBpRG/Sn+VjI2dSLSqO4PHZCRm/jt99K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774209206; c=relaxed/simple;
	bh=jTJfhGMeOemW3TdX/0QcbZAX1be1QkaFlJGgszWsI5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gw+lTghZZJG275tih+AIwBR7Yvt46FciQXmfSzvhGN5G8BA8MP6PZ9XmzOuHr4fBEFqhGhNGYxPP/hWe8OARoUxQayq7ZQA5mUr9wypyGzC2j/UjwxgwFBrcsgXHgtijYjhsQuE7J9N8UFVn5cZoBl+aU4VKaI+pvfGzYcifKAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USFCUJSH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USFCUJSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774209204; x=1805745204;
  h=date:from:to:cc:subject:message-id;
  bh=jTJfhGMeOemW3TdX/0QcbZAX1be1QkaFlJGgszWsI5o=;
  b=USFCUJSHVexaBPCh2sUL4+mpoCoxkkpSu6ozXztyPITX4TTh5jRTzU/k
   NyDZJu/nIDDUPHozPz3hQUBlbT5WCzziw0gX/Xy2eDiBzBkBS4J78HVTm
   xkmVZyX6f5fj7DVMFymOIqp0/PSWqENYzIVp8Qs3ygNmcKVzdzquk7Jqz
   urGJbrpWLNDGT+AW+FQVNMl/X+9vqL+6RA/Xn52CExBFkUOpOfpYZLr7P
   mthrZ9Ad/ZyIXsEzejYqZBwyKSuaPxF2la1w9TrU69TmW3fbbOJroxP3h
   nxHnTmG7IPoFze4RSumjJtmuWCEFUxWsSpRjTHMaHD0ixBZYICJlfueuW
   g==;
X-CSE-ConnectionGUID: F+j7pV69QB+IIkZUZxJ6dA==
X-CSE-MsgGUID: 5StduF+pQ3eCQQ0My8MqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75186456"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75186456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 12:53:24 -0700
X-CSE-ConnectionGUID: nk7iwRdTS4isGd6W0x6H8g==
X-CSE-MsgGUID: 5g4kYAcyQPu9IM20c1M7CA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO c2cbc2b066eb) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2026 12:53:20 -0700
Received: from kbuild by c2cbc2b066eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Or0-0000000002U-2EL2;
	Sun, 22 Mar 2026 19:53:06 +0000
Date: Mon, 23 Mar 2026 03:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 25/30] ld.lld: error:
 ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
Message-ID: <202603230307.YHgkpUK6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: e1de23d90976e8ca344a9813e2001d4a9769b745 [25/30] treewide: The rest of the owl
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260323/202603230307.YHgkpUK6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230307.YHgkpUK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230307.YHgkpUK6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:17: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:17: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
