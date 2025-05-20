Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4825C82B;
	Tue, 20 May 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768769; cv=none; b=p55VOOfHLsUvsHl5qYLQrCZpfN69hCPyMphnjnau+RmmgMUTwaN15beEWgbHu/cNX1SUMpFXn6iV4YZB4CtVTUEjHFCo9CIsm2jJpvoN3c2dN9/+GctJCc2QrL3ixJnoPdX9XUKja6ntcdrL9mGUIdZemeqmUfpRencP3BsKWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768769; c=relaxed/simple;
	bh=9dyF/1WrQAjplPxdmFJJjkp2EcW47hvbjaoy4iQBplo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bo2ASf35DgoDiYzojZAG1QU0RsNyZfLndcOzwZl2OGptnxVfESVvOtS0g4whIqMpAiBdu2L/zA1LSEc4Skl+kA9aMzPhtnbxZ5p3ZHroLdgZ6G4m908X8pDoopi7SUfvfF9htSTdxiQZubmNw472TQVBdnxGOx4TPlf/p5/Cj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC3Uw9hs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC3Uw9hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747768767; x=1779304767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9dyF/1WrQAjplPxdmFJJjkp2EcW47hvbjaoy4iQBplo=;
  b=jC3Uw9hsWfqg00pXNXrTo8SH4lvRXltXizJ9O4EsdCQ5B/4KEq4fiaD8
   hMVeJnPZMAwhP+KDYLm/s/cO/4I/iZc/l2FWLvLeLB9IsDHLPEmEACgQL
   58bvwR6x85o0Ds+hYLVrg5G79j8TdW7O6e/TNxy5qZKEAuegD3yp6r5xg
   /kfxKUnMahrJhEL6h1bozbHfXAlBcUqv1LOg9iUCjpCnEbgU03+B79Agw
   KgUpn4n7W/BLVuSx2UGb3pu7PmtZVHfP1P6wpAiEkLJgy87S+rFXlcjsb
   jX+l13bVTXvKkI2ZiH0sfESime5/SkdKdM5xHf+A/CYGfVpcXbyQbLCqH
   w==;
X-CSE-ConnectionGUID: FzuqQiNeTMieJQI5Tvod3Q==
X-CSE-MsgGUID: d5olXf7mQkKNDb43YrdOQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60759633"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60759633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 12:19:25 -0700
X-CSE-ConnectionGUID: 1rNcApXTSmuSznMfK4hG5g==
X-CSE-MsgGUID: w6xSQBGER0Ge5yeUFIs9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140312313"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2025 12:19:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHSUk-000NUQ-0g;
	Tue, 20 May 2025 19:19:22 +0000
Date: Wed, 21 May 2025 03:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Subject: [chanwoo:devfreq-testing 5/5]
 drivers/devfreq/hisi_uncore_freq.c:562:9: error: returning 'const struct
 cpumask *' from a function with result type 'struct cpumask *' discards
 qualifiers
Message-ID: <202505210327.PWLD6OdP-lkp@intel.com>
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
commit: a4bcf6ccfb61f2e8354081ecc584c003d6b91c4e [5/5] PM / devfreq: Add HiSilicon uncore frequency scaling driver
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250521/202505210327.PWLD6OdP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210327.PWLD6OdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210327.PWLD6OdP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/devfreq/hisi_uncore_freq.c:562:9: error: returning 'const struct cpumask *' from a function with result type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     562 |         return topology_cluster_cpumask(cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/topology.h:224:40: note: expanded from macro 'topology_cluster_cpumask'
     224 | #define topology_cluster_cpumask(cpu)           cpumask_of(cpu)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:880:25: note: expanded from macro 'cpumask_of'
     880 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +562 drivers/devfreq/hisi_uncore_freq.c

   559	
   560	static struct cpumask *get_cluster_cpumask(int cpu)
   561	{
 > 562		return topology_cluster_cpumask(cpu);
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
