Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5B30BBB6;
	Wed, 18 Feb 2026 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445711; cv=none; b=Ve7OcmEAK/SwvVe/qwyRFg7lz9RqQEaB1Lf8nJZmmBiiypGmqvm7I8t7hk8X4QRXLvDkF0ThljJ13YXJMnrMYXZp34MPTYJ2f+b9gdKItLJvIdNLqtzEHjBrf4FQo8iuSIwPqITECOwbcM19OhEGwwFMqdZmWMspiZ7X5CjYM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445711; c=relaxed/simple;
	bh=EH+P6Wc5iI8Th8rnFmAS1h0Udp7LPCg+q49DqDBQXWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKxajVd5bGTW9LTPwvqvfkwwTg0OPaeJdR3G5nwYkGsI6bXzjSEeUWugTUrrLnuG/7HltqCrzVz4OQmXI8BjU6OP4Vur52+gzK3vjJqbz4dW74xV5N67tUiahYOMAfQqBqVm2KGvmc4S3zsZWxih1RcTkphZiwZvhOvdsgKt4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clgh12+v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clgh12+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771445709; x=1802981709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EH+P6Wc5iI8Th8rnFmAS1h0Udp7LPCg+q49DqDBQXWA=;
  b=clgh12+vNNreMPxXtfimE+SQgsz1ccLiuPcfx8xDKntLaXiRdjh/nkg7
   N/NG1pDWGRfEH8JmAgjvdbj7rfsq7Fg9ZH+JzRwQcB1c/x8TKd0W/O/Ng
   u4Jo1Q8M9ho8Yq4YN0Js/1xdjiesa7EIUIfWPfsuVwreYaaKKrdNPsuJX
   h4aVEv2conhUP98FMIUxhuTpEMBFvVOnP8MHzjl/jsJBL3xPSFIjCFTbL
   ypOAt99EqAkUDcHDlyTC/bx0q1zPYtVcA/61BbGN6Lhl+MHZawXyNB4K4
   eg77SE4zeVrUecW5sFpjJKVKmNGFyms3Gv9/BnGbj94u8EsuF9fG8xBCi
   g==;
X-CSE-ConnectionGUID: MAIpjDJkSs+/13Pp4V2yIQ==
X-CSE-MsgGUID: 8Nv9XC3hR9+WuNU85gt47g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="97990006"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="97990006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 12:15:08 -0800
X-CSE-ConnectionGUID: se0VBPhrQEO0eIuHvdv4Ag==
X-CSE-MsgGUID: 37iEnsDVT0GuVylkU1Vw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213388902"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Feb 2026 12:15:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsnwv-000000012hw-3Czo;
	Wed, 18 Feb 2026 20:15:05 +0000
Date: Thu, 19 Feb 2026 04:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkall@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 05/10] driver core: make struct device member groups
 a constant array
Message-ID: <202602190438.KpXZA9Vu-lkp@intel.com>
References: <ca6222be-1380-4a1e-a8d0-330caf3748f6@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6222be-1380-4a1e-a8d0-330caf3748f6@kernel.org>

Hi Heiner,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus abelloni/rtc-next rdma/for-next linus/master v6.19 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/IB-core-Prepare-for-immutable-device-groups/20260218-063407
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/ca6222be-1380-4a1e-a8d0-330caf3748f6%40kernel.org
patch subject: [PATCH RFC 05/10] driver core: make struct device member groups a constant array
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190438.KpXZA9Vu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190438.KpXZA9Vu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190438.KpXZA9Vu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/counter/counter-sysfs.c:1172:18: error: read-only variable is not assignable
    1172 |                 dev->groups[i] = &groups[i];
         |                 ~~~~~~~~~~~~~~ ^
   1 error generated.


vim +1172 drivers/counter/counter-sysfs.c

aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1107  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1108  /**
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1109   * counter_sysfs_add - Adds Counter sysfs attributes to the device structure
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1110   * @counter:	Pointer to the Counter device structure
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1111   *
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1112   * Counter sysfs attributes are created and added to the respective device
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1113   * structure for later registration to the system. Resource-managed memory
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1114   * allocation is performed by this function, and this memory should be freed
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1115   * when no longer needed (automatically by a device_unregister call, or
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1116   * manually by a devres_release_all call).
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1117   */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1118  int counter_sysfs_add(struct counter_device *const counter)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1119  {
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1120  	struct device *const dev = &counter->dev;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1121  	const size_t num_groups = counter->num_signals + counter->num_counts + 1;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1122  	struct counter_attribute_group *cattr_groups;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1123  	size_t i, j;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1124  	int err;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1125  	struct attribute_group *groups;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1126  	struct counter_attribute *p;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1127  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1128  	/* Allocate space for attribute groups (signals, counts, and ext) */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1129  	cattr_groups = devm_kcalloc(dev, num_groups, sizeof(*cattr_groups),
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1130  				    GFP_KERNEL);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1131  	if (!cattr_groups)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1132  		return -ENOMEM;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1133  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1134  	/* Initialize attribute lists */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1135  	for (i = 0; i < num_groups; i++)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1136  		INIT_LIST_HEAD(&cattr_groups[i].attr_list);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1137  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1138  	/* Add Counter device sysfs attributes */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1139  	err = counter_sysfs_attr_add(counter, cattr_groups);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1140  	if (err < 0)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1141  		return err;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1142  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1143  	/* Allocate attribute group pointers for association with device */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1144  	dev->groups = devm_kcalloc(dev, num_groups + 1, sizeof(*dev->groups),
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1145  				   GFP_KERNEL);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1146  	if (!dev->groups)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1147  		return -ENOMEM;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1148  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1149  	/* Allocate space for attribute groups */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1150  	groups = devm_kcalloc(dev, num_groups, sizeof(*groups), GFP_KERNEL);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1151  	if (!groups)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1152  		return -ENOMEM;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1153  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1154  	/* Prepare each group of attributes for association */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1155  	for (i = 0; i < num_groups; i++) {
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1156  		groups[i].name = cattr_groups[i].name;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1157  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1158  		/* Allocate space for attribute pointers */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1159  		groups[i].attrs = devm_kcalloc(dev,
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1160  					       cattr_groups[i].num_attr + 1,
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1161  					       sizeof(*groups[i].attrs),
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1162  					       GFP_KERNEL);
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1163  		if (!groups[i].attrs)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1164  			return -ENOMEM;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1165  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1166  		/* Add attribute pointers to attribute group */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1167  		j = 0;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1168  		list_for_each_entry(p, &cattr_groups[i].attr_list, l)
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1169  			groups[i].attrs[j++] = &p->dev_attr.attr;
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1170  
aaec1a0f76ec25f William Breathitt Gray 2021-08-27  1171  		/* Associate attribute group */
aaec1a0f76ec25f William Breathitt Gray 2021-08-27 @1172  		dev->groups[i] = &groups[i];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
