Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411945;
	b=hlzCuQQAHuwOjmXkl7Uk+IrrLAgKLMx/nZaM2EioPHTbsxVYsARnxampplnXyl5+3/RS
	 9DZlWgtNWgBIDm520QkyUdtSPNCvtkTNL84wQfLxTnLJ+50MvTzGm+VnDGt7xpvkslXlh
	 C5EeU22/eN7IXqLVUhkyHsAObpu5rkpIlpKn3cNq3Oodc6jFquhjjD2gne9jGNxECytIM
	 JfC8y8c2ANarQk7ZYV5AztvBP5As/ImVxMWbUZ6237Y1hFiH7RW3CL8jYfwfe2fKa/BNJ
	 yHBe39ThbvHarzwUYCroz6bAr2fFpYcU6CL0apMF2nMD+SXkEkAMfoXCsXYEDlZoVZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411945;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=c0btvdKt/6OLQJJIWC0uuW2McaTyqPmyGFhEk3kMFGo=;
	b=mJ3aRKrl0vJehqTiVx2CyzFz4Y4r5bh1VXNNaSVjOIpV0ExG6BzYSzYKx0KIxE09DdRH
	 r9vhdA1HzmohWLO2qb4hVu75lzec2+c/JRhCH6KDOnA7ZYezRvP+Q5eIDyMhY0ESQh+NU
	 oTveTyJs6i8/XdVKCH6Qn7sfSbTpaN0FUvOk8Q4YKvBFT/zRi7KvUybXC3ogxip3d2Jj6
	 19R7fOWSDmhrT96qP3VUuSRTT0S8txkINNvkfOZ15udbxYuzllO7nU0P4P8dkFOs7sB+e
	 YgNZpYM2vwSfmWC/DV+jPB1n6br8ogenmyPa/hpN7rKHpb/qBmk4AIUt0JbRVxFl0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nW0pLdC4;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E70606A31A;
	Sat, 31 Oct 2026 01:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E70606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nW0pLdC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411944; x=1824947944;
  h=date:from:to:cc:subject:message-id;
  bh=f/eTyBPkCcXoYnl8EwMCeN2kOaZOs3BR2x7Ny//apoc=;
  b=nW0pLdC4/Uryr8iswqAz0lxyIjozeouxcETjT8+Qz9E/gizc8rfgjYIm
   p/GXE9Fn4EDopqOoWGrioQQ883/cwUdk4crL4jtjooUVXkd/M0mrRaaVc
   AL8rUV4OVxPKXaaOE5vnColREJieEbklRSaGab2+BKHJRykGk1Wvcpt2e
   i8dh3JIfDNiDe6yDj82hTEmbdEOXlp44LD/dJUsDHPXDlkiQRRxmIfcl9
   lfAOtOes2qrJnSr7zxcZIMiRWBEyRZt1w0FJhLZUXDtMqWmiKlqKLgh8Z
   gYwR9FWKnRoSvBd4beczEcE7Ilz7KMHlBTpav0YWvN9/BYCKjZJ7zuMSU
   g==;
X-CSE-ConnectionGUID: o2iIi3METfC5QGHNeMZ4/w==
X-CSE-MsgGUID: zs9kPG6PSP+db0EzqMEucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2063249"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2063249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:59:04 -0700
X-CSE-ConnectionGUID: 3yaWJ1XkRhmfbu7UXWpuow==
X-CSE-MsgGUID: vxP2SOpPSUKyVBKEBtaOyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5452949"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2026 18:59:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyN1-000000005p9-2cR5;
	Sat, 31 Oct 2026 01:58:59 +0000
Date: Sat, 31 Oct 2026 02:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 22/36]
 sound/soc/sunxi/sun4i-codec.c:2129:35: warning: unused variable
 'sun55i_codec_ch_vol_scale'
Message-ID: <202610310223.7XZcyVgO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 26aaaa5549cb3eb3943ab92ffdfbe36a8eacda2e [22/36] ASoC: sun4i-codec: Support playback for A523 SoC family's audio codec
config: arm-randconfig-2001-20261030 (https://download.01.org/0day-ci/archive/20261031/202610310223.7XZcyVgO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310223.7XZcyVgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310223.7XZcyVgO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun4i-codec.c:2129:35: warning: unused variable 'sun55i_codec_ch_vol_scale' [-Wunused-const-variable]
    2129 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/tlv.h:22:31: note: expanded from macro 'DECLARE_TLV_DB_SCALE'
      22 | #define DECLARE_TLV_DB_SCALE            SNDRV_CTL_TLVD_DECLARE_DB_SCALE
         |                                         ^
   include/uapi/sound/tlv.h:55:15: note: expanded from macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      55 |         unsigned int name[] = { \
         |                      ^~~~
   1 warning generated.


vim +/sun55i_codec_ch_vol_scale +2129 sound/soc/sunxi/sun4i-codec.c

  2126	
  2127	/* volume / mute controls */
  2128	static const DECLARE_TLV_DB_SCALE(sun55i_codec_dvol_scale, -7308, 116, 0);
> 2129	static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
  2130	static const DECLARE_TLV_DB_SCALE(sun55i_codec_hp_vol_scale, -4200, 600, 0);
  2131	static const DECLARE_TLV_DB_RANGE(sun55i_codec_lineout_vol_scale,
  2132		0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
  2133		2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
  2134	);
  2135	static const char * const sun55i_codec_cpldo_volt_enum_text[] = {
  2136		"0.9V", "1.0V", "1.1V", "1.2V"
  2137	};
  2138	static SOC_ENUM_SINGLE_DECL(sun55i_codec_cpldo_volt_enum, SUN55I_CODEC_DAC,
  2139				    SUN55I_CODEC_DAC_CPLDO_VOLT,
  2140				    sun55i_codec_cpldo_volt_enum_text);
  2141	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
