Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA661CD3F;
	Sun, 17 Mar 2024 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710702101; cv=none; b=uh/Sg05z+aZsEUaPhmrqmo72RXwBmhR22rsbCdHWeX3opxJ2YTScLMqiC2NjbN1Vk69qHa3tYzLVZ/XprQWJg9+PaU43GY4E8bPjvVCNJWVmBiz4wycSA2NIP71XVpw5s2/wffEWkaaV1lOwPIAmPPnPiiumNeXoplzGRxGWa4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710702101; c=relaxed/simple;
	bh=x8IPk8CIB7VYXxDL8OlU4hKspTjRTG8gzgPSweIhh5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+P6N/Fo3Dpny06ZZrizlW7c2f9TgmURdYmtlIuCCEn5Y22inhzS90/Mh9Fcg7q1iu/3wwpYbt0Pmd1tjmitv8mE8XKBnGcfEJAnE+en/eI4oJ9NXyDMXZdXQ1J8IeKJ3+SSNR8fGqv7q+fwjmcagLvU+kS0wsy78VmqoJ1vgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azaEUYiu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azaEUYiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710702099; x=1742238099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8IPk8CIB7VYXxDL8OlU4hKspTjRTG8gzgPSweIhh5Q=;
  b=azaEUYiuCms9niBd3y5zKVc/sNW/haZXK3iVpBkXhdUcNEtDqJp7wuLM
   vsZAmVgy9IzS0R1d1J0/JLrOQWpXkTSMrLs/67wi4pLNZWfzOB9Zo/LYl
   y60fNF3VevLRGoKEa+ekwBcpz2AZu0JANxWErnC829hPlxEiBoik6Xam0
   J2PbDHFhHh4LaYAA5xUEi80qytI/wmgGVDR1Q1Ld1M/sgGuoNEnr2aym+
   NU/dAuRsC38a4GMEwRjp6kfNQRMo2ajtBVUZIIkWUaakpbkGVwLfD+25e
   X1J8xQVP+v/Geb1La4B4Bsxd03+L/LEwybc7C34fxBYk+HRNfrW5BKgEY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5365058"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5365058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 12:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="17958568"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2024 12:01:34 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlvlD-000GQl-2c;
	Sun, 17 Mar 2024 19:01:31 +0000
Date: Mon, 18 Mar 2024 03:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 4/4] fs/f2fs/data.c:615:41: error: no member named
 'zone_wait' in 'struct f2fs_bio_info'
Message-ID: <202403180242.0P5yxfgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   5d1d1ce6987e9ad0cf26ca1071a94aadbb5c2a83
commit: 5d1d1ce6987e9ad0cf26ca1071a94aadbb5c2a83 [4/4] f2fs: zone: don't block IO if there is remained open zone
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240318/202403180242.0P5yxfgD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180242.0P5yxfgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180242.0P5yxfgD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
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
>> fs/f2fs/data.c:615:41: error: no member named 'zone_wait' in 'struct f2fs_bio_info'
     615 |                         init_completion(&sbi->write_io[i][j].zone_wait);
         |                                          ~~~~~~~~~~~~~~~~~~~ ^
>> fs/f2fs/data.c:616:24: error: no member named 'zone_pending_bio' in 'struct f2fs_bio_info'
     616 |                         sbi->write_io[i][j].zone_pending_bio = NULL;
         |                         ~~~~~~~~~~~~~~~~~~~ ^
   5 warnings and 2 errors generated.


vim +615 fs/f2fs/data.c

0fd785eb931d25 Chao Yu     2016-01-18  591  
908ea6541661d7 Yufen Yu    2022-05-25  592  int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
908ea6541661d7 Yufen Yu    2022-05-25  593  {
908ea6541661d7 Yufen Yu    2022-05-25  594  	int i;
908ea6541661d7 Yufen Yu    2022-05-25  595  
908ea6541661d7 Yufen Yu    2022-05-25  596  	for (i = 0; i < NR_PAGE_TYPE; i++) {
908ea6541661d7 Yufen Yu    2022-05-25  597  		int n = (i == META) ? 1 : NR_TEMP_TYPE;
908ea6541661d7 Yufen Yu    2022-05-25  598  		int j;
908ea6541661d7 Yufen Yu    2022-05-25  599  
908ea6541661d7 Yufen Yu    2022-05-25  600  		sbi->write_io[i] = f2fs_kmalloc(sbi,
908ea6541661d7 Yufen Yu    2022-05-25  601  				array_size(n, sizeof(struct f2fs_bio_info)),
908ea6541661d7 Yufen Yu    2022-05-25  602  				GFP_KERNEL);
908ea6541661d7 Yufen Yu    2022-05-25  603  		if (!sbi->write_io[i])
908ea6541661d7 Yufen Yu    2022-05-25  604  			return -ENOMEM;
908ea6541661d7 Yufen Yu    2022-05-25  605  
908ea6541661d7 Yufen Yu    2022-05-25  606  		for (j = HOT; j < n; j++) {
908ea6541661d7 Yufen Yu    2022-05-25  607  			init_f2fs_rwsem(&sbi->write_io[i][j].io_rwsem);
908ea6541661d7 Yufen Yu    2022-05-25  608  			sbi->write_io[i][j].sbi = sbi;
908ea6541661d7 Yufen Yu    2022-05-25  609  			sbi->write_io[i][j].bio = NULL;
908ea6541661d7 Yufen Yu    2022-05-25  610  			spin_lock_init(&sbi->write_io[i][j].io_lock);
908ea6541661d7 Yufen Yu    2022-05-25  611  			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
908ea6541661d7 Yufen Yu    2022-05-25  612  			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
908ea6541661d7 Yufen Yu    2022-05-25  613  			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
e067dc3c6b9c41 Daeho Jeong 2023-05-03  614  #ifdef CONFIG_BLK_DEV_ZONED
e067dc3c6b9c41 Daeho Jeong 2023-05-03 @615  			init_completion(&sbi->write_io[i][j].zone_wait);
e067dc3c6b9c41 Daeho Jeong 2023-05-03 @616  			sbi->write_io[i][j].zone_pending_bio = NULL;
e067dc3c6b9c41 Daeho Jeong 2023-05-03  617  			sbi->write_io[i][j].bi_private = NULL;
e067dc3c6b9c41 Daeho Jeong 2023-05-03  618  #endif
908ea6541661d7 Yufen Yu    2022-05-25  619  		}
908ea6541661d7 Yufen Yu    2022-05-25  620  	}
908ea6541661d7 Yufen Yu    2022-05-25  621  
908ea6541661d7 Yufen Yu    2022-05-25  622  	return 0;
908ea6541661d7 Yufen Yu    2022-05-25  623  }
908ea6541661d7 Yufen Yu    2022-05-25  624  

:::::: The code at line 615 was first introduced by commit
:::::: e067dc3c6b9c419bac43c6a0be2d85f44681f863 f2fs: maintain six open zones for zoned devices

:::::: TO: Daeho Jeong <daehojeong@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
