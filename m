Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBA137C28;
	Tue, 12 Mar 2024 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710262979; cv=none; b=thYteKcjCs8FQw2pendeNsdZGw302bF8xATCf2qBCut+TXM3xfY8HyuVaTzS1Xm9n4btMYwiraFPZV9alDi/G/t+ydFae3Bb1GG+kiIuQlyNeiggD2PbUUbgKA38f4IxxB6cjgvkyQVB885D9q7BGiHK5m9GsCXXTYtzcAayX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710262979; c=relaxed/simple;
	bh=B+SpcROVBiUtQvIC6OHcD4CKKEuvaOSaijrQvK7xPSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SH3n15lXH4XmFFQBCpkZ3bricCGYs2JlS/+EfUBzCddU1pa8UhA7Clwt3fDbI1XTiY6nQsgvW+mQAUkEhJQPikyef2RJVbPZbFc2OZaD25ROE8psX9EbsLzR3pLcjSxVLSCY6DfaJjttQhCQUApgXNQoo+fc4rbwdcwo94SSnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6u3qq0i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6u3qq0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710262978; x=1741798978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+SpcROVBiUtQvIC6OHcD4CKKEuvaOSaijrQvK7xPSE=;
  b=E6u3qq0ioL67hq1aa20IBAUboVLad2Hz8jaSEcWxtaxVhZ7JjyLB7G7L
   cxgcjxSqtl2GKvFy4l8sWUr7J4aQkfQ0KK2VWCAHrVfekFcevDqgeg5cR
   0l4wa6VRAob+J3vxBTtddMh7fxL6sTE+mQ0MdiCfNy88SA61XtpoSDnxU
   8v1N43FASxM1hNojAZpAQX1Ufkjra42Mm+RWY+IJKjgPOUfzQfMOo7gqI
   zcPjVabw/eSv6J6GAthog75n/sPRtlw+0rASEJ2Y6yYJWUyHbqxtMEXIT
   TmjVT9g+SagGRFXgXUxoPaK3LhO4jRcZPR+Gvk77kliIbs/p45oy/A8QO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16430426"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16430426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 10:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34769611"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 10:02:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk5We-000Aov-14;
	Tue, 12 Mar 2024 17:02:52 +0000
Date: Wed, 13 Mar 2024 01:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 23/26] fs/nfs/nfs4xdr.c:2304:2: error: call to
 undeclared function 'encode_get_dir_delegation'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202403130012.qgPeEf1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   794e11b83f62df1c9e75c3411254f60df074a261
commit: d37041e8bb417db3d3403e6a0cf5d899651e6e59 [23/26] nfs: create a new GDD_LOOKUP procedure
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240313/202403130012.qgPeEf1V-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130012.qgPeEf1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130012.qgPeEf1V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfs/nfs4xdr.c:40:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/nfs4xdr.c:49:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
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
   In file included from fs/nfs/nfs4xdr.c:49:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
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
   In file included from fs/nfs/nfs4xdr.c:49:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
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
>> fs/nfs/nfs4xdr.c:2304:2: error: call to undeclared function 'encode_get_dir_delegation'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2304 |         encode_get_dir_delegation(xdr, &hdr);
         |         ^
>> fs/nfs/nfs4xdr.c:6466:11: error: call to undeclared function 'decode_get_dir_delegation'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6466 |         status = decode_get_dir_delegation(xdr, res);
         |                  ^
   17 warnings and 2 errors generated.


vim +/encode_get_dir_delegation +2304 fs/nfs/nfs4xdr.c

  2289	
  2290	/*
  2291	 * Encode GDD_LOOKUP request
  2292	 */
  2293	static void nfs4_xdr_enc_gdd_lookup(struct rpc_rqst *req, struct xdr_stream *xdr,
  2294					    const void *data)
  2295	{
  2296		const struct nfs4_lookup_arg *args = data;
  2297		struct compound_hdr hdr = {
  2298			.minorversion = nfs4_xdr_minorversion(&args->seq_args),
  2299		};
  2300	
  2301		encode_compound_hdr(xdr, req, &hdr);
  2302		encode_sequence(xdr, &args->seq_args, &hdr);
  2303		encode_putfh(xdr, args->dir_fh, &hdr);
> 2304		encode_get_dir_delegation(xdr, &hdr);
  2305		encode_lookup(xdr, args->name, &hdr);
  2306		encode_getfh(xdr, &hdr);
  2307		encode_getfattr(xdr, args->bitmask, &hdr);
  2308		encode_nops(&hdr);
  2309	}
  2310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
