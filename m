Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3F362
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652538619; x=1684074619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8Umuf3SuqvhyBt8dkzAa4QPJtRZJLLyK5CjOFYtC5g=;
  b=POvjBXlR2Rx4mEy0yQ34KOBe7DTYgm9Olyi/kIbbOSEbFu+cjKjO5Oko
   v4q41i0TqAziTC6LFApgoT9yOo0KrjncQH4EyLw7/v+ZFFB25YpbzEMFJ
   goipzu53o1pJyMfH7IU6TXWU2kbiHct1QU/0xPqlH7hzCKmU+M6NlHADp
   maLAyFiJyalmSUAZpIRrjLbvd81iQSvNwpg0ivIXMBvTEcilTmIxJN3PL
   26vSrtCAWPbgJBzIbQf5Fe6F0rUB/VNdKPTCsWf7T8NwR7ItUTQlygYrj
   RBrc/ySJjUruBjdpL/jWkBYv0Tm0vhJfGE9GwajBEyJl2rRcpqigOrB3I
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="295776700"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="295776700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="740569057"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 May 2022 07:30:17 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npsme-0000jx-Bs;
	Sat, 14 May 2022 14:30:16 +0000
Date: Sat, 14 May 2022 22:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [nsaenz-rpi:ct-work-defer-wip 25/25]
 arch/x86/mm/pat/set_memory.c:351:26: error: use of undeclared identifier
 'CONTEXT_WORK_CACHEI'
Message-ID: <202205142203.hnkoIxTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git ct-work-defer-wip
head:   ed63029652239a6befad96dd473b16332913f889
commit: ed63029652239a6befad96dd473b16332913f889 [25/25] context_tracking,x86: Fix Kernel cachei vs NOHZ_FULL
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20220514/202205142203.hnkoIxTp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git/commit/?id=ed63029652239a6befad96dd473b16332913f889
        git remote add nsaenz-rpi https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git
        git fetch --no-tags nsaenz-rpi ct-work-defer-wip
        git checkout ed63029652239a6befad96dd473b16332913f889
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/mm/pat/set_memory.c:351:6: error: use of undeclared identifier 'CONTEXT_WORK_TLBI'
                                           CONTEXT_WORK_TLBI | CONTEXT_WORK_CACHEI);
                                           ^
>> arch/x86/mm/pat/set_memory.c:351:26: error: use of undeclared identifier 'CONTEXT_WORK_CACHEI'
                                           CONTEXT_WORK_TLBI | CONTEXT_WORK_CACHEI);
                                                               ^
   arch/x86/mm/pat/set_memory.c:373:12: error: use of undeclared identifier 'CONTEXT_WORK_TLBI'
                                                 CONTEXT_WORK_TLBI);
                                                 ^
   3 errors generated.


vim +/CONTEXT_WORK_CACHEI +351 arch/x86/mm/pat/set_memory.c

   347	
   348	static bool __cpa_flush_all_cond(int cpu, void *info)
   349	{
   350		return !context_tracking_set_cpu_work(cpu, CONTEXT_USER | CONTEXT_GUEST,
 > 351						CONTEXT_WORK_TLBI | CONTEXT_WORK_CACHEI);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
