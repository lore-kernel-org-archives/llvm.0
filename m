Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC052D7817;
	Wed, 24 Jun 2026 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782279023; cv=none; b=auZRia5biegpuSeI0mYH2hS/OPJjOwdtQZpq1pDLX9XuZyorvSUw5IHil93noH3Jf8GCpF7cdgAvzWSU+Lq0EauAKWXg8q+ps7chsdQruyT5ZtzjYsnqGOAUTNVSkMwEwQqPsZjAYombIIi8rZbAcYsLG6CcFYWvpVzVBXxfXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782279023; c=relaxed/simple;
	bh=bYZEdOJRC1GyN0zjyVTYe8MB686HqSJLoY/ZNQV17UU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTIHAr1gRQj6QnINeAdLw889Aj68cZz1mbITpB18VoOjwOB/3/0owv7PoPY4jfWzMWR2fA4mZ6HCL6hjMix7UpSDW6jB7jf3L9NZFJr3qx+/uqTWmMGrSkVGSDYUwdqMN/+84gxJXjH6c8TSmHensEwPeSXGKmggokL/xlQyMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YITumgrV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YITumgrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782279021; x=1813815021;
  h=date:from:to:cc:subject:message-id;
  bh=bYZEdOJRC1GyN0zjyVTYe8MB686HqSJLoY/ZNQV17UU=;
  b=YITumgrVVNLIA9eGRCfT8LyqyVcL7Tc5eR0TSsOzun5/dgi9bkbfKSVn
   DFk3DDd+BdFUBIL8YbZMv5I0Vjb7gtMhvA+YAzAuUS3uDnkAmPLFLrJAL
   doJACkbImzcydJX0qRpBDBwR6xxY2Ha3k/P0rGgSI8KhM8fsu6jGDJWq8
   A7fgjBwpYqvXkRoA/DR/0K6snagZUUM0zp55S6OHVlPmNDavmW0kC8Ij7
   /Td2ANEAllNitefm1mJBuxFaf3ckmR0mHYL7WIWkCS9hwYQ8CzHpVsv/z
   KPmIJVXsMrMFPHFOnSUyLbCs+2fWe5PH+DY6Eypn5TAHhUn5G8sVMXRiw
   Q==;
X-CSE-ConnectionGUID: HJe2A894S+CWaxoczhV2dQ==
X-CSE-MsgGUID: Slbc/nA2R3yUIXLpH3ZdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86870605"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86870605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:30:20 -0700
X-CSE-ConnectionGUID: QQn7rYAPTfaQMm7AHW4X1Q==
X-CSE-MsgGUID: Th5YOABoTFaX9PPps0GokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249751830"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2026 22:30:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcGBj-0000000038f-2Ux6;
	Wed, 24 Jun 2026 05:30:15 +0000
Date: Wed, 24 Jun 2026 13:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 14/18]
 drivers/nvme/target/configfs.c:1809:38: warning: variable 'net_ns' is
 uninitialized when used here
