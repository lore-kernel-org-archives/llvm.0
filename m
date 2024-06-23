Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DBD51C;
	Sun, 23 Jun 2024 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719136616; cv=none; b=djUBBz2ZLjwky5zEkCldTh9XilO+WK9K6X/nLUNqoeeEmRJni6PUh/sfFDM/O4+h5SazOFI33cDYUmwqyRuQWmaXsvfyvviPDISauz7LqLDJsxq2zEHP+MOKjgwGrfgbw415usnyPwwoL4UX4DC6UrcCACNWca1yXd/AyRLKX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719136616; c=relaxed/simple;
	bh=WlE/td9w0hVcRbhgxDCjIRhTw3zJu0iD6jgbzAW8kmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQjTxzgD4Os4f3LYP48Gg2XszAV+hbBPrhRAnuCbWF6Rj/Ep6RGYbbryVbUmoGJZn+b5Z7D1OZR5nKIkLPsnPW3ufiLC0WXlC57oMNntsQXBSTklZ64VgD8aSvoedzoh9WMpwTEDcL3lHHKSwtKgSJ3zrDodD5zG4kHbNvGc7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erp2KAmM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erp2KAmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719136614; x=1750672614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlE/td9w0hVcRbhgxDCjIRhTw3zJu0iD6jgbzAW8kmk=;
  b=erp2KAmMhfE+iWx5yOyqqYtZiL27RiHrUfenIKIdFyBPusyF6MT+mr85
   5Mu3ZoZtkRLbSbnl5b64VrRCONfKcezTIEV7RgH712Uiwx9MX6uvwnb8M
   zd50ZmRpMpX2ZNnGLXd99ZQvytbP6TCLrSwvSKbTyV3U7fWUK7A8FGz5J
   TjmaxoydIrBpZ1ZARYH3j0wxHT5ompdw0GGBi/LvEPQFmk5UiD3v/Ur4j
   fSADrDk6cH035JRr71venimGEBWRSkPb/Z23P2GB5iwdGzqO5jk7IX1Mg
   mr4XMO5pPLhk5vgVM6Ule14e049sF+OD/FD+D5YRolSsTjJfVN58/lzBg
   w==;
X-CSE-ConnectionGUID: Ddpx7neGSwib0+3Yr9pPtw==
X-CSE-MsgGUID: tvwtkjhfRrilc+TuJpexEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16089668"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="16089668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 02:56:53 -0700
X-CSE-ConnectionGUID: WWtiQlt3QT2JSfxRNjDvgA==
X-CSE-MsgGUID: /8ciGYOaTyy4c9C+bKE/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="73764306"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2024 02:56:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLJxp-000AQo-2L;
	Sun, 23 Jun 2024 09:56:49 +0000
Date: Sun, 23 Jun 2024 17:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.11 16/22] sound/soc/codecs/rt1318.c:1149:34:
 warning: unused variable 'rt1318_of_match'
Message-ID: <202406231738.itBQpEf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.11
head:   de7a09dec4b90a7f92b1ebcdfeed69400b5079f4
commit: fe1ff61487ace69cd4e680e36169c90667eb9624 [16/22] ASoC: rt1318: Add RT1318 audio amplifier driver
config: hexagon-randconfig-r022-20230909 (https://download.01.org/0day-ci/archive/20240623/202406231738.itBQpEf9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231738.itBQpEf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231738.itBQpEf9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/rt1318.c:17:
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
   In file included from sound/soc/codecs/rt1318.c:17:
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
   In file included from sound/soc/codecs/rt1318.c:17:
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
>> sound/soc/codecs/rt1318.c:1149:34: warning: unused variable 'rt1318_of_match' [-Wunused-const-variable]
    1149 | static const struct of_device_id rt1318_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   7 warnings generated.


vim +/rt1318_of_match +1149 sound/soc/codecs/rt1318.c

  1148	
> 1149	static const struct of_device_id rt1318_of_match[] = {
  1150		{ .compatible = "realtek,rt1318", },
  1151		{},
  1152	};
  1153	MODULE_DEVICE_TABLE(of, rt1318_of_match);
  1154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
