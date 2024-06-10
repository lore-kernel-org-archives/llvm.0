Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426AC10A0A;
	Mon, 10 Jun 2024 04:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717993242; cv=none; b=UsyuQz9Rr5mYir2HKW/Eq066rT8rqmZETiNIg8x49G69okNk8TBcsk5A19poia+0b7Zfa54Osvf8zhJCcX4eJRXbcKsozA4euhwBgrHpNqk+iz+n2macdN0IjN364mLiKja/d7ek3fHGlZ+L7wdKHwv65mZp4lTBBQ3SH/xM9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717993242; c=relaxed/simple;
	bh=IIzDI5ZJiul1ebucml1FHddUlH81oVOqJhhqKeuN0HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cadd16VLpc7fUpuU7dkRD/SxndRo0/qTKyKxKLs1DNUQIuFa+Ikfa6dGN4tR3wrFE/sV7Ea0eXS6keiCe5HjTd6Z5schsOpUtzZ2Q/jaW1kLJOkLwmbuy/ZWI03tTy86gLTy9yEDEmzTDnefXQX5ZAbz2/7L4odz9yd1V7tJar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhTrzTuL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhTrzTuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717993239; x=1749529239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IIzDI5ZJiul1ebucml1FHddUlH81oVOqJhhqKeuN0HM=;
  b=QhTrzTuL/K/jmjJxlB0BVrOQ8bObl9qGX500C7JouW1ugdg4XfFMntep
   u5bPXFKbXGzaeDUXxhguJmK3KxA1t+lkPcbDKHaBClUTT22N+4Rw0c9lK
   Z+PLmXKU276449xIIY8SGWl90YYYepRZzPyHgLxyNegntpBUBE6TQoHi3
   xfB5gJ45CoSgR8bD29NysMYN5HutwN/GAucEtXo5AetTQ1e3VN3mXD+kC
   0MTOG8Wm5wy3xM1MXMiEcv9SZlWijcl3Yu9eOWB6xuLSyTi75vCkbkZDO
   d7y+pWLDiA+HNaoIx2Lj+dxDyeRWn40h7s40kl6m7aIJqIBa1HgootMH/
   g==;
X-CSE-ConnectionGUID: syxwSWwMS1yIaTPFGB6phg==
X-CSE-MsgGUID: uO2qmVeATNWjmwrkHXrYEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18494960"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="18494960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 21:20:39 -0700
X-CSE-ConnectionGUID: sBnuRDBzQhWHKNKdYpmquw==
X-CSE-MsgGUID: w53r0UhrSYK6QYsLqEYc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38855929"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2024 21:20:37 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGWWJ-0001qh-0Q;
	Mon, 10 Jun 2024 04:20:35 +0000
Date: Mon, 10 Jun 2024 12:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [samba-ksmbd:for-next 546/600] fs/cifs/cifspdu.h:886:3: error:
 unexpected type name '__le64': expected identifier
Message-ID: <202406101232.zTcUv6vj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   3fe4ba20003290acf0547625cccc34db928d156e
commit: ac97f75062003d06fedfdc4ac7bf5af08a28fab3 [546/600] smb: client, common: fix fortify warnings
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240610/202406101232.zTcUv6vj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101232.zTcUv6vj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101232.zTcUv6vj-lkp@intel.com/

