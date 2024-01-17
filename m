Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67379C2;
	Wed, 17 Jan 2024 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705470832; cv=none; b=hbC9e5AC39i//PVqlZXu9mcSooR7yAcz041wonPyDOHv+DhLhc5VBBwtMRoa009O1046FExb2EyF4wT5zIb4NL6pYhMeFvro0sB7cEWgXNz2tKYg5aV+5nLPrEB8kmCdchOlphPYStJuO/KFBH0LWIcJAm/gBKcMDw6J7aofe0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705470832; c=relaxed/simple;
	bh=Hef/C5OHoY7etYNnJr/7e70JyX6zW8AYUxSpbF8/b4c=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=hk9SPx1SeElFeVfjW6QUR2bq0yHjlyAdJgMNKZei2HQzXTMzatQftNmSrYWuKx+9cfkhGKW7Hw7LnhvRCREmyxPJoCZ50mqZVvxvqwY6jT2eyfJaYf03PMTlZxX7OUzgll/Ld98NQ3cGQIK7AsGIinKj72twFfJAFAXuLrIFPUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8KUzZTT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8KUzZTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705470830; x=1737006830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hef/C5OHoY7etYNnJr/7e70JyX6zW8AYUxSpbF8/b4c=;
  b=S8KUzZTTkhpft71Tys57oQG7ZDsANw+ACpKVVM+P1/yyIoMRRR9opLpz
   TDX6pjpOBF500FA82AjiBtozBZXInEkTmmRMQpnDkTOSIQbRQpShlkYz1
   LyjT5A61pBFndcEfyprHbOuklYKZPH2J2k/CNsyJgxDLRVgGVJj8PulsU
   qPvcgkkqAcDxZJMANh1cxCUxxXKEmWAXSKoCn6zdeRMExVlEdg5qfKF26
   ZKgi2ZSDXKjbNCnxjrK2PNXsdCZ7D4l9sIZtEExuZyqNdxI/WGOq5H52s
   ebu2jxvA1DPcBENKPNGsL3tYW84fgwnTOiatB5NJ6+VEs6Nzz77nOqBeW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7171113"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7171113"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 21:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854595448"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="854595448"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jan 2024 21:53:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPyrx-0001f8-0Q;
	Wed, 17 Jan 2024 05:53:45 +0000
Date: Wed, 17 Jan 2024 13:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 105/105] fs/ceph/addr.c:901:37: error: no
 member named 'head_snapc' in 'struct ceph_inode_info'; did you mean
 'i_head_snapc'?
Message-ID: <202401171301.BfWU6V0h-lkp@intel.com>
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
commit: 2cf82c6e7baf6d3a2adc0692707028da395f1553 [105/105] ceph: Use netfslib
config: i386-buildonly-randconfig-002-20240116 (https://download.01.org/0day-ci/archive/20240117/202401171301.BfWU6V0h-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171301.BfWU6V0h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171301.BfWU6V0h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ceph/snapshot.c:40:22: warning: cast from 'void (*)(const void *)' to 'void (*)(struct netfs_group *)' converts to incompatible function type [-Wcast-function-type-strict]
      40 |         snapc->group.free = (void (*)(struct netfs_group *))kfree;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> fs/ceph/addr.c:547:1: warning: unused label 'out' [-Wunused-label]
     547 | out:
         | ^~~~
>> fs/ceph/addr.c:901:37: error: no member named 'head_snapc' in 'struct ceph_inode_info'; did you mean 'i_head_snapc'?
     901 |         return netfs_page_mkwrite(vmf, ci->head_snapc);
         |                                            ^~~~~~~~~~
         |                                            i_head_snapc
   fs/ceph/super.h:415:28: note: 'i_head_snapc' declared here
     415 |         struct ceph_snap_context *i_head_snapc;  /* set if wr_buffer_head > 0 or
         |                                   ^
   1 warning and 1 error generated.
--
   fs/ceph/crypto.c:545:5: warning: no previous prototype for function 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^
   fs/ceph/crypto.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         | ^
         | static 
   fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^
   fs/ceph/crypto.h:160:5: note: previous declaration is here
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^
   fs/ceph/crypto.c:625:44: error: incompatible pointer types passing 'struct page **' to parameter of type 'struct ceph_databuf *' [-Werror,-Wincompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
   fs/ceph/crypto.c:545:74: note: passing argument to parameter 'dbuf' here
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                                          ^
>> fs/ceph/crypto.c:644:35: error: use of undeclared identifier 'op'
     644 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^
>> fs/ceph/crypto.c:645:42: error: use of undeclared identifier 'inode'
     645 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^
   fs/ceph/crypto.c:647:16: error: use of undeclared identifier 'op'
     647 |         u32 ext_cnt = op->extent.sparse_ext_cnt;
         |                       ^
>> fs/ceph/crypto.c:671:45: error: use of undeclared identifier 'page'
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^
   fs/ceph/crypto.c:671:37: error: use of undeclared identifier 'inode'
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                   ^
>> fs/ceph/crypto.c:672:8: error: use of undeclared identifier 'off'
     672 |                                                  off + pgsoff, ext->len);
         |                                                  ^
>> fs/ceph/crypto.c:640:5: warning: no previous prototype for function 'ceph_decrypt_block' [-Wmissing-prototypes]
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:640:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         | ^
         | static 
>> fs/ceph/crypto.c:686:5: warning: no previous prototype for function 'ceph_encrypt_block' [-Wmissing-prototypes]
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         | ^
         | static 
   3 warnings and 8 errors generated.
--
   fs/ceph/file.c:1129:44: warning: variable 'pages' is uninitialized when used here [-Wuninitialized]
    1129 |                         ceph_zero_page_vector_range(zoff, zlen, pages);
         |                                                                 ^~~~~
   fs/ceph/file.c:1021:22: note: initialize the variable 'pages' to silence this warning
    1021 |                 struct page **pages;
         |                                    ^
         |                                     = NULL
>> fs/ceph/file.c:1664:34: error: use of undeclared identifier 'len'
    1664 |         netfs_subreq_terminated(subreq, len, err);
         |                                         ^
>> fs/ceph/file.c:1761:25: error: incompatible pointer types passing 'struct ceph_osd_request *' to parameter of type 'struct netfs_io_subrequest *' [-Werror,-Wincompatible-pointer-types]
    1761 |                 ceph_upload_to_server(req);
         |                                       ^~~
   fs/ceph/file.c:1667:63: note: passing argument to parameter 'subreq' here
    1667 | static void ceph_upload_to_server(struct netfs_io_subrequest *subreq)
         |                                                               ^
   1 warning and 2 errors generated.


vim +901 fs/ceph/addr.c

   890	
   891	/*
   892	 * Notification that a previously read-only page is about to become writable.
   893	 * Note that the caller indicates a single page of a multipage folio.
   894	 */
   895	static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
   896	{
   897		struct ceph_snap_context *snapc;
   898		struct inode *inode = file_inode(vmf->vma->vm_file);
   899		struct ceph_inode_info *ci = ceph_inode(inode);
   900	
 > 901		return netfs_page_mkwrite(vmf, ci->head_snapc);
   902	}
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
