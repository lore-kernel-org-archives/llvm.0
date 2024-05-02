Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F912B87;
	Thu,  2 May 2024 01:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714612690; cv=none; b=Iqm3RYJwjKnwTSTDmxdK1K23a02RJWL4lVfh7b0Zbz/IFKTM4ewARNripPfcYXFT9SNAMT6utNxK8Pcvh/7OkyWj6ZBdV9oEz9QMn11gFNiac/xwPKlJ27Sq0Mu9uh3+zcHcmbwAHJo+JfaYoSxKcxs7xDmhsDwcOqi3g2sStf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714612690; c=relaxed/simple;
	bh=mzFZRCN/DM4D7nhwU2r1r0KjMtywnF6vbmB1PodwWEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoedqwBkMfy3+EBtN/esWSWgpv5Np8NyfajF2o09M0kHlTNCNZpEfGMP1AZpIvQ15S2kAUnKRguan6HlxkY99GLJlk46ZbDDTmgG7xnT0qbFqsjYNBdtv6oLqM9sa9gZ0BIUJEnDJaVm21k9+Ek5Trd56W5MMEJJyY6xC9+zIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/tgc85A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/tgc85A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714612688; x=1746148688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzFZRCN/DM4D7nhwU2r1r0KjMtywnF6vbmB1PodwWEU=;
  b=i/tgc85AOEl4iT2s0nvqlGfu34wqtGdAqPoozzsvfzahn6ynwDpDJKR9
   Hp16g1ueGUhQFBPQtZafYcNutZPv4totJThwXXOhfg7BkFzhjJzJ8Sdv3
   SSBbB5aFBAoceBQ5DRuEoXmPNXUiz+U62RgqPAp4SmGXd80HCZ8hXYYsD
   BOXh7dXYoWAjTrgwFDcIEvqh+QERqmrKs7Q0UiCC9g82T57nl480bfY3m
   YL2dPjNWJZpkSp+e1N7AdE2yn6c0UGntNEsUrx2EAD+d3mXAWvzNZz5/n
   emgrKlkXmYPxGjrem9ytlzGtthjYOMu+eAg2clPWHzmuuxm0Pu3Ob18+N
   A==;
X-CSE-ConnectionGUID: QXqH6rBFQf6lnHvFkws0Zw==
X-CSE-MsgGUID: PotIiVHtSUWZSIB9E7LZ5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10908444"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10908444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 18:18:07 -0700
X-CSE-ConnectionGUID: r9WbM5N7SbWvsO4uRm42XA==
X-CSE-MsgGUID: TJ81bCL+Q/6djgXjWEDaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27363820"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2024 18:18:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2L5H-000AGW-3B;
	Thu, 02 May 2024 01:18:03 +0000
Date: Thu, 2 May 2024 09:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 5/5] include/linux/cxl-event.h:158:1:
 error: expected identifier or '('
Message-ID: <202405020910.9Co46x8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9561664438db543f4d61ee0dde4fa9722239fb13
commit: 9561664438db543f4d61ee0dde4fa9722239fb13 [5/5] acpi/ghes: Add CXL CPER injection debugfs
config: i386-buildonly-randconfig-003-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020910.9Co46x8J-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020910.9Co46x8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020910.9Co46x8J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/acpi_extlog.c:19:
   In file included from drivers/acpi/apei/apei-internal.h:11:
>> include/linux/cxl-event.h:158:1: error: expected identifier or '('
     158 | {
         | ^
   include/linux/cxl-event.h:163:1: error: expected identifier or '('
     163 | {
         | ^
   2 errors generated.


vim +158 include/linux/cxl-event.h

f64693ceeed628 Ira Weiny 2023-07-13  151  
f64693ceeed628 Ira Weiny 2023-07-13  152  #ifdef CONFIG_ACPI_APEI_GHES
f64693ceeed628 Ira Weiny 2023-07-13  153  int cxl_cper_register_work(struct work_struct *work);
f64693ceeed628 Ira Weiny 2023-07-13  154  int cxl_cper_unregister_work(struct work_struct *work);
f64693ceeed628 Ira Weiny 2023-07-13  155  int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd);
f64693ceeed628 Ira Weiny 2023-07-13  156  #else
f64693ceeed628 Ira Weiny 2023-07-13  157  static inline int cxl_cper_register_work(struct work_struct *work);
f64693ceeed628 Ira Weiny 2023-07-13 @158  {
f64693ceeed628 Ira Weiny 2023-07-13  159  	return 0;
f64693ceeed628 Ira Weiny 2023-07-13  160  }
f64693ceeed628 Ira Weiny 2023-07-13  161  

:::::: The code at line 158 was first introduced by commit
:::::: f64693ceeed628d8036c8ac75f655bb3292d5bcf acpi/ghes: Process CXL Component Events

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Ira Weiny <ira.weiny@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
