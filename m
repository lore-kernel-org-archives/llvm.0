Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343A3546C9;
	Mon, 13 Jul 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925128; cv=none; b=RVeBucZ4m5rpPJWNdoqamXQSh+dAg9Whw0lQoyJLgu4mCwnm56yH1016onG9IvUfoOroY5c8zvnk9d/5IquySvfAuT2f1e5ettaxhT+dm51ZHfXSSUUIKkLYamzvSrFUVup0iEykJPs1IlQP7QPA1NZ6QoMuJQgy4rkzRE1/3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925128; c=relaxed/simple;
	bh=nN7IJMZYwplKN8WjFvXZwy8KMaUfBhZ5tjuyBfrurn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rP051H0i+7JIHcfbKrbmS+enP8mt1d3brE8yvKwS4w+dmf8MCavBeNUIvV3k5i3PSOHiuEtiHSX//YmCOC3FAcLrETKHlvBIbvSISVRvi4k/vrBMqt6nvDlNal/Boj2LY+7zbeoVO8GAGOJWZqrzYPpZbztaLoyiAUAII4gr64E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qws0X5AQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qws0X5AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783925126; x=1815461126;
  h=date:from:to:cc:subject:message-id;
  bh=nN7IJMZYwplKN8WjFvXZwy8KMaUfBhZ5tjuyBfrurn8=;
  b=Qws0X5AQV4JWqXH+nwU/G8jAdmbWCHYR+6658LxioH6rOtm5IuW1dFlN
   NeMoxYNMh81PWR1U5H1q46d441zflWEync0zc3o/oo52WEFdvvgRAjd8t
   jHHQx5E0tUTCsyoF4wnbnw7M6jxJHTXAMzTJjAwiQAehMXSnYqUwL2b2Z
   zfBm6AtVyW8fMpyxFwILVi522d57CEfQ38IXPGq3TesG54fXkJLbDHbot
   918oErlL9IRhK9BLo+YF7dPZo2oTAKZwyzuXlg/MtfFbUHTnK1ETzywkU
   nl0G3763VE4dcAiRbFEZpXHGLyAwhdNCMNAppej5FkhzCg1PREbp4d78J
   g==;
X-CSE-ConnectionGUID: aPEHdTWJTre9LS2meUJgmg==
X-CSE-MsgGUID: WQGyAcbyREmRFvwafpwWvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84305558"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84305558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:45:26 -0700
X-CSE-ConnectionGUID: YTpRJdD1TEyMgggb6WNcYQ==
X-CSE-MsgGUID: JoEa29BFSt+dSip/3H4oqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259768158"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2026 23:45:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjAPp-00000000LSK-1b2b;
	Mon, 13 Jul 2026 06:45:21 +0000
Date: Mon, 13 Jul 2026 14:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 47/59]
 drivers/firmware/efi/libstub/loongarch.c:33:21: error: call to undeclared
 function 'random_get_entropy'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607131404.PNxoa47A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 57c8b40ef1bde63f63d6983319dde6d1626a3537 [47/59] loongarch: Select ARCH_HAS_RANDOM_ENTROPY
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260713/202607131404.PNxoa47A-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131404.PNxoa47A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131404.PNxoa47A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/loongarch.c:33:21: error: call to undeclared function 'random_get_entropy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                 random_offset ^= (random_get_entropy() << 16);
         |                                   ^
   1 error generated.


vim +/random_get_entropy +33 drivers/firmware/efi/libstub/loongarch.c

ad6f4f3ea72f86 WANG Rui 2026-04-27  25  
03d8273542146f WANG Rui 2026-05-21  26  unsigned long efi_get_kimg_kaslr_address(void)
03d8273542146f WANG Rui 2026-05-21  27  {
03d8273542146f WANG Rui 2026-05-21  28  	unsigned int random_offset = 0;
03d8273542146f WANG Rui 2026-05-21  29  
03d8273542146f WANG Rui 2026-05-21  30  #ifdef CONFIG_RANDOMIZE_BASE
03d8273542146f WANG Rui 2026-05-21  31  	if (!efi_nokaslr) {
03d8273542146f WANG Rui 2026-05-21  32  		efi_get_random_bytes(sizeof(random_offset), (u8 *)&random_offset);
03d8273542146f WANG Rui 2026-05-21 @33  		random_offset ^= (random_get_entropy() << 16);
03d8273542146f WANG Rui 2026-05-21  34  		random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
03d8273542146f WANG Rui 2026-05-21  35  		random_offset = ALIGN(random_offset + SZ_64K, SZ_64K);
03d8273542146f WANG Rui 2026-05-21  36  	}
03d8273542146f WANG Rui 2026-05-21  37  #endif
03d8273542146f WANG Rui 2026-05-21  38  
03d8273542146f WANG Rui 2026-05-21  39  	return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
03d8273542146f WANG Rui 2026-05-21  40  }
03d8273542146f WANG Rui 2026-05-21  41  

:::::: The code at line 33 was first introduced by commit
:::::: 03d8273542146f228c0019f08b57545fdee79704 efi/loongarch: Randomize kernel preferred address for KASLR

:::::: TO: WANG Rui <wangrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
