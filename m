Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8B15530F;
	Fri, 29 Nov 2024 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732924390; cv=none; b=sfeWAaZ0gVBiedkK9vi5uc7EWirMujLBl4jSQoWpiYnQTeqNYBJZ3iYDGVsBcA4OSOHh/bzzMm4Dy4XWB2aYtPHzGeL7hqHlrFWtlrgVt2GJWgUQQr+XZsbZpQ+inSIcTWMkmIvTFtvaXoQ50F4MUTQp+LDrri0S2+LOFQgrVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732924390; c=relaxed/simple;
	bh=l3S3zt/Tlfvj7MhTtzB8Kw43tMhumeOxVmhqzQJ249s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YK2vKvwsoJ3qa9o9Vd/LCgQ+9yy9i2BU9+gSAwitIgrXI3BEnI1am+ILTYFW2Dit7Fa8Kqz6T03Yy/Mrmmg0kVGoqTwD8ee4HZj/V7Z1HQRn0L/3iJbrQGKsVKUGT1Z8ua8taAcM+DEQPnW0vPX1g4HmOJC55IUWqQix4Xh/Zi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wohr3m2D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wohr3m2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732924388; x=1764460388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3S3zt/Tlfvj7MhTtzB8Kw43tMhumeOxVmhqzQJ249s=;
  b=Wohr3m2Dg6m5dA3iv8WOO/dfG0MnFtP5wOwEv5OmO+SHBVErUwMzEu2Q
   Wz0HmrLQBRTzLBBffOIYXL+PytVTLoIcnWQ9Rc7UXRMngmlPGFSlat0X7
   KaJR7CFvS1gXPeV1cvPM4jYil5sY7RCns6ynDNb7X4U2Hfh9WJgnSTyy2
   lQWUS5WN0stV2iUK5/9pJsmXVaYrXHl81dPu8qHMp6hyC/uC1+ty8lHQa
   DDYBYh3uX2b2laNl4CBAOlyLo3bNkdWIsgouQDH/y7Dr7F0QXVzVl6d3J
   JPz8K0YXYlUjCMhXmiFgMzjypbowgowgly15JJUgXDLtF+vaWmZoJ3833
   A==;
X-CSE-ConnectionGUID: xyL7WMiSTe2NjOvRePwRrw==
X-CSE-MsgGUID: HjTVVX9xRCOddROjL2nIew==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36019810"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="36019810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 15:53:08 -0800
X-CSE-ConnectionGUID: 4kd8jBrhTmC/0pu+foQzBA==
X-CSE-MsgGUID: WBHaEjrhRY6oTrVswnBSEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92760199"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2024 15:53:07 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAnI-0000m3-0s;
	Fri, 29 Nov 2024 23:53:04 +0000
Date: Sat, 30 Nov 2024 07:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 91/92] fs/ceph/crypto.c:591:5: error:
 conflicting types for 'ceph_fscrypt_decrypt_extents'
Message-ID: <202411300725.jmBeL6Ps-lkp@intel.com>
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
commit: 95bb815d8b7a2551d8378f51ca18e4e1f159eb7a [91/92] fixes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300725.jmBeL6Ps-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300725.jmBeL6Ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300725.jmBeL6Ps-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> fs/ceph/crypto.c:545:5: warning: no previous prototype for function 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^
   fs/ceph/crypto.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         | ^
         | static 
>> fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^
   fs/ceph/crypto.h:160:5: note: previous declaration is here
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^
   fs/ceph/crypto.c:609:28: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,-Wincompatible-pointer-types]
     609 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
   include/linux/ceph/striper.h:13:41: note: passing argument to parameter 'xlen' here
      13 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                                     ^
