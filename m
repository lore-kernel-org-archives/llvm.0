Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8CA302756;
	Fri, 15 May 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854866; cv=none; b=smWc6w0WZayQYC0BB2nNO9xyllmehzT+5Fn4me0s6vs4Pg9JNZiWdbgFV3lcRAZ+BcrhHOnxliH5YeM1gtN+fb08UTnJGGTVlTRNCaMjvrMizTwyyT7ta1bhwJc6ttgXTJnW52FTt/AtXib5sv/UPZKLGpzGaheLgdP0OiL1QYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854866; c=relaxed/simple;
	bh=RtFQMBf9gooyLPXk1b0UEBsiW3PvJm+kyuMUho6YtSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RTLsABjFUTj542EGi2DxTscsgLO6ndOah28ck7TG1gxxYVJYj/606Vq5qHbU2R0MwQXeOJA3V1htnZorfr4gJoiL59s6AdNOy5HURM+1c+ZSPHF2RiWmVxf7jD+W9pYTsjODEoUcJ0CVRjWSDcH088YDp9Z852QHPd2ZhHK9JDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3Q/3zAv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3Q/3zAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778854864; x=1810390864;
  h=date:from:to:cc:subject:message-id;
  bh=RtFQMBf9gooyLPXk1b0UEBsiW3PvJm+kyuMUho6YtSU=;
  b=e3Q/3zAv1H6NMn93aN1Werku9n7C2ZAJSDxtKr5typhX41+NsZiByKSM
   2DTxi8W/GknK7dKCu4rRuKIWNVyIYbeJdnKvKHmpF6mKkuOvGR4P9G5fV
   8bACu/67V3cIMCLVJ3W39cV9eJ+jhLy63gcQ18RfjZu/GBZO3FFZV7EJU
   82z58TjD2z0TMwmmk37MEMdipsJZuQw85OQCFB8BgryPSONzd29xbOLz5
   pVlt3zbGVaMAjZFac98GHmW96CbYXTOdZ+oNy+j82z6y+VNPUKx0ybbEx
   plWEyD8Zrb1Ts45P7Quu4ti8uBuyCD/RzZFnA+poiS/edU5OLv+aBKVOb
   w==;
X-CSE-ConnectionGUID: 6uezqcQhTlmM9QSXvwVftw==
X-CSE-MsgGUID: clEDghGuSkWSYuPbiF86uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78948417"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="78948417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 07:21:04 -0700
X-CSE-ConnectionGUID: NwpZZOZXSDCfaiQ5pLVM3w==
X-CSE-MsgGUID: pv20zHwlTDuXN8hMl8ACTA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 07:21:02 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNtPP-000000001pN-2ymh;
	Fri, 15 May 2026 14:20:59 +0000
Date: Fri, 15 May 2026 22:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 458/944]
 drivers/staging/xlnx-mmi-dptx/mmi_dp.h:329:9: error: call to undeclared
 function 'readl'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605152253.1FV85nNW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85dd9d925c66aa5f21f2d51c7d1db3df23c456ad
commit: f2009da08ef7c8990f5b89780b3d21335f00ed1a [458/944] staging: mmi-dptx: DRM/KMS driver for AMD MMI DisplayPort
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605152253.1FV85nNW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152253.1FV85nNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152253.1FV85nNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/xlnx-mmi-dptx/mmi_dp_config.c:11:
>> drivers/staging/xlnx-mmi-dptx/mmi_dp.h:329:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         return readl(base + offset);
         |                ^
>> drivers/staging/xlnx-mmi-dptx/mmi_dp.h:340:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     340 |         writel(val, base + offset);
         |         ^
   2 errors generated.


vim +/readl +329 drivers/staging/xlnx-mmi-dptx/mmi_dp.h

   319	
   320	/**
   321	 * mmi_dp_read - Read mmi_dp register
   322	 * @base: base register address
   323	 * @offset: register offset
   324	 *
   325	 * Return: value stored in the hardware register
   326	 */
   327	static inline u32 mmi_dp_read(void __iomem *base, u32 offset)
   328	{
 > 329		return readl(base + offset);
   330	}
   331	
   332	/**
   333	 * mmi_dp_write - Write the value into mmi_dp register
   334	 * @base: base register address
   335	 * @offset: register offset
   336	 * @val: value to write
   337	 */
   338	static inline void mmi_dp_write(void __iomem *base, u32 offset, u32 val)
   339	{
 > 340		writel(val, base + offset);
   341	}
   342	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
