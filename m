Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE10A46;
	Fri, 11 Aug 2023 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691752483; x=1723288483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wfjp9vPe+JD7luKk+9el+przasqM1eUAT5kGrmdr+w=;
  b=S8i6jYOjTa4ywJwCDQhHbbOqeco8AGqviB62wnL5Qy3hPh+bMKNMnBs9
   Vbd5qUUlWculyCWl/kIPwnsHbZtNKxsqUB7OeE3gcnFY3TG+EYeLyc+Si
   eReZ7V4zetyMy4bwF9FA391KX4yswVCCQnRw1GpuwF4YFiaHXUm8NNc0s
   k9vqWcQ51NeTo+ntyepbyg5HaSyjgTfJoisNSwaVY3kAonyYNWW5UD9vc
   0Z+zcJ4uV4Anr7tK9ISlsMm+mE7QgLDsExwIZq767O91Q3bO8COUbZ2YM
   8xdnSj+O7pcgjxh2CHYlpNvGfErjkzQpPXg9MEvwd75B2ki3bMK8gsQ51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370550256"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="370550256"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="846765649"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="846765649"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 04:14:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUQ6K-0007kY-0D;
	Fri, 11 Aug 2023 11:14:40 +0000
Date: Fri, 11 Aug 2023 19:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5658/8441] kernel/rcu/update.c:529:6: warning: no
 previous prototype for function 'torture_sched_setaffinity'
Message-ID: <202308111926.gYjAUtn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 521ec59e5453e03a255e183ccee844fe3612f1b4 [5658/8441] torture: Move rcutorture_sched_setaffinity() out of rcutorture
config: x86_64-randconfig-x012-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111926.gYjAUtn4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111926.gYjAUtn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111926.gYjAUtn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/update.c:529:6: warning: no previous prototype for function 'torture_sched_setaffinity' [-Wmissing-prototypes]
   long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
        ^
   kernel/rcu/update.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
   ^
   static 
   1 warning generated.


vim +/torture_sched_setaffinity +529 kernel/rcu/update.c

   526	
   527	#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST) || IS_MODULE(CONFIG_RCU_TORTURE_TEST) || IS_ENABLED(CONFIG_LOCK_TORTURE_TEST) || IS_MODULE(CONFIG_LOCK_TORTURE_TEST)
   528	/* Get rcutorture access to sched_setaffinity(). */
 > 529	long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
   530	{
   531		int ret;
   532	
   533		ret = sched_setaffinity(pid, in_mask);
   534		WARN_ONCE(ret, "%s: sched_setaffinity(%d) returned %d\n", __func__, pid, ret);
   535		return ret;
   536	}
   537	EXPORT_SYMBOL_GPL(torture_sched_setaffinity);
   538	#endif
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
