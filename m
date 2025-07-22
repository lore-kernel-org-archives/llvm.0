Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C97273FD;
	Tue, 22 Jul 2025 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169609; cv=none; b=m3mZS4oGj/HAV4drLLQXuUZAmiOBGxuJUzJpKJk45K4X8guKlMjHWwa1wJ4kuFrSaOjRDa3T0Bi8w8LNIb+4R1GW8C+V2efyK7nRZgjOrFyH/BYcimY5VBjwv0dc4q2jmdVtgThTlECke0k29VVBeoBDQtEAPiO2RTcZNHWOHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169609; c=relaxed/simple;
	bh=RcxbdR3mRzMw5wQBex6QNl7sDdRiksAJfuo7rKyTFhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lN4/3czYchTkyhsW9ojHJSlce9xnlBBtoyXAs1mgNBEsgC6MmKVtix5tiSPJ4tDNdP4Q3jBfeTtnuxDVMv8BgPGNOuCfxH5ynnt1G3eoXZ0xwTAe16zJpCTahFqUlF0k6uW8a2jLd6bwCMsFTby9BDjE+nx6Pr0oFZ/VxR13SNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNADBnrT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNADBnrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753169607; x=1784705607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RcxbdR3mRzMw5wQBex6QNl7sDdRiksAJfuo7rKyTFhQ=;
  b=CNADBnrTXdeB8YiVbYLw+iyZtzG0hDIr8S7Fk4UolU0CZiUT4yFwNIg9
   SfSOLpCCuaHmuH5W28Y/QCZkXgCF3yzmD9eM/EP88m1pezNfBnsMC8yD9
   KiNR2lj6aKr7HHJvmbnsuFDVkQm3sNMOw9mNsBFzUrYPu18Yjimdw8l96
   w16TluXBA60K6GdA4Io+xlpykpdt2WVq6kCF/x/5WG2feaN9sq/MyhsbL
   YDbl/1ozROqBHSoBFFIuld8HI96nYIpVU6WV5aRQF9+U9EzuSsVWvXCMA
   3S3M7UBy8nmVpjTmIBBEWcZH4IggLTGDrMZxWUxB70erlZSgzCGsPYwRD
   g==;
X-CSE-ConnectionGUID: PvrX/yY9Sr+BPkrBkExwZg==
X-CSE-MsgGUID: j2CkU6FuTkqiIXV+jIo9lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66092174"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="66092174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 00:33:27 -0700
X-CSE-ConnectionGUID: LhoWxFErS92t+UsmyjRvNg==
X-CSE-MsgGUID: cj3mUnYLTp2q5TkXRgKLfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="158841650"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jul 2025 00:33:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue7V5-000HZD-01;
	Tue, 22 Jul 2025 07:33:23 +0000
Date: Tue, 22 Jul 2025 15:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 18/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning
 (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202507221531.Afuzv1T3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: 1933aeb9738c3ef10a62c3f9da64e4bd76afcf8c [18/44] ODROID-N2: arm64/dts: update device tree after v5.13
config: arm64-randconfig-002-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221531.Afuzv1T3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221531.Afuzv1T3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221531.Afuzv1T3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +154 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi

   151	
   152	&cpu_thermal {
   153		trips {
 > 154			fan_0: trip-point@0 {
   155				temperature = <65000>;
   156				hysteresis = <5000>;
   157				type = "active";
   158			};
   159			fan_1: trip-point@1 {
   160				temperature = <75000>;
   161				hysteresis = <5000>;
   162				type = "active";
   163			};
   164		};
   165		cooling-maps {
   166			fan_cooling_map0 {
   167				trip = <&fan_0>;
   168				cooling-device = <&pwmfan THERMAL_NO_LIMIT 2>;
   169			};
   170			fan_cooling_map1 {
   171				trip = <&fan_1>;
   172				cooling-device = <&pwmfan 2 THERMAL_NO_LIMIT>;
   173			};
   174		};
   175	};
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
