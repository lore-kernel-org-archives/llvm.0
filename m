Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB7161;
	Sun, 18 Jun 2023 00:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687046878; x=1718582878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BoP/62sx1G44g8O/5pgdWI4xhFq2MViPN5pf+kKy0o=;
  b=F+TO74klFSUIPvUsJHmZAdcILGO1ajL88mdcav3/BgfzdmPItJg9Y7/p
   p3roCZRPvPo9gThKXAgoHoohWvbhDFwXrEgG/dzBHUxnvFRLgHVe6S/x8
   vXc7O3fi1Wv7p7SEqPRiKO2TXHZ9fMUPKhm605qFBBcmg5dNrMVmJIjpl
   Z4tYxXQ2ptN3ituLvNdfCesO0Q9EPRkS4QEPjgV17Px7RBrd02ot0EL5h
   iwV6AknuxkJyASJl9cxskZ4pXTinyURvcOgHpPGEO7F95x9EbCc70N5Tq
   NEC2f/eDomf/LCo7SlYa31QC9ZjuqEu40d05C7glFBFK2Lb7EVHwkMVzn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="445814488"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="445814488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 17:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="707469830"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="707469830"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jun 2023 17:07:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAfxT-0003Ei-0k;
	Sun, 18 Jun 2023 00:07:55 +0000
Date: Sun, 18 Jun 2023 08:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 15/17]
 security/apparmor/lsm.c:1788:56: error: too few arguments to function call,
 expected 3, have 2
Message-ID: <202306180806.AEimnkkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: 7a2fed21b12abf7123a9ed26964303649e535eca [15/17] sysctl: Add size to register_sysctl
config: i386-randconfig-r003-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180806.AEimnkkK-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180806.AEimnkkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180806.AEimnkkK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/apparmor/lsm.c:1788:56: error: too few arguments to function call, expected 3, have 2
           return register_sysctl("kernel", apparmor_sysctl_table) ? 0 : -ENOMEM;
                  ~~~~~~~~~~~~~~~                                ^
   include/linux/sysctl.h:230:26: note: 'register_sysctl' declared here
   struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
                            ^
   1 error generated.


vim +1788 security/apparmor/lsm.c

e3ea1ca59adaef Tyler Hicks      2016-03-16  1785  
e3ea1ca59adaef Tyler Hicks      2016-03-16  1786  static int __init apparmor_init_sysctl(void)
e3ea1ca59adaef Tyler Hicks      2016-03-16  1787  {
96200952abeb35 Luis Chamberlain 2023-03-02 @1788  	return register_sysctl("kernel", apparmor_sysctl_table) ? 0 : -ENOMEM;
e3ea1ca59adaef Tyler Hicks      2016-03-16  1789  }
e3ea1ca59adaef Tyler Hicks      2016-03-16  1790  #else
e3ea1ca59adaef Tyler Hicks      2016-03-16  1791  static inline int apparmor_init_sysctl(void)
e3ea1ca59adaef Tyler Hicks      2016-03-16  1792  {
e3ea1ca59adaef Tyler Hicks      2016-03-16  1793  	return 0;
e3ea1ca59adaef Tyler Hicks      2016-03-16  1794  }
e3ea1ca59adaef Tyler Hicks      2016-03-16  1795  #endif /* CONFIG_SYSCTL */
e3ea1ca59adaef Tyler Hicks      2016-03-16  1796  

:::::: The code at line 1788 was first introduced by commit
:::::: 96200952abeb35c4407851bfcdcbc144cc0d027d apparmor: simplify sysctls with register_sysctl_init()

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
