Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DA34F24D;
	Tue, 28 Oct 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761684790; cv=none; b=lc2gEBZXaQ5lfsMZ3mn4OCdzSkV0DiqW5NEqFydH3AR9N+2X9V3IiCXgQ2aqyFgmxQkf+PEv4nlS7jr1bNEUPK6yzVvSpQ5HF/Kkk3pbFmVJGO1VUsRsLo7wD0lEp3zjDPcp04Scn++Ca6tOWuRz9vKk6MsyqkLTuZ4h3alXeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761684790; c=relaxed/simple;
	bh=NVc5BMqDDWKOkY5s1DGT9FjutTHoBcAbi4MXvIUa2cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axD/SFTkEMNDFjV4f0DoqJkF7kbq7w76gj5K7H/EjayaPNcDweA1UpfrE0/TFSSgNlTRP64rQ1e5n25bVbvXKk/yJNkCNpLPRWlpf0NSpu3RDdB/dOukVJnWjzJnA8U4rzGA33RIKvkF+hEW/O4t5YaxleqpOVMx9jT8LDLQCmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCwTXwK8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCwTXwK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761684789; x=1793220789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVc5BMqDDWKOkY5s1DGT9FjutTHoBcAbi4MXvIUa2cw=;
  b=GCwTXwK8Hsw06aQ4+rrwt3h5pLwDCR5Uy4scGfeLlUA1SKeuEK3Fy+iK
   QzOM1+WXMdjLz8n66b3voi6fEzQj/e6RVVnh8b+6HRuxrhE+9yKAFjaaP
   mJZm578Y194MGIpyXtpnWY6nbKLwf2cMTKQypa0veAYkLrGrYrlb92PmK
   GUof6a7z/jPSjH5F14Hqj/F5ZmNPuQLUv4J9CFr74JuUjWiywhzL3uFbV
   ELAWJxw2AI9yQRu5xMq9sMPi7rwjuyBFCQWM222mKOv+o8PCyJrxgj/ez
   G1umOBedfgV3EGL46jw/Yw9U9isNcR2QjH1oU+5V/9N6Z2P9XC8Hb3ujs
   g==;
X-CSE-ConnectionGUID: KLtZPksmSQ6z7FRpleYc8w==
X-CSE-MsgGUID: QI3Sj74wTnqWoph9sGSNgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66412598"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="66412598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 13:53:08 -0700
X-CSE-ConnectionGUID: n4+TiOfcQxOxOY0/rT93wg==
X-CSE-MsgGUID: lxHJFaaiSzSLnOdy5ZQT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184646258"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 13:53:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDqgi-000JkJ-0F;
	Tue, 28 Oct 2025 20:53:04 +0000
Date: Wed, 29 Oct 2025 04:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 26/27]
 drivers/soc/tegra/regulators-tegra20.c:62:6: error: call to undeclared
 function 'tegra_pmc_core_domain_state_synced'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510290440.hnsoZTpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   595a9703442efc488422dd3bf1209e3f1e5d49d2
