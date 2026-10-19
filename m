Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A0489884;
	Mon, 19 Oct 2026 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397431; cv=none; b=oUgDxLkZeOKUW1BKWcKrloNfgK7j/cHFTS5CWFf+AO476Fy93mDHqu4/UaycSoIh05Clb8l8tcu4nBOcXc9iSl/JLNAuk5PGZ78j8zDq+QsG2x+X8NhEzwuzeKYJbgIImXip/0yzbR8LIiC/4Ip4iveoD9dpgOoDGreN7t0qVBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397431; c=relaxed/simple;
	bh=TZLtgYDrV9y/xzk7DCZ8qaQQrbAj26zWtEGs5zgZGF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdpgOV9DVNR/X9ITi2JVXKkXpGKfuLnn5LnhISxj3xky75XxLBIDgfSf8HCjllvVTxeIKFVLrm741zKGozENI9nwrgoQG1cEGVh8mTvrNmh52sYo+cyaTwLGrV5+hqEkHIyHo5qMll2hH8wgsMVtzTJUO6FUWKqOC15w7OfngAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQcxxnq8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQcxxnq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792397431; x=1823933431;
  h=date:from:to:cc:subject:message-id;
  bh=TZLtgYDrV9y/xzk7DCZ8qaQQrbAj26zWtEGs5zgZGF0=;
  b=PQcxxnq86H4XsKPEcxK3ZFSBGwSqFNIIArXLqfelutcnko9gx7v5l0TT
   eTam7VhfjmQU2G8X4fMknbw2Di/HTbThRZKBIyq4F2DizmAdNWMN32Z8Y
   Xs/NGLtWCPS2owG0XgRL/wAIcoBznoLyvm0tFCf8vVAUvCnrM3JXKvZDC
   S8pc4MtmEbwQX/yZX5Nq2xpz30Uxzoj/7j/+mzVTlWfiQ9G3hVmT1jEdl
   b2/Fjf37N3/RndNnEXi5XKFUVi8YwB2zoH+UAczupekq+c7Ov37md3dRl
   svGb9lTCLrQxpH+zxII6NENFbqy4smdBpkNP8Yf6q1iIFLVobuis5CQyW
   g==;
X-CSE-ConnectionGUID: E8cRjwYuSuyup4LZs6+D+g==
X-CSE-MsgGUID: tHCSK/BOQgaWUTP4iqj5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="967059"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="967059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:10:30 -0700
X-CSE-ConnectionGUID: OiNRsVJkSnibrtRd7tlf7Q==
X-CSE-MsgGUID: ZbqlpZFeRIakpbOaUl+wsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2449750"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2026 01:10:28 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIiRu-00000000LPC-1P6U;
	Mon, 19 Oct 2026 08:10:26 +0000
Date: Mon, 19 Oct 2026 16:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/49]
 arch/x86/virt/vmx/tdx/seamldr.c:345:11: error: too many arguments to function
 call, expected 3, have 4
Message-ID: <202610191625.TsaflzDx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: ed49122dfe68295cd1bfd59ae2ae361040151848 [1/49] stop_machine: Add post function to execute while other CPUs can exit
config: x86_64-randconfig-1015-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191625.TsaflzDx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191625.TsaflzDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191625.TsaflzDx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/virt/vmx/tdx/seamldr.c:345:11: error: too many arguments to function call, expected 3, have 4
     344 |         ret = stop_machine_cpuslocked(do_seamldr_install_module, NULL, params,
         |               ~~~~~~~~~~~~~~~~~~~~~~~
     345 |                                       cpu_online_mask);
         |                                       ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:125:27: note: expanded from macro 'cpu_online_mask'
     125 | #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stop_machine.h:166:28: note: 'stop_machine_cpuslocked' declared here
     166 | static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
         |                            ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     167 |                                           const struct cpumask *cpus)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +345 arch/x86/virt/vmx/tdx/seamldr.c

