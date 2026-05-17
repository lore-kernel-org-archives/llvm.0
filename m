Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3F3161A2;
	Sun, 17 May 2026 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778988559; cv=none; b=m7S6n1ZsiH5FK9LW6iqibtLwFbuLgfTYOLvpM9j+SPioY3VEb9plSTsZDqdGtUDjtoYj0wxflvMJMeicJb4NVnzQJJbN86lRCgmozmKtMiFM3Lpy0cK6yEq5eqxHfYFr0pf0shb2ob85tBzVYNHyqSrHj8SL65Uh+O+FhtAFwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778988559; c=relaxed/simple;
	bh=W3hxyvPQIHp6N/EcjsueATTuNczPa4vrB3d34Qz9f4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D07jEnGPDAWLAhjUSyiqbEwfNvCEbu+k8GWZQfKm4qZ+H6WbB10X+NH3jvlz5BY5RXohppG1GLBo8dh65GVVZr+EL07HwnpJjPNv/vBP2k1sJbcURsmatmRVr6Jpnd3UL7kY2OQgmePcYPMDvWyQYce18r294C5o9+1oauhQBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQQV2+PA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQQV2+PA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778988557; x=1810524557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W3hxyvPQIHp6N/EcjsueATTuNczPa4vrB3d34Qz9f4g=;
  b=CQQV2+PA2Ldx8AV/38ats4JV/kAxm6KcBP6OG4iqZr4oNGl+/wn0CHei
   xIPWoOaAUJvSssRLDLcCBVRYSCdkdifQU+zUvGLI2e8U5FBVe6rjscR20
   yiBRvKdfC31NBt4xwTrFR8sLFT78rxzWPNj7+JPulLUaXLzYXQnNY75d9
   7HJLAqH6EFBslI4Ei4qxaDPzZCXDj+PyzRj0OeiU8nQcWO1soghUKcfKM
   vGELglZntIjx1dnwjL1lBkxP1RoOtVp9V9TZkwwLMxQP5OuVYQvG9jAyI
   xsYGcQhaTrKInxttYppLxtv3Bjb3r0s0maST54yg/GJOwN3fz1R49uoVW
   Q==;
X-CSE-ConnectionGUID: XASoxHkqRiGFJQ28kG8QdA==
X-CSE-MsgGUID: yWmpyCBLRruk3YXmxCjx5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90583156"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90583156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 20:29:14 -0700
X-CSE-ConnectionGUID: hI1MqPDSRMqXqMwfZi0H0A==
X-CSE-MsgGUID: 4UbGB/DXS5WdSw+SZJgpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="243075114"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2026 20:29:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOSBh-000000001KU-4664;
	Sun, 17 May 2026 03:29:09 +0000
Date: Sun, 17 May 2026 11:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gilles Risch <gilles.risch@gmail.com>, alexander.deucher@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Gilles Risch <gilles.risch@gmail.com>
Subject: Re: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 /
 DCE3.1 systems
Message-ID: <202605171126.1g7CRkTZ-lkp@intel.com>
References: <20260516185226.3005-1-gilles.risch@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516185226.3005-1-gilles.risch@gmail.com>

Hi Gilles,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gilles-Risch/drm-radeon-fix-eDP-resume-from-suspend-on-iMac11-1-DCE3-1-systems/20260517-025343
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260516185226.3005-1-gilles.risch%40gmail.com
patch subject: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 / DCE3.1 systems
config: riscv-randconfig-001-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171126.1g7CRkTZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171126.1g7CRkTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171126.1g7CRkTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/atombios_encoders.c:1386:7: error: call to undeclared function 'ASIC_IS_DCE31'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1386 |         if (!ASIC_IS_DCE31(rdev))
         |              ^
   drivers/gpu/drm/radeon/atombios_encoders.c:1710:30: error: call to undeclared function 'ASIC_IS_DCE31'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1710 |                         if (ASIC_IS_DCE4(rdev) || ASIC_IS_DCE31(rdev))
         |                                                   ^
   drivers/gpu/drm/radeon/atombios_encoders.c:1727:29: error: call to undeclared function 'ASIC_IS_DCE31'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1727 |                 if (ASIC_IS_DCE4(rdev) || ASIC_IS_DCE31(rdev)) {
         |                                           ^
   3 errors generated.


vim +/ASIC_IS_DCE31 +1386 drivers/gpu/drm/radeon/atombios_encoders.c

  1372	
  1373	bool
  1374	atombios_set_edp_panel_power(struct drm_connector *connector, int action)
  1375	{
  1376		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
  1377		struct drm_device *dev = radeon_connector->base.dev;
  1378		struct radeon_device *rdev = dev->dev_private;
  1379		union dig_transmitter_control args;
  1380		int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
  1381		uint8_t frev, crev;
  1382	
  1383		if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
  1384			goto done;
  1385	
> 1386		if (!ASIC_IS_DCE31(rdev))
  1387			goto done;
  1388	
  1389		if ((action != ATOM_TRANSMITTER_ACTION_POWER_ON) &&
  1390		    (action != ATOM_TRANSMITTER_ACTION_POWER_OFF))
  1391			goto done;
  1392	
  1393		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
  1394			goto done;
  1395	
  1396		memset(&args, 0, sizeof(args));
  1397	
  1398		args.v1.ucAction = action;
  1399	
  1400		atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
  1401	
  1402		/* wait for the panel to power up */
  1403		if (action == ATOM_TRANSMITTER_ACTION_POWER_ON) {
  1404			int i;
  1405	
  1406			for (i = 0; i < 300; i++) {
  1407				if (radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
  1408					return true;
  1409				mdelay(1);
  1410			}
  1411			return false;
  1412		}
  1413	done:
  1414		return true;
  1415	}
  1416	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
