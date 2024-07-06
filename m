Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34958249F;
	Sat,  6 Jul 2024 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720268992; cv=none; b=d9gGDWIXuzlMXhgl2IFfE0jALDkzbcq8ElvZ9nmB55WfzZqLCMION0F84RFTJyLNi8arBxqn1RZWLBNtPjP09Bmg9B8pPIGMV4Ehlk9LXLq32VAc9ImrnrVlqYq2Tla66/TkyQBdZV0+JHxVdn+ATQeTWOKJGh33hiz+MGHoae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720268992; c=relaxed/simple;
	bh=rRgH2oCgIVBI4bxPpPIIoaZBEeVmjbWkS6rsCxKYLW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TY2tu5LXSOWh38ZKEMmhLb5a39xfUjktyf7Px+0bgDxt9H7y1G5URvsdU8jydWUGzA2WTzaxliK/1nsCnerpPRGLdNlRK0VP5GfDsEyNoCFTUbS75cu1nrpGKWERelO2z8F4yfkd2R4/uS/AqZhssdHmzOcz2Ovjsv+Msp4t6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGsOaiTo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGsOaiTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720268991; x=1751804991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRgH2oCgIVBI4bxPpPIIoaZBEeVmjbWkS6rsCxKYLW8=;
  b=PGsOaiToifMgeV3QCvy+FLMr+8rqHCj3SP2M9MD1bwYA3PBcgNGo3ow9
   YKX88bzniRzJcwNkk71Rj15DnI70K8OZiNILvOoXlPqnVa33h0CdoOe74
   k/M7nDa5detogb49dMThULE5FvWBeAiK+cbO5um4Q1OXjUTKCkgG6MWXs
   a+FfQl4/ZvCnafecFtNX6US3XljNymWME1oKD7HMamOUpgKmn+1m6Lnj0
   m27lSCxdVAop8yc+4+UJ3gTHqeYYl7zEV7wFgtkIMn/LCVhG592UgSa7W
   WxZQBewC/BA54CGja5rsW+F54lzI4TwCED7vabicxwJbZbhhYuAzdoI2r
   g==;
X-CSE-ConnectionGUID: mHf4aWs+SDeTDj3D/r2YLg==
X-CSE-MsgGUID: ub2g4MclRgm+QOG7kTKLKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="40040881"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="40040881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 05:29:50 -0700
X-CSE-ConnectionGUID: nvOb8kdjRMWzA2iZCYYqWQ==
X-CSE-MsgGUID: gS55DvXWTJyZ4/a/Uq8g5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="70270904"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2024 05:29:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ4Xw-000TmW-33;
	Sat, 06 Jul 2024 12:29:44 +0000
Date: Sat, 6 Jul 2024 20:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Wang <peter.wang@mediatek.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [bvanassche:ufs-for-next 8/16]
 drivers/ufs/host/ufs-mediatek.c:696:7: error: call to undeclared function
 'is_mcq_enabled'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202407062054.2zIEi5xR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   af7795f671d9d49b9178c6112e63793c0d456861
commit: 89779c1d84437f088bc72ddcca19ec6c36db3ab6 [8/16] scsi: ufs: Inline is_mcq_enabled()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240706/202407062054.2zIEi5xR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407062054.2zIEi5xR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407062054.2zIEi5xR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-mediatek.c:18:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ufs/host/ufs-mediatek.c:696:7: error: call to undeclared function 'is_mcq_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     696 |         if (!is_mcq_enabled(hba))
         |              ^
   drivers/ufs/host/ufs-mediatek.c:714:7: error: call to undeclared function 'is_mcq_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     714 |         if (!is_mcq_enabled(hba))
         |              ^
   drivers/ufs/host/ufs-mediatek.c:1311:6: error: call to undeclared function 'is_mcq_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1311 |         if (is_mcq_enabled(hba)) {
         |             ^
   5 warnings and 3 errors generated.


vim +/is_mcq_enabled +696 drivers/ufs/host/ufs-mediatek.c

54770cbebe2caa drivers/scsi/ufs/ufs-mediatek.c Stanley Chu 2020-11-16  690  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  691  static void ufs_mtk_mcq_disable_irq(struct ufs_hba *hba)
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  692  {
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  693  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  694  	u32 irq, i;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  695  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21 @696  	if (!is_mcq_enabled(hba))
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  697  		return;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  698  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  699  	if (host->mcq_nr_intr == 0)
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  700  		return;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  701  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  702  	for (i = 0; i < host->mcq_nr_intr; i++) {
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  703  		irq = host->mcq_intr_info[i].irq;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  704  		disable_irq(irq);
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  705  	}
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  706  	host->is_mcq_intr_enabled = false;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  707  }
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  708  

:::::: The code at line 696 was first introduced by commit
:::::: e0dc13e5a3cb9de98fd00b7718738f9eef4bd0ce scsi: ufs: ufs-mediatek: Disable MCQ IRQ when clock off

:::::: TO: Peter Wang <peter.wang@mediatek.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
