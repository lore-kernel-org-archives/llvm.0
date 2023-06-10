Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473891114;
	Sat, 10 Jun 2023 00:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686358566; x=1717894566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8du1IoJYF8IjCG6MDOMNDHFzKdXejpDTnXFBYbeHKGE=;
  b=I1E4zwYT9o8Ui6LR85LW3SWrWNdbLW2P38JfenYfu4EkXE775yD+JXJu
   kCKhw5rRLDbFLDzO+Yz9VAoYaHQVir6ZvAPgkVSoDdSybXYYVsrJTvtPr
   EU+eowGfTC+AhkjV5HGhdOgMHv3m6iInRecz8YX/iXP1XRF2gE0z2Gf0B
   iKiR9EgV99LkheU00evg+/t4bfcbtdzH/OnQkcDk7s/dxDxzqT/Zn8LSW
   QwajNDPt1DnvG3EkzXndJHppZF0xCGPs+Rei98itPnekETJiYa91il+PK
   sSJL0/y90IG2Pt/DvHR/yrVUzpkHBgjE84jqDnpEi5awvaTQD92oGj4WT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338076529"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338076529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710529176"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="710529176"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Jun 2023 17:56:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mtb-0009Yg-1s;
	Sat, 10 Jun 2023 00:55:59 +0000
Date: Sat, 10 Jun 2023 08:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 57/58] kernel/events/core.c:7980:2: error:
 expected expression
Message-ID: <202306100841.VgslriZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: a814a98b2c087f7cdb2b6c08d227b25eacecb08c [57/58] perf: Simplify perf_pmu_output_stop()
config: arm64-buildonly-randconfig-r004-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100841.VgslriZP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=a814a98b2c087f7cdb2b6c08d227b25eacecb08c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout a814a98b2c087f7cdb2b6c08d227b25eacecb08c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/events/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100841.VgslriZP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/core.c:7980:2: error: expected expression
    7980 |         guard(rcu)();
         |         ^
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
     105 |         CLASS(name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:82:2: note: expanded from macro 'CLASS'
      82 |         class_##name##_t var __cleanup(class_##name##_destructor) =     \
         |         ^
   <scratch space>:36:1: note: expanded from here
      36 | class_rcu_t
         | ^
   kernel/events/core.c:11321:6: warning: no previous prototype for function '__perf_pmu_unregister' [-Wmissing-prototypes]
    11321 | void __perf_pmu_unregister(struct pmu *pmu)
          |      ^
   kernel/events/core.c:11321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11321 | void __perf_pmu_unregister(struct pmu *pmu)
          | ^
          | static 
   1 warning and 1 error generated.


vim +7980 kernel/events/core.c

  7973	
  7974	static void perf_pmu_output_stop(struct perf_event *event)
  7975	{
  7976		struct perf_event *iter;
  7977		int err, cpu;
  7978	
  7979	restart:
> 7980		guard(rcu)();
  7981		list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
  7982			/*
  7983			 * For per-CPU events, we need to make sure that neither they
  7984			 * nor their children are running; for cpu==-1 events it's
  7985			 * sufficient to stop the event itself if it's active, since
  7986			 * it can't have children.
  7987			 */
  7988			cpu = iter->cpu;
  7989			if (cpu == -1)
  7990				cpu = READ_ONCE(iter->oncpu);
  7991	
  7992			if (cpu == -1)
  7993				continue;
  7994	
  7995			err = cpu_function_call(cpu, __perf_pmu_output_stop, event);
  7996			if (err == -EAGAIN)
  7997				goto restart;
  7998		}
  7999	}
  8000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
