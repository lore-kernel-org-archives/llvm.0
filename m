Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3397F2C9E
	for <llvm@lists.linux.dev>; Sun, 12 Dec 2021 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639323084; x=1670859084;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TvJHTDftRtVhfm0rR2RNbVCAzhWtLkM7qr8dRrqfriM=;
  b=WKgFvSJfU3cjmrP4yDbGArFq2rpoxXHPXrTiYkEiyEUgE6jKx898sF+E
   55hN/W78iVZfkRWthvKPXaYjBNxsyb/Uf5WqYEf83yF/ESBVNLYH+AhxW
   6/F/9UmkeTa9QBIaJfSNE+S/gO1eEj0XfLzAtRo7YOPOyVMvM2NPuGi/V
   jozRv4MREckkW/8kHDrcCnyUxiuHXAQdYJLqi64/SRKYSmM45tpQA6lqy
   bq5snf+xHzBTYxEBKIVwzSt7w0k8i2F6fuv383aRHANw7x0fAr2EpuNdw
   KIXrSRBppyJjSOulN7CQWUrToQmZzo4gMDF7HdeUXBQ6mJz20bNev4MjI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="301994189"
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; 
   d="scan'208";a="301994189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 07:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; 
   d="scan'208";a="464329313"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2021 07:31:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwQor-0005oP-Tb; Sun, 12 Dec 2021 15:31:21 +0000
Date: Sun, 12 Dec 2021 23:31:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/sched/fair.o: warning: objtool: unthrottle_cfs_rq()+0xf5f:
 unreachable instruction
Message-ID: <202112122318.o1Hst9VM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: "Michal Koutný" <mkoutny@suse.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Odin Ugedal <odin@uged.al>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 2630cde26711dab0d0b56a8be1616475be646d13 sched/fair: Add ancestors of unthrottled undecayed cfs_rq
date:   2 months ago
config: x86_64-randconfig-a001-20211204 (https://download.01.org/0day-ci/archive/20211212/202112122318.o1Hst9VM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2630cde26711dab0d0b56a8be1616475be646d13
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2630cde26711dab0d0b56a8be1616475be646d13
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ block// drivers/ fs/ kernel/ net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.o: warning: objtool: unthrottle_cfs_rq()+0xf5f: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
