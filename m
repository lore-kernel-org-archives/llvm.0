Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A386AD9;
	Thu,  8 Feb 2024 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707416697; cv=none; b=DFl/Prbhg76+nwLI8lvKTD5rvgSQRTyc2CHsMp+EE1obcPSMlWChPdc4ilco3JJgXGYYxRZfxvaw/z/4FOj81UrlyX23xxyHt0DUMt2wFDu1D3B5LNL9BruL6fpjktOn3HrsoEQp88vmsm7tev0gihoJ78nbgKfFxIQVw7KMx7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707416697; c=relaxed/simple;
	bh=KaPzRXYYzgpr7EdUgksK6/7W8y0QKv0k+R2XPRZEToc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrVf/VjzPyYhM0LPyaNALZjD4P9SDwHKrPoz7iyjCi7srvPOEGDQp/VZQkXr3x7A/RwkXLALLmcIPqyVlGEZqw6GDH864vss9pXKbxggTc3yPQntuJyThYYUAYT17B1+luCCzjk2ArmU2iz6obWKpZjVYCU2Pr3HFyQLpIAsXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Wkyv4j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Wkyv4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707416696; x=1738952696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaPzRXYYzgpr7EdUgksK6/7W8y0QKv0k+R2XPRZEToc=;
  b=Q1Wkyv4jlOdVcYCCa3GtQZQxp9i2U+k0UdmCzTR1yNx3VhW9uscseZV4
   SD8JpQVjU6CyJoMm+Am8bAtycQN9eVRXcp60ln5g34EhufkprZxNhMn3p
   pnNh5w/yGgYBMTlE7c521bbWd4CCQD2fj/+tT1QkzdpsoinKtIJRx+tnl
   +nd2YwQ3Fv6tVEZCDeA4OHeKPCEfUkRBcrvf2zvmAsaWosP69JU6rHzx7
   kwlkpMHrWASV2CqtSV2VdGRONzQ5euAJcNyKizzNJOwLHoqfjQ8/Pl5VT
   UmVvp4vdZst1Xiecg7htA1Tqdji+hkyO3FwdiVdJLL3CWVwLdkpj0Sj2W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1190432"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1190432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1960094"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Feb 2024 10:24:53 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY94t-00041O-0k;
	Thu, 08 Feb 2024 18:24:51 +0000
Date: Fri, 9 Feb 2024 02:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 33/50] sound/soc/sunxi/sun20i-codec.c:427:14:
 warning: duplicate 'const' declaration specifier
Message-ID: <202402090253.dnjRPDPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: 2bf2b3c3e381c76f1f04c3863bfbd5e03b35195f [33/50] ASoC: sun20i-codec: New driver for D1 internal codec
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240209/202402090253.dnjRPDPC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090253.dnjRPDPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090253.dnjRPDPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/sunxi/sun20i-codec.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/sunxi/sun20i-codec.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/sunxi/sun20i-codec.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/sunxi/sun20i-codec.c:427:14: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     427 | static const SOC_ENUM_DOUBLE_DECL(sun20i_codec_line_out_mode_enum,
         |              ^
   include/sound/soc.h:384:2: note: expanded from macro 'SOC_ENUM_DOUBLE_DECL'
     384 |         const struct soc_enum name = SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, \
         |         ^
   13 warnings generated.


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
