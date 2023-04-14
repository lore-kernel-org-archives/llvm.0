Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9A0A45;
	Fri, 14 Apr 2023 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681465587; x=1713001587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nl+eFKHb+gdok68AcxHYM4FGOi7i/p8xfU5aAf3kaXE=;
  b=mg9IijGedXCUnjeMRpS7gfmPSqyz19StudZZfdRbuE/fwqRfs+ILPd0i
   ipEDQRSIlrItAt2pmSWkV9NIZc/yOB+CeJR1Wp3ZWN98aDiabm+WVerfh
   466sD5hZZ4dpHKCKftbhUpR8JlRF4WdUQ2Obskva7h0JhT54iVptDk6Ry
   8K3E5GSvaNylNvCIYmd87EPJKVYLHM8d92+DHPkS526plhWwBsyuOeXyn
   aNrKMRe7pKIf0NRhhtJBvURPzvkG3Ho0+r6OsQSsToObu3UDAC+bstJWW
   f/hr8UQA3JYEiRlInOJuK927gt9SynHhuW41oT5cEAiYGTJtMlOUGf2GJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372290824"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="372290824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 02:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864158279"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="864158279"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 02:46:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnG0d-000ZPb-2o;
	Fri, 14 Apr 2023 09:46:23 +0000
Date: Fri, 14 Apr 2023 17:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230413-module-alloc-opts 118/118]
 fs/kernel_read_file.c:278:6: warning: no previous prototype for function
 'kread_dup_request_announce'
Message-ID: <202304141725.PtuOV8eY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230413-module-alloc-opts
head:   b40c1a39dfb04b688a41f60434d18da848d02cf3
commit: b40c1a39dfb04b688a41f60434d18da848d02cf3 [118/118] kread: avoid duplicates
config: hexagon-randconfig-r015-20230413 (https://download.01.org/0day-ci/archive/20230414/202304141725.PtuOV8eY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=b40c1a39dfb04b688a41f60434d18da848d02cf3
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230413-module-alloc-opts
        git checkout b40c1a39dfb04b688a41f60434d18da848d02cf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141725.PtuOV8eY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernel_read_file.c:278:6: warning: no previous prototype for function 'kread_dup_request_announce' [-Wmissing-prototypes]
   void kread_dup_request_announce(char *name, int ret)
        ^
   fs/kernel_read_file.c:278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kread_dup_request_announce(char *name, int ret)
   ^
   static 
   1 warning generated.


vim +/kread_dup_request_announce +278 fs/kernel_read_file.c

   277	
 > 278	void kread_dup_request_announce(char *name, int ret)
   279	{
   280		struct kread_dup_req *kread_req;
   281	
   282		mutex_lock(&kread_dup_mutex);
   283	
   284		kread_req = kread_dup_request_lookup(name);
   285		if (!kread_req)
   286			goto out;
   287	
   288		kread_req->dup_ret = ret;
   289	
   290		/*
   291		 * If we complete() here we may allow duplicate threads
   292		 * to continue before the first one that submitted the
   293		 * request. We're in no rush but avoid boot delays caused
   294		 * by these threads waiting too long.
   295		 */
   296		queue_work(system_wq, &kread_req->complete_work);
   297	
   298	out:
   299		mutex_unlock(&kread_dup_mutex);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
