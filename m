Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB013D524;
	Tue,  4 Jun 2024 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514496; cv=none; b=djSjSdK4OFOkFt/bRP8fUnFzaH1NM0BrWRc8KPze54/BLUvdyECSq4bFNuHGylVnfz2Gz7CGHZE3UQA6Xjr1CF9o+DXO/IgUc1i7OfJ9pQZ7ggGksoCtgJ4sPUvM0vVpgf3NM7gQbUedZKMGUzve8lkKBKTiOGX1UmSRiCoRH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514496; c=relaxed/simple;
	bh=Mwml1IVOeg8o4hrtKB7DoFmC5kHA2DiJjTzcURWJGO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5BWNRE7CkrxbMVCes1cziOYeCzOdZhjihsIdhArjWrskyd7yIf1+N04vChI9K7Ufxz+bUsXYK+TDTFHSDRd2MMM/70ow9FkPXh94KZtEnMgX8aBFFCNspjgchUT9tp5txafhpwm6j9N72cnNybU9R5fmt685LpnlEH1N5S7OLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UL3JGpDk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UL3JGpDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717514495; x=1749050495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mwml1IVOeg8o4hrtKB7DoFmC5kHA2DiJjTzcURWJGO0=;
  b=UL3JGpDkD+qJAvBsEXnSulgLdStCH5hyHszluJCxIon/ClnrFRxI5gab
   APLJfFMpok0dAlBctuyV5oBFMYSEW5gI8dcUHgOwGYVTv6Lw4cNmDx6AL
   gm8UTXhrRN6pYBO9PGrNuWfpgsuxFi5Q3GSw4GKZsGgNbwGtAsEolwEFh
   7tStBiL2OmKYi/vEE17GwibRODizrL/CYJp+ScDvJGOliGYtqRcij6VFq
   Z7pjjxib501TRqZWROmpx05DYdiFBZM2+TT0Y0DR4p6HH9gx3+FPVQffd
   iow5KknMXzsuWg0OZAFTLm/91zesf3vyKUrq3lzQZzMey61PTHNsNV/Ye
   Q==;
X-CSE-ConnectionGUID: rmEpwxC9SDyhKeGdyCuKaA==
X-CSE-MsgGUID: ABRTlVUOQqGfQep8NW9Yaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25468925"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="25468925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:21:34 -0700
X-CSE-ConnectionGUID: 9Zg1LHVzSeeuRu/2Be660g==
X-CSE-MsgGUID: nuXfb11uRrqYLpNmUtmwAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="42381294"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Jun 2024 08:21:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEVyR-000NQ3-0a;
	Tue, 04 Jun 2024 15:21:30 +0000
Date: Tue, 4 Jun 2024 23:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] fs: pass sb_flags to submount
Message-ID: <202406042310.4UFqCd5q-lkp@intel.com>
References: <20240604112636.236517-2-lilingfeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604112636.236517-2-lilingfeng@huaweicloud.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on cifs/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus mszeredi-fuse/for-next linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Lingfeng/fs-pass-sb_flags-to-submount/20240604-192813
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240604112636.236517-2-lilingfeng%40huaweicloud.com
patch subject: [PATCH RFC 1/2] fs: pass sb_flags to submount
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240604/202406042310.4UFqCd5q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406042310.4UFqCd5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406042310.4UFqCd5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/client/namespace.c:18:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
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
   In file included from fs/smb/client/namespace.c:18:
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
   In file included from fs/smb/client/namespace.c:18:
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
   In file included from fs/smb/client/namespace.c:18:
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
>> fs/smb/client/namespace.c:205:63: error: too few arguments to function call, expected 3, have 2
     205 |         fc = fs_context_for_submount(path->mnt->mnt_sb->s_type, mntpt);
         |              ~~~~~~~~~~~~~~~~~~~~~~~                                 ^
   include/linux/fs_context.h:132:27: note: 'fs_context_for_submount' declared here
     132 | extern struct fs_context *fs_context_for_submount(struct file_system_type *fs_type,
         |                           ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                                                 struct dentry *reference,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     134 |                                                 unsigned int sb_flags);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +205 fs/smb/client/namespace.c