All errors (new ones prefixed by >>):

     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsfs.c:30:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:91:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/cifs/cifsfs.c:30:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:91:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/cifs/cifsfs.c:30:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:91:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/cifs/cifsfs.c:32:
   fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
   fs/cifs/cifspdu.h:512:37: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                                                   ^
         |                                                   int
   fs/cifs/cifspdu.h:885:2: error: type name requires a specifier or qualifier
     885 |         struct_group(common_attributes,
         |         ^
>> fs/cifs/cifspdu.h:886:3: error: unexpected type name '__le64': expected identifier
     886 |                 __le64 CreationTime;
         |                 ^
>> fs/cifs/cifspdu.h:886:10: error: expected ')'
     886 |                 __le64 CreationTime;
         |                        ^
   fs/cifs/cifspdu.h:885:14: note: to match this '('
     885 |         struct_group(common_attributes,
         |                     ^
>> fs/cifs/cifspdu.h:885:15: error: a parameter list without types is only allowed in a function definition
     885 |         struct_group(common_attributes,
         |                      ^
   fs/cifs/cifspdu.h:891:2: error: type name requires a specifier or qualifier
     891 |         );
         |         ^
>> fs/cifs/cifspdu.h:891:2: error: expected member name or ';' after declaration specifiers
>> fs/cifs/cifspdu.h:890:25: error: expected ';' at end of declaration list
     890 |                 __le32 FileAttributes;
         |                                       ^
         |                                       ;
   fs/cifs/cifspdu.h:2269:2: error: type name requires a specifier or qualifier
    2269 |         struct_group(common_attributes,
         |         ^
   fs/cifs/cifspdu.h:2270:3: error: unexpected type name '__le64': expected identifier
    2270 |                 __le64 CreationTime;
         |                 ^
   fs/cifs/cifspdu.h:2270:10: error: expected ')'
    2270 |                 __le64 CreationTime;
         |                        ^
   fs/cifs/cifspdu.h:2269:14: note: to match this '('
    2269 |         struct_group(common_attributes,
         |                     ^
   fs/cifs/cifspdu.h:2269:15: error: a parameter list without types is only allowed in a function definition
    2269 |         struct_group(common_attributes,
         |                      ^
   fs/cifs/cifspdu.h:2275:2: error: type name requires a specifier or qualifier
    2275 |         );
         |         ^
   fs/cifs/cifspdu.h:2275:2: error: expected member name or ';' after declaration specifiers
   fs/cifs/cifspdu.h:2274:21: error: expected ';' at end of declaration list
    2274 |                 __le32 Attributes;
         |                                   ^
         |                                   ;
   fs/cifs/cifspdu.h:2293:3: error: type name requires a specifier or qualifier
    2293 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2293:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2293 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   fs/cifs/cifspdu.h:2332:2: error: type name requires a specifier or qualifier
    2332 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   17 warnings and 20 errors generated.
--
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:14:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:14:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:14:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:26:
   fs/cifs/../smbfs_common/smb2pdu.h:705:2: error: type name requires a specifier or qualifier
     705 |         struct_group(network_open_info,
         |         ^
>> fs/cifs/../smbfs_common/smb2pdu.h:706:3: error: unexpected type name '__le64': expected identifier
     706 |                 __le64 CreationTime;
         |                 ^
>> fs/cifs/../smbfs_common/smb2pdu.h:706:10: error: expected ')'
     706 |                 __le64 CreationTime;
         |                        ^
   fs/cifs/../smbfs_common/smb2pdu.h:705:14: note: to match this '('
     705 |         struct_group(network_open_info,
         |                     ^
>> fs/cifs/../smbfs_common/smb2pdu.h:705:15: error: a parameter list without types is only allowed in a function definition
     705 |         struct_group(network_open_info,
         |                      ^
   fs/cifs/../smbfs_common/smb2pdu.h:714:2: error: type name requires a specifier or qualifier
     714 |         );
         |         ^
>> fs/cifs/../smbfs_common/smb2pdu.h:714:2: error: expected member name or ';' after declaration specifiers
>> fs/cifs/../smbfs_common/smb2pdu.h:713:21: error: expected ';' at end of declaration list
     713 |                 __le32 Attributes;
         |                                   ^
         |                                   ;
   fs/cifs/../smbfs_common/smb2pdu.h:845:3: error: type name requires a specifier or qualifier
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^
   fs/cifs/../smbfs_common/smb2pdu.h:845:48: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                                                              ^
         |                                                              int
   fs/cifs/../smbfs_common/smb2pdu.h:1685:3: error: type name requires a specifier or qualifier
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/../smbfs_common/smb2pdu.h:1685:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:2: error: type name requires a specifier or qualifier
     322 |         struct_group(network_open_info,
         |         ^
>> fs/cifs/smb2pdu.h:323:3: error: unexpected type name '__le64': expected identifier
     323 |                 __le64 CreationTime;
         |                 ^
>> fs/cifs/smb2pdu.h:323:10: error: expected ')'
     323 |                 __le64 CreationTime;
         |                        ^
   fs/cifs/smb2pdu.h:322:14: note: to match this '('
     322 |         struct_group(network_open_info,
         |                     ^
>> fs/cifs/smb2pdu.h:322:15: error: a parameter list without types is only allowed in a function definition
     322 |         struct_group(network_open_info,
         |                      ^
   fs/cifs/smb2pdu.h:330:2: error: type name requires a specifier or qualifier
     330 |         );
         |         ^
>> fs/cifs/smb2pdu.h:330:2: error: expected member name or ';' after declaration specifiers
>> fs/cifs/smb2pdu.h:329:21: error: expected ';' at end of declaration list
     329 |                 __le32 Attributes;
         |                                   ^
         |                                   ;
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:97:
   fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   17 warnings and 20 errors generated.


vim +/__le64 +886 fs/cifs/cifspdu.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  876  
^1da177e4c3f41 Linus Torvalds 2005-04-16  877  typedef struct smb_com_open_rsp {
^1da177e4c3f41 Linus Torvalds 2005-04-16  878  	struct smb_hdr hdr;	/* wct = 34 BB */
^1da177e4c3f41 Linus Torvalds 2005-04-16  879  	__u8 AndXCommand;
^1da177e4c3f41 Linus Torvalds 2005-04-16  880  	__u8 AndXReserved;
^1da177e4c3f41 Linus Torvalds 2005-04-16  881  	__le16 AndXOffset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  882  	__u8 OplockLevel;
^1da177e4c3f41 Linus Torvalds 2005-04-16  883  	__u16 Fid;
^1da177e4c3f41 Linus Torvalds 2005-04-16  884  	__le32 CreateAction;
ac97f75062003d Steve French   2024-01-26 @885  	struct_group(common_attributes,
^1da177e4c3f41 Linus Torvalds 2005-04-16 @886  		__le64 CreationTime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  887  		__le64 LastAccessTime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  888  		__le64 LastWriteTime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  889  		__le64 ChangeTime;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @890  		__le32 FileAttributes;
ac97f75062003d Steve French   2024-01-26 @891  	);
^1da177e4c3f41 Linus Torvalds 2005-04-16  892  	__le64 AllocationSize;
^1da177e4c3f41 Linus Torvalds 2005-04-16  893  	__le64 EndOfFile;
^1da177e4c3f41 Linus Torvalds 2005-04-16  894  	__le16 FileType;
^1da177e4c3f41 Linus Torvalds 2005-04-16  895  	__le16 DeviceState;
^1da177e4c3f41 Linus Torvalds 2005-04-16  896  	__u8 DirectoryFlag;
^1da177e4c3f41 Linus Torvalds 2005-04-16  897  	__u16 ByteCount;	/* bct = 0 */
0753ca7bc2b876 Steve French   2005-10-27  898  } __attribute__((packed)) OPEN_RSP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  899  

:::::: The code at line 886 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
