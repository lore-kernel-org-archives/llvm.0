Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFE30566E;
	Tue, 19 May 2026 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156800; cv=none; b=sPhtRrQ60+yGJyzUgpQMsgEOO7NhT2FP2k0MRye37bLzM/d4eRkyC3ABo8HLImhbrEE1t0IjuRf4EsxrLTP2uUMdZQy74lKNVxpkHEFWdbCKZtWviSkkmietf0lpQEK/fUYlodoyjnVBGk4fAIjT/Do4j0WRePqfNzhGaMk+lmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156800; c=relaxed/simple;
	bh=Sdv+0Pbf6zUT/t7iwHzNFRndL8lqypnDx0bHtZ7XUS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g4o2Hm1//r/IJ52JkJ1XXICY3RuLhSqwbOWdvoVXNYNATGc+LQdivXcmmAGosB+wWlBM65h8apCc+6z5d58XxK5XXt+ZyiEooyoyy9C4L6+y2rqjErY42kFK5FOu+j27hXPfR6QaATRR2mD9Kw2d4kiwBWPG9HcoLffvm4kkoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuVLoPjQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuVLoPjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156798; x=1810692798;
  h=date:from:to:cc:subject:message-id;
  bh=Sdv+0Pbf6zUT/t7iwHzNFRndL8lqypnDx0bHtZ7XUS4=;
  b=OuVLoPjQAY4cv6Upw2p4XLtH8UBfo/xg8cyNT3DioBY2Xxu195fBEvDB
   7xpnVt6YONtaE+wI5HNgVhqY53EttcieuOb1OCHghzAk+quXr5PgqItto
   vxn0A8xo7t5sUQ9BgBr5jAetrZ4ibG/YfIJD/Zv4561CzWvnlbZ/OiyuI
   HW99d6O4MjzH7FafsO3FVH4wZUxdSplhPt5RHC5+kDe+7tbPEAJK7pIc5
   jGUYgPf/ihWXqI1mOJ9tlMEeO+SaXdUNQrHFZxhfwltaKmOYUk5Pc677o
   lXiDSR0eYFN05ZdxpVofC5jDs7jD+AiQY5FZWp9I9ApEfnn2R11i9sGAk
   A==;
X-CSE-ConnectionGUID: XIsU682jQj63bbRiIoXpXA==
X-CSE-MsgGUID: 6S5Gl2y0RZi305/9T4DWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553805"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:15 -0700
X-CSE-ConnectionGUID: DYnPlRs6QDypOBrTUVI2dw==
X-CSE-MsgGUID: E6/xWJJbTUuZU0kWR5fudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684836"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xH-00000000048-3D5P;
	Tue, 19 May 2026 02:13:11 +0000
Date: Tue, 19 May 2026 06:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 22/238]
 drivers/cpufreq/amd-pstate-ut.c:46:1: error: unterminated function-like macro
 invocation
Message-ID: <202605190635.vpDpLLmC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 378df8f85b52efc8ab80beabeb3d4a7d8290840c [22/238] cpufreq/amd-pstate-ut: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260519/202605190635.vpDpLLmC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190635.vpDpLLmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190635.vpDpLLmC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:46:1: error: unterminated function-like macro invocation
      46 | DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
         | ^
   include/linux/cleanup.h:210:9: note: macro 'DEFINE_FREE' defined here
     210 | #define DEFINE_FREE(_name, _type, _free) \
         |         ^
   1 error generated.


vim +46 drivers/cpufreq/amd-pstate-ut.c

    41	
    42	static char *test_list;
    43	module_param(test_list, charp, 0444);
    44	MODULE_PARM_DESC(test_list,
    45		"Comma-delimited list of tests to run (empty means run all tests)");
  > 46	DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
    47	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
