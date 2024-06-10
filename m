Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEEBEDB;
	Mon, 10 Jun 2024 02:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717987598; cv=none; b=ONgNgMg5EwVwlWdKSCDjjPc9W6iLAXBjX63SNv0/TupsFWKqtf30GRjgWOgSITCU3SI3/xFltZ+gFBJoLfV62zgYzvUGWXQ3uI+/yuo5SA64r90c6ao24J06M1OTDNQ9QdQEWXvL1E7wb1wdS3zeemexjVE71Wd+JhOlgIGdbNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717987598; c=relaxed/simple;
	bh=ippcAAcsScHlrZSLOB8JiKOfZ3mZWK2HieWA/E+8hNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHkB7AgwwMCRcq+7HRd6dOwoHSS+5vwkVgNrf2pvzhVcTAQ+GKiIlDM23A2BnHAzfFhnslluuaCBnUUi7zFd3rJZwwmF3gsq7JQ6k4zn88oUOd6KUlVlTNm48kdy0U7lwsgkbHWexf2BN8df/jsX35cKImcMPj5XFCVgMsa1K+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiMnYEcf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiMnYEcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717987596; x=1749523596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ippcAAcsScHlrZSLOB8JiKOfZ3mZWK2HieWA/E+8hNs=;
  b=GiMnYEcfyIrNSXpeIOJn/MZiM9tzVekMB+243Jmb2rrbnD2K1ROQMJbo
   /hjecvMf6dEB0VojDEfsopN3w/SoNSSerWfoPlXLb7nJfcLcwl/Tpvj6A
   7dTBSXJzE8dEFT0krUqN+uHraTHOWUeJ4rNlq+0KVrl44wD/H6PTgmEgT
   uiGQtrHJf1fYdWmSYV4vdVSj2F+fpqGZ9TWRC5CxAU0JwHU92DT/cq109
   bzQ+7mXQi1dUdAihdx4tTzQjRLcerYQYgh5BXZFAGBBRHla2RiCh2k4rh
   jI+TvbP9EZcCY0riOEkkfhppyKNp3ozQbDPka2wZ2NP/LWals47QRSpgC
   Q==;
X-CSE-ConnectionGUID: UD54vLxrRA6On9pXZQf12g==
X-CSE-MsgGUID: /5GRNZlJTkuVyUfhQyEhSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32170873"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="32170873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 19:46:35 -0700
X-CSE-ConnectionGUID: 1nXy5RyIQAy5qYKYoNfNpw==
X-CSE-MsgGUID: Pi3H4zt/SKWOA/jHu7rCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43850576"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jun 2024 19:46:33 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGV3G-0001nC-2M;
	Mon, 10 Jun 2024 02:46:30 +0000
Date: Mon, 10 Jun 2024 10:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [samba-ksmbd:for-next 346/600]
 fs/cifs/../smbfs_common/smb2pdu.h:817:3: error: type name requires a
 specifier or qualifier
Message-ID: <202406101000.Wb32VK0m-lkp@intel.com>
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
commit: cd3ad386810097de48e69cdd3c483ca1bf65c7c6 [346/600] smb3: Replace smb2pdu 1-element arrays with flex-arrays
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240610/202406101000.Wb32VK0m-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101000.Wb32VK0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101000.Wb32VK0m-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   fs/cifs/cifspdu.h:2289:3: error: type name requires a specifier or qualifier
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2289:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   fs/cifs/cifspdu.h:2328:2: error: type name requires a specifier or qualifier
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^
   fs/cifs/cifspdu.h:2328:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2377:2: error: type name requires a specifier or qualifier
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^
   fs/cifs/cifspdu.h:2377:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2488:3: error: type name requires a specifier or qualifier
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2488:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   In file included from fs/cifs/cifsfs.c:34:
   In file included from fs/cifs/cifsglob.h:26:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:3: error: type name requires a specifier or qualifier
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^
>> fs/cifs/../smbfs_common/smb2pdu.h:817:48: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                                                              ^
         |                                                              int
   fs/cifs/../smbfs_common/smb2pdu.h:1578:3: error: type name requires a specifier or qualifier
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/../smbfs_common/smb2pdu.h:1578:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   17 warnings and 14 errors generated.
--
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/mm.h:1601:
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
>> fs/cifs/../smbfs_common/smb2pdu.h:817:3: error: type name requires a specifier or qualifier
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^
>> fs/cifs/../smbfs_common/smb2pdu.h:817:48: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                                                              ^
         |                                                              int
   fs/cifs/../smbfs_common/smb2pdu.h:1578:3: error: type name requires a specifier or qualifier
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/../smbfs_common/smb2pdu.h:1578:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   In file included from fs/cifs/cached_dir.c:9:
   In file included from fs/cifs/cifsglob.h:97:
   fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
   fs/cifs/cifspdu.h:512:37: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                                                   ^
         |                                                   int
   fs/cifs/cifspdu.h:2289:3: error: type name requires a specifier or qualifier
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2289:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   fs/cifs/cifspdu.h:2328:2: error: type name requires a specifier or qualifier
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^
   fs/cifs/cifspdu.h:2328:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2377:2: error: type name requires a specifier or qualifier
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^
   fs/cifs/cifspdu.h:2377:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2488:3: error: type name requires a specifier or qualifier
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2488:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   17 warnings and 14 errors generated.
--
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/cifs/readdir.c:15:
   In file included from fs/cifs/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:37:
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
   In file included from fs/cifs/readdir.c:15:
   In file included from fs/cifs/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:37:
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
   In file included from fs/cifs/readdir.c:15:
   fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
   fs/cifs/cifspdu.h:512:37: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                                                   ^
         |                                                   int
   fs/cifs/cifspdu.h:2289:3: error: type name requires a specifier or qualifier
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2289:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   fs/cifs/cifspdu.h:2328:2: error: type name requires a specifier or qualifier
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^
   fs/cifs/cifspdu.h:2328:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2377:2: error: type name requires a specifier or qualifier
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^
   fs/cifs/cifspdu.h:2377:27: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |                                  ^
         |                                  int
   fs/cifs/cifspdu.h:2488:3: error: type name requires a specifier or qualifier
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/cifspdu.h:2488:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   In file included from fs/cifs/readdir.c:16:
   In file included from fs/cifs/cifsglob.h:26:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:3: error: type name requires a specifier or qualifier
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^
>> fs/cifs/../smbfs_common/smb2pdu.h:817:48: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                                                              ^
         |                                                              int
   fs/cifs/../smbfs_common/smb2pdu.h:1578:3: error: type name requires a specifier or qualifier
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^
   fs/cifs/../smbfs_common/smb2pdu.h:1578:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                                          ^
         |                                          int
   fs/cifs/readdir.c:554:20: error: no member named 'FileName' in 'FILE_UNIX_INFO'
     554 |         de->name = &info->FileName[0];
         |                     ~~~~  ^
   17 warnings and 15 errors generated.


vim +817 fs/cifs/../smbfs_common/smb2pdu.h

   802	
   803	struct smb2_lock_req {
   804		struct smb2_hdr hdr;
   805		__le16 StructureSize; /* Must be 48 */
   806		__le16 LockCount;
   807		/*
   808		 * The least significant four bits are the index, the other 28 bits are
   809		 * the lock sequence number (0 to 64). See MS-SMB2 2.2.26
   810		 */
   811		__le32 LockSequenceNumber;
   812		__u64  PersistentFileId;
   813		__u64  VolatileFileId;
   814		/* Followed by at least one */
   815		union {
   816			struct smb2_lock_element lock;
 > 817			DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
   818		};
   819	} __packed;
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
