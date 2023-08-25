Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF30631;
	Fri, 25 Aug 2023 01:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692926821; x=1724462821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgO7oXXWf20WhU95EfNEyYx5r2vtRSNXmvEZ04PFR24=;
  b=mb7DimxZjf6e34N2ePfscRhrbTOX0ijK4CaDL9+DCAbXigSCqFfETKgy
   +HrHOuHAhnJNqMgQuTgcviDdVKkVtYwMKDnuIxxpUZopdQ+GG3iAsMgbu
   JoXrnLLFuFHmD+HtkjW3aWIgYvRy2TU6JO/aWhTZUCVEeVH6jI9PCWI+A
   ARREPpRwc1Q2BzKFZOZh/IZhrjrlivGwets/5kYUVFKEb22/DVeXEJKLa
   ItIZu/S3OB9hrJxYIsrDFw1uNIWNBoWtDifUDpoeIm2nbPAzeaZXl1O3W
   rrQJ5szEGw0fsjjWDXYgPjOUcbMkLj3QdaAogpIQLq0Vn2oodqOBy5J/d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359600421"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359600421"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1068053764"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068053764"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 18:26:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLbE-000365-0b;
	Fri, 25 Aug 2023 01:26:56 +0000
Date: Fri, 25 Aug 2023 09:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.22a 61/69]
 kernel/locking/locktorture.c:279:13: warning: no previous prototype for
 function 'spinlock_dump'
Message-ID: <202308250940.ak8AUxEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.22a
head:   354957ec11dc80eac68c4b1e10c237d69adc1833
commit: bdd8d60bd4047aa4a7dc207789dc4ad0dfd5f07e [61/69] EXP qspinlock: Dump lock state, add call from locktorture
config: mips-randconfig-r025-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250940.ak8AUxEz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250940.ak8AUxEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250940.ak8AUxEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/locktorture.c:279:13: warning: no previous prototype for function 'spinlock_dump' [-Wmissing-prototypes]
     279 | void __weak spinlock_dump(spinlock_t *sp, bool full)
         |             ^
   kernel/locking/locktorture.c:279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     279 | void __weak spinlock_dump(spinlock_t *sp, bool full)
         | ^
         | static 
   1 warning generated.


vim +/spinlock_dump +279 kernel/locking/locktorture.c

   278	
 > 279	void __weak spinlock_dump(spinlock_t *sp, bool full)
   280	{
   281		pr_alert("%s __weak stub invoked.\n", __func__);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