4508ec17357094 fs/smb/client/namespace.c    Paulo Alcantara 2024-02-11  185  
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  186  /*
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  187   * Create a vfsmount that we can automount
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  188   */
0a049935e47e30 fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  189  static struct vfsmount *cifs_do_automount(struct path *path)
6d5ae0deb1641b fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  190  {
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  191  	int rc;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  192  	struct dentry *mntpt = path->dentry;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  193  	struct fs_context *fc;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  194  	void *page = NULL;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  195  	struct smb3_fs_context *ctx, *cur_ctx;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  196  	struct smb3_fs_context tmp;
c88f7dcd6d6429 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2021-11-03  197  	char *full_path;
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  198  	struct vfsmount *mnt;
6d5ae0deb1641b fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  199  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  200  	if (IS_ROOT(mntpt))
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  201  		return ERR_PTR(-ESTALE);
6d5ae0deb1641b fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  202  
a18280e7fdea1f fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  203  	cur_ctx = CIFS_SB(mntpt->d_sb)->ctx;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  204  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04 @205  	fc = fs_context_for_submount(path->mnt->mnt_sb->s_type, mntpt);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  206  	if (IS_ERR(fc))
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  207  		return ERR_CAST(fc);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  208  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  209  	ctx = smb3_fc2context(fc);
8393072bab060f fs/cifs/cifs_dfs_ref.c       Aurelien Aptel  2018-09-20  210  
f6a9bc336b600e fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  211  	page = alloc_dentry_path();
348a04a8d1138c fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  212  	full_path = automount_fullpath(mntpt, page);
f6a9bc336b600e fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  213  	if (IS_ERR(full_path)) {
f6a9bc336b600e fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  214  		mnt = ERR_CAST(full_path);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  215  		goto out;
f6a9bc336b600e fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  216  	}
1c780228e9d47b fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2018-11-14  217  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  218  	tmp = *cur_ctx;
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  219  	tmp.source = NULL;
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  220  	tmp.leaf_fullpath = NULL;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  221  	tmp.UNC = tmp.prepath = NULL;
b56bce502f5550 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2023-03-14  222  	tmp.dfs_root_ses = NULL;
4508ec17357094 fs/smb/client/namespace.c    Paulo Alcantara 2024-02-11  223  	fs_context_set_ids(&tmp);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  224  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  225  	rc = smb3_fs_context_dup(ctx, &tmp);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  226  	if (rc) {
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  227  		mnt = ERR_PTR(rc);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  228  		goto out;
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  229  	}
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  230  
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  231  	rc = smb3_parse_devname(full_path, ctx);
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  232  	if (rc) {
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  233  		mnt = ERR_PTR(rc);
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  234  		goto out;
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  235  	}
7ad54b98fc1f14 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  236  
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  237  	ctx->source = smb3_fs_context_fullpath(ctx, '/');
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  238  	if (IS_ERR(ctx->source)) {
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  239  		mnt = ERR_CAST(ctx->source);
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  240  		ctx->source = NULL;
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  241  		goto out;
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  242  	}
5e2fd17f434d2f fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  243  	ctx->dfs_automount = is_dfs_mount(mntpt);
5e2fd17f434d2f fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  244  	cifs_dbg(FYI, "%s: ctx: source=%s UNC=%s prepath=%s dfs_automount=%d\n",
5e2fd17f434d2f fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  245  		 __func__, ctx->source, ctx->UNC, ctx->prepath, ctx->dfs_automount);
49024ec8795ed2 fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  246  
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  247  	mnt = fc_mount(fc);
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  248  out:
9fd29a5bae6e8f fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  249  	put_fs_context(fc);
f6a9bc336b600e fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  250  	free_dentry_path(page);
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  251  	return mnt;
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  252  }
01c64feac45cea fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
