Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF83233149;
	Sat, 16 May 2026 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897353; cv=none; b=EP0TOMf3itIXwADmM4j2vdon+f62Tv+IYG28gF8G1qSiHyTL+jGcocmrlB0RSaGZV5FwLIP/zDyMnM8jDKjWp2WW1KQYpYRWO5mDx0sFryOEViGwUn9LrGfotDVD9q7SrVhI6R5dv+YzN3XnsE+B4yoVgaLebUNHgEvpyeV20nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897353; c=relaxed/simple;
	bh=jl+SguRpRkZiv7BtD/6Bht46jeBdDOzG1VImV4/H8SU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XaOYrFSUsLgszS4p5lZADlWzkrTQeu8ax0jfrcnQa2EvJPsYtV87rvUz+fosBGRRlbszG2l8KU4yry1bl761Wp1G0QjqUjxcUgDBlQJkGz3GJYSuFBx6KzyDB3/u9Hh9Hyb5enpFrO4s7EEoWKUOc3zGhLG7/n2ys6iPtdBZAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGNHKV+b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGNHKV+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778897352; x=1810433352;
  h=date:from:to:cc:subject:message-id;
  bh=jl+SguRpRkZiv7BtD/6Bht46jeBdDOzG1VImV4/H8SU=;
  b=nGNHKV+bUHaE3Tppi7gdCeAYbydGASCScsGsYakbfEGE2UH/tpb12lTG
   ocg16DcTvrBAZsW+1lNXXlrgRWdzvlAuVI0Cm6anmVDd7B2WPbdJunI5U
   LrxnJpKs8Lp4/xgxRbmVBswVjY9cLy134HT3UL/m2XmRmadMpW78NTXT7
   vVF0M7JCtiqgMIKew8fOw6egnar/Vi0AIwNOVdGS9OXdzJGxTk/XZlgRG
   LXUh6Fgh+0+wrEJ8hGU3nG3Ofk5RdmKpO4hfMGrL107DPqU3EFfaoXhli
   T/91doJxBfgVUnUKaYUnBzw9Y7VaI/qhFds1aMQ0AQKbtQ2URfMJ1QZSB
   A==;
X-CSE-ConnectionGUID: tXpH+TrLTTS32p3JTMp9FQ==
X-CSE-MsgGUID: crw202wmS7akl9P39WXLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97283242"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97283242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:09:10 -0700
X-CSE-ConnectionGUID: 30omUrBeShu5RusRbXgaXQ==
X-CSE-MsgGUID: mtGHH+LDS/u0o2tQJ3GI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="240687788"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 19:09:08 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO4Sg-000000000Mf-1dnK;
	Sat, 16 May 2026 02:09:06 +0000
Date: Sat, 16 May 2026 10:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 29/29]
 sound/soc/sunxi/sun4i-codec.c:2130:35: warning: unused variable
 'sun55i_codec_ch_vol_scale'
Message-ID: <202605160958.YTXwh8hZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc [29/29] [WIP] ASoC: sun4i: Support capture on A523
config: arm-randconfig-003-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160958.YTXwh8hZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160958.YTXwh8hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160958.YTXwh8hZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun4i-codec.c:2130:35: warning: unused variable 'sun55i_codec_ch_vol_scale' [-Wunused-const-variable]
    2130 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/tlv.h:22:31: note: expanded from macro 'DECLARE_TLV_DB_SCALE'
      22 | #define DECLARE_TLV_DB_SCALE            SNDRV_CTL_TLVD_DECLARE_DB_SCALE
         |                                         ^
   include/uapi/sound/tlv.h:55:15: note: expanded from macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      55 |         unsigned int name[] = { \
         |                      ^~~~
   1 warning generated.


vim +/sun55i_codec_ch_vol_scale +2130 sound/soc/sunxi/sun4i-codec.c

2198deb823a6ebe Mesih Kilinc 2024-11-23  2127  
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2128  /* volume / mute controls */
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2129  static const DECLARE_TLV_DB_SCALE(sun55i_codec_dvol_scale, -7308, 116, 0);
ef6aea06096134a Chen-Yu Tsai 2026-02-18 @2130  static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2131  static const DECLARE_TLV_DB_SCALE(sun55i_codec_hp_vol_scale, -4200, 600, 0);
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2132  static const DECLARE_TLV_DB_RANGE(sun55i_codec_lineout_vol_scale,
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2133  	0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2134  	2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2135  );
1cdb4d4846ffadd Chen-Yu Tsai 2026-02-23  2136  static const DECLARE_TLV_DB_RANGE(sun55i_codec_adc_gain_scale,
1cdb4d4846ffadd Chen-Yu Tsai 2026-02-23  2137  	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
1cdb4d4846ffadd Chen-Yu Tsai 2026-02-23  2138  	1, 3, TLV_DB_SCALE_ITEM(6, 0, 0),
1cdb4d4846ffadd Chen-Yu Tsai 2026-02-23  2139  	4, 31, TLV_DB_SCALE_ITEM(9, 1, 0),
1cdb4d4846ffadd Chen-Yu Tsai 2026-02-23  2140  );
ef6aea06096134a Chen-Yu Tsai 2026-02-18  2141  

:::::: The code at line 2130 was first introduced by commit
:::::: ef6aea06096134a7e805db2283ed108274414319 ASoC: sun4i-codec: Support playback for A523 SoC family's audio codec

:::::: TO: Chen-Yu Tsai <wens@kernel.org>
:::::: CC: Chen-Yu Tsai <wens@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
