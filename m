Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB571DA3E;
	Wed, 13 Sep 2023 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694591945; x=1726127945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPQNZEe1YEOGiUtznoITlD5zYqVq4jlOgQ1m841xUmo=;
  b=YrWlPKANMHO7G8D0rxrNjiITCFiBGATbQzGvRHwgmsuAQwT9FuFzWLCT
   AXLMNoM4JhC7dU2HYppHx5A15D05oGDKGOChkntymqaoV/PSJECrutGMi
   +IcoiHzZT0JGMdQBiY+tkV378dnMpebZeoaIEQccnbERIOak+7OWQuC8N
   dYkooEega0vqCWVfLxnrIUNsl3V8JKcTKlsnjWUQwcXUfMYE8Whp2TR/4
   hZtXcgkdBEW91UR8YTlCrVW7hlom/AH2dBClHvf1fQUlpfbia+g7UPMMf
   WgrktgjW2ixAlxSOOhehIYlQgOGhx7U879Z62tHM9CXWCmZwrPYuN4zdb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464964996"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464964996"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 00:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917740655"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="917740655"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 00:59:02 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgKm4-0000F7-0D;
	Wed, 13 Sep 2023 07:59:00 +0000
Date: Wed, 13 Sep 2023 15:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 1798/4965]
 arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: warning: no previous
 prototype for function 'plpks_init_var'
Message-ID: <202309131502.S7bZJiaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 9f2c7411ada98f9e062bcd493be7d6b694048505 [1798/4965] powerpc/pseries: PLPKS SED Opal keystore support
config: powerpc64-randconfig-r013-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131502.S7bZJiaV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131502.S7bZJiaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131502.S7bZJiaV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: warning: no previous prototype for function 'plpks_init_var' [-Wmissing-prototypes]
      42 | void plpks_init_var(struct plpks_var *var, char *keyname)
         |      ^
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void plpks_init_var(struct plpks_var *var, char *keyname)
         | ^
         | static 
   1 warning generated.


vim +/plpks_init_var +42 arch/powerpc/platforms/pseries/plpks_sed_ops.c

    41	
  > 42	void plpks_init_var(struct plpks_var *var, char *keyname)
    43	{
    44		var->name = keyname;
    45		var->namelen = strlen(keyname);
    46		if (strcmp(PLPKS_SED_KEY, keyname) == 0) {
    47			var->name = PLPKS_SED_MANGLED_LABEL;
    48			var->namelen = strlen(keyname);
    49		}
    50		var->policy = PLPKS_WORLDREADABLE;
    51		var->os = PLPKS_VAR_COMMON;
    52		var->data = NULL;
    53		var->datalen = 0;
    54		var->component = PLPKS_SED_COMPONENT;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
