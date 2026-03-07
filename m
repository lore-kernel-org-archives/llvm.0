Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA55CDF1;
	Sat,  7 Mar 2026 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772849854; cv=none; b=OT2JEO5+nPzpNdNuTWwdu8175lYAGxeEih318ZjEPxRAfUzlIHsrzIgEu9q16bKkzsUlV5a9hTk0ByaSrM+bnkoVuVPTzHH3KrS1ulbYS8Av3y5TsfxcjNYs8NS4GsKOz3s9DRtfsWofJvUM1hY/7VOL+yf1DcQGw5UnBsCyEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772849854; c=relaxed/simple;
	bh=Dr/PPqvd8ILZjkfyO9MltFcnKSIbYsl7vYqQwIvgG+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAx8Ap3rOzdcHLQRXEHkblPecWy6vzeFCl7MRbFqEcYUbeBkY3kXhaR+mtF3ol+EaMZpNUwDyRpRZh7bgbvz6MArsHxgqq0Id/v6eNNi9Hx/7dGYS+07uXIp4uzSfh/G05rMpsWBLw3pi7cfc6odrVFYsdq804vpTkYMyX//Hlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlx9Nlu7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlx9Nlu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772849851; x=1804385851;
  h=date:from:to:cc:subject:message-id;
  bh=Dr/PPqvd8ILZjkfyO9MltFcnKSIbYsl7vYqQwIvgG+A=;
  b=nlx9Nlu7Zpu8JKf+MBrNmxZFogZi1jvciQfBM6jnv3kca3ZxA4piJlyW
   iCFppwoK2aTuPX77yf04pc02OXoFty5tGMGaF3v9v/7gOMXDcSE6iOiGn
   b1rq0iHS/NHvrgQXTQkxk7tUx3UsoFWHssN5J0yjRhKV8K4NFTJAOJ8w4
   Qdb/+pzn4ON/2gEfMDIvJQ/u26dr3AhyBhl+LKjXFZj0ki3i4mR/oSJzT
   yFfFPzZXwD9yO7/S1CgjvV2F6kqpeSE+73O5govOGhxLR9Ul1W0PFGD6T
   4vzgJWk7gU3rf6VSLfTAvtfXcNOBlbVwsTmIsk7OVnsT452J4jOWiB9KD
   w==;
X-CSE-ConnectionGUID: YVC0kTqEQ/uTL/glN1yiAA==
X-CSE-MsgGUID: 29VMaHgISZibe0TrtXiP5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="61534619"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="61534619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 18:17:30 -0800
X-CSE-ConnectionGUID: a8QesOD5Rs6tW3F+0Hdh3Q==
X-CSE-MsgGUID: g28hbY2OQqyqp1pDe21wrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223663192"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 18:17:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyhEL-000000001aj-3e8Q;
	Sat, 07 Mar 2026 02:17:25 +0000
Date: Sat, 07 Mar 2026 10:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 25/27]
 kernel/locking/mutex.c:59:15: error: use of undeclared identifier 'lock'
Message-ID: <202603071012.LwOWygMP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   6f3cd442fa6c0cfc46a20c0138fb131daaa99d2d
commit: 788b5792cd7586750f96c7fe4bc8859e6f5314e7 [25/27] locking/mutex: Add context analysis
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603071012.LwOWygMP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071012.LwOWygMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071012.LwOWygMP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/mutex.c:59:15: error: use of undeclared identifier 'lock'
      59 |         __must_hold(&lock->wait_lock)
         |                      ^~~~
   1 error generated.


vim +/lock +59 kernel/locking/mutex.c

    57	
    58	static inline struct task_struct *__owner_task(unsigned long owner)
  > 59		__must_hold(&lock->wait_lock)
    60	{
    61		return (struct task_struct *)(owner & ~MUTEX_FLAGS);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
