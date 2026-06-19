Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4B359A66;
	Fri, 19 Jun 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781906857; cv=none; b=Tk3teYd77kyWEj4ZQyXjTOEu3WeEtJWwrSCvU0+KE+AjhVJnMM1uDHoZDwUqDjB5WTZMXqkdIq8N4JLwwMCljeQQKIKHtTOiy2nFwX7+a5s+zQSgvThT5+UpkWcpfoQaXtZH8P0FZeXMqG2tJ2vZky7rtnI+RbhN87g61BdTUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781906857; c=relaxed/simple;
	bh=1Uny7ruOHWLb5ktlmJctEi+E5V5CSYyeSwj0okie4kw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCR1dRGfQgyRtJ9iGAyV3e9x0wIuQh5diRfduwc921nFI0lj3MoPLnndzxCXyo9IuTXFO/0LV7xtw89Xo95sm8cRSypnRfsCBDjX4v7PtjGubFT5bLP/05JQ9J3BdECopbt6kC8R5ZHFNgOxStspFBhbAVQz43V1IAn4+yRBXaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtL5NZWR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtL5NZWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781906855; x=1813442855;
  h=date:from:to:cc:subject:message-id;
  bh=1Uny7ruOHWLb5ktlmJctEi+E5V5CSYyeSwj0okie4kw=;
  b=XtL5NZWR2rYpKdJiaqL9TBrA4BYWzEQw2q2dk54mpBzylZGEwBHL2sF2
   5/nkM1vCcNRxMP6DIYFo3e7jaZJO0d8leFHxqVOOwiVBcXgZkch4H6h3j
   3CNCJUgCbjUqHpB/Zh18+7v1Gdt3CIQTV/xc0hOY50gi6NZZThljy5qzs
   byNaVF4G34xXMtf5+LkfNL6TIkSt0O6BInDZ4ILqpi4GwNexBEX9dAM6Q
   59MUjgDGubO2X0ksQgo1/6F5MmsJN+xw0rjRJw66Sdy0tfrvMNh5FwzWm
   iftYljtz522LvUm/3bVI6LfTcnjjLPNbhlrz6P5r26ZhI+fF8MSqAR4XY
   A==;
X-CSE-ConnectionGUID: k4GVw6hzRTWVcBwB8pI0pQ==
X-CSE-MsgGUID: e0kFMYLcRM+HIYyDavlgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="100178887"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="100178887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 15:07:33 -0700
X-CSE-ConnectionGUID: ow9lc7abTheMeYPgVUKSfQ==
X-CSE-MsgGUID: ZqdPFon0S9qEh/aSRgWslA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="272410455"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2026 15:07:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wahN2-000000005gX-47hU;
	Fri, 19 Jun 2026 22:07:28 +0000
Date: Sat, 20 Jun 2026 00:06:46 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 14/17]
 drivers/nvme/target/configfs.c:1809:38: warning: variable 'net_ns' is
 uninitialized when used here
Message-ID: <202606192341.qquHg6Hp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: 395f507329628a226fcb319ac9c6352e132fe646 [14/17] fs/configfs: balance get/put_net for configfs_ns_from_group()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260619/202606192341.qquHg6Hp-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606192341.qquHg6Hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606192341.qquHg6Hp-lkp@intel.com/

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

a07b4970f464f1 Christoph Hellwig 2016-06-21  1797  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1798  static struct config_group *nvmet_subsys_make(struct config_group *group,
a07b4970f464f1 Christoph Hellwig 2016-06-21  1799  		const char *name)
a07b4970f464f1 Christoph Hellwig 2016-06-21  1800  {
56136fea189403 Hannes Reinecke   2026-06-19  1801  	struct nvmet_subsys *subsys, *disc_subsys;
395f507329628a Hannes Reinecke   2026-06-19  1802  	struct net *net_ns;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1803  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1804  	if (sysfs_streq(name, NVME_DISC_SUBSYS_NAME)) {
a07b4970f464f1 Christoph Hellwig 2016-06-21  1805  		pr_err("can't create discovery subsystem through configfs\n");
a07b4970f464f1 Christoph Hellwig 2016-06-21  1806  		return ERR_PTR(-EINVAL);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1807  	}
a07b4970f464f1 Christoph Hellwig 2016-06-21  1808  
55b4ace3bb4949 Hannes Reinecke   2026-06-12 @1809  	disc_subsys = nvmet_get_disc_subsys(net_ns);
56136fea189403 Hannes Reinecke   2026-06-19  1810  	if (!disc_subsys)
56136fea189403 Hannes Reinecke   2026-06-19  1811  		return ERR_PTR(-ENOENT);
56136fea189403 Hannes Reinecke   2026-06-19  1812  	if (sysfs_streq(name, disc_subsys->subsysnqn)) {
95409e277d8343 Hannes Reinecke   2024-04-03  1813  		pr_err("can't create subsystem using unique discovery NQN\n");
95409e277d8343 Hannes Reinecke   2024-04-03  1814  		return ERR_PTR(-EINVAL);
95409e277d8343 Hannes Reinecke   2024-04-03  1815  	}
95409e277d8343 Hannes Reinecke   2024-04-03  1816  
395f507329628a Hannes Reinecke   2026-06-19  1817  	net_ns = configfs_ns_from_group(group);
55b4ace3bb4949 Hannes Reinecke   2026-06-12  1818  	subsys = nvmet_subsys_alloc(name, NVME_NQN_NVME, net_ns);
395f507329628a Hannes Reinecke   2026-06-19  1819  	put_net(net_ns);
6b7e631b927ca1 Minwoo Im         2019-04-07  1820  	if (IS_ERR(subsys))
6b7e631b927ca1 Minwoo Im         2019-04-07  1821  		return ERR_CAST(subsys);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1822  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1823  	config_group_init_type_name(&subsys->group, name, &nvmet_subsys_type);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1824  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1825  	config_group_init_type_name(&subsys->namespaces_group,
a07b4970f464f1 Christoph Hellwig 2016-06-21  1826  			"namespaces", &nvmet_namespaces_type);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1827  	configfs_add_default_group(&subsys->namespaces_group, &subsys->group);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1828  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1829  	config_group_init_type_name(&subsys->allowed_hosts_group,
a07b4970f464f1 Christoph Hellwig 2016-06-21  1830  			"allowed_hosts", &nvmet_allowed_hosts_type);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1831  	configfs_add_default_group(&subsys->allowed_hosts_group,
a07b4970f464f1 Christoph Hellwig 2016-06-21  1832  			&subsys->group);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1833  
cae5b01a2afc20 Logan Gunthorpe   2020-07-24  1834  	nvmet_add_passthru_group(subsys);
cae5b01a2afc20 Logan Gunthorpe   2020-07-24  1835  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1836  	return &subsys->group;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1837  }
a07b4970f464f1 Christoph Hellwig 2016-06-21  1838  

:::::: The code at line 1809 was first introduced by commit
:::::: 55b4ace3bb49490cca072cf61a14f8a2a6da407e nvmet: make configfs setup namespace aware

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
