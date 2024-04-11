Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDC1474BC;
	Thu, 11 Apr 2024 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831427; cv=none; b=sgV2DsSy5EC+SfJ7Qm3uoqKg2ou0PDELo4vtT5a3sCmSWJDybeoz0wDbpjxsdac3rw4ENhyUGcqzg+nsR/XxFh0YDas/teh/VgT4fxVm86HPnnEbDaTAlh0oos4mL1NIjYcXDizRbWzBGp0EyhP+jKfYMaizm5TVgd7G9a+CsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831427; c=relaxed/simple;
	bh=iv4AdwxeWe8sLTssZ42Ka94ROb2+1u6PpDV3JLrN6G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPKzFCuDjdrgFQqNmoZO/2RMtBqMBMxljqNKBZvdyh9M4vMUEhmVyb5nhm8CXO8QVDDr6Jfic8JnP2TSMX+V0BfCnEDStYEi0e8GZ/SIQH8MPZmUKm7ZtZW0qVD27I33ykg1YW6TRwoje2Nl+9gZhICv+pArq6bJzfgcI+ZzbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFN8P+2P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFN8P+2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712831425; x=1744367425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iv4AdwxeWe8sLTssZ42Ka94ROb2+1u6PpDV3JLrN6G0=;
  b=iFN8P+2PiHEu28leNyKcFBhfN36wS4eJJUxpqtCckIbtJJStfpo37DSQ
   SC96i1MzDe6bI4Oa5Z7FjRCVgZtvM+aEQgNGVLavFBMiDWIayyISWmYX/
   4XkComUhetEZ7jKUdCiWo1RDJNd75BCU8VgCZX5s40nscQBqCJ7DCOt8/
   bg5w2mnjLSC8j2zwGCTjwFd+4U5fnaxcQTlrkHqIiUE4pZ8dknJMb4k0G
   F/qzgyFtUFaHdO9IlxbEyuNJUYRccFIIWYrNKyzV3vonMyRJP3e5/b+UQ
   vNIWuSMBGxSjgj97Ww6d0pY41XLpgE8fuSs0C5xZsql8sOq3I1GD3iWoU
   g==;
X-CSE-ConnectionGUID: Ec5sQ1g2T9mFEJu2/DhByg==
X-CSE-MsgGUID: hPOoxYY2RHWzFChww8+8hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25687928"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25687928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:30:22 -0700
X-CSE-ConnectionGUID: jPMNEyhSThWfVsFwS+G+vA==
X-CSE-MsgGUID: grGhvYtKQhyKPEsobof49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="44147798"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2024 03:30:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurhB-0008W3-1W;
	Thu, 11 Apr 2024 10:30:17 +0000
Date: Thu, 11 Apr 2024 18:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhua Han <hanchuanhua@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Barry Song <v-songbaohua@oppo.com>
Subject: [akpm-mm:mm-unstable 360/372] ld.lld: error: duplicate symbol:
 swap_free_nr
Message-ID: <202404111834.XUWxYckr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: introduce swap_free_nr() for batched swap_free()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111834.XUWxYckr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111834.XUWxYckr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111834.XUWxYckr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at vsprintf.c
   >>>            vsprintf.o:(.text+0x1) in archive lib/lib.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at platform.c
   >>>            drivers/of/platform.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at bdev.c
   >>>            block/bdev.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at commoncap.c
   >>>            security/commoncap.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at meminfo.c
   >>>            fs/proc/meminfo.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at array.c
   >>>            fs/proc/array.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at base.c
   >>>            fs/proc/base.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at nommu.c
   >>>            fs/proc/nommu.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at buffered-io.c
   >>>            fs/iomap/buffered-io.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at drop_caches.c
   >>>            fs/drop_caches.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: swap_free_nr
   >>> defined at main.c
   >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
   >>> defined at coredump.c
   >>>            fs/coredump.o:(.text+0x1) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
