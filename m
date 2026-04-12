Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB42D97B7;
	Sun, 12 Apr 2026 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775965827; cv=none; b=B9Mdp5jh7+yr+GsYh1nm3x/G1eStdQHax9GIIqHbRjcJKY4rT+tq+EyWi9zTDll4BQGmMAl0tYXjx6z/Rkv2FhHbY3aUavCP0JZ5cCMCAxI2CgCmQG9cZIRnbogpIFlOph+2yMA8HHTImcJhxizw4CiOtzOCjh5FTw2r+byLqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775965827; c=relaxed/simple;
	bh=Y91tCGG6vVTWBRiqRQKaajrQ8n2OrSSyD9pe9eG4kgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AOds2euhO3Nh2o1Ai1lHRO74IZaOLfEz7dkgQZnRofRoWR2A5C2iRCtdH2hFHrR3UGb8HS3k7UgMxkXvZjmIXut+gaIy/VnB32Thps09pT/wZrWrjIM59sYUn986ngvbnpxDmDEd08Jc0IBflcoHvn7E9ycUo+BKrNtnhsJz1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaRMXGzc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaRMXGzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775965825; x=1807501825;
  h=date:from:to:cc:subject:message-id;
  bh=Y91tCGG6vVTWBRiqRQKaajrQ8n2OrSSyD9pe9eG4kgQ=;
  b=PaRMXGzcctvF59N5Laait+wgmUF1oeDhtOyAbCf4J8EzetcgCeEslqge
   4uYe9/n6lM1ZmZf+dMViayvkILTBaBdvnOVgeIJaf1E97OG7+T0bZqtl+
   jwPFz1uyq47G4lWNG5VStasyXF5sq8uhEFnTqlnUESZP5OjjrzkUzAGGM
   q5G/dFssNt0aaUyNxHdyKdU/+3x961B/aLtdVFfy1qTFivrL9ZB/Ys370
   YHnz/aopNwEovazP6YHaNPnwpmdCKjbS7VIvzEYenyxDJ5Vdn+alE2kCi
   o0xoV5xh706IiipLi6o2slwpiV4HpSy7Qm0f4oP/1cqMLmGiNLMexTu1+
   w==;
X-CSE-ConnectionGUID: NtOD+wdgSCmOpY7+bRrtLQ==
X-CSE-MsgGUID: 7Z+gu7JgSvSg7g/T7B0JcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76957115"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76957115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 20:50:24 -0700
X-CSE-ConnectionGUID: bbZ35ewQRiq/12S1yF7Uvg==
X-CSE-MsgGUID: hX7kKs9iRF2K3B2dgGbw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="226744123"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Apr 2026 20:50:23 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBlq0-000000001p7-2dD1;
	Sun, 12 Apr 2026 03:50:20 +0000
Date: Sun, 12 Apr 2026 11:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:locking/core 23/38] drivers/char/nvram.c:56:21:
 warning: unused variable 'nvram_mutex'
Message-ID: <202604121134.ZzyH3ZAX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a21c1e961de28b95099a9ca2c3774b2eee1a33bb
commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe [23/38] locking/mutex: Remove the list_head from struct mutex
config: powerpc64-randconfig-002-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121134.ZzyH3ZAX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121134.ZzyH3ZAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121134.ZzyH3ZAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/nvram.c:56:21: warning: unused variable 'nvram_mutex' [-Wunused-variable]
      56 | static DEFINE_MUTEX(nvram_mutex);
         |                     ^~~~~~~~~~~
   1 warning generated.


vim +/nvram_mutex +56 drivers/char/nvram.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  55  
613655fa39ff69 Arnd Bergmann  2010-06-02 @56  static DEFINE_MUTEX(nvram_mutex);
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  static DEFINE_SPINLOCK(nvram_state_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  static int nvram_open_cnt;	/* #times opened */
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  static int nvram_open_mode;	/* special open modes */
d5bbb5021ce8d9 Finn Thain     2019-01-15  60  static ssize_t nvram_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  #define NVRAM_WRITE		1 /* opened for writing (exclusive) */
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  #define NVRAM_EXCL		2 /* opened with O_EXCL */
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  

:::::: The code at line 56 was first introduced by commit
:::::: 613655fa39ff6957754fa8ceb8559980920eb8ee drivers: autoconvert trivial BKL users to private mutex

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
