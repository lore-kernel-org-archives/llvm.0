Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC3622;
	Sat, 18 Mar 2023 04:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679114675; x=1710650675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjVIBVpaZOkbvxWm4BtwGdkdgVMZfO1y/XWDWblAThI=;
  b=Y6DL0T7ETK/8uDZbMO/q/mtx57CcPsoGkvKGYClVWaLDqteseS0561hC
   IEV71yBEit/FoiNJBv29g5xD99zmgWnZqUhruhz2PmDOklaSGdxAgMu/O
   RzM2eV1zRN/eNSs1S/HUu1be9CzNqMFc0A8f5GlAIuZ2K+PaGMsi8olzF
   1AKRKvBmgnpWkFtgrYRoy6T6DZjaMu4Xck05o7mDeIXWA8QJymcfqXVfg
   fthR9UjmfsMf5lPwxEiNYh8OAE1mZeImDVyyFy+Pz0bh1tr5aKwo0LHdg
   JogjwWr/WEsvcLX8Fo7vtuRwXSn9qkXZJtP3UBy8dqKE+wSfn5A02ZotM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338427923"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="338427923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 21:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712988387"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="712988387"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 21:44:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdOQh-0009oI-1w;
	Sat, 18 Mar 2023 04:44:31 +0000
Date: Sat, 18 Mar 2023 12:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230317-module-alloc-opts 31/31]
 kernel/module/main.c:2673:6: warning: no previous prototype for function
 'module_autoload_proceed'
Message-ID: <202303181235.SaEGYllF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 68dfd11f7ebeb379312f4fc89c2792ce52d71ab4 [31/31] module: add a sanity check prior to allowing kernel module auto-loading
config: x86_64-randconfig-r026-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181235.SaEGYllF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230317-module-alloc-opts
        git checkout 68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181235.SaEGYllF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/main.c:2227:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = -ENOMEM;
               ^
   kernel/module/main.c:2270:8: warning: variable 't' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                           if (i == info->index.mod &&
                               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:2290:7: note: uninitialized use occurs here
           for (t--; t >= 0; t--)
                ^
   kernel/module/main.c:2270:4: note: remove the 'if' if its condition is always false
                           if (i == info->index.mod &&
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:2226:2: note: variable 't' is declared here
           enum mod_mem_type t;
           ^
>> kernel/module/main.c:2673:6: warning: no previous prototype for function 'module_autoload_proceed' [-Wmissing-prototypes]
   bool module_autoload_proceed(const char *name)
        ^
   kernel/module/main.c:2673:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool module_autoload_proceed(const char *name)
   ^
   static 
   3 warnings generated.


vim +/module_autoload_proceed +2673 kernel/module/main.c

  2667	
  2668	/*
  2669	 * We allow contention of the module_mutex here because kernel module
  2670	 * auto-loading a special feature *and* because we are only allowing
  2671	 * MAX_KMOD_CONCURRENT possible checks at a time for a module.
  2672	 */
> 2673	bool module_autoload_proceed(const char *name)
  2674	{
  2675		int err;
  2676	
  2677		mutex_lock(&module_mutex);
  2678		err = module_patient_check_exists(name);
  2679		mutex_unlock(&module_mutex);
  2680	
  2681		if (err == -EEXIST)
  2682			return false;
  2683		return true;
  2684	}
  2685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
