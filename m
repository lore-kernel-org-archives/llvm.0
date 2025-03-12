Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7024431;
	Wed, 12 Mar 2025 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741753154; cv=none; b=PfWKCB3UC/6/534pxNCzBseGlgfMlrx2GAuGxuYO4yWJ5d5sILaIVtzshlRYy0iLTPPkBd1kGISp3+833FFvBSQzPhTCuDommUi8OzCtNQPRQdteJrRIhYecSN5Sd96iIT5xedYTqinvz0BaeGeRbPZxrKIwyL8S1iBjyRuhL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741753154; c=relaxed/simple;
	bh=4ngp7+nDpW+EXJ0e1HX4vXyECzLZV/6CS0E7aTOckwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQ700/LU7vRLxpxQ61luj+SgmeQU10OHqw2YirIkAKl5H4NuTOlvaoiIbtOQ7ACIvfMHd7XrfcQYnGkttN0qEHbbOKvYGtfMViOa8ToE2Sous/vTJCLdBiG9yY9MEF7f2JeWFZWdEn+z3S007AjwrVFq7Bm9b+9dPoAazZbNiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIvb3ZWj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIvb3ZWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741753152; x=1773289152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ngp7+nDpW+EXJ0e1HX4vXyECzLZV/6CS0E7aTOckwc=;
  b=CIvb3ZWjycE7t2Hr6Obq9bD1J1OHOFiCHVOhx4ko3pLGdU13R8twpXB+
   ZWEr1x9lyaSXMnHMXdrAkBmDQdhDsBqrsgG0Cz9rIpjimSCqKQZKZc3XI
   Fnduyut+ub8kUz1/HrnC/uORHSHMGPUz9kYDSFvpbycGkrHl1H+pvC1HA
   g/GXpZH5AjUJrISHKivbPKHgi5+PDguEhjq3FbBhHOyW6XL8FIP33LX8r
   Kuwnv0wdRyKUQa9eWSlYh8FyNm1ZmOq9t+bDb47F2Rk3gctJCfWsXcFAC
   Dy5nl/xRYbQMryYz82UG/dHZ45yuIEFdOK8eD/BuOnv/FbZrzHP1kuntE
   w==;
X-CSE-ConnectionGUID: Atnfx+ajSqGzuyhQ0IAkiw==
X-CSE-MsgGUID: yytI06u1QpWpRBWJyOSpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53022142"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="53022142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 21:19:07 -0700
X-CSE-ConnectionGUID: gvb171XZRTuRzBOWc/snoQ==
X-CSE-MsgGUID: ScOYh2LtRfC7zSyCLu41YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120490287"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2025 21:19:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsDYZ-00087k-0j;
	Wed, 12 Mar 2025 04:18:59 +0000
Date: Wed, 12 Mar 2025 12:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:futex_local_v10 17/21] core.c:undefined reference
 to `futex_private_hash'
Message-ID: <202503121230.JOymwYNK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v10
head:   1a9133756e6eeef39468a2076cf712331180694b
commit: a0c28811a0f754c0dd159bca1f2f26abf3875fbe [17/21] futex: Untangle and naming
config: sh-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121230.JOymwYNK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121230.JOymwYNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121230.JOymwYNK-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/fork.o: in function `mmput':
   fork.c:(.text+0xe78): undefined reference to `futex_hash_free'
   sh4-linux-ld: kernel/fork.o: in function `copy_process':
   fork.c:(.text+0x2090): undefined reference to `futex_hash_allocate_default'
   sh4-linux-ld: kernel/futex/core.o: in function `exit_pi_state_list':
>> core.c:(.text+0x3d0): undefined reference to `futex_private_hash'
   sh4-linux-ld: core.c:(.text+0x3f8): undefined reference to `futex_hash_put'
   sh4-linux-ld: core.c:(.text+0x4cc): undefined reference to `futex_hash_put'
>> sh4-linux-ld: core.c:(.text+0x4d8): undefined reference to `futex_private_hash_put'
   sh4-linux-ld: kernel/futex/pi.o: in function `class_hb_destructor.isra.0':
   pi.c:(.text+0x24c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/pi.o: in function `futex_lock_pi':
   pi.c:(.text+0xd08): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/pi.o: in function `futex_unlock_pi':
   pi.c:(.text+0xf80): undefined reference to `futex_hash_get'
   sh4-linux-ld: kernel/futex/requeue.o: in function `requeue_pi_wake_futex':
   requeue.c:(.text+0x1cc): undefined reference to `futex_hash_get'
   sh4-linux-ld: kernel/futex/requeue.o: in function `class_hb_destructor.isra.0':
   requeue.c:(.text+0x21c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/requeue.o: in function `futex_wait_requeue_pi':
   requeue.c:(.text+0x98c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/waitwake.o: in function `class_hb_destructor.isra.0':
   waitwake.c:(.text+0x10c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/waitwake.o: in function `futex_wait_multiple_setup':
>> waitwake.c:(.text+0x85c): undefined reference to `futex_private_hash'
>> sh4-linux-ld: waitwake.c:(.text+0x890): undefined reference to `futex_private_hash_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
