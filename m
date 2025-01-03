Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0616F8F5;
	Fri,  3 Jan 2025 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886242; cv=none; b=Lxyh9E21lgj/mrlc+5o5kR20PC0uEZQAbT4NlIsHa/tHLOl6uLsUnHj9Tk4x/Ee35f6ezFYokDUrcslqLgTQd/V1PQHxn9N7QaAdjJJlE6xhb3GimxtworDvTDfdkS5IqDQMYoMqq1elfBjr4lLIQtuidXOG1ndM0+Fx9kY23Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886242; c=relaxed/simple;
	bh=swa0sd5oQOc9XUtQm/qmA1DFctV4MTCKJnYQe6z+xEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KU1S+PyVnkUV9X1xTrxY2Ao3rMwh6JrwQcc/cPZ/nbrTuF0Mv1QQPhxUUKIC0bdinihP8VivqGYhj3NNt6P+oeKCHy2K4ipTJqti4AHo9GjBTa5izlmFER/6h281oiB8pVWRmfeettwRYfoWjWKgC7I1Yz/Za3mA1+sQVNOZfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWnuD/l9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWnuD/l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735886240; x=1767422240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swa0sd5oQOc9XUtQm/qmA1DFctV4MTCKJnYQe6z+xEw=;
  b=DWnuD/l9U0hwjLD0VSfAp5VlthPJw9MjuICOzUohOmFNeiFvnZcUskSv
   BdE1CDn+N7cdZlKeb1Y/YxjwYUIfbEZvhcncpc9pm84JPUJdHkJSjpzxc
   BmVVu3253muDJ8MLCbC76Me7pc2AG+qsaGyZjwaqYOnUKv+KURVisXuDe
   oLe+2ZCXtNIXZPGsHzydJJDpdmLSgHIiIm8LRqZB4kZqFB148Hz1h4uy1
   Z5k7pIkWfiIqcGxxeaHca12C6xRzMX63wWnvCJ1i5He2yxgmuiizYJubM
   65GcCwsoLuWta3XwgxpFMZ/AP37JXvMNBfBklYl8PWTAmrjeZCoADYOhG
   w==;
X-CSE-ConnectionGUID: wltMoYD6Rhykc1P3vcMXZg==
X-CSE-MsgGUID: DmiH7PGISHeFZz4Az+/AdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36039096"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36039096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 22:37:19 -0800
X-CSE-ConnectionGUID: b3XF0eCaQFGNHhaEWA+Isg==
X-CSE-MsgGUID: 48DVjJHsShO8RZn2M1ASwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102212103"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jan 2025 22:37:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTbJ5-0009KN-2q;
	Fri, 03 Jan 2025 06:37:15 +0000
Date: Fri, 3 Jan 2025 14:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/fwctl 7/28] drivers/fwctl/mlx5/main.c:334:18: error:
 expected ';' after top level declarator
Message-ID: <202501031439.4XUHMJ4x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   50c59ffd9367d000b9a4fe2ef9a587a2e81f287f
commit: 6cca98fde35c7ebc475ed809427e29de09a0d635 [7/28] fwctl/mlx5: Support for communicating with mlx5 fw
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250103/202501031439.4XUHMJ4x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031439.4XUHMJ4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031439.4XUHMJ4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/fwctl/mlx5/main.c:5:
   In file included from include/linux/fwctl.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/fwctl/mlx5/main.c:334:18: error: expected ';' after top level declarator
     334 | MODULE_IMPORT_NS(FWCTL);
         |                  ^
   3 warnings and 1 error generated.


vim +334 drivers/fwctl/mlx5/main.c

   333	
 > 334	MODULE_IMPORT_NS(FWCTL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
