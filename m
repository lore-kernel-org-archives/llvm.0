Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A51F932;
	Tue, 25 Jul 2023 17:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690305767; x=1721841767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTUobJQtjdFqCrn8Mo88gQpUzP72AHdZe+fonmmAcq8=;
  b=an74zDjC9EsNcdrlXWYsNwX5cIEBR1Mpoe4hIQz/s2lty63m3e1MEmXw
   y+Ejo+FXdQVR6LFCK6x2FncBgUUOkZkrUEvacASleshLyZ7atsfaJQf0a
   mqI8/VSLVUG/GtAzC0QeSrKZvnE4VFUWPatw0HwFP5u6TcCe2tCdSIDUD
   9+KWnhmunY/MaczfpdUBZHWc2UkbDfcee32P+oBWEtexKa2MMo9NamusA
   oP6DDiwb/9k6nvmU4iiD/4tR48xYMncgZOW9WgA4tGy2Wqgyjyke4Rdek
   UINPVcTr8YvWfe+oDJ0rCrkpLGyO+D1ELZ66fD8zQXPCyPwPp0jWQdXDo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366677698"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="366677698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 10:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="755849070"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="755849070"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 10:22:41 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOLk8-0000BD-2b;
	Tue, 25 Jul 2023 17:22:40 +0000
Date: Wed, 26 Jul 2023 01:21:37 +0800
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
Message-ID: <202307260131.XswRCaVh-lkp@intel.com>
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
config: i386-buildonly-randconfig-r004-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260131.XswRCaVh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260131.XswRCaVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260131.XswRCaVh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/hw_breakpoint/data_breakpoint.c:73:2: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
