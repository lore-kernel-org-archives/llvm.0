Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3BD2F1;
	Wed, 16 Aug 2023 22:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692225522; x=1723761522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CO5A5P2eUHmFyMZg3w6+rv/UdmA5bIeUSUXOuHm8Rgg=;
  b=NihBFsz/zX606crMOKQlA1GXVLm+Dg62VE8trlg5TgWzdv5XKsKaVXFb
   wZHnCXAU5Abzf9UdQ93CyTAxDskacwQstjvpxn6OUZH4143IjiOqrbCOE
   bO/UtpjPVBMB7nJsJ/PoH5b5i6uuXXA9fKsChuQAenH6YOg/K1EcSjqG3
   ankDdWUZJla248vRX4vXd1OMupbP+rV9SQaQ5oMVdSvsZ9o7CWZEry9Jf
   80xiSSZ2+2LHcOUpBh3xzilYKdApuW5H8eEqwAQXhOP86b0qoNFhD/j0n
   BjlABbyc35bE0KXZUebNGt9PXgrQBkDTF9uDpSnKgyn/b/0vVt48onYCQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352973421"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352973421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763795088"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="763795088"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 15:38:40 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWP9t-0000ct-20;
	Wed, 16 Aug 2023 22:38:35 +0000
Date: Thu, 17 Aug 2023 06:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Kelley <mikelley@microsoft.com>
Subject: [lantianyu:test 14/21] ld.lld: error: undefined symbol:
 isolation_type_en_snp
Message-ID: <202308170646.cOnDa07c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   f5c4c5f104612a69401a5343609c6f939716896a
commit: 7a649840782fb85d5d719118dd4b404d535345e3 [14/21] x86/hyperv: Add sev-snp enlightened guest static key
config: x86_64-randconfig-x013-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170646.cOnDa07c-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170646.cOnDa07c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170646.cOnDa07c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: isolation_type_en_snp
   >>> referenced by instrumented.h:68 (include/linux/instrumented.h:68)
   >>>               vmlinux.o:(ms_hyperv_init_platform)
   >>> referenced by instrumented.h:68 (include/linux/instrumented.h:68)
   >>>               vmlinux.o:(ms_hyperv_init_platform)
   >>> referenced by atomic.h:23 (arch/x86/include/asm/atomic.h:23)
   >>>               vmlinux.o:(ms_hyperv_init_platform)
   >>> referenced 13 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
