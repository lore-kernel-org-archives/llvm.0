Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6E3168
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639464193; x=1671000193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zihrvfTZOHS81x6JjSCk9tbag0HqJyS22FPf4JWEsK8=;
  b=MyqBCFut5tPRDjIMZuKPWiAEcQ/0JqSEPdQKhK9BLSTJTeY5BVAqSi9F
   iLIXEzpoiZczIH2Oil5ggCatVsSri355q07CTbyFGnBtbhHgLZbn/cmfX
   wugQ4RtohsE6tf80kPIVy9UmkhSKTwQolNZpzmcL0gKrEv1AUqolIzf9J
   1d5K2SkgGXJgPsUT4Rk8ufWw8IU61t7qGFW7l3TXg/SrVBb0DbvjQWisY
   0LfKVMcHX9at1fsRYzaUtV2flJYmdXx6akR/K8bb+Jq3INPJDF1YSiUvK
   vsDWFwISxHx+MN52eKvTYBn4rd6Xb3OHEla1CWHhY1ncGHtYxOtWlRAB3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="237647865"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="237647865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 22:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="463681529"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Dec 2021 22:43:11 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mx1Wo-0007WK-A8; Tue, 14 Dec 2021 06:43:10 +0000
Date: Tue, 14 Dec 2021 14:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ebiederm-user-namespace:signal-for-v5.17 10/12]
 kernel/kthread.c:299: warning: expecting prototype for kthread_complete_and
 exit(). Prototype was for kthread_complete_and_exit() instead
Message-ID: <202112141422.Cykr6YUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git signal-for-v5.17
head:   6b1248798eb6f6d5285db214299996ecc5dc1e6b
commit: cead18552660702a4a46f58e65188fe5f36e9dfe [10/12] exit: Rename complete_and_exit to kthread_complete_and_exit
config: i386-randconfig-a001-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141422.Cykr6YUS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git/commit/?id=cead18552660702a4a46f58e65188fe5f36e9dfe
        git remote add ebiederm-user-namespace https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git
        git fetch --no-tags ebiederm-user-namespace signal-for-v5.17
        git checkout cead18552660702a4a46f58e65188fe5f36e9dfe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:299: warning: expecting prototype for kthread_complete_and exit(). Prototype was for kthread_complete_and_exit() instead


vim +299 kernel/kthread.c

   285	
   286	/**
   287	 * kthread_complete_and exit - Exit the current kthread.
   288	 * @comp: Completion to complete
   289	 * @code: The integer value to return to kthread_stop().
   290	 *
   291	 * If present complete @comp and the reuturn code to kthread_stop().
   292	 *
   293	 * A kernel thread whose module may be removed after the completion of
   294	 * @comp can use this function exit safely.
   295	 *
   296	 * Does not return.
   297	 */
   298	void __noreturn kthread_complete_and_exit(struct completion *comp, long code)
 > 299	{
   300		if (comp)
   301			complete(comp);
   302	
   303		kthread_exit(code);
   304	}
   305	EXPORT_SYMBOL(kthread_complete_and_exit);
   306	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
