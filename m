Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E006446BA;
	Mon, 11 Mar 2024 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168530; cv=none; b=R6oYkYRqZxQJMzSQe+DKbJmY3y+7NvFDkjpA5/HsB89InDdAdMHJSIT4ByJOTD/cQU0kE1G/h68bfKpJnpnCaFWqKUXd1Vy7ouJAJ61DvaiiTLjAsE7G3S5cJ6O+oXnWwLvLayLPr5eHPRmEclfwFeblAGEduPhkF+mSElqHUHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168530; c=relaxed/simple;
	bh=WY/B4tigr6kfxJevqcCORbVn53bZk2oqNNgyUUl8cBw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZ1dwQu3hDmwC/lDzS3ioGYxR8FhfPJt9AtlBAVRCc41I5T6XwuV39GqdlrwAFU9qYcN1BXK4/Pp7MOdvwizrrWSazyPnX0WA/Su8JE5DGpcs9xHhpJ+DfzMXWwBh95xWnLrMKWocwLtTngG7DoJEJDRhshQYueZDxY0qnt4G/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfO+wUi2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfO+wUi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710168528; x=1741704528;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WY/B4tigr6kfxJevqcCORbVn53bZk2oqNNgyUUl8cBw=;
  b=mfO+wUi2togtoooviaDHIASsThAiKfwJXGLfldZXaDaJ4xi2a32dqbdV
   6G1ejiFdkLJQiB0qz7GcEjpJ7GYchLVj/oVyW+wq/9aPEF7N9Z69g5Fvn
   TLs38v54NNta/OYHNY/2U3oUbc1f2gdm5G8+5dxRSzkozYCXMxlsxUxqb
   v19GcIyPPhq1t+936uHYmmfWXR+srTTwwdPQ2hYMt3v2xnVAPGmPUyAxo
   uX/8PPMOF5Ucc2meSHaqby7ytKyfwQWfBjJwSZuc4W+WEbwaYIPEFRfJt
   OKxuXCQo1G+Gocwe4LprmvzTl4m6ueAEF1KLAhQLVWCFNMGjpKnos8UOS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="5435748"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="5435748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 07:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15837776"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2024 07:48:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjgxH-0009BR-0V;
	Mon, 11 Mar 2024 14:48:43 +0000
Date: Mon, 11 Mar 2024 22:48:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/platform/surface/surface_hotplug.c:79:39: warning:
 arithmetic between different enumeration types ('enum shps_dsm_fn' and 'enum
 shps_irq_type')
Message-ID: <202403112223.TISyWjra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8f897f4afef0031fe618a8e94127a0934896aba
commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to build the ACPI core
date:   9 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240311/202403112223.TISyWjra-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112223.TISyWjra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112223.TISyWjra-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/surface/surface_hotplug.c:18:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2105:
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
>> drivers/platform/surface/surface_hotplug.c:79:39: warning: arithmetic between different enumeration types ('enum shps_dsm_fn' and 'enum shps_irq_type') [-Wenum-enum-conversion]
      79 |         return SHPS_DSM_FN_IRQ_BASE_PRESENCE + type;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~
   6 warnings generated.


vim +79 drivers/platform/surface/surface_hotplug.c

bd69bcce4aa089 Maximilian Luz 2021-02-05  76  
bd69bcce4aa089 Maximilian Luz 2021-02-05  77  static enum shps_dsm_fn shps_dsm_fn_for_irq(enum shps_irq_type type)
bd69bcce4aa089 Maximilian Luz 2021-02-05  78  {
bd69bcce4aa089 Maximilian Luz 2021-02-05 @79  	return SHPS_DSM_FN_IRQ_BASE_PRESENCE + type;
bd69bcce4aa089 Maximilian Luz 2021-02-05  80  }
bd69bcce4aa089 Maximilian Luz 2021-02-05  81  

:::::: The code at line 79 was first introduced by commit
:::::: bd69bcce4aa089435e2891222236b1cb20395bec platform/surface: Add Surface Hot-Plug driver

:::::: TO: Maximilian Luz <luzmaximilian@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