Message-ID: <202606241339.9y3AoqDU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   3d482734f1581168bb7973032424df660ce14955
commit: 395f507329628a226fcb319ac9c6352e132fe646 [14/18] fs/configfs: balance get/put_net for configfs_ns_from_group()
config: x86_64-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260624/202606241339.9y3AoqDU-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241339.9y3AoqDU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241339.9y3AoqDU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/configfs.c:1809:38: warning: variable 'net_ns' is uninitialized when used here [-Wuninitialized]
    1809 |         disc_subsys = nvmet_get_disc_subsys(net_ns);
         |                                             ^~~~~~
   drivers/nvme/target/configfs.c:1802:20: note: initialize the variable 'net_ns' to silence this warning
    1802 |         struct net *net_ns;
         |                           ^
         |                            = NULL
   drivers/nvme/target/configfs.c:2430:6: warning: variable 'old_nqn' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2430 |         if (disc_subsys) {
         |             ^~~~~~~~~~~
   drivers/nvme/target/configfs.c:2436:8: note: uninitialized use occurs here
    2436 |         kfree(old_nqn);
         |               ^~~~~~~
   drivers/nvme/target/configfs.c:2430:2: note: remove the 'if' if its condition is always true
    2430 |         if (disc_subsys) {
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/target/configfs.c:2397:15: note: initialize the variable 'old_nqn' to silence this warning
    2397 |         char *old_nqn, *new_nqn;
         |                      ^
         |                       = NULL
   2 warnings generated.


vim +/net_ns +1809 drivers/nvme/target/configfs.c

a07b4970f464f13 Christoph Hellwig 2016-06-21  1797  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1798  static struct config_group *nvmet_subsys_make(struct config_group *group,
a07b4970f464f13 Christoph Hellwig 2016-06-21  1799  		const char *name)
a07b4970f464f13 Christoph Hellwig 2016-06-21  1800  {
56136fea189403b Hannes Reinecke   2026-06-19  1801  	struct nvmet_subsys *subsys, *disc_subsys;
395f507329628a2 Hannes Reinecke   2026-06-19  1802  	struct net *net_ns;
a07b4970f464f13 Christoph Hellwig 2016-06-21  1803  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1804  	if (sysfs_streq(name, NVME_DISC_SUBSYS_NAME)) {
a07b4970f464f13 Christoph Hellwig 2016-06-21  1805  		pr_err("can't create discovery subsystem through configfs\n");
a07b4970f464f13 Christoph Hellwig 2016-06-21  1806  		return ERR_PTR(-EINVAL);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1807  	}
a07b4970f464f13 Christoph Hellwig 2016-06-21  1808  
55b4ace3bb49490 Hannes Reinecke   2026-06-12 @1809  	disc_subsys = nvmet_get_disc_subsys(net_ns);
56136fea189403b Hannes Reinecke   2026-06-19  1810  	if (!disc_subsys)
56136fea189403b Hannes Reinecke   2026-06-19  1811  		return ERR_PTR(-ENOENT);
56136fea189403b Hannes Reinecke   2026-06-19  1812  	if (sysfs_streq(name, disc_subsys->subsysnqn)) {
95409e277d83438 Hannes Reinecke   2024-04-03  1813  		pr_err("can't create subsystem using unique discovery NQN\n");
95409e277d83438 Hannes Reinecke   2024-04-03  1814  		return ERR_PTR(-EINVAL);
95409e277d83438 Hannes Reinecke   2024-04-03  1815  	}
95409e277d83438 Hannes Reinecke   2024-04-03  1816  
395f507329628a2 Hannes Reinecke   2026-06-19  1817  	net_ns = configfs_ns_from_group(group);
55b4ace3bb49490 Hannes Reinecke   2026-06-12  1818  	subsys = nvmet_subsys_alloc(name, NVME_NQN_NVME, net_ns);
395f507329628a2 Hannes Reinecke   2026-06-19  1819  	put_net(net_ns);
6b7e631b927ca12 Minwoo Im         2019-04-07  1820  	if (IS_ERR(subsys))
6b7e631b927ca12 Minwoo Im         2019-04-07  1821  		return ERR_CAST(subsys);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1822  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1823  	config_group_init_type_name(&subsys->group, name, &nvmet_subsys_type);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1824  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1825  	config_group_init_type_name(&subsys->namespaces_group,
a07b4970f464f13 Christoph Hellwig 2016-06-21  1826  			"namespaces", &nvmet_namespaces_type);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1827  	configfs_add_default_group(&subsys->namespaces_group, &subsys->group);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1828  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1829  	config_group_init_type_name(&subsys->allowed_hosts_group,
a07b4970f464f13 Christoph Hellwig 2016-06-21  1830  			"allowed_hosts", &nvmet_allowed_hosts_type);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1831  	configfs_add_default_group(&subsys->allowed_hosts_group,
a07b4970f464f13 Christoph Hellwig 2016-06-21  1832  			&subsys->group);
a07b4970f464f13 Christoph Hellwig 2016-06-21  1833  
cae5b01a2afc205 Logan Gunthorpe   2020-07-24  1834  	nvmet_add_passthru_group(subsys);
cae5b01a2afc205 Logan Gunthorpe   2020-07-24  1835  
a07b4970f464f13 Christoph Hellwig 2016-06-21  1836  	return &subsys->group;
a07b4970f464f13 Christoph Hellwig 2016-06-21  1837  }
a07b4970f464f13 Christoph Hellwig 2016-06-21  1838  

:::::: The code at line 1809 was first introduced by commit
:::::: 55b4ace3bb49490cca072cf61a14f8a2a6da407e nvmet: make configfs setup namespace aware

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
