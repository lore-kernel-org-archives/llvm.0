Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204711DFE2B;
	Tue,  8 Oct 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406567; cv=none; b=aNaFIhROFRhakG0rA73y9w7UHd+aiMSAi9+L5zh6ymUkYks4fNalze6seYjK3QEOIcGUu0np3OEn4JXir5LaBHeeRSGm3kA6GAG8yJDMDawk7ruJeISuBM/ULCYf2ZUy6rBmUkPeeJPSrN9cXmPd0JnAH0z3/bQULlj0Yto58iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406567; c=relaxed/simple;
	bh=Egc1xoMR5p+evvQQUwEDa1f7Q2zyrCIwTSqh+LxLQGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJ2/BsBQOQUsWS+7DLJe+mN4EeKTxhe0n+tacyRVe7VTNOvHkDASyu+6iJvr5XqknZJHfkMZGO482NRQ+xtVI6tbfVNw+m7RxbCNACJhsZ4f92MP5wnZJ1CxoUoKjORO2ALeoHfuGLK71rnCFL0LH8aGXe3cKXeFuUP31ob18Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOvs0xOp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOvs0xOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728406560; x=1759942560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Egc1xoMR5p+evvQQUwEDa1f7Q2zyrCIwTSqh+LxLQGo=;
  b=fOvs0xOp/RICT3YKglIrn98B08yasxh0LEqEGrAOf+q8HAiPU4Evf3O6
   82zeYvQMMpy9ZVgk66rYY/9+47NBz7bqG0kgmD9ynsMdAJLUMdRwlWaBG
   luSx8qI6gjunuahX9x7btXPxWrVR49zBmzHgOu33+Iyp2hNrj0m384C25
   BoWHZvCOacRk0XkQbgd3vhHrxedshO6YHJC7ku5j5QAODvcSWkihUrJCR
   Vx5OwdyV8j2SnxXz07d7WaJopRdxXl5W+6+yHEYJ3EQzHKHRKuzZMN+1S
   WB0t0ysI2KIoqCIqaOcjk9UTU/DIkbje5qcJ3ayH9b6aSQyGNBhSeMip+
   w==;
X-CSE-ConnectionGUID: SblARsIQSAq6GTP2LY/M6Q==
X-CSE-MsgGUID: Gfh4xdrOTKW3tarjCCTCwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27502402"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27502402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 09:55:59 -0700
X-CSE-ConnectionGUID: Nigqtu6MR6+ANI37VUQWWg==
X-CSE-MsgGUID: H/zLgensTC6f5XtgM05Flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="76012727"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Oct 2024 09:55:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syDV4-00089g-0e;
	Tue, 08 Oct 2024 16:55:54 +0000
Date: Wed, 9 Oct 2024 00:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [linux-next:master 2337/2853]
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning
 (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate
 unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
Message-ID: <202410090047.je3bAhSu-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 8bcf94778ed3f5aaf14d2df8b35db76d105ddc89 [2337/2853] ARM: dts: qcom: drop underscore in node names
config: arm-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090047.je3bAhSu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090047.je3bAhSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090047.je3bAhSu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:92.9-95.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:264.26-267.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:279.26-282.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:299.26-302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:309.26-312.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:334.26-337.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:359.26-362.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:379.40-382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:389.40-392.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:424.41-427.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:439.41-442.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:464.41-467.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:489.41-492.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)

vim +1297 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi

