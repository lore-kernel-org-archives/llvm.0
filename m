Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214649;
	b=GoDHuc65HNIb+gvQnqynvubndHdiP9sN/Ofwa47ZjxJH+lz0SSxwGCZDLM1RjLblPnV8
	 1UPlhIO9CDZH4ksUcZwgbgoks4PeL7ssFRAY8/gLA/scTF+XeFf4ipAu45D1twl/uYBtS
	 TBtPyGQLVjiMKRDoQfqRYFNo5FXLahq2NT3cPbTvevFxJ7Tb0iNGa4HRkNvpYpF1sYhwQ
	 ZmNR5xUlnvFwXdF6EDhl+zD3Gqb2CF+SkZdxMdaqHmvsz7UYHJ2gjvvdPu1HY3P8VBUiX
	 tdPZJJxyiGUEc0koEDWinoSJ5bHIe5YjtvsjB8/1OPl2wci6TA80qq/3LdgPbm04+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0Sk1y8mnCQ7/wBJzu1WuZEta74bHDesvUVbnwAKRUs0=;
	b=ncZ8XnLBSXL85Q29U00psB0v3CnxfTBG6hJ9HCR//W2SuxA39aX+jaJi0Uf9Lb7gYGBn
	 Ez/WmwaBNamCX5HGTUNPrUhiZSZK+ZPk3SvKi1gFq14KveJLUsISSzLG6PHmvd36mUNuJ
	 uxO32eY0go2pv/Q7UN1qBj4mZln4HbOw5qf6zoI74I36yzQC/e1RTviMe3qcfaCSTAaVN
	 K6aWN4tm9oE5RBOZVYM5zaB9/ww0LKqMl0XeHO1Za8IeLkSXxVXJgrMeX240AW6F7u1i+
	 gSlVpgHRg0CtuY1pDUbMzTC4UXxMLbfkIGkpycPrAo9hR18A8cPji5f8GkB9mzfSrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPyjBoM1;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02D606A32D;
	Wed, 28 Oct 2026 19:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C02D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPyjBoM1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793214647; x=1824750647;
  h=date:from:to:cc:subject:message-id;
  bh=aKLR/f190e8+2IMZITKKO4iudwp7EDYKEGW5uLDdX9c=;
  b=EPyjBoM1aRMeB6Y753lB8ok4Ki+bj6/USYjaQJBxi/FhXapobjrkfRUT
   DEguo11RpwRw8am1cSK2qg77dDmhOoXDNmji7w7WkMPe9UwqlQtaHWHmg
   I95gGyOxFD3tvzIaTD+BxZWvY5Gn0aUyZcTWeDMvX6TanNjLlRJdx+w7G
   gSDzQbLXD84sTooCGLiBoxcX/WnuXLTFsQukJCjW9J2bu/ZCIK98NCdPK
   xibKiTJmulcl/Mph6fmkfyAzfy3fbqywbRHnNXKlIreVjvvNySlJ5u2qd
   zVWzGDk3AW+gRJcgtlUjk00HyHKLf4KWmaW6ax2tSITp6r9tXd+88NJQW
   w==;
X-CSE-ConnectionGUID: qamFHy13TOSvonnubNG4aQ==
X-CSE-MsgGUID: UFQo951DSNytgcXOYIN0pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1960775"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1960775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:10:46 -0700
X-CSE-ConnectionGUID: qPpn16mcQ/yOed7vFcPbiQ==
X-CSE-MsgGUID: hYfqyVPASJSipPh6smiG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5292106"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2026 12:10:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM92n-00000000Z8w-3gcF;
	Wed, 28 Oct 2026 19:10:41 +0000
Date: Thu, 29 Oct 2026 03:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
Message-ID: <202610290223.iOEGeDs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
commit: 7a097aba725501c399b5e93d0199aa3a2f6e9c88 clocksource/drivers/timer-mediatek: Convert to OF probing
date:   2 weeks ago
config: x86_64-buildonly-randconfig-1001-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290223.iOEGeDs2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290223.iOEGeDs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [m]:
   - COMMON_CLK_MT8173_MFGTOP [=m] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=m] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