ab6be1168cf963 Chao Gao            2026-05-20  309  
c3e70c5ee53f1a Chao Gao            2026-05-20  310  /**
c3e70c5ee53f1a Chao Gao            2026-05-20  311   * seamldr_install_module - Install a new TDX module.
c3e70c5ee53f1a Chao Gao            2026-05-20  312   * @data: Pointer to the TDX module image.
c3e70c5ee53f1a Chao Gao            2026-05-20  313   * @data_len: Size of the TDX module image.
c3e70c5ee53f1a Chao Gao            2026-05-20  314   *
c3e70c5ee53f1a Chao Gao            2026-05-20  315   * Returns 0 on success, negative error code on failure.
c3e70c5ee53f1a Chao Gao            2026-05-20  316   */
c3e70c5ee53f1a Chao Gao            2026-05-20  317  int seamldr_install_module(const u8 *data, u32 data_len)
c3e70c5ee53f1a Chao Gao            2026-05-20  318  {
23a81e6cce1549 Chao Gao            2026-05-20  319  	struct seamldr_params *params;
23a81e6cce1549 Chao Gao            2026-05-20  320  	const struct tdx_image *image;
23a81e6cce1549 Chao Gao            2026-05-20  321  	int ret;
23a81e6cce1549 Chao Gao            2026-05-20  322  
23a81e6cce1549 Chao Gao            2026-05-20  323  	/*
23a81e6cce1549 Chao Gao            2026-05-20  324  	 * init_seamldr_params() reads the header early.
23a81e6cce1549 Chao Gao            2026-05-20  325  	 * Ensure there is enough data to do at least that.
23a81e6cce1549 Chao Gao            2026-05-20  326  	 */
23a81e6cce1549 Chao Gao            2026-05-20  327  	if (data_len < TDX_IMAGE_HEADER_SIZE)
23a81e6cce1549 Chao Gao            2026-05-20  328  		return -EINVAL;
23a81e6cce1549 Chao Gao            2026-05-20  329  
23a81e6cce1549 Chao Gao            2026-05-20  330  	image = (const struct tdx_image *)data;
23a81e6cce1549 Chao Gao            2026-05-20  331  
23a81e6cce1549 Chao Gao            2026-05-20  332  	params = kzalloc_obj(*params);
23a81e6cce1549 Chao Gao            2026-05-20  333  	if (!params)
23a81e6cce1549 Chao Gao            2026-05-20  334  		return -ENOMEM;
23a81e6cce1549 Chao Gao            2026-05-20  335  
23a81e6cce1549 Chao Gao            2026-05-20  336  	/* Populate 'params' from 'image'. */
23a81e6cce1549 Chao Gao            2026-05-20  337  	ret = init_seamldr_params(params, image, data_len);
23a81e6cce1549 Chao Gao            2026-05-20  338  	if (ret)
23a81e6cce1549 Chao Gao            2026-05-20  339  		goto out;
23a81e6cce1549 Chao Gao            2026-05-20  340  
ab6be1168cf963 Chao Gao            2026-05-20  341  	/* Ensure a stable set of online CPUs for the update process. */
ab6be1168cf963 Chao Gao            2026-05-20  342  	cpus_read_lock();
ab6be1168cf963 Chao Gao            2026-05-20  343  	init_state(&update_ctrl);
ed49122dfe6829 Frederic Weisbecker 2026-10-09  344  	ret = stop_machine_cpuslocked(do_seamldr_install_module, NULL, params,
ab6be1168cf963 Chao Gao            2026-05-20 @345  				      cpu_online_mask);
ab6be1168cf963 Chao Gao            2026-05-20  346  	cpus_read_unlock();
ab6be1168cf963 Chao Gao            2026-05-20  347  
23a81e6cce1549 Chao Gao            2026-05-20  348  out:
23a81e6cce1549 Chao Gao            2026-05-20  349  	kfree(params);
23a81e6cce1549 Chao Gao            2026-05-20  350  	return ret;
c3e70c5ee53f1a Chao Gao            2026-05-20  351  }
c3e70c5ee53f1a Chao Gao            2026-05-20  352  EXPORT_SYMBOL_FOR_MODULES(seamldr_install_module, "tdx-host");
6e97c234cdf0d1 Dave Hansen         2026-05-22  353  

:::::: The code at line 345 was first introduced by commit
:::::: ab6be1168cf963630335a6f08938fd510a9225bf x86/virt/seamldr: Introduce skeleton for TDX module updates

:::::: TO: Chao Gao <chao.gao@intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
