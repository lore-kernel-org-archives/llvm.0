Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F18131E56;
	Tue,  6 Feb 2024 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229934; cv=none; b=GolKl4OQFqNcqQpjHMJP1ZyHW9NyUhTbyV6/XpBo7CIJMpbtF3zDHGn5FO8uLZBUTDeW7Fn3GYyvSeeaQEr0c5zlc9Oapqo4bhD3DybJv/6LS3vHnHgMzArG2/yRGr36ukkBdUuY18nP8dWAiHEWOZzBWKgvPiystO+0J104c8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229934; c=relaxed/simple;
	bh=lcByKE4av3ENtPf+Whnaxx7OD1QnfQAP/QGmjy7gtZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lv93I2r7IC4fRxhr9FcmotUuqxI2Yxn72F3xF4/jV8NV8Eg/ckOP1rwST5vVh0+JeWpdePbBTxklxQ32w3VjzlUSwIIHSZvtAnRptVBCQM5aPChG7iai59zVFygAcY2Ot0BcVvVuUGb8cPbOGs5SYC+gmJwRLAscoymSZJQeqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bdl7sesz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bdl7sesz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707229931; x=1738765931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcByKE4av3ENtPf+Whnaxx7OD1QnfQAP/QGmjy7gtZY=;
  b=Bdl7sesz9vMRakr2LLWfuZqQADZ6Hy7pkVLuLqUFqXTzMd6y6hoVl2Le
   T9o2zeYD+NHj2P9H8e2img1wX7Qx0vmyW5LZ89Hw4+AUc0gkzZ5eHCXth
   QocaFNK/vrdA5f19kM3cjj6B0onOpQBtyWzASb+EDLypKTGe3d62mJjVl
   hqD2XswRhrDbCgJko5l8pMKeFdtP2PyrDO9Xx3s4mY6Ps/dfNAQPPwuo0
   1YZYRsD+jST82tXFO5aIypw4A+gWTNhBbUv8xUJq21EPWL8RIEOVcreb+
   JnqR4RWbFTXJrwUQlhGB9FTVyIQeZozxVj5LN/D/rfHQxhI+RfmcOsfRy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4637570"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4637570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1032138"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2024 06:32:07 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXMUX-0001Tl-0p;
	Tue, 06 Feb 2024 14:32:05 +0000
Date: Tue, 6 Feb 2024 22:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 1/1] fs/nfsd/nfs4proc.c:3495:14: error: use of
 undeclared identifier 'nfsd4_get_dir_delegation'; did you mean
 'nfsd4_get_dir_delegation_rsize'?
