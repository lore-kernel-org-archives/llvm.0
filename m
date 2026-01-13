Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17116155C82;
	Tue, 13 Jan 2026 00:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263288; cv=none; b=US8OQ9rv0qxCdxuz/H5tSWhCwwZve9NilDl0/khJujHFWn5d7dRddxyYONfzbfV3f8Qsbrs4B/U+EGr/rkdSJ0lBlRqEVxFaamw0gD1jovzmytwqbNnUYsDL/zO52qejGS+fgcVSe7wDk47EZVxoi6LVBVfy/0wWYQa+pTKmZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263288; c=relaxed/simple;
	bh=5GzDdjp67ayj83fKcCEL5pstjwJZWKj8QfJbEIkDkmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DeH6bkneMWTxPOCUgDijlVMT/VTG0GQfNRKRwp8c58J7pP8U1jMPsleBAG6HghjZbpJlBYXwDLlHOQwHiOrq0nVhtR6cfvWo2oODsTbUXVtcx7pUG79jybnrFp5mQDdCBB6XT6qrRY/75gzYskMo1wLI4sLXs/vfK/KKUGSrtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDODSqSz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDODSqSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768263287; x=1799799287;
  h=date:from:to:cc:subject:message-id;
  bh=5GzDdjp67ayj83fKcCEL5pstjwJZWKj8QfJbEIkDkmM=;
  b=WDODSqSzxKxMegVCENPRQEWt0xRNH08vvUNF7PYK9U1FAaYgz2MPs3Kh
   yu84FhO0jKi/ItpbV8pUorLMTXDy9dYwqBnNvzb7kmKbjMzrD/SRtHJGX
   Qb7MNFCaPWyY0UFv7az8pdjNIdGN/3d7whuI2FRFf3M3IFDkHxDlpFidO
   pPN36uqsfvdvJUERDIMEGYyv0wjouNKYo70wkdS3LZrCTU8NprrjOmCBE
   OLxOzi/GoJuslU4e8zC6QrjLW48W4QhkJVYwme7XzYlSwByTilN+XI18p
   GBQ4cZXf+CmY99dIYUTNxIabbWm8nEhPZ6hgLgQ6CvpnB6luAkNbjQQ0a
   A==;
X-CSE-ConnectionGUID: dVERDGjUSimoY3wsgEVyWQ==
X-CSE-MsgGUID: +p2hDmqrSEW9FRgdUtc1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68550568"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68550568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 16:14:45 -0800
X-CSE-ConnectionGUID: +G1/lsy/QnOhAkAObjJD0w==
X-CSE-MsgGUID: NxCToESFSZeldjUbePpS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208388492"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 16:14:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfS3U-00000000E1A-3iLl;
	Tue, 13 Jan 2026 00:14:40 +0000
Date: Tue, 13 Jan 2026 08:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v2 2/6]
 drivers/cxl/core/memctrl/sysram_region.c:83:7: error: call to undeclared
 function 'offline_and_remove_memory'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202601130852.T6w08l92-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v2
head:   dcbd460f630113f17cb71133f44920a1f35c2605
commit: ba7288831d4123b81b543a90dc594081b50ca1df [2/6] cxl: add sysram_region memory controller
config: arm-randconfig-003-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130852.T6w08l92-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130852.T6w08l92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130852.T6w08l92-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/memctrl/sysram_region.c:83:7: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         rc = offline_and_remove_memory(range.start, range_len(&range));
         |              ^
>> drivers/cxl/core/memctrl/sysram_region.c:153:24: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     153 |                 cb_arg.online_type = MMOP_ONLINE_MOVABLE;
         |                                      ^~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/memctrl/sysram_region.c:155:8: error: call to undeclared function 'walk_memory_blocks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |                 rc = walk_memory_blocks(range.start, range_len(&range),
         |                      ^
>> drivers/cxl/core/memctrl/sysram_region.c:160:24: error: use of undeclared identifier 'MMOP_ONLINE'; did you mean 'MEM_ONLINE'?
     160 |                 cb_arg.online_type = MMOP_ONLINE;
         |                                      ^~~~~~~~~~~
         |                                      MEM_ONLINE
   include/linux/memory.h:69:2: note: 'MEM_ONLINE' declared here
      69 |         MEM_ONLINE,             /* exposed to userspace */
         |         ^
   drivers/cxl/core/memctrl/sysram_region.c:162:8: error: call to undeclared function 'walk_memory_blocks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |                 rc = walk_memory_blocks(range.start, range_len(&range),
         |                      ^
   drivers/cxl/core/memctrl/sysram_region.c:169:8: error: call to undeclared function 'walk_memory_blocks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |                 rc = walk_memory_blocks(range.start, range_len(&range),
         |                      ^
