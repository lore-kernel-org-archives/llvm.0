Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B33C0608;
	Thu,  7 May 2026 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146058; cv=none; b=HQcohAfi2FD+xxF09/SWGR70wkagZEggfKUV0OYO+6zhzGNbX1scR8KxH/FJbqp8YTuwbGdW1Yj1Gi1aFBfc12LoWWu4goRrZb0PqIGSjJnfRigIK+IO1LH1uj82v3bKv5TxiSrrlbdVt/oJ4Hri5hJ2mL+qcttmuQCi4sex7+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146058; c=relaxed/simple;
	bh=rBDPVJn7fvud4Bhke6c89l8oaEf1xBlJyu0BbNGxnN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLF478gpVDoYwlR/R4NV0KVvkTckcYp03wxDS361NotpFPGnAnpBJtyv8rgYT87xR32tZb6Fafll9PMrFrLMbZqV72sFSQLyB5wN9Y48UH2U2RmFpLdHJw9ETw3U/sEzLNnr8qMrVhnxqCis9oZuWqg3Xbn184OMMuGKyaVTKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ+sTKX7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ+sTKX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146056; x=1809682056;
  h=date:from:to:cc:subject:message-id;
  bh=rBDPVJn7fvud4Bhke6c89l8oaEf1xBlJyu0BbNGxnN4=;
  b=MQ+sTKX7Yw2uM0RaNQ1Atekxin8BHpYpx5CBQ7pVNVosYsWQGSCKsKml
   8yxUV4TMN9b2sC3iAp3Vz0AveTN5jvc1F8erbGppfsSCNtWADinRzMGWg
   /Lk+ObVqmSc+TloVHYrzvaSy88L8C85xpQa+hutnrF2of363+uGMgtZGs
   7J4WF9UN3STiTbj/m2Nn1qv9kf/zqgC1V7bhDFLuXZcGyXR4LQt+C/iqs
   Bb3F1yUmmRumKROgw7n8YxjsTMymENL6WKLXYMu3ne66xCgAkbQwgDhUx
   XFmF47smLQF8c35h4//bslLaUoE9W2KKGjtWjW5SSosMEO+XwnCy0s3VP
   Q==;
X-CSE-ConnectionGUID: ynMhstIaRA2Q+brxy6Difg==
X-CSE-MsgGUID: fw7PfY0CTaK7ussGgk+IlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81660301"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="81660301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:27:36 -0700
X-CSE-ConnectionGUID: jVNzUbBkTlWM+Vf8Vjce+Q==
X-CSE-MsgGUID: 0+PPw8QjSG2d8tju4i71qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233751467"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 02:27:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKv12-000000006o9-13j9;
	Thu, 07 May 2026 09:27:32 +0000
Date: Thu, 07 May 2026 11:27:26 +0200
From: kernel test robot <lkp@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_dmc.c:1645:7: warning:
 variable 'dc5_reg' is used uninitialized whenever 'if' condition is true
