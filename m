Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA415C149;
	Sat,  7 Sep 2024 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725725700; cv=none; b=J4dJqzYP+n6sN2ZaEosp6md41zGMVxP9qZLcdxZvp4UrfbYyZ0ouL/DsL7XKJXXh5LtoGiOgkX7qx5QTOR4Y+XHZb8e+devtQ2Qm+95BwFtroXYdXNl1f5Vck4DOVoeQP9hJnu9KmSX36AUgjDkLk/r8Yzd1xNSpHg6hAp5jUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725725700; c=relaxed/simple;
	bh=HDRbO0GIZcBLcTQwbn28z4aGtbgxFOZaN/AySK/AUaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXt1rT1royjv7SgT4C/2l/G/1tUTgqXqRJmy4QnrC1YkmE8xqDc/UxPIIEfdZZ3IJF+asrdun5B0el1JFXegrpHihe2aEeiQRDDdmBHdBCTnI6Y2fHmQMNCKL0Yd5kYioCkjc74EN42q/ftVzp7XEUmbcJt/kKFSpmF6A3F6WoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMwcq8BG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMwcq8BG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725725698; x=1757261698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HDRbO0GIZcBLcTQwbn28z4aGtbgxFOZaN/AySK/AUaY=;
  b=fMwcq8BGdy+cPGaDvp0spmGFCs4V6KGgvSs3auZbConVDffmwTIP+57N
   FCP2TrDiKUfvneilqJtjdRZj3j2epCPrnRailshcmvEJ3IinkPe3RbxaR
   BPir3hlatNhwpRDUSIHUO2MLqELNAwW+/j7e1mbQI7gKT71Jr5GFzYMtG
   PTbrHs7D+MuPIQ0YoK3LespvP4pva/yZ3SjR20X/yaHcT4kwD8yjlPCgT
   T3mvrP03LG3ADlOOQv+GlKjZZZeP5XdVSwz3RTVtF3lh/ePgViblwfb0E
   EC69rYlTzVGZDTz/Qj+iswu2jX7g36+RRyXP7Kl38/pBvts7dCpp3Hb0J
   g==;
X-CSE-ConnectionGUID: 2yBH6u1DTTKxJDcXI8nQGQ==
X-CSE-MsgGUID: YpJJk4+SQRerVyy4Yck//g==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24578586"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24578586"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 09:14:57 -0700
X-CSE-ConnectionGUID: zwsS0uuURZOh7RliNrDILg==
X-CSE-MsgGUID: eCyvvgW7SP21QOUiCLT3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="89505049"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 09:14:56 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smy5N-000Chr-1n;
	Sat, 07 Sep 2024 16:14:53 +0000
