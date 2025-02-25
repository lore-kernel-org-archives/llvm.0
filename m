Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D55257420;
	Tue, 25 Feb 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491450; cv=none; b=mFFadRsUOXTXrvph8YUHGTY9cOEqBc45ZMwjnmxrGgngApH9MWNyztkYMXHIHbocDNmjmFTHSgL/lFqoPTcnTFEMRutJmlaP3z6oFFLKjsxkiBUOrOdd6T0VOuLVfFKnWyj8q5sQ+qhbU2HMHobcaTwMRgSjxR50LcHQCg0Hh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491450; c=relaxed/simple;
	bh=EplWSkN/CDrXcgxOnexw9cGdfCrzPg/MFWJVSrpfllY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F40K9I2JjYpF4MYaMJj6BrdUvS+2KH/dNbocf4UR4pSmeiSWN20SD5cv4BEeT3/l6s5g0lR15o0Li9jTyxiBGsn0YPm8uhykwGjBxkCyZQUSSSXwxi3FYMCWVzOP72GdN0fGf3/COc3/bnsZAeevLKOyH1xNwEwxlBl7bwdufCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLHNyll8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLHNyll8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740491449; x=1772027449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EplWSkN/CDrXcgxOnexw9cGdfCrzPg/MFWJVSrpfllY=;
  b=SLHNyll8BvYxTWhzDlIk4AcBNIMQLPCfdLJ622Sg2DZXLI6mKB7Kw18G
   E8r8ym+ngTchYZRhQqMiJ22K8nvGKliAKsBwWrEMhYPcRhEGWSlZlC3EZ
   YJ23kYfm1FKbLjlIBZ17jMFig+HcYM1B5HZw9S5bJYhkYA6aZ9IsR+lZO
   iv5u2jBgYre9zvnG3SqcRZsyTdjZpz0oze2VXs/2cqgG/QBq3lRP9Cku8
   8Yc8zvvm98Oau0vGRX1/es4vNjkEptT1CbC7XeCjSNLeavLho7Mf1yFpv
   B7ucCH3Y0OS+A96ION9HJxq9uWTJd4+1dEx6l92YtkvUUoTidAhKHdiW8
   A==;
X-CSE-ConnectionGUID: 723lEH8pThyKUI4iTcuM1g==
X-CSE-MsgGUID: Wy6laBZRSfC6cp89P8eGjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41423080"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41423080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:50:48 -0800
X-CSE-ConnectionGUID: q6kABqEKQK2YYjvk8VobBg==
X-CSE-MsgGUID: yKvXQIimSPK8Uop0r/xREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116585647"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Feb 2025 05:50:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmvKe-000AJb-36;
	Tue, 25 Feb 2025 13:50:44 +0000
Date: Tue, 25 Feb 2025 21:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5789/6192]
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1212.7-1220.4: Warning
 (graph_child_address): /soc/syscon@1c01d000/port: graph node has single
 child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202502252142.FtImoMPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0226d0ce98a477937ed295fb7df4cc30b46fc304
commit: be06e25e3cf6056efb53a8c8cfd1aa1a1cc8fdc7 [5789/6192] arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
config: arm64-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250225/202502252142.FtImoMPk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502252142.FtImoMPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502252142.FtImoMPk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1212.7-1220.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1212 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi

  1210	
  1211	&vdosys0 {
> 1212		port {
  1213			#address-cells = <1>;
  1214			#size-cells = <0>;
  1215	
  1216			vdosys0_ep_main: endpoint@0 {
  1217				reg = <0>;
  1218				remote-endpoint = <&ovl0_in>;
  1219			};
  1220		};
  1221	};
  1222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
