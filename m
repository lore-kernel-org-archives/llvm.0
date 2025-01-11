Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB124B238;
	Sat, 11 Jan 2025 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736595707; cv=none; b=W5bQqzQjB1BbMdcJpvMzHW/k3CswHaQZTjB5ZWuxmOTvUsWPuoSNCEDau7hGuof0CnXB4oEiFzd2oqF7hEYDPjOg8w9G22qCAsPVlSo4+u0eoLJoiR4oAsTSJoXLHurHCWaGdx3uw4jPzHpGfS8sDCRNP8t5k3l5kavxjdFPNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736595707; c=relaxed/simple;
	bh=C+EI4djAdiW22BkQAHjJXOYHzIxWKN1n1egRxagk8WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwVxAUSstk9HBlZxu5VbPa3Bkh36dpEuDw2a1bKL86zh1VAxxwWtXFcpdVB/j84prIvnWWdkPWQPVTAAm6O9Fwc/v+c8a593Dis7PxIKxj7JvC/EDMuWVdzp46dc/DlDv9wxPp2/r7uS2sbisnXV8/9CmLLgrAqoi8c8ouzFRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkaYe+6e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkaYe+6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736595705; x=1768131705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+EI4djAdiW22BkQAHjJXOYHzIxWKN1n1egRxagk8WM=;
  b=SkaYe+6erIOkXSTW2dY0ehHuopdjLOnVZE+iMdX3/fe+ZcAWknA8wF25
   WHWwl1/rKOv+ThjiAwTmsbPQnGZUZpp15gJdyd2qRFE2dAvOHVSx2hs5C
   0hbMil3KSJJSYXEjfBLR4QdLBjA4E27DanW9o5ICWcLbw4R6YzYtTZ1xx
   Jp4bHeioKAxHZnHnADVH1JVdxQBVQPDd3csrVYC5AxbbXItWcTibOLIqu
   BiNKdasdx8tPGUgDwGVJEA49hDlzoO9nOk4JpGt+TEo4/WSvvcxZoauy4
   +NhP5N2R2Ci0bqY5xAigmvv1cxF3cEooKmVyfRhytQVF3NHPJ4sbbE5fK
   w==;
X-CSE-ConnectionGUID: 7VZZI1/wSN2T8Cah8cIAgg==
X-CSE-MsgGUID: rkAcq4wjQ+SP5IE7uz1WJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47876713"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47876713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:41:45 -0800
X-CSE-ConnectionGUID: gawo485gQr+A0epHE3wrpg==
X-CSE-MsgGUID: H2QMicbpS+mgouTbN2u/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104492287"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 03:41:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZs4-000Kav-1D;
	Sat, 11 Jan 2025 11:41:40 +0000
Date: Sat, 11 Jan 2025 19:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>
Subject: [iommu:arm/smmu/updates 25/26]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:4: error: call to
 undeclared function 'str_read_write'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202501111926.qOpnlK9J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git arm/smmu/updates
head:   1f3dc29d2445c89c85e451c02e41a8e0cd22423c
commit: f2c77f6e41e68e1b24c165acbf6d4da6b3117e23 [25/26] iommu/arm-smmu-v3: Use str_read_write helper w/ logs
config: arm64-randconfig-004-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111926.qOpnlK9J-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111926.qOpnlK9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111926.qOpnlK9J-lkp@intel.com/

Note: the iommu/arm/smmu/updates HEAD 1f3dc29d2445c89c85e451c02e41a8e0cd22423c builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:4: error: call to undeclared function 'str_read_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           str_read_write(evt->read),
                           ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:4: note: did you mean 'sb_end_write'?
   include/linux/fs.h:1811:20: note: 'sb_end_write' declared here
   static inline void sb_end_write(struct super_block *sb)
                      ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:4: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
                           str_read_write(evt->read),
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +/str_read_write +1910 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1888	
  1889	static void arm_smmu_dump_event(struct arm_smmu_device *smmu, u64 *raw,
  1890					struct arm_smmu_event *evt,
  1891					struct ratelimit_state *rs)
  1892	{
  1893		if (!__ratelimit(rs))
  1894			return;
  1895	
  1896		arm_smmu_dump_raw_event(smmu, raw, evt);
  1897	
  1898		switch (evt->id) {
  1899		case EVT_ID_TRANSLATION_FAULT:
  1900		case EVT_ID_ADDR_SIZE_FAULT:
  1901		case EVT_ID_ACCESS_FAULT:
  1902		case EVT_ID_PERMISSION_FAULT:
  1903			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x iova: %#llx ipa: %#llx",
  1904				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1905				evt->sid, evt->ssid, evt->iova, evt->ipa);
  1906	
  1907			dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
  1908				evt->privileged ? "priv" : "unpriv",
  1909				evt->instruction ? "inst" : "data",
> 1910				str_read_write(evt->read),
  1911				evt->s2 ? "s2" : "s1", event_class_str[evt->class],
  1912				evt->class_tt ? (evt->ttrnw ? " ttd_read" : " ttd_write") : "",
  1913				evt->stall ? " stall" : "", evt->stag);
  1914	
  1915			break;
  1916	
  1917		case EVT_ID_STE_FETCH_FAULT:
  1918		case EVT_ID_CD_FETCH_FAULT:
  1919		case EVT_ID_VMS_FETCH_FAULT:
  1920			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x fetch_addr: %#llx",
  1921				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1922				evt->sid, evt->ssid, evt->fetch_addr);
  1923	
  1924			break;
  1925	
  1926		default:
  1927			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x",
  1928				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1929				evt->sid, evt->ssid);
  1930		}
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
