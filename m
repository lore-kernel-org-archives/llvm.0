Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13C1E5B76;
	Sun, 20 Apr 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745159772; cv=none; b=RvYdN8JoMIfn4SlJqBihpHwu7KuhEXyqFE8tyo/kug8h/4DUowS+ELdChvislquXr7GjFkji1BJ9OW1X6vDlGObrNzN0VLNOwTGy6k6C8V1bHk/0QlwPtOCg79C3YXsHl0ahIB35zuM7lvqpZg3Rf223UDmTdJVeADSMZouWV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745159772; c=relaxed/simple;
	bh=PU6qKLj87YBy5+uqg2F4+r2zilpcE3fFtFR5664YCnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0V80WjrXaOWTQ+c51aXnMpDLEcOLNroLtalpoJKI009FqpD7VfkdCh4GrFxiYN/1rQODujnT4CmHVA247hynkjEnEgcwqZ5poComQWiwYKogtWfrtYvIM7V8EoqG0eMOR4NzWYrAWu3nMqqotzEeCEwcebhquqRW0yYR6kTwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnkZY/1s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnkZY/1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745159771; x=1776695771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PU6qKLj87YBy5+uqg2F4+r2zilpcE3fFtFR5664YCnQ=;
  b=lnkZY/1syYiEdqhqZlN1hgr0ycGtf0Eks3qqR+EFX22UAP0t8rdQXvru
   6UdErZNAn9MrcwnWyj/pS0jA+pa1xQyUwyhUgaPidUZ69G5WTsFNP9T4T
   SQHmtW9eRGU5nVJ+ygF0159m5Uyc1aTgf3L3e+vm2f1V2MDI/jqi+AFwB
   P+Dt6/uNcvYs6Q86oURdCnCUIq3kWw3yL7jr9cIK3NmcrqE6ADASAnro3
   zvplRwiEGWB8YcBlf65N4DEewz+aJV0YypeQYgqF9nyc0ag4vA+PWKPU+
   QjwyVDB9dwdiRJveIB3Z0s8tkrlEQIdMuwPa8XNQ6GGIBESz0MfDOICRs
   g==;
X-CSE-ConnectionGUID: P3CdkrW4TqOpnjg6cYYzJQ==
X-CSE-MsgGUID: ANPuLYVxTkSmIld2b7XNDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="49376626"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="49376626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 07:36:10 -0700
X-CSE-ConnectionGUID: wCEr1jZLRoG8pVNL8XssTw==
X-CSE-MsgGUID: vLmfO2M6RLOxlL2HegtMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168714530"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Apr 2025 07:36:07 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Vm8-0004hZ-2z;
	Sun, 20 Apr 2025 14:36:04 +0000
Date: Sun, 20 Apr 2025 22:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH v5] hwmon: (max77705) add initial support
Message-ID: <202504202204.GCyy3bOc-lkp@intel.com>
References: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a4cda136f021ad44b8b52286aafd613030a6db5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/hwmon-max77705-add-initial-support/20250420-030631
base:   a4cda136f021ad44b8b52286aafd613030a6db5f
patch link:    https://lore.kernel.org/r/20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1%40gmail.com
patch subject: [PATCH v5] hwmon: (max77705) add initial support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504202204.GCyy3bOc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202204.GCyy3bOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202204.GCyy3bOc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:51:34: warning: unused variable 'max77705_hwmon_readable_ranges' [-Wunused-const-variable]
      51 | static const struct regmap_range max77705_hwmon_readable_ranges[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/max77705_hwmon_readable_ranges +51 drivers/hwmon/max77705-hwmon.c

    50	
  > 51	static const struct regmap_range max77705_hwmon_readable_ranges[] = {
    52		regmap_reg_range(AVGISYS_REG,	AVGISYS_REG + 1),
    53		regmap_reg_range(IIN_REG,	IIN_REG + 1),
    54		regmap_reg_range(ISYS_REG,	ISYS_REG + 1),
    55		regmap_reg_range(VBYP_REG,	VBYP_REG + 1),
    56		regmap_reg_range(VSYS_REG,	VSYS_REG + 1),
    57	};
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
