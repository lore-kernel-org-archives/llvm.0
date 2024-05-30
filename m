Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACCB634;
	Thu, 30 May 2024 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717045283; cv=none; b=jJAJj6coHr++nKcJqw3EWBJ+bhCijMFwZD4Qm6Ko2MNSYP7iUNAW7EzUHAJ1NqrJ/zahxTXAhFApSjORbE8InVsNEJd0o4kghnWdQrdRnWb7+r53Qr5sBt2nVPnbko8FaoCKeU0huj3kEaKGsPHADkRPBsZZ1v4PN/ibx/KqvrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717045283; c=relaxed/simple;
	bh=3fKtsVlscKrDCr0/4RtGhFnZ+mu0HqQoRFjQIXlIXx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEcMJOCCkjJYp9SAPyIdPQ+BF2V+04rKeV3ipkZMZSHoCBFFlSwBxWVemKY+UIvBPU2XKUIXnvGzy6RfcCvR19lgNXH4vxGb0oedQap2xttbTP97cvepxuHKBfh5IFibgRd56ELoKgoR0YmxuibpWfHSsSIaNS2gB4u9uiGVGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUCi+Jph; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUCi+Jph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717045281; x=1748581281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fKtsVlscKrDCr0/4RtGhFnZ+mu0HqQoRFjQIXlIXx8=;
  b=iUCi+JphUsSkEkrkwgNmaGB/FfmUSlFXXEZWFZgC0nrLH7Y1GA30Nl+t
   X3ZLZ7vkXvMvBfeKdEytJgno7+7os1oCBmfxhTFBA8AVTF9Mm7nfOEaQK
   CEYAoNjvuRdzZpE2STxFuZxvClKwvaBai0u4LzLctt38rUg/u4sJG0IzQ
   B8CvOcC8bmTxRaoo+j4OM59ITXBMCeokIdQ5isDdWybNmxLmxjn2YNGV6
   PFPIc6hD+YR/wzDrseZvrjusZLJNmbbcvHnSDFIfltInAqX0AmWP1aPcP
   HG7m/ergaGQNJAiEwZ0N3MVa0+o2SL0sAzCn5pkC3V/A/dCwkjVunwQhQ
   g==;
X-CSE-ConnectionGUID: /EM8QcizQ1a2d8rzeqg63w==
X-CSE-MsgGUID: O99Uqe3WTMihIQUgcsfI8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13315277"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13315277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 22:01:21 -0700
X-CSE-ConnectionGUID: eauEfww9ReOVi8YZll660g==
X-CSE-MsgGUID: Mr5Nwnq/TFG14bPuC29wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66886450"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 22:01:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCXuf-000Ep2-1U;
	Thu, 30 May 2024 05:01:17 +0000
Date: Thu, 30 May 2024 13:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:thin-lto 3/4] make[3]: *** No rule to make target
 'rust/helpers/helpers_combined.c', needed by 'rust/helpers.o'.
Message-ID: <202405301250.AnYihoGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gary,

First bad commit (maybe != root cause):

tree:   https://github.com/nbdd0121/linux thin-lto
head:   d8e271683fffd0c16191967cf6539648cce3a48e
commit: 0fe9d2aea0403e050b76ef4dc17f1a3b70698025 [3/4] kbuild: rust: auto generate rust helper exports
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240530/202405301250.AnYihoGn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301250.AnYihoGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301250.AnYihoGn-lkp@intel.com/

All errors (new ones prefixed by >>):

   cat: kbuild/src/consumer/rust/helpers/bug.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/build_assert.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/build_bug.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/err.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/kunit.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/mutex.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/refcount.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/signal.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/slab.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/spinlock.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/task.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/wait.c: No such file or directory
   cat: kbuild/src/consumer/rust/helpers/workqueue.c: No such file or directory
   make[3]: *** [rust/Makefile:380: rust/helpers/helpers_combined.c] Error 1
   make[3]: *** Deleting file 'rust/helpers/helpers_combined.c'
>> make[3]: *** No rule to make target 'rust/helpers/helpers_combined.c', needed by 'rust/helpers.o'.
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1214: prepare] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
