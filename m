Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C849524F;
	Sat, 31 Aug 2024 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725135623; cv=none; b=ABvKaeDzNMEppsTmUX0lty7+oGj8I/P0WNQEeLqER/eMGGINvr+JwzChkxS15ZufggAp0Ivo+BR3FoCiTbrMaCgEzejIgSmUPvWfDBvhX18KNguKw/3pPCloebSQQWuhMFkaV11QBGD6mnkNCjUHn57MGQgP5qt7p/46GbLCnGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725135623; c=relaxed/simple;
	bh=PNgj/O/Vzwrk6ewYaIfsg78vPIOVOvQMUQp92W9nC+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmFYPjEtJ3z8Pk2XfzOIKADqo6ouRIocSBMrig5Peqvo+pYW3mLAnR1maqgESD1v0y6b8oAFJT1szQvUFZB0Kk93aqup/FDlLp2HnU6KzipaNo5nHzMGAU2wJSEmjpET3K8S1epBgEUWyvMojlpXQrQlwhOJGtAsfh+oQgNC7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnHmdYtr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnHmdYtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725135622; x=1756671622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNgj/O/Vzwrk6ewYaIfsg78vPIOVOvQMUQp92W9nC+w=;
  b=RnHmdYtrKpRADovlAsg15YVnPkm4G1UGUQhsfNkkTYU4GxitFjtrywFd
   ay6KvLMWw7pfrL3CHbRfW2EjepuTtO1PUdSWhww51tAcrdp9gjX6qP/QT
   5P/mzDpLRq8LVhJIvE+S9fqFG63SSrkE7GWQPvLJQRW/gfc16YBD3AC3G
   8TXItyB8ZlkGsLWP1isxlpFGvTSMAp5oIIbYFeiUSK851KHsttD388Bkh
   Ofg5Q6f+aN3uKWba7v+XCRX2Su+LVXzEmOJrweYUPiKVEIiVzLJF1YH7j
   hKQMlVLYyPGgpZ6pZXT/sN8ddYRd7a/OWgqf5JJwog6BORq4KTas5Ck56
   Q==;
X-CSE-ConnectionGUID: 6mZvG10RTVSn14d8KmdItA==
X-CSE-MsgGUID: PEUPrH4ORk2paqpOp5jZww==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23623280"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23623280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:20:21 -0700
X-CSE-ConnectionGUID: nEgmfTKcSz6Q/GoITE0lcg==
X-CSE-MsgGUID: quCvZ0RhTQOK8a5nuAfYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64217922"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 13:20:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUa1-00036A-0d;
	Sat, 31 Aug 2024 20:20:17 +0000
Date: Sun, 1 Sep 2024 04:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next.v14-neilb 26/26]
 fs/nfsd/localio.c:73:10: error: incompatible integer to pointer conversion
 returning 'int' from a function with result type 'struct nfs_localio_ctx *'
Message-ID: <202409010430.1Nw20lb5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   70cce93a681fa1956cb736e574953994bfd5aae0
commit: 70cce93a681fa1956cb736e574953994bfd5aae0 [26/26] neilb's __module_get changes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010430.1Nw20lb5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010430.1Nw20lb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010430.1Nw20lb5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfsd/localio.c:11:
   In file included from include/linux/sunrpc/svcauth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/nfsd/localio.c:11:
   In file included from include/linux/sunrpc/svcauth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/nfsd/localio.c:11:
   In file included from include/linux/sunrpc/svcauth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/nfsd/localio.c:73:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct nfs_localio_ctx *' [-Wint-conversion]
      73 |                 return -ENXIO;
         |                        ^~~~~~
   16 warnings and 1 error generated.


