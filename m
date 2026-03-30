Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259C175A9B;
	Mon, 30 Mar 2026 01:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834161; cv=none; b=Z7Yt7byc6B0kDQ20/idhf2mvn1AqUxqqy/5oJ4lIcGhLeJfzamRc/QEtRqxH/3fCamqEIjfrmX2U4ehpmYUyZNSFaHZm4HdcKPjCl1Su6W0jGtGf9QtkWPE0R6XP3o+XzdiCS59YWyzp4E31/d3iMHC8eLqTQhsoMiLG2XFRPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834161; c=relaxed/simple;
	bh=9qgYqLTbt5Su9zH8Q5OuoBc/eB/WW4VrCfmtaugv9Zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c8VxU6Hc7rGGNARf1aK7Iakr5ig2FtT+7ZKULJtV1lqK/xA/yzVJBRJoKTNFS76MvDVJPnz9+L3PpK7brGrl11UiUxwdZcvrjo2gEaz5RadQdJoxssNeHsfxXdFiSFnuxGtAzBWuE4CZX0JGqA1qwYSm+8KY+u5juoLzwDYLVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQqaPP4z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQqaPP4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774834159; x=1806370159;
  h=date:from:to:cc:subject:message-id;
  bh=9qgYqLTbt5Su9zH8Q5OuoBc/eB/WW4VrCfmtaugv9Zw=;
  b=WQqaPP4zqeV3nCRJnmdtABzLrywMEb/k9R/z1keNU2pwx3OKG+5k742d
   EkoZ3xGOlb6sdSEJZHLjb7BRg/GsXNnZwDlcdK8FGKN3Kryp4E65iywTp
   PuglNLayhC3Q9Qt5njzNHeBVnVlTbAyd43nDo8CP0t4Ws86djjzPhDMZ6
   jxZkNzdusi+knRPnzCF4SFSTy4uRbv1bDvjlzDi4a3mq7MonfJ8twuk1I
   /jFW9iw6L4zwqFz/eh84RvrgxTC73g9jHa0vmgZAPaA6aPIs0+BVXvkdn
   y35PcQBJIHTUE+IgxYylMIlAMKH/m5LBcmfQvuGJMJRFpal2JugUzmqk6
   g==;
X-CSE-ConnectionGUID: Nlfa7UWKQtWnAD6Aj1RwFg==
X-CSE-MsgGUID: A5zDm+iAT061rTaVSIY6MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76012705"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="76012705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 18:29:18 -0700
X-CSE-ConnectionGUID: 9u43Lv2bRnq6TuRdfigUlw==
X-CSE-MsgGUID: yrd9/iw5Tqyl/yKZVhWKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="221504059"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 18:29:16 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w71RJ-000000000Vv-1lja;
	Mon, 30 Mar 2026 01:29:13 +0000
Date: Mon, 30 Mar 2026 09:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Subject: drivers/rapidio/rio_cm.c:240:21: warning: variable
 'dev_minor_base' set but not used
Message-ID: <202603300941.gWpJLYkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   11 months ago
config: um-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603300941.gWpJLYkn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300941.gWpJLYkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300941.gWpJLYkn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/rapidio/rio_cm.c:12:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/rapidio/rio_cm.c:12:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/rapidio/rio_cm.c:12:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/rapidio/rio_cm.c:675:7: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     675 |                 int rc;
         |                     ^
>> drivers/rapidio/rio_cm.c:240:21: warning: variable 'dev_minor_base' set but not used [-Wunused-but-set-global]
     240 | static unsigned int dev_minor_base;
         |                     ^
   14 warnings generated.


vim +/dev_minor_base +240 drivers/rapidio/rio_cm.c

b6e8d4aa111030 Alexandre Bounine 2016-08-02  235  
d712d205210c49 Ivan Orlov        2023-08-10  236  static const struct class dev_class = {
d712d205210c49 Ivan Orlov        2023-08-10  237  	.name = DRV_NAME,
d712d205210c49 Ivan Orlov        2023-08-10  238  };
b6e8d4aa111030 Alexandre Bounine 2016-08-02  239  static unsigned int dev_major;
b6e8d4aa111030 Alexandre Bounine 2016-08-02 @240  static unsigned int dev_minor_base;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  241  static dev_t dev_number;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  242  static struct channel_dev riocm_cdev;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  243  

:::::: The code at line 240 was first introduced by commit
:::::: b6e8d4aa1110306378af0f3472a6b85a1f039a16 rapidio: add RapidIO channelized messaging driver

:::::: TO: Alexandre Bounine <alexandre.bounine@idt.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
