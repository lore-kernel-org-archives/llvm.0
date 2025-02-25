Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F619D090;
	Tue, 25 Feb 2025 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503700; cv=none; b=TuOPxwJI0bo2izLDq5hTSUKoP4hSiawb33aLM6JC6/t2Umecdpi3rmv8KiIHemdKrVj3+yb1OZgGmTqK8oOlHXSfEYorv8X444Uv55ds1QJidN1gEsfCS6rdqwYz6w+NoIJ26f11r9T/MKwyyaNRYQ+jmWOE+EDhf5oshWqAo/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503700; c=relaxed/simple;
	bh=OLKkjultT1zXTGZSKS74Ube4MpmjjljjG8Pkqnu5TvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbxSgnOXsY0bqnRTx7s9gLIJaDudoH98ek9XbhS9k2WmNZjlzI08kl3KB9Q2jibjDs0k37GyJC38g6jKh2yaOMf0bWVwEfAz7VwqgVbvDuf563tw8RqYY+DKC/kSpRecx6LwhJ8qcXMVRN7VGL2jCDdEorDnVNBLR8fxHudW85U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kORzDd9K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kORzDd9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740503699; x=1772039699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLKkjultT1zXTGZSKS74Ube4MpmjjljjG8Pkqnu5TvE=;
  b=kORzDd9KsS7ygmzZDpzwCelrZX+/E0HBvOY+Drmmqh9rDKoPvlWCx6hh
   avHO9o17wZJp1B3pNfRxS3SjFjF6yc0a7972b3M6HAJj+FtDQNRZq8vQ4
   FEKHtsRugvFiUGTiKUGRBhVAheyC9N+MT42iqoB9fWmfqCMbVFYsBBza1
   b/oER2gehs49Nsigtz5Og46LIdA33xd3jo/t+x8MlHH3Ca7QXmDxX9Uux
   3/r24m64BnKAGpOeg6T4x986XwDv0vvcnR1oIqMcH5bo9g7SxA+bzNbFb
   jaJTtyyetLRp95/sFh7OOAE0EIStxYTmJu8eR7xuV3LGwlVMVpO+HFOom
   w==;
X-CSE-ConnectionGUID: kzqw6G+7Q+myk4//6ghsLA==
X-CSE-MsgGUID: 2Ijh5giWQbSoaj/l8qE0aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58742603"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="58742603"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 09:14:58 -0800
X-CSE-ConnectionGUID: HguiF6MXRq+XtXItGrtbug==
X-CSE-MsgGUID: bS+b3effSqK2/xdeDYNkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120559805"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 09:14:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmyWE-000AXf-2w;
	Tue, 25 Feb 2025 17:14:54 +0000
Date: Wed, 26 Feb 2025 01:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5790/6192]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning
 (graph_child_address): /soc/syscon@1c01d000/port: graph node has single
 child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202502260126.hK8WJ5uq-lkp@intel.com>
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
commit: 3897131ba0eb5bf7d077ae5c461cd8b673df9a6a [5790/6192] arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
config: arm64-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250226/202502260126.hK8WJ5uq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502260126.hK8WJ5uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502260126.hK8WJ5uq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1256 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

  1254	
  1255	&vdosys0 {
> 1256		port {
  1257			#address-cells = <1>;
  1258			#size-cells = <0>;
  1259	
  1260			vdosys0_ep_main: endpoint@0 {
  1261				reg = <0>;
  1262				remote-endpoint = <&ovl0_in>;
  1263			};
  1264		};
  1265	};
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
