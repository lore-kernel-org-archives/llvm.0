Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB56EB5B;
	Tue, 26 Mar 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711457931; cv=none; b=WdHHVQJ1EnyJPZt5W7lZnVHfg2/rWGqH2FWMucOLOUUA23ng9VAediGkUhmyVJSRyNlUmZCwg5CNjjpo5VGHzlWJrhcS6kdbws6y6qS8Q1eSAARLkw1MqL1KQ6tGH2cULdkl6P5hKUJzBOfq+uRQsuXSnXcS9lEPaB0F6A7NrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711457931; c=relaxed/simple;
	bh=X2THMzWYsExlmAuHaeWoNiOj8tHicjNNbZgJc80wfXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnqPo2c276mej1s3C1SAWOwQWvq3F2iTZUx/luNReDKgYoeZmX0n57XGQxu8DD12r6m+UQ2iDUnYPRjGCBXB8t8Wx/p8UH0waToTfJF55VMUfD0I7xCF3bWtbTnq0BV63T1A0r+J7EmiCwxhK8AH2DuqgbraBz4QDjC3TYpkINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9oSwfnf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9oSwfnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711457929; x=1742993929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2THMzWYsExlmAuHaeWoNiOj8tHicjNNbZgJc80wfXE=;
  b=F9oSwfnfpTIpcEjaPfw45AhA7D6KQ0TXqaU7B9KTsSYrN08thwiW9n4x
   7ZXdOY4JPE9+CxcPHloforH1BpJ1sbl7Z7HlzwBHIhv+JhusiwRxeApna
   KG86yoXtfs57flktGfr1YS/ry8bJyqGqtcLQyMOjwyVUnxbpMiUo4E/MS
   ITF726n2YXkEMxoxHdy54E6IcYYZSKYyeXEMn728H4DYAPBPS7gWOUnYp
   qQwwS86y8mrEY2I8a/W2oeK9aUXVr/bkRRzKrYuEuwdmWiacHET8CA33K
   bAGAFR6e+GX56MnU0sUpg/ybMNs0nwo96XXoZm/T+Q/D+UGxSBhahZ1Xy
   A==;
X-CSE-ConnectionGUID: SEMLjAJIQg6T+ur0B6WpxQ==
X-CSE-MsgGUID: XEnnUwWpS8GQigKfCalnmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6717065"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6717065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 05:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="46972394"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 05:58:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp6O4-00003M-1x;
	Tue, 26 Mar 2024 12:58:44 +0000
Date: Tue, 26 Mar 2024 20:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 6/7]
 drivers/platform/x86/amd/hsmp.c:696:36: error: no member named 'dev' in
 'struct hsmp_plat_device'
Message-ID: <202403262003.n5XJu6mg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   766db77dfd694e14cfdc4728e9c2f6d747dfdf84
commit: 3baa931df8381661c94796a782d473e44391c0dc [6/7] platform/x86/amd/hsmp: switch to use device_add_groups()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240326/202403262003.n5XJu6mg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403262003.n5XJu6mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403262003.n5XJu6mg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/amd/hsmp.c:696:36: error: no member named 'dev' in 'struct hsmp_plat_device'
     696 |         return device_add_groups(plat_dev.dev, hsmp_attr_grps);
         |                                  ~~~~~~~~ ^
   1 error generated.


vim +696 drivers/platform/x86/amd/hsmp.c

   668	
   669	static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
   670	{
   671		const struct attribute_group **hsmp_attr_grps;
   672		struct attribute_group *attr_grp;
   673		u16 i;
   674	
   675		hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
   676					      sizeof(*hsmp_attr_grps),
   677					      GFP_KERNEL);
   678		if (!hsmp_attr_grps)
   679			return -ENOMEM;
   680	
   681		/* Create a sysfs directory for each socket */
   682		for (i = 0; i < plat_dev.num_sockets; i++) {
   683			attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
   684						GFP_KERNEL);
   685			if (!attr_grp)
   686				return -ENOMEM;
   687	
   688			snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
   689			attr_grp->name			= plat_dev.sock[i].name;
   690			attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
   691			hsmp_attr_grps[i]		= attr_grp;
   692	
   693			hsmp_create_attr_list(attr_grp, dev, i);
   694		}
   695	
 > 696		return device_add_groups(plat_dev.dev, hsmp_attr_grps);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
