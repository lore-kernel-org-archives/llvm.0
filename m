Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E654BFC;
	Sat, 23 Mar 2024 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711236204; cv=none; b=gEJ62YPmenMB3fF97yPX+SzXq4V4wcxagd4rz4TVI++R8yeU8H/w6oGGldOPA+zN7dz5wfHa797YYLFcP2Qj7EHssBksNQzPEvYUxU+wWkW+BfeuzZ4CEuMyBlazXY57m7+s8jJ72Ym4OE/SVbVzauqEtnMTb8hc2IzCMHK97ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711236204; c=relaxed/simple;
	bh=Xn5SGWlDlefqpOFUiphQ+pUU+nMVu6eLKIyG3W8GcUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXvDzquW4R/X0cRPLjFt96VVrg2IT1/H47p2Hc/nuwIgiE2gzluY0yKmVJtwtxaGNjcEHEj5umwmFYve7h8YeE3m3Xeu+EmH+YScUuJgu9ygZlK0AcsZm+YI+DUy7+wSHE/mrOCwK9htBkra5fVQ3CIixRTdqHj0lmPf9XcQku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f83bDVVj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f83bDVVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711236202; x=1742772202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xn5SGWlDlefqpOFUiphQ+pUU+nMVu6eLKIyG3W8GcUo=;
  b=f83bDVVjVTOmOd25YxO2kq/qXBrhVtaBIqP/W5GBJ4tZApHtQgx9oMpl
   bkTvZhL1BPhluqSmnyaOpF+U5sxdNX01yV/hrT7UqLsUZ8VGkNuKz90N/
   8KsK/gc1i7EMLN6U5oD0J8TBa4I4vxbbOF6Fh8LmF3Xb7n3g8S2PKqBE9
   s6FUbm/g1Za54axkraxmjBC88+u2UVLQE3itil/h8WpM1/skxWM4aTCI4
   FKdeP/cEV6NTZlunHWS8C9shVIuP7VNj0srDZx9jbJn+N9TPNPPBAwjPq
   LWHPb8YnqbR0jodZaj2pUb7khYUM7lFQTCq0wNT2KQaw1Tv2+iEkHB3I0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6471815"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6471815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 16:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="19723694"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2024 16:23:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roAhq-000LWl-0I;
	Sat, 23 Mar 2024 23:23:18 +0000
Date: Sun, 24 Mar 2024 07:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 57/70] include/net/libeth/xsk.h:12:15:
 error: use of undeclared identifier 'XDP_TXMD_FLAGS_VALID'
Message-ID: <202403240714.5p6N6fy1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: 4cb3adaa6309f17ea6ecdce4b902f20bf315edf2 [57/70] libie: add a couple of XDP helpers
config: s390-randconfig-002-20240323 (https://download.01.org/0day-ci/archive/20240324/202403240714.5p6N6fy1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240714.5p6N6fy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240714.5p6N6fy1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/libeth/xsk.c:4:
   In file included from include/net/libeth/xsk.h:7:
   In file included from include/net/libeth/xdp.h:7:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/intel/libeth/xsk.c:4:
   In file included from include/net/libeth/xsk.h:7:
   In file included from include/net/libeth/xdp.h:7:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/intel/libeth/xsk.c:4:
   In file included from include/net/libeth/xsk.h:7:
   In file included from include/net/libeth/xdp.h:7:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/intel/libeth/xsk.c:4:
   In file included from include/net/libeth/xsk.h:7:
   In file included from include/net/libeth/xdp.h:7:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/intel/libeth/xsk.c:4:
>> include/net/libeth/xsk.h:12:15: error: use of undeclared identifier 'XDP_TXMD_FLAGS_VALID'
      12 | static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
         |               ^
   13 warnings and 1 error generated.


vim +/XDP_TXMD_FLAGS_VALID +12 include/net/libeth/xsk.h

    11	
  > 12	static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
    13		      (LIBETH_XDP_TX_TSTAMP | LIBETH_XDP_TX_CSUM));
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
