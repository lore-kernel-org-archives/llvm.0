Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE37E5;
	Sat, 11 Mar 2023 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678575306; x=1710111306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgRZND8DnxbB12eVZQ0+z+9EbFyPOCskgMtOeOXjp+g=;
  b=JcYiMB+/zaMdDGY1IGHP8n5+4gSrJMdjdvv1VMXaF0+kM6Z72q6G63op
   Mr1/luPzDAgSJLgvS7fAUkcCdhGwP0eRJdAHCliiMr4nN5uwr6ATE3kYG
   xFfSFzLbkdBdM7Pt2HskyJxuhbk6gV3hhzELsa4zpDO1yt7hFPlyLypw0
   t+rSKw26f85M7tm++jXMNzzU5P+4P3g3OEkzES0vlKKGnuSn3QlAQLUfT
   x9qIKPhSN/ou4heKWNsmW25O0sccGyFp4LUz44W8HX/nzJMWfeaydnsQQ
   gPV3kIYin22tynfugSN+5K+BXGcMIRMz1byEVFkrOyp714OdJEhinoExX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="338500775"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="338500775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 14:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="680579936"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="680579936"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Mar 2023 14:55:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb87D-0004q1-20;
	Sat, 11 Mar 2023 22:55:03 +0000
Date: Sun, 12 Mar 2023 06:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing 43/44] net/sunrpc/sysctl.c:178:1: warning: no
 previous prototype for function 'rpc_register_sysctl'
Message-ID: <202303120608.ZC8CkGMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing
head:   f66d0fcc0d9164174c2e72045110f43557649cad
commit: 95e20e8aa440148ec8eed523ecc683e4dad15644 [43/44] sunrpc: move sunrpc_table and proc routines above
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230312/202303120608.ZC8CkGMw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=95e20e8aa440148ec8eed523ecc683e4dad15644
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing
        git checkout 95e20e8aa440148ec8eed523ecc683e4dad15644
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120608.ZC8CkGMw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/sysctl.c:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:753:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/sysctl.c:135:19: error: use of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
                   .proc_handler   = proc_dodebug
                                     ^~~~~~~~~~~~
                                     rpc_debug
   net/sunrpc/sysctl.c:30:19: note: 'rpc_debug' declared here
   EXPORT_SYMBOL_GPL(rpc_debug);
                     ^
   net/sunrpc/sysctl.c:142:19: error: use of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
                   .proc_handler   = proc_dodebug
                                     ^~~~~~~~~~~~
                                     rpc_debug
   net/sunrpc/sysctl.c:30:19: note: 'rpc_debug' declared here
   EXPORT_SYMBOL_GPL(rpc_debug);
                     ^
   net/sunrpc/sysctl.c:149:19: error: use of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
                   .proc_handler   = proc_dodebug
                                     ^~~~~~~~~~~~
                                     rpc_debug
   net/sunrpc/sysctl.c:30:19: note: 'rpc_debug' declared here
   EXPORT_SYMBOL_GPL(rpc_debug);
                     ^
   net/sunrpc/sysctl.c:156:19: error: use of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
                   .proc_handler   = proc_dodebug
                                     ^~~~~~~~~~~~
                                     rpc_debug
   net/sunrpc/sysctl.c:30:19: note: 'rpc_debug' declared here
   EXPORT_SYMBOL_GPL(rpc_debug);
                     ^
   net/sunrpc/sysctl.c:162:19: error: use of undeclared identifier 'proc_do_xprt'
                   .proc_handler   = proc_do_xprt,
                                     ^
>> net/sunrpc/sysctl.c:178:1: warning: no previous prototype for function 'rpc_register_sysctl' [-Wmissing-prototypes]
   rpc_register_sysctl(void)
   ^
   net/sunrpc/sysctl.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
>> net/sunrpc/sysctl.c:185:1: warning: no previous prototype for function 'rpc_unregister_sysctl' [-Wmissing-prototypes]
   rpc_unregister_sysctl(void)
   ^
   net/sunrpc/sysctl.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   3 warnings and 5 errors generated.


vim +/rpc_register_sysctl +178 net/sunrpc/sysctl.c

   175	
   176	
   177	void
 > 178	rpc_register_sysctl(void)
   179	{
   180		if (!sunrpc_table_header)
   181			sunrpc_table_header = register_sysctl_table(sunrpc_table);
   182	}
   183	
   184	void
 > 185	rpc_unregister_sysctl(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
