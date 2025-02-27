Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A419DF52;
	Thu, 27 Feb 2025 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688559; cv=none; b=X5D3Or98u6s3ytTOdzPwpvT49vi8Q+S3zYhSEeuR6xC7vu8vMhU4Zg0rmritOKrwrYhZ+b04TgdI1P49blE23pFcyTtIO7GqE77cHwCiY5R7d3lD31+iKaIh89wHeUHihijmE6Sr1MgwRMRer+XToPQuHdPhHg5E9yApAHFH788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688559; c=relaxed/simple;
	bh=1o8FUjTpqzS3RuMIIr9FQiThUDBOQLgA+FoYpmyXXuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TX+7yIWhDMNRMyDVBdXMhn77Xi1HitREL/O5IZe6wtHrcUuA+l9N5pWck2nJAPE3MCXZMsjhlkhWrLT7nSk19ZuqLpjufWSLUtd7SVpmqmrh7i5lCdsfQyspTQUtRYwRhrbLhLUWTlcy8nJ+IRGvOg9YazEfPepkGx3ruTuZFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdryyWgP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdryyWgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740688558; x=1772224558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1o8FUjTpqzS3RuMIIr9FQiThUDBOQLgA+FoYpmyXXuE=;
  b=HdryyWgPn2Bz6zjncXX4Nl9YAPYor7NrK1yr3plQ20joGJTLT5XIFoSm
   B3FEy2xE4NaoygHHHoOY1L+j64EbPn2YW6BTzPd2hrZp5DyrBfZ2u0k5H
   tFIGkaX0WMAfZGtp2W/gZaadBqkKgi+XYmBtH84bXpA/8O8D0vnS8xDki
   DjQ4t6MtuzHIXx2z/mtkVqfahzBd2GSrqvJa3FcnUNHb5zd5bZWRtOvvU
   YmU8YXr2Z16oeekkQJ8AL3r1Xpc1YoNXaZQE2lw1uwBucnbPM2YkvPzgh
   PCd6/HBOF3ZH/gPMYOry1bPanrGl8Jo3jlExs+ItePyyRL17hnElUGJcl
   A==;
X-CSE-ConnectionGUID: Xta3mnVDSAusvmjwWcwB3w==
X-CSE-MsgGUID: tdyU+OqbRfu2iyOvzk6j/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41731564"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41731564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 12:35:57 -0800
X-CSE-ConnectionGUID: XQPMG+fJQAKGNWCTBsRP4g==
X-CSE-MsgGUID: mr5FrbYvRBWoipHItYN7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117632670"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2025 12:35:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnkbp-000E0E-1h;
	Thu, 27 Feb 2025 20:35:53 +0000
Date: Fri, 28 Feb 2025 04:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 39/39] fs/ceph/rdwr.c:644:22: error: use of
 undeclared identifier 'ceph_invalidate_folio'; did you mean
 'netfs_invalidate_folio'?
Message-ID: <202502280438.gFEs9blr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   7ae75822a29ea06bba2be34563c5c915bfa0e79b
commit: 7ae75822a29ea06bba2be34563c5c915bfa0e79b [39/39] ceph: Use netfslib
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250228/202502280438.gFEs9blr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280438.gFEs9blr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280438.gFEs9blr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ceph/rdwr.c:39:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:644:22: error: use of undeclared identifier 'ceph_invalidate_folio'; did you mean 'netfs_invalidate_folio'?
     644 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   include/linux/netfs.h:475:6: note: 'netfs_invalidate_folio' declared here
     475 | void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
         |      ^
>> fs/ceph/rdwr.c:847:14: error: call to undeclared function 'ceph_direct_read_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |                         written = ceph_direct_read_write(iocb, &data, snapc,
         |                                   ^
   fs/ceph/rdwr.c:847:14: note: did you mean 'ceph_prepare_write'?
   fs/ceph/rdwr.c:211:13: note: 'ceph_prepare_write' declared here
     211 | static void ceph_prepare_write(struct netfs_io_subrequest *subreq)
         |             ^
>> fs/ceph/rdwr.c:850:14: error: call to undeclared function 'ceph_sync_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     850 |                         written = ceph_sync_write(iocb, &data, pos, snapc);
         |                                   ^
   fs/ceph/rdwr.c:850:14: note: did you mean 'ceph_issue_write'?
   fs/ceph/rdwr.c:144:13: note: 'ceph_issue_write' declared here
     144 | static void ceph_issue_write(struct netfs_io_subrequest *subreq)
         |             ^
   3 warnings and 3 errors generated.
--
   In file included from fs/ceph/crypto.c:10:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/crypto.c:643:35: error: use of undeclared identifier 'op'
     643 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^
>> fs/ceph/crypto.c:644:42: error: use of undeclared identifier 'inode'
     644 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^
   fs/ceph/crypto.c:646:16: error: use of undeclared identifier 'op'
     646 |         u32 ext_cnt = op->extent.sparse_ext_cnt;
         |                       ^
>> fs/ceph/crypto.c:657:28: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,-Wincompatible-pointer-types]
     657 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
   include/linux/ceph/striper.h:13:41: note: passing argument to parameter 'xlen' here
      13 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                                     ^
>> fs/ceph/crypto.c:670:45: error: use of undeclared identifier 'page'
     670 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^
   fs/ceph/crypto.c:670:37: error: use of undeclared identifier 'inode'
     670 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                   ^
>> fs/ceph/crypto.c:671:8: error: use of undeclared identifier 'off'
     671 |                                                  off + pgsoff, ext->len);
         |                                                  ^
   fs/ceph/crypto.c:639:5: warning: no previous prototype for function 'ceph_decrypt_block' [-Wmissing-prototypes]
     639 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:639:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     639 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         | ^
         | static 
   fs/ceph/crypto.c:685:5: warning: no previous prototype for function 'ceph_encrypt_block' [-Wmissing-prototypes]
     685 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:685:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     685 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         | ^
         | static 
   5 warnings and 7 errors generated.


vim +644 fs/ceph/rdwr.c

   638	
   639	const struct address_space_operations ceph_aops = {
   640		.read_folio	= netfs_read_folio,
   641		.readahead	= netfs_readahead,
   642		.writepages	= ceph_writepages,
   643		.dirty_folio	= netfs_dirty_folio,
 > 644		.invalidate_folio = ceph_invalidate_folio,
   645		.release_folio	= netfs_release_folio,
   646		.direct_IO	= noop_direct_IO,
   647		.migrate_folio	= filemap_migrate_folio,
   648	};
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
