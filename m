Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED621FF1B5;
	Mon,  6 Jul 2026 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305187; cv=none; b=hu559QSffw5+VPor+q9s98z981KagmfBPYz5qyHm0OW5LpK/ttkaNxSWaP6kWrpd30J0EwJIgqIyEMVKnUaOeSQ2R4J6MiUm21ox5+sS+gTBfv1vOLqCAJeyb0hfIpRCBsaMqEuCXP1M4+jZcfrulmOARthQjgZZvqCYD9dkglY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305187; c=relaxed/simple;
	bh=IAy9LdMSgb0uZg//tiIqkRrX/2OgYxARyUu4PKwLyF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=adnyhOnSgUnJ7ArP22PViBq3pYCdz/OanwrfTkJjODmyQ2lQDj1RG7b0fabbout6i2mkdY2PKDTlLSNvltsMYWxdln0s4pGFNf8GQTFHdDSTrKWMhmjEHl/ltIhuKSMKqNckkYiYaMpmkZ7T/qJiVYvrpv/Y2YcqT5Ogmh4l7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXJ4RccT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXJ4RccT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783305184; x=1814841184;
  h=date:from:to:cc:subject:message-id;
  bh=IAy9LdMSgb0uZg//tiIqkRrX/2OgYxARyUu4PKwLyF0=;
  b=LXJ4RccTzuZuDJ37uoWBl24Dxa/tpOfsmvRhvGHlZSFH/bKCPKiQ/YYu
   gIbELelIXUyxDTUBvxB5B/JnS8EowYN0xi815em8dfDD/fVXhfrt6ZuF9
   9sPDCX54XAWkBac0ndHX4q+XatRc/3n7GViUUHsY8LfaYj1AY+RBU5Z0V
   9yRDPWQSv2dVslOyFJ3Jtrm8BJ3ZGrkVAIkRShYTDXcud12K1Ez/3Pxkf
   W7kKjndyORbfXgPnaR74BCR0j5HIBSp7QJlshMpfPnJx1Ep7wAA8Mgd9b
   vAzbJXWkyKy/r6xReOA2xRiQPYa/efs4i8/2bwvniTxi8SeFMYASHf749
   g==;
X-CSE-ConnectionGUID: Xq2glfKiTDC41ONMwGezcw==
X-CSE-MsgGUID: iX/WB8ncQD+meQ38Bg6fhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83802747"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83802747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 19:33:03 -0700
X-CSE-ConnectionGUID: NuCeuhseSXWe/Va1i9bc4w==
X-CSE-MsgGUID: gkQx88PtSXuREX9fhvN6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="276803915"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jul 2026 19:33:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgZ8l-00000000E1b-1jtx;
	Mon, 06 Jul 2026 02:32:59 +0000
Date: Mon, 06 Jul 2026 10:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/65] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/msm8960_fluid.dtb', needed by
 'arch/hexagon/boot/dts/'.
Message-ID: <202607061024.DMPwTWHh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   ef08242d98c508f43ee1f90745d10c61de4ee9ce
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/65] hexagon: update build system and Kconfig
config: hexagon-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061024.DMPwTWHh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061024.DMPwTWHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061024.DMPwTWHh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/msm8960_fluid.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.
--
>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/msm8960_fluid.dtb', needed by 'arch/hexagon/boot/dts/msm8960_fluid.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
