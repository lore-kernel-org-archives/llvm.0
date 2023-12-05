Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB325F1CB;
	Tue,  5 Dec 2023 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frKgb2bJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701791685; x=1733327685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0BlA1xm3NQPmNUZ60JntYjFTfJgYpdP/CtnrQHee6c=;
  b=frKgb2bJjSUgBL2TV/4891oxJR9+MUsJEyWH15lQb37utQsgFca/Greo
   KYKgxabnys09g4P+xd3S2T22UrK34RgQUlg2EZ6cFdrm03bWbXrfqDbNb
   LkjJeCPKyqz/eS1hNAjgWkzADsW6XommNoEm1f1WgviWSqcyY3eSBwsS5
   S4pjvziNA0itdvVNazICBE/P9JQUiitsQUIjlteBbmfT4htYiIl+IjhKu
   afk152gF2p9BZgHhy+n6Z8ayEsKhE67GwRBx7w1ubqUJru8dTTiIDx8z+
   7J4mAWybTLZtBPLT2ec2ik8G2/hliCgjvcBIJ+njgSnfZ8SHH5jiSHihj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397808862"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="397808862"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 07:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747285173"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="747285173"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 07:53:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAXjv-0009GI-0V;
	Tue, 05 Dec 2023 15:53:39 +0000
Date: Tue, 5 Dec 2023 23:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 2/2] fs/proc/cpuinfo.c:25:28: warning:
 variable 'mask' is uninitialized when used here
Message-ID: <202312052315.8qMuW5xY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   efe85e882a6c48174f81a7002f3f7d69f1d7918f
commit: efe85e882a6c48174f81a7002f3f7d69f1d7918f [2/2] proc: Implement /proc/self/cpuinfo
config: i386-randconfig-011-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052315.8qMuW5xY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052315.8qMuW5xY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052315.8qMuW5xY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/cpuinfo.c:25:28: warning: variable 'mask' is uninitialized when used here [-Wuninitialized]
           cpuset_cpus_allowed(task, mask);
                                     ^~~~
   fs/proc/cpuinfo.c:16:20: note: initialize the variable 'mask' to silence this warning
           cpumask_var_t mask;
                             ^
                              = NULL
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/mask +25 fs/proc/cpuinfo.c

    12	
    13	static bool cpu_allowed(struct seq_file *m, int cpu)
    14	{
    15		struct task_struct *task;
    16		cpumask_var_t mask;
    17	
    18		if (cpu >= nr_cpu_ids)
    19			return false;
    20	
    21		task = get_proc_task(file_inode(m->file));
    22		if (!task)
    23			return false;
    24	
  > 25		cpuset_cpus_allowed(task, mask);
    26		put_task_struct(task);
    27	
    28		return cpumask_test_cpu(cpu, mask);
    29	}
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
