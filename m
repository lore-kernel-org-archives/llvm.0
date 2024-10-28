Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177134C83;
	Mon, 28 Oct 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114339; cv=none; b=oaET+ktlXJVGZEsBZ/cv8xFKm5S8+JM0+TYsHpc8sCS3Q600aItASMt2o9EciN1CMJdsE0UNffukRnZUe+aABsOlKpuBCwaNwgJCv21rqD2R3WL0tp4g8BYoqJv39URu+iy3HoLdF4lM8wC1dZ5DDZR04AjIiPdAzgjySHVNGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114339; c=relaxed/simple;
	bh=qFW5hjxLkY1oAZdU3CkzOrrO5DoeWM+vFdlF5H19+eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DugFFUi1mRMt0WZtxvWcR/k12tA44Zk2Vm0TWDWE4mm1njJTM9M99YXR6nCAsNfBSutxepG8n8eucSAqi7kpWmWFa1mvggVEvLl80Ei4rEoFXdyknVHNKjWNWZz6Y8WQPcMNiO0LVsXoR0bxb3vUNgsaBZV+nusHtcvoAmTW5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEyYhUse; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEyYhUse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730114336; x=1761650336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFW5hjxLkY1oAZdU3CkzOrrO5DoeWM+vFdlF5H19+eA=;
  b=iEyYhUsesmSv4DrtwRF1nTPOzPPfMssy0umjuDPiKQNPKHne8BJmhRL9
   Nn/AIiWm6ldnTgEuq/7xQUvZYJqqBEiSQyGLaJeWr82sy1i4gKH1bsKvd
   9ZqGvDlshVJKjaoGGPINsl7Sc5f6xIztfs4ozTU5tJswkk/OfcAUSCDQy
   1O/mLw+Am740H/qoGkDhlubDvyehNMs7Fuf236z9J5v8c4yDO1NmMK6vY
   kODhxhIuUmC47C8aotiGTYz5v98MkoWpNrE35q2sYjl192hum/6m8AUn+
   06+AS+pDsO4DkNcNZwv8xDAvg1AHfTaY6o9xUwRARFMdSH62m9GEWZ1JQ
   A==;
X-CSE-ConnectionGUID: GeDBo3q8S+GlR1W+8XL9kw==
X-CSE-MsgGUID: tcVOY8nGQ5a2HIUqKt8XLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29138378"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29138378"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 04:18:56 -0700
X-CSE-ConnectionGUID: CW9d6HcARyWWExWR7kYhZQ==
X-CSE-MsgGUID: 43pOFxo5T6WXb4n3ggXfbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82023320"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 04:18:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Nlr-000cLu-2l;
	Mon, 28 Oct 2024 11:18:51 +0000
Date: Mon, 28 Oct 2024 19:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 15/16] fs/nfs/fscache.c:178:19: error:
 no member named 'fh' in 'struct nfs_inode'
Message-ID: <202410281921.j35HTKHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   3cbc13ea704a0dfdaf3fc7e26eb251b50c416e5a
commit: a35a309f28531455cb28a7df34885fb9bf0cd815 [15/16] nfs: cache open nfsd_file(s) in client
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410281921.j35HTKHl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281921.j35HTKHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281921.j35HTKHl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfs/fscache.c:11:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/fscache.c:12:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from fs/nfs/fscache.c:12:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/nfs/fscache.c:12:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
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
>> fs/nfs/fscache.c:178:19: error: no member named 'fh' in 'struct nfs_inode'
     178 |                                                nfsi->fh.data, /* index_key */
         |                                                ~~~~  ^
   fs/nfs/fscache.c:179:19: error: no member named 'fh' in 'struct nfs_inode'
     179 |                                                nfsi->fh.size,
         |                                                ~~~~  ^
   16 warnings and 2 errors generated.


vim +178 fs/nfs/fscache.c

50eaa652b54df1 Dave Wysochanski 2020-04-16  159  
ef79c097bbe972 David Howells    2009-04-03  160  /*
ef79c097bbe972 David Howells    2009-04-03  161   * Initialise the per-inode cache cookie pointer for an NFS inode.
ef79c097bbe972 David Howells    2009-04-03  162   */
f1fe29b4a02d08 David Howells    2013-09-27  163  void nfs_fscache_init_inode(struct inode *inode)
ef79c097bbe972 David Howells    2009-04-03  164  {
402cb8dda949d9 David Howells    2018-04-04  165  	struct nfs_fscache_inode_auxdata auxdata;
dea1bb35c5f35e Trond Myklebust  2019-08-03  166  	struct nfs_server *nfss = NFS_SERVER(inode);
ef79c097bbe972 David Howells    2009-04-03  167  	struct nfs_inode *nfsi = NFS_I(inode);
ef79c097bbe972 David Howells    2009-04-03  168  
88a4d7bdeec978 Dave Wysochanski 2023-02-20  169  	netfs_inode(inode)->cache = NULL;
dea1bb35c5f35e Trond Myklebust  2019-08-03  170  	if (!(nfss->fscache && S_ISREG(inode->i_mode)))
ef79c097bbe972 David Howells    2009-04-03  171  		return;
402cb8dda949d9 David Howells    2018-04-04  172  
45f3a70ba68e1f Dave Wysochanski 2022-03-01  173  	nfs_fscache_update_auxdata(&auxdata, inode);
402cb8dda949d9 David Howells    2018-04-04  174  
88a4d7bdeec978 Dave Wysochanski 2023-02-20  175  	netfs_inode(inode)->cache = fscache_acquire_cookie(
88a4d7bdeec978 Dave Wysochanski 2023-02-20  176  					       nfss->fscache,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  177  					       0,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14 @178  					       nfsi->fh.data, /* index_key */
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  179  					       nfsi->fh.size,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  180  					       &auxdata,      /* aux_data */
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  181  					       sizeof(auxdata),
45f3a70ba68e1f Dave Wysochanski 2022-03-01  182  					       i_size_read(inode));
b4fa966f03b740 David Howells    2023-06-28  183  
b4fa966f03b740 David Howells    2023-06-28  184  	if (netfs_inode(inode)->cache)
b4fa966f03b740 David Howells    2023-06-28  185  		mapping_set_release_always(inode->i_mapping);
ef79c097bbe972 David Howells    2009-04-03  186  }
ef79c097bbe972 David Howells    2009-04-03  187  

:::::: The code at line 178 was first introduced by commit
:::::: a6b5a28eb56c3f4988f7ff5290b954ba296e309a nfs: Convert to new fscache volume/cookie API

:::::: TO: Dave Wysochanski <dwysocha@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
