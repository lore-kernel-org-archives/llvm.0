Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6EE14A80;
	Tue, 25 Jul 2023 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276261; x=1721812261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVvZMGlNxFOyRp5ybUbMCJLG1sxkCkknAK2Gac3C7Co=;
  b=E0JbMfPm00PoB9N3yOc++j9C6/bRf/4rUQ9dvDGC07m7SVs4DQFE9zQK
   1RmqOUfJozXnP69nACtn3V75ec7c19YNc852r5ZsSN+Q2Lmk/fBxBZrfG
   SWjiRnJ8UwgvckLNpNX8VFVpnL1Vu3wM5e6h9Vo7L+PNikgnAsm+PkXA8
   8WmV1HXu7N34piScWUf2bCAGr1d77x9UZ3ZCUgMQVE3H5OC/XCtV8hW/V
   7mz/P5ysc3YDj5OSCHCUe3PXW7ZI81WhM96Hmub/RBX2YP0GOafHXP0Uu
   toSka31Liuvlnl7kB+nl2uxLKEAcqtAkiQYoo0xL2DV7Cw92TMoYDuu/l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365123827"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="365123827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 02:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791297909"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791297909"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 02:10:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOE4C-000AUC-13;
	Tue, 25 Jul 2023 09:10:56 +0000
Date: Tue, 25 Jul 2023 17:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Tao <rongtao@cestc.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 3803/4327]
 samples/hw_breakpoint/data_breakpoint.c:73:2: error: call to undeclared
 function '__symbol_put'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202307251703.AgPdzkAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e25dd7772483f477f79986d956028e9f47f990a
commit: 910e230d5f1bb72c54532e94fbb1705095c7bab6 [3803/4327] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
config: i386-buildonly-randconfig-r004-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251703.AgPdzkAe-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251703.AgPdzkAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251703.AgPdzkAe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/hw_breakpoint/data_breakpoint.c:73:2: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __symbol_put(ksym_name);
           ^
   samples/hw_breakpoint/data_breakpoint.c:73:2: note: did you mean '__symbol_get'?
   include/linux/module.h:301:7: note: '__symbol_get' declared here
   void *__symbol_get(const char *symbol);
         ^
   1 error generated.


vim +/__symbol_put +73 samples/hw_breakpoint/data_breakpoint.c

    69	
    70	static void __exit hw_break_module_exit(void)
    71	{
    72		unregister_wide_hw_breakpoint(sample_hbp);
  > 73		__symbol_put(ksym_name);
    74		printk(KERN_INFO "HW Breakpoint for %s write uninstalled\n", ksym_name);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
