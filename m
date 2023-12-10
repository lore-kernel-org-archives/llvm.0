Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B21CFA8;
	Sun, 10 Dec 2023 22:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N89XU/Bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702247894; x=1733783894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EN08IgAEgyqeRIyaagaAwRK29/EowU3evqySKfqMhH8=;
  b=N89XU/Btx+WVgFq7QRV8raBK36tErdijf7nQYWIjbSz0evHsKST0Bwfm
   sQJKG6r6pQhTuHWMdLKy9RcC7s1Xag1A8vmIPzidYuz1HZ63NFjHKpu1D
   4OPe5GspXhMu9/zG4POslwezgeguLEh8L6MU747jmpu9Z56700Z1Z7dJu
   t/OKS7hUgtFOu5/oTXjIQ6/T9Zvlx/jZmtLoHWif0w61LuR8a53HYxdML
   nw1NGXNYFKT90oZJ6FWyyPLzs6EuxamNQn8oCjVzf+RFTAosk3UwUNyEE
   b6qaozVa/lNnY3fJ2B16JpmKEACstfWw9fSGbWGI/52loFKLG/FBljbbC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="393437417"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="393437417"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 14:38:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766144816"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="766144816"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Dec 2023 14:38:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCSR7-000HLC-1F;
	Sun, 10 Dec 2023 22:38:09 +0000
Date: Mon, 11 Dec 2023 06:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] LSM: Officially support appending LSM hooks after
 boot.
Message-ID: <202312110630.N1lx6TMb-lkp@intel.com>
References: <09e4992c-9def-41b5-a806-2978b3ae35c6@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09e4992c-9def-41b5-a806-2978b3ae35c6@I-love.SAKURA.ne.jp>

Hi Tetsuo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on pcmoore-selinux/next linus/master v6.7-rc4]
[cannot apply to next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/LSM-Officially-support-appending-LSM-hooks-after-boot/20231209-162924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/09e4992c-9def-41b5-a806-2978b3ae35c6%40I-love.SAKURA.ne.jp
patch subject: [RFC PATCH v3] LSM: Officially support appending LSM hooks after boot.
config: i386-buildonly-randconfig-003-20231211 (https://download.01.org/0day-ci/archive/20231211/202312110630.N1lx6TMb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110630.N1lx6TMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110630.N1lx6TMb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/security.c:554:5: warning: no previous prototype for function 'mod_security_add_hooks' [-Wmissing-prototypes]
   int mod_security_add_hooks(struct security_hook_list *hooks, int count, const char *lsm)
       ^
   security/security.c:554:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mod_security_add_hooks(struct security_hook_list *hooks, int count, const char *lsm)
   ^
   static 
   1 warning generated.


vim +/mod_security_add_hooks +554 security/security.c

   553	
 > 554	int mod_security_add_hooks(struct security_hook_list *hooks, int count, const char *lsm)
   555	{
   556		int i;
   557	
   558		if (!static_branch_unlikely(&mod_security_enabled)) {
   559			pr_info("Modular LSM support is not enabled.\n");
   560			return -EINVAL;
   561		}
   562		pr_info("Registering modular LSM: %s\n", lsm);
   563		for (i = 0; i < count; i++) {
   564			hooks[i].lsm = lsm;
   565			hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);
   566		}
   567		return 0;
   568	}
   569	EXPORT_SYMBOL_GPL(mod_security_add_hooks);
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
