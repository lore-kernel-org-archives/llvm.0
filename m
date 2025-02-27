Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF71DDC29;
	Thu, 27 Feb 2025 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677210; cv=none; b=ZNd0nfyWujRCW13X2TqISBECw8kuvn3d6t9jVu+K7ReKRscwS+UEw0CVWVABmlqmYiRYq6Qc6yWOVkPnkWBW9XF6X7m+RdvIWgd9jXhioRMoUQq4FXfKwYgemc5IZikMCCx3uDUid3B2I6sWaLvyHO/UOVUyBWuwjpzT7k9lhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677210; c=relaxed/simple;
	bh=UlCHsIoNcKx1GuLIYqnfOsbcySaw5M6mE/h3V3NPy1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X97v7d9pQqORqlQbU790UOq9joznhAblmnpxE76pnaGB6yVteShSuhS9wPun3Ac8XA4NyWt8BaoR1arTPe9+i9TO0c0sf6AcLadq6YmP+0GflCdQfhWjNt2PQvMxa89uitg93P9PsopY9PTi1mXng2B93zwknfauyb3drn/rct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNNvFh2v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNNvFh2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740677208; x=1772213208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UlCHsIoNcKx1GuLIYqnfOsbcySaw5M6mE/h3V3NPy1w=;
  b=bNNvFh2vnh8oN4YdrY5IQHEnrrJuDb1uyGy2d2rlQZUw1pRh1N49ZQY6
   WctbnDTHScOuti+5GAmtMu7tmmqEG5XDXRJwwTtjZfyfMtMo6ddDQWKsn
   OXJKpziD/9Ii0XRZRBrgb44YIR/xpb0FFGJE6g/dV0h5Tf+xDEH8SwXSH
   8iAK3r1MwqnPECU5AnJQbqWGiapSgMUXt6+TlzCmNrfJGjHLhvHYKsqnm
   MMGojqQz8NuRtni2z/sf9gh+47D0D90TMrOZVQPwGlrGFfpCDzwTarHyw
   tsLBDrDnlLzpWYi/Pxn+XRw1eJLPzKkL9oapPrG2f93qRM4Rlx28T0z4S
   w==;
X-CSE-ConnectionGUID: EIs3lcqNTIyVaSdPBlF5jg==
X-CSE-MsgGUID: tsnY2VUnRoqXAi2ahfKFIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52992718"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52992718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:26:48 -0800
X-CSE-ConnectionGUID: mU4qMKsvR2G74F3NXFpd0g==
X-CSE-MsgGUID: 8rcMGU12Sj6c6pZVb7WdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116850151"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 09:26:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnhel-000Dlq-2H;
	Thu, 27 Feb 2025 17:26:43 +0000
Date: Fri, 28 Feb 2025 01:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 2/5]
 kernel/sched/topology.c:10:30: error: a function declaration without a
 prototype is deprecated in all versions of C
Message-ID: <202502280152.nid5detJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   e3512fbbdb36ba3f8f172d4119f73a6de351bd08
commit: af2ae36d96f2d8bf61feebc9df76f0616793c272 [2/5] sched/topology: Wrappers for sched_domains_mutex
config: i386-buildonly-randconfig-003-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280152.nid5detJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280152.nid5detJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280152.nid5detJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:15:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
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
   In file included from kernel/sched/build_utility.c:88:
>> kernel/sched/topology.c:10:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      10 | void sched_domains_mutex_lock() {
         |                              ^
         |                               void
   kernel/sched/topology.c:13:32: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      13 | void sched_domains_mutex_unlock() {
         |                                ^
         |                                 void
   2 warnings and 2 errors generated.


vim +10 kernel/sched/topology.c

     7	
     8	DEFINE_MUTEX(sched_domains_mutex);
     9	#ifdef CONFIG_SMP
  > 10	void sched_domains_mutex_lock() {
    11		mutex_lock(&sched_domains_mutex);
    12	}
    13	void sched_domains_mutex_unlock() {
    14		mutex_unlock(&sched_domains_mutex);
    15	}
    16	#else
    17	void sched_domains_mutex_lock() { }
    18	void sched_domains_mutex_unlock() { }
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
