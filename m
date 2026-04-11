Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B71B6CE9;
	Sat, 11 Apr 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775898503; cv=none; b=aq+G+niU8m6PmYDPGeGr6xbcYyGZk60GmegvBjIzKlgHah4rk/+/gDsU0Qg+KqrYnnVsbS0GTHsZKRcvcMF6dtwZ47yb/0Cg+567lyQw4HK6Vjz0rT4t25dZ+b7kFgNGIFRqrp9KoO++LSTGSW4XiTog7ZSlzy+gCPsouHtIVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775898503; c=relaxed/simple;
	bh=WXLhIIBQjRiMyeHXZHyORNpHnhBtzSzN0Hv660kO2IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0lP9QdSn3Si0R2g9cjnc/05Zl3ktiruEIEPwIrbj23Im2ITlLFrzixOOouN+84c4jO9Ir67igPAVlFwTnm321NGBoCOVXKFrh3lAXK8FGTVIgsHYltrJ+8FbCaXIsdoZC8aOFItOuAHujWczYNMPLTzrP4Z3mLbTFrbABHGb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAq++Pft; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAq++Pft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775898503; x=1807434503;
  h=date:from:to:cc:subject:message-id;
  bh=WXLhIIBQjRiMyeHXZHyORNpHnhBtzSzN0Hv660kO2IU=;
  b=XAq++PftNYNsCzH7twrdmWc32AbOIgMTB8oLk9+e6X1wU3IE6284AS45
   4Lb1sv3DsNs5lZvOZAaHb8g1gUDnIJoeDAdm4dDSrksUPOxZ4Vf7Bz3dI
   IluWEEz3TGeSX1iuZVk/crw8A99vwrSqjxQ4hivQd/UBTnlY9xwNQF5M6
   Twg8eirMUarxhJDBP2hBg1U3Mp6saLaJ2kwmvoXMpS8/OSFj62wAi92Va
   c8eyvNafmEQFKuf2vaiCc6ZrXwHHH/18Dj8qfcMx4ayMcLUXcytr8sxWE
   QhWvcGpj2HM+O0YcWooIK9kxnUhZfkAGHCvnX/GN9pDrM6BMLWWVaYlfk
   g==;
X-CSE-ConnectionGUID: Fl72/J43TVOqQ/G+JbWBLQ==
X-CSE-MsgGUID: 95mUe69ITE+DQtmEfDwxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75947680"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="75947680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 02:08:22 -0700
X-CSE-ConnectionGUID: qHgnhC3STDauAQ+9RKxHcw==
X-CSE-MsgGUID: PXpI48QxRoWjKaP8MOpZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228462592"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2026 02:08:20 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBUK7-0000000011R-2hso;
	Sat, 11 Apr 2026 09:08:15 +0000
Date: Sat, 11 Apr 2026 17:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:pld 5/11] ld.lld: error: undefined
 symbol: v4l2_fwnode_device_parse
Message-ID: <202604111705.kwsmT0KM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   eb7a465247c98700986d85aa41baadbd0734dead
commit: 00b2c5aa794c2da0ab85ba2ea8cece4e14bd3ecf [5/11] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
config: loongarch-randconfig-002-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111705.kwsmT0KM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111705.kwsmT0KM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111705.kwsmT0KM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_fwnode_device_parse
   >>> referenced by ipu-bridge.c
   >>>               drivers/media/pci/intel/ipu-bridge.o:(ipu_bridge_parse_ssdb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
