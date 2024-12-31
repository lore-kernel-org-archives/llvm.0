Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11E136E;
	Tue, 31 Dec 2024 04:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735618425; cv=none; b=kzJmDnwekWujTJioAQpohEGoInKrtipJ+jKsQ50YiZN/HWLOzEkbkDf1eH/rvjo2+koiGq5qBTHVOQ9fYNmYOI7pC6+bhkOpvTl7Pjo2+uZ7eGRoGWUJBdLShtz0guwA+YxhirRxqLJc1kB1i3tEw8MG/qkmwjQEoinTd2W66/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735618425; c=relaxed/simple;
	bh=DH1WiwE4kZAlkM1BR1tG9JqHjbRShP1PSmelBnR8kFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnOtQyyKv3nGTyVxj+159ggVpG+tH9a/EKoK1eE3mzH0ABAJz4ltOcKjWeXBRIHpofsnHSoLLQUuHEfe2/+SnQDrtouvvfPvY0LRFijoprV8/jvAAMnh7vVrqOQJeLUJ3SUy9RHB19Mc75iDh1+rGcu03B2d7tcufkpKI2uINY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrVhhjIv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrVhhjIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735618423; x=1767154423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DH1WiwE4kZAlkM1BR1tG9JqHjbRShP1PSmelBnR8kFc=;
  b=OrVhhjIv89QmyI+tPp/xbM2MCruY4QtCdrsr56JuZSLO9h86MIy9LNTR
   kmdDgnZnUcS7KahXaZX+WTOFgPaHmpmpxB3PoVFuc2AtoipUFHF91VPXB
   TVxMTpadsh5GzVBo8NbP10GoqJHN/4nhBznDBwmNFLKQ/ARf5Iu+88rja
   +P1FYrskIYIAuj/npgvve9u25fvcy7gccTM8996wRl68B9bcFoB4iIz+x
   7X/R1TQNjE3e4SLu9Ugv5tSNZ8bwGb0IUzdZnI7mV6h/EiaHJ/C2lSKYW
   Kf45+FCL4J5Phz7yZa4nfu6pWT2/a/0l75eq6e0tl1K0Nd4IZqdYI+UG2
   g==;
X-CSE-ConnectionGUID: Ia58ZWIJTSC+ZF5BfR+fjw==
X-CSE-MsgGUID: Ozg2I5/lSPmiLlgq7RjXaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36059781"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36059781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 20:13:43 -0800
X-CSE-ConnectionGUID: DYpOiWp4RNCIy5242NWLSA==
X-CSE-MsgGUID: a5+Fg2zNSUe2Pm8mxLCbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100814442"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2024 20:13:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSTdT-0006hd-0t;
	Tue, 31 Dec 2024 04:13:39 +0000
Date: Tue, 31 Dec 2024 12:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/thermal/max77620_thermal.c:48: warning: Function parameter
 or struct member 'tz' not described in 'max77620_thermal_read_temp'
Message-ID: <202412311216.RBUETxdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: ae11d6a87c3e742418baa591be1e719a95788059 thermal/drivers/maxim: Switch to new of API
date:   2 years, 5 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241231/202412311216.RBUETxdV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311216.RBUETxdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311216.RBUETxdV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/max77620_thermal.c:48: warning: Function parameter or struct member 'tz' not described in 'max77620_thermal_read_temp'
>> drivers/thermal/max77620_thermal.c:48: warning: Excess function parameter 'data' description in 'max77620_thermal_read_temp'


vim +48 drivers/thermal/max77620_thermal.c

ec4664b3fd6d56 Laxman Dewangan 2016-08-23  32  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  33  /**
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  34   * max77620_thermal_read_temp: Read PMIC die temperatue.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  35   * @data:	Device specific data.
0f43e646dddd60 Amit Kucheria   2019-11-20  36   * @temp:	Temperature in millidegrees Celsius
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  37   *
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  38   * The actual temperature of PMIC die is not available from PMIC.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  39   * PMIC only tells the status if it has crossed or not the threshold level
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  40   * of 120degC or 140degC.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  41   * If threshold has not been crossed then assume die temperature as 100degC
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  42   * else 120degC or 140deG based on the PMIC die temp threshold status.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  43   *
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  44   * Return 0 on success otherwise error number to show reason of failure.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  45   */
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  46  
ae11d6a87c3e74 Daniel Lezcano  2022-08-05  47  static int max77620_thermal_read_temp(struct thermal_zone_device *tz, int *temp)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23 @48  {
ae11d6a87c3e74 Daniel Lezcano  2022-08-05  49  	struct max77620_therm_info *mtherm = tz->devdata;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  50  	unsigned int val;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  51  	int ret;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  52  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  53  	ret = regmap_read(mtherm->rmap, MAX77620_REG_STATLBT, &val);
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  54  	if (ret < 0) {
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  55  		dev_err(mtherm->dev, "Failed to read STATLBT: %d\n", ret);
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  56  		return ret;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  57  	}
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  58  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  59  	if (val & MAX77620_IRQ_TJALRM2_MASK)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  60  		*temp = MAX77620_TJALARM2_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  61  	else if (val & MAX77620_IRQ_TJALRM1_MASK)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  62  		*temp = MAX77620_TJALARM1_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  63  	else
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  64  		*temp = MAX77620_NORMAL_OPERATING_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  65  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  66  	return 0;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  67  }
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  68  

:::::: The code at line 48 was first introduced by commit
:::::: ec4664b3fd6d565a79eb562e4339528f74eb1cca thermal: max77620: Add thermal driver for reporting junction temp

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
