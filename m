Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8781DF500;
	Mon, 20 Nov 2023 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTUfqE9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700470350; x=1732006350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPZLGt6UI9pYtOEXLbzH1eJM5jNNTBQEZGnkbehKEME=;
  b=iTUfqE9aF8VvenevfA+9T/XrUO6YxDL8irPNrG2nidIJJUn/nlxc6Ryi
   PNF6fCvQs1Yk+PbWqqGdQUQRGZWUdCTH8qD6aBxhPnPvHh6J/t75lOGEF
   gImLFLrmPBK+MhnJehKPpn9twQ5iBrDarHp+QgmTvNi3o9X6X1rpRI+zc
   q6KpuuzJ7T5fxOVeQB6hUeXf92m5jQjuKDMhVpcUSmOOUjpKXx4izwA9I
   OxYPm3varepe/kjW8Plp2yq9iKQLWZ2yHinZgCXD8ijgmlg+VSSEnGDJA
   +8Lxe2qO2tTT+3i8gihKcr5qQDA9jJPQ7R9cTvNDBQ3Svmh1VMWT18o0X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388718860"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="388718860"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 00:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742662696"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742662696"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 00:52:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r500y-0006ED-0Q;
	Mon, 20 Nov 2023 08:52:20 +0000
Date: Mon, 20 Nov 2023 16:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: fs/bcachefs/replicas.c:25:52: error: builtin functions must be
 directly called
Message-ID: <202311201620.mhbq1YMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   4 weeks ago
config: i386-buildonly-randconfig-006-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201620.mhbq1YMe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201620.mhbq1YMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201620.mhbq1YMe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/replicas.c:25:52: error: builtin functions must be directly called
           eytzinger0_sort(r->entries, r->nr, r->entry_size, memcmp, NULL);
                                                             ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   fs/bcachefs/replicas.c:165:5: error: builtin functions must be directly called
                                   memcmp, &search) < r->nr;
                                   ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   fs/bcachefs/replicas.c:499:9: error: builtin functions must be directly called
                         memcmp, NULL);
                         ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   3 errors generated.


vim +25 fs/bcachefs/replicas.c

    22	
    23	static void bch2_cpu_replicas_sort(struct bch_replicas_cpu *r)
    24	{
  > 25		eytzinger0_sort(r->entries, r->nr, r->entry_size, memcmp, NULL);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
