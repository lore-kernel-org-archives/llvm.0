Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E7F11193;
	Mon, 20 Nov 2023 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4Zhn7F3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700472148; x=1732008148;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XOse6nLS+ynJKf7K7tWCjaNLnveAeFnXb4gQHbRK2b0=;
  b=m4Zhn7F3TnK0zioS29ipTqeVWbhpsw0qcL3wyurj6qMLJfOzBPNQ8Owd
   /OtU+ZE5mlCIlKn0zqvC3sbRYto+Ut6f5ntUdZAcpA8skc0OcxSX0vEsj
   zYrEI54h2qUGK4tmzwYEZwW4vr/LTYWRqO7DVbC4rEoCd88uVf+ECvvC4
   KAA8pW0uMpJrmiTKPWd6t8VdBXa6HOF0osbr4jEarLK9Jas/5zaSrOuw/
   LoNQ54raTjJL0laUT1q9XbcDx0/xmO1lQO8g7+5zc2/AbzVLzONOFVBVT
   YUTQ/aQqpWh2fnNQXPLPmcqV16BPLkzafgV5MioBLZw1LieaMdIUO85Q1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388724167"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="388724167"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 01:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742668572"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742668572"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 01:22:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r50Tr-0006G5-2w;
	Mon, 20 Nov 2023 09:22:13 +0000
Date: Mon, 20 Nov 2023 17:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 6/7]
 drivers/platform/x86/amd/hsmp.c:474:9: error: call to undeclared function
 'devm_device_add_groups'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202311201751.eHNoBaoW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   a260586a7ea6421f743308ef55f7ee80ef3488ac
commit: a596671292945febec43acb2254628ce36afdafd [6/7] driver core: remove devm_device_add_groups()
config: x86_64-buildonly-randconfig-006-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201751.eHNoBaoW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201751.eHNoBaoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201751.eHNoBaoW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/amd/hsmp.c:474:9: error: call to undeclared function 'devm_device_add_groups'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
                  ^
   drivers/platform/x86/amd/hsmp.c:474:9: note: did you mean 'devm_device_add_group'?
   include/linux/device.h:1205:18: note: 'devm_device_add_group' declared here
   int __must_check devm_device_add_group(struct device *dev,
                    ^
   1 error generated.


vim +/devm_device_add_groups +474 drivers/platform/x86/amd/hsmp.c

5150542b8ec5fb Suma Hegde 2023-10-10  432  
5150542b8ec5fb Suma Hegde 2023-10-10  433  static int hsmp_create_sysfs_interface(void)
5150542b8ec5fb Suma Hegde 2023-10-10  434  {
5150542b8ec5fb Suma Hegde 2023-10-10  435  	const struct attribute_group **hsmp_attr_grps;
5150542b8ec5fb Suma Hegde 2023-10-10  436  	struct bin_attribute **hsmp_bin_attrs;
5150542b8ec5fb Suma Hegde 2023-10-10  437  	struct attribute_group *attr_grp;
5150542b8ec5fb Suma Hegde 2023-10-10  438  	int ret;
5150542b8ec5fb Suma Hegde 2023-10-10  439  	u16 i;
5150542b8ec5fb Suma Hegde 2023-10-10  440  
5150542b8ec5fb Suma Hegde 2023-10-10  441  	/* String formatting is currently limited to u8 sockets */
5150542b8ec5fb Suma Hegde 2023-10-10  442  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
5150542b8ec5fb Suma Hegde 2023-10-10  443  		return -ERANGE;
5150542b8ec5fb Suma Hegde 2023-10-10  444  
5150542b8ec5fb Suma Hegde 2023-10-10  445  	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
5150542b8ec5fb Suma Hegde 2023-10-10  446  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  447  	if (!hsmp_attr_grps)
5150542b8ec5fb Suma Hegde 2023-10-10  448  		return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  449  
5150542b8ec5fb Suma Hegde 2023-10-10  450  	/* Create a sysfs directory for each socket */
5150542b8ec5fb Suma Hegde 2023-10-10  451  	for (i = 0; i < plat_dev.num_sockets; i++) {
5150542b8ec5fb Suma Hegde 2023-10-10  452  		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  453  		if (!attr_grp)
5150542b8ec5fb Suma Hegde 2023-10-10  454  			return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  455  
5150542b8ec5fb Suma Hegde 2023-10-10  456  		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
5150542b8ec5fb Suma Hegde 2023-10-10  457  		attr_grp->name = plat_dev.sock[i].name;
5150542b8ec5fb Suma Hegde 2023-10-10  458  
5150542b8ec5fb Suma Hegde 2023-10-10  459  		/* Null terminated list of attributes */
5150542b8ec5fb Suma Hegde 2023-10-10  460  		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
5150542b8ec5fb Suma Hegde 2023-10-10  461  					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  462  		if (!hsmp_bin_attrs)
5150542b8ec5fb Suma Hegde 2023-10-10  463  			return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  464  
5150542b8ec5fb Suma Hegde 2023-10-10  465  		attr_grp->bin_attrs		= hsmp_bin_attrs;
5150542b8ec5fb Suma Hegde 2023-10-10  466  		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
5150542b8ec5fb Suma Hegde 2023-10-10  467  		hsmp_attr_grps[i]		= attr_grp;
5150542b8ec5fb Suma Hegde 2023-10-10  468  
5150542b8ec5fb Suma Hegde 2023-10-10  469  		/* Now create the leaf nodes */
5150542b8ec5fb Suma Hegde 2023-10-10  470  		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
5150542b8ec5fb Suma Hegde 2023-10-10  471  		if (ret)
5150542b8ec5fb Suma Hegde 2023-10-10  472  			return ret;
5150542b8ec5fb Suma Hegde 2023-10-10  473  	}
5150542b8ec5fb Suma Hegde 2023-10-10 @474  	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
5150542b8ec5fb Suma Hegde 2023-10-10  475  }
5150542b8ec5fb Suma Hegde 2023-10-10  476  

:::::: The code at line 474 was first introduced by commit
:::::: 5150542b8ec5fb561be080ed0ef3bab8598154c3 platform/x86/amd/hsmp: add support for metrics tbl

:::::: TO: Suma Hegde <suma.hegde@amd.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
