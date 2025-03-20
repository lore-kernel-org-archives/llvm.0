Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FDD2222C8;
	Thu, 20 Mar 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463812; cv=none; b=oELtUvlGK2E8rN1HdfkSRUxha/ZX8OMs5UGtEy7Jrw4nZRmJNEGTNePq14XugDVso2rZ+krc9l9KisauWcN0ttYDlKRxDTLfOn7lQ5L3g0eqtQkS08Mjflms5JVAqMOabPS3qdYOuz2sKHrUn7xvBeWXbPkeaI/4PxeVeFRWVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463812; c=relaxed/simple;
	bh=EdOJ3twPr6Z2UpdBc6QBNK4rAuEeVrbUsGUNyguuSyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATlG2JkFZzQ+6X5mZ867sF1d8CeWi27OeELC+iKRiUMpCosawQMGOF3HfrKvTQA1UrRSjrNhZOeKb7toX4znJiGO/qhdRl1+/oGtwyTG1O6stgEPol0TYZyhNBU94Jx5q1YtfmYAnkB5Nch1Nj4x4y3YCjUtQYZGtEjj1DBbyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PV6ACKzR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PV6ACKzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742463810; x=1773999810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdOJ3twPr6Z2UpdBc6QBNK4rAuEeVrbUsGUNyguuSyQ=;
  b=PV6ACKzR4Evd/E1YLGsBAt1T2WHILPzNizBI7YNrcGlPis/OHw5lS77h
   /8RC/T6Uwvq0vheghgAHMF5PS6TkZwid4JdD6PEyfbDp8YuhsgGe9TMk5
   4Bt3w8ftEZ+D9vs7hMVreDolAX1XudtZGpL+kfeX7nWqDe6D2aLZmVrtH
   mtD8mdBbHLDDjZBCKzaTSFhg2szqGMBG+o3OWD4O74nFllVj2ehIyHRXp
   YrMZbZmjU0HmmdDV0akE/eur50f9vyfuz5ZAspSwaRBPYiJ4fOQaJDDHS
   xdAb+ouXwQalgOu712TNqasv8SuKC9Xiq7QgmQCX+QVCele848zlW4BCr
   g==;
X-CSE-ConnectionGUID: FxyU7sJBRI6P8R1Nj3VN9w==
X-CSE-MsgGUID: e7mr4n2GSO6Wy0UB99FptQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43853208"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="43853208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 02:43:29 -0700
X-CSE-ConnectionGUID: 1Qo8oSQMRVK6lb5PBVlP+w==
X-CSE-MsgGUID: EW8B6IXoTiaU9QGCVOZP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123054308"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 02:43:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvCQw-0000Kd-1N;
	Thu, 20 Mar 2025 09:43:26 +0000
Date: Thu, 20 Mar 2025 17:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 42/42]
 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2328:2: error: use of
 undeclared identifier 'amdgpu_set_thermal_throttling_logging'; did you mean
 'amdgpu_get_thermal_throttling_logging'?
