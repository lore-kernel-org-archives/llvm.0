Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D114A8E;
	Tue, 26 Mar 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711457331; cv=none; b=IG+UfU5yw+wC32Z1U1NOHYBg3wacgwILVf36pXdczM1HZUE8e7/YNkDzv3WfrS+VUdANuVB4rdJwobCTf5Bwo2yaI1JZiLXDHciC/NCxdZAOOjbqUQmbZS3DWWQPttW7UQ7QG65rgmhhKkNHDgE4G/64LUEbsm2YFf4YtLOvh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711457331; c=relaxed/simple;
	bh=Dr9hGW7mELqha3sQU/lIQzs+oDEEd5tWENG0/RZrfnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ty5CpBUWq+Lv2W7T0o72qbAxu2FHz9NDQ5i+kqxCOcmDbLkYWmDhhbGCIRDSl0PjGSz051gFLSgu3r6leMKEyXvyXRNv2D0CZnjiwkdnh5A6fHNeGNMnUMoU9aTYaH0hdoxvDhwawuAUvOu0a5PuPyoUv6Cu1yQD9pS30i5HxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TILCkjzy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TILCkjzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711457329; x=1742993329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dr9hGW7mELqha3sQU/lIQzs+oDEEd5tWENG0/RZrfnI=;
  b=TILCkjzyk3yn3yealn2KAL3d3k7p2OV+0zqv5CQLlAbKK2dAbXGiGNq7
   u5jUGyTC5bXyZljVhint9/hJgY3OmgH/I7X6u1BxF5bXJWU2IVRPHlYDo
   ZJJNLYIDqHHVQ1w2Pqk7U7eOHBX56ipzN4PyZGz1/AdnTCDJQwIAEERL6
   fY+q+pt9qWGwJfW9bgpc64SYMbJnhvaeVcLyI4ldhpWDa0obL20Lj6di6
   eHu6OqBGxYlk2wk7ubjy+0fV0xqorPhO00frgOD5IiCecJ4A9HDCFXykw
   dASTVdigH5zC0u90XvgcFFrcS/LE5+uI+mvJF0VePaNTiYKXd9LBJT/in
   Q==;
X-CSE-ConnectionGUID: zG4Spa+qQzec1q5Zmw7iUg==
X-CSE-MsgGUID: BvzDlhufTVyjBID6S/OFLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6693732"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6693732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 05:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20651451"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 05:48:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp6EO-00002y-1F;
	Tue, 26 Mar 2024 12:48:44 +0000
Date: Tue, 26 Mar 2024 20:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:kprobes-v5 2/2] arch/riscv/kernel/execmem.c:8:56:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202403262047.2aEUWTDa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git kprobes-v5
head:   551464954a1ec4f0b14974861e113ac93287da99
commit: 551464954a1ec4f0b14974861e113ac93287da99 [2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240326/202403262047.2aEUWTDa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403262047.2aEUWTDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403262047.2aEUWTDa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/execmem.c:3:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/execmem.c:8:56: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
       8 | void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
         |                                                        ^
   6 warnings generated.


vim +8 arch/riscv/kernel/execmem.c

     7	
   > 8	void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
     9	{
    10		return __vmalloc_node_range(size, 1, MODULES_VADDR,
    11					    MODULES_END, GFP_KERNEL,
    12					    PAGE_KERNEL, 0, NUMA_NO_NODE,
    13					    __builtin_return_address(0));
    14	}
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