commit: 008b60332d566cb1d00d22347a64eda10f2a8593 [26/27] soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251029/202510290440.hnsoZTpK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290440.hnsoZTpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290440.hnsoZTpK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/tegra/regulators-tegra20.c:62:6: error: call to undeclared function 'tegra_pmc_core_domain_state_synced'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         if (tegra_pmc_core_domain_state_synced() && !tegra->sys_reboot_mode) {
         |             ^
   1 error generated.
--
>> drivers/soc/tegra/regulators-tegra30.c:61:6: error: call to undeclared function 'tegra_pmc_core_domain_state_synced'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         if (tegra_pmc_core_domain_state_synced() && !tegra->sys_reboot_mode) {
         |             ^
   1 error generated.


vim +/tegra_pmc_core_domain_state_synced +62 drivers/soc/tegra/regulators-tegra20.c

496747e7d907b0 Dmitry Osipenko 2019-07-25  43  
496747e7d907b0 Dmitry Osipenko 2019-07-25  44  static int tegra20_core_limit(struct tegra_regulator_coupler *tegra,
496747e7d907b0 Dmitry Osipenko 2019-07-25  45  			      struct regulator_dev *core_rdev)
496747e7d907b0 Dmitry Osipenko 2019-07-25  46  {
496747e7d907b0 Dmitry Osipenko 2019-07-25  47  	int core_min_uV = 0;
496747e7d907b0 Dmitry Osipenko 2019-07-25  48  	int core_max_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  49  	int core_cur_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  50  	int err;
496747e7d907b0 Dmitry Osipenko 2019-07-25  51  
029f7e24a65df6 Dmitry Osipenko 2021-06-01  52  	/*
029f7e24a65df6 Dmitry Osipenko 2021-06-01  53  	 * Tegra20 SoC has critical DVFS-capable devices that are
029f7e24a65df6 Dmitry Osipenko 2021-06-01  54  	 * permanently-active or active at a boot time, like EMC
029f7e24a65df6 Dmitry Osipenko 2021-06-01  55  	 * (DRAM controller) or Display controller for example.
029f7e24a65df6 Dmitry Osipenko 2021-06-01  56  	 *
029f7e24a65df6 Dmitry Osipenko 2021-06-01  57  	 * The voltage of a CORE SoC power domain shall not be dropped below
029f7e24a65df6 Dmitry Osipenko 2021-06-01  58  	 * a minimum level, which is determined by device's clock rate.
029f7e24a65df6 Dmitry Osipenko 2021-06-01  59  	 * This means that we can't fully allow CORE voltage scaling until
029f7e24a65df6 Dmitry Osipenko 2021-06-01  60  	 * the state of all DVFS-critical CORE devices is synced.
029f7e24a65df6 Dmitry Osipenko 2021-06-01  61  	 */
029f7e24a65df6 Dmitry Osipenko 2021-06-01 @62  	if (tegra_pmc_core_domain_state_synced() && !tegra->sys_reboot_mode) {
029f7e24a65df6 Dmitry Osipenko 2021-06-01  63  		pr_info_once("voltage state synced\n");
029f7e24a65df6 Dmitry Osipenko 2021-06-01  64  		return 0;
029f7e24a65df6 Dmitry Osipenko 2021-06-01  65  	}
029f7e24a65df6 Dmitry Osipenko 2021-06-01  66  
496747e7d907b0 Dmitry Osipenko 2019-07-25  67  	if (tegra->core_min_uV > 0)
496747e7d907b0 Dmitry Osipenko 2019-07-25  68  		return tegra->core_min_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  69  
496747e7d907b0 Dmitry Osipenko 2019-07-25  70  	core_cur_uV = regulator_get_voltage_rdev(core_rdev);
496747e7d907b0 Dmitry Osipenko 2019-07-25  71  	if (core_cur_uV < 0)
496747e7d907b0 Dmitry Osipenko 2019-07-25  72  		return core_cur_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  73  
496747e7d907b0 Dmitry Osipenko 2019-07-25  74  	core_max_uV = max(core_cur_uV, 1200000);
496747e7d907b0 Dmitry Osipenko 2019-07-25  75  
496747e7d907b0 Dmitry Osipenko 2019-07-25  76  	err = regulator_check_voltage(core_rdev, &core_min_uV, &core_max_uV);
496747e7d907b0 Dmitry Osipenko 2019-07-25  77  	if (err)
496747e7d907b0 Dmitry Osipenko 2019-07-25  78  		return err;
496747e7d907b0 Dmitry Osipenko 2019-07-25  79  
496747e7d907b0 Dmitry Osipenko 2019-07-25  80  	/*
496747e7d907b0 Dmitry Osipenko 2019-07-25  81  	 * Limit minimum CORE voltage to a value left from bootloader or,
496747e7d907b0 Dmitry Osipenko 2019-07-25  82  	 * if it's unreasonably low value, to the most common 1.2v or to
496747e7d907b0 Dmitry Osipenko 2019-07-25  83  	 * whatever maximum value defined via board's device-tree.
496747e7d907b0 Dmitry Osipenko 2019-07-25  84  	 */
496747e7d907b0 Dmitry Osipenko 2019-07-25  85  	tegra->core_min_uV = core_max_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  86  
029f7e24a65df6 Dmitry Osipenko 2021-06-01  87  	pr_info("core voltage initialized to %duV\n", tegra->core_min_uV);
496747e7d907b0 Dmitry Osipenko 2019-07-25  88  
496747e7d907b0 Dmitry Osipenko 2019-07-25  89  	return tegra->core_min_uV;
496747e7d907b0 Dmitry Osipenko 2019-07-25  90  }
496747e7d907b0 Dmitry Osipenko 2019-07-25  91  

:::::: The code at line 62 was first introduced by commit
:::::: 029f7e24a65df641ac843cda8dabe359ff0826eb soc/tegra: regulators: Support core domain state syncing

:::::: TO: Dmitry Osipenko <digetx@gmail.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
