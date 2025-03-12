Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D84C85;
	Wed, 12 Mar 2025 03:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741750018; cv=none; b=cIRPth4ZPlGbx2vQ9P76uhKkwtgqKdAaMyWz4/FPqyXHOHsv2a7foNVRSXIkQ5m5nGyl4WiXopd4XLbsqQZzET+UIp1cDUccasVc60D6Fz9NPfc1cp4DSwG7joiQgYssr4Ob6i9SDd9KP77NY3qW6YiajcUAueZQOehdJKZkOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741750018; c=relaxed/simple;
	bh=/farXEpjxZmfiOmENcm41F74MPeo7/nbu0BL7UAZIVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3CFnNODkjvrjQ1T0QCQ7cmd0rNsOk0qf6BEMi5I6A1PyvaPezJXEZxTP+yV6LBl8KSOA0RCc8Pnv4mF4yeIyRcT73DE9hFgIld5Y25C16dn59+AVPQ1KFuGglo38OJRihQLMcWkcG6KTpruplGPS9HAWRg91Q2HNvTq5kBcFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxiaXKCF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxiaXKCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741750016; x=1773286016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/farXEpjxZmfiOmENcm41F74MPeo7/nbu0BL7UAZIVY=;
  b=JxiaXKCFnL704kcZ6D1HyC13uFf80U/zQ/fVGyrGigE+HNweaXfgFpKk
   pfx0AufLE3CSvI++HgB99mE88rn40srAVoMaEAE+wdiPDf9paDEvPxmuc
   c/YuGVszz9+0YgcuPBWHb6PMtCbflQjup52tZAS3kwcDcsgAaVoF8WkvS
   8rU2yxN5EZgs7T+uE2anHzWWjT5vv9nGy2kHlZJ3V7w8gvtSNedVnd1JR
   6f67ky4T7sLZgMle4bHcHAp81Ps0TUD3RJsqbattrsf5mL4oczE4r6+s5
   kHxCEo4fxhq44rKn6NEk+2iJnvx2AA1hKkJqZU4qS74B6VR65lCvsNonH
   g==;
X-CSE-ConnectionGUID: Ixqdov+RT/CR8Y9RF+mmKQ==
X-CSE-MsgGUID: 2rV4Fxe5QUG3bwmdSwgItg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42725521"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42725521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 20:26:55 -0700
X-CSE-ConnectionGUID: FD2x/q2oSKK6Fjk3ZAk7WQ==
X-CSE-MsgGUID: cEc7Kx8MT4qMLEG4pODuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="157704193"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2025 20:26:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsCk6-00085c-2S;
	Wed, 12 Mar 2025 03:26:50 +0000
Date: Wed, 12 Mar 2025 11:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:futex_local_v10 16/21] ld.lld: error: undefined
 symbol: futex_hash_free
Message-ID: <202503121117.ATxe1ZjS-lkp@intel.com>
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
commit: ccbfa01ed2ba7957ac35cd762f8a26dbf3e1db97 [16/21] futex: Remove superfluous state
config: arm-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121117.ATxe1ZjS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121117.ATxe1ZjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121117.ATxe1ZjS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: futex_hash_free
   >>> referenced by fork.c:1368 (kernel/fork.c:1368)
   >>>               kernel/fork.o:(mmput) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: futex_hash_allocate_default
   >>> referenced by fork.c:2529 (kernel/fork.c:2529)
   >>>               kernel/fork.o:(copy_process) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: futex_hash_put
   >>> referenced by futex.h:221 (kernel/futex/futex.h:221)
   >>>               kernel/futex/core.o:(exit_pi_state_list) in archive vmlinux.a
   >>> referenced by pi.c:1022 (kernel/futex/pi.c:1022)
   >>>               kernel/futex/pi.o:(futex_lock_pi) in archive vmlinux.a
   >>> referenced by pi.c:1092 (kernel/futex/pi.c:1092)
   >>>               kernel/futex/pi.o:(futex_lock_pi) in archive vmlinux.a
   >>> referenced 13 more times
--
>> ld.lld: error: undefined symbol: futex_hash_get
   >>> referenced by pi.c:1206 (kernel/futex/pi.c:1206)
   >>>               kernel/futex/pi.o:(futex_unlock_pi) in archive vmlinux.a
   >>> referenced by requeue.c:243 (kernel/futex/requeue.c:243)
   >>>               kernel/futex/requeue.o:(futex_requeue) in archive vmlinux.a
   >>> referenced by requeue.c:243 (kernel/futex/requeue.c:243)
   >>>               kernel/futex/requeue.o:(requeue_pi_wake_futex) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
