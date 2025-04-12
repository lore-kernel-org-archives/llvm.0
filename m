Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624F2AF04;
	Sat, 12 Apr 2025 17:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480607; cv=none; b=Jb3T4Ns/c8JbWowLcjHa5ftfhX185PzlpQZlb1J0yDPIcUZ8VV4iEJezP/3xDNIEY6kvo/Ck3A6kmTYy1bZBp4Z7o6T/PPeS/UHdFESTC8s5lV1RgXG6Fws1xGkBSRgl3v/4GVg3x4oJsUK67BllWp+eWONSeimxDblAuRzKGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480607; c=relaxed/simple;
	bh=dL7M06wIpd3f/WoSFAcN9ryTHqHAoIig/LExQgKELkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RNGOkM8f3rWGoaxO5VexI6z+FPtTFvFVsEMYH6ATpOXbOfTvml05Pxjk9TzplWzmQpfRR67OkiaSVpYc9br+Jph2FodjXdZ8jeu+55WUjvmjx9v2bjpBZT9qVcUJORaB0Ywz4K+bEPWpH8Prx/uNtaQSTshZmaPRZgUIy9sx/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDNNEWPY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDNNEWPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744480605; x=1776016605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dL7M06wIpd3f/WoSFAcN9ryTHqHAoIig/LExQgKELkw=;
  b=BDNNEWPYEbgHDZnly0duKUnmD67wZtNq+GxSrroUrD/RYEG4JKtt6EaF
   gdu2F4zdhcIMAN3mTj7Eg2sJNTdYVSSumFv89+RzZFwKOjK3IJffwlc0k
   K6S4MbQddA2IYdwDMJEZnwE12BmgfpE5bIoWsUN2aIo06Eawp6KoHxJGT
   dS9U4tZB3DgRpzUi3y0YPVwyw/gQLVSeZNlZmqPfOfVL7PYvgeNKdMV8C
   d9FGybJVbFsBIV/oNMdAtZhs3b6Ys9Dv31nVzzNcH1lK5snTznP2QAhV7
   XZGi3aig6Or+W+X0h5xdFQm3q/wjNGlsdCax3ZqOR6ATSE7w4SIipuj8n
   A==;
X-CSE-ConnectionGUID: Ilnw5K+lRaWat009XSBetw==
X-CSE-MsgGUID: iKxbzDeGQlqMr8zPoADApQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71388980"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="71388980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 10:56:44 -0700
X-CSE-ConnectionGUID: nh7cQVpySAmGpifsrZlVUw==
X-CSE-MsgGUID: OSEZ/KQnTWC0YKtJ13VVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="133559753"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2025 10:56:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3f5t-000C10-1A;
	Sat, 12 Apr 2025 17:56:41 +0000
Date: Sun, 13 Apr 2025 01:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 5/6] ld.lld: error: undefined symbol:
 hv_snp_hypercall
Message-ID: <202504130147.mnn38wWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c77df08731a3ac31472a2d10427e2eb5dc9905c9 [5/6] x86_64,hyperv: Use direct call to hypercall-page
config: x86_64-buildonly-randconfig-004-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130147.mnn38wWo-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130147.mnn38wWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130147.mnn38wWo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hv_snp_hypercall
   >>> referenced by mshyperv.c:495 (arch/x86/kernel/cpu/mshyperv.c:495)
   >>>               vmlinux.o:(ms_hyperv_init_platform)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
