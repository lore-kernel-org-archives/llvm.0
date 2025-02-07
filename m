Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60D282F4;
	Fri,  7 Feb 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909336; cv=none; b=a4PTnOClQJYxuakWQJIqIANVDcu6+3Va4b4jAwY9eot05DBLP99zQffplsb58nhplMsitl5GJ89XFO2OqcBoB+icES07Nr0za7B1dKPqrk0vi9P1vA4fgvDuerVL9mgtX5rtR3D6AxQreS59hi0asWSbGpgCMsJ/KucXo7+gYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909336; c=relaxed/simple;
	bh=2YM/5FBXgkLIO2jgUM3w11Fdre+p9vlutZIZ+I8Tu2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jbh1vQnE8+ovKXxPyhDoKM9ACFyuehy0M5zH+jxIVaZsi8GP+1Ig8vlWAOFVQOFK581vg0W/U08Dnkd3sg+s98iiWtZ+otwpk9FQ1Wrd5v29CEnvISMMISVsjwDKexXhGuPUGOQDYPtb0CGkbqq4ZMUri6LhvNOO9HGTj+pdyWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPAUx87O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPAUx87O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738909335; x=1770445335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2YM/5FBXgkLIO2jgUM3w11Fdre+p9vlutZIZ+I8Tu2c=;
  b=cPAUx87O61CJ2osAQt52aMBxRKVBJQ+pnMsh8//Mmq6uL1De5Aw6V1g+
   nQcdYyz2bdjVIcvRl7wj3Q+wurS2aJAzqONitfbGDOIbZHziuwyhSlAcG
   75r5lYLDIxroa3br4hXH/T1sctAy/DfqQNn0otG5h1DNY4CRuMMu1A81b
   NXVEgHWZyy9KEZuC9/gme4XLhgHTMMm8SXzsI9nO8aVdwpb2CO/8gDlzY
   ahDt1CgT7GjAiHWVva/w2ltf+VKbh4h0Udw99U9aA0Auo1VDwd6HDJ9T3
   sKRxnx7QNax3DGCbGkKIuw9uXSvYOp80t0b3GSWcKdLK5MkPvqpJ8ZKRg
   w==;
X-CSE-ConnectionGUID: aQOwYgKmSgG6n7Q2+ucocQ==
X-CSE-MsgGUID: /vgjf5u2SL+HQfIFPqQ7NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39438090"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39438090"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 22:22:14 -0800
X-CSE-ConnectionGUID: 7Mga90wPQCiEafbDcmrcFg==
X-CSE-MsgGUID: TjeVWkt2RLSTsr5mLkWhLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111219668"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2025 22:22:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgHkg-000xpX-0z;
	Fri, 07 Feb 2025 06:22:10 +0000
Date: Fri, 7 Feb 2025 14:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 6/6] kernel/sched/isolation.c:256:2:
 error: call to undeclared function 'lru_add_and_bh_lrus_drain'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502071437.L4azQDHg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   3a5b43d6075ec915d0bf17d38d15f9c75d05dc26
commit: 3a5b43d6075ec915d0bf17d38d15f9c75d05dc26 [6/6] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
config: arm64-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071437.L4azQDHg-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071437.L4azQDHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071437.L4azQDHg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:104:
>> kernel/sched/isolation.c:256:2: error: call to undeclared function 'lru_add_and_bh_lrus_drain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           lru_add_and_bh_lrus_drain();
           ^
   1 error generated.


vim +/lru_add_and_bh_lrus_drain +256 kernel/sched/isolation.c

   252	
   253	#if defined(CONFIG_NO_HZ_FULL)
   254	static void isolated_task_work(struct callback_head *head)
   255	{
 > 256		lru_add_and_bh_lrus_drain();
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
