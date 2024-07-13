Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084C6C13C;
	Sat, 13 Jul 2024 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720834141; cv=none; b=cHwQDHgZoU69OARYeMrinkM3aORvYnvbivMP+fGiur7TXpDHIrIRDExdfsBWCLuqRc7gQOYg5wKf85sXvfgAxcLvjwuUnQbq1bQvW7m+vj1s1zOMC4F7P6nWqw65dHodWE4ivrIx3sF5dTcTWQ8/jcmSn+Wsba0M/A97szpNd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720834141; c=relaxed/simple;
	bh=ub/j9Je+42nrnaf5GjPf6IwipblxfQc7qPVTAwy/5fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVoqis2LE+fxpFYk2oxGyEVrjC0xZWXVCXKi5RdQfuXIEKCdoiEXl+Lw/N85JPek9LB2mvtTquJKfc+5s4xPf4qGC79p+upiwR5kqGOeGDhBpWGcLBL+suweOAd0pvhraqSHfyKs110Lrsi9iLEH7sLEf6xAtjiFhuorW6MVNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAj64gr2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAj64gr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720834140; x=1752370140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ub/j9Je+42nrnaf5GjPf6IwipblxfQc7qPVTAwy/5fs=;
  b=FAj64gr2mWdGm3msAFi8SzZZVYAvc9hoiB+8Q1aPln56H7AKn3KhI/5x
   PtyvYT5Y3MQkf9Idf+0ZpIaRgGIW3IWV9VtNT5/o0HzlbowgNY4yJOnn5
   TG1GJOmaFauD6NlqndUVkA/587ONfvO3W+/1/ylAcKlY+23IGQe+vIR7R
   wbw5AEQrKnyleEGEA1UF9zmhcmml+xQSKvmEx6K3ztg34cFCJ+VSuYPYb
   ppRHhtvShHdTy9F0Hhhq906kXL5FYZPh3HowzLXkpzKWWlo7z1kwZNPdi
   N2TDLitWo0w4fkUMuci/zjY/89FG1rEYt6KkYQq53kFq7CjaWuqYTB9rA
   A==;
X-CSE-ConnectionGUID: m9BCGkbdSOOGvL2GQciNFQ==
X-CSE-MsgGUID: a3ccxtK7RcqqWL7AD6Z25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29441196"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="29441196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:28:58 -0700
X-CSE-ConnectionGUID: j1+PW8TgR9GKsX+RVpXidw==
X-CSE-MsgGUID: J26SMWPRSSGTDVTaNSEp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48812639"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2024 18:28:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSRZG-000bWS-2J;
	Sat, 13 Jul 2024 01:28:54 +0000
Date: Sat, 13 Jul 2024 09:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging 111/143]
 drivers/hwmon/lm95234.c:223:7: warning: variable 'ret' is uninitialized when
 used here
Message-ID: <202407130915.X917zHwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
head:   80e45111b670e9c913398f5ad54196a99a739497
commit: 85a6f963ad7f3657dff782c3e3ac40ab6c95f62c [111/143] hwmon: (lm9534) Convert to with_info hwmon API
config: i386-buildonly-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130915.X917zHwW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130915.X917zHwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130915.X917zHwW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/lm95234.c:223:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     223 |                 if (ret)
         |                     ^~~
   drivers/hwmon/lm95234.c:183:9: note: initialize the variable 'ret' to silence this warning
     183 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +223 drivers/hwmon/lm95234.c

   177	
   178	static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *val)
   179	{
   180		struct lm95234_data *data = dev_get_drvdata(dev);
   181		struct regmap *regmap = data->regmap;
   182		u32 regval, mask;
   183		int ret;
   184	
   185		switch (attr) {
   186		case hwmon_temp_input:
   187			return lm95234_read_temp(regmap, channel, val);
   188		case hwmon_temp_max_alarm:
   189			ret =  regmap_read(regmap, lm95234_alarm_reg(channel), &regval);
   190			if (ret)
   191				return ret;
   192			*val = !!(regval & BIT(channel));
   193			break;
   194		case hwmon_temp_crit_alarm:
   195			ret =  regmap_read(regmap, LM95234_REG_STS_TCRIT1, &regval);
   196			if (ret)
   197				return ret;
   198			*val = !!(regval & BIT(channel));
   199			break;
   200		case hwmon_temp_crit_hyst:
   201			return lm95234_hyst_get(data, LM95234_REG_TCRIT1(channel), val);
   202		case hwmon_temp_type:
   203			ret = regmap_read(regmap, LM95234_REG_REM_MODEL, &regval);
   204			if (ret)
   205				return ret;
   206			*val = (regval & BIT(channel)) ? 1 : 2;
   207			break;
   208		case hwmon_temp_offset:
   209			ret = regmap_read(regmap, LM95234_REG_OFFSET(channel - 1), &regval);
   210			if (ret)
   211				return ret;
   212			*val = sign_extend32(regval, 7) * 500;
   213			break;
   214		case hwmon_temp_fault:
   215			ret = regmap_read(regmap, LM95234_REG_STS_FAULT, &regval);
   216			if (ret)
   217				return ret;
   218			mask = (BIT(0) | BIT(1)) << ((channel - 1) << 1);
   219			*val = !!(regval & mask);
   220			break;
   221		case hwmon_temp_max:
   222			regmap_read(regmap, lm95234_crit_reg(channel), &regval);
 > 223			if (ret)
   224				return ret;
   225			*val = regval * 1000;
   226			break;
   227		case hwmon_temp_max_hyst:
   228			return lm95234_hyst_get(data, lm95234_crit_reg(channel), val);
   229		case hwmon_temp_crit:
   230			regmap_read(regmap, LM95234_REG_TCRIT1(channel), &regval);
   231			if (ret)
   232				return ret;
   233			*val = regval * 1000;
   234			break;
   235		default:
   236			return -EOPNOTSUPP;
   237		}
   238		return 0;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
