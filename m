Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE97764E;
	Wed,  7 Feb 2024 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316562; cv=none; b=KPxi30IYyXAAkGssFE95HLXfehhyRDufjUXFceYaqNX4K1YJc/Jsbx9owrMgrrv/D4rnlesiUbVBqlAFmIsgsaxYi8fiBJkgix72/zH99/HfOCH/66HgZjxxDuC2LW3gbWFVMzLJcCB9HxPAnVoMmDpw7+DC6YrgZyUhDvwFL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316562; c=relaxed/simple;
	bh=/TAblK9v+TrsBlF/Cca5EDrFRCOPJ2RO4e2iF4Vks0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H01uo+i27vyrzqrUTvY4+OGZoTjHTd310wgec2KTdKlzc3jbiL1l64IwJtWm7ZRkG8EeLDweKO55q+WGTnEMOCZWzoy/QiAYqaj/iJ1Mq+Fgk6vBBmh9SFu8G/XnpvbHk1dmfuK8AjhwSxMhH8Z9Y0UErpPmKQ4f9ESujzyEH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaTWGLba; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaTWGLba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707316561; x=1738852561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TAblK9v+TrsBlF/Cca5EDrFRCOPJ2RO4e2iF4Vks0o=;
  b=TaTWGLbavY006XKljuGZRw8ZE2JCrrveuHsY+98A9SsBwYWljRGSKqsP
   ydtJF0JXXHH/V4mK3bcboqQIcDD/IOwDStpRrqfofe9Gm+0yTUilxLXHS
   onnsmj0NxxrHQeApKYw2at4rBkaBLA88acnGh+96omktlGwJ/4RvtOMEh
   r9jd594/1wUkb512+vRJly95O3dUWYKKxDOqXXyRTCwR5XlwY6IySMM2b
   lYRaGdOaundSjHgXWylNBI+SW4y2XdlO7AsRj2ksHP6Ry55dsug1+2tB4
   cKsk5Ma7vkkv2snFfJXWNsjV604ARmOyNEkCLzgcD/sTEIk3cpZ27nwM9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1278011"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1278011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 06:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="933791571"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="933791571"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2024 06:35:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXj1o-0002iU-0P;
	Wed, 07 Feb 2024 14:35:56 +0000
Date: Wed, 7 Feb 2024 22:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4542/4898] Error:
 arch/riscv/boot/dts/microchip/mpfs.dtsi:425.36-37 syntax error
Message-ID: <202402072207.rcj2jGLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: 6c7353836a91b1479e6b81791cdc163fb04b4834 [4542/4898] riscv: dts: microchip: add missing CAN bus clocks
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240207/202402072207.rcj2jGLE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402072207.rcj2jGLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402072207.rcj2jGLE-lkp@intel.com/

Note: the linux-next/master HEAD 2ae0a045e6814c8c1d676d6153c605a65746aa29 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/microchip/mpfs.dtsi:425.36-37 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