Message-ID: <202605071107.lcMzioxk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dibin-Moolakadan-Subrahmanian/drm-i915-display-Remove-TGL-DC3CO-support/20260426-004905
head:   ba05ae3086419af671775cfaf2536b5aa1585c7e
commit: ba05ae3086419af671775cfaf2536b5aa1585c7e drm/i915/display: Add DC3CO count and residency in dmc debugfs
date:   12 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260507/202605071107.lcMzioxk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071107.lcMzioxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071107.lcMzioxk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dmc.c:1645:7: warning: variable 'dc5_reg' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1645 |                 if (DISPLAY_VER(display) >= 35) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_device.h:244:33: note: expanded from macro 'DISPLAY_VER'
     244 | #define DISPLAY_VER(__display)          (DISPLAY_RUNTIME_INFO(__display)->ip.ver)
         |                                         ^
   drivers/gpu/drm/i915/display/intel_dmc.c:1665:65: note: uninitialized use occurs here
    1665 |         seq_printf(m, "DC3 -> DC5 count: %d\n", intel_de_read(display, dc5_reg));
         |                                                                        ^~~~~~~
   drivers/gpu/drm/i915/display/intel_dmc.c:1645:3: note: remove the 'if' if its condition is always false
    1645 |                 if (DISPLAY_VER(display) >= 35) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1646 |                         seq_printf(m, "DC3CO count: %d\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1647 |                                    intel_de_read(display, XE3P_DMC_DC3CO_COUNT));
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1648 | 
    1649 |                         seq_printf(m, "DC3CO residency: %d\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1650 |                                    intel_de_read(display, DC_STATE_DC3CO_RESIDENCY));
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1651 |                 } else if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
         |                 ~~~~~~
   drivers/gpu/drm/i915/display/intel_dmc.c:1616:2: note: variable 'dc5_reg' is declared here
    1616 |         i915_reg_t dc5_reg, dc6_reg = INVALID_MMIO_REG;
         |         ^
   1 warning generated.


vim +1645 drivers/gpu/drm/i915/display/intel_dmc.c

  1610	
  1611	static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
  1612	{
  1613		struct intel_display *display = m->private;
  1614		struct intel_dmc *dmc = display_to_dmc(display);
  1615		struct ref_tracker *wakeref;
  1616		i915_reg_t dc5_reg, dc6_reg = INVALID_MMIO_REG;
  1617		u32 dc6_allowed_count;
  1618	
  1619		if (!HAS_DMC(display))
  1620			return -ENODEV;
  1621	
  1622		wakeref = intel_display_rpm_get(display);
  1623	
  1624		seq_printf(m, "DMC initialized: %s\n", str_yes_no(dmc));
  1625		seq_printf(m, "fw loaded: %s\n",
  1626			   str_yes_no(intel_dmc_has_payload(display)));
  1627		seq_printf(m, "path: %s\n", dmc ? dmc->fw_path : "N/A");
  1628		seq_printf(m, "Pipe A fw needed: %s\n",
  1629			   str_yes_no(DISPLAY_VER(display) >= 12));
  1630		seq_printf(m, "Pipe A fw loaded: %s\n",
  1631			   str_yes_no(has_dmc_id_fw(display, DMC_FW_PIPEA)));
  1632		seq_printf(m, "Pipe B fw needed: %s\n",
  1633			   str_yes_no(display->platform.alderlake_p ||
  1634				      DISPLAY_VER(display) >= 14));
  1635		seq_printf(m, "Pipe B fw loaded: %s\n",
  1636			   str_yes_no(has_dmc_id_fw(display, DMC_FW_PIPEB)));
  1637	
  1638		if (!intel_dmc_has_payload(display))
  1639			goto out;
  1640	
  1641		seq_printf(m, "version: %d.%d\n", DMC_VERSION_MAJOR(dmc->version),
  1642			   DMC_VERSION_MINOR(dmc->version));
  1643	
  1644		if (DISPLAY_VER(display) >= 12) {
> 1645			if (DISPLAY_VER(display) >= 35) {
  1646				seq_printf(m, "DC3CO count: %d\n",
  1647					   intel_de_read(display, XE3P_DMC_DC3CO_COUNT));
  1648	
  1649				seq_printf(m, "DC3CO residency: %d\n",
  1650					   intel_de_read(display, DC_STATE_DC3CO_RESIDENCY));
  1651			} else if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
  1652				dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
  1653			} else {
  1654				dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
  1655				dc6_reg = TGL_DMC_DEBUG_DC6_COUNT;
  1656			}
  1657	
  1658		} else {
  1659			dc5_reg = display->platform.broxton ? BXT_DMC_DC3_DC5_COUNT :
  1660				SKL_DMC_DC3_DC5_COUNT;
  1661			if (!display->platform.geminilake && !display->platform.broxton)
  1662				dc6_reg = SKL_DMC_DC5_DC6_COUNT;
  1663		}
  1664	
  1665		seq_printf(m, "DC3 -> DC5 count: %d\n", intel_de_read(display, dc5_reg));
  1666	
  1667		if (intel_dmc_get_dc6_allowed_count(display, &dc6_allowed_count))
  1668			seq_printf(m, "DC5 -> DC6 allowed count: %d\n",
  1669				   dc6_allowed_count);
  1670		else if (i915_mmio_reg_valid(dc6_reg))
  1671			seq_printf(m, "DC5 -> DC6 count: %d\n",
  1672				   intel_de_read(display, dc6_reg));
  1673	
  1674		seq_printf(m, "program base: 0x%08x\n",
  1675			   intel_de_read(display, DMC_PROGRAM(dmc->dmc_info[DMC_FW_MAIN].start_mmioaddr, 0)));
  1676	
  1677	out:
  1678		seq_printf(m, "ssp base: 0x%08x\n",
  1679			   intel_de_read(display, DMC_SSP_BASE));
  1680		seq_printf(m, "htp: 0x%08x\n", intel_de_read(display, DMC_HTP_SKL));
  1681	
  1682		intel_display_rpm_put(display, wakeref);
  1683	
  1684		return 0;
  1685	}
  1686	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
