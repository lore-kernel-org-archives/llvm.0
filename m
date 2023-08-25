Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D65621;
	Fri, 25 Aug 2023 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692926819; x=1724462819;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JEoBqiC0eiTg9naT6UMo2Ho0WVcO1RKUMqTczAHByNw=;
  b=mEnsuFCjJaYo6fswWUHwya+IEoH/iOXMnMFy7IcmnODnwPamDHZeluYm
   8qqMuItIAy7SCKWfvTsFFcAf/AF4YnB5p7M3HiY0QLf3kTEVIL7ySVCHw
   JgAWx03Iz1J9v9FsTd9WpYifoHFCEMZOpxdR+aGQTz7ny04n6x5D+LJtt
   pdqyWQNgn7/9SkGYHS3FzTzs+jK7zJ1Kn1n7Hvz7/JCMXSSEbQhNKBgtx
   GCtZ1sBPnLGdwl+D98w+O9WZ86GTD5jzlLR9m89vCA+swWiln5M6Tn6Mh
   T3wTB5w2WFowZnpq25OmwaJZuqakYCGMqAUlsU0v5nKbT6QiouCJxNm7A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359600420"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359600420"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1068053762"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068053762"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 18:26:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLbE-000360-0P;
	Fri, 25 Aug 2023 01:26:56 +0000
Date: Fri, 25 Aug 2023 09:26:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-buildonly-randconfig-002-20230825/.reduce_errors/vmlinux.o:warning:objtool:___bpf_prog_run:sibling-call-from-callable-instruction-with-modified-stack-frame
Message-ID: <202308250939.2S4OLTNy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8d6ff449094b4b5eff40d4af08e47c520b78bc5
commit: 4ca8cc8d1bbe582bfc7a4d80bd72cfd8d3d0e2e8 x86: kmsan: enable KMSAN builds for x86
date:   11 months ago
config: x86_64-buildonly-randconfig-002-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250939.2S4OLTNy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250939.2S4OLTNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250939.2S4OLTNy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x1fa: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: fuse_emit+0x562: undefined stack state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
