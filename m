Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB1184106;
	Wed, 10 Apr 2024 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786211; cv=none; b=oYF9Yg9b22acotCsru4EbCecQIw6nOoffHIs0hdpX1D9qGWkfmdNmPwlbonTBj3MyZZKUHHyp1Dcpv68Vz8mvhzdxPFwjheheusP4mO7WZDxRJ++EwWGBsfnzAohLpiyxZrWa6h+7jzEHB/92pXL4rxB0RWOe+EbrCxbiU/sUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786211; c=relaxed/simple;
	bh=2tu/mgDwnrIh97dDG/kvIPpev4llFiiFPA0qRBHR5TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQtqoessZ5eJiFaOzaPysBCmBSdg6bPOGMoH+2FnwUNOGiqFY9Vzt1OzvTiUU/D0Y467hrodn+Ci0u2oNnGVrWbDLdR9+VA1CHwBBqvALTa4NsetuDvxKNN+XruyzDSmMfWI0rlbp3w5wi7Kv1P3HNr6Rtd2G7pXgtJt7rv9VAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSIzN58N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSIzN58N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712786210; x=1744322210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tu/mgDwnrIh97dDG/kvIPpev4llFiiFPA0qRBHR5TM=;
  b=jSIzN58Nxrya6U5gTJndGlDEU6xbmlGZ4mLqYX6tg/lpXVO+ZZXtUNoX
   Va8scytwPkiwKKX+q0EEFUhhL3/QIMJaXpv9WNFyskw1ywLjXuyXkWZRV
   BqH2kT3h5hHNRXu3Uw0nQl/DCJCBELproRbtjhb+e4EJCLmh5fInPdi2N
   /rFTE6K2icbLJ3+pJlG7GKpp/PNbG7KFJJIJtZaSsOqFIx0t/yaJopfzg
   TWhMAkLt8plKUfeu81ck3mOjw3ovRX5Q3IkbgDyMhopSA0OvBioYxkQv7
   zAP25k80Fxr2nj/sgPTM0AyTU+0GKSDA+MgO6qSUHRSW1SifsmkRMIzbP
   Q==;
X-CSE-ConnectionGUID: gj7lXmqcQ8G4bL/m1fkq6g==
X-CSE-MsgGUID: arRGfaH3QWGJSdruecHRLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12028788"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="12028788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 14:56:50 -0700
X-CSE-ConnectionGUID: YmchwANwRVqyI8R7j63hgQ==
X-CSE-MsgGUID: E4n9CkhfS6ivG6dFibfvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20653432"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2024 14:56:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rufvx-0007s8-10;
	Wed, 10 Apr 2024 21:56:45 +0000
Date: Thu, 11 Apr 2024 05:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 295/367] arch/s390/kernel/sysinfo.c:512:29:
 error: use of undeclared identifier 'file'
Message-ID: <202404110509.gFeiF3Om-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   aa6c8a72cad54562e99c8a46f4baeaf6ea9409a6
commit: 21031799f2d4e4555cd7a418a455253fcf81a6a2 [295/367] arch/s390: convert to read/write iterators
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240411/202404110509.gFeiF3Om-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110509.gFeiF3Om-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110509.gFeiF3Om-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/sysinfo.c:10:
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
>> arch/s390/kernel/sysinfo.c:512:29: error: use of undeclared identifier 'file'
     512 |         return simple_copy_to_iter(file->private_data, &iocb->ki_pos, PAGE_SIZE, to);
         |                                    ^
   5 warnings and 1 error generated.


vim +/file +512 arch/s390/kernel/sysinfo.c

   509	
   510	static ssize_t stsi_read(struct kiocb *iocb, struct iov_iter *to)
   511	{
 > 512		return simple_copy_to_iter(file->private_data, &iocb->ki_pos, PAGE_SIZE, to);
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
