Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027BC126;
	Tue, 12 Sep 2023 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694560537; x=1726096537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjIZe5wPDzBf3sk3ixLvedqT2B6OXbwQA7e4IoRLbBI=;
  b=SBBHJqUX2rfG96P3sBbgnXquJBFe3eGV3E7dOR9DXt6SaJPnpnl2fFAF
   qieiQGEFUcRTXgw+sdbWAgS1sTut2fIOFqvbGApnyiEi3HjDKCmyMKqg1
   oVxrkRpmU4yeF2B67IoslsArCk+TWI+eoI+Eo4Cs00bEE6QCip4l3RCQ1
   UzN3TRM3jauYoj/O4a1ASeErmWW+ZklDA5HvvQa3n5F5fWfEMzk4aiw86
   K5zfq9YniaGfYQS7gGzJ1O4PG1m4Rv/q4cM/YpfL7TSPzWuqHkPy2zo6t
   QB0SaaqXHKw9EyqR2Rl2A3JwqBut9Z1K/7utzolFWLwgBRDX3Db62dchM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368783633"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368783633"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990675273"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="990675273"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 16:15:06 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgCb2-0000PU-0s;
	Tue, 12 Sep 2023 23:15:04 +0000
Date: Wed, 13 Sep 2023 07:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 4291/4552]
 arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: error: no previous
 prototype for function 'plpks_init_var'
Message-ID: <202309130714.uIQZSaf5-lkp@intel.com>
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
commit: 9f2c7411ada98f9e062bcd493be7d6b694048505 [4291/4552] powerpc/pseries: PLPKS SED Opal keystore support
config: powerpc64-randconfig-r012-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130714.uIQZSaf5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130714.uIQZSaf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130714.uIQZSaf5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: error: no previous prototype for function 'plpks_init_var' [-Werror,-Wmissing-prototypes]
   void plpks_init_var(struct plpks_var *var, char *keyname)
        ^
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void plpks_init_var(struct plpks_var *var, char *keyname)
   ^
   static 
   1 error generated.


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