Date: Sun, 8 Sep 2024 00:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:asoc-fix-mt8365-build 17/17]
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:280:7: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409080000.7NjM17Gm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-fix-mt8365-build
head:   c14188719c9f02944528affb4b9bab1d1ed9be19
commit: c14188719c9f02944528affb4b9bab1d1ed9be19 [17/17] ASoC: mt8365: Allow build coverage
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409080000.7NjM17Gm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080000.7NjM17Gm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080000.7NjM17Gm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:280:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     280 |                            CM2_AFE_CM2_CONN_CFG1(TDM_IN_CH0));
         |                            ^
   sound/soc/mediatek/mt8365/mt8365-reg.h:952:34: note: expanded from macro 'CM2_AFE_CM2_CONN_CFG1'
     952 | #define CM2_AFE_CM2_CONN_CFG1(x)        FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
         |                                         ^
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:398:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     398 |                                    CM_AFE_CM_UPDATE_CNT2(ch_update_cnt[7]));
         |                                    ^
   sound/soc/mediatek/mt8365/mt8365-reg.h:989:34: note: expanded from macro 'CM_AFE_CM_UPDATE_CNT2'
     989 | #define CM_AFE_CM_UPDATE_CNT2(x)        FIELD_PREP(CM_AFE_CM_UPDATE_CNT2_MASK, (x))
         |                                         ^
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:464:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     464 |         val = FIELD_PREP(CM_AFE_CM_CH_NUM_MASK, (channels - 1)) |
         |               ^
   7 warnings and 3 errors generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-adda.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-adda.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-adda.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-adda.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-adda.c:30:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
         |                ^
   sound/soc/mediatek/mt8365/mt8365-dai-adda.c:54:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         val = FIELD_PREP(AFE_ADDA_UL_SAMPLING_RATE,
         |               ^
   7 warnings and 2 errors generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:134:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |                 val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
         |                        ^
   sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:142:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |                 val |= DMIC_TOP_CON_VOICE_MODE_48K;
         |                        ^
   sound/soc/mediatek/mt8365/mt8365-reg.h:900:38: note: expanded from macro 'DMIC_TOP_CON_VOICE_MODE_48K'
     900 | #define DMIC_TOP_CON_VOICE_MODE_48K             FIELD_PREP(DMIC_TOP_CON_VOICE_MODE_MASK, 3)
         |                                                 ^
   7 warnings and 2 errors generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:294:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         val |= FIELD_PREP(AFE_I2S_CON_RATE_MASK, fs);
         |                ^
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:363:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     363 |         val = FIELD_PREP(O16BIT, o16bit) | FIELD_PREP(IS_MONO, mono);
         |               ^
   7 warnings and 2 errors generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:69:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      69 |         val |= FIELD_PREP(PCM_INTF_CON1_FORMAT_MASK, fmt);
         |                ^
   7 warnings and 1 error generated.


vim +/FIELD_PREP +280 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c

e1991d102bc2ab Alexandre Mergnat 2024-07-22  271  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  272  static int mt8365_afe_cm2_mux_conn(struct mtk_base_afe *afe)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  273  {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  274  	struct mt8365_afe_private *afe_priv = afe->platform_priv;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  275  	unsigned int input = afe_priv->cm2_mux_input;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  276  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  277  	/* TDM_IN interconnect to CM2 */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  278  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  279  			   CM2_AFE_CM2_CONN_CFG1_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22 @280  			   CM2_AFE_CM2_CONN_CFG1(TDM_IN_CH0));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  281  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  282  			   CM2_AFE_CM2_CONN_CFG2_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  283  			   CM2_AFE_CM2_CONN_CFG2(TDM_IN_CH1));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  284  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  285  			   CM2_AFE_CM2_CONN_CFG3_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  286  			   CM2_AFE_CM2_CONN_CFG3(TDM_IN_CH2));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  287  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  288  			   CM2_AFE_CM2_CONN_CFG4_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  289  			   CM2_AFE_CM2_CONN_CFG4(TDM_IN_CH3));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  290  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  291  			   CM2_AFE_CM2_CONN_CFG5_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  292  			   CM2_AFE_CM2_CONN_CFG5(TDM_IN_CH4));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  293  	regmap_update_bits(afe->regmap, AFE_CM2_CONN0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  294  			   CM2_AFE_CM2_CONN_CFG6_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  295  			   CM2_AFE_CM2_CONN_CFG6(TDM_IN_CH5));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  296  	regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  297  			   CM2_AFE_CM2_CONN_CFG7_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  298  			   CM2_AFE_CM2_CONN_CFG7(TDM_IN_CH6));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  299  	regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  300  			   CM2_AFE_CM2_CONN_CFG8_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  301  			   CM2_AFE_CM2_CONN_CFG8(TDM_IN_CH7));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  302  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  303  	/* ref data interconnect to CM2 */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  304  	if (input == MT8365_FROM_GASRC1) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  305  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  306  				   CM2_AFE_CM2_CONN_CFG9_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  307  				   CM2_AFE_CM2_CONN_CFG9(GENERAL1_ASRC_OUT_LCH));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  308  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  309  				   CM2_AFE_CM2_CONN_CFG10_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  310  				   CM2_AFE_CM2_CONN_CFG10(GENERAL1_ASRC_OUT_RCH));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  311  	} else if (input == MT8365_FROM_GASRC2) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  312  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  313  				   CM2_AFE_CM2_CONN_CFG9_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  314  				   CM2_AFE_CM2_CONN_CFG9(GENERAL2_ASRC_OUT_LCH));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  315  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  316  				   CM2_AFE_CM2_CONN_CFG10_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  317  				   CM2_AFE_CM2_CONN_CFG10(GENERAL2_ASRC_OUT_RCH));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  318  	} else if (input == MT8365_FROM_TDM_ASRC) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  319  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  320  				   CM2_AFE_CM2_CONN_CFG9_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  321  				   CM2_AFE_CM2_CONN_CFG9(TDM_OUT_ASRC_CH0));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  322  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  323  				   CM2_AFE_CM2_CONN_CFG10_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  324  				   CM2_AFE_CM2_CONN_CFG10(TDM_OUT_ASRC_CH1));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  325  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  326  				   CM2_AFE_CM2_CONN_CFG11_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  327  				   CM2_AFE_CM2_CONN_CFG11(TDM_OUT_ASRC_CH2));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  328  		regmap_update_bits(afe->regmap, AFE_CM2_CONN1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  329  				   CM2_AFE_CM2_CONN_CFG12_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  330  				   CM2_AFE_CM2_CONN_CFG12(TDM_OUT_ASRC_CH3));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  331  		regmap_update_bits(afe->regmap, AFE_CM2_CONN2,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  332  				   CM2_AFE_CM2_CONN_CFG13_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  333  				   CM2_AFE_CM2_CONN_CFG13(TDM_OUT_ASRC_CH4));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  334  		regmap_update_bits(afe->regmap, AFE_CM2_CONN2,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  335  				   CM2_AFE_CM2_CONN_CFG14_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  336  				   CM2_AFE_CM2_CONN_CFG14(TDM_OUT_ASRC_CH5));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  337  		regmap_update_bits(afe->regmap, AFE_CM2_CONN2,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  338  				   CM2_AFE_CM2_CONN_CFG15_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  339  				   CM2_AFE_CM2_CONN_CFG15(TDM_OUT_ASRC_CH6));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  340  		regmap_update_bits(afe->regmap, AFE_CM2_CONN2,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  341  				   CM2_AFE_CM2_CONN_CFG16_MASK,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  342  				   CM2_AFE_CM2_CONN_CFG16(TDM_OUT_ASRC_CH7));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  343  	} else {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  344  		dev_err(afe->dev, "%s wrong CM2 input %d\n", __func__, input);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  345  		return -1;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  346  	}
e1991d102bc2ab Alexandre Mergnat 2024-07-22  347  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  348  	return 0;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  349  }
e1991d102bc2ab Alexandre Mergnat 2024-07-22  350  

:::::: The code at line 280 was first introduced by commit
:::::: e1991d102bc2abb32331c462f8f3e77059c69578 ASoC: mediatek: mt8365: Add the AFE driver support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
