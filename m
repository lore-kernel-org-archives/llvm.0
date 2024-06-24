Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED14C97;
	Mon, 24 Jun 2024 03:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719199205; cv=none; b=NtSZT8+JPEGBI5al4PJW0xVoXbWuU4jUfpSULl5OWULYW1j7QdYyQ+HHKewuemi6pVhv0+xZCZyzgJGLkbUBilXy/a8vtm38x6s2xuOQg8pBpqRM2ZRFUH0c6Ou/miAUy3U4WYwM9KO89dHMZMoj3ECMLDXuVf/C7Rh/2Z0vVf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719199205; c=relaxed/simple;
	bh=194HX5rrPNrxvhf37vkjNB1FHYr+j/Ug9+zvy+CVbMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s93zItkd+JgqkZq9trvSo7Eff2vFTkIqiTGiiztKHihjjSDUVDq5UqX2CLAumW2ROl4W7NgexfljQUPPTluuV1ggDIv+5JLiUTZ5fsgW5kQRPXgvcROBwBBZ8yHPngBzi3mSPlEBQoZ4YkQjVADKqK2CXtJWuJcaxOmIIYxRT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGsHk23W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGsHk23W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719199201; x=1750735201;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=194HX5rrPNrxvhf37vkjNB1FHYr+j/Ug9+zvy+CVbMY=;
  b=dGsHk23Wo05VybsdnM/cC159HxJR+xEGVsLYS74L87Q1T4LW5otfEf81
   huFDefKTnoWpWI+JwhGgrsVe5V1787EC76+uWIdzZwf2RfqKtA3JB2/Zu
   pbBdkyAOsq53nFYH+YLkH45ASIOQodYjmKE3NOwnmxqE6p8QI4MGP3PsB
   Gy4XoRyAR9iW1JqRskcZwIaBUfLuRJvBfNpHDhdXNH8bOCev2TEtPUI5k
   gZE+VxeIv2rruKKMd2EkPLiGkoA+XPj73BNCfYQx/l4XRqNTyxJKpI6pS
   NuKs8d8B6OcmqlK4aUWTxTPU9vdmbufgSgSQKbry640vCyIt6E/UQk7iv
   Q==;
X-CSE-ConnectionGUID: aDRC+UcPQrmXUR/1kiTWBg==
X-CSE-MsgGUID: D23Phe2sRvir/KT5Nou6Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16292268"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="16292268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 20:20:00 -0700
X-CSE-ConnectionGUID: 5HFR4ib5QWqA2hfsGt9l+Q==
X-CSE-MsgGUID: eOimoSH0QOSZWkB0JTotBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="74375486"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2024 20:19:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLaFG-000C2c-39;
	Mon, 24 Jun 2024 03:19:54 +0000
