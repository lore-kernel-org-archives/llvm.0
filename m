Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0CE34AB13;
	Fri, 17 Oct 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706919; cv=none; b=N+8GpudMbjxWdgHYSz+o/lqWzsPFZ9MrvXG8SeTHZ760uOzBUELHgS7T15UlM5ZH+4x1kNrgmnhWqp5D2NfSkGxXQ6cvY7j0Uk57M67JCL/IhybC8XGnd3jE/92znCrgp5uYze7hn+/VRlYPvPhzZALhGkXHrd58FAPCX6Zm/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706919; c=relaxed/simple;
	bh=DstMHqDbb2O59u5RcZooqCP/wepBOykrbQ8K8sOpv2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QP0o0vQwl66B6zz/fhzwa+0XV+iuXDjjk5JcouxdJVmf57QHczfNxlTHPlBQEUzoNf+m+QJS0TuM1+ua5WDxi98P7FrgxtwvfAju5tYw3PA8t0jC0FuF6mAa1/mStdeGKteT/NyK9/WxBJZOS/QlzbhVj7Gak6Rt+pwDbyfPH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N481lK5I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N481lK5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760706918; x=1792242918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DstMHqDbb2O59u5RcZooqCP/wepBOykrbQ8K8sOpv2o=;
  b=N481lK5I1Q8pius1kBlG19qfBXX5tXRFKiXOxr4cgRrN+FXBCteJ+Exm
   bkokcq2apegu//K0LlFwvZM7YH2ysr2LxkpnEEj1LC+WS8TFiILco5slu
   PbsqiEANzRYy4g9PKXC6Mr6Fdvs5e9+BBHTugSqCtDo5ILRH3wW2CddCf
   nplGibELSbv3kF6gbop0FaSS1C3hW83JJZ3dhohknXKPHiPPP8Wn/VDvA
   yU32sEq3Dhjs3JlBmg/EMNXrmJGoOdK1aIgR7kaVmQ98XbFKb6IzsiWM5
   zYrOxPy3aFXTrMvXWDtxwSYcbuvtU/6ZV1rTBSNaQ6u4VZzFoIEJr/9cj
   A==;
X-CSE-ConnectionGUID: kR667i4LTlW8NGWkRX5qlg==
X-CSE-MsgGUID: Ry8BJy18RWS1xqlkgZwqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62825233"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62825233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:15:18 -0700
X-CSE-ConnectionGUID: /PeT5G8YR52JwCOpAL4O7g==
X-CSE-MsgGUID: da/e4EKiQKWgijNTJb+1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="187138818"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2025 06:15:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9kIb-0005yt-31;
	Fri, 17 Oct 2025 13:15:13 +0000
Date: Fri, 17 Oct 2025 21:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid-v2 40/62] kernel/entry/common.o: warning:
 objtool: .altinstr_replacement+0x6b: redundant UACCESS disable
Message-ID: <202510172153.4PZs3z5I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid-v2
head:   64baaab00f25781e1449f942fee472a2575cb5bf
commit: c0c20d50c60c323e4aa7f7cf0fdb7fb661fb3c51 [40/62] rseq: Switch to fast path processing on exit to user
config: x86_64-buildonly-randconfig-005-20251017 (https://download.01.org/0day-ci/archive/20251017/202510172153.4PZs3z5I-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510172153.4PZs3z5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510172153.4PZs3z5I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/entry/common.o: warning: objtool: .altinstr_replacement+0x6b: redundant UACCESS disable
   kernel/entry/common.o: warning: objtool: .altinstr_replacement+0x6e: redundant UACCESS disable
   kernel/entry/common.o: warning: objtool: irqentry_exit+0x449: call to class_masked_user_rw_access_destructor() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
