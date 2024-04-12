Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498713C9B9;
	Fri, 12 Apr 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712933081; cv=none; b=AOS0gSYGdjISBDjY5aQ3zFop6s32g7L4hx4fBs8L5PxHGGBZPNdIapVV8k6YBykaSixMlgsW5cEnMcSiYat3ktcFtH41TZMZ88a8LnY7iJXXnSMe+5xNWgWiTorSvtHfwaOhVHGgN4G4XsL0wMsp3ZbryEK9akCwJPIwlcsaAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712933081; c=relaxed/simple;
	bh=2RwadQSfdNezsO5fl8tEo6U8QtvrjymfXfZrgUz2gPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjphoGu1slkOG+hSZ3HGVyM/zjgmwLtxQKfIRrfSSCq1pJKdHu05hMI1+HSdMXv2RwbYX2pCk2N3SXHGF7CgEXilTK31hPq2QSTeYFANqldGUWuTOd4Jxdg4z0U2yARHUg8rG+4Hjh2VdjwQfPXh0LQ7/sFFnyk5IRJhvw0hPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LslKeBdo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LslKeBdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712933080; x=1744469080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2RwadQSfdNezsO5fl8tEo6U8QtvrjymfXfZrgUz2gPU=;
  b=LslKeBdoiMqbLNyg9HlFjQ6aAQ9Ce0hfjOCbxHeZUQ0gyXlft+WeDiRu
   tG/46y43pQ7/BP1IOcuD/ghUHUzSPrOZyFBIKT6hmU2hIiDkaR/Eys3ff
   WxPqsuCp+R/33TkRtM9j04zXhIk2Z1EYwZy/3MECzNtxxkuI7EOvbiHIV
   9ytb/2Fk+WRUNb2jBLjXKJ+dJeBImPGVyCWcim7DFuIeOIenh/BB2KYNB
   0AqJzbcbSQBi18n/qmXuee/q28aqyiZZ7DSxH9zPzzFL5rzTc3OEUdJlq
   BUdb4K2a/rlEwOQLwFCYevscRXUdHQ3CKrXYtMBHavt4ugKc8UT7nSwZy
   g==;
X-CSE-ConnectionGUID: mwGtveqcQ5iOlN+2/uz+Gg==
X-CSE-MsgGUID: qB5UkDR7TDqPI5JADG2GOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8245392"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8245392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 07:44:39 -0700
X-CSE-ConnectionGUID: kb8YwI3pSSKAzYVt+3ZFeQ==
X-CSE-MsgGUID: f2Bwv4LFRM6eYgEKJufdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21161232"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2024 07:44:38 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvI8p-0009qN-1r;
	Fri, 12 Apr 2024 14:44:35 +0000
Date: Fri, 12 Apr 2024 22:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] scsi: ufs: Make the polling code report which
 command has been completed
Message-ID: <202404122230.kUJNuiDA-lkp@intel.com>
References: <20240412000246.1167600-4-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412000246.1167600-4-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next linus/master v6.9-rc3 next-20240412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/scsi-ufs-Declare-ufshcd_mcq_poll_cqe_lock-once/20240412-080540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240412000246.1167600-4-bvanassche%40acm.org
patch subject: [PATCH 3/4] scsi: ufs: Make the polling code report which command has been completed
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240412/202404122230.kUJNuiDA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122230.kUJNuiDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122230.kUJNuiDA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-mediatek.c:18:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
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
>> drivers/ufs/host/ufs-mediatek.c:1717:36: error: too few arguments to function call, expected 3, have 2
    1717 |                 ufshcd_mcq_poll_cqe_lock(hba, hwq);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~         ^
   include/ufs/ufshcd.h:1267:15: note: 'ufshcd_mcq_poll_cqe_lock' declared here
    1267 | unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
         |               ^                        ~~~~~~~~~~~~~~~~~~~~
    1268 |                                        struct ufs_hw_queue *hwq,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~
    1269 |                                        struct scsi_cmnd **compl_cmd);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +1717 drivers/ufs/host/ufs-mediatek.c

e152a616c88653 Po-Wen Kao 2023-07-01  1701  
e152a616c88653 Po-Wen Kao 2023-07-01  1702  static irqreturn_t ufs_mtk_mcq_intr(int irq, void *__intr_info)
e152a616c88653 Po-Wen Kao 2023-07-01  1703  {
e152a616c88653 Po-Wen Kao 2023-07-01  1704  	struct ufs_mtk_mcq_intr_info *mcq_intr_info = __intr_info;
e152a616c88653 Po-Wen Kao 2023-07-01  1705  	struct ufs_hba *hba = mcq_intr_info->hba;
e152a616c88653 Po-Wen Kao 2023-07-01  1706  	struct ufs_hw_queue *hwq;
e152a616c88653 Po-Wen Kao 2023-07-01  1707  	u32 events;
e152a616c88653 Po-Wen Kao 2023-07-01  1708  	int qid = mcq_intr_info->qid;
e152a616c88653 Po-Wen Kao 2023-07-01  1709  
e152a616c88653 Po-Wen Kao 2023-07-01  1710  	hwq = &hba->uhq[qid];
e152a616c88653 Po-Wen Kao 2023-07-01  1711  
e152a616c88653 Po-Wen Kao 2023-07-01  1712  	events = ufshcd_mcq_read_cqis(hba, qid);
e152a616c88653 Po-Wen Kao 2023-07-01  1713  	if (events)
e152a616c88653 Po-Wen Kao 2023-07-01  1714  		ufshcd_mcq_write_cqis(hba, events, qid);
e152a616c88653 Po-Wen Kao 2023-07-01  1715  
e152a616c88653 Po-Wen Kao 2023-07-01  1716  	if (events & UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS)
e152a616c88653 Po-Wen Kao 2023-07-01 @1717  		ufshcd_mcq_poll_cqe_lock(hba, hwq);
e152a616c88653 Po-Wen Kao 2023-07-01  1718  
e152a616c88653 Po-Wen Kao 2023-07-01  1719  	return IRQ_HANDLED;
e152a616c88653 Po-Wen Kao 2023-07-01  1720  }
e152a616c88653 Po-Wen Kao 2023-07-01  1721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