>> fs/ceph/crypto.c:625:44: error: incompatible pointer types passing 'struct page **' to parameter of type 'struct ceph_databuf *' [-Werror,-Wincompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
   fs/ceph/crypto.c:545:74: note: passing argument to parameter 'dbuf' here
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                                          ^
   17 warnings and 3 errors generated.


vim +/ceph_fscrypt_decrypt_extents +591 fs/ceph/crypto.c

77cdb7e17e39eb Jeff Layton   2022-08-25  529  
77cdb7e17e39eb Jeff Layton   2022-08-25  530  /**
95bb815d8b7a25 David Howells 2023-08-23  531   * ceph_fscrypt_decrypt_data - Decrypt buffered data
77cdb7e17e39eb Jeff Layton   2022-08-25  532   * @inode: pointer to inode associated with these pages
95bb815d8b7a25 David Howells 2023-08-23  533   * @dbuf: pointer to buffer containing the data
77cdb7e17e39eb Jeff Layton   2022-08-25  534   * @off: offset into the file that the read data starts
77cdb7e17e39eb Jeff Layton   2022-08-25  535   * @len: max length to decrypt
77cdb7e17e39eb Jeff Layton   2022-08-25  536   *
95bb815d8b7a25 David Howells 2023-08-23  537   * Decrypt an buffer of fscrypt'ed pages and return the amount of
77cdb7e17e39eb Jeff Layton   2022-08-25  538   * data decrypted. Any data in the page prior to the start of the
77cdb7e17e39eb Jeff Layton   2022-08-25  539   * first complete block in the read is ignored. Any incomplete
77cdb7e17e39eb Jeff Layton   2022-08-25  540   * crypto blocks at the end of the array are ignored (and should
77cdb7e17e39eb Jeff Layton   2022-08-25  541   * probably be zeroed by the caller).
77cdb7e17e39eb Jeff Layton   2022-08-25  542   *
77cdb7e17e39eb Jeff Layton   2022-08-25  543   * Returns the length of the decrypted data or a negative errno.
77cdb7e17e39eb Jeff Layton   2022-08-25  544   */
95bb815d8b7a25 David Howells 2023-08-23 @545  int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
77cdb7e17e39eb Jeff Layton   2022-08-25  546  			       u64 off, int len)
77cdb7e17e39eb Jeff Layton   2022-08-25  547  {
77cdb7e17e39eb Jeff Layton   2022-08-25  548  	int i, num_blocks;
77cdb7e17e39eb Jeff Layton   2022-08-25  549  	u64 baseblk = off >> CEPH_FSCRYPT_BLOCK_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  550  	int ret = 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  551  
77cdb7e17e39eb Jeff Layton   2022-08-25  552  	/*
77cdb7e17e39eb Jeff Layton   2022-08-25  553  	 * We can't deal with partial blocks on an encrypted file, so mask off
77cdb7e17e39eb Jeff Layton   2022-08-25  554  	 * the last bit.
77cdb7e17e39eb Jeff Layton   2022-08-25  555  	 */
77cdb7e17e39eb Jeff Layton   2022-08-25  556  	num_blocks = ceph_fscrypt_blocks(off, len & CEPH_FSCRYPT_BLOCK_MASK);
77cdb7e17e39eb Jeff Layton   2022-08-25  557  
77cdb7e17e39eb Jeff Layton   2022-08-25  558  	/* Decrypt each block */
77cdb7e17e39eb Jeff Layton   2022-08-25  559  	for (i = 0; i < num_blocks; ++i) {
77cdb7e17e39eb Jeff Layton   2022-08-25  560  		int blkoff = i << CEPH_FSCRYPT_BLOCK_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  561  		int pgidx = blkoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  562  		unsigned int pgoffs = offset_in_page(blkoff);
77cdb7e17e39eb Jeff Layton   2022-08-25  563  		int fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  564  
95bb815d8b7a25 David Howells 2023-08-23  565  		fret = ceph_fscrypt_decrypt_block_inplace(inode,
95bb815d8b7a25 David Howells 2023-08-23  566  				ceph_databuf_page(dbuf, pgidx),
77cdb7e17e39eb Jeff Layton   2022-08-25  567  				CEPH_FSCRYPT_BLOCK_SIZE, pgoffs,
77cdb7e17e39eb Jeff Layton   2022-08-25  568  				baseblk + i);
77cdb7e17e39eb Jeff Layton   2022-08-25  569  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton   2022-08-25  570  			if (ret == 0)
77cdb7e17e39eb Jeff Layton   2022-08-25  571  				ret = fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  572  			break;
77cdb7e17e39eb Jeff Layton   2022-08-25  573  		}
77cdb7e17e39eb Jeff Layton   2022-08-25  574  		ret += CEPH_FSCRYPT_BLOCK_SIZE;
77cdb7e17e39eb Jeff Layton   2022-08-25  575  	}
77cdb7e17e39eb Jeff Layton   2022-08-25  576  	return ret;
77cdb7e17e39eb Jeff Layton   2022-08-25  577  }
77cdb7e17e39eb Jeff Layton   2022-08-25  578  
77cdb7e17e39eb Jeff Layton   2022-08-25  579  /**
77cdb7e17e39eb Jeff Layton   2022-08-25  580   * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
77cdb7e17e39eb Jeff Layton   2022-08-25  581   * @inode: inode associated with pages being decrypted
77cdb7e17e39eb Jeff Layton   2022-08-25  582   * @page: pointer to page array
77cdb7e17e39eb Jeff Layton   2022-08-25  583   * @off: offset into the file that the data in page[0] starts
77cdb7e17e39eb Jeff Layton   2022-08-25  584   * @map: pointer to extent array
77cdb7e17e39eb Jeff Layton   2022-08-25  585   * @ext_cnt: length of extent array
77cdb7e17e39eb Jeff Layton   2022-08-25  586   *
77cdb7e17e39eb Jeff Layton   2022-08-25  587   * Given an extent map and a page array, decrypt the received data in-place,
77cdb7e17e39eb Jeff Layton   2022-08-25  588   * skipping holes. Returns the offset into buffer of end of last decrypted
77cdb7e17e39eb Jeff Layton   2022-08-25  589   * block.
77cdb7e17e39eb Jeff Layton   2022-08-25  590   */
77cdb7e17e39eb Jeff Layton   2022-08-25 @591  int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
77cdb7e17e39eb Jeff Layton   2022-08-25  592  				 u64 off, struct ceph_sparse_extent *map,
77cdb7e17e39eb Jeff Layton   2022-08-25  593  				 u32 ext_cnt)
77cdb7e17e39eb Jeff Layton   2022-08-25  594  {
38d46409c4639a Xiubo Li      2023-06-12  595  	struct ceph_client *cl = ceph_inode_to_client(inode);
77cdb7e17e39eb Jeff Layton   2022-08-25  596  	int i, ret = 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  597  	struct ceph_inode_info *ci = ceph_inode(inode);
77cdb7e17e39eb Jeff Layton   2022-08-25  598  	u64 objno, objoff;
77cdb7e17e39eb Jeff Layton   2022-08-25  599  	u32 xlen;
77cdb7e17e39eb Jeff Layton   2022-08-25  600  
77cdb7e17e39eb Jeff Layton   2022-08-25  601  	/* Nothing to do for empty array */
77cdb7e17e39eb Jeff Layton   2022-08-25  602  	if (ext_cnt == 0) {
38d46409c4639a Xiubo Li      2023-06-12  603  		doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  604  		      ceph_vinop(inode));
77cdb7e17e39eb Jeff Layton   2022-08-25  605  		return 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  606  	}
77cdb7e17e39eb Jeff Layton   2022-08-25  607  
77cdb7e17e39eb Jeff Layton   2022-08-25  608  	ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
77cdb7e17e39eb Jeff Layton   2022-08-25  609  				      &objno, &objoff, &xlen);
77cdb7e17e39eb Jeff Layton   2022-08-25  610  
77cdb7e17e39eb Jeff Layton   2022-08-25  611  	for (i = 0; i < ext_cnt; ++i) {
77cdb7e17e39eb Jeff Layton   2022-08-25  612  		struct ceph_sparse_extent *ext = &map[i];
77cdb7e17e39eb Jeff Layton   2022-08-25  613  		int pgsoff = ext->off - objoff;
77cdb7e17e39eb Jeff Layton   2022-08-25  614  		int pgidx = pgsoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  615  		int fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  616  
77cdb7e17e39eb Jeff Layton   2022-08-25  617  		if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
38d46409c4639a Xiubo Li      2023-06-12  618  			pr_warn_client(cl,
38d46409c4639a Xiubo Li      2023-06-12  619  				"%p %llx.%llx bad encrypted sparse extent "
38d46409c4639a Xiubo Li      2023-06-12  620  				"idx %d off %llx len %llx\n",
38d46409c4639a Xiubo Li      2023-06-12  621  				inode, ceph_vinop(inode), i, ext->off,
38d46409c4639a Xiubo Li      2023-06-12  622  				ext->len);
77cdb7e17e39eb Jeff Layton   2022-08-25  623  			return -EIO;
77cdb7e17e39eb Jeff Layton   2022-08-25  624  		}
77cdb7e17e39eb Jeff Layton   2022-08-25 @625  		fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
77cdb7e17e39eb Jeff Layton   2022-08-25  626  						 off + pgsoff, ext->len);
38d46409c4639a Xiubo Li      2023-06-12  627  		doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  628  		      ceph_vinop(inode), i, ext->off, ext->len, fret);
77cdb7e17e39eb Jeff Layton   2022-08-25  629  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton   2022-08-25  630  			if (ret == 0)
77cdb7e17e39eb Jeff Layton   2022-08-25  631  				ret = fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  632  			break;
77cdb7e17e39eb Jeff Layton   2022-08-25  633  		}
77cdb7e17e39eb Jeff Layton   2022-08-25  634  		ret = pgsoff + fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  635  	}
38d46409c4639a Xiubo Li      2023-06-12  636  	doutc(cl, "ret %d\n", ret);
77cdb7e17e39eb Jeff Layton   2022-08-25  637  	return ret;
77cdb7e17e39eb Jeff Layton   2022-08-25  638  }
77cdb7e17e39eb Jeff Layton   2022-08-25  639  

:::::: The code at line 591 was first introduced by commit
:::::: 77cdb7e17e39ebb986f60bbd3c2b3507687bf475 ceph: add infrastructure for file encryption and decryption

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
