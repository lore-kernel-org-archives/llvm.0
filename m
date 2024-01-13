Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD815663;
	Sat, 13 Jan 2024 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtkcOiyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705167675; x=1736703675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htZw0FBjnp3gEewvfyuORHgTa1w2AQ9OhuHrl/9o8Zo=;
  b=VtkcOiyXdblobjzaTrd9X1KKlQlTmQSG+hDZwdCMqUrwb0RSTFjjuMpD
   SwcJv3y5eI/mpy/z6WogPx4xqa2x/kRA1WA03cVA9oybszsGibzeujszO
   pb8Sl6Y2+B+Ngry+5ylSSE7WKdQ89yqHUfQKLftzG5UgD6V6w0OScHvH8
   k5C7jPAZCIdhXlL6OxXv9fzQ75hMEtI59L0T2azsy9DT6RgbZANuhBQpf
   czsGWI772RG87l3LGIPUWBoFVEaOqlDRdNWbjojNS4PT8bd5ehDeBXEuX
   UBil2G6v960cUEmdjVcMCsCg6OkOmILyMO43BPK4qqSLv/8m1sh3z22Xk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="17999819"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="17999819"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 09:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="926707213"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="926707213"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2024 09:41:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOi0M-000Al2-1L;
	Sat, 13 Jan 2024 17:41:10 +0000
Date: Sun, 14 Jan 2024 01:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 22/23] lib/group_cpus.c:352:16: error:
 array initializer must be an initializer list
Message-ID: <202401140117.pwAcsXAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   3d69c575710800c9a4a58e94c157697310e32027
commit: a868f9c8816cb72f983d1ff940b0938737fe8ee7 [22/23] lib/group_cpus: fix initialization section in group_cpus_evenly()
config: i386-randconfig-011-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140117.pwAcsXAT-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140117.pwAcsXAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140117.pwAcsXAT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/group_cpus.c:352:16: error: array initializer must be an initializer list
     352 |         cpumask_var_t npresmsk __free(free_cpumask_var) = NULL;
         |                       ^
   1 error generated.


vim +352 lib/group_cpus.c

   332	
   333	/**
   334	 * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
   335	 * @numgrps: number of groups
   336	 *
   337	 * Return: cpumask array if successful, NULL otherwise. And each element
   338	 * includes CPUs assigned to this group
   339	 *
   340	 * Try to put close CPUs from viewpoint of CPU and NUMA locality into
   341	 * same group, and run two-stage grouping:
   342	 *	1) allocate present CPUs on these groups evenly first
   343	 *	2) allocate other possible CPUs on these groups evenly
   344	 *
   345	 * We guarantee in the resulted grouping that all CPUs are covered, and
   346	 * no same CPU is assigned to multiple groups
   347	 */
   348	struct cpumask *group_cpus_evenly(unsigned int numgrps)
   349	{
   350		cpumask_var_t *node_to_cpumask __free(free_node_to_cpumask) = alloc_node_to_cpumask();
   351		struct cpumask *masks __free(kfree) = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
 > 352		cpumask_var_t npresmsk __free(free_cpumask_var) = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
