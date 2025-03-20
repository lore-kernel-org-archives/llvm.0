Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58D635;
	Thu, 20 Mar 2025 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742507193; cv=none; b=EELrV6xmv0ypI+HfoQ6G3cAup1q4CZhVVE3NUuKnN+R6+v/0fsgfeZUmh4OLn5PSnSxyfyZ+ffCHS3nnn+hcXpgLHXN+AX/ML89qinvIfRCxLh8IisKbtLb50zwFb4EaWD1/6xORiwQeyv7/Lw6qB+F6kdLSg006CDpPuxBQ0xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742507193; c=relaxed/simple;
	bh=9Byc964pxhUaAhKovh4CftsUbmVSiTY00WCTsiiyOVY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4wKBcu/TbuBzCWsRwX2G21HjxLlMgIwgr1tYVirmYMoFiH6nnMohCZ+2QwaQ8JwjSGCllGqK2QJ664E/CUrHXFWwogf3qKKet4UVRFxQlz5SM9coPBOuAo6WqGqsar92Yz7pnE14SEJ47Aa/5oi73AvCpgg8SFjJrvZEvH2ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rs7LL6lh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rs7LL6lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742507191; x=1774043191;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9Byc964pxhUaAhKovh4CftsUbmVSiTY00WCTsiiyOVY=;
  b=Rs7LL6lhd83U9CpHzWso2mcQ5qehMybSSgs5OV8ajcIv3jmghTTD4NT0
   7/Uf3dlLrz8JTqrduNdKaGoTFwMOYCpOZ95rDPTmo3VU8eMlXaiYtcdJv
   ustOEzN7EeyyO8RrJGuQhUk2ApNlU532VsiiKHU1+58dHOBYkJnz+WOd2
   oolo+5zKanimMIAUGKk3SPWyqXFEtC4PGdF9n+Zx6l363BLu88pf5avw5
   br8hy2v4cwjHTk2jIfqu1ijqLIVLcl09HNQL9CpF2pnkzbiR71IE0mo5d
   9eTErL3woF9N4irP2OEGJCGIJBMtS9rdPjIQUHNYQHlzpVlPmfMuzQevt
   w==;
X-CSE-ConnectionGUID: UzAAdoNKT9GzbtjS6seepw==
X-CSE-MsgGUID: uJAKLYEnQhOj+cZaley//A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="46517509"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="46517509"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 14:46:30 -0700
X-CSE-ConnectionGUID: 0eJpeaemQ+Wova1e/DcSKg==
X-CSE-MsgGUID: M+3Cw4bMTiySBBVXBJys/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="160449883"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2025 14:46:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvNid-0000nR-0M;
	Thu, 20 Mar 2025 21:46:27 +0000
Date: Fri, 21 Mar 2025 05:45:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 12415/12447] ld.lld: error:
 vmlinux.a(drivers/mtd/nand/raw/mxic_nand.o):(function mxic_nfc_probe:
 .text+0x40): relocation R_RISCV_HI20 out of range: 532494 is not in
 [-524288, 524287]; references '.L.str.2'
Message-ID: <202503210554.Ev3AWyDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: 18be46da1ee6d73802732871286ab064aba5f5c8 [12415/12447] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
config: riscv-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210554.Ev3AWyDs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210554.Ev3AWyDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210554.Ev3AWyDs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/mtd/nand/raw/mxic_nand.o):(function mxic_nfc_probe: .text+0x40): relocation R_RISCV_HI20 out of range: 532494 is not in [-524288, 524287]; references '.L.str.2'
   >>> referenced by mxic_nand.c:488 (drivers/mtd/nand/raw/mxic_nand.c:488)
   >>> defined in vmlinux.a(drivers/mtd/nand/raw/mxic_nand.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-vdo/indexer/index-page-map.o):(function uds_make_index_page_map: .text+0x1a): relocation R_RISCV_HI20 out of range: 532330 is not in [-524288, 524287]; references '.L.str'
   >>> referenced by index-page-map.c:39 (drivers/md/dm-vdo/indexer/index-page-map.c:39)
   >>> defined in vmlinux.a(drivers/md/dm-vdo/indexer/index-page-map.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-vdo/indexer/index-page-map.o):(function uds_make_index_page_map: .text+0x5c): relocation R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references '.L.str.1'
   >>> referenced by memory-alloc.h:56 (drivers/md/dm-vdo/memory-alloc.h:56)
   >>> defined in vmlinux.a(drivers/md/dm-vdo/indexer/index-page-map.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
