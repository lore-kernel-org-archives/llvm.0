Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94719D08F;
	Thu, 15 May 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317899; cv=none; b=cJRtlRU0wMDYkhC2eCSdszYcyFefDOOnuSFXVUAhlTQUIU6U0BfZEkX/JFKMP4XqrYNOO6HRYKTlLqJnP6yAklHFjwxcDr01YPJbWojGXPxoNdQPSDlESB3wUFlaaL7FT0xObl+hoJoEPHOr1UnCIciaNeDIBXzswxQnYwP0zaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317899; c=relaxed/simple;
	bh=r1p+FV6djhLa+cbI8e/2Z9BgF0sx4hIKM1DrL6mCX3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RduA7+vgBhdcnTPSzhjE3vFyPSRRsSoM9tc8EkXIZf7mp83SzxaPJGe3A3+iAjpE0IQX451J067PhgbjJ1M5J4lX+QHitGKdjtabuttk/dSx2vq068/Ds4wc3WB9cQP/Xxm3nrxMi10//6eaGc12gei6h9jGeOsmwHqIdL353p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atpyruIO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atpyruIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317898; x=1778853898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r1p+FV6djhLa+cbI8e/2Z9BgF0sx4hIKM1DrL6mCX3U=;
  b=atpyruIOpk2rsl+15JAYGRZ1+YZ808BFT13trl8aYIJQeXUdY/Upc1K8
   OMEjWCa5I0Qn/1fuVHogdxxn8Lqi2S9xaD/J+w1c4NIbb4f0xRoWOYeJa
   bvToz8Xik0gRFJ+OPpHsSTRwpUbY5+pzdk+Qzfna5zNG9wU1uT5h8DED2
   BUb9F1H0mk6gpIlRi2GyuxWn0P1u9fBr/nfxvHvaIFNjH6gRMI4DhkxxR
   hFWiUVKT73ue5CmLSqZwpN8UYVqvbZy915lnA0vZ61sL2jRzsMokC9sI8
   kq4+vIY3w+crE6b/27BpUcv+80tVBjhzU1J5tGQ/VjUiNC8+KoWLI0Sx6
   g==;
X-CSE-ConnectionGUID: 0PGNmaZKRPiVYt+ALc6cmQ==
X-CSE-MsgGUID: bcm6A6bKQV+C2Ep9oFdV4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943635"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:53 -0700
X-CSE-ConnectionGUID: 09gDly3MSoCBd4AQxqlOKw==
X-CSE-MsgGUID: ms/Qlvo3RWKE86sFDTsbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778836"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000Et-19;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Subject: [chanwoo:devfreq-testing 5/5]
 drivers/devfreq/hisi_uncore_freq.c:552:9: error: returning 'const struct
 cpumask *' from a function with result type 'struct cpumask *' discards
 qualifiers
Message-ID: <202505150757.6H95XXiq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
head:   a4bcf6ccfb61f2e8354081ecc584c003d6b91c4e
commit: a0983893e344a836747449e1d20f5273761d39fa [5/5] PM / devfreq: Add HiSilicon uncore frequency scaling driver
config: mips-randconfig-2004-20250513 (https://download.01.org/0day-ci/archive/20250515/202505150757.6H95XXiq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150757.6H95XXiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150757.6H95XXiq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/devfreq/hisi_uncore_freq.c:552:9: error: returning 'const struct cpumask *' from a function with result type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     552 |         return topology_core_cpumask(cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/topology.h:221:37: note: expanded from macro 'topology_core_cpumask'
     221 | #define topology_core_cpumask(cpu)              cpumask_of(cpu)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:880:25: note: expanded from macro 'cpumask_of'
     880 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/devfreq/hisi_uncore_freq.c:562:9: error: returning 'const struct cpumask *' from a function with result type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     562 |         return topology_cluster_cpumask(cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/topology.h:224:40: note: expanded from macro 'topology_cluster_cpumask'
     224 | #define topology_cluster_cpumask(cpu)           cpumask_of(cpu)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:880:25: note: expanded from macro 'cpumask_of'
     880 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +552 drivers/devfreq/hisi_uncore_freq.c

   549	
   550	static struct cpumask *get_package_cpumask(int cpu)
   551	{
 > 552		return topology_core_cpumask(cpu);
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
