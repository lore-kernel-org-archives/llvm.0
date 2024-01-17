Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9E6FB9;
	Wed, 17 Jan 2024 01:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705453611; cv=none; b=rg6NJ2u9D+9e7IF5UkGjqWTNQ5tYG7Zp5QD0b0dKPIjFBCFbkaLS3XT0wlqZZ0mnljv1TXrLjftYBph1L+C1ycYM0A3O1LGhy7Ficn1ec3xK822XBpGzxPo0ajlKwv10bny/Tn+p7GO5u6i21DG/Boa44ez7kSYkyvAFL2sQaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705453611; c=relaxed/simple;
	bh=/pVin9h/kV7Pd/y02Li6WC76Hxlef/ksLxcfe510lag=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=j6htx0r1R0gaEIeF88Lxv+0aSoO0IM/rH7jUSXQ8zo5v3TIZHCtJzvqkdtGF74AcsNnO/2/Snz5D9PLyJC3MHeJDOYIoJIkF3ubxQAm1wGDk/JziWYPn3QKo9xpix+EtElKfrYIlHjZ7Z8+nCdom1kH57VY3AvKsh5NJ+JCJKa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZkjLD+A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZkjLD+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705453610; x=1736989610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pVin9h/kV7Pd/y02Li6WC76Hxlef/ksLxcfe510lag=;
  b=RZkjLD+AFf5X/kFIW2QBmhKvw5Gw1b26XIuWB5Qjbgl2iweBqHyUEIUt
   sHU4SVxa4qYlRczymAsYwo5Lg/fD04b5QD/hnVxalmqsiWOJjtcBLgfAp
   UnN3ezyEMDDLfq9Ld92cBedJ4uY/fDT1QSVC+F1tbwEywl6TzB9l8hX/a
   tpSOCz61ApBliIUl2dyi9hEahZFBkRdhnTgj0K71El007mE/wGC+ijjD3
   DQvnxvY2grnW+vKFk5cvXx4/A7CZDHsGEcQRe4mcb0Yx+sGXAT8pAkpwp
   +WmpUPC0qGreRo8G62K8fzlt9E57IP1hp4LdM0NqeruEGjCS9Snuqj+OV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6746653"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6746653"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 17:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="907566096"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="907566096"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2024 17:06:38 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPuO3-0001R4-31;
	Wed, 17 Jan 2024 01:06:35 +0000
Date: Wed, 17 Jan 2024 09:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 104/105] fs/ceph/crypto.c:591:5: error:
 conflicting types for 'ceph_fscrypt_decrypt_extents'
Message-ID: <202401170901.sSLtPhTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 8c002b7822991845125f6d219796f28b75055b90 [104/105] fixes
config: i386-buildonly-randconfig-002-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170901.sSLtPhTr-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170901.sSLtPhTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170901.sSLtPhTr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> fs/ceph/crypto.c:625:44: error: incompatible pointer types passing 'struct page **' to parameter of type 'struct ceph_databuf *' [-Werror,-Wincompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
   fs/ceph/crypto.c:545:74: note: passing argument to parameter 'dbuf' here
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                                          ^
   1 warning and 2 errors generated.


vim +/ceph_fscrypt_decrypt_extents +591 fs/ceph/crypto.c

77cdb7e17e39eb Jeff Layton   2022-08-25  529  
77cdb7e17e39eb Jeff Layton   2022-08-25  530  /**
8c002b78229918 David Howells 2023-08-23  531   * ceph_fscrypt_decrypt_data - Decrypt buffered data
77cdb7e17e39eb Jeff Layton   2022-08-25  532   * @inode: pointer to inode associated with these pages
8c002b78229918 David Howells 2023-08-23  533   * @dbuf: pointer to buffer containing the data
77cdb7e17e39eb Jeff Layton   2022-08-25  534   * @off: offset into the file that the read data starts
77cdb7e17e39eb Jeff Layton   2022-08-25  535   * @len: max length to decrypt
77cdb7e17e39eb Jeff Layton   2022-08-25  536   *
8c002b78229918 David Howells 2023-08-23  537   * Decrypt an buffer of fscrypt'ed pages and return the amount of
77cdb7e17e39eb Jeff Layton   2022-08-25  538   * data decrypted. Any data in the page prior to the start of the
77cdb7e17e39eb Jeff Layton   2022-08-25  539   * first complete block in the read is ignored. Any incomplete
77cdb7e17e39eb Jeff Layton   2022-08-25  540   * crypto blocks at the end of the array are ignored (and should
77cdb7e17e39eb Jeff Layton   2022-08-25  541   * probably be zeroed by the caller).
77cdb7e17e39eb Jeff Layton   2022-08-25  542   *
77cdb7e17e39eb Jeff Layton   2022-08-25  543   * Returns the length of the decrypted data or a negative errno.
77cdb7e17e39eb Jeff Layton   2022-08-25  544   */
8c002b78229918 David Howells 2023-08-23 @545  int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
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
8c002b78229918 David Howells 2023-08-23  565  		fret = ceph_fscrypt_decrypt_block_inplace(inode,
8c002b78229918 David Howells 2023-08-23  566  				ceph_databuf_page(dbuf, pgidx),
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
