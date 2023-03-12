Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC21103;
	Sun, 12 Mar 2023 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678587551; x=1710123551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gQvrLwymSeUYUBXN6bfNtx+lGaa0mkDDp6THoXHHbC4=;
  b=cSy3WMWnz3GgmRtACgSN8FrQ5UETamHQmuaq4uq8gB0GWFG76SlwXJ66
   oFVMEMZiJTavhwBkyEvYbjT727cZ4VRLxL6Bf5yuy4SEnn7P0wUJQAsD3
   K8N2+6L778ARohcb/DfBkPANn463f93q8MjZYlIAlhv67JpE7xWH0/pfM
   kHJOLIBFGZ8XHzYEREKWbgvR+/767R36KBQMtfJ3WnoggT4TYU7IIiNUA
   AdQMip76yEoWDgoiax2mu2Nn9B+X6uPsORhAKAOvxYoQRsDDGd2kSMbNn
   SzP4IoBfU9wgQq+3ctM/qZ2oQnB8plYuWhmtyN9rkLoMH9q5KfbUeFzbQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="401820516"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="401820516"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 18:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="710713107"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="710713107"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Mar 2023 18:19:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbBIi-0004vj-1G;
	Sun, 12 Mar 2023 02:19:08 +0000
Date: Sun, 12 Mar 2023 10:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing 43/44] net/sunrpc/sysctl.c:135:19: error: use
 of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
Message-ID: <202303121035.WHHXW9OR-lkp@intel.com>
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
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230312/202303121035.WHHXW9OR-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121035.WHHXW9OR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sunrpc/sysctl.c:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:753:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
>> net/sunrpc/sysctl.c:135:19: error: use of undeclared identifier 'proc_dodebug'; did you mean 'rpc_debug'?
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
>> net/sunrpc/sysctl.c:162:19: error: use of undeclared identifier 'proc_do_xprt'
                   .proc_handler   = proc_do_xprt,
                                     ^
   net/sunrpc/sysctl.c:178:1: warning: no previous prototype for function 'rpc_register_sysctl' [-Wmissing-prototypes]
   rpc_register_sysctl(void)
   ^
   net/sunrpc/sysctl.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   net/sunrpc/sysctl.c:185:1: warning: no previous prototype for function 'rpc_unregister_sysctl' [-Wmissing-prototypes]
   rpc_unregister_sysctl(void)
   ^
   net/sunrpc/sysctl.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   3 warnings and 5 errors generated.


vim +135 net/sunrpc/sysctl.c

a246b0105bbd9a Chuck Lever       2005-08-11  128  
fe2c6338fd2c6f Joe Perches       2013-06-11  129  static struct ctl_table debug_table[] = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  130  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  131  		.procname	= "rpc_debug",
^1da177e4c3f41 Linus Torvalds    2005-04-16  132  		.data		= &rpc_debug,
^1da177e4c3f41 Linus Torvalds    2005-04-16  133  		.maxlen		= sizeof(int),
^1da177e4c3f41 Linus Torvalds    2005-04-16  134  		.mode		= 0644,
6d4561110a3e9f Eric W. Biederman 2009-11-16 @135  		.proc_handler	= proc_dodebug
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  	},
^1da177e4c3f41 Linus Torvalds    2005-04-16  137  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  138  		.procname	= "nfs_debug",
^1da177e4c3f41 Linus Torvalds    2005-04-16  139  		.data		= &nfs_debug,
^1da177e4c3f41 Linus Torvalds    2005-04-16  140  		.maxlen		= sizeof(int),
^1da177e4c3f41 Linus Torvalds    2005-04-16  141  		.mode		= 0644,
6d4561110a3e9f Eric W. Biederman 2009-11-16  142  		.proc_handler	= proc_dodebug
^1da177e4c3f41 Linus Torvalds    2005-04-16  143  	},
^1da177e4c3f41 Linus Torvalds    2005-04-16  144  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  145  		.procname	= "nfsd_debug",
^1da177e4c3f41 Linus Torvalds    2005-04-16  146  		.data		= &nfsd_debug,
^1da177e4c3f41 Linus Torvalds    2005-04-16  147  		.maxlen		= sizeof(int),
^1da177e4c3f41 Linus Torvalds    2005-04-16  148  		.mode		= 0644,
6d4561110a3e9f Eric W. Biederman 2009-11-16  149  		.proc_handler	= proc_dodebug
^1da177e4c3f41 Linus Torvalds    2005-04-16  150  	},
^1da177e4c3f41 Linus Torvalds    2005-04-16  151  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  152  		.procname	= "nlm_debug",
^1da177e4c3f41 Linus Torvalds    2005-04-16  153  		.data		= &nlm_debug,
^1da177e4c3f41 Linus Torvalds    2005-04-16  154  		.maxlen		= sizeof(int),
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  		.mode		= 0644,
6d4561110a3e9f Eric W. Biederman 2009-11-16  156  		.proc_handler	= proc_dodebug
^1da177e4c3f41 Linus Torvalds    2005-04-16  157  	},
dc9a16e49dbba3 Tom Tucker        2007-12-30  158  	{
dc9a16e49dbba3 Tom Tucker        2007-12-30  159  		.procname	= "transports",
dc9a16e49dbba3 Tom Tucker        2007-12-30  160  		.maxlen		= 256,
dc9a16e49dbba3 Tom Tucker        2007-12-30  161  		.mode		= 0444,
6d4561110a3e9f Eric W. Biederman 2009-11-16 @162  		.proc_handler	= proc_do_xprt,
dc9a16e49dbba3 Tom Tucker        2007-12-30  163  	},
f8572d8f2a2ba7 Eric W. Biederman 2009-11-05  164  	{ }
^1da177e4c3f41 Linus Torvalds    2005-04-16  165  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  

:::::: The code at line 135 was first introduced by commit
:::::: 6d4561110a3e9fa742aeec6717248a491dfb1878 sysctl: Drop & in front of every proc_handler.

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
