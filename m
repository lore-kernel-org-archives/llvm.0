Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AE288C9B;
	Wed,  7 May 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623991; cv=none; b=iziUXmCeW0MEOdscMFHnKsGBs74jiTYr24G/+/6wMSsrjbtV4W63ACRmTwEzcs9+fD/YFB4xmTyC9wRtZ7uJs1fDZB/G6ORXLgUqH7w6wBFHiWR5QIxGymcyyUJV2c7hXYwHh31+Mb5oMmHKbMf42gNhbC12Q2ZvvwWc8FYnQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623991; c=relaxed/simple;
	bh=lxcxd1d7z6u5zopMT/B2mFVfe4ha2mn7FLJuRhiI3Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9O2lh8YuI3JvhUEpJEr9wfRaz7phQlkpwMrAoc1qg3ELG7zILsRiY+gj/mLe9KPOzUH2p3V4HEayYTkvPtTiC4FoX84FprAl0Bem8uSPhl054EPSldM8HfGpbkLdMyHzQUbvbuw5t75mOM0LZAYN+8xpyXS+rX3aCTV84y5vWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTv1d7OP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTv1d7OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623989; x=1778159989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxcxd1d7z6u5zopMT/B2mFVfe4ha2mn7FLJuRhiI3Xc=;
  b=PTv1d7OPtpA9WlsHFcxj8RPbgdU7KAzbtGNjSztx2L5Y5ma5s6n9hhmZ
   sT3CLsOENZ8I7gZCilTDH2prsiFwr6y+NinZdi/h1flg/HK6DSpyKnIUC
   scyiKWoxzkJNJQEcln5+P8Vp5ot/0UAGozGK0XRmYYSyoi2HR11dIANKJ
   tIeW3NgIbgrAGcDd9se5Z/gHeF33+wUp/BciYPfEXIjGbXG3/mAnJMKDp
   jmHEFjer0OXtPGDODSTMgg/NA7GmJ4H2NOvE8c6DiG0ZKCDorIaV9dfu/
   BadNNnQj4+mohCp4H6ONLJ8s6Ds23FkU+nJrLgngBAxHDlpHmq3/Aap+5
   w==;
X-CSE-ConnectionGUID: Wfsg5kTMQ+SCojDwaGEwRw==
X-CSE-MsgGUID: NQRW0f2iSNWD0vz5UsULLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59747964"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59747964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:19:49 -0700
X-CSE-ConnectionGUID: 8PHJSQoNS0KfAMkJ4BKcjw==
X-CSE-MsgGUID: oRH2JqjMR623jb1p8Q975Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141079314"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 06:19:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCegb-0007rn-1G;
	Wed, 07 May 2025 13:19:45 +0000
Date: Wed, 7 May 2025 21:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 5000/9308]
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1118.7-1126.4:
 Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has
 single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202505072112.W1kvpswg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 21ce58965454c9e4c194fa0d554ab96f69fd4a95 [5000/9308] arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
config: arm64-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250507/202505072112.W1kvpswg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072112.W1kvpswg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072112.W1kvpswg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1118.7-1126.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1118 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts

  1116	
  1117	&vdosys0 {
> 1118		port {
  1119			#address-cells = <1>;
  1120			#size-cells = <0>;
  1121	
  1122			vdosys0_ep_main: endpoint@0 {
  1123				reg = <0>;
  1124				remote-endpoint = <&ovl0_in>;
  1125			};
  1126		};
  1127	};
  1128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
