Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4F1DA10E;
	Sun, 17 Nov 2024 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731867308; cv=none; b=GG34hr12e4/02+eqMQNTuOuMwXzboKDBRAFBSBO+MLkjFY9WwqC0bIptZ/EzwMeGSkowrtyY2QA4QCvMf8BXg9Qb1+0t+9i75znjMedkuukf4b+9e5OpGzaa4VHfNrWRqF3fq/MUtv1KauJibjXfOMbfkMQrYcxH3SEOMKpOw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731867308; c=relaxed/simple;
	bh=/EB5LIEg/vG8YEd1UQtjsqS8CABq338uZfnO55MZ+hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxfW1jcTci2WaqaWkMDm+rCGnmMpoRfn2Qa38sK4Bb+GBCKoXLPq6mJpUpRsNtqnR72N8kbQZ8E/Bo0HxOvNDFR+VAuKaMUS9xMVUPCKCNX0fJj+daN2lEcj0evemFC8G2xN+QifD428GX01ePQ1KqirnH05Ly7cyyLDCdy24Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtZ8U5ps; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtZ8U5ps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731867306; x=1763403306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EB5LIEg/vG8YEd1UQtjsqS8CABq338uZfnO55MZ+hc=;
  b=VtZ8U5psUPRwoq5hPDrHORiDk4XBBesKSgzySi/MFr9aYE1YIaksCMAo
   mKENX+bDlQhM5Ogqha6fnQKxc54+5j0ba0ss3yVkwY8+aTVk0g1VptKUi
   hgYI1qVMGfAdnRw+7pAk5x07THMe/50GcvQ9uUUNJ45Xf0GmJegtvtuaC
   uIMPt7EnXMcDf62uXBoqH9QfRVBEpM9A8uf21aBSyQl244h6/8XJpkYg/
   Z8iyqvNGt0M9FbEraC09u5U1Q0mr31Y0CY0oucmy6ww4xtfeshb8Fz253
   XMXMLlxEN+2hitsrxF1urKZhua3HFWjIMUUcypaXViCwL0L+00DKRSU5p
   w==;
X-CSE-ConnectionGUID: IT6h3LTkT7iEko7Lymlqlw==
X-CSE-MsgGUID: wVDN/n1tTLOJcyp9DyPPwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31967298"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31967298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 10:15:05 -0800
X-CSE-ConnectionGUID: OZFkhxa4QayEdUzxCPUoaw==
X-CSE-MsgGUID: gn7BIWiySoSm9WxvzlRLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="126561582"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2024 10:15:04 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjna-0001zH-07;
	Sun, 17 Nov 2024 18:15:02 +0000
Date: Mon, 18 Nov 2024 02:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 111/120]
 drivers/scsi/ipr.c:3386:8: warning: unused variable 'bin_attr_trace'
Message-ID: <202411180246.AQdGPDg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   216b83e0b4d86a2170ccde16f4a8117e32c02d85
commit: e8fed0bb67c88ef43f708e0bfb819f69f5c9a1c2 [111/120] scsi/ipr macro
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241118/202411180246.AQdGPDg8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180246.AQdGPDg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180246.AQdGPDg8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/ipr.c:52:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
>> drivers/scsi/ipr.c:3386:8: warning: unused variable 'bin_attr_trace' [-Wunused-variable]
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:376:22: note: expanded from macro 'BIN_ATTR_RO'
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^~~~~~~~~~~~~~~~
   <scratch space>:85:1: note: expanded from here
      85 | bin_attr_trace
         | ^~~~~~~~~~~~~~
   5 warnings generated.


vim +/bin_attr_trace +3386 drivers/scsi/ipr.c

  3385	
> 3386	static BIN_ATTR_RO(trace, 0);
  3387	#endif
  3388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
