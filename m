Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA7EC4;
	Mon,  4 Nov 2024 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698128; cv=none; b=FyX9E+1G2QOb+qO8Oxutf04WaLB2m4ilKt+uGOP1+J99sIngSdnVe7NtSX4+XKU46cUOuI8ipt8u73d8dnxYUlsKbEaU+gvPtcK0yv/ahNMurqF4uCjL73O+Q8oJMYsg81sl7srkBL8elC1ngAf2jqX+/zWfO0Vt903ZEQf3gX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698128; c=relaxed/simple;
	bh=aw0QSEdEuP8K7cDHTnyPiIWW5caXnL78iQag1veB43o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhJbAqO/o+ZYe4nGP6uz4ctgzTtD7cSfhU3HzIlJ41cxLjEDPelTUp5UmCoAhBplTAqUL9EepaW6ctj4nvvK37Bh3OyYvmvY/n10Tz6gbXBFxCpQTRuCS9pc8CAkrEmsuoUlky3kBv8NolJgb2CrMZ8CTaBFqUF8E0Te8KEEDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRCBlU2f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRCBlU2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730698127; x=1762234127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aw0QSEdEuP8K7cDHTnyPiIWW5caXnL78iQag1veB43o=;
  b=eRCBlU2f9nGCVyWC/FxJXnr0BU1eao6WmYtp6Mlc4F9ry2Q+oAn0z/hx
   t3aiE7K/RT9F9aoHSQsjb867P/4fH/jbsYTbQRoqG8YeW/PM69ZwfwV1E
   MQyYgB817d0+uwY9Lizy2q6uRuh/T1oJ784SAymo1QbzR1s4Nsv/xY0B2
   rAbrtggx1M+hXrezUBaE++ViqoTc+MZNZGrzWV7FMKaspRd0M1AhBQeVN
   n/t2MHy1EGFcH6sqrNgpsLtVg6BqoE4UyLw9F36KJozwmK/yBLW+VuO4c
   EaTR2dBjCbxfz9st6fudgy2ZlpG9U8kr/KXJ1SSvwsuY6Ru7j8mTKaXkN
   w==;
X-CSE-ConnectionGUID: mg7fRAiKTV6LB2ursIyUGg==
X-CSE-MsgGUID: q6PiY0+wRpWSPSCL2C4JeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41482614"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41482614"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 21:28:44 -0800
X-CSE-ConnectionGUID: FQAGhTQCQNSj8ifHP7ACrA==
X-CSE-MsgGUID: a5EWnnlNTCehhi8+GS8GPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83070499"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 21:28:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7pdo-000kUX-0D;
	Mon, 04 Nov 2024 05:28:40 +0000
Date: Mon, 4 Nov 2024 13:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/42] include/linux/filelock.h:507:9: error: use
 of undeclared identifier 'delegated_inode'
Message-ID: <202411041337.Vf6Omjng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   2e48bdf939b25989db6f1d5b16e3814a39dd4c82
commit: b6232347709692f6d08fa8f15ace5ceb06a803e9 [32/42] SQUASH: fix up delegated_inode handling
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241104/202411041337.Vf6Omjng-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041337.Vf6Omjng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041337.Vf6Omjng-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   In file included from include/linux/nfs_fs.h:23:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:22:
   In file included from fs/nfs/flexfilelayout/../internal.h:6:
   In file included from fs/nfs/flexfilelayout/../nfs4_fs.h:26:
>> include/linux/filelock.h:507:9: error: use of undeclared identifier 'delegated_inode'
     507 |         return delegated_inode->di_inode;
         |                ^
   fs/nfs/flexfilelayout/flexfilelayout.c:1238:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1238 |         int err;
         |             ^
   5 warnings and 1 error generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:10:
   In file included from include/linux/nfs_fs.h:23:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:15:
   In file included from fs/nfs/flexfilelayout/../internal.h:6:
   In file included from fs/nfs/flexfilelayout/../nfs4_fs.h:26:
>> include/linux/filelock.h:507:9: error: use of undeclared identifier 'delegated_inode'
     507 |         return delegated_inode->di_inode;
         |                ^
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^
   5 warnings and 1 error generated.


vim +/delegated_inode +507 include/linux/filelock.h

   504	
   505	static inline struct inode *deleg_inode(struct delegated_inode *di)
   506	{
 > 507		return delegated_inode->di_inode;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
