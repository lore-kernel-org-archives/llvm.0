Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E216130C;
	Sat,  7 Sep 2024 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725728837; cv=none; b=sFUesXYkkL8BIbDVcB9Uwb0O6ASqBG32M2TC4Jegttmy2nDR7DYeOMzr7f9OZVXAPYEu1/Cte0JM6oialvbTswAlvST/rwu7onVJQGHfQGli2HpUKlb91EuiElHv/mKF3X/1SHITtU0Q+t3t0z0cPqd6hS9hZI6Cnf2D1Rfapbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725728837; c=relaxed/simple;
	bh=18urwyX8+BXv5okI9Wt259dXL9yOUJMNuf3Wz3Q+iso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOKXiDbkwhs4gRqdQ1n/vZyeR+XmYcCcJu552zPbheIWsvCzXLck0VjQDW74l5NBN8zYVkecPtnHMLdVBandobx161t9vINH1f47rZZciPYFQkmKbfSkXR12lUaLayenr20sYIVNzXNcrYNc06BTfTO+EjGKQAXVuAR+Fdn8NSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/H2nUtF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/H2nUtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725728835; x=1757264835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18urwyX8+BXv5okI9Wt259dXL9yOUJMNuf3Wz3Q+iso=;
  b=c/H2nUtFVvHHLXmpT1PMmwALyAoI679jZmyLO0vUo35NXTa6TY60gN1F
   GLO1IJ2+2lA1pcij2Sg38osOp3irDtlHE76NW/Pil15E23VfvyT91eBoL
   1smwBwzjfFLqVivT0nFs7qmNT4HdmGh70WWf9hs9/0i0jueTe1zIstG6c
   G81+lpwDPcggK8bCuHR5YPkL1C0jyqvrB9Hi9s4C67dLW5CGQqjwuuzdZ
   8MyhZ2baTwnEoM+VoEqZ4M8XIvGSbFivob8crlRfSu2iPgF0gIVAQYcL4
   ajpzqmPwxdZJIgEFKRuscvGHwZ1UC6oPmTXmZzNhl77UixN+3kRJjuZ/8
   w==;
X-CSE-ConnectionGUID: xeNx+N05S4y6anwvIKfkcA==
X-CSE-MsgGUID: dZHTfdcFRfinqP3hCCGJuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35063167"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35063167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:07:00 -0700
X-CSE-ConnectionGUID: 48637s2gTZ2ID7znU99mVQ==
X-CSE-MsgGUID: rVvGcscPQXWoPNhH7/g3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70820033"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2024 10:06:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smytl-000ClH-0H;
	Sat, 07 Sep 2024 17:06:57 +0000
Date: Sun, 8 Sep 2024 01:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 54/61] fs/ceph/crypto.c:608:28: error:
 incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to
 parameter of type 'size_t *' (aka 'unsigned long *')
Message-ID: <202409080144.nfFyf5FH-lkp@intel.com>
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
commit: 0336b9cc782b62335efbcc0baa8e2395bb36322e [54/61] ceph: Make ceph_calc_file_object_mapping() return size as size_t
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240908/202409080144.nfFyf5FH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080144.nfFyf5FH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080144.nfFyf5FH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/crypto.c:608:28: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,-Wincompatible-pointer-types]
     608 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
   include/linux/ceph/striper.h:12:41: note: passing argument to parameter 'xlen' here
      12 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                                     ^
   1 error generated.


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