>> drivers/cxl/core/memctrl/sysram_region.c:206:7: error: call to undeclared function 'add_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     206 |         rc = add_memory_driver_managed(data->mgid, range.start,
         |              ^
>> drivers/cxl/core/memctrl/sysram_region.c:208:12: error: use of undeclared identifier 'MHP_NID_IS_MGID'
     208 |                                        MHP_NID_IS_MGID);
         |                                        ^~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:237:7: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |         if (!offline_and_remove_memory(range.start, range_len(&range))) {
         |              ^
>> drivers/cxl/core/memctrl/sysram_region.c:240:3: error: call to undeclared function 'memory_group_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     240 |                 memory_group_unregister(data->mgid);
         |                 ^
>> drivers/cxl/core/memctrl/sysram_region.c:258:2: error: use of undeclared identifier 'mhp_t'
     258 |         mhp_t mhp_flags;
         |         ^~~~~
   drivers/cxl/core/memctrl/sysram_region.c:302:7: error: call to undeclared function 'memory_group_register_static'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         rc = memory_group_register_static(numa_node, PFN_UP(total_len));
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:324:2: error: use of undeclared identifier 'mhp_flags'; did you mean 'pci_flags'?
     324 |         mhp_flags = MHP_NID_IS_MGID;
         |         ^~~~~~~~~
         |         pci_flags
   include/linux/pci.h:1154:21: note: 'pci_flags' declared here
    1154 | extern unsigned int pci_flags;
         |                     ^
   drivers/cxl/core/memctrl/sysram_region.c:324:14: error: use of undeclared identifier 'MHP_NID_IS_MGID'
     324 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:325:7: error: call to undeclared function 'add_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         rc = add_memory_driver_managed(data->mgid, range.start,
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:326:44: error: use of undeclared identifier 'mhp_flags'; did you mean 'pci_flags'?
     326 |                                        range_len(&range), sysram_name, mhp_flags);
         |                                                                        ^~~~~~~~~
         |                                                                        pci_flags
   include/linux/pci.h:1154:21: note: 'pci_flags' declared here
    1154 | extern unsigned int pci_flags;
         |                     ^
   drivers/cxl/core/memctrl/sysram_region.c:350:2: error: call to undeclared function 'memory_group_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     350 |         memory_group_unregister(data->mgid);
         |         ^
   17 errors generated.


