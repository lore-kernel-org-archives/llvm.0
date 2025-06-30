Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F375428C037;
	Mon, 30 Jun 2025 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293381; cv=none; b=NjC7eAqWNPNTMZrR47xPXB2/o7tWrgTKEyElcuOBozBx/Kh4SLypMb0ahMC9FnZ1VYs/rfW194NMVhagVirji9AvkAyDXCCy/6Nej3r15WqKZDtk1tLoxfhPnX3IW72tz9ppXL2S+kETYaLs5d20X/VtmSl+20+bqoqDCBIMGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293381; c=relaxed/simple;
	bh=w14eEZ/zg+hqTdzOPY2gaieWf5JUv1WnpYU89uhLNyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKGyqGBzTGUFRxVYc3/6IVquMXwTvYtPpDHCkxm5N8FW24P/9NOKCK8vw2U0rl5q2cGEJV/Ft4G0Y1oavd7Up5i1nvB8nt7B6NqcV+nJxI9Q5P+3BDonGEv93G/y4+6UQ4QjpYOlnfCnA8zKddw4wGFrTR612fN0T8u8rQvouwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ia2XhOqX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ia2XhOqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751293380; x=1782829380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w14eEZ/zg+hqTdzOPY2gaieWf5JUv1WnpYU89uhLNyk=;
  b=ia2XhOqXLK+1B/KreDNV+sXmPdnMNh4pd2ehcvyD4e06cTrgvBWUGsoD
   tUloS+F1pfXh3uOyajjIreO+Joy/u1ygmfPZi2il9p5eCADdPH4ZveyCG
   iaVM860jlM/zTtZlmnjigGBMuF7FGm5fGin9Iu3djw5fI/s3/IGeaM8Vy
   fYhZtWmfD1JFIF6KgKD1+9IcKBeqBSYJLUDQcaQJCI8W4Nvy1cvdRfETB
   sxPb5CQeOvi7MOnoJCrAD+Zn/whG72p1UbvPTxIVWSf5lnCztkjABi0RQ
   XGMM01E2sfsgAnzmhg+czlO9l9quHPQM9LXB3G1PHrpXeD14krNhVn/JX
   g==;
X-CSE-ConnectionGUID: ThjzyCSNQ0GUA/PFSTuMcQ==
X-CSE-MsgGUID: STSEIdeKTZK0A4ARDxM+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57298317"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57298317"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:23:00 -0700
X-CSE-ConnectionGUID: 1JrWuOmUSvCv9ODpECv1JA==
X-CSE-MsgGUID: AyaCAb46Q1qBhCjPaMnZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153223420"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 07:22:58 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWFPL-0001E7-2j;
	Mon, 30 Jun 2025 14:22:55 +0000
Date: Mon, 30 Jun 2025 16:22:36 +0200
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 2933/6007]
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning
 (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202506301614.OKDuZ3Vc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: 79b896e7da7e2743fc930d260bcecd1e84a003c4 [2933/6007] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
config: arm64-randconfig-2003-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301614.OKDuZ3Vc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301614.OKDuZ3Vc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301614.OKDuZ3Vc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:987.27-1061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)

vim +111 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts

   107	
   108	&blsp1_i2c2 {
   109		status = "okay";
   110	
 > 111		led-controller@30 {
   112			compatible = "kinetic,ktd2026";
   113			reg = <0x30>;
   114			#address-cells = <1>;
   115			#size-cells = <0>;
   116	
   117			multi-led {
   118				color = <LED_COLOR_ID_RGB>;
   119				function = LED_FUNCTION_STATUS;
   120	
   121				#address-cells = <1>;
   122				#size-cells = <0>;
   123	
   124				led@0 {
   125					reg = <0>;
   126					color = <LED_COLOR_ID_RED>;
   127				};
   128	
   129				led@1 {
   130					reg = <1>;
   131					color = <LED_COLOR_ID_GREEN>;
   132				};
   133	
   134				led@2 {
   135					reg = <2>;
   136					color = <LED_COLOR_ID_BLUE>;
   137				};
   138			};
   139		};
   140	};
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
