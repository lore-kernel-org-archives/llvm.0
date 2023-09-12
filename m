Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B24C171B7;
	Tue, 12 Sep 2023 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694513847; x=1726049847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTLXyEYuUbL7gwJBZqYQ8N+xNOK4Wy0O9t3gmGPBDGE=;
  b=PwIXwL9HqAI5D/3UZRJzSGsSn6+7QCKz+Bjr+ytIVqrj9qa8g1kZzORu
   QcYBoBk9BueYaG+fSMr/SXu4Cr6CA/YNe2ZBrSK4ndahBMSQLZSrQmHTE
   TfETiM25TIuJc3RS9LFBsFHE17q2LdJxHGGeM74Z7NQNO22AtkhVHKaUk
   gTPB0NF3uM8/p7dfo2qGzBIMKPnZNB1yOUmInFZ3dMBreOR53bS1OImzj
   4cfYw2ycFPuySPih9UCKi812VAZnseClJELK6aXHACi003dbLNmrAzOV0
   R8qNNaQ7/gkpqNCn2vLmYvFONTRAqrHfJQ+D3r+niW83vsLef9ng+uqos
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444769282"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444769282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917383239"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="917383239"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Sep 2023 03:17:23 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg0SP-0000FB-1U;
	Tue, 12 Sep 2023 10:17:21 +0000
Date: Tue, 12 Sep 2023 18:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marian Postevca <posteuca@mutex.one>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1078/4552]
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:436:6: warning: no previous
 prototype for function 'acp3x_es83xx_init_ops'
Message-ID: <202309121816.F6d4f7OG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 54fcd9dd44b2c82a0262e29b288c2d0b36c6bba5 [1078/4552] ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
config: x86_64-buildonly-randconfig-004-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121816.F6d4f7OG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121816.F6d4f7OG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121816.F6d4f7OG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:436:6: warning: no previous prototype for function 'acp3x_es83xx_init_ops' [-Wmissing-prototypes]
   void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)
        ^
   sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:436:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)
   ^
   static 
   1 warning generated.


vim +/acp3x_es83xx_init_ops +436 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c

   434	
   435	
 > 436	void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
