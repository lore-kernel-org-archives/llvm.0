Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4A39ACC;
	Fri, 29 Nov 2024 22:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732920665; cv=none; b=TfRJdu9bn+xZD2rkXbVABev4WsU/msFGT44x3ZMrWDs/ExH2QnoV3rhNo/F+ERjikUKOhIIoiUQRZwc/VBukL+LskgTkKTkSUwul95du3W//dgXUrIKMFLXIBLghilI60S8NSrctU9PwCUlWa/2ZykqWgA3PA4lIOfe981MboKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732920665; c=relaxed/simple;
	bh=oS09n6deOfXpvBpPfrGPRPw08VZ2vHFV/YLKM3oEi4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6lDdvhH5Btl4w5XkBGlCS9pQpYj0FoubKY73VMrW+0jnQz/9Ktb3t//Cuws5zxsir1njdIp8ZgMoZTgvh6hxI/TlewVc9gFcyGpivSDdRuhfp+aNyLIcx6hfo0/KzJqWCteOlPbVXHkVqZ0rtNm0J4kOC9bhgdlnmsiZgVm8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5F0fGHa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5F0fGHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732920664; x=1764456664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS09n6deOfXpvBpPfrGPRPw08VZ2vHFV/YLKM3oEi4k=;
  b=Z5F0fGHa2MdZSnX0smksniazEaEos8dA5LSp1T0WnoTyskvzwGMsfSD7
   G4BPqosbByQznCRSWS0u2y168omtuQ94E9QUs2Z/mgl0U5kgDf+kHm33/
   v770t7L1uE6D0cE0F5bZnceR1racybyjOllgvMcbaggOF6rH5bpuQggfL
   l3+7VLbmw7xQoGZDXvfciOHv2eR2zO0GQ+jTuyIsT6lnmWFisQxOPc7L1
   n9ZVSQXKIH9THxDDpvpjZttXUfzi9zRVCBzIw/iqg87HYecAMD6hy8+cV
   A/kXQ0MLb0cbaA7pzukAn7n6rHvq+elVXLeTr3b3elnVkwg50jMWAwJvg
   g==;
X-CSE-ConnectionGUID: ZiN/v8klTryq3NX/tERAzg==
X-CSE-MsgGUID: OWIPrj1VRwqLpLW5CQVYyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33287532"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="33287532"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 14:51:03 -0800
X-CSE-ConnectionGUID: us8SrPN2TZW2KMXQxEZH+w==
X-CSE-MsgGUID: HAkrPj0RSLqi5ic8TBCbGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="97688169"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Nov 2024 14:51:02 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH9pD-0000k1-1H;
	Fri, 29 Nov 2024 22:50:59 +0000
Date: Sat, 30 Nov 2024 06:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 85/92] fs/ceph/crypto.c:608:28: error:
 incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to
 parameter of type 'size_t *' (aka 'unsigned long *')
Message-ID: <202411300646.VqI0mIjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: c7c8d01ba173e397c3d0bb05c57aa65fc742b42f [85/92] ceph: Make ceph_calc_file_object_mapping() return size as size_t
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300646.VqI0mIjl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300646.VqI0mIjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300646.VqI0mIjl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ceph/crypto.c:10:
   In file included from include/linux/xattr.h:18:
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
   In file included from fs/ceph/crypto.c:14:
   In file included from fs/ceph/super.h:6:
   In file included from include/linux/ceph/osd_client.h:15:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
   In file included from fs/ceph/crypto.c:14:
   In file included from fs/ceph/super.h:6:
   In file included from include/linux/ceph/osd_client.h:15:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
   In file included from fs/ceph/crypto.c:14:
   In file included from fs/ceph/super.h:6:
   In file included from include/linux/ceph/osd_client.h:15:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
>> fs/ceph/crypto.c:608:28: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,-Wincompatible-pointer-types]
     608 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
   include/linux/ceph/striper.h:13:41: note: passing argument to parameter 'xlen' here
      13 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                                     ^
   16 warnings and 1 error generated.


vim +608 fs/ceph/crypto.c

