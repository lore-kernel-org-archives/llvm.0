Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5F25FA23;
	Wed, 26 Feb 2025 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612754; cv=none; b=n/6dCnkZ7ybKK6PQ8OTu0LOrEzzE4d2GEdq1gvFKWE2S+z4NhYRbRVR06l1CZEaoKr9E7zzuV+6cY4Vd4qAvcEdS0YaBdaDqy6S8h4vSAIm7pbBCKQsydCpMzUKeePsBbVeYFbS6VpOoUnE3Nq5Ar+/U6v+VPDKMvxStqxeCwpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612754; c=relaxed/simple;
	bh=FTSUUSv9KRnR7Ai1vjCJ14lSYmwmucZQQUFBwJEbRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/r1+q/E9wD0ZVfaTiqA5LNsI0HPD4uRQXuJ0O/8ti+Ma01T7+xC835o2rpYsJmJuqNaezPcVeZtF19eHyb4FLC0dPUT4a98wnvE3xFGQwk1HmaSC8DUCv2E+NDSzxd6BXaJ2H1MaWMnf1ZBUrAc9pDG66ns1jn7tcXjqgn1Ni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaG0kWdr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaG0kWdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740612752; x=1772148752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTSUUSv9KRnR7Ai1vjCJ14lSYmwmucZQQUFBwJEbRfg=;
  b=WaG0kWdrBj+pXQ6JWUp2IRqYs576VZyLuIrjAXGMWAlDFGBDE9aHUx+S
   CdlqEeNqOurDkW9sBrDKeKR0oN7dSFYUVMLcq4sXgQyNfe0hS3c4F8cC/
   KOCL/LI2D9WyueYwlP+X8j4ByiOaOJ6qX1yf2yTqhX4j5J2aS6/rjD1mK
   rXvgkD1AhsS2oKSvKj36J46lDx0+uihAaPfsrP4sH0t/PiqJ+dqNMXfbo
   ICoJVg/krnvUzKwjszIQuDS3T8ywGqJfpJL/Eje8dexMT2B2WfYQDvrxc
   CIYA9AoqRxf7C+PH0eDyxK0oQ66SkFX2zYZMfZEe46Q3B6UeyttLxg+7m
   Q==;
X-CSE-ConnectionGUID: hHrC6TEFSUOBXyTbOsjR2g==
X-CSE-MsgGUID: vzv6YK2rQiWeXQlKJY3KoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41365779"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41365779"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 15:32:31 -0800
X-CSE-ConnectionGUID: zQl6z0qyQ6iQ45jlBHOoIg==
X-CSE-MsgGUID: hbklLs2xTR2uZ6nLCb1m1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117769487"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Feb 2025 15:32:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnQsp-000CbG-1l;
	Wed, 26 Feb 2025 23:32:16 +0000
Date: Thu, 27 Feb 2025 07:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 3/4]
 kernel/sched/deadline.c:210:6: warning: no previous prototype for function
 'dl_bw_visited'
Message-ID: <202502270753.lZQmwgtd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: 2d96e08126551c9773a9c9854d08c7559c9c90e6 [3/4] sched/deadline: Rebuild root domain accounting after every update
config: x86_64-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270753.lZQmwgtd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270753.lZQmwgtd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270753.lZQmwgtd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:2913:14: error: use of undeclared identifier 'sched_domains_mutex'
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^
   kernel/sched/rt.c:2940:16: error: use of undeclared identifier 'sched_domains_mutex'
    2940 |         mutex_unlock(&sched_domains_mutex);
         |                       ^
   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:210:6: warning: no previous prototype for function 'dl_bw_visited' [-Wmissing-prototypes]
     210 | bool dl_bw_visited(int cpu, u64 cookie)
         |      ^
   kernel/sched/deadline.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | bool dl_bw_visited(int cpu, u64 cookie)
         | ^
         | static 
   1 warning and 2 errors generated.


vim +/dl_bw_visited +210 kernel/sched/deadline.c

   209	
 > 210	bool dl_bw_visited(int cpu, u64 cookie)
   211	{
   212		return false;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
