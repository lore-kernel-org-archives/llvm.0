Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3AF1FBD;
	Mon,  4 Sep 2023 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693865701; x=1725401701;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8QA4Nw4HPBHs9WCxhAyGY85qU13Fb//GoOkNNNpDrdQ=;
  b=Fpi0mS8ShmrPRmFfjHetOnZ9hv1Sz1R7GVnq4CcL1lUv53aylTYhtZa4
   u4ErabQ4jpCgZxQSbUswtkL75S9D1/ZRiSEAVBmybQeUBtOzPFXqONFJD
   OTVkyFktJVQ+luEdhOZaGYTey+AXGR/CSNdTOvSRIMj51+xaNiekI5BGv
   xDJNosl8RAkrZ//bQ2KNIt1x+O1huuf3Hi+hfBxN3tKaRPdUijN5spbrg
   UaaYBsml4SqGBZIwRHxK+A1L2mze0qrS1ZS6xlNfL7s6kluaOCqXwauEw
   cbb1D8ZPY/wTgYxbPqcuOBOCvTKCWRLarXvrlgmqbQIbF0ws9uyxLn1x7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="380459585"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="380459585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 15:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987584241"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="987584241"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 15:14:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdHpn-0000s9-21;
	Mon, 04 Sep 2023 22:14:16 +0000
Date: Tue, 5 Sep 2023 06:13:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to
 next function mchp_core_pwm_probe()
Message-ID: <202309050650.3X0s7q4J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: linux-kernel@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a1415eebeece5a27fb40c0242b171c104ad5727
commit: 2bf7ecf7b4fffd87d8eb5c072395239d6ff54728 pwm: add microchip soft ip corePWM driver
date:   2 months ago
config: x86_64-buildonly-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230905/202309050650.3X0s7q4J-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050650.3X0s7q4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050650.3X0s7q4J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to next function mchp_core_pwm_probe()
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xd6: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xe2: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xf0: relocation to !ENDBR: native_write_cr4+0x5
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xfc: relocation to !ENDBR: native_write_cr4+0x5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
