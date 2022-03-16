Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA282FB3
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647465098; x=1679001098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15l0PqRKMEta2npsI0WOhNMo+p32RSnKS9/LPY4q348=;
  b=AMVmxfZ9GG5QnK+TD6BXTyf4fJf5j6xXvbv4xMWTVGAI1kG16i+VxMMq
   /9fYYQi7APat4PbbZljBHbeXGB8J4D/ZBAESMNSRYPMVEuufwlnyvA8oT
   gBuzaQzwwiKNshH/FiHPUuWP/COOssjtBOherM0io0JAte+EXQVV+5cLB
   aJsht9ogEwmYzJmGmahzi+8s4oMaHvl3uUjMz/rCLOhBnBzejKdskCZkd
   vc1bQ9DBjU8eJlOsRjPJyMBeZKnmiPJhN/xbc/5lWp66nxZM8Rt7qOhOw
   5XwTHUN3bklgwtkdbViy8hSVmsp09wsyzS0vBlhazvD8xkwzeyDpt5yQq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="319925140"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="319925140"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 14:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="581067067"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2022 14:11:35 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUave-000Cwi-GM; Wed, 16 Mar 2022 21:11:34 +0000
Date: Thu, 17 Mar 2022 05:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 557/2335] kernel/user-return-notifier.c:41:10:
 error: implicit declaration of function 'preempt_disable'
Message-ID: <202203170515.1TR383cF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: 025a44143e076e9fc9c3ae07986dd86b01330f75 [557/2335] headers/deps: Optimize <linux/sched.h> dependencies, remove <linux/sched/cond_resched.h> inclusion
config: i386-randconfig-a016-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170515.1TR383cF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=025a44143e076e9fc9c3ae07986dd86b01330f75
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 025a44143e076e9fc9c3ae07986dd86b01330f75
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/master HEAD 85293bf3fca6d85608cff1447ce3097583f15fab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/user-return-notifier.c:41:10: error: implicit declaration of function 'preempt_disable' [-Werror,-Wimplicit-function-declaration]
           head = &get_cpu_var(return_notifier_list);
                   ^
   include/linux/percpu-defs.h:277:2: note: expanded from macro 'get_cpu_var'
           preempt_disable();                                              \
           ^
>> kernel/user-return-notifier.c:44:2: error: implicit declaration of function 'preempt_enable' [-Werror,-Wimplicit-function-declaration]
           put_cpu_var(return_notifier_list);
           ^
   include/linux/percpu-defs.h:288:2: note: expanded from macro 'put_cpu_var'
           preempt_enable();                                               \
           ^
   2 errors generated.


vim +/preempt_disable +41 kernel/user-return-notifier.c

7c68af6e32c739 Avi Kivity       2009-09-19  33  
7c68af6e32c739 Avi Kivity       2009-09-19  34  /* Calls registered user return notifiers */
7c68af6e32c739 Avi Kivity       2009-09-19  35  void fire_user_return_notifiers(void)
7c68af6e32c739 Avi Kivity       2009-09-19  36  {
7c68af6e32c739 Avi Kivity       2009-09-19  37  	struct user_return_notifier *urn;
b67bfe0d42cac5 Sasha Levin      2013-02-27  38  	struct hlist_node *tmp2;
7c68af6e32c739 Avi Kivity       2009-09-19  39  	struct hlist_head *head;
7c68af6e32c739 Avi Kivity       2009-09-19  40  
7c68af6e32c739 Avi Kivity       2009-09-19 @41  	head = &get_cpu_var(return_notifier_list);
b67bfe0d42cac5 Sasha Levin      2013-02-27  42  	hlist_for_each_entry_safe(urn, tmp2, head, link)
7c68af6e32c739 Avi Kivity       2009-09-19  43  		urn->on_user_return(urn);
3c912b6edaac56 Stephen Rothwell 2009-11-02 @44  	put_cpu_var(return_notifier_list);

:::::: The code at line 41 was first introduced by commit
:::::: 7c68af6e32c73992bad24107311f3433c89016e2 core, x86: Add user return notifiers

:::::: TO: Avi Kivity <avi@redhat.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
