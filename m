Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09010F2;
	Fri, 26 Dec 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766790975; cv=none; b=pDNFjdqdZeZeSjEX8u5MQrh836RWO8f8jB3B9k9NwuX+R2Nnk82L73yn/6iHVgP4/Y5YQVpDfSzQUXRalBoUMHi1iDHuLuaR+FND1egWhSfitoWIgpNfxc9j9RTxQuPROBHIOZe214JGOSPuEjcRJAB38AtKWsiVdfdfsMql2KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766790975; c=relaxed/simple;
	bh=anaGW9Bbm2ACT37t2VRPr7sxQCiUrOs7EwtvDPWOEEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aMJHzRRc8j/oPaas62eXVvYbetJrPLdNEhxqksUwMphZJ3wuVMUPinLtsJ9CuIcQRBnLOrZSUcyo7sJUW4nPZtQVQ3KAjcd7v+tW4UmWqzBnWT/8g2McsdUDYfKmTpCbE9UO37XU3O6+65mzjUHKyy9jgVKKCdfsi5SFcKallTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXGcK5DF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXGcK5DF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766790974; x=1798326974;
  h=date:from:to:cc:subject:message-id;
  bh=anaGW9Bbm2ACT37t2VRPr7sxQCiUrOs7EwtvDPWOEEs=;
  b=mXGcK5DFT8YouobM8RFDmcN0DOe9TXQ+0lRpoXdIyYSmb7X+q2v+f4DL
   myhlgyojZ8Or/0wtr7fYTUFMLSCSzKAhPbhmrNak9MaaxfZLNPWG5N2y3
   KQUTYNsYvKwU3t/qFZPxmIyqBlpNMlULldBF+QwBRWIdINvJlO7whvc5v
   Sa8cbeHu2tUIDGwydy085nF+/jmdOlZ5jCL3WmIu7ODor5j64OsUBoHcW
   Y5ix/s4Vwt5dPW1c1FrWKpoafBkPw8A5aF5zIsm3VxchoQVj0qZ3JEofj
   pdBKFh8bpcvay7EZLaqloF4gpv7aIIO10cqdVjDZxLfSyl4SaF59hux+n
   Q==;
X-CSE-ConnectionGUID: 9Bs/cGMRQImyVoGYxJORLw==
X-CSE-MsgGUID: kYUMmZuERnSXY0Bh9K4yGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72153218"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72153218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 15:16:13 -0800
X-CSE-ConnectionGUID: r28wB4HjS4WSIrh+YOlQAg==
X-CSE-MsgGUID: DMj5hAb8SbeX+23tF7QhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="204951992"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Dec 2025 15:16:12 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZH2X-000000005Ph-2l4u;
	Fri, 26 Dec 2025 23:16:09 +0000
Date: Sat, 27 Dec 2025 07:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 14/15] ld.lld: error: relocation
 R_X86_64_64 cannot be used against local symbol; recompile with -fPIC
Message-ID: <202512270750.hPl6ROIm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   f791cf0de03ecd9de38c47bd23da4125e24da4ab
commit: 95e958e5be7cab4221f830d1cddfff8d799dfffd [14/15] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-randconfig-072-20251226 (https://download.01.org/0day-ci/archive/20251227/202512270750.hPl6ROIm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270750.hPl6ROIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512270750.hPl6ROIm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/x86/kernel/head_64.o)
   >>> referenced by arch/x86/kernel/head_64.o:(.init.rodata+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