Message-ID: <202503201726.cqCSLFfk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   5a4379a0d448c61c5baf670bcc7f9041bc243b02
commit: 5a4379a0d448c61c5baf670bcc7f9041bc243b02 [42/42] drm/amd/pm: Remove unused amdgpu_set_thermal_throttling_logging() function
config: powerpc-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201726.cqCSLFfk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201726.cqCSLFfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201726.cqCSLFfk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2328:2: error: use of undeclared identifier 'amdgpu_set_thermal_throttling_logging'; did you mean 'amdgpu_get_thermal_throttling_logging'?
    2328 |         AMDGPU_DEVICE_ATTR_RW(thermal_throttling_logging,               ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
         |         ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:113:2: note: expanded from macro 'AMDGPU_DEVICE_ATTR_RW'
     113 |         AMDGPU_DEVICE_ATTR(_name, S_IRUGO | S_IWUSR,                    \
         |         ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:109:29: note: expanded from macro 'AMDGPU_DEVICE_ATTR'
     109 |                              amdgpu_get_##_name, amdgpu_set_##_name,    \
         |                                                  ^
   <scratch space>:20:1: note: expanded from here
      20 | amdgpu_set_thermal_throttling_logging
         | ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:1645:16: note: 'amdgpu_get_thermal_throttling_logging' declared here
    1645 | static ssize_t amdgpu_get_thermal_throttling_logging(struct device *dev,
         |                ^
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2328:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, const char *, size_t)' (aka 'int (*)(struct device *, struct device_attribute *, const char *, unsigned int)') with an expression of type 'ssize_t (struct device *, struct device_attribute *, char *)' (aka 'int (struct device *, struct device_attribute *, char *)') [-Wincompatible-function-pointer-types]
    2328 |         AMDGPU_DEVICE_ATTR_RW(thermal_throttling_logging,               ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:113:2: note: expanded from macro 'AMDGPU_DEVICE_ATTR_RW'
     113 |         AMDGPU_DEVICE_ATTR(_name, S_IRUGO | S_IWUSR,                    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                            _flags, ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:109:29: note: expanded from macro 'AMDGPU_DEVICE_ATTR'
     109 |                              amdgpu_get_##_name, amdgpu_set_##_name,    \
         |                                                  ^~~~~~~~~~~~~~~~~~
   <scratch space>:20:1: note: expanded from here
      20 | amdgpu_set_thermal_throttling_logging
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:102:44: note: expanded from macro '__AMDGPU_DEVICE_ATTR'
     102 |         { .dev_attr = __ATTR(_name, _mode, _show, _store),              \
         |                                                   ^~~~~~
   include/linux/sysfs.h:234:11: note: expanded from macro '__ATTR'
     234 |         .store  = _store,                                               \
         |                   ^~~~~~
   2 errors generated.


vim +2328 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c

4d154b1ca580fd drivers/gpu/drm/amd/pm/amdgpu_pm.c     Lijo Lazar      2024-02-21  2289  
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2290  static struct amdgpu_device_attr amdgpu_device_attrs[] = {
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2291  	AMDGPU_DEVICE_ATTR_RW(power_dpm_state,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
4215a11923362e drivers/gpu/drm/amd/pm/amdgpu_pm.c     Horace Chen     2021-02-25  2292  	AMDGPU_DEVICE_ATTR_RW(power_dpm_force_performance_level,	ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
7884d0e9e30e0b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Jiawei Gu       2021-08-04  2293  	AMDGPU_DEVICE_ATTR_RO(pp_num_states,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
7884d0e9e30e0b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Jiawei Gu       2021-08-04  2294  	AMDGPU_DEVICE_ATTR_RO(pp_cur_state,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
7884d0e9e30e0b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Jiawei Gu       2021-08-04  2295  	AMDGPU_DEVICE_ATTR_RW(pp_force_state,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
7884d0e9e30e0b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Jiawei Gu       2021-08-04  2296  	AMDGPU_DEVICE_ATTR_RW(pp_table,					ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2297  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_sclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2298  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2299  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_mclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2300  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2301  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_socclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2302  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2303  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_fclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2304  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2305  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_vclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2306  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2307  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_vclk1,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2308  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2309  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_dclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2310  			      .attr_update = pp_dpm_clk_default_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2311  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_dclk1,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2312  			      .attr_update = pp_dpm_clk_default_attr_update),
190145f6922265 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-03-04  2313  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_dcefclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
190145f6922265 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-03-04  2314  			      .attr_update = pp_dpm_dcefclk_attr_update),
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2315  	AMDGPU_DEVICE_ATTR_RW(pp_dpm_pcie,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF,
166a3c735c959d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-04-01  2316  			      .attr_update = pp_dpm_clk_default_attr_update),
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2317  	AMDGPU_DEVICE_ATTR_RW(pp_sclk_od,				ATTR_FLAG_BASIC),
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2318  	AMDGPU_DEVICE_ATTR_RW(pp_mclk_od,				ATTR_FLAG_BASIC),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2319  	AMDGPU_DEVICE_ATTR_RW(pp_power_profile_mode,			ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
98a936c395519d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-02-28  2320  	AMDGPU_DEVICE_ATTR_RW(pp_od_clk_voltage,			ATTR_FLAG_BASIC,
98a936c395519d drivers/gpu/drm/amd/pm/amdgpu_pm.c     Yang Wang       2024-02-28  2321  			      .attr_update = pp_od_clk_voltage_attr_update),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2322  	AMDGPU_DEVICE_ATTR_RO(gpu_busy_percent,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2323  	AMDGPU_DEVICE_ATTR_RO(mem_busy_percent,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
d1b2703cc28769 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Xiaojian Du     2024-03-08  2324  	AMDGPU_DEVICE_ATTR_RO(vcn_busy_percent,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2325  	AMDGPU_DEVICE_ATTR_RO(pcie_bw,					ATTR_FLAG_BASIC),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2326  	AMDGPU_DEVICE_ATTR_RW(pp_features,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2327  	AMDGPU_DEVICE_ATTR_RO(unique_id,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12 @2328  	AMDGPU_DEVICE_ATTR_RW(thermal_throttling_logging,		ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
c3ed0e72c87290 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Kun Liu         2023-02-21  2329  	AMDGPU_DEVICE_ATTR_RW(apu_thermal_cap,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
ac82902df9cf44 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Vignesh Chander 2021-10-12  2330  	AMDGPU_DEVICE_ATTR_RO(gpu_metrics,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
a7673a1c1acdd8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2331  	AMDGPU_DEVICE_ATTR_RO(smartshift_apu_power,			ATTR_FLAG_BASIC,
a7673a1c1acdd8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2332  			      .attr_update = ss_power_attr_update),
a7673a1c1acdd8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2333  	AMDGPU_DEVICE_ATTR_RO(smartshift_dgpu_power,			ATTR_FLAG_BASIC,
a7673a1c1acdd8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2334  			      .attr_update = ss_power_attr_update),
30d95a37f46d1b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2335  	AMDGPU_DEVICE_ATTR_RW(smartshift_bias,				ATTR_FLAG_BASIC,
30d95a37f46d1b drivers/gpu/drm/amd/pm/amdgpu_pm.c     Sathishkumar S  2021-05-30  2336  			      .attr_update = ss_bias_attr_update),
223aad1be34e11 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Lijo Lazar      2023-09-29  2337  	AMDGPU_DEVICE_ATTR_RO(pm_metrics,				ATTR_FLAG_BASIC,
223aad1be34e11 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Lijo Lazar      2023-09-29  2338  			      .attr_update = amdgpu_pm_metrics_attr_update),
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2339  };
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Kevin Wang      2020-04-27  2340  

:::::: The code at line 2328 was first introduced by commit
:::::: ac82902df9cf448a9400ec5bb1416100b157a6c4 drm/amd/pm: Enable GPU metrics for One VF mode

:::::: TO: Vignesh Chander <Vignesh.Chander@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
