Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AE375F9A;
	Tue,  7 Apr 2026 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534260; cv=none; b=IGpoG42Pnvo5hJu95KYGv8J55sMJVoZTgZI5OtZKXzOaEzysE+DSuE9DPIS/zOLd/4gT6W8+JW0bzq/qqosU/yFj1+CTSSVdblhoNHT/I8IvOqyujniESsCUnO7ZW+lLusc0/YONCkPfhYCd9SID0fNywdArfgPfBuKLhwSvH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534260; c=relaxed/simple;
	bh=PYV1qOzeuciWtp4YOM7sh66ArmSa8vJMvEOcJ/gNnCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KbvNIVMewrn39kX5qE01DbrBXNdtlSjUXSpw42sIy4nZM9G9GuSWezdPYMuJjmL+8o3KRY1YGkcDto10m8JuZf5Xz8UYmsrr+iBy/+BgJ7jalHtDqOWehqn7HfNSX7HBrX2bSieQ6rrjzJ6mdw8AxW+QWywGZdbqhe+Sl0XByvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSnj22/e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSnj22/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534260; x=1807070260;
  h=date:from:to:cc:subject:message-id;
  bh=PYV1qOzeuciWtp4YOM7sh66ArmSa8vJMvEOcJ/gNnCg=;
  b=cSnj22/eGx1vqVMDzfm/RI4w1vvM25PzDdy7YekHJfCJKg4+OPtnYv5D
   l8CK9RCYaHf7axoxGCw/gAaxwS2xDR5YbP8c9h6SLf/YnqrDMVxPWHAhR
   TVzoy6jWtJfInemibIHeJAFXkY23N+DHZmM4UnsSCy3FwuSJvO2hjHSOR
   NhFN3/i5Z+R3C6s9B2hJRS7FIJhG4zgTVh250M4IiYHGpEbhAogVLqgZ6
   vonojxXbwLUKqPcwQoSvPOEevnyREf0TzU4lBKTsKE4laEDCub6tikNgi
   4+OlEKT5XejfM0tonpJAseP1G9OlpMs7MQC9M+azfztgVqynUQNWBdVhg
   Q==;
X-CSE-ConnectionGUID: W0ElSZqCTQGXYp/CgILpMw==
X-CSE-MsgGUID: MMrzlzuGRr2zx+/dZbkvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081096"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:37 -0700
X-CSE-ConnectionGUID: URlB8NymQqGKAZQpr9wzfw==
X-CSE-MsgGUID: kK9bRIkDRjuK5Z2m8HvmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995299"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005V-3q5M;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 57/98]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:24: error: too few arguments
 provided to function-like macro invocation
Message-ID: <202604050322.BjFPCUaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   dbf3e2d8d5ab9b4a26ad41d244565a4970faec68
commit: aac85b2b324f8d3c2713ee49c1258f6718fa34a5 [57/98] drm/ttm: Check the dma_resv_lock() return value
config: x86_64-buildonly-randconfig-004-20260404 (https://download.01.org/0day-ci/archive/20260405/202604050322.BjFPCUaj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050322.BjFPCUaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050322.BjFPCUaj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:24: error: too few arguments provided to function-like macro invocation
     227 |         KUNIT_ASSERT_EQ(err, 0);
         |                               ^
   include/kunit/test.h:1411:9: note: macro 'KUNIT_ASSERT_EQ' defined here
    1411 | #define KUNIT_ASSERT_EQ(test, left, right) \
         |         ^
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:2: error: use of undeclared identifier 'KUNIT_ASSERT_EQ'; did you mean 'KUNIT_ASSERTION'?
     227 |         KUNIT_ASSERT_EQ(err, 0);
         |         ^~~~~~~~~~~~~~~
         |         KUNIT_ASSERTION
   include/kunit/assert.h:27:2: note: 'KUNIT_ASSERTION' declared here
      27 |         KUNIT_ASSERTION,
         |         ^
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:2: warning: expression result unused [-Wunused-value]
     227 |         KUNIT_ASSERT_EQ(err, 0);
         |         ^~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +227 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

   211	
   212	static void ttm_bo_reserve_interrupted(struct kunit *test)
   213	{
   214		struct ttm_buffer_object *bo;
   215		struct task_struct *task;
   216		int err;
   217	
   218		bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
   219	
   220		task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
   221	
   222		if (IS_ERR(task))
   223			KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
   224	
   225		/* Take a lock so the threaded reserve has to wait */
   226		err = dma_resv_lock(bo->base.resv, NULL);
 > 227		KUNIT_ASSERT_EQ(err, 0);
   228	
   229		wake_up_process(task);
   230		msleep(20);
   231		err = kthread_stop(task);
   232	
   233		dma_resv_unlock(bo->base.resv);
   234	
   235		KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
   236	}
   237	#endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
