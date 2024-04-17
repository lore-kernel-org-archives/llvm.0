Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868163B185;
	Wed, 17 Apr 2024 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713393802; cv=none; b=YLUtdfXtxkHGgUVAaxVtlMR06ovHsDDTlOHf2tuUa5S8PPfX78tnh8DlqcyHdGW0ReIQ206wY3JBLxIxbt1rEVSoSCSEXOKQV75TqDpzB8qdfvZTZRKd1yKXrPm+sxCHxMIv03jk+kARYpUYBCEPqZKhlhDxf29u7mytVMblK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713393802; c=relaxed/simple;
	bh=PanJIARLDI1x/47HPf1NBh2mzXDKK9VMUDhFNmwsF8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlAGXz41VW4Ee/1f/wEx5tTJ105U6Xv7zYLxJhwb0O6sTro34eYj4pVMTLnO3/j49GiFArUaGUK/QP6VEjAqwjtmwyV8cWY6Z6II1DXBqePcZ7T65nqWJPKE3mQyouyrcCCiQzHLE1/1Zca5w6Ssl2jnk3LXIWuNNYquC8+jhq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO5nsRdP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO5nsRdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713393801; x=1744929801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PanJIARLDI1x/47HPf1NBh2mzXDKK9VMUDhFNmwsF8g=;
  b=OO5nsRdPBIsQMxmYodUbTC8N9eeMf9cgiyLx1oIvuEjiJcklDK7CjQpx
   oPr8xClWa7/vun54dY9m4rBSSjEtjYr1T26w3SaTapAg9VxevE/ovHZPm
   HGzHtI9YFlrazTFIZN6ERRDVYQRHvJpHNOtiSRiM/Jo1f2RwTGV+gNTdf
   odTi4KfZtTCT1tMObXl93sWj+Oe6/J4eSewsS53nvYhNRPhY5H/Gl6VTP
   KXVC5Qk+8FVBZzPxiYWQLO4tUv2fSdzYvJCVLCZbnX5K7Z1xXIVAFuSUv
   156WXhENSHqa8oI57Pp+vrWJwEHFIye/veigZwYLkoqzU5z/dZEa+J7OL
   w==;
X-CSE-ConnectionGUID: i2Rolay/Q4+FK+OBovwfIQ==
X-CSE-MsgGUID: 6Nna23FQRBa38iYuwCmH0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8775695"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8775695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 15:37:41 -0700
X-CSE-ConnectionGUID: Lsekb7BNS6ON6lJ9BYjysw==
X-CSE-MsgGUID: xYdndFv6TPC3dmiqaxQ3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="23371906"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 15:37:40 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxDuH-00073Y-2n;
	Wed, 17 Apr 2024 22:37:34 +0000
Date: Thu, 18 Apr 2024 06:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 20/80] drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning:
 unused variable 'xrs700x_phylink_mac_ops'
Message-ID: <202404180637.BlcK3tlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   151b88b21c8ef27598749fb5f240a15a32bef669
commit: 055235891082f2adc943a9f7abfdd4931b6a1911 [20/80] net: dsa: xrs700x: provide own phylink MAC operations
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240418/202404180637.BlcK3tlN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180637.BlcK3tlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180637.BlcK3tlN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/xrs700x/xrs700x.c:7:
   In file included from include/net/dsa.h:11:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/dsa/xrs700x/xrs700x.c:7:
   In file included from include/net/dsa.h:11:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from drivers/net/dsa/xrs700x/xrs700x.c:7:
   In file included from include/net/dsa.h:11:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/dsa/xrs700x/xrs700x.c:7:
   In file included from include/net/dsa.h:11:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning: unused variable 'xrs700x_phylink_mac_ops' [-Wunused-const-variable]
     714 | static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/xrs700x_phylink_mac_ops +714 drivers/net/dsa/xrs700x/xrs700x.c

   713	
 > 714	static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
   715		.mac_config		= xrs700x_mac_config,
   716		.mac_link_down		= xrs700x_mac_link_down,
   717		.mac_link_up		= xrs700x_mac_link_up,
   718	};
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