vim +73 fs/nfsd/localio.c

    25	
    26	/**
    27	 * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
    28	 *
    29	 * @cl_nfssvc_net: the 'struct net' to use to get the proper nfsd_net
    30	 * @cl_nfssvc_dom: the 'struct auth_domain' required for localio access
    31	 * @rpc_clnt: rpc_clnt that the client established, used for sockaddr and cred
    32	 * @cred: cred that the client established
    33	 * @nfs_fh: filehandle to lookup
    34	 * @fmode: fmode_t to use for open
    35	 *
    36	 * This function maps a local fh to a path on a local filesystem.
    37	 * This is useful when the nfs client has the local server mounted - it can
    38	 * avoid all the NFS overhead with reads, writes and commits.
    39	 *
    40	 * On successful return, returned nfs_localio_ctx will have its nfsd_file and
    41	 * nfsd_net members set. Caller is responsible for calling nfsd_file_put and
    42	 * nfsd_serv_put (via nfs_localio_ctx_free).
    43	 */
    44	struct nfs_localio_ctx *
    45	nfsd_open_local_fh(nfs_uuid_t *uuid,
    46			   struct rpc_clnt *rpc_clnt, const struct cred *cred,
    47			   const struct nfs_fh *nfs_fh, const fmode_t fmode)
    48		__must_hold(rcu)
    49	{
    50		int mayflags = NFSD_MAY_LOCALIO;
    51		int status = 0;
    52		struct nfsd_net *nn = NULL;
    53		struct net *net;
    54		struct svc_cred rq_cred;
    55		struct svc_fh fh;
    56		struct nfs_localio_ctx *localio;
    57		__be32 beres;
    58	
    59		if (nfs_fh->size > NFS4_FHSIZE)
    60			return ERR_PTR(-EINVAL);
    61	
    62		/*
    63		 * Not running in nfsd context, so must safely get reference on nfsd_serv.
    64		 * But the server may already be shutting down, if so disallow new localio.
    65		 * uuid->net is NOT a counted reference, but rcu_read_lock() ensures that if
    66		 * uuid->net is not NULL, then nfsd_serv_try_get() is safe and if that succeeds
    67		 * we will have an implied reference to the net.
    68		 */
    69		net = READ_ONCE(uuid->net);
    70		if (net)
    71			nn = net_generic(net, nfsd_net_id);
    72		if (unlikely(!nn || !nfsd_serv_try_get(nn)))
  > 73			return -ENXIO;
    74	
    75		/* Drop the rcu lock for alloc and nfsd_file_acquire_local() */
    76		rcu_read_unlock();
    77	
    78		localio = nfs_localio_ctx_alloc();
    79		if (!localio) {
    80			localio = ERR_PTR(-ENOMEM);
    81			nfsd_serv_put(nn);
    82			goto out_localio;
    83		}
    84	
    85		/* nfs_fh -> svc_fh */
    86		fh_init(&fh, NFS4_FHSIZE);
    87		fh.fh_handle.fh_size = nfs_fh->size;
    88		memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
    89	
    90		if (fmode & FMODE_READ)
    91			mayflags |= NFSD_MAY_READ;
    92		if (fmode & FMODE_WRITE)
    93			mayflags |= NFSD_MAY_WRITE;
    94	
    95		svcauth_map_clnt_to_svc_cred_local(rpc_clnt, cred, &rq_cred);
    96	
    97		beres = nfsd_file_acquire_local(uuid->net, &rq_cred, uuid->dom,
    98						&fh, mayflags, &localio->nf);
    99		if (beres) {
   100			status = nfs_stat_to_errno(be32_to_cpu(beres));
   101			goto out_fh_put;
   102		}
   103		localio->nn = nn;
   104	
   105	out_fh_put:
   106		fh_put(&fh);
   107		if (rq_cred.cr_group_info)
   108			put_group_info(rq_cred.cr_group_info);
   109	
   110		if (status) {
   111			nfs_localio_ctx_free(localio);
   112			localio = ERR_PTR(status);
   113		}
   114	out_localio:
   115		rcu_read_lock();
   116		return localio;
   117	}
   118	EXPORT_SYMBOL_GPL(nfsd_open_local_fh);
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
