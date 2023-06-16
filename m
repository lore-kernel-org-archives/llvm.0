Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B27469E;
	Fri, 16 Jun 2023 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686918928; x=1718454928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvP56ZSuFicPTI17pIRA967WdIy7eGwfQVKTallktGM=;
  b=h44NE2CkBO7pBlDEMEukvo6hlQCdjamX3rJTMyGY3xTR9oOxH3KGHbgH
   K4Y9E1p8uCJnkY0DbQ1iiL4JU+hgVvZg9OSqyy1VxLcFQ7tLgVZ/jjAZD
   4bRbn3GxCFof38TjRnEhpesagcIpldqTo6AFA3wILO9DH0bKzcEySPO1G
   FRfVlgX0AnSDVeR6qSqF0NIJaH9AHihkkuzaMZFYte5nPlKrf+IxjD+y8
   wR7zBlnODG8X4zJUunCB/BGlgjMfnLlduh+Y98U02JS4ersFGNPNUb9lD
   qI4CxTbPYg2jtCIkJH/nNErfWH465+qzMvVIyv02lIgie1vy9aK9M2hfi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343940860"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="343940860"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 05:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707082591"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="707082591"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jun 2023 05:35:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA8fl-0001Ea-26;
	Fri, 16 Jun 2023 12:35:25 +0000
Date: Fri, 16 Jun 2023 20:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 17/20]
 arch/s390/mm/pgalloc.c:38:48: error: too few arguments to function call,
 expected 3, have 2
Message-ID: <202306162054.fGOLfZsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: 4fc5681f466e84cdd9754c21b713a3af9a4d35b0 [17/20] sysctl: add ARRAY_SIZE to register_sysctl
config: s390-randconfig-r021-20230615 (https://download.01.org/0day-ci/archive/20230616/202306162054.fGOLfZsK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162054.fGOLfZsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162054.fGOLfZsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/mm/pgalloc.c:38:48: error: too few arguments to function call, expected 3, have 2
      38 |         return register_sysctl("vm", page_table_sysctl) ? 0 : -ENOMEM;
         |                ~~~~~~~~~~~~~~~                        ^
   include/linux/sysctl.h:256:40: note: 'register_sysctl' declared here
     256 | static inline struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
         |                                        ^
   1 error generated.


vim +38 arch/s390/mm/pgalloc.c

1e133ab296f3ff Martin Schwidefsky 2016-03-08  35  
1e133ab296f3ff Martin Schwidefsky 2016-03-08  36  static int __init page_table_register_sysctl(void)
1e133ab296f3ff Martin Schwidefsky 2016-03-08  37  {
7ddc873dcb1d05 Luis Chamberlain   2023-03-10 @38  	return register_sysctl("vm", page_table_sysctl) ? 0 : -ENOMEM;
1e133ab296f3ff Martin Schwidefsky 2016-03-08  39  }
1e133ab296f3ff Martin Schwidefsky 2016-03-08  40  __initcall(page_table_register_sysctl);
1e133ab296f3ff Martin Schwidefsky 2016-03-08  41  

:::::: The code at line 38 was first introduced by commit
:::::: 7ddc873dcb1d05eaafceeb4a2afd53bbb31addb8 s390: simplify one-level sysctl registration for page_table_sysctl

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
