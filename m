Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7771867;
	Sat, 12 Aug 2023 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691826609; x=1723362609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3PLem7UORvCwHrwfMYi8BWIgfkOqSmAqZBFFhGLuMA=;
  b=L3rLGeenCEOU7ac8GvJwZba1MPWUE+0UnE+mMiZ1GCT4bMR688+GCj5l
   tvMVvitlvvb8kg9rexQ9D1bmzBwDvwCHc+smkValO8x5EzCBg/flJ/uO2
   p+wTgfvN6BxIfOH2RQ0EMLKX6dnVxhTSOPU8BFHcB9Ypa1M/ELfy2zfFA
   /tS+GB7gI/D7ZugaKDptxlieg99P9Ur7kDeGiSht+xFWubhViBSpHAGxU
   9Pv3Umgyog3w92XkoKD5uQIbYPvmYltwtTVHuHW6ipzeoam1d5mChdwu4
   IczkudtNpui0EIn5vXn8ttxfQhA3eBOUjrv3XmX4PLnotC6WTr2PBch+i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375521191"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375521191"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 00:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876415081"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2023 00:50:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUjNu-0008O5-0e;
	Sat, 12 Aug 2023 07:50:06 +0000
Date: Sat, 12 Aug 2023 15:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: Cannot find symbol for section 10: .text.kallsyms_test_func_weak.
Message-ID: <202308121535.otQuZept-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: 30f3bb09778de64ef9f23fb4bb5f868c4728a071 kallsyms: Add self-test facility
date:   9 months ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308121535.otQuZept-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121535.otQuZept-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121535.otQuZept-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 10: .text.kallsyms_test_func_weak.
   kernel/kallsyms_selftest.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