Date: Mon, 24 Jun 2024 11:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 57/59] arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:654.27-657.6: Warning
 (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate
 unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
Message-ID: <202406241121.38zewsl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   e01f0003605a02890ad6487eecd38b0957718beb
commit: 78de7358aa7afe162293ba0458e0a11f2f462ab9 [57/59] ARM: dts: qcom: use generic node names for Adreno and QFPROM
config: arm-randconfig-001-20240624 (https://download.01.org/0day-ci/archive/20240624/202406241121.38zewsl1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406241121.38zewsl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406241121.38zewsl1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:488.28-499.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:950.28-1001.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:654.27-657.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:689.27-692.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:937.11-947.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1957.28-2008.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:950.28-1001.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:654.27-657.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:689.27-692.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:937.11-947.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1957.28-2008.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:92.9-95.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:264.26-267.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:279.26-282.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:299.26-302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:309.26-312.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:334.26-337.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:359.26-362.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:379.40-382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:389.40-392.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:424.41-427.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:439.41-442.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:464.41-467.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:489.41-492.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:488.28-499.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:950.28-1001.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:654.27-657.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:689.27-692.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:937.11-947.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1957.28-2008.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1957.28-2008.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2028.28-2079.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1254.26-1257.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1269.26-1272.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1289.26-1292.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1299.26-1302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10_p1@d8)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1324.26-1327.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1349.26-1352.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1369.40-1372.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode_backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1379.40-1382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2_backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1414.41-1417.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1_backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1429.41-1432.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1_backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1454.41-1457.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1_backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1479.41-1482.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2_backup@44c)

vim +654 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi

8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   15  
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   16  / {
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   17  	#address-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   18  	#size-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   19  	interrupt-parent = <&intc>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   20  
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   21  	chosen { };
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18   22  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   23  	clocks {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   24  		xo_board: xo_board {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   25  			compatible = "fixed-clock";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   26  			#clock-cells = <0>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   27  			clock-frequency = <19200000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   28  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   29  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   30  		sleep_clk: sleep_clk {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   31  			compatible = "fixed-clock";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   32  			#clock-cells = <0>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   33  			clock-frequency = <32768>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   34  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   35  	};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   36  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   37  	cpus {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   38  		#address-cells = <1>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   39  		#size-cells = <0>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   40  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   41  		CPU0: cpu@0 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   42  			compatible = "arm,cortex-a7";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   43  			enable-method = "qcom,msm8226-smp";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   44  			device_type = "cpu";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   45  			reg = <0>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   46  			next-level-cache = <&L2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   47  			qcom,acc = <&acc0>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   48  			qcom,saw = <&saw0>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   49  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   50  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   51  		CPU1: cpu@1 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   52  			compatible = "arm,cortex-a7";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   53  			enable-method = "qcom,msm8226-smp";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   54  			device_type = "cpu";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   55  			reg = <1>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   56  			next-level-cache = <&L2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   57  			qcom,acc = <&acc1>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   58  			qcom,saw = <&saw1>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   59  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   60  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   61  		CPU2: cpu@2 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   62  			compatible = "arm,cortex-a7";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   63  			enable-method = "qcom,msm8226-smp";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   64  			device_type = "cpu";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   65  			reg = <2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   66  			next-level-cache = <&L2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   67  			qcom,acc = <&acc2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   68  			qcom,saw = <&saw2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   69  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   70  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   71  		CPU3: cpu@3 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   72  			compatible = "arm,cortex-a7";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   73  			enable-method = "qcom,msm8226-smp";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   74  			device_type = "cpu";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   75  			reg = <3>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   76  			next-level-cache = <&L2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   77  			qcom,acc = <&acc3>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   78  			qcom,saw = <&saw3>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   79  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   80  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   81  		L2: l2-cache {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   82  			compatible = "cache";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   83  			cache-level = <2>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   84  			cache-unified;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   85  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   86  	};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10   87  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   88  	firmware {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   89  		scm {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   90  			compatible = "qcom,scm-msm8226", "qcom,scm";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   91  			clocks = <&gcc GCC_CE1_CLK>, <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   92  			clock-names = "core", "bus", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   93  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   94  	};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12   95  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10   96  	memory@0 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10   97  		device_type = "memory";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10   98  		reg = <0x0 0x0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10   99  	};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  100  
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  101  	pmu {
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  102  		compatible = "arm,cortex-a7-pmu";
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  103  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  104  					 IRQ_TYPE_LEVEL_HIGH)>;
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  105  	};
38cd0f2d86f1dbf arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-20  106  
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  107  	rpm: remoteproc {
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  108  		compatible = "qcom,msm8226-rpm-proc", "qcom,rpm-proc";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  109  
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  110  		master-stats {
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  111  			compatible = "qcom,rpm-master-stats";
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  112  			qcom,rpm-msg-ram = <&apss_master_stats>,
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  113  					   <&mpss_master_stats>,
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  114  					   <&lpss_master_stats>,
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  115  					   <&pronto_master_stats>;
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  116  			qcom,master-names = "APSS",
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  117  					    "MPSS",
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  118  					    "LPSS",
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  119  					    "PRONTO";
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  120  		};
bd837be0ff38792 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2023-09-22  121  
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  122  		smd-edge {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  123  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  124  			qcom,ipc = <&apcs 8 0>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  125  			qcom,smd-edge = <15>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  126  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  127  			rpm_requests: rpm-requests {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  128  				compatible = "qcom,rpm-msm8226";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  129  				qcom,smd-channels = "rpm_requests";
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  130  
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  131  				rpmcc: clock-controller {
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  132  					compatible = "qcom,rpmcc-msm8226", "qcom,rpmcc";
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  133  					#clock-cells = <1>;
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  134  					clocks = <&xo_board>;
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  135  					clock-names = "xo";
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  136  				};
34d50b12d677954 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-18  137  
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  138  				rpmpd: power-controller {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  139  					compatible = "qcom,msm8226-rpmpd";
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  140  					#power-domain-cells = <1>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  141  					operating-points-v2 = <&rpmpd_opp_table>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  142  
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  143  					rpmpd_opp_table: opp-table {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  144  						compatible = "operating-points-v2";
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  145  
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  146  						rpmpd_opp_ret: opp1 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  147  							opp-level = <1>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  148  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  149  						rpmpd_opp_svs_krait: opp2 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  150  							opp-level = <2>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  151  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  152  						rpmpd_opp_svs_soc: opp3 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  153  							opp-level = <3>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  154  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  155  						rpmpd_opp_nom: opp4 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  156  							opp-level = <4>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  157  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  158  						rpmpd_opp_turbo: opp5 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  159  							opp-level = <5>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  160  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  161  						rpmpd_opp_super_turbo: opp6 {
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  162  							opp-level = <6>;
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  163  						};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  164  					};
13455362518773b arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-20  165  				};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  166  			};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  167  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  168  	};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  169  
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  170  	reserved-memory {
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  171  		#address-cells = <1>;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  172  		#size-cells = <1>;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  173  		ranges;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  174  
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  175  		smem_region: smem@3000000 {
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  176  			reg = <0x3000000 0x100000>;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  177  			no-map;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  178  		};
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  179  
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  180  		adsp_region: adsp@dc00000 {
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  181  			reg = <0x0dc00000 0x1900000>;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  182  			no-map;
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  183  		};
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  184  	};
b471a1bc797429f arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Stephan Gerhold     2023-06-15  185  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  186  	smem {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  187  		compatible = "qcom,smem";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  188  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  189  		memory-region = <&smem_region>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  190  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  191  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  192  		hwlocks = <&tcsr_mutex 3>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  193  	};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  194  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  195  	smp2p-adsp {
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  196  		compatible = "qcom,smp2p";
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  197  		qcom,smem = <443>, <429>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  198  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  199  		interrupt-parent = <&intc>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  200  		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  201  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  202  		qcom,ipc = <&apcs 8 10>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  203  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  204  		qcom,local-pid = <0>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  205  		qcom,remote-pid = <2>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  206  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  207  		adsp_smp2p_out: master-kernel {
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  208  			qcom,entry-name = "master-kernel";
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  209  			#qcom,smem-state-cells = <1>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  210  		};
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  211  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  212  		adsp_smp2p_in: slave-kernel {
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  213  			qcom,entry-name = "slave-kernel";
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  214  
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  215  			interrupt-controller;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  216  			#interrupt-cells = <2>;
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  217  		};
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  218  	};
25ba74dd60022f2 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-04-23  219  
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  220  	soc: soc {
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  221  		compatible = "simple-bus";
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  222  		#address-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  223  		#size-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  224  		ranges;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  225  
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  226  		intc: interrupt-controller@f9000000 {
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  227  			compatible = "qcom,msm-qgic2";
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  228  			reg = <0xf9000000 0x1000>,
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  229  			      <0xf9002000 0x1000>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  230  			interrupt-controller;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  231  			#interrupt-cells = <3>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  232  		};
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  233  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  234  		apcs: syscon@f9011000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  235  			compatible = "syscon";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  236  			reg = <0xf9011000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  237  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  238  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  239  		saw_l2: power-manager@f9012000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  240  			compatible = "qcom,msm8226-saw2-v2.1-l2", "qcom,saw2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  241  			reg = <0xf9012000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  242  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  243  
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  244  		watchdog@f9017000 {
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  245  			compatible = "qcom,apss-wdt-msm8226", "qcom,kpss-wdt";
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  246  			reg = <0xf9017000 0x1000>;
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  247  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  248  				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  249  			clocks = <&sleep_clk>;
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  250  		};
9e9c906ede3b7dc arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-14  251  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  252  		timer@f9020000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  253  			compatible = "arm,armv7-timer-mem";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  254  			reg = <0xf9020000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  255  			#address-cells = <1>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  256  			#size-cells = <1>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  257  			ranges;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  258  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  259  			frame@f9021000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  260  				frame-number = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  261  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  262  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  263  				reg = <0xf9021000 0x1000>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  264  				      <0xf9022000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  265  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  266  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  267  			frame@f9023000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  268  				frame-number = <1>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  269  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  270  				reg = <0xf9023000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  271  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  272  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  273  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  274  			frame@f9024000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  275  				frame-number = <2>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  276  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  277  				reg = <0xf9024000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  278  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  279  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  280  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  281  			frame@f9025000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  282  				frame-number = <3>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  283  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  284  				reg = <0xf9025000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  285  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  286  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  287  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  288  			frame@f9026000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  289  				frame-number = <4>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  290  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  291  				reg = <0xf9026000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  292  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  293  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  294  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  295  			frame@f9027000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  296  				frame-number = <5>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  297  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  298  				reg = <0xf9027000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  299  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  300  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  301  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  302  			frame@f9028000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  303  				frame-number = <6>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  304  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  305  				reg = <0xf9028000 0x1000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  306  				status = "disabled";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  307  			};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  308  		};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  309  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  310  		acc0: power-manager@f9088000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  311  			compatible = "qcom,kpss-acc-v2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  312  			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  313  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  314  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  315  		saw0: power-manager@f9089000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  316  			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  317  			reg = <0xf9089000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  318  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  319  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  320  		acc1: power-manager@f9098000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  321  			compatible = "qcom,kpss-acc-v2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  322  			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  323  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  324  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  325  		saw1: power-manager@f9099000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  326  			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  327  			reg = <0xf9099000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  328  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  329  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  330  		acc2: power-manager@f90a8000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  331  			compatible = "qcom,kpss-acc-v2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  332  			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  333  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  334  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  335  		saw2: power-manager@f90a9000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  336  			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  337  			reg = <0xf90a9000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  338  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  339  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  340  		acc3: power-manager@f90b8000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  341  			compatible = "qcom,kpss-acc-v2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  342  			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  343  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  344  
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  345  		saw3: power-manager@f90b9000 {
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  346  			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  347  			reg = <0xf90b9000 0x1000>;
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  348  		};
74851b7f180a053 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Ivaylo Ivanov       2024-02-10  349  
2477d81901a23ad arch/arm/boot/dts/qcom-msm8226.dtsi      Bhupesh Sharma      2022-05-15  350  		sdhc_1: mmc@f9824900 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  351  			compatible = "qcom,msm8226-sdhci", "qcom,sdhci-msm-v4";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  352  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
5eb82ddb7273bd3 arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  353  			reg-names = "hc", "core";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  354  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  355  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  356  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2e arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  357  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
49c19337d0aca2e arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  358  				 <&gcc GCC_SDCC1_APPS_CLK>,
e280427384269fb arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2023-05-09  359  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
49c19337d0aca2e arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  360  			clock-names = "iface", "core", "xo";
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  361  			pinctrl-names = "default";
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  362  			pinctrl-0 = <&sdhc1_default_state>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  363  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  364  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  365  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  366  		sdhc_3: mmc@f9864900 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  367  			compatible = "qcom,msm8226-sdhci", "qcom,sdhci-msm-v4";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  368  			reg = <0xf9864900 0x11c>, <0xf9864000 0x800>;
5eb82ddb7273bd3 arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  369  			reg-names = "hc", "core";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  370  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  371  				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  372  			interrupt-names = "hc_irq", "pwr_irq";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  373  			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  374  				 <&gcc GCC_SDCC3_APPS_CLK>,
e280427384269fb arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2023-05-09  375  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
49c19337d0aca2e arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  376  			clock-names = "iface", "core", "xo";
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  377  			pinctrl-names = "default";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  378  			pinctrl-0 = <&sdhc3_default_state>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  379  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  380  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  381  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  382  		sdhc_2: mmc@f98a4900 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  383  			compatible = "qcom,msm8226-sdhci", "qcom,sdhci-msm-v4";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  384  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
5eb82ddb7273bd3 arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  385  			reg-names = "hc", "core";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  386  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  387  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  388  			interrupt-names = "hc_irq", "pwr_irq";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  389  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  390  				 <&gcc GCC_SDCC2_APPS_CLK>,
e280427384269fb arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2023-05-09  391  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
49c19337d0aca2e arch/arm/boot/dts/qcom-msm8226.dtsi      Krzysztof Kozlowski 2022-07-12  392  			clock-names = "iface", "core", "xo";
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  393  			pinctrl-names = "default";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  394  			pinctrl-0 = <&sdhc2_default_state>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  395  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  396  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  397  
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  398  		blsp1_uart1: serial@f991d000 {
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  399  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  400  			reg = <0xf991d000 0x1000>;
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  401  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  402  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  403  			clock-names = "core", "iface";
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  404  			status = "disabled";
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  405  		};
d3236c598e08ba1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-26  406  
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  407  		blsp1_uart2: serial@f991e000 {
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  408  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  409  			reg = <0xf991e000 0x1000>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  410  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  411  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  412  				 <&gcc GCC_BLSP1_AHB_CLK>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  413  			clock-names = "core",
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  414  				      "iface";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  415  			status = "disabled";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  416  		};
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  417  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  418  		blsp1_uart3: serial@f991f000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  419  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  420  			reg = <0xf991f000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  421  			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  422  			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  423  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  424  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  425  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  426  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  427  		blsp1_uart4: serial@f9920000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  428  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  429  			reg = <0xf9920000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  430  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  431  			clocks = <&gcc GCC_BLSP1_UART4_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  432  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  433  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  434  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  435  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  436  		blsp1_i2c1: i2c@f9923000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  437  			compatible = "qcom,i2c-qup-v2.1.1";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  438  			reg = <0xf9923000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  439  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  440  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  441  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  442  			pinctrl-names = "default";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  443  			pinctrl-0 = <&blsp1_i2c1_pins>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  444  			#address-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  445  			#size-cells = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  446  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  447  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  448  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  449  		blsp1_i2c2: i2c@f9924000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  450  			compatible = "qcom,i2c-qup-v2.1.1";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  451  			reg = <0xf9924000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  452  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  453  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  454  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  455  			pinctrl-names = "default";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  456  			pinctrl-0 = <&blsp1_i2c2_pins>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  457  			#address-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  458  			#size-cells = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  459  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  460  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  461  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  462  		blsp1_i2c3: i2c@f9925000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  463  			compatible = "qcom,i2c-qup-v2.1.1";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  464  			reg = <0xf9925000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  465  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  466  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  467  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  468  			pinctrl-names = "default";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  469  			pinctrl-0 = <&blsp1_i2c3_pins>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  470  			#address-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  471  			#size-cells = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  472  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  473  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  474  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  475  		blsp1_i2c4: i2c@f9926000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  476  			compatible = "qcom,i2c-qup-v2.1.1";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  477  			reg = <0xf9926000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  478  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  479  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  480  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  481  			pinctrl-names = "default";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  482  			pinctrl-0 = <&blsp1_i2c4_pins>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  483  			#address-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  484  			#size-cells = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  485  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  486  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  487  
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  488  		blsp1_i2c5: i2c@f9927000 {
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  489  			compatible = "qcom,i2c-qup-v2.1.1";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  490  			reg = <0xf9927000 0x1000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  491  			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  492  			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  493  			clock-names = "core", "iface";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  494  			pinctrl-names = "default";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  495  			pinctrl-0 = <&blsp1_i2c5_pins>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  496  			#address-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  497  			#size-cells = <0>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  498  			status = "disabled";
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  499  		};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  500  
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  501  		blsp1_i2c6: i2c@f9928000 {
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  502  			compatible = "qcom,i2c-qup-v2.1.1";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  503  			reg = <0xf9928000 0x1000>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  504  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  505  			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  506  				 <&gcc GCC_BLSP1_AHB_CLK>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  507  			clock-names = "core",
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  508  				      "iface";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  509  			pinctrl-0 = <&blsp1_i2c6_pins>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  510  			pinctrl-names = "default";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  511  			#address-cells = <1>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  512  			#size-cells = <0>;
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  513  			status = "disabled";
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  514  		};
ba369b3b49eabef arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Luca Weiss          2023-09-22  515  
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  516  		usb: usb@f9a55000 {
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  517  			compatible = "qcom,ci-hdrc";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  518  			reg = <0xf9a55000 0x200>,
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  519  			      <0xf9a55200 0x200>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  520  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  521  			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  522  				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  523  			clock-names = "iface", "core";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  524  			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  525  			assigned-clock-rates = <75000000>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  526  			resets = <&gcc GCC_USB_HS_BCR>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  527  			reset-names = "core";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  528  			phy_type = "ulpi";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  529  			dr_mode = "otg";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  530  			hnp-disable;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  531  			srp-disable;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  532  			adp-disable;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  533  			ahb-burst-config = <0>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  534  			phy-names = "usb-phy";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  535  			phys = <&usb_hs_phy>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  536  			status = "disabled";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  537  			#reset-cells = <1>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  538  
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  539  			ulpi {
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  540  				usb_hs_phy: phy {
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  541  					compatible = "qcom,usb-hs-phy-msm8226",
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  542  						     "qcom,usb-hs-phy";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  543  					#phy-cells = <0>;
e280427384269fb arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2023-05-09  544  					clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
e280427384269fb arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2023-05-09  545  						 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  546  					clock-names = "ref", "sleep";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  547  					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  548  					reset-names = "phy", "por";
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  549  					qcom,init-seq = /bits/ 8 <0x0 0x44
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  550  						0x1 0x68 0x2 0x24 0x3 0x13>;
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  551  				};
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  552  			};
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  553  		};
1a34117f2e145f1 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-11-18  554  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  555  		rng@f9bff000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  556  			compatible = "qcom,prng";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  557  			reg = <0xf9bff000 0x200>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  558  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  559  			clock-names = "core";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  560  		};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  561  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  562  		sram@fc190000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  563  			compatible = "qcom,msm8226-rpm-stats";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  564  			reg = <0xfc190000 0x10000>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  565  		};
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  566  
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  567  		gcc: clock-controller@fc400000 {
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  568  			compatible = "qcom,gcc-msm8226";
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  569  			reg = <0xfc400000 0x4000>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  570  			#clock-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  571  			#reset-cells = <1>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  572  			#power-domain-cells = <1>;
d4b2c596fe5cb62 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-21  573  
d4b2c596fe5cb62 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-21  574  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
d4b2c596fe5cb62 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-21  575  				 <&sleep_clk>;
d4b2c596fe5cb62 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-21  576  			clock-names = "xo",
d4b2c596fe5cb62 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2023-01-21  577  				      "sleep_clk";
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  578  		};
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  579  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  580  		rpm_msg_ram: sram@fc428000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  581  			compatible = "qcom,rpm-msg-ram";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  582  			reg = <0xfc428000 0x4000>;
ad789f571d93419 arch/arm/boot/dts/qcom-msm8226.dtsi      Rayyan Ansari       2022-10-02  583  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  584  			#address-cells = <1>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  585  			#size-cells = <1>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  586  			ranges = <0 0xfc428000 0x4000>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  587  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  588  			apss_master_stats: sram@150 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  589  				reg = <0x150 0x14>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  590  			};
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  591  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  592  			mpss_master_stats: sram@b50 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  593  				reg = <0xb50 0x14>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  594  			};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  595  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  596  			lpss_master_stats: sram@1550 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  597  				reg = <0x1550 0x14>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  598  			};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  599  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  600  			pronto_master_stats: sram@1f50 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  601  				reg = <0x1f50 0x14>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  602  			};
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  603  		};
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  604  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  605  		tsens: thermal-sensor@fc4a9000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  606  			compatible = "qcom,msm8226-tsens", "qcom,tsens-v0_1";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  607  			reg = <0xfc4a9000 0x1000>, /* TM */
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  608  			      <0xfc4a8000 0x1000>; /* SROT */
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  609  			nvmem-cells = <&tsens_mode>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  610  				      <&tsens_base1>, <&tsens_base2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  611  				      <&tsens_s0_p1>, <&tsens_s0_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  612  				      <&tsens_s1_p1>, <&tsens_s1_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  613  				      <&tsens_s2_p1>, <&tsens_s2_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  614  				      <&tsens_s3_p1>, <&tsens_s3_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  615  				      <&tsens_s4_p1>, <&tsens_s4_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  616  				      <&tsens_s5_p1>, <&tsens_s5_p2>,
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  617  				      <&tsens_s6_p1>, <&tsens_s6_p2>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  618  			nvmem-cell-names = "mode",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  619  					   "base1", "base2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  620  					   "s0_p1", "s0_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  621  					   "s1_p1", "s1_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  622  					   "s2_p1", "s2_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  623  					   "s3_p1", "s3_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  624  					   "s4_p1", "s4_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  625  					   "s5_p1", "s5_p2",
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  626  					   "s6_p1", "s6_p2";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  627  			#qcom,sensors = <6>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  628  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  629  			interrupt-names = "uplow";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  630  			#thermal-sensor-cells = <1>;
7694892a9350a4d arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2021-09-12  631  		};
a5683471b68d818 arch/arm/boot/dts/qcom-msm8226.dtsi      Luca Weiss          2022-02-16  632  
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  633  		restart@fc4ab000 {
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  634  			compatible = "qcom,pshold";
70d6c14f52ff147 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Matti Lehtimäki     2024-02-10  635  			reg = <0xfc4ab000 0x4>;
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  636  		};
8927b678766d7bc arch/arm/boot/dts/qcom-msm8226.dtsi      Bartosz Dudziak     2021-04-18  637  
78de7358aa7afe1 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi Krzysztof Kozlowski 2024-06-23  638  		qfprom: efuse@fc4bc000 {
16a9fa7ab27b69b arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  639  			compatible = "qcom,msm8226-qfprom", "qcom,qfprom";
16a9fa7ab27b69b arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  640  			reg = <0xfc4bc000 0x1000>;
16a9fa7ab27b69b arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  641  			#address-cells = <1>;
16a9fa7ab27b69b arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  642  			#size-cells = <1>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  643  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  644  			tsens_base1: base1@1c1 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  645  				reg = <0x1c1 0x2>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  646  				bits = <5 8>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  647  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  648  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  649  			tsens_s0_p1: s0-p1@1c2 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  650  				reg = <0x1c2 0x2>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  651  				bits = <5 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  652  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  653  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07 @654  			tsens_s1_p1: s1-p1@1c4 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  655  				reg = <0x1c4 0x1>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  656  				bits = <0 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  657  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  658  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  659  			tsens_s2_p1: s2-p1@1c4 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  660  				reg = <0x1c4 0x2>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  661  				bits = <6 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  662  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  663  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  664  			tsens_s3_p1: s3-p1@1c5 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  665  				reg = <0x1c5 0x2>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  666  				bits = <4 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  667  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  668  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  669  			tsens_s4_p1: s4-p1@1c6 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  670  				reg = <0x1c6 0x1>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  671  				bits = <2 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  672  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  673  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  674  			tsens_s5_p1: s5-p1@1c7 {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  675  				reg = <0x1c7 0x1>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  676  				bits = <0 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  677  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  678  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  679  			tsens_s6_p1: s6-p1@1ca {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  680  				reg = <0x1ca 0x2>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  681  				bits = <4 6>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  682  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  683  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  684  			tsens_base2: base2@1cc {
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  685  				reg = <0x1cc 0x1>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  686  				bits = <0 8>;
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  687  			};
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07  688  
0f8861c9fc7cc9a arch/arm/boot/dts/qcom-msm8226.dtsi      Matti Lehtimäki     2023-05-07 @689  			tsens_s0_p2: s0-p2@1cd {

:::::: The code at line 654 was first introduced by commit
:::::: 0f8861c9fc7cc9af6d6f65d6657aa9cf2531b29c ARM: dts: qcom: msm8226: Add tsens node and related nvmem cells

:::::: TO: Matti Lehtimäki <matti.lehtimaki@gmail.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
