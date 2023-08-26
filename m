Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DF29B0;
	Sat, 26 Aug 2023 22:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693090068; x=1724626068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDRlpeY0vEITNN+Wdwk2GZcPgOoVK5u0o6s78q+jodA=;
  b=EFaLNhgWdosRavf/+fWiOhj5opEE8m9lRYqPA3woHstjL6S6REy6i5fE
   bwnfJu6M3D7SiSYy/opKTk5Bohfdnod9zgVHK3kY8aIXFsbpvujydjTMg
   d9OxgTNVAXbV0e8wik2QkKspvM4zFXxpwsa0F42MOvnjeoJmCc8mO6Lq7
   jRjvUgOhpeYhANbb6WIUADpwNz3yoVM9X9MJ0ZKi0rCCmhj/gDtCHmreB
   OQLDCgqqN/MW8hnMWJY8VHrGNXw8paRpYFxykKXf35ZRpWDt+ONqu+KIY
   RNbP0lCOUcPcHjH4+2mjxszfBDdsTfW/Q4G+smazgzzmHoChr4QVaYTKo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="373782339"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="373782339"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 15:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="984478530"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="984478530"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2023 15:47:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa22a-000595-2Z;
	Sat, 26 Aug 2023 22:46:36 +0000
Date: Sun, 27 Aug 2023 06:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: warning: unsafe memset() usage lacked '__write_overflow' symbol in
 lib/test_fortify/write_overflow-memset.c
Message-ID: <202308270621.uCWbWfPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28f20a19294da7df158dfca259d0e2b5866baaf9
commit: 78a498c3a227f2ac773a8234b2ce092a4403f2c3 x86: fortify: kmsan: fix KMSAN fortify builds
date:   10 months ago
config: x86_64-buildonly-randconfig-002-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270621.uCWbWfPY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270621.uCWbWfPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270621.uCWbWfPY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe memset() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-memset.c
--
>> warning: unsafe memset() usage lacked '__write_overflow_field' symbol in lib/test_fortify/write_overflow_field-memset.c

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
