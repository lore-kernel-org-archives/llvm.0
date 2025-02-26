Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F32253FD;
	Wed, 26 Feb 2025 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740606779; cv=none; b=R4rBdEzzBl6LdOk/aRNQj0zfibbIJL12HxIhyiuCmGyhsYyZV1GzPaUrGyWrM30gb3mcICZRiwiCZifvNW2WI3QGVUIJTIW1iGPOzu9NjvBjMvm3Bn5QHbbEN4NXxdXvEyVJ4YbvEGuER6Td5bYTOdgNQSOCj/h4voTo435WxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740606779; c=relaxed/simple;
	bh=JUT3zXqdGD0U5jRAHGBbaOS9hgU64Ou8OTEs0P+uy0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm2PVxH+0Xey7OeKVi+8nYTbgthsP6akyxQVhvlSG7BnlMpoI+pRSv6Elr+ueSMVjemKhbokZkkUVcKFLmzM6JjddSGvO6m7u7AGUusjvbcgGOUnkOnxllv0zs4OnOUDZbJ8eVDogwALZsKkmimj4YulkBwsxLM/zcJewxvEaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePmugUiX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePmugUiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740606777; x=1772142777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUT3zXqdGD0U5jRAHGBbaOS9hgU64Ou8OTEs0P+uy0U=;
  b=ePmugUiXWVLUq1vxFfS7Gl+m9Cp1EZpUckObDo8rPrMRl6ogPXghpa+w
   C/VjmKMVSnPNi7rB4oIX7go62wj654/wcpwzpe/dKjEkANsVSHbMtLG0p
   t7Un/rw33H4pOdWkWA2fAO8IJTruK5UBq+2EvRgJkl67TmJ8lrF1qC5J8
   a4lf/q526xxIJWfjDuIKolttof7iv3Tc8j1gY00v2v20wqDw6+1v4g4Hn
   tcFMqUnp+7gS3oGIaxtoWgfs5ucOZpucGLrrvddeeLhTiamZbtzhjuDJK
   ccBsZJvqQyTnjyVxcUrihOgLO8dNH+MkmuhfeCOxdbM5G+6LzkxdUaQws
   g==;
X-CSE-ConnectionGUID: E3GZvlKvSDizshIDZg/jEg==
X-CSE-MsgGUID: hgxsvkElQ8mPm/Uk+3bK2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44303309"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="44303309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 13:52:57 -0800
X-CSE-ConnectionGUID: x9qUV9ZBRc6T/qxLWYWu1w==
X-CSE-MsgGUID: FriKRESQRsKmoH45cFozpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="147650534"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2025 13:52:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnPKn-000CVK-0W;
	Wed, 26 Feb 2025 21:52:53 +0000
Date: Thu, 27 Feb 2025 05:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 2/4]
 kernel/sched/rt.c:2913:14: error: use of undeclared identifier
 'sched_domains_mutex'
Message-ID: <202502270513.eQknwYIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: dfdff94e7f88b77e61e6cf8ec6aeea320fa12e7e [2/4] sched/deadline: Generalize unique visiting of root domains
config: x86_64-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270513.eQknwYIs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270513.eQknwYIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270513.eQknwYIs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:2913:14: error: use of undeclared identifier 'sched_domains_mutex'
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^
   kernel/sched/rt.c:2940:16: error: use of undeclared identifier 'sched_domains_mutex'
    2940 |         mutex_unlock(&sched_domains_mutex);
         |                       ^
   2 errors generated.


vim +/sched_domains_mutex +2913 kernel/sched/rt.c

  2904	
  2905	static int sched_rt_handler(const struct ctl_table *table, int write, void *buffer,
  2906			size_t *lenp, loff_t *ppos)
  2907	{
  2908		int old_period, old_runtime;
  2909		static DEFINE_MUTEX(mutex);
  2910		int ret;
  2911	
  2912		mutex_lock(&mutex);
> 2913		mutex_lock(&sched_domains_mutex);
  2914		old_period = sysctl_sched_rt_period;
  2915		old_runtime = sysctl_sched_rt_runtime;
  2916	
  2917		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2918	
  2919		if (!ret && write) {
  2920			ret = sched_rt_global_validate();
  2921			if (ret)
  2922				goto undo;
  2923	
  2924			ret = sched_dl_global_validate();
  2925			if (ret)
  2926				goto undo;
  2927	
  2928			ret = sched_rt_global_constraints();
  2929			if (ret)
  2930				goto undo;
  2931	
  2932			sched_rt_do_global();
  2933			sched_dl_do_global();
  2934		}
  2935		if (0) {
  2936	undo:
  2937			sysctl_sched_rt_period = old_period;
  2938			sysctl_sched_rt_runtime = old_runtime;
  2939		}
  2940		mutex_unlock(&sched_domains_mutex);
  2941		mutex_unlock(&mutex);
  2942	
  2943		return ret;
  2944	}
  2945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
