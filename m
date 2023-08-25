Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25D7E;
	Fri, 25 Aug 2023 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692922365; x=1724458365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNWW4HPRM3bFTAavgEKC14u1gNTbMdO3Xe08J5MiGqA=;
  b=aRX5oagsBCmCHSfaWo3yhTCEh9KLuRIFk22YxzaifWvjx+w0UgLPOZk5
   GmWCEUNyTIvuSsoXWQKOhX0fJo1rNzKRbPjeBr8A4yFSRRMy7z+QyNWCR
   jANszDZs4Bv7wG+W6mmNPO6FPt30o7+dRtRmj2NgREOfd/X1cOmz6pDEb
   1o3/33ym7oYuawAYSfIuu+/t8NcioQ1786zrOZLL31Ddqf10PLg1up/Lg
   232dSZqm6rMRFnjuPZo12M8fAYsOsIe2PnMJbHhBSrwFTca9SjGq1w5u4
   ET0lX4Obn/TzPxUZBdGAq4AvYWoMlOICa1OUxeH2xnVZkLay8uAmbutoi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373465726"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373465726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1068040856"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068040856"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 17:12:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZKRM-00034E-0H;
	Fri, 25 Aug 2023 00:12:40 +0000
Date: Fri, 25 Aug 2023 08:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ramji Jiyani <ramjiyani@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.15/ffa 2523/4062]
 kernel/gki_module.c:35:6: warning: no previous prototype for function
 'gki_is_module_protected_symbol'
Message-ID: <202308250849.WrBmzX5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: f8bd6cf70dec3961c8b15b987866af33be2ce82b [2523/4062] ANDROID: GKI: Add module load time protected symbol lookup
config: x86_64-randconfig-015-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250849.WrBmzX5x-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250849.WrBmzX5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250849.WrBmzX5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_symbol' [-Wmissing-prototypes]
   bool gki_is_module_protected_symbol(const char *name)
        ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_protected_symbol(const char *name)
   ^
   static 
>> kernel/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_exported_symbol' [-Wmissing-prototypes]
   bool gki_is_module_exported_symbol(const char *name)
        ^
   kernel/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_exported_symbol(const char *name)
   ^
   static 
   2 warnings generated.


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
