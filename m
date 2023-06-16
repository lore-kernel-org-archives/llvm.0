Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1674613AC1;
	Fri, 16 Jun 2023 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686914608; x=1718450608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wBW/ZKAogvq84/ZILHc/yXwFVurx1OZ+M1yQcpdH6I=;
  b=h8EPfhhf5mVVh7g+wyZUCyJ5WBnH5qkBw2vT5/5jDPg+6XWDpbfB0WT1
   mAG3plUIy0mQC/AVqXYIRQVR+2P990vddZsnkg0HYsanzHY0XTt0Gu9dt
   Yi/MTctuQhO3jWEHguZnTEYjm5z3zJjdHS14v94TwS5dUTlIfeYxgdg6O
   gi/npMjp2vcPkVBKUqCGGfD3w/AKZ0VWvMMGKJHzrWwMC/JqKf5K9KIEd
   XpC4YXNC0rv2NxVXERBodWSp1xx08iPYcm31stXt68nEM6xMZItjc6UU7
   ayKdDYevBzd/ACRNH2WzJuVgwJnGweo9V2tyAaanGhZdqg5f9IQ2w86t4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356682758"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="356682758"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 04:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857348760"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="857348760"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 04:23:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA7Y3-0001Ae-1Q;
	Fri, 16 Jun 2023 11:23:23 +0000
Date: Fri, 16 Jun 2023 19:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 17/20]
 security/loadpin/loadpin.c:259:61: error: too few arguments to function
 call, expected 3, have 2
Message-ID: <202306161916.LD5txgh1-lkp@intel.com>
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
config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161916.LD5txgh1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161916.LD5txgh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161916.LD5txgh1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/loadpin/loadpin.c:259:61: error: too few arguments to function call, expected 3, have 2
           if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
                ~~~~~~~~~~~~~~~                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   include/linux/sysctl.h:220:26: note: 'register_sysctl' declared here
   struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
                            ^
>> security/loadpin/loadpin.c:259:61: error: too few arguments to function call, expected 3, have 2
           if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
                ~~~~~~~~~~~~~~~                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   include/linux/sysctl.h:220:26: note: 'register_sysctl' declared here
   struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
                            ^
>> security/loadpin/loadpin.c:259:61: error: too few arguments to function call, expected 3, have 2
           if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
                ~~~~~~~~~~~~~~~                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   include/linux/sysctl.h:220:26: note: 'register_sysctl' declared here
   struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
                            ^
   3 errors generated.


vim +259 security/loadpin/loadpin.c

0ff9848067b7b9 Ke Wu             2019-05-30  252  
70b62c25665f63 Kees Cook         2018-09-14  253  static int __init loadpin_init(void)
9b091556a073a9 Kees Cook         2016-04-20  254  {
13523bef1e2154 Kees Cook         2018-09-24  255  	pr_info("ready to pin (currently %senforcing)\n",
13523bef1e2154 Kees Cook         2018-09-24  256  		enforce ? "" : "not ");
0ff9848067b7b9 Ke Wu             2019-05-30  257  	parse_exclude();
60ba1028fc7b73 Kees Cook         2022-12-09  258  #ifdef CONFIG_SYSCTL
5df5bdc3c4733a Luis Chamberlain  2023-03-02 @259  	if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
60ba1028fc7b73 Kees Cook         2022-12-09  260  		pr_notice("sysctl registration failed!\n");
60ba1028fc7b73 Kees Cook         2022-12-09  261  #endif
d69dece5f5b6bc Casey Schaufler   2017-01-18  262  	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  263  
70b62c25665f63 Kees Cook         2018-09-14  264  	return 0;
9b091556a073a9 Kees Cook         2016-04-20  265  }
9b091556a073a9 Kees Cook         2016-04-20  266  

:::::: The code at line 259 was first introduced by commit
:::::: 5df5bdc3c4733a47a818576c13a7bfd0f0715124 loadpin: simplify sysctls use with register_sysctl()

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
