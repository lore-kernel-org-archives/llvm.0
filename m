Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F81400B;
	Sat, 24 Feb 2024 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708763979; cv=none; b=tU/+/Pl/Na3bSu+AOqB03pEroEsMoTOzcFeKI4c5Gbf5Vxi6k/1lgSlNtFfLE0OmWDDL3j/WSd1UYaxtNpVlQWiTVNHnQT2dlb/3fosvD9tgzeieH3wqgWpl06sxaLD8lS1uYcKzKiNzxtGtTqrQVX6Z64rI+3YHgHBf/2Knk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708763979; c=relaxed/simple;
	bh=hX2f+7xU/Y3OM2YrhxKDl2XSXm/0BiNMdfQhJA6JyK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FV71OKYXUNyAuOy4khHIrcVGZVeWMwHWJO0SQtq1JfERBZfaNiEgx4H7Fdi0Y9X36ay6yXws1zCwwEgEW6FPB6OSYRV40W2yfASC0BGS13rYvAmj2Q28dFI1Fv7N2OrHx+ui+bjMOweh+wS/uFXB2BZm5iTx9FVpvjGzph2GPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=My7P6xlt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="My7P6xlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708763977; x=1740299977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hX2f+7xU/Y3OM2YrhxKDl2XSXm/0BiNMdfQhJA6JyK8=;
  b=My7P6xltEiBWl6xSb7X/CDP2BHvoqhgCnNp1rxdvGRx1lxjEzBI/h4Mw
   OpgHOaQr5rpH2eNwSLAhaWGqvYaEtkZWomSpxQ9tMhyQ4lPcaRTjKeHu2
   LG30P++LYe7AGEfU0kah9vp3V/CQaiRr4q1Z6xiNBqwMknnOdF3041mwU
   mW9fO6FyXmJ0SrLFJSqrqBimEEBxVoueqqWVZAVYz1fnBI6t5PLGQbo3s
   tcZZcdFVyU81OvqixcjzeuqXvA6xCxA0pBZUMCE2vUiOncGlRqc4Owag5
   vE0z4MGK/IybVcdpkKUMEdmuTt8oJMxW/vlKUNVjlFO7nfAHADBoNaWlb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25571147"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="25571147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 00:39:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6075606"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2024 00:39:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdnZB-0008O8-0I;
	Sat, 24 Feb 2024 08:39:29 +0000
Date: Sat, 24 Feb 2024 16:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [lee-backlight:for-backlight-next 3/18]
 drivers/video/backlight/ktd2801-backlight.c:8:10: fatal error:
 'linux/leds-expresswire.h' file not found
Message-ID: <202402241607.SaVJEOA8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   3c40590fafd4cc2447fb482a640c450e1a58ffa1
commit: 48749e2f14e3ae6c62ba7d51d140a848582df66c [3/18] backlight: Add Kinetic KTD2801 backlight support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241607.SaVJEOA8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241607.SaVJEOA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241607.SaVJEOA8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/backlight/ktd2801-backlight.c:6:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:19:
   In file included from ./arch/s390/include/generated/asm/fb.h:1:
   In file included from include/asm-generic/fb.h:10:
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
   In file included from drivers/video/backlight/ktd2801-backlight.c:6:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:19:
   In file included from ./arch/s390/include/generated/asm/fb.h:1:
   In file included from include/asm-generic/fb.h:10:
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
   In file included from drivers/video/backlight/ktd2801-backlight.c:6:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:19:
   In file included from ./arch/s390/include/generated/asm/fb.h:1:
   In file included from include/asm-generic/fb.h:10:
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
>> drivers/video/backlight/ktd2801-backlight.c:8:10: fatal error: 'linux/leds-expresswire.h' file not found
       8 | #include <linux/leds-expresswire.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 1 error generated.


vim +8 drivers/video/backlight/ktd2801-backlight.c

   > 8	#include <linux/leds-expresswire.h>
     9	#include <linux/platform_device.h>
    10	#include <linux/property.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
