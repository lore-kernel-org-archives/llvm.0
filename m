Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35D10799;
	Sat, 20 Apr 2024 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713598132; cv=none; b=i26SFJASM1Vk78CIX5clv81RQDY+lVWrgnp4qesE3DokN1d5/ehYSOjMwJuS7W5PeM070k62yqGYPuL24W0zjtn8lbRg71/AFwP2rZezl92KfGjKz9Jh0SDkKEPaNeGzxB3ejhThHiw2lcYUwt2jG8bfMpSXnxnwTskEAN+0kWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713598132; c=relaxed/simple;
	bh=Ap/Y7FzXBDxHQevt459EIpFLTrhDLkThFu5ixHCXtkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXZKpQ5cYaSANnHxPuFHvWzdPRd0xG18vG5kd9il1WSYX+K/r1gMqOj3EHYXZm5sfjCt+6NANKOBO5Sm9hPW+mDbySVGhHqkaIiYUSxriuN4XEy4/H16QPitYqRw5I3kTVwz6VjwZ8T22vcRy5EpN77GcLgm5+EVv/SCBcIr18Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6eKEOML; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6eKEOML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713598131; x=1745134131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ap/Y7FzXBDxHQevt459EIpFLTrhDLkThFu5ixHCXtkQ=;
  b=N6eKEOMLaQz9vOHbvafEGWE4bLEGCEF6/SbuCmvWJ3lf/nABDBd4aZgf
   nTUfTLlu14mvQLOjMWCYwaEUPEzLPksoWm+pTHchdj7eAYNAUIcs4tyl5
   bxVPKLBNUaz+PtMu7yGELRVbDS3RTUbahCQUVKx3ZaeeRh+gSWkGP5uDn
   XHtQ9PCqDh30eQy5XwF9lpnhQEIEFyK40vMrhCYB3luis7w6aLpAGmoe+
   Zto8pMdR34Cb4w5pSBMGaRbGNslcIMFORg+ABIcaymYcbavRVXu9YmNFA
   AAcAD+cmV92O76noRQDuK3EHrU08k1MuI9NIDPHwXdlbn5aaLqNRkyToH
   g==;
X-CSE-ConnectionGUID: +NhjgwrNSpqYBxgWSw7kjQ==
X-CSE-MsgGUID: YsE2fxyfSQStQ9PHPdsGUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34603246"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="34603246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 00:28:51 -0700
X-CSE-ConnectionGUID: q7yocQK/QY2rb1xW4HE39A==
X-CSE-MsgGUID: dg6dhHaOTVqBkitTllpVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23412049"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Apr 2024 00:28:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry59P-000Apw-1U;
	Sat, 20 Apr 2024 07:28:43 +0000
Date: Sat, 20 Apr 2024 15:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Pugin <rilian.la.te@ya.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Konstantin Pugin <ria.freelander@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lech Perczak <lech.perczak@camlingroup.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 3/3] serial: sc16is7xx: add support for EXAR XR20M1172
 UART
Message-ID: <202404201559.2eM6MALu-lkp@intel.com>
References: <20240419124506.1531035-4-rilian.la.te@ya.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419124506.1531035-4-rilian.la.te@ya.ru>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on c6795fbffc4547b40933ec368200bd4926a41b44]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Pugin/serial-sc16is7xx-announce-support-of-SER_RS485_RTS_ON_SEND/20240420-004819
base:   c6795fbffc4547b40933ec368200bd4926a41b44
patch link:    https://lore.kernel.org/r/20240419124506.1531035-4-rilian.la.te%40ya.ru
patch subject: [PATCH v4 3/3] serial: sc16is7xx: add support for EXAR XR20M1172 UART
config: hexagon-randconfig-001-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201559.2eM6MALu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201559.2eM6MALu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201559.2eM6MALu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/sc16is7xx_spi.c:7:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/tty/serial/sc16is7xx_spi.c:7:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/tty/serial/sc16is7xx_spi.c:7:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/tty/serial/sc16is7xx_spi.c:8:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/sc16is7xx_spi.c:72:34: error: use of undeclared identifier 'xr20m1172_devtype'
      72 |         { "xr20m1172",  (kernel_ulong_t)&xr20m1172_devtype, },
         |                                          ^
   7 warnings and 1 error generated.


vim +/xr20m1172_devtype +72 drivers/tty/serial/sc16is7xx_spi.c

    63	
    64	static const struct spi_device_id sc16is7xx_spi_id_table[] = {
    65		{ "sc16is74x",	(kernel_ulong_t)&sc16is74x_devtype, },
    66		{ "sc16is740",	(kernel_ulong_t)&sc16is74x_devtype, },
    67		{ "sc16is741",	(kernel_ulong_t)&sc16is74x_devtype, },
    68		{ "sc16is750",	(kernel_ulong_t)&sc16is750_devtype, },
    69		{ "sc16is752",	(kernel_ulong_t)&sc16is752_devtype, },
    70		{ "sc16is760",	(kernel_ulong_t)&sc16is760_devtype, },
    71		{ "sc16is762",	(kernel_ulong_t)&sc16is762_devtype, },
  > 72		{ "xr20m1172",	(kernel_ulong_t)&xr20m1172_devtype, },
    73		{ }
    74	};
    75	MODULE_DEVICE_TABLE(spi, sc16is7xx_spi_id_table);
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
