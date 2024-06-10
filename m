Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C317C2;
	Mon, 10 Jun 2024 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717981379; cv=none; b=QVBY8KncXDsn4mod+q3MmLT+vmn2X42b2PklhWuoqqy4gv25FNP/9NzXZ9wHdml0MXK9KrgKfaVdIwFsUlBiB3PcpRkbDGZzbyh+R4Bu0FFEtQjWxxZ7Geb6kbGOgDsVAVXFDjWaxniVV9vssO0lTr7X+4a4kztOdCIGl25CMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717981379; c=relaxed/simple;
	bh=pkApgwsUTKO4MI6HEAgB41n94nedtA0Qi+xXLPPoE2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYvBLu0/xvulHtCUb8HMUdhFLfTGyBfEepj0Y3JHXS00Cn1qjtw0J+ftmRHyvBlDbFi4jLRQkfXAes3M9/H9Xmec72ywSYRSlkfULt4OW/KaOc84f6S+bj+ZTh/zc7CqOiGYBsBDlhy2VIKVQQGphC0wluLUlVHZ3+YB6jC3L7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0B+sRH7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0B+sRH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717981378; x=1749517378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pkApgwsUTKO4MI6HEAgB41n94nedtA0Qi+xXLPPoE2M=;
  b=K0B+sRH7Ae5bTt2bTkGS5aCgp4ikHkHFdIvh/hsSp6cioaR3kX2hWBbI
   rFv6Yx1KMcBfs+rEIuSgY0fZzCMzrl13fqhDAqpwbGLClKU9EU3KLCfzU
   Gc3RviqYJgn5NagtgKuwor34eos/B7zkYggYijSOGw7sLsvu+61XNaKjs
   vLL/k1upQMxdMN/YJptTNyrH3NFFMS+B70uEwyqlJMVi05sNaoP9csDaF
   ETKRbttaCxr2VufnCygoYegz6iAIXLubJyXq9U8VXQ6za/D0jIzqQ93Nb
   l6NXIGTYCrBZhja+wHawVKJKrMMMunhNMiMo6ac5eWuEtlJO6Z1JLsCr8
   A==;
X-CSE-ConnectionGUID: 2lewn3/CQLOgXuxt8uFkTg==
X-CSE-MsgGUID: yJrx/xyKQpiOjqYZqbTs+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26044044"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="26044044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 18:02:56 -0700
X-CSE-ConnectionGUID: jdO2wXhTR+qoa/bCGgHeSQ==
X-CSE-MsgGUID: 0ye9O3f1StuQQkkbFQxFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38743000"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2024 18:02:53 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGTQx-0001j7-2H;
	Mon, 10 Jun 2024 01:02:51 +0000
Date: Mon, 10 Jun 2024 09:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>,
	Kees Cook <keescook@chromium.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>
Subject: [samba-ksmbd:for-next 226/600] fs/cifs/cifspdu.h:512:3: error: type
 name requires a specifier or qualifier
Message-ID: <202406100834.6Y729oGM-lkp@intel.com>
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
commit: cb470770db4ecdaf46a6c4b1703889ba2d6a4b19 [226/600] cifs: Replace a couple of one-element arrays with flexible-array members
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100834.6Y729oGM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100834.6Y729oGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100834.6Y729oGM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
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
>> fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
>> fs/cifs/cifspdu.h:512:37: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                                                   ^
         |                                                   int
   17 warnings and 2 errors generated.
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
   In file included from fs/cifs/cached_dir.c:8:
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
   In file included from fs/cifs/cached_dir.c:8:
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
   In file included from fs/cifs/cached_dir.c:8:
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
   In file included from fs/cifs/cached_dir.c:8:
   In file included from fs/cifs/cifsglob.h:100:
>> fs/cifs/cifspdu.h:512:3: error: type name requires a specifier or qualifier
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^
>> fs/cifs/cifspdu.h:512:37: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                                                   ^
         |                                                   int
   fs/cifs/cached_dir.c:415:6: warning: no previous prototype for function 'free_cached_dir' [-Wmissing-prototypes]
     415 | void free_cached_dir(struct cached_fid *cfid)
         |      ^
   fs/cifs/cached_dir.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     415 | void free_cached_dir(struct cached_fid *cfid)
         | ^
         | static 
   18 warnings and 2 errors generated.


vim +512 fs/cifs/cifspdu.h

   490	
   491	#define READ_RAW_ENABLE 1
   492	#define WRITE_RAW_ENABLE 2
   493	#define RAW_ENABLE (READ_RAW_ENABLE | WRITE_RAW_ENABLE)
   494	#define SMB1_CLIENT_GUID_SIZE (16)
   495	typedef struct negotiate_rsp {
   496		struct smb_hdr hdr;	/* wct = 17 */
   497		__le16 DialectIndex; /* 0xFFFF = no dialect acceptable */
   498		__u8 SecurityMode;
   499		__le16 MaxMpxCount;
   500		__le16 MaxNumberVcs;
   501		__le32 MaxBufferSize;
   502		__le32 MaxRawSize;
   503		__le32 SessionKey;
   504		__le32 Capabilities;	/* see below */
   505		__le32 SystemTimeLow;
   506		__le32 SystemTimeHigh;
   507		__le16 ServerTimeZone;
   508		__u8 EncryptionKeyLength;
   509		__u16 ByteCount;
   510		union {
   511			/* cap extended security off */
 > 512			DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
   513			/* followed by Domain name - if extended security is off */
   514			/* followed by 16 bytes of server GUID */
   515			/* then security blob if cap_extended_security negotiated */
   516			struct {
   517				unsigned char GUID[SMB1_CLIENT_GUID_SIZE];
   518				unsigned char SecurityBlob[];
   519			} __attribute__((packed)) extended_response;
   520		} __attribute__((packed)) u;
   521	} __attribute__((packed)) NEGOTIATE_RSP;
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
