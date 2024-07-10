Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648E1B86FC;
	Wed, 10 Jul 2024 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592599; cv=none; b=hyvQtfES1NUOs3eBRm6rc/W7ys2uEXwVCvYZsxHqlC4FVqNZvt72GtTwCdSCihfIfwhyxINOrtvE/ccw9TYdooM0xtK8dHbzGEQYCegi+xasgHOokJWGlXBM7sirlyCUo8+3GBQB3DLbzzybwpMpatShTpotBluN89M/YdcF0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592599; c=relaxed/simple;
	bh=/TvsurnhB6C/PUGJHAdCkcNeId66og3TYCf/6A7k1Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYH/aJmz5mEtmdFjjMVdsPnAddLaXAeNMCX/BUCgZUOKReoGJf5Obw3gy3mmIVPyrA2a1n79I2ymT7HvIHa7l8O11ZrC2i5+TApbGomCpVcABOblFET3E97sSfmFW8a/LbPY2mcEHOcqKu5WUhXP32S71C2WOo6kVt1EitZpmvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHO5HmiC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHO5HmiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720592598; x=1752128598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TvsurnhB6C/PUGJHAdCkcNeId66og3TYCf/6A7k1Vk=;
  b=bHO5HmiCKPoiWRnimx8iqRGzh9NNzoTKFwltaM9H6wB/XzbJOUXjKjzH
   w+n11RWUgDL0TpoYIUoDddqO2dne38IpvtcXtmbfzwi7Zb4Mq+UR7jfxq
   2fbh6tcu3yi/UpbzgalevBshrxMgmsff20oQaOHupCOEwfFrRPsWGmXBl
   Xewq/itfBzcYrIN6Dl1GCvI5esrG/C1Nni3wHlOQglHrXvCi9bXXRzxMC
   lBo7eTpEnqFt2nLmChtAqP/SNCsXMx72jGW50EVCf5WTQOtbDFkfl9zs0
   u4tsUB/R/roF6dabT7Qzh+B3CUEKSm5mAJYLHN2cOaZjXbKh5hEnMtZBs
   w==;
X-CSE-ConnectionGUID: ElF4GabhSACMOFaNSmFbjA==
X-CSE-MsgGUID: 19BEwVXxRKG0k9Bap5Ml+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21759579"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="21759579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 23:23:17 -0700
X-CSE-ConnectionGUID: XSaCXtgrTXCM6w69irxJVg==
X-CSE-MsgGUID: FeCYn0BSTOq2FkzdGUZzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="52392384"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2024 23:23:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRQjR-000XXC-2Z;
	Wed, 10 Jul 2024 06:23:13 +0000
Date: Wed, 10 Jul 2024 14:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 2/3] ld.lld: error: relocation R_PPC_ADDR16_HI
 cannot be used against symbol 'init_task'; recompile with -fPIC
Message-ID: <202407101447.efuvkKx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   6f965980c14d57134111fba4732a34e957364a1f
commit: 3d122ee2c2b04ba7d8efb548c2fec189488f6e98 [2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
config: powerpc-randconfig-002-20240710 (https://download.01.org/0day-ci/archive/20240710/202407101447.efuvkKx3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101447.efuvkKx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407101447.efuvkKx3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_44x.S:100 (arch/powerpc/kernel/head_44x.S:100)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x3E) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_44x.S:101 (arch/powerpc/kernel/head_44x.S:101)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x42) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'abatron_pteptrs'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/nohash/mmu_context.o)
   >>> referenced by head_44x.S:212 (arch/powerpc/kernel/head_44x.S:212)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xBE) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'abatron_pteptrs'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/nohash/mmu_context.o)
   >>> referenced by head_44x.S:213 (arch/powerpc/kernel/head_44x.S:213)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xC2) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'start_kernel'; recompile with -fPIC
   >>> defined in vmlinux.a(init/main.o)
   >>> referenced by head_44x.S:224 (arch/powerpc/kernel/head_44x.S:224)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xDE) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'start_kernel'; recompile with -fPIC
   >>> defined in vmlinux.a(init/main.o)
   >>> referenced by head_44x.S:225 (arch/powerpc/kernel/head_44x.S:225)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xE2) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:251 (arch/powerpc/kernel/head_44x.S:251)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x106) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:251 (arch/powerpc/kernel/head_44x.S:251)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x10A) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:254 (arch/powerpc/kernel/head_44x.S:254)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x286) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:254 (arch/powerpc/kernel/head_44x.S:254)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x28A) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'mcheckirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:256 (arch/powerpc/kernel/head_44x.S:256)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x406) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
