Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507C158851;
	Thu, 26 Sep 2024 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353218; cv=none; b=o1WT2vA/dugTua85qwkeYE2Mz+EkIiNlRj+GPXYAe+O+ZOgKXDJfxrzlVybsCXwGAtX4ekoN6Eyb+rVuDK92DzARxS/We4yfH6fU8V7cxJ+QcqPylmXXUh+QNU8D/iqE9FaKrKPbXxBHibTcC9bJcIO6IS1iX82GW2WRRdvSjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353218; c=relaxed/simple;
	bh=jMFSl4vA3LhEG7jX0SfZfCpZINnnt3t1a3rMS2YEflA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFALodxBGpp6ULuPa8dJcJhTqcgtTRVxziRReVuA71NLeoOB/sGYgUtsDqkTtuCl1S7Ain1oSi68+7+EkgMItDGJuiKphUzkP+N9nfqIiQQPYQJDkAHgefgNxM7B1QPs8MYwrIJCV2Ag182QMeZ+mxFZPipoRyAi2yGaz0TBqnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gvw0aNyY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gvw0aNyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727353216; x=1758889216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMFSl4vA3LhEG7jX0SfZfCpZINnnt3t1a3rMS2YEflA=;
  b=Gvw0aNyYClVG0aPPqLB4mgKYBpvqr4oFsUW7yn8uZw5JlqpTin9DiIJS
   hHwNtoa7On6/ZvG1g3GPuVpnlJG3lk0+44CvvyXfR7KY79RskVSVXgORw
   Y8yezShwlwDO51jeo9cA5k7bUiPLiHccOQtwwtp6Zk/0X9/JenIsha/t8
   jBSo7SaLT2Sjds07Lzxf0qbmjj8aA20cSOLkPib+w5bxMp6ToxGbmBW8G
   i9+7ED++sDJq+r2VX3ECgP8yQBf3NmRNCaGOvu5QqLcss00LvfOTEdZM7
   nl5/vNl52p+XKxH5YhzbBRImmHdsHcHPTJ6GE/Z/mv9yD7X6UA1C0m7WU
   A==;
X-CSE-ConnectionGUID: FHaOLMqiRo+C9NRyNt6Kwg==
X-CSE-MsgGUID: /5MNBUMyQSWBKYflCxp8sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26391285"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26391285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:20:15 -0700
X-CSE-ConnectionGUID: fOxlk4o9TmWH3NTSRV1hAQ==
X-CSE-MsgGUID: 4eUUw5e1RMqaNneS88Za/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="95476030"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 05:20:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stnTe-000Khr-2j;
	Thu, 26 Sep 2024 12:20:10 +0000
Date: Thu, 26 Sep 2024 20:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 31/47] sound/soc/sunxi/sun20i-codec.c:427:14:
 warning: duplicate 'const' declaration specifier
Message-ID: <202409262017.8tZPxDjm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: a66c0350f140f50f26d79d84ff42c898f36e8bc9 [31/47] ASoC: sun20i-codec: New driver for D1 internal codec
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409262017.8tZPxDjm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262017.8tZPxDjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409262017.8tZPxDjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/sunxi/sun20i-codec.c:4:
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
   In file included from sound/soc/sunxi/sun20i-codec.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/sunxi/sun20i-codec.c:4:
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
   In file included from sound/soc/sunxi/sun20i-codec.c:11:
   In file included from include/sound/dmaengine_pcm.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/sunxi/sun20i-codec.c:427:14: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     427 | static const SOC_ENUM_DOUBLE_DECL(sun20i_codec_line_out_mode_enum,
         |              ^
   include/sound/soc.h:406:2: note: expanded from macro 'SOC_ENUM_DOUBLE_DECL'
     406 |         const struct soc_enum name = SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, \
         |         ^
   8 warnings generated.


vim +/const +427 sound/soc/sunxi/sun20i-codec.c

   426	
 > 427	static const SOC_ENUM_DOUBLE_DECL(sun20i_codec_line_out_mode_enum,
   428					  SUN20I_CODEC_DAC,
   429					  SUN20I_CODEC_DAC_LINEOUTL_DIFFEN,
   430					  SUN20I_CODEC_DAC_LINEOUTR_DIFFEN,
   431					  sun20i_codec_line_out_mode_enum_text);
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
