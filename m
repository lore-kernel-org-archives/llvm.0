Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2C018AE2;
	Sat, 11 Jul 2026 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783743490; cv=none; b=BSVUPhMHMYYIaD+LJWtjqeJLA8oI2m6K6htGYe2Yo8QqOpays9WSWe87vCpfIglF3aeBKV5BI5Hu5+tauSXicMY4w7LhuQKRYD+N5cTSl88InwqHUl+yrDNG5PrnRxmlaE9OEQHBIVNC7Cizh1ru7+t44AgrM1dadP728Tkr31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783743490; c=relaxed/simple;
	bh=FA52AUVYUu1KxUNTvrjbXYcbMfQrisdyqxKyYHJ/9mc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qh6dXswx/3jM4iHSZGF4fJyPLIkKckb0f37r/f+tW+XUbdwHWoAfiyiQLZ3GziKQWpM9JHSWnmkFCiUPE+3A4IYELzjDvTzl5/mSFb3Tp06Ms2iEZHDDdfTRFoG7av21xZJubBVNz3FW9RK5kLDgvRLI9ifO6UpFZ8b8Qfmr5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaDQ38cT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaDQ38cT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783743488; x=1815279488;
  h=date:from:to:cc:subject:message-id;
  bh=FA52AUVYUu1KxUNTvrjbXYcbMfQrisdyqxKyYHJ/9mc=;
  b=UaDQ38cTLJgSGf9Fj3JCObF+RdCOO3zptFsD8w+yvqL7ie8BO6iMYAd6
   I73FBLwGiFzL6cloQ7PwXUOoGk8DNqAfKhb3fN8bK7URYCTDo1Fboxeg2
   UQj3qiqqxNtR7a/vG5EnWuxe30ScG/+J6+jxDEHNnTcNZa8ZLOS+2tSh3
   l+LgSJIPtVvOkuCIrNBvxGRe1LLCGATTwkBI+SIApegDdI3JJPiN9XlkX
   OSZ3uA4XvxTrf7MC67LG3hFvtsLVf0sfxwpudJqylJxZqFzngY0J/L1Uz
   Plfj7Dsw2lnOWgskDmhFYRFhV+wfG1RkGpTEKjbx26pQL63xApLyrwDzh
   w==;
X-CSE-ConnectionGUID: a4vlYiO4Sj2GRdrXEqb3Hw==
X-CSE-MsgGUID: pKdc/DQWQlKnmPfw9KRhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84488378"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84488378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 21:18:07 -0700
X-CSE-ConnectionGUID: At6aBBfOTr+tBEgO2+29cg==
X-CSE-MsgGUID: 8E5SAngsRi6Iy/uv9zd7Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258927963"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2026 21:18:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiPAA-00000000Jih-4976;
	Sat, 11 Jul 2026 04:18:02 +0000
Date: Sat, 11 Jul 2026 12:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 55/56]
 drivers/media/platform/apple/avd/avd-hw.c:96:58: warning: shift count >=
 width of type
Message-ID: <202607111256.m7DRIagP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   edd1529cbf30f69240acea99fa8225683c555200
commit: 9d77b27426e338bbf4f4df0676c1e064e046527e [55/56] media: apple: add avd driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607111256.m7DRIagP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111256.m7DRIagP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111256.m7DRIagP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/avd/avd-hw.c:96:58: warning: shift count >= width of type [-Wshift-count-overflow]
      96 |                 w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |                                                                        ^  ~~
   drivers/media/platform/apple/avd/avd-hw.c:110:57: warning: shift count >= width of type [-Wshift-count-overflow]
     110 |         w32(AVD_V5_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |                                                                ^  ~~
   2 warnings generated.
--
   In file included from drivers/media/platform/apple/avd/avd-h264.c:24:
>> drivers/media/platform/apple/avd/avd-inst.h:41:29: warning: shift count >= width of type [-Wshift-count-overflow]
      41 |                 push(avd, ctx, (u32)(addr >> 32));
         |                                           ^  ~~
>> drivers/media/platform/apple/avd/avd-h264.c:383:20: warning: shift count >= width of type [-Wshift-count-overflow]
     383 |                         | (u32)(slc_a84 >> 32), "slc_a7c_cmd_set_coded_slice");
         |                                         ^  ~~
   2 warnings generated.


vim +96 drivers/media/platform/apple/avd/avd-hw.c

    89	
    90	void t8112_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
    91				  u32 vp_slot)
    92	{
    93		if (avd->variant->quirks & AVD_QUIRK_LSR) {
    94			w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr >> 8);
    95		} else {
  > 96			w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
    97			w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr & 0xffffffff);
    98		}
    99		w32(AVD_V4_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0);
   100		w32(AVD_V4_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
   101		w32(AVD_V4_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
   102	
   103		m32(AVD_V4_VP_CTRL_CM3_IRQ_MASK + (vp_slot * 4), AVD_VP_CM3_MASK);
   104		m32(AVD_V4_PP_CTRL_CM3_IRQ_MASK, AVD_PP_CM3_MASK);
   105	}
   106	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
