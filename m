Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40178F24;
	Sat, 12 Apr 2025 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744425446; cv=none; b=A+ROAcLPMyHPOGYH1yzY8jbiKoHfOvUSNr1U+d8JqslUGJOJd21SHzxKTjmAab+xfwq5163OR5NZp9FrUDH7HM/A1ZHbVZI4gvrhOsACW2r2KVHnLdpjcdGINN7jcyUmB+sOqcayc65alYGIlnyHLh7L7249NacEWzIgzHdVdEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744425446; c=relaxed/simple;
	bh=0ayBwoV8AYxDtvLvJrFXVLxv7jWsvYxEm31iguCyoiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z47g0fZsR+H5sZLOYvFvOtGf8HG0gfyskJUeML2q5SvZNPQnz+0yvkSZgViftXYnckDt4jv/rVyVJWkzIuMmmMcbRRQMjx/VxeqrB3fUrvB7P0jILCNbUt961ZbkXUA69FmK07qvcT7bUsMm7vkZJpD1VeTAKFHSdgdq43bbJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3mRnYjP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3mRnYjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744425443; x=1775961443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ayBwoV8AYxDtvLvJrFXVLxv7jWsvYxEm31iguCyoiM=;
  b=P3mRnYjPb/ZRJZLOhAiJDvAX0VW2EZ3D3q4zl4Rol70d6d/RL2Wd43aO
   6a7hMovhBh9ckLXSLvQcTXVe5QNqKzFBvr9b9Qf7PUQa7Hw06JrW1u3D0
   rEWiwpWY+8xpD2erXy7un/qVs6LpR5jVOgfN6gUXnIqPCBw7WY7px1wQ1
   TREKaCckqmrdHKVX3tKsbUw4zWSt9Nmu9qhZJvUFeipUFOyWORpOyBVgZ
   EaeUrSPCpC1caWHWubgpS6kZIHUQ7pc5YJgSsNudyo0DHWYu/GK7pXBwz
   qAz5ShUyLwPH/xCwSx/NWDUcxrLPkPBAit7b8mdD3PG/dheYDlOQYscQX
   Q==;
X-CSE-ConnectionGUID: TLgMQflmSbK8bORQYUPkXQ==
X-CSE-MsgGUID: DP/bOh3uQsezGX6tosfyPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71365414"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="71365414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 19:37:22 -0700
X-CSE-ConnectionGUID: G1klJNWoTV+dsOP2kz7zZQ==
X-CSE-MsgGUID: QHoBTdAsRqqsBVM55JMGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129346852"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2025 19:37:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Qk9-000BWQ-39;
	Sat, 12 Apr 2025 02:37:17 +0000
Date: Sat, 12 Apr 2025 10:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [rafael-pm:bleeding-edge 44/52]
 drivers/cpuidle/cpuidle-psci.c:437:54: error: expected identifier
Message-ID: <202504121050.dgHmFeWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   605857f6c52205d83a7963edbdfaaa307ee7bde4
commit: a60e3d71e4d49a9be9fa5fc3cb9c4942e29fd934 [44/52] cpuidle: psci: Transition to the faux device interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250412/202504121050.dgHmFeWe-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121050.dgHmFeWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121050.dgHmFeWe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpuidle/cpuidle-psci.c:437:54: error: expected identifier
     437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
         |                                                      ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
>> drivers/cpuidle/cpuidle-psci.c:437:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
         | ^
         | int
>> drivers/cpuidle/cpuidle-psci.c:437:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
         |                   ^                                            
         |                                                                void
   3 errors generated.


vim +437 drivers/cpuidle/cpuidle-psci.c

   436	
 > 437	module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