3933d267835c8b arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-01-16    11  
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20    12  / {
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09    13  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09    14  	#size-cells = <1>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20    15  	interrupt-parent = <&intc>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20    16  
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18    17  	chosen { };
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18    18  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    19  	clocks {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    20  		xo_board: xo_board {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    21  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    22  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    23  			clock-frequency = <19200000>;
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28    24  		};
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28    25  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    26  		sleep_clk: sleep_clk {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    27  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    28  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15    29  			clock-frequency = <32768>;
ca3971cf77f0bc arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27    30  		};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26    31  	};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26    32  
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    33  	cpus {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    34  		#address-cells = <1>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    35  		#size-cells = <0>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05    36  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    37  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03    38  		CPU0: cpu@0 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    39  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    40  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    41  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    42  			reg = <0>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    43  			next-level-cache = <&L2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    44  			qcom,acc = <&acc0>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    45  			qcom,saw = <&saw0>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    46  			cpu-idle-states = <&CPU_SPC>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    47  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    48  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03    49  		CPU1: cpu@1 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    50  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    51  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    52  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    53  			reg = <1>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    54  			next-level-cache = <&L2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    55  			qcom,acc = <&acc1>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    56  			qcom,saw = <&saw1>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    57  			cpu-idle-states = <&CPU_SPC>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    58  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    59  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03    60  		CPU2: cpu@2 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    61  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    62  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    63  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    64  			reg = <2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    65  			next-level-cache = <&L2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    66  			qcom,acc = <&acc2>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    67  			qcom,saw = <&saw2>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    68  			cpu-idle-states = <&CPU_SPC>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    69  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    70  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03    71  		CPU3: cpu@3 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    72  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28    73  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    74  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    75  			reg = <3>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    76  			next-level-cache = <&L2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    77  			qcom,acc = <&acc3>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    78  			qcom,saw = <&saw3>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    79  			cpu-idle-states = <&CPU_SPC>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    80  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    81  
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    82  		L2: l2-cache {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    83  			compatible = "cache";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    84  			cache-level = <2>;
925a80af6106a5 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-16    85  			cache-unified;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    86  			qcom,saw = <&saw_l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    87  		};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    88  
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    89  		idle-states {
e48919dc1ed568 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi David Heidelberg             2023-12-03    90  			CPU_SPC: cpu-spc {
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    91  				compatible = "qcom,idle-state-spc",
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    92  						"arm,idle-state";
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    93  				entry-latency-us = <150>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    94  				exit-latency-us = <200>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    95  				min-residency-us = <2000>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    96  			};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25    97  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    98  	};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01    99  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   100  	firmware {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   101  		scm {
363c1b04cfce56 arch/arm/boot/dts/qcom-msm8974.dtsi      David Heidelberg             2022-06-26   102  			compatible = "qcom,scm-msm8974", "qcom,scm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   103  			clocks = <&gcc GCC_CE1_CLK>, <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   104  			clock-names = "core", "bus", "iface";
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   105  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   106  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   107  
cad23ffd46e220 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18   108  	memory@0 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   109  		device_type = "memory";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   110  		reg = <0x0 0x0>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   111  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   112  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   113  	pmu {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   114  		compatible = "qcom,krait-pmu";
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   115  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   116  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   117  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   118  	rpm: remoteproc {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   119  		compatible = "qcom,msm8974-rpm-proc", "qcom,rpm-proc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   120  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   121  		master-stats {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   122  			compatible = "qcom,rpm-master-stats";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   123  			qcom,rpm-msg-ram = <&apss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   124  					   <&mpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   125  					   <&lpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   126  					   <&pronto_master_stats>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   127  			qcom,master-names = "APSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   128  					    "MPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   129  					    "LPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   130  					    "PRONTO";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   131  		};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22   132  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   133  		smd-edge {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   134  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24   135  			mboxes = <&apcs 0>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   136  			qcom,smd-edge = <15>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   137  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   138  			rpm_requests: rpm-requests {
a11a87a9a66e5e arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-07-29   139  				compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   140  				qcom,smd-channels = "rpm_requests";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   141  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   142  				rpmcc: clock-controller {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   143  					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   144  					#clock-cells = <1>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   145  					clocks = <&xo_board>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   146  					clock-names = "xo";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   147  				};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   148  			};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   149  		};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   150  	};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15   151  
56080a49773935 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Bingwu Zhang                 2024-07-15   152  	reserved_memory: reserved-memory {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   153  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   154  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   155  		ranges;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   156  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   157  		mpss_region: mpss@8000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   158  			reg = <0x08000000 0x5100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   159  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   160  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   161  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   162  		mba_region: mba@d100000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   163  			reg = <0x0d100000 0x100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   164  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   165  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   166  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   167  		wcnss_region: wcnss@d200000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   168  			reg = <0x0d200000 0xa00000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   169  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   170  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   171  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   172  		adsp_region: adsp@dc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   173  			reg = <0x0dc00000 0x1900000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   174  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   175  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   176  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   177  		venus_region: memory@f500000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   178  			reg = <0x0f500000 0x500000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   179  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   180  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   181  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   182  		smem_region: smem@fa00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   183  			reg = <0xfa00000 0x200000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   184  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   185  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21   186  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   187  		tz_region: memory@fc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   188  			reg = <0x0fc00000 0x160000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   189  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   190  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   191  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   192  		rfsa_mem: memory@fd60000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   193  			reg = <0x0fd60000 0x20000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   194  			no-map;
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21   195  		};
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21   196  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   197  		rmtfs@fd80000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   198  			compatible = "qcom,rmtfs-mem";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   199  			reg = <0x0fd80000 0x180000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   200  			no-map;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06   201  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   202  			qcom,client-id = <1>;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06   203  		};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   204  	};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   205  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   206  	smem {
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   207  		compatible = "qcom,smem";
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   208  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   209  		memory-region = <&smem_region>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   210  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   211  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   212  		hwlocks = <&tcsr_mutex 3>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   213  	};
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08   214  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   215  	smp2p-adsp {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   216  		compatible = "qcom,smp2p";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   217  		qcom,smem = <443>, <429>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   218  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   219  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   220  		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   221  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24   222  		mboxes = <&apcs 10>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   223  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   224  		qcom,local-pid = <0>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   225  		qcom,remote-pid = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   226  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   227  		adsp_smp2p_out: master-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   228  			qcom,entry-name = "master-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   229  			#qcom,smem-state-cells = <1>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   230  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   231  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   232  		adsp_smp2p_in: slave-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   233  			qcom,entry-name = "slave-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   234  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   235  			interrupt-controller;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   236  			#interrupt-cells = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   237  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   238  	};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22   239  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   240  	smp2p-modem {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   241  		compatible = "qcom,smp2p";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   242  		qcom,smem = <435>, <428>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   243  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   244  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   245  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   246  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24   247  		mboxes = <&apcs 14>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   248  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   249  		qcom,local-pid = <0>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   250  		qcom,remote-pid = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   251  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   252  		modem_smp2p_out: master-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   253  			qcom,entry-name = "master-kernel";
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12   254  			#qcom,smem-state-cells = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   255  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   256  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   257  		modem_smp2p_in: slave-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   258  			qcom,entry-name = "slave-kernel";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   259  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   260  			interrupt-controller;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   261  			#interrupt-cells = <2>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   262  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   263  	};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   264  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   265  	smp2p-wcnss {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   266  		compatible = "qcom,smp2p";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   267  		qcom,smem = <451>, <431>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   268  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   269  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   270  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   271  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24   272  		mboxes = <&apcs 18>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   273  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   274  		qcom,local-pid = <0>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   275  		qcom,remote-pid = <4>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   276  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   277  		wcnss_smp2p_out: master-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   278  			qcom,entry-name = "master-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   279  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12   280  			#qcom,smem-state-cells = <1>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   281  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   282  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   283  		wcnss_smp2p_in: slave-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   284  			qcom,entry-name = "slave-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   285  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   286  			interrupt-controller;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   287  			#interrupt-cells = <2>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   288  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   289  	};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   290  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   291  	smsm {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   292  		compatible = "qcom,smsm";
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   293  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   294  		#address-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   295  		#size-cells = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   296  
368a5aed131271 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-06-19   297  		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   298  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   299  		apps_smsm: apps@0 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   300  			reg = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   301  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12   302  			#qcom,smem-state-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   303  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   304  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   305  		modem_smsm: modem@1 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   306  			reg = <1>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   307  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   308  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   309  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   310  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   311  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   312  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   313  		adsp_smsm: adsp@2 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   314  			reg = <2>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   315  			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   316  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   317  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   318  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   319  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   320  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   321  		wcnss_smsm: wcnss@7 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   322  			reg = <7>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   323  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   324  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   325  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   326  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   327  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   328  	};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   329  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   330  	soc: soc {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   331  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   332  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   333  		ranges;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   334  		compatible = "simple-bus";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   335  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   336  		intc: interrupt-controller@f9000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   337  			compatible = "qcom,msm-qgic2";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   338  			interrupt-controller;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   339  			#interrupt-cells = <3>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   340  			reg = <0xf9000000 0x1000>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   341  			      <0xf9002000 0x1000>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   342  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   343  
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08   344  		apcs: mailbox@f9011000 {
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08   345  			compatible = "qcom,msm8974-apcs-kpss-global",
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08   346  				     "qcom,msm8994-apcs-kpss-global", "syscon";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   347  			reg = <0xf9011000 0x1000>;
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08   348  			#mbox-cells = <1>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   349  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17   350  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   351  		saw_l2: power-manager@f9012000 {
c0fe5442b1e5bc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   352  			compatible = "qcom,msm8974-saw2-v2.1-l2", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   353  			reg = <0xf9012000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   354  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   355  
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   356  		watchdog@f9017000 {
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   357  			compatible = "qcom,apss-wdt-msm8974", "qcom,kpss-wdt";
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   358  			reg = <0xf9017000 0x1000>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   359  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   360  				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   361  			clocks = <&sleep_clk>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   362  		};
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11   363  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   364  		timer@f9020000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   365  			#address-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   366  			#size-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   367  			ranges;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   368  			compatible = "arm,armv7-timer-mem";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   369  			reg = <0xf9020000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   370  			clock-frequency = <19200000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   371  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   372  			frame@f9021000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   373  				frame-number = <0>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   374  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   375  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   376  				reg = <0xf9021000 0x1000>,
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   377  				      <0xf9022000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   378  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   379  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   380  			frame@f9023000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   381  				frame-number = <1>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   382  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   383  				reg = <0xf9023000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   384  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   385  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   386  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   387  			frame@f9024000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   388  				frame-number = <2>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   389  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   390  				reg = <0xf9024000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   391  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   392  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   393  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   394  			frame@f9025000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   395  				frame-number = <3>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   396  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   397  				reg = <0xf9025000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   398  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   399  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   400  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   401  			frame@f9026000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   402  				frame-number = <4>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   403  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   404  				reg = <0xf9026000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   405  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   406  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   407  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   408  			frame@f9027000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   409  				frame-number = <5>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   410  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   411  				reg = <0xf9027000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   412  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   413  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   414  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   415  			frame@f9028000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   416  				frame-number = <6>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   417  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   418  				reg = <0xf9028000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   419  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   420  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   421  		};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20   422  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16   423  		acc0: power-manager@f9088000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   424  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   425  			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   426  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   427  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   428  		saw0: power-manager@f9089000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   429  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   430  			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   431  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   432  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16   433  		acc1: power-manager@f9098000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   434  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   435  			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   436  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   437  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   438  		saw1: power-manager@f9099000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   439  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   440  			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   441  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   442  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16   443  		acc2: power-manager@f90a8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   444  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   445  			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   446  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   447  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   448  		saw2: power-manager@f90a9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   449  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   450  			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   451  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   452  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16   453  		acc3: power-manager@f90b8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   454  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   455  			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   456  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   457  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02   458  		saw3: power-manager@f90b9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   459  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   460  			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   461  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27   462  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15   463  		sdhc_1: mmc@f9824900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05   464  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   465  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   466  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   467  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   468  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   469  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   470  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   471  				 <&gcc GCC_SDCC1_APPS_CLK>,
a91b2e690d4094 arch/arm/boot/dts/qcom-msm8974.dtsi      Ritesh Harjani               2016-11-21   472  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   473  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   474  			bus-width = <8>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   475  			non-removable;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   476  
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   477  			status = "disabled";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   478  		};
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   479  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15   480  		sdhc_3: mmc@f9864900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05   481  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   482  			reg = <0xf9864900 0x11c>, <0xf9864000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   483  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   484  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   485  				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   486  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   487  			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   488  				 <&gcc GCC_SDCC3_APPS_CLK>,
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   489  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   490  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   491  			bus-width = <4>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   492  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   493  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   494  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   495  
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   496  			status = "disabled";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   497  		};
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04   498  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15   499  		sdhc_2: mmc@f98a4900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05   500  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   501  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   502  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   503  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   504  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31   505  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   506  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   507  				 <&gcc GCC_SDCC2_APPS_CLK>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   508  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12   509  			clock-names = "iface", "core", "xo";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   510  			bus-width = <4>;
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04   511  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   512  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   513  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   514  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   515  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04   516  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04   517  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   518  		blsp1_uart1: serial@f991d000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   519  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   520  			reg = <0xf991d000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   521  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   522  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   523  			clock-names = "core", "iface";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   524  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04   525  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04   526  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   527  		blsp1_uart2: serial@f991e000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   528  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   529  			reg = <0xf991e000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   530  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   531  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   532  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   533  			pinctrl-names = "default";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   534  			pinctrl-0 = <&blsp1_uart2_default>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   535  			status = "disabled";
7d7db8db67003e arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2014-02-06   536  		};
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   537  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   538  		blsp1_i2c1: i2c@f9923000 {
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   539  			status = "disabled";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   540  			compatible = "qcom,i2c-qup-v2.1.1";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   541  			reg = <0xf9923000 0x1000>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   542  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   543  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   544  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   545  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   546  			pinctrl-0 = <&blsp1_i2c1_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   547  			pinctrl-1 = <&blsp1_i2c1_sleep>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   548  			#address-cells = <1>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   549  			#size-cells = <0>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   550  		};
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31   551  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   552  		blsp1_i2c2: i2c@f9924000 {
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   553  			status = "disabled";
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   554  			compatible = "qcom,i2c-qup-v2.1.1";
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   555  			reg = <0xf9924000 0x1000>;
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   556  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   557  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   558  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   559  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   560  			pinctrl-0 = <&blsp1_i2c2_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   561  			pinctrl-1 = <&blsp1_i2c2_sleep>;
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   562  			#address-cells = <1>;
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   563  			#size-cells = <0>;
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   564  		};
89af1c2d63b0e9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   565  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   566  		blsp1_i2c3: i2c@f9925000 {
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   567  			status = "disabled";
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   568  			compatible = "qcom,i2c-qup-v2.1.1";
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   569  			reg = <0xf9925000 0x1000>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   570  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   571  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   572  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   573  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   574  			pinctrl-0 = <&blsp1_i2c3_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   575  			pinctrl-1 = <&blsp1_i2c3_sleep>;
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   576  			#address-cells = <1>;
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   577  			#size-cells = <0>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   578  		};
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   579  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   580  		blsp1_i2c6: i2c@f9928000 {
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   581  			status = "disabled";
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   582  			compatible = "qcom,i2c-qup-v2.1.1";
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   583  			reg = <0xf9928000 0x1000>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   584  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   585  			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   586  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   587  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   588  			pinctrl-0 = <&blsp1_i2c6_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   589  			pinctrl-1 = <&blsp1_i2c6_sleep>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   590  			#address-cells = <1>;
cd13c72c1853f2 arch/arm/boot/dts/qcom-msm8974.dtsi      Iskren Chernev               2020-04-14   591  			#size-cells = <0>;
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   592  		};
bd939250758848 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   593  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   594  		blsp2_dma: dma-controller@f9944000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   595  			compatible = "qcom,bam-v1.4.0";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   596  			reg = <0xf9944000 0x19000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   597  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   598  			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   599  			clock-names = "bam_clk";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   600  			#dma-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   601  			qcom,ee = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   602  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   603  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   604  		blsp2_uart1: serial@f995d000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   605  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   606  			reg = <0xf995d000 0x1000>;
ab1489017aa7a9 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-05-22   607  			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   608  			clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   609  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   610  			pinctrl-names = "default", "sleep";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   611  			pinctrl-0 = <&blsp2_uart1_default>;
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   612  			pinctrl-1 = <&blsp2_uart1_sleep>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   613  			status = "disabled";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   614  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   615  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   616  		blsp2_uart2: serial@f995e000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   617  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   618  			reg = <0xf995e000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   619  			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   620  			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   621  			clock-names = "core", "iface";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   622  			status = "disabled";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   623  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   624  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   625  		blsp2_uart4: serial@f9960000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   626  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   627  			reg = <0xf9960000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   628  			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   629  			clocks = <&gcc GCC_BLSP2_UART4_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   630  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   631  			pinctrl-names = "default";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   632  			pinctrl-0 = <&blsp2_uart4_default>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   633  			status = "disabled";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   634  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   635  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   636  		blsp2_i2c2: i2c@f9964000 {
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   637  			status = "disabled";
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   638  			compatible = "qcom,i2c-qup-v2.1.1";
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   639  			reg = <0xf9964000 0x1000>;
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   640  			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   641  			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   642  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   643  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   644  			pinctrl-0 = <&blsp2_i2c2_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   645  			pinctrl-1 = <&blsp2_i2c2_sleep>;
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   646  			#address-cells = <1>;
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   647  			#size-cells = <0>;
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   648  		};
580df59fa74e53 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-11-23   649  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   650  		blsp2_i2c5: i2c@f9967000 {
04edde250c3753 arch/arm/boot/dts/qcom-msm8974.dtsi      Michael Opdenacker           2015-10-13   651  			status = "disabled";
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   652  			compatible = "qcom,i2c-qup-v2.1.1";
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   653  			reg = <0xf9967000 0x1000>;
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06   654  			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   655  			clocks = <&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   656  			clock-names = "core", "iface";
938b4d4ea13535 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-09   657  			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
938b4d4ea13535 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-09   658  			dma-names = "tx", "rx";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   659  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   660  			pinctrl-0 = <&blsp2_i2c5_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   661  			pinctrl-1 = <&blsp2_i2c5_sleep>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   662  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   663  			#size-cells = <0>;
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16   664  		};
af22e46d3e8e29 arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2015-02-03   665  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   666  		blsp2_i2c6: i2c@f9968000 {
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   667  			status = "disabled";
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   668  			compatible = "qcom,i2c-qup-v2.1.1";
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   669  			reg = <0xf9968000 0x1000>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   670  			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   671  			clocks = <&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   672  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   673  			pinctrl-names = "default", "sleep";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   674  			pinctrl-0 = <&blsp2_i2c6_default>;
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06   675  			pinctrl-1 = <&blsp2_i2c6_sleep>;
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   676  			#address-cells = <1>;
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   677  			#size-cells = <0>;
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   678  		};
fe8d81fe7d9aab arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-08-02   679  
08b37b2a9b1a9e arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-11-28   680  		usb: usb@f9a55000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   681  			compatible = "qcom,ci-hdrc";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   682  			reg = <0xf9a55000 0x200>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   683  			      <0xf9a55200 0x200>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   684  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   685  			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   686  				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   687  			clock-names = "iface", "core";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   688  			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   689  			assigned-clock-rates = <75000000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   690  			resets = <&gcc GCC_USB_HS_BCR>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   691  			reset-names = "core";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   692  			phy_type = "ulpi";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   693  			dr_mode = "otg";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   694  			ahb-burst-config = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   695  			phy-names = "usb-phy";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   696  			status = "disabled";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   697  			#reset-cells = <1>;
d44cbb1e9ca348 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-09   698  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   699  			ulpi {
392a1aab14542a arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-20   700  				usb_hs1_phy: phy-0 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   701  					compatible = "qcom,usb-hs-phy-msm8974",
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   702  						     "qcom,usb-hs-phy";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   703  					#phy-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   704  					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   705  					clock-names = "ref", "sleep";
08b37b2a9b1a9e arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-11-28   706  					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   707  					reset-names = "phy", "por";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   708  					status = "disabled";
d44cbb1e9ca348 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-09   709  				};
769907ae6e6c28 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   710  
392a1aab14542a arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-20   711  				usb_hs2_phy: phy-1 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   712  					compatible = "qcom,usb-hs-phy-msm8974",
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   713  						     "qcom,usb-hs-phy";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   714  					#phy-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   715  					clocks = <&xo_board>, <&gcc GCC_USB2B_PHY_SLEEP_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   716  					clock-names = "ref", "sleep";
08b37b2a9b1a9e arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-11-28   717  					resets = <&gcc GCC_USB2B_PHY_BCR>, <&usb 1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   718  					reset-names = "phy", "por";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   719  					status = "disabled";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   720  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   721  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   722  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   723  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   724  		rng@f9bff000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   725  			compatible = "qcom,prng";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   726  			reg = <0xf9bff000 0x200>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   727  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   728  			clock-names = "core";
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   729  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   730  
dcbd24008bfa9b arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-20   731  		pronto: remoteproc@fb204000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   732  			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   733  			reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   734  			reg-names = "ccu", "dxe", "pmu";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   735  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   736  			memory-region = <&wcnss_region>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   737  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   738  			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   739  					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   740  					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   741  					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   742  					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   743  			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   744  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   745  			qcom,smem-states = <&wcnss_smp2p_out 0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   746  			qcom,smem-state-names = "stop";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   747  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   748  			status = "disabled";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   749  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   750  			iris {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   751  				compatible = "qcom,wcn3680";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   752  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   753  				clocks = <&rpmcc RPM_SMD_CXO_A2>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   754  				clock-names = "xo";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   755  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   756  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   757  			smd-edge {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   758  				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   759  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24   760  				mboxes = <&apcs 17>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   761  				qcom,smd-edge = <6>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   762  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   763  				wcnss {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   764  					compatible = "qcom,wcnss";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   765  					qcom,smd-channels = "WCNSS_CTRL";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   766  					status = "disabled";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   767  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   768  					qcom,mmio = <&pronto>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   769  
d2f1bd8f0b91ce arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-21   770  					bluetooth {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   771  						compatible = "qcom,wcnss-bt";
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   772  					};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   773  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   774  					wifi {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   775  						compatible = "qcom,wcnss-wlan";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   776  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   777  						interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   778  							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   779  						interrupt-names = "tx", "rx";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   780  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   781  						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   782  						qcom,smem-state-names = "tx-enable",
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   783  									"tx-rings-empty";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   784  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   785  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   786  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   787  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   788  
47931796aad522 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-07-26   789  		sram@fc190000 {
47931796aad522 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-07-26   790  			compatible = "qcom,msm8974-rpm-stats";
47931796aad522 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-07-26   791  			reg = <0xfc190000 0x10000>;
47931796aad522 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-07-26   792  		};
47931796aad522 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-07-26   793  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   794  		etf@fc307000 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   795  			compatible = "arm,coresight-tmc", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   796  			reg = <0xfc307000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   797  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   798  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   799  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   800  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   801  			out-ports {
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   802  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   803  					etf_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   804  						remote-endpoint = <&replicator_in>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   805  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   806  				};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   807  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   808  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   809  			in-ports {
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   810  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   811  					etf_in: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   812  						remote-endpoint = <&merger_out>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   813  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   814  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   815  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   816  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   817  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   818  		tpiu@fc318000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   819  			compatible = "arm,coresight-tpiu", "arm,primecell";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   820  			reg = <0xfc318000 0x1000>;
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   821  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   822  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   823  			clock-names = "apb_pclk", "atclk";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   824  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   825  			in-ports {
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   826  				port {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   827  					tpiu_in: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   828  						remote-endpoint = <&replicator_out1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   829  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   830  				 };
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   831  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   832  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   833  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   834  		funnel@fc31a000 {
15061c3edde481 arch/arm/boot/dts/qcom-msm8974.dtsi      Leo Yan                      2019-05-08   835  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   836  			reg = <0xfc31a000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   837  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   838  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   839  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   840  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   841  			in-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   842  				#address-cells = <1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   843  				#size-cells = <0>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   844  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   845  				/*
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   846  				 * Not described input ports:
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   847  				 * 0 - not-connected
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   848  				 * 1 - connected trought funnel to Multimedia CPU
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   849  				 * 2 - connected to Wireless CPU
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   850  				 * 3 - not-connected
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   851  				 * 4 - not-connected
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   852  				 * 6 - not-connected
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   853  				 * 7 - connected to STM
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   854  				 */
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   855  				port@5 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   856  					reg = <5>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   857  					funnel1_in5: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   858  						remote-endpoint = <&kpss_out>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   859  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   860  				};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   861  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   862  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   863  			out-ports {
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   864  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   865  					funnel1_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   866  						remote-endpoint = <&merger_in1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   867  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   868  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   869  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   870  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   871  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   872  		funnel@fc31b000 {
15061c3edde481 arch/arm/boot/dts/qcom-msm8974.dtsi      Leo Yan                      2019-05-08   873  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   874  			reg = <0xfc31b000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   875  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   876  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   877  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   878  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   879  			in-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   880  				#address-cells = <1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   881  				#size-cells = <0>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   882  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   883  				/*
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   884  				 * Not described input ports:
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   885  				 * 0 - connected trought funnel to Audio, Modem and
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   886  				 *     Resource and Power Manager CPU's
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   887  				 * 2...7 - not-connected
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   888  				 */
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   889  				port@1 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   890  					reg = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   891  					merger_in1: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   892  						remote-endpoint = <&funnel1_out>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   893  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   894  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   895  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   896  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   897  			out-ports {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   898  				port {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   899  					merger_out: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   900  						remote-endpoint = <&etf_in>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   901  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   902  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   903  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   904  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   905  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   906  		replicator@fc31c000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   907  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   908  			reg = <0xfc31c000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   909  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   910  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   911  			clock-names = "apb_pclk", "atclk";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   912  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   913  			out-ports {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   914  				#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   915  				#size-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   916  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   917  				port@0 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   918  					reg = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   919  					replicator_out0: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   920  						remote-endpoint = <&etr_in>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   921  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   922  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   923  				port@1 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   924  					reg = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   925  					replicator_out1: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   926  						remote-endpoint = <&tpiu_in>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   927  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   928  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   929  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   930  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   931  			in-ports {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   932  				port {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   933  					replicator_in: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   934  						remote-endpoint = <&etf_out>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   935  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   936  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   937  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   938  		};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   939  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   940  		etr@fc322000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   941  			compatible = "arm,coresight-tmc", "arm,primecell";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   942  			reg = <0xfc322000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   943  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   944  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   945  			clock-names = "apb_pclk", "atclk";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   946  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   947  			in-ports {
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   948  				port {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   949  					etr_in: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   950  						remote-endpoint = <&replicator_out0>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   951  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   952  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   953  			};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   954  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   955  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   956  		etm@fc33c000 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   957  			compatible = "arm,coresight-etm4x", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   958  			reg = <0xfc33c000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   959  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   960  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   961  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   962  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   963  			cpu = <&CPU0>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   964  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   965  			out-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   966  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   967  					etm0_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   968  						remote-endpoint = <&kpss_in0>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   969  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   970  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   971  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   972  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   973  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   974  		etm@fc33d000 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   975  			compatible = "arm,coresight-etm4x", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   976  			reg = <0xfc33d000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   977  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   978  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   979  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   980  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   981  			cpu = <&CPU1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   982  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   983  			out-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   984  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   985  					etm1_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   986  						remote-endpoint = <&kpss_in1>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   987  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   988  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   989  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12   990  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   991  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   992  		etm@fc33e000 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   993  			compatible = "arm,coresight-etm4x", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   994  			reg = <0xfc33e000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   995  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   996  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   997  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   998  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03   999  			cpu = <&CPU2>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1000  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12  1001  			out-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1002  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1003  					etm2_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1004  						remote-endpoint = <&kpss_in2>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1005  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1006  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1007  			};
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12  1008  		};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1009  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1010  		etm@fc33f000 {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1011  			compatible = "arm,coresight-etm4x", "arm,primecell";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1012  			reg = <0xfc33f000 0x1000>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1013  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1014  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1015  			clock-names = "apb_pclk", "atclk";
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1016  
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1017  			cpu = <&CPU3>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1018  
ca02f96b95ca1a arch/arm/boot/dts/qcom-msm8974.dtsi      Suzuki K Poulose             2018-09-12  1019  			out-ports {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1020  				port {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1021  					etm3_out: endpoint {
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1022  						remote-endpoint = <&kpss_in3>;
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1023  					};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1024  				};
1e20223d8e247c arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2017-02-03  1025  			};
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20  1026  		};
5a9fc531f6ecc9 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-05-31  1027  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1028  		/* KPSS funnel, only 4 inputs are used */
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1029  		funnel@fc345000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1030  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1031  			reg = <0xfc345000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1032  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1033  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1034  			clock-names = "apb_pclk", "atclk";
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1035  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1036  			in-ports {
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1037  				#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1038  				#size-cells = <0>;
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1039  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1040  				port@0 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1041  					reg = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1042  					kpss_in0: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1043  						remote-endpoint = <&etm0_out>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1044  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1045  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1046  				port@1 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1047  					reg = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1048  					kpss_in1: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1049  						remote-endpoint = <&etm1_out>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1050  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1051  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1052  				port@2 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1053  					reg = <2>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1054  					kpss_in2: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1055  						remote-endpoint = <&etm2_out>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1056  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1057  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1058  				port@3 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1059  					reg = <3>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1060  					kpss_in3: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1061  						remote-endpoint = <&etm3_out>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1062  					};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1063  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1064  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1065  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1066  			out-ports {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1067  				port {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1068  					kpss_out: endpoint {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1069  						remote-endpoint = <&funnel1_in5>;
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1070  					};
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1071  				};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1072  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1073  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1074  
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1075  		bimc: interconnect@fc380000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1076  			reg = <0xfc380000 0x6a000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1077  			compatible = "qcom,msm8974-bimc";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1078  			#interconnect-cells = <1>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1079  			clock-names = "bus", "bus_a";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1080  			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1081  				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1082  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  1083  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1084  		gcc: clock-controller@fc400000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1085  			compatible = "qcom,gcc-msm8974";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1086  			#clock-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1087  			#reset-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1088  			#power-domain-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1089  			reg = <0xfc400000 0x4000>;
cd1dc49ad4cc77 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-12-04  1090  
17c5ee1914dc8c arch/arm/boot/dts/qcom-msm8974.dtsi      Rayyan Ansari                2023-01-21  1091  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
cd1dc49ad4cc77 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-12-04  1092  				 <&sleep_clk>;
cd1dc49ad4cc77 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-12-04  1093  			clock-names = "xo",
cd1dc49ad4cc77 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2022-12-04  1094  				      "sleep_clk";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1095  		};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1096  
7475f7248ebaf1 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-09-24  1097  		rpm_msg_ram: sram@fc428000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1098  			compatible = "qcom,rpm-msg-ram";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1099  			reg = <0xfc428000 0x4000>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1100  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1101  			#address-cells = <1>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1102  			#size-cells = <1>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1103  			ranges = <0 0xfc428000 0x4000>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1104  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1105  			apss_master_stats: sram@150 {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1106  				reg = <0x150 0x14>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1107  			};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1108  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1109  			mpss_master_stats: sram@b50 {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1110  				reg = <0xb50 0x14>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1111  			};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1112  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1113  			lpss_master_stats: sram@1550 {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1114  				reg = <0x1550 0x14>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1115  			};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1116  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1117  			pronto_master_stats: sram@1f50 {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1118  				reg = <0x1f50 0x14>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  1119  			};
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1120  		};
a2cc991ed634a3 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1121  
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1122  		snoc: interconnect@fc460000 {
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1123  			reg = <0xfc460000 0x4000>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1124  			compatible = "qcom,msm8974-snoc";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1125  			#interconnect-cells = <1>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1126  			clock-names = "bus", "bus_a";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1127  			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1128  				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1129  		};
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1130  
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1131  		pnoc: interconnect@fc468000 {
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1132  			reg = <0xfc468000 0x4000>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1133  			compatible = "qcom,msm8974-pnoc";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1134  			#interconnect-cells = <1>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1135  			clock-names = "bus", "bus_a";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1136  			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1137  				 <&rpmcc RPM_SMD_PNOC_A_CLK>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1138  		};
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1139  
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1140  		ocmemnoc: interconnect@fc470000 {
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1141  			reg = <0xfc470000 0x4000>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1142  			compatible = "qcom,msm8974-ocmemnoc";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1143  			#interconnect-cells = <1>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1144  			clock-names = "bus", "bus_a";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1145  			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1146  				 <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1147  		};
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1148  
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1149  		mmssnoc: interconnect@fc478000 {
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1150  			reg = <0xfc478000 0x4000>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1151  			compatible = "qcom,msm8974-mmssnoc";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1152  			#interconnect-cells = <1>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1153  			clock-names = "bus", "bus_a";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1154  			clocks = <&mmcc MMSS_S0_AXI_CLK>,
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1155  				 <&mmcc MMSS_S0_AXI_CLK>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1156  		};
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1157  
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1158  		cnoc: interconnect@fc480000 {
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1159  			reg = <0xfc480000 0x4000>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1160  			compatible = "qcom,msm8974-cnoc";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1161  			#interconnect-cells = <1>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1162  			clock-names = "bus", "bus_a";
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1163  			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1164  				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1165  		};
98073faf9f1568 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2019-10-24  1166  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1167  		tsens: thermal-sensor@fc4a9000 {
23fa8ec64963b5 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-09-25  1168  			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1169  			reg = <0xfc4a9000 0x1000>, /* TM */
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1170  			      <0xfc4a8000 0x1000>; /* SROT */
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1171  			nvmem-cells = <&tsens_mode>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1172  				      <&tsens_base1>, <&tsens_base2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1173  				      <&tsens_use_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1174  				      <&tsens_mode_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1175  				      <&tsens_base1_backup>, <&tsens_base2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1176  				      <&tsens_s0_p1>, <&tsens_s0_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1177  				      <&tsens_s1_p1>, <&tsens_s1_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1178  				      <&tsens_s2_p1>, <&tsens_s2_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1179  				      <&tsens_s3_p1>, <&tsens_s3_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1180  				      <&tsens_s4_p1>, <&tsens_s4_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1181  				      <&tsens_s5_p1>, <&tsens_s5_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1182  				      <&tsens_s6_p1>, <&tsens_s6_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1183  				      <&tsens_s7_p1>, <&tsens_s7_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1184  				      <&tsens_s8_p1>, <&tsens_s8_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1185  				      <&tsens_s9_p1>, <&tsens_s9_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1186  				      <&tsens_s10_p1>, <&tsens_s10_p2>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1187  				      <&tsens_s0_p1_backup>, <&tsens_s0_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1188  				      <&tsens_s1_p1_backup>, <&tsens_s1_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1189  				      <&tsens_s2_p1_backup>, <&tsens_s2_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1190  				      <&tsens_s3_p1_backup>, <&tsens_s3_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1191  				      <&tsens_s4_p1_backup>, <&tsens_s4_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1192  				      <&tsens_s5_p1_backup>, <&tsens_s5_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1193  				      <&tsens_s6_p1_backup>, <&tsens_s6_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1194  				      <&tsens_s7_p1_backup>, <&tsens_s7_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1195  				      <&tsens_s8_p1_backup>, <&tsens_s8_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1196  				      <&tsens_s9_p1_backup>, <&tsens_s9_p2_backup>,
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1197  				      <&tsens_s10_p1_backup>, <&tsens_s10_p2_backup>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1198  			nvmem-cell-names = "mode",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1199  					   "base1", "base2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1200  					   "use_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1201  					   "mode_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1202  					   "base1_backup", "base2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1203  					   "s0_p1", "s0_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1204  					   "s1_p1", "s1_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1205  					   "s2_p1", "s2_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1206  					   "s3_p1", "s3_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1207  					   "s4_p1", "s4_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1208  					   "s5_p1", "s5_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1209  					   "s6_p1", "s6_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1210  					   "s7_p1", "s7_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1211  					   "s8_p1", "s8_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1212  					   "s9_p1", "s9_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1213  					   "s10_p1", "s10_p2",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1214  					   "s0_p1_backup", "s0_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1215  					   "s1_p1_backup", "s1_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1216  					   "s2_p1_backup", "s2_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1217  					   "s3_p1_backup", "s3_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1218  					   "s4_p1_backup", "s4_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1219  					   "s5_p1_backup", "s5_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1220  					   "s6_p1_backup", "s6_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1221  					   "s7_p1_backup", "s7_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1222  					   "s8_p1_backup", "s8_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1223  					   "s9_p1_backup", "s9_p2_backup",
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1224  					   "s10_p1_backup", "s10_p2_backup";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1225  			#qcom,sensors = <11>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1226  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1227  			interrupt-names = "uplow";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1228  			#thermal-sensor-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1229  		};
fe079442db63a7 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2021-02-01  1230  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1231  		restart@fc4ab000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1232  			compatible = "qcom,pshold";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1233  			reg = <0xfc4ab000 0x4>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1234  		};
fe079442db63a7 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2021-02-01  1235  
81fc54e62b5b39 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-06-23  1236  		qfprom: efuse@fc4bc000 {
aaed15efce65c2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-05-05  1237  			compatible = "qcom,msm8974-qfprom", "qcom,qfprom";
724c4bf0e4bf81 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Craig Tatlor                 2024-02-10  1238  			reg = <0xfc4bc000 0x2100>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1239  			#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1240  			#size-cells = <1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1241  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1242  			tsens_base1: base1@d0 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1243  				reg = <0xd0 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1244  				bits = <0 8>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1245  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1246  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1247  			tsens_s0_p1: s0-p1@d1 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1248  				reg = <0xd1 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1249  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1250  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1251  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01 @1252  			tsens_s1_p1: s1-p1@d2 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1253  				reg = <0xd1 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1254  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1255  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1256  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1257  			tsens_s2_p1: s2-p1@d2 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1258  				reg = <0xd2 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1259  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1260  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1261  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1262  			tsens_s3_p1: s3-p1@d3 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1263  				reg = <0xd3 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1264  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1265  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1266  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01 @1267  			tsens_s4_p1: s4-p1@d4 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1268  				reg = <0xd4 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1269  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1270  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1271  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1272  			tsens_s5_p1: s5-p1@d4 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1273  				reg = <0xd4 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1274  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1275  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1276  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1277  			tsens_s6_p1: s6-p1@d5 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1278  				reg = <0xd5 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1279  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1280  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1281  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1282  			tsens_s7_p1: s7-p1@d6 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1283  				reg = <0xd6 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1284  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1285  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1286  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01 @1287  			tsens_s8_p1: s8-p1@d7 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1288  				reg = <0xd7 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1289  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1290  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1291  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1292  			tsens_mode: mode@d7 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1293  				reg = <0xd7 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1294  				bits = <6 2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1295  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1296  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01 @1297  			tsens_s9_p1: s9-p1@d8 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1298  				reg = <0xd8 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1299  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1300  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1301  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1302  			tsens_s10_p1: s10-p1@d8 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1303  				reg = <0xd8 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1304  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1305  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1306  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1307  			tsens_base2: base2@d9 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1308  				reg = <0xd9 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1309  				bits = <4 8>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1310  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1311  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1312  			tsens_s0_p2: s0-p2@da {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1313  				reg = <0xda 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1314  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1315  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1316  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1317  			tsens_s1_p2: s1-p2@db {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1318  				reg = <0xdb 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1319  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1320  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1321  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1322  			tsens_s2_p2: s2-p2@dc {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1323  				reg = <0xdc 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1324  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1325  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1326  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1327  			tsens_s3_p2: s3-p2@dc {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1328  				reg = <0xdc 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1329  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1330  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1331  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1332  			tsens_s4_p2: s4-p2@dd {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1333  				reg = <0xdd 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1334  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1335  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1336  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1337  			tsens_s5_p2: s5-p2@de {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1338  				reg = <0xde 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1339  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1340  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1341  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1342  			tsens_s6_p2: s6-p2@df {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1343  				reg = <0xdf 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1344  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1345  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1346  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1347  			tsens_s7_p2: s7-p2@e0 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1348  				reg = <0xe0 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1349  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1350  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1351  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1352  			tsens_s8_p2: s8-p2@e0 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1353  				reg = <0xe0 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1354  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1355  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1356  
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1357  			tsens_s9_p2: s9-p2@e1 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1358  				reg = <0xe1 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1359  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1360  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1361  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1362  			tsens_s10_p2: s10-p2@e2 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1363  				reg = <0xe2 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1364  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1365  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1366  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1367  			tsens_s5_p2_backup: s5-p2-backup@e3 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1368  				reg = <0xe3 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1369  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1370  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1371  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1372  			tsens_mode_backup: mode-backup@e3 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1373  				reg = <0xe3 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1374  				bits = <6 2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1375  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1376  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1377  			tsens_s6_p2_backup: s6-p2-backup@e4 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1378  				reg = <0xe4 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1379  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1380  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1381  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1382  			tsens_s7_p2_backup: s7-p2-backup@e4 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1383  				reg = <0xe4 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1384  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1385  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1386  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1387  			tsens_s8_p2_backup: s8-p2-backup@e5 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1388  				reg = <0xe5 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1389  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1390  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1391  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1392  			tsens_s9_p2_backup: s9-p2-backup@e6 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1393  				reg = <0xe6 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1394  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1395  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1396  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1397  			tsens_s10_p2_backup: s10-p2-backup@e7 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1398  				reg = <0xe7 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1399  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1400  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1401  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1402  			tsens_base1_backup: base1-backup@440 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1403  				reg = <0x440 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1404  				bits = <0 8>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1405  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1406  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1407  			tsens_s0_p1_backup: s0-p1-backup@441 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1408  				reg = <0x441 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1409  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1410  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1411  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1412  			tsens_s1_p1_backup: s1-p1-backup@442 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1413  				reg = <0x441 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1414  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1415  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1416  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1417  			tsens_s2_p1_backup: s2-p1-backup@442 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1418  				reg = <0x442 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1419  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1420  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1421  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1422  			tsens_s3_p1_backup: s3-p1-backup@443 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1423  				reg = <0x443 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1424  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1425  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1426  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1427  			tsens_s4_p1_backup: s4-p1-backup@444 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1428  				reg = <0x444 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1429  				bits = <0 6>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  1430  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1431  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1432  			tsens_s5_p1_backup: s5-p1-backup@444 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1433  				reg = <0x444 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1434  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1435  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1436  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1437  			tsens_s6_p1_backup: s6-p1-backup@445 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1438  				reg = <0x445 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1439  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1440  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1441  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1442  			tsens_s7_p1_backup: s7-p1-backup@446 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1443  				reg = <0x446 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1444  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1445  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1446  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1447  			tsens_use_backup: use-backup@447 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1448  				reg = <0x447 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1449  				bits = <5 3>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1450  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1451  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1452  			tsens_s8_p1_backup: s8-p1-backup@448 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1453  				reg = <0x448 0x1>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1454  				bits = <0 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1455  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1456  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1457  			tsens_s9_p1_backup: s9-p1-backup@448 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1458  				reg = <0x448 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1459  				bits = <6 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1460  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1461  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1462  			tsens_s10_p1_backup: s10-p1-backup@449 {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1463  				reg = <0x449 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1464  				bits = <4 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1465  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1466  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1467  			tsens_base2_backup: base2-backup@44a {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1468  				reg = <0x44a 0x2>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1469  				bits = <2 8>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1470  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1471  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05  1472  			tsens_s0_p2_backup: s0-p2-backup@44b {
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1473  				reg = <0x44b 0x3>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1474  				bits = <2 6>;
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1475  			};
e108a3858e7dc7 arch/arm/boot/dts/qcom-msm8974.dtsi      Dmitry Baryshkov             2023-01-01  1476  
8bcf94778ed3f5 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-09-05 @1477  			tsens_s1_p2_backup: s1-p2-backup@44c {

:::::: The code at line 1297 was first introduced by commit
:::::: e108a3858e7dc7192f34b0b9fe2afc90d452407b ARM: dts: qcom-msm8974: specify per-sensor calibration cells

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
