Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940B4A10;
	Mon, 21 Aug 2023 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692644598; x=1724180598;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4bp51MPdqQVgk1/NyCV0pt/guUxUd0QgSzkzlm9nLQw=;
  b=EdvILDGwKRxzo1oHlhxtlcaHB3CapdHgJVo/iLGx9S045Chn+H+yl9KO
   HzXGPBDnWli3APcT942mYRpmrbNj3SGbxoKj0b4I3cLBZR7VfSDj8s83W
   k5JICQ0ppokjWameHxiIV4GHm87d6aSqNjKw17d1IyHTJPY3j5Pd+ORjM
   wa0KyvMnbvaGwtK0jk98NNKPeeirAe9yspeNIa7Li6B20DVItuOYi4MvK
   zLiFA/D4aUeUEgD+dsQny+kc0ti2XyS/kfVTYYmG+pwbht3XFkwSnUPan
   e1vaOPpt5eKH6wvwP7APE3EwzT/F0sxd6Ii4veqQj7zHeyYQurizcKcFD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358662156"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="358662156"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 12:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859585322"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="859585322"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 12:03:17 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYAAe-0000oo-0N;
	Mon, 21 Aug 2023 19:02:55 +0000
Date: Tue, 22 Aug 2023 03:00:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 849/9999] fs/freevxfs/vxfs_olt.o: warning:
 objtool: vxfs_read_olt() falls through to next function tsan.module_ctor()
Message-ID: <202308220219.1spbvv45-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [849/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-015-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220219.1spbvv45-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220219.1spbvv45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220219.1spbvv45-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/freevxfs/vxfs_olt.o: warning: objtool: vxfs_read_olt() falls through to next function tsan.module_ctor()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
