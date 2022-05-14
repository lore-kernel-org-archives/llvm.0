Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584F7A
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652535617; x=1684071617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ATOwkom89fRH40zG0QcAYWcTUk7vSqR49LMlHjMCims=;
  b=WVeZmDBXf09mtTJhM4V3uwkTA3QdViENQNVJfPvZl8A1FRqS+4eqlkTF
   JEvQjrSYDd+rnp1Mvd+0fVbJ6cwiBdlFbAA4m6iN4k5zsVc3lxIaqF7Tp
   +H+l29cH4oK/AMXTAtuoJQGJWdGqdnGCyP0n6QPPHQzQhgcYMtJHhzo+g
   09WGxTe5vABpAg7896gmaXb5h0SjLx9vkZGTHgPgfCwwtLDD7DT/mWz0+
   v+KwWRtndmbvds8uAvJNbM9QYvh1n7mwvqj2zFjzuS6cX4ZZXAA9YXXzD
   wPswetjx4nqXHlaPN6gLHA7Xihl9FhCmvbXpqfcc0TngO8FZG5AwaUoYU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="270451683"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="270451683"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 06:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="521793037"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 May 2022 06:40:15 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nps0E-0000h3-Ij;
	Sat, 14 May 2022 13:40:14 +0000
Date: Sat, 14 May 2022 21:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [nsaenz-rpi:ct-work-defer-wip 24/25] arch/x86/mm/tlb.c:1010:12:
 error: use of undeclared identifier 'CONTEXT_WORK_TLBI'
Message-ID: <202205142105.ZgamkxvX-lkp@intel.com>
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
commit: ac6fd7356ff9f2e0f040ef337d3eb731454ce49f [24/25] context_tracking,x86: Fix Kernel TLBi vs NOHZ_FULL
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20220514/202205142105.ZgamkxvX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git/commit/?id=ac6fd7356ff9f2e0f040ef337d3eb731454ce49f
        git remote add nsaenz-rpi https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git
        git fetch --no-tags nsaenz-rpi ct-work-defer-wip
        git checkout ac6fd7356ff9f2e0f040ef337d3eb731454ce49f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1010:12: error: use of undeclared identifier 'CONTEXT_WORK_TLBI'
                                                 CONTEXT_WORK_TLBI);
                                                 ^
   1 error generated.
--
>> arch/x86/mm/pat/set_memory.c:367:12: error: use of undeclared identifier 'CONTEXT_WORK_TLBI'
                                                 CONTEXT_WORK_TLBI);
                                                 ^
   1 error generated.


vim +/CONTEXT_WORK_TLBI +1010 arch/x86/mm/tlb.c

  1006	
  1007	static bool do_kernel_flush_cond(int cpu, void *info)
  1008	{
  1009		return !context_tracking_set_cpu_work(cpu, CONTEXT_USER | CONTEXT_GUEST,
> 1010						      CONTEXT_WORK_TLBI);
  1011	}
  1012	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
