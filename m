Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040414AA7;
	Fri, 18 Aug 2023 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692345636; x=1723881636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrMwbZh7etk/SoX6ujozcIHwKlca0dDPqmB5AACzLVw=;
  b=N2DJKvdroLn7TJNiHCZGwhgaEnjvf/tP+gJj7l0SZ6NmscQNgg1M6XF2
   YOKL6DNWaz6fZtyxEfIEW+72apwJu9biTeVoX5KDDdN8Y1725ABjAub47
   ZRE+eKhVM8/ad9sPKY8/1xMRtTTkqZ3W1XvFYTgQxm2VXJzEO9hEHMmx1
   dw7k/sPGUvQhSlBCrOn9SfOp0vmW4RKQN2SHZc/M6cbgcs72cfwB1uzQr
   4ecuCSH3fAJWvQR3Ygfv/FXVulNKXfZBKgKvM1cBbJ7fK7sOXahtx2I3o
   LctTksyif2wGgvJovkJjLXJr781Ee9uYc6dAjWlAPOgnqtZAlaHvJlpOX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376801919"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="376801919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 01:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="849189503"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="849189503"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2023 01:00:32 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWuPE-0002FW-2d;
	Fri, 18 Aug 2023 08:00:29 +0000
Date: Fri, 18 Aug 2023 15:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 21/79]
 arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function
 'simple_feature_tweak'
Message-ID: <202308181501.AR5HMDWC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   c56963d48343b50998bacc6df949217c950163e3
commit: 54f30b83fe627453082f15d83d7820b28b2d24bb [21/79] powerpc: address missing-prototypes warnings
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230818/202308181501.AR5HMDWC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181501.AR5HMDWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak' [-Werror,-Wunused-function]
   static inline int simple_feature_tweak(struct device_node *node, int type,
                     ^
   1 error generated.


vim +/simple_feature_tweak +137 arch/powerpc/platforms/powermac/feature.c

14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  132  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  133  /*
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  134   * Here are the chip specific feature functions
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  135   */
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  136  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26 @137  static inline int simple_feature_tweak(struct device_node *node, int type,
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  138  				       int reg, u32 mask, int value)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  139  {
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  140  	struct macio_chip*	macio;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  141  	unsigned long		flags;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  142  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  143  	macio = macio_find(node, type);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  144  	if (!macio)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  145  		return -ENODEV;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  146  	LOCK(flags);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  147  	if (value)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  148  		MACIO_BIS(reg, mask);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  149  	else
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  150  		MACIO_BIC(reg, mask);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  151  	(void)MACIO_IN32(reg);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  152  	UNLOCK(flags);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  153  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  154  	return 0;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  155  }
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  156  

:::::: The code at line 137 was first introduced by commit
:::::: 14cf11af6cf608eb8c23e989ddb17a715ddce109 powerpc: Merge enough to start building in arch/powerpc.

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