Message-ID: <202402062248.38sln10s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   bee8a3e4e5747f9458cc5aa8eb0a0c146317cda2
commit: bee8a3e4e5747f9458cc5aa8eb0a0c146317cda2 [1/1] nfsd: encoders and decoders for GET_DIR_DELEGATION
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240206/202402062248.38sln10s-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062248.38sln10s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062248.38sln10s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfs4proc.c:42:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:95:
   In file included from include/linux/tcp.h:17:
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
   In file included from fs/nfsd/nfs4proc.c:42:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:95:
   In file included from include/linux/tcp.h:17:
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
   In file included from fs/nfsd/nfs4proc.c:42:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:95:
   In file included from include/linux/tcp.h:17:
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
>> fs/nfsd/nfs4proc.c:3495:14: error: use of undeclared identifier 'nfsd4_get_dir_delegation'; did you mean 'nfsd4_get_dir_delegation_rsize'?
    3495 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
         |                            nfsd4_get_dir_delegation_rsize
   fs/nfsd/nfs4proc.c:3094:12: note: 'nfsd4_get_dir_delegation_rsize' declared here
    3094 | static u32 nfsd4_get_dir_delegation_rsize(const struct svc_rqst *rqstp,
         |            ^
>> fs/nfsd/nfs4proc.c:3495:14: error: incompatible function pointer types initializing '__be32 (*)(struct svc_rqst *, struct nfsd4_compound_state *, union nfsd4_op_u *)' (aka 'unsigned int (*)(struct svc_rqst *, struct nfsd4_compound_state *, union nfsd4_op_u *)') with an expression of type 'u32 (const struct svc_rqst *, const struct nfsd4_op *)' (aka 'unsigned int (const struct svc_rqst *, const struct nfsd4_op *)') [-Wincompatible-function-pointer-types]
    3495 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.
--
   In file included from fs/nfsd/nfs4xdr.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
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
   In file included from fs/nfsd/nfs4xdr.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
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
   In file included from fs/nfsd/nfs4xdr.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
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
>> fs/nfsd/nfs4xdr.c:5646:28: error: use of undeclared identifier 'nfsd4_encode_get_dir_delegation'; did you mean 'nfsd4_decode_get_dir_delegation'?
    5646 |         [OP_GET_DIR_DELEGATION] = nfsd4_encode_get_dir_delegation,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   nfsd4_decode_get_dir_delegation
   fs/nfsd/nfs4xdr.c:1736:1: note: 'nfsd4_decode_get_dir_delegation' declared here
    1736 | nfsd4_decode_get_dir_delegation(struct nfsd4_compoundargs *argp,
         | ^
>> fs/nfsd/nfs4xdr.c:5646:28: error: incompatible function pointer types initializing 'const nfsd4_enc' (aka 'unsigned int (*const)(struct nfsd4_compoundres *, unsigned int, union nfsd4_op_u *)') with an expression of type '__be32 (struct nfsd4_compoundargs *, union nfsd4_op_u *)' (aka 'unsigned int (struct nfsd4_compoundargs *, union nfsd4_op_u *)') [-Wincompatible-function-pointer-types]
    5646 |         [OP_GET_DIR_DELEGATION] = nfsd4_encode_get_dir_delegation,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +3495 fs/nfsd/nfs4proc.c

  3185	
  3186	
  3187	static const struct nfsd4_operation nfsd4_ops[] = {
  3188		[OP_ACCESS] = {
  3189			.op_func = nfsd4_access,
  3190			.op_name = "OP_ACCESS",
  3191			.op_rsize_bop = nfsd4_access_rsize,
  3192		},
  3193		[OP_CLOSE] = {
  3194			.op_func = nfsd4_close,
  3195			.op_flags = OP_MODIFIES_SOMETHING,
  3196			.op_name = "OP_CLOSE",
  3197			.op_rsize_bop = nfsd4_status_stateid_rsize,
  3198			.op_get_currentstateid = nfsd4_get_closestateid,
  3199			.op_set_currentstateid = nfsd4_set_closestateid,
  3200		},
  3201		[OP_COMMIT] = {
  3202			.op_func = nfsd4_commit,
  3203			.op_flags = OP_MODIFIES_SOMETHING,
  3204			.op_name = "OP_COMMIT",
  3205			.op_rsize_bop = nfsd4_commit_rsize,
  3206		},
  3207		[OP_CREATE] = {
  3208			.op_func = nfsd4_create,
  3209			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME | OP_CLEAR_STATEID,
  3210			.op_name = "OP_CREATE",
  3211			.op_rsize_bop = nfsd4_create_rsize,
  3212		},
  3213		[OP_DELEGRETURN] = {
  3214			.op_func = nfsd4_delegreturn,
  3215			.op_flags = OP_MODIFIES_SOMETHING,
  3216			.op_name = "OP_DELEGRETURN",
  3217			.op_rsize_bop = nfsd4_only_status_rsize,
  3218			.op_get_currentstateid = nfsd4_get_delegreturnstateid,
  3219		},
  3220		[OP_GETATTR] = {
  3221			.op_func = nfsd4_getattr,
  3222			.op_flags = ALLOWED_ON_ABSENT_FS,
  3223			.op_rsize_bop = nfsd4_getattr_rsize,
  3224			.op_name = "OP_GETATTR",
  3225		},
  3226		[OP_GETFH] = {
  3227			.op_func = nfsd4_getfh,
  3228			.op_name = "OP_GETFH",
  3229			.op_rsize_bop = nfsd4_getfh_rsize,
  3230		},
  3231		[OP_LINK] = {
  3232			.op_func = nfsd4_link,
  3233			.op_flags = ALLOWED_ON_ABSENT_FS | OP_MODIFIES_SOMETHING
  3234					| OP_CACHEME,
  3235			.op_name = "OP_LINK",
  3236			.op_rsize_bop = nfsd4_link_rsize,
  3237		},
  3238		[OP_LOCK] = {
  3239			.op_func = nfsd4_lock,
  3240			.op_release = nfsd4_lock_release,
  3241			.op_flags = OP_MODIFIES_SOMETHING |
  3242					OP_NONTRIVIAL_ERROR_ENCODE,
  3243			.op_name = "OP_LOCK",
  3244			.op_rsize_bop = nfsd4_lock_rsize,
  3245			.op_set_currentstateid = nfsd4_set_lockstateid,
  3246		},
  3247		[OP_LOCKT] = {
  3248			.op_func = nfsd4_lockt,
  3249			.op_release = nfsd4_lockt_release,
  3250			.op_flags = OP_NONTRIVIAL_ERROR_ENCODE,
  3251			.op_name = "OP_LOCKT",
  3252			.op_rsize_bop = nfsd4_lock_rsize,
  3253		},
  3254		[OP_LOCKU] = {
  3255			.op_func = nfsd4_locku,
  3256			.op_flags = OP_MODIFIES_SOMETHING,
  3257			.op_name = "OP_LOCKU",
  3258			.op_rsize_bop = nfsd4_status_stateid_rsize,
  3259			.op_get_currentstateid = nfsd4_get_lockustateid,
  3260		},
  3261		[OP_LOOKUP] = {
  3262			.op_func = nfsd4_lookup,
  3263			.op_flags = OP_HANDLES_WRONGSEC | OP_CLEAR_STATEID,
  3264			.op_name = "OP_LOOKUP",
  3265			.op_rsize_bop = nfsd4_only_status_rsize,
  3266		},
  3267		[OP_LOOKUPP] = {
  3268			.op_func = nfsd4_lookupp,
  3269			.op_flags = OP_HANDLES_WRONGSEC | OP_CLEAR_STATEID,
  3270			.op_name = "OP_LOOKUPP",
  3271			.op_rsize_bop = nfsd4_only_status_rsize,
  3272		},
  3273		[OP_NVERIFY] = {
  3274			.op_func = nfsd4_nverify,
  3275			.op_name = "OP_NVERIFY",
  3276			.op_rsize_bop = nfsd4_only_status_rsize,
  3277		},
  3278		[OP_OPEN] = {
  3279			.op_func = nfsd4_open,
  3280			.op_flags = OP_HANDLES_WRONGSEC | OP_MODIFIES_SOMETHING,
  3281			.op_name = "OP_OPEN",
  3282			.op_rsize_bop = nfsd4_open_rsize,
  3283			.op_set_currentstateid = nfsd4_set_openstateid,
  3284		},
  3285		[OP_OPEN_CONFIRM] = {
  3286			.op_func = nfsd4_open_confirm,
  3287			.op_flags = OP_MODIFIES_SOMETHING,
  3288			.op_name = "OP_OPEN_CONFIRM",
  3289			.op_rsize_bop = nfsd4_status_stateid_rsize,
  3290		},
  3291		[OP_OPEN_DOWNGRADE] = {
  3292			.op_func = nfsd4_open_downgrade,
  3293			.op_flags = OP_MODIFIES_SOMETHING,
  3294			.op_name = "OP_OPEN_DOWNGRADE",
  3295			.op_rsize_bop = nfsd4_status_stateid_rsize,
  3296			.op_get_currentstateid = nfsd4_get_opendowngradestateid,
  3297			.op_set_currentstateid = nfsd4_set_opendowngradestateid,
  3298		},
  3299		[OP_PUTFH] = {
  3300			.op_func = nfsd4_putfh,
  3301			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3302					| OP_IS_PUTFH_LIKE | OP_CLEAR_STATEID,
  3303			.op_name = "OP_PUTFH",
  3304			.op_rsize_bop = nfsd4_only_status_rsize,
  3305		},
  3306		[OP_PUTPUBFH] = {
  3307			.op_func = nfsd4_putrootfh,
  3308			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3309					| OP_IS_PUTFH_LIKE | OP_CLEAR_STATEID,
  3310			.op_name = "OP_PUTPUBFH",
  3311			.op_rsize_bop = nfsd4_only_status_rsize,
  3312		},
  3313		[OP_PUTROOTFH] = {
  3314			.op_func = nfsd4_putrootfh,
  3315			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3316					| OP_IS_PUTFH_LIKE | OP_CLEAR_STATEID,
  3317			.op_name = "OP_PUTROOTFH",
  3318			.op_rsize_bop = nfsd4_only_status_rsize,
  3319		},
  3320		[OP_READ] = {
  3321			.op_func = nfsd4_read,
  3322			.op_release = nfsd4_read_release,
  3323			.op_name = "OP_READ",
  3324			.op_rsize_bop = nfsd4_read_rsize,
  3325			.op_get_currentstateid = nfsd4_get_readstateid,
  3326		},
  3327		[OP_READDIR] = {
  3328			.op_func = nfsd4_readdir,
  3329			.op_name = "OP_READDIR",
  3330			.op_rsize_bop = nfsd4_readdir_rsize,
  3331		},
  3332		[OP_READLINK] = {
  3333			.op_func = nfsd4_readlink,
  3334			.op_name = "OP_READLINK",
  3335			.op_rsize_bop = nfsd4_readlink_rsize,
  3336		},
  3337		[OP_REMOVE] = {
  3338			.op_func = nfsd4_remove,
  3339			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME,
  3340			.op_name = "OP_REMOVE",
  3341			.op_rsize_bop = nfsd4_remove_rsize,
  3342		},
  3343		[OP_RENAME] = {
  3344			.op_func = nfsd4_rename,
  3345			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME,
  3346			.op_name = "OP_RENAME",
  3347			.op_rsize_bop = nfsd4_rename_rsize,
  3348		},
  3349		[OP_RENEW] = {
  3350			.op_func = nfsd4_renew,
  3351			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3352					| OP_MODIFIES_SOMETHING,
  3353			.op_name = "OP_RENEW",
  3354			.op_rsize_bop = nfsd4_only_status_rsize,
  3355	
  3356		},
  3357		[OP_RESTOREFH] = {
  3358			.op_func = nfsd4_restorefh,
  3359			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3360					| OP_IS_PUTFH_LIKE | OP_MODIFIES_SOMETHING,
  3361			.op_name = "OP_RESTOREFH",
  3362			.op_rsize_bop = nfsd4_only_status_rsize,
  3363		},
  3364		[OP_SAVEFH] = {
  3365			.op_func = nfsd4_savefh,
  3366			.op_flags = OP_HANDLES_WRONGSEC | OP_MODIFIES_SOMETHING,
  3367			.op_name = "OP_SAVEFH",
  3368			.op_rsize_bop = nfsd4_only_status_rsize,
  3369		},
  3370		[OP_SECINFO] = {
  3371			.op_func = nfsd4_secinfo,
  3372			.op_release = nfsd4_secinfo_release,
  3373			.op_flags = OP_HANDLES_WRONGSEC,
  3374			.op_name = "OP_SECINFO",
  3375			.op_rsize_bop = nfsd4_secinfo_rsize,
  3376		},
  3377		[OP_SETATTR] = {
  3378			.op_func = nfsd4_setattr,
  3379			.op_name = "OP_SETATTR",
  3380			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME
  3381					| OP_NONTRIVIAL_ERROR_ENCODE,
  3382			.op_rsize_bop = nfsd4_setattr_rsize,
  3383			.op_get_currentstateid = nfsd4_get_setattrstateid,
  3384		},
  3385		[OP_SETCLIENTID] = {
  3386			.op_func = nfsd4_setclientid,
  3387			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3388					| OP_MODIFIES_SOMETHING | OP_CACHEME
  3389					| OP_NONTRIVIAL_ERROR_ENCODE,
  3390			.op_name = "OP_SETCLIENTID",
  3391			.op_rsize_bop = nfsd4_setclientid_rsize,
  3392		},
  3393		[OP_SETCLIENTID_CONFIRM] = {
  3394			.op_func = nfsd4_setclientid_confirm,
  3395			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3396					| OP_MODIFIES_SOMETHING | OP_CACHEME,
  3397			.op_name = "OP_SETCLIENTID_CONFIRM",
  3398			.op_rsize_bop = nfsd4_only_status_rsize,
  3399		},
  3400		[OP_VERIFY] = {
  3401			.op_func = nfsd4_verify,
  3402			.op_name = "OP_VERIFY",
  3403			.op_rsize_bop = nfsd4_only_status_rsize,
  3404		},
  3405		[OP_WRITE] = {
  3406			.op_func = nfsd4_write,
  3407			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME,
  3408			.op_name = "OP_WRITE",
  3409			.op_rsize_bop = nfsd4_write_rsize,
  3410			.op_get_currentstateid = nfsd4_get_writestateid,
  3411		},
  3412		[OP_RELEASE_LOCKOWNER] = {
  3413			.op_func = nfsd4_release_lockowner,
  3414			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_ON_ABSENT_FS
  3415					| OP_MODIFIES_SOMETHING,
  3416			.op_name = "OP_RELEASE_LOCKOWNER",
  3417			.op_rsize_bop = nfsd4_only_status_rsize,
  3418		},
  3419	
  3420		/* NFSv4.1 operations */
  3421		[OP_EXCHANGE_ID] = {
  3422			.op_func = nfsd4_exchange_id,
  3423			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP
  3424					| OP_MODIFIES_SOMETHING,
  3425			.op_name = "OP_EXCHANGE_ID",
  3426			.op_rsize_bop = nfsd4_exchange_id_rsize,
  3427		},
  3428		[OP_BACKCHANNEL_CTL] = {
  3429			.op_func = nfsd4_backchannel_ctl,
  3430			.op_flags = ALLOWED_WITHOUT_FH | OP_MODIFIES_SOMETHING,
  3431			.op_name = "OP_BACKCHANNEL_CTL",
  3432			.op_rsize_bop = nfsd4_only_status_rsize,
  3433		},
  3434		[OP_BIND_CONN_TO_SESSION] = {
  3435			.op_func = nfsd4_bind_conn_to_session,
  3436			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP
  3437					| OP_MODIFIES_SOMETHING,
  3438			.op_name = "OP_BIND_CONN_TO_SESSION",
  3439			.op_rsize_bop = nfsd4_bind_conn_to_session_rsize,
  3440		},
  3441		[OP_CREATE_SESSION] = {
  3442			.op_func = nfsd4_create_session,
  3443			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP
  3444					| OP_MODIFIES_SOMETHING,
  3445			.op_name = "OP_CREATE_SESSION",
  3446			.op_rsize_bop = nfsd4_create_session_rsize,
  3447		},
  3448		[OP_DESTROY_SESSION] = {
  3449			.op_func = nfsd4_destroy_session,
  3450			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP
  3451					| OP_MODIFIES_SOMETHING,
  3452			.op_name = "OP_DESTROY_SESSION",
  3453			.op_rsize_bop = nfsd4_only_status_rsize,
  3454		},
  3455		[OP_SEQUENCE] = {
  3456			.op_func = nfsd4_sequence,
  3457			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP,
  3458			.op_name = "OP_SEQUENCE",
  3459			.op_rsize_bop = nfsd4_sequence_rsize,
  3460		},
  3461		[OP_DESTROY_CLIENTID] = {
  3462			.op_func = nfsd4_destroy_clientid,
  3463			.op_flags = ALLOWED_WITHOUT_FH | ALLOWED_AS_FIRST_OP
  3464					| OP_MODIFIES_SOMETHING,
  3465			.op_name = "OP_DESTROY_CLIENTID",
  3466			.op_rsize_bop = nfsd4_only_status_rsize,
  3467		},
  3468		[OP_RECLAIM_COMPLETE] = {
  3469			.op_func = nfsd4_reclaim_complete,
  3470			.op_flags = ALLOWED_WITHOUT_FH | OP_MODIFIES_SOMETHING,
  3471			.op_name = "OP_RECLAIM_COMPLETE",
  3472			.op_rsize_bop = nfsd4_only_status_rsize,
  3473		},
  3474		[OP_SECINFO_NO_NAME] = {
  3475			.op_func = nfsd4_secinfo_no_name,
  3476			.op_release = nfsd4_secinfo_no_name_release,
  3477			.op_flags = OP_HANDLES_WRONGSEC,
  3478			.op_name = "OP_SECINFO_NO_NAME",
  3479			.op_rsize_bop = nfsd4_secinfo_rsize,
  3480		},
  3481		[OP_TEST_STATEID] = {
  3482			.op_func = nfsd4_test_stateid,
  3483			.op_flags = ALLOWED_WITHOUT_FH,
  3484			.op_name = "OP_TEST_STATEID",
  3485			.op_rsize_bop = nfsd4_test_stateid_rsize,
  3486		},
  3487		[OP_FREE_STATEID] = {
  3488			.op_func = nfsd4_free_stateid,
  3489			.op_flags = ALLOWED_WITHOUT_FH | OP_MODIFIES_SOMETHING,
  3490			.op_name = "OP_FREE_STATEID",
  3491			.op_get_currentstateid = nfsd4_get_freestateid,
  3492			.op_rsize_bop = nfsd4_only_status_rsize,
  3493		},
  3494		[OP_GET_DIR_DELEGATION] = {
> 3495			.op_func = nfsd4_get_dir_delegation,
  3496			.op_flags = OP_MODIFIES_SOMETHING,
  3497			.op_name = "OP_GET_DIR_DELEGATION",
  3498			.op_rsize_bop = nfsd4_get_dir_delegation_rsize,
  3499		},
  3500	#ifdef CONFIG_NFSD_PNFS
  3501		[OP_GETDEVICEINFO] = {
  3502			.op_func = nfsd4_getdeviceinfo,
  3503			.op_release = nfsd4_getdeviceinfo_release,
  3504			.op_flags = ALLOWED_WITHOUT_FH,
  3505			.op_name = "OP_GETDEVICEINFO",
  3506			.op_rsize_bop = nfsd4_getdeviceinfo_rsize,
  3507		},
  3508		[OP_LAYOUTGET] = {
  3509			.op_func = nfsd4_layoutget,
  3510			.op_release = nfsd4_layoutget_release,
  3511			.op_flags = OP_MODIFIES_SOMETHING,
  3512			.op_name = "OP_LAYOUTGET",
  3513			.op_rsize_bop = nfsd4_layoutget_rsize,
  3514		},
  3515		[OP_LAYOUTCOMMIT] = {
  3516			.op_func = nfsd4_layoutcommit,
  3517			.op_flags = OP_MODIFIES_SOMETHING,
  3518			.op_name = "OP_LAYOUTCOMMIT",
  3519			.op_rsize_bop = nfsd4_layoutcommit_rsize,
  3520		},
  3521		[OP_LAYOUTRETURN] = {
  3522			.op_func = nfsd4_layoutreturn,
  3523			.op_flags = OP_MODIFIES_SOMETHING,
  3524			.op_name = "OP_LAYOUTRETURN",
  3525			.op_rsize_bop = nfsd4_layoutreturn_rsize,
  3526		},
  3527	#endif /* CONFIG_NFSD_PNFS */
  3528	
  3529		/* NFSv4.2 operations */
  3530		[OP_ALLOCATE] = {
  3531			.op_func = nfsd4_allocate,
  3532			.op_flags = OP_MODIFIES_SOMETHING,
  3533			.op_name = "OP_ALLOCATE",
  3534			.op_rsize_bop = nfsd4_only_status_rsize,
  3535		},
  3536		[OP_DEALLOCATE] = {
  3537			.op_func = nfsd4_deallocate,
  3538			.op_flags = OP_MODIFIES_SOMETHING,
  3539			.op_name = "OP_DEALLOCATE",
  3540			.op_rsize_bop = nfsd4_only_status_rsize,
  3541		},
  3542		[OP_CLONE] = {
  3543			.op_func = nfsd4_clone,
  3544			.op_flags = OP_MODIFIES_SOMETHING,
  3545			.op_name = "OP_CLONE",
  3546			.op_rsize_bop = nfsd4_only_status_rsize,
  3547		},
  3548		[OP_COPY] = {
  3549			.op_func = nfsd4_copy,
  3550			.op_flags = OP_MODIFIES_SOMETHING,
  3551			.op_name = "OP_COPY",
  3552			.op_rsize_bop = nfsd4_copy_rsize,
  3553		},
  3554		[OP_READ_PLUS] = {
  3555			.op_func = nfsd4_read,
  3556			.op_release = nfsd4_read_release,
  3557			.op_name = "OP_READ_PLUS",
  3558			.op_rsize_bop = nfsd4_read_plus_rsize,
  3559			.op_get_currentstateid = nfsd4_get_readstateid,
  3560		},
  3561		[OP_SEEK] = {
  3562			.op_func = nfsd4_seek,
  3563			.op_name = "OP_SEEK",
  3564			.op_rsize_bop = nfsd4_seek_rsize,
  3565		},
  3566		[OP_OFFLOAD_STATUS] = {
  3567			.op_func = nfsd4_offload_status,
  3568			.op_name = "OP_OFFLOAD_STATUS",
  3569			.op_rsize_bop = nfsd4_offload_status_rsize,
  3570		},
  3571		[OP_OFFLOAD_CANCEL] = {
  3572			.op_func = nfsd4_offload_cancel,
  3573			.op_flags = OP_MODIFIES_SOMETHING,
  3574			.op_name = "OP_OFFLOAD_CANCEL",
  3575			.op_rsize_bop = nfsd4_only_status_rsize,
  3576		},
  3577		[OP_COPY_NOTIFY] = {
  3578			.op_func = nfsd4_copy_notify,
  3579			.op_flags = OP_MODIFIES_SOMETHING,
  3580			.op_name = "OP_COPY_NOTIFY",
  3581			.op_rsize_bop = nfsd4_copy_notify_rsize,
  3582		},
  3583		[OP_GETXATTR] = {
  3584			.op_func = nfsd4_getxattr,
  3585			.op_name = "OP_GETXATTR",
  3586			.op_rsize_bop = nfsd4_getxattr_rsize,
  3587		},
  3588		[OP_SETXATTR] = {
  3589			.op_func = nfsd4_setxattr,
  3590			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME,
  3591			.op_name = "OP_SETXATTR",
  3592			.op_rsize_bop = nfsd4_setxattr_rsize,
  3593		},
  3594		[OP_LISTXATTRS] = {
  3595			.op_func = nfsd4_listxattrs,
  3596			.op_name = "OP_LISTXATTRS",
  3597			.op_rsize_bop = nfsd4_listxattrs_rsize,
  3598		},
  3599		[OP_REMOVEXATTR] = {
  3600			.op_func = nfsd4_removexattr,
  3601			.op_flags = OP_MODIFIES_SOMETHING | OP_CACHEME,
  3602			.op_name = "OP_REMOVEXATTR",
  3603			.op_rsize_bop = nfsd4_removexattr_rsize,
  3604		},
  3605	};
  3606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
