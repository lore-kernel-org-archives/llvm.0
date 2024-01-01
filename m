Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D817C6;
	Mon,  1 Jan 2024 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OghDGmqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704098577; x=1735634577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8TKFx/40Bvd0ZpORhak/vlP9HKzf+ZlYf+wY+fH2uw=;
  b=OghDGmqH/ZxOhLMSnx9Oh1I0aDNluZOkwaXjRqMdwOV99BSVEwxjpHF6
   orLyQw+fnPZx0LKoIMVpM2w0W6Sh7BHYEY52SrSeu6DJABWBPYAaXQ+v+
   AbwR0XI1Pie412/9DXN6k6uATlRBtqLwGN2Fj2hfvoLO+3mFc00HbhDhS
   unqMVz34V5YPtC0GKkBlxLb9+mqY/yuZ/aRw+7PAxmWvRBd8rKUGdrVBV
   BD4M90/sxpRMO4SzTxkW+2ts7nezkbIFXA22CxsCE4loSgn7Zg3S0dA2g
   FYG9khOBpkImck3hWq8zd8+og2yAy7RZtE0Gw6joleyl+O3nJQAwrRYLg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3601586"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="3601586"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 00:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="922919992"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="922919992"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jan 2024 00:42:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKDsr-000K68-1V;
	Mon, 01 Jan 2024 08:42:53 +0000
Date: Mon, 1 Jan 2024 16:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/13]
 drivers/cpufreq/intel_pstate.c:1494:32: warning: tentative array definition
 assumed to have one element
Message-ID: <202401011656.JH4dCgfV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   a1540fef55aeb1d872b6ecdc983a73b1be14e2f3
commit: 4baf9e0d1d48fa7e06937741dfd72635c3db5dfb [9/13] sched: Make iowait boost per task
config: i386-buildonly-randconfig-003-20240101 (https://download.01.org/0day-ci/archive/20240101/202401011656.JH4dCgfV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401011656.JH4dCgfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401011656.JH4dCgfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/intel_pstate.c:2250:1: error: expected expression
    2250 | }
         | ^
   drivers/cpufreq/intel_pstate.c:3482:77: error: expected '}'
    3482 | MODULE_DESCRIPTION("'intel_pstate' - P state driver Intel Core processors");
         |                                                                             ^
   drivers/cpufreq/intel_pstate.c:2229:1: note: to match this '{'
    2229 | {
         | ^
>> drivers/cpufreq/intel_pstate.c:1494:32: warning: tentative array definition assumed to have one element
    1494 | static const struct x86_cpu_id intel_pstate_cpu_ee_disable_ids[];
         |                                ^
   1 warning and 2 errors generated.


vim +1494 drivers/cpufreq/intel_pstate.c

93f0822dff5dae Dirk Brandewie      2013-02-06  1493  
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26 @1494  static const struct x86_cpu_id intel_pstate_cpu_ee_disable_ids[];
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  1495  

:::::: The code at line 1494 was first introduced by commit
:::::: ed7bde7a6dab521ee9e28fe2264018f83d83c7fa cpufreq: intel_pstate: Allow enable/disable energy efficiency

:::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