vim +/offline_and_remove_memory +83 drivers/cxl/core/memctrl/sysram_region.c

    67	
    68	static ssize_t hotunplug_store(struct device *dev,
    69				       struct device_attribute *attr,
    70				       const char *buf, size_t len)
    71	{
    72		struct cxl_region *cxlr = to_cxl_region(dev);
    73		struct range range;
    74		int rc;
    75	
    76		if (!cxlr)
    77			return -ENODEV;
    78	
    79		rc = cxl_sysram_range(cxlr, &range);
    80		if (rc)
    81			return rc;
    82	
  > 83		rc = offline_and_remove_memory(range.start, range_len(&range));
    84	
    85		if (rc)
    86			return rc;
    87	
    88		return len;
    89	}
    90	static DEVICE_ATTR_WO(hotunplug);
    91	
    92	struct online_memory_cb_arg {
    93		int online_type;
    94		int rc;
    95	};
    96	
    97	static int online_memory_block_cb(struct memory_block *mem, void *arg)
    98	{
    99		struct online_memory_cb_arg *cb_arg = arg;
   100	
   101		if (signal_pending(current))
   102			return -EINTR;
   103	
   104		cond_resched();
   105	
   106		if (mem->state == MEM_ONLINE)
   107			return 0;
   108	
   109		mem->online_type = cb_arg->online_type;
   110		cb_arg->rc = device_online(&mem->dev);
   111	
   112		return cb_arg->rc;
   113	}
   114	
   115	static int offline_memory_block_cb(struct memory_block *mem, void *arg)
   116	{
   117		int *rc = arg;
   118	
   119		if (signal_pending(current))
   120			return -EINTR;
   121	
   122		cond_resched();
   123	
   124		if (mem->state == MEM_OFFLINE)
   125			return 0;
   126	
   127		*rc = device_offline(&mem->dev);
   128	
   129		return *rc;
   130	}
   131	
   132	static ssize_t state_store(struct device *dev,
   133				   struct device_attribute *attr,
   134				   const char *buf, size_t len)
   135	{
   136		struct cxl_region *cxlr = to_cxl_region(dev);
   137		struct online_memory_cb_arg cb_arg;
   138		struct range range;
   139		int rc;
   140	
   141		if (!cxlr)
   142			return -ENODEV;
   143	
   144		rc = cxl_sysram_range(cxlr, &range);
   145		if (rc)
   146			return rc;
   147	
   148		rc = lock_device_hotplug_sysfs();
   149		if (rc)
   150			return rc;
   151	
   152		if (sysfs_streq(buf, "online")) {
 > 153			cb_arg.online_type = MMOP_ONLINE_MOVABLE;
   154			cb_arg.rc = 0;
 > 155			rc = walk_memory_blocks(range.start, range_len(&range),
   156						&cb_arg, online_memory_block_cb);
   157			if (!rc)
   158				rc = cb_arg.rc;
   159		} else if (sysfs_streq(buf, "online_normal")) {
 > 160			cb_arg.online_type = MMOP_ONLINE;
   161			cb_arg.rc = 0;
   162			rc = walk_memory_blocks(range.start, range_len(&range),
   163						&cb_arg, online_memory_block_cb);
   164			if (!rc)
   165				rc = cb_arg.rc;
   166		} else if (sysfs_streq(buf, "offline")) {
   167			int offline_rc = 0;
   168	
   169			rc = walk_memory_blocks(range.start, range_len(&range),
   170						&offline_rc, offline_memory_block_cb);
   171			if (!rc)
   172				rc = offline_rc;
   173		} else {
   174			rc = -EINVAL;
   175		}
   176	
   177		unlock_device_hotplug();
   178	
   179		if (rc)
   180			return rc;
   181	
   182		return len;
   183	}
   184	static DEVICE_ATTR_WO(state);
   185	
   186	static ssize_t hotplug_store(struct device *dev,
   187				     struct device_attribute *attr,
   188				     const char *buf, size_t len)
   189	{
   190		struct cxl_region *cxlr = to_cxl_region(dev);
   191		struct cxl_sysram_data *data;
   192		struct range range;
   193		int rc;
   194	
   195		if (!cxlr)
   196			return -ENODEV;
   197	
   198		data = dev_get_drvdata(dev);
   199		if (!data)
   200			return -ENODEV;
   201	
   202		rc = cxl_sysram_range(cxlr, &range);
   203		if (rc)
   204			return rc;
   205	
 > 206		rc = add_memory_driver_managed(data->mgid, range.start,
   207					       range_len(&range), sysram_name,
 > 208					       MHP_NID_IS_MGID);
   209		if (rc)
   210			return rc;
   211	
   212		return len;
   213	}
   214	static DEVICE_ATTR_WO(hotplug);
   215	
   216	static struct attribute *cxl_sysram_region_attrs[] = {
   217		&dev_attr_hotunplug.attr,
   218		&dev_attr_state.attr,
   219		&dev_attr_hotplug.attr,
   220		NULL,
   221	};
   222	
   223	static const struct attribute_group cxl_sysram_region_group = {
   224		.name = "memctl",
   225		.attrs = cxl_sysram_region_attrs,
   226	};
   227	
   228	static void cxl_sysram_unregister(void *_data)
   229	{
   230		struct cxl_sysram_data *data = _data;
   231		struct range range = {
   232			.start = data->res->start,
   233			.end = data->res->end
   234		};
   235	
   236		/* We have one shot for removal, otherwise it's stuck til reboot */
   237		if (!offline_and_remove_memory(range.start, range_len(&range))) {
   238			remove_resource(data->res);
   239			kfree(data->res);
 > 240			memory_group_unregister(data->mgid);
   241			kfree(data->res_name);
   242			kfree(data);
   243			return;
   244		}
   245		pr_err("CXL: %#llx-%#llx cannot be hotremoved until next reboot\n",
   246		       range.start, range.end);
   247	}
   248	
   249	int devm_cxl_add_sysram_region(struct cxl_region *cxlr)
   250	{
   251		struct cxl_region_params *p = &cxlr->params;
   252		struct device *dev = &cxlr->dev;
   253		struct cxl_sysram_data *data;
   254		struct memory_dev_type *mtype;
   255		unsigned long total_len = 0;
   256		struct resource *res;
   257		struct range range;
 > 258		mhp_t mhp_flags;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
