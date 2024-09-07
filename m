Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAD83AC28;
	Sat,  7 Sep 2024 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725739595; cv=none; b=lUh3lA3UuaSYChdJYUVWNwPdn6x0p1AXAyj3C2Fnoq1cHMdnCSJ9gzB07tM/63CRQv5w+p0eeohvcyfv8DcDl3pwKiVLKXBanZbLMWrhiKbxj97lOasT4TmLej+Eizmf0zKgSnXYq3FrRw7qFqVF0d92a91dRxcAf1I3Q24b/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725739595; c=relaxed/simple;
	bh=W7ts99q2fjI69z/OJrtHjUIONKJJ1/+49glervec5hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=joqvahptZSDvkfBtwwhlk3ymSPsNFpcDmLkf9SE34iohTn8nnUX8QZH3SP+552X8Lxh612IHQ9lBJkP/gpFscP9DHtntNZGXJGB0gpddOvVx8HcerGhthnOqlMnwL8fyyaCjPYdOyQ2h2/p/wSjnaBUBJ/r79b6XKhwght+WSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyKLJvcD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyKLJvcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725739594; x=1757275594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W7ts99q2fjI69z/OJrtHjUIONKJJ1/+49glervec5hM=;
  b=lyKLJvcDmapCTjkupgQNPZWE6dx1iUPywATyvPCn0SmvUvGMesFeRLlv
   VDqUCCSt0EXlYdWOk/oq6+RP95BAGyFSGr/6pDZtPe46oJIN9EsGZDEzq
   3tkHy3+yiRErXG3K1OxEMNKKB7EYejM1tzxjEvTrWnJ3cAK42PkON3iZl
   ImpeZjbrWgpexq19qxJ+0FQUwLurdefZ4asjPh5RgAUY3CJMRxzSk4a60
   EUp9/0CeP/AmUyFcwlhIj4uX+rPavoafrybSzK9/aNYJPvbfePGIYbyim
   WQdwF8dWGsQzf/ZIeaShRJYZDJRpP2EoAIyntfPa6idrGlODvkYguefl2
   Q==;
X-CSE-ConnectionGUID: u17LpvhsSeiH3fUiFH0NZw==
X-CSE-MsgGUID: a66RkQ4DTaOWdI2+PM/S8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24667682"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24667682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 13:06:33 -0700
X-CSE-ConnectionGUID: Pzr2pvOfQo2hY3n9/47Blw==
X-CSE-MsgGUID: kusavpeYRA2bonVbILFBBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70669948"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2024 13:06:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1hW-000CxO-1F;
	Sat, 07 Sep 2024 20:06:30 +0000
Date: Sun, 8 Sep 2024 04:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 60/61] fs/ceph/crypto.c:591:5: error:
 conflicting types for 'ceph_fscrypt_decrypt_extents'
Message-ID: <202409080456.mmwwyEi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 6c82994e1a63320f135e88826318c9cad0f31d57 [60/61] fixes
config: i386-randconfig-016-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080456.mmwwyEi2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080456.mmwwyEi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080456.mmwwyEi2-lkp@intel.com/

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
6c82994e1a6332 David Howells 2023-08-23  531   * ceph_fscrypt_decrypt_data - Decrypt buffered data
77cdb7e17e39eb Jeff Layton   2022-08-25  532   * @inode: pointer to inode associated with these pages
6c82994e1a6332 David Howells 2023-08-23  533   * @dbuf: pointer to buffer containing the data
77cdb7e17e39eb Jeff Layton   2022-08-25  534   * @off: offset into the file that the read data starts
77cdb7e17e39eb Jeff Layton   2022-08-25  535   * @len: max length to decrypt
77cdb7e17e39eb Jeff Layton   2022-08-25  536   *
6c82994e1a6332 David Howells 2023-08-23  537   * Decrypt an buffer of fscrypt'ed pages and return the amount of
77cdb7e17e39eb Jeff Layton   2022-08-25  538   * data decrypted. Any data in the page prior to the start of the
77cdb7e17e39eb Jeff Layton   2022-08-25  539   * first complete block in the read is ignored. Any incomplete
77cdb7e17e39eb Jeff Layton   2022-08-25  540   * crypto blocks at the end of the array are ignored (and should
77cdb7e17e39eb Jeff Layton   2022-08-25  541   * probably be zeroed by the caller).
77cdb7e17e39eb Jeff Layton   2022-08-25  542   *
77cdb7e17e39eb Jeff Layton   2022-08-25  543   * Returns the length of the decrypted data or a negative errno.
77cdb7e17e39eb Jeff Layton   2022-08-25  544   */
6c82994e1a6332 David Howells 2023-08-23 @545  int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
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
6c82994e1a6332 David Howells 2023-08-23  565  		fret = ceph_fscrypt_decrypt_block_inplace(inode,
6c82994e1a6332 David Howells 2023-08-23  566  				ceph_databuf_page(dbuf, pgidx),
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