77cdb7e17e39eb Jeff Layton 2022-08-25  577  
77cdb7e17e39eb Jeff Layton 2022-08-25  578  /**
77cdb7e17e39eb Jeff Layton 2022-08-25  579   * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
77cdb7e17e39eb Jeff Layton 2022-08-25  580   * @inode: inode associated with pages being decrypted
77cdb7e17e39eb Jeff Layton 2022-08-25  581   * @page: pointer to page array
77cdb7e17e39eb Jeff Layton 2022-08-25  582   * @off: offset into the file that the data in page[0] starts
77cdb7e17e39eb Jeff Layton 2022-08-25  583   * @map: pointer to extent array
77cdb7e17e39eb Jeff Layton 2022-08-25  584   * @ext_cnt: length of extent array
77cdb7e17e39eb Jeff Layton 2022-08-25  585   *
77cdb7e17e39eb Jeff Layton 2022-08-25  586   * Given an extent map and a page array, decrypt the received data in-place,
77cdb7e17e39eb Jeff Layton 2022-08-25  587   * skipping holes. Returns the offset into buffer of end of last decrypted
77cdb7e17e39eb Jeff Layton 2022-08-25  588   * block.
77cdb7e17e39eb Jeff Layton 2022-08-25  589   */
77cdb7e17e39eb Jeff Layton 2022-08-25  590  int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
77cdb7e17e39eb Jeff Layton 2022-08-25  591  				 u64 off, struct ceph_sparse_extent *map,
77cdb7e17e39eb Jeff Layton 2022-08-25  592  				 u32 ext_cnt)
77cdb7e17e39eb Jeff Layton 2022-08-25  593  {
38d46409c4639a Xiubo Li    2023-06-12  594  	struct ceph_client *cl = ceph_inode_to_client(inode);
77cdb7e17e39eb Jeff Layton 2022-08-25  595  	int i, ret = 0;
77cdb7e17e39eb Jeff Layton 2022-08-25  596  	struct ceph_inode_info *ci = ceph_inode(inode);
77cdb7e17e39eb Jeff Layton 2022-08-25  597  	u64 objno, objoff;
77cdb7e17e39eb Jeff Layton 2022-08-25  598  	u32 xlen;
77cdb7e17e39eb Jeff Layton 2022-08-25  599  
77cdb7e17e39eb Jeff Layton 2022-08-25  600  	/* Nothing to do for empty array */
77cdb7e17e39eb Jeff Layton 2022-08-25  601  	if (ext_cnt == 0) {
38d46409c4639a Xiubo Li    2023-06-12  602  		doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
38d46409c4639a Xiubo Li    2023-06-12  603  		      ceph_vinop(inode));
77cdb7e17e39eb Jeff Layton 2022-08-25  604  		return 0;
77cdb7e17e39eb Jeff Layton 2022-08-25  605  	}
77cdb7e17e39eb Jeff Layton 2022-08-25  606  
77cdb7e17e39eb Jeff Layton 2022-08-25  607  	ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
77cdb7e17e39eb Jeff Layton 2022-08-25 @608  				      &objno, &objoff, &xlen);
77cdb7e17e39eb Jeff Layton 2022-08-25  609  
77cdb7e17e39eb Jeff Layton 2022-08-25  610  	for (i = 0; i < ext_cnt; ++i) {
77cdb7e17e39eb Jeff Layton 2022-08-25  611  		struct ceph_sparse_extent *ext = &map[i];
77cdb7e17e39eb Jeff Layton 2022-08-25  612  		int pgsoff = ext->off - objoff;
77cdb7e17e39eb Jeff Layton 2022-08-25  613  		int pgidx = pgsoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton 2022-08-25  614  		int fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  615  
77cdb7e17e39eb Jeff Layton 2022-08-25  616  		if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
38d46409c4639a Xiubo Li    2023-06-12  617  			pr_warn_client(cl,
38d46409c4639a Xiubo Li    2023-06-12  618  				"%p %llx.%llx bad encrypted sparse extent "
38d46409c4639a Xiubo Li    2023-06-12  619  				"idx %d off %llx len %llx\n",
38d46409c4639a Xiubo Li    2023-06-12  620  				inode, ceph_vinop(inode), i, ext->off,
38d46409c4639a Xiubo Li    2023-06-12  621  				ext->len);
77cdb7e17e39eb Jeff Layton 2022-08-25  622  			return -EIO;
77cdb7e17e39eb Jeff Layton 2022-08-25  623  		}
77cdb7e17e39eb Jeff Layton 2022-08-25  624  		fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
77cdb7e17e39eb Jeff Layton 2022-08-25  625  						 off + pgsoff, ext->len);
38d46409c4639a Xiubo Li    2023-06-12  626  		doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
38d46409c4639a Xiubo Li    2023-06-12  627  		      ceph_vinop(inode), i, ext->off, ext->len, fret);
77cdb7e17e39eb Jeff Layton 2022-08-25  628  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton 2022-08-25  629  			if (ret == 0)
77cdb7e17e39eb Jeff Layton 2022-08-25  630  				ret = fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  631  			break;
77cdb7e17e39eb Jeff Layton 2022-08-25  632  		}
77cdb7e17e39eb Jeff Layton 2022-08-25  633  		ret = pgsoff + fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  634  	}
38d46409c4639a Xiubo Li    2023-06-12  635  	doutc(cl, "ret %d\n", ret);
77cdb7e17e39eb Jeff Layton 2022-08-25  636  	return ret;
77cdb7e17e39eb Jeff Layton 2022-08-25  637  }
77cdb7e17e39eb Jeff Layton 2022-08-25  638  

:::::: The code at line 608 was first introduced by commit
:::::: 77cdb7e17e39ebb986f60bbd3c2b3507687bf475 ceph: add infrastructure for file encryption and decryption

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
