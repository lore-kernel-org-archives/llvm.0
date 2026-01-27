Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FFE2EBDCD;
	Tue, 27 Jan 2026 23:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769556483; cv=none; b=O8OguoskY3tykBxHbKu7Hr+RGCFolP8brk5i4Uutp3m0j2bTFmMXqo9ekFejlg4E0xMWIOQdlF73Pl3ngC+GYZ7TbxO/NisAqXY0URyBQwh/jQeDHeym7wW98QnadFYdbW+i9NfIsijC2P9qsYtzqVKsXcOovwP3XvS3G+joPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769556483; c=relaxed/simple;
	bh=UGptlQyeKfOxXgV3SIKR4NsRk0rkf9t8cpvUnb7ozlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dRcr6nw8MtVneC4dAvbFwjslQRJY69HhBNMYS24yf8IPYyI7Screu7AX7Acu3hi+zes1HuuTWPxBs+GOlvAZ/8Z5hwvLeEmshwLQEGR9e6sNlpXImgoo5v/fjllVAH6oQi2evJXMHXQAhxDKonqLjxq6oqpfCSwWg8XgcB4diWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDnyJnLx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDnyJnLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769556482; x=1801092482;
  h=date:from:to:cc:subject:message-id;
  bh=UGptlQyeKfOxXgV3SIKR4NsRk0rkf9t8cpvUnb7ozlU=;
  b=PDnyJnLxc1xfUzyJkDIx2bFfTOBRH6uQtOB/nETHiP+xjGhD3/x7j4zp
   1mT2BGdjPUICovcQpjwowsa6cTn2qY5clrCWFrCmllu5sT3+zM34U/QMg
   ESjuX5eFdbshuEs3z8IoRiTtYmsAj70lNvX2+TFHN40EXHKcFIgylq5fU
   VEVNabZX6XdxQIaMAEEzKNoP368SHEu54xuMuewOYpbxmkTNh8fePPCTe
   JPQQZbfcBWuaA0EEKkpKZ8M8JbqM7ge9IJ1mX7eo0ZSShNq4QExbL3baa
   a+09sgsyukju/i9hX/iTECvNSw75BJi7bjYX1e2PNTRggtVZd19NtvK0G
   Q==;
X-CSE-ConnectionGUID: YRsGmZKGR1uDYxwjn2KU8w==
X-CSE-MsgGUID: LeFw+iQMTjC575IWqogUVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74625570"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74625570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 15:28:02 -0800
X-CSE-ConnectionGUID: FKV9uuHjTUuC0v6pW3wkDQ==
X-CSE-MsgGUID: +wndw+71TByVzCQ6KiYvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="239367171"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 15:28:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vksTV-00000000Z1c-2n4m;
	Tue, 27 Jan 2026 23:27:57 +0000
Date: Wed, 28 Jan 2026 07:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/38] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/msm8960_fluid.dtb', needed by
 'arch/hexagon/boot/dts/'.
Message-ID: <202601280710.78BAV0sX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 78951630122eae2f9915fda71077ecd729f34ff0 [20/38] hexagon: update build system and Kconfig
config: hexagon-randconfig-001-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280710.78BAV0sX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280710.78BAV0sX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280710.78BAV0sX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/msm8960_fluid.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_GPIO
   Depends on [n]: GPIOLIB [=y] && DEBUG_KERNEL [=n]
   Selected by [y]:
   - HEXAGON_MSM8960_FLUID [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
