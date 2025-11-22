Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE402F2612;
	Sat, 22 Nov 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763808784; cv=none; b=CehVWi58cXN5dDEW1jxoEUJkpNXmq9QqG5fZ7SomnQFbsGUk1y3yG0v5RreT3K+XziXoPksYc+06776x/EO/tdsuLk1UzcTFH+HsqhnrLZGK8bU+ZvGAuMvekBZDsQB+h7SW4VjQ/qlBpoGlY3u+uDJnTfPUIF7RkW6flPpz2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763808784; c=relaxed/simple;
	bh=zHS+NXzYq6GXi5HdPb121WUv2hXuI8WnXGNwuq1y0xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQos+jXdnMy1ojEZCXPbr1nrLK6vviSaXkudkDwf5ZY9jSex65lGx7C6cKSM9jw3bq8GLR/BvpxCC8qfzr+qMcUOzxlIpWGx5O3OEvEVAcDFXIoWsN7fO8Zcj6WEVgHe0rP7q0dXbK/TDqtmZe43g1WCSgBdnCQjSq4wNuDoW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5R/Xlq3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5R/Xlq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763808783; x=1795344783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHS+NXzYq6GXi5HdPb121WUv2hXuI8WnXGNwuq1y0xQ=;
  b=I5R/Xlq3WgSILi+40JnzqVeVGRarUd7NGT54xdZjLhtOjHio/WJhc+Fb
   8B9jBTu/mE/VpDgvUdOz8egL1DnnGltfGxB8eo9FcOUFp2PjY4AToXznq
   pr9twTeFEga+3XYUTlnJ+zEtRmV92pr+OVdI8njhK1nurR8RpvOK0Fii+
   cnSP20c0SzlO4+EwvuUHuYTGOv2bqp88v1lLEfJmoQEV+5blv0UpFe4Sj
   DlJKTW9ShHE0sgRbMHR87HUbrIJ8XUW9NHIRq3MpTL6tW/yaauPEOcyze
   OCR7Ibi5yTZanBrMRfgKq8UgVMOVZoVSFC/UrUq9oF6Uk+Xao5YMzQGA5
   A==;
X-CSE-ConnectionGUID: xwwqRgTRSzOr9ALhaDXUzw==
X-CSE-MsgGUID: EKOyd1+qSoGUr1LtZTbW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83508810"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="83508810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:53:02 -0800
X-CSE-ConnectionGUID: mUtbF1QPTnqaXHaigorWSw==
X-CSE-MsgGUID: R3sWMjFaR3+Y6xBKQGEevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="196198806"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2025 02:53:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMlEh-0007QF-0o;
	Sat, 22 Nov 2025 10:52:59 +0000
Date: Sat, 22 Nov 2025 18:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 50/63] include/linux/nfs_xdr.h:159:5: error: field
 has incomplete type 'enum nfs4_change_attr_type'
Message-ID: <202511221816.t1qVYzWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   9800773e205f87c3811bef2f1837a30e969c7687
commit: b133c112b8e209d4e1b0690faa2f08ae9fc1b02b [50/63] NFSD: Remove "#include <linux/nfs_fs.h>" from fs/nfsd/localio.c
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511221816.t1qVYzWR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221816.t1qVYzWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221816.t1qVYzWR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/localio.c:17:
>> include/linux/nfs_xdr.h:159:5: error: field has incomplete type 'enum nfs4_change_attr_type'
     159 |                                 change_attr_type; /* Info about change attr */
         |                                 ^
   include/linux/nfs_xdr.h:158:7: note: forward declaration of 'enum nfs4_change_attr_type'
     158 |         enum nfs4_change_attr_type
         |              ^
   include/linux/nfs_xdr.h:265:2: error: unknown type name 'nfs4_stateid'
     265 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:275:2: error: unknown type name 'nfs4_stateid'
     275 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:301:2: error: unknown type name 'nfs4_stateid'
     301 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:333:2: error: unknown type name 'nfs4_stateid'
     333 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:341:2: error: unknown type name 'nfs4_stateid'
     341 |         nfs4_stateid stateid;
         |         ^
>> include/linux/nfs_xdr.h:364:23: error: field has incomplete type 'struct nfs4_deviceid'
     364 |         struct nfs4_deviceid dev_id;
         |                              ^
   include/linux/nfs_xdr.h:364:9: note: forward declaration of 'struct nfs4_deviceid'
     364 |         struct nfs4_deviceid dev_id;
         |                ^
   include/linux/nfs_xdr.h:379:2: error: unknown type name 'nfs4_stateid'
     379 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:397:23: error: field has incomplete type 'struct nfs4_deviceid'
     397 |         struct nfs4_deviceid dev_id;
         |                              ^
   include/linux/nfs_xdr.h:364:9: note: forward declaration of 'struct nfs4_deviceid'
     364 |         struct nfs4_deviceid dev_id;
         |                ^
>> include/linux/nfs_xdr.h:399:18: error: field has incomplete type 'enum nfs_opnum4'
     399 |         enum nfs_opnum4 opnum;
         |                         ^
   include/linux/nfs_xdr.h:399:7: note: forward declaration of 'enum nfs_opnum4'
     399 |         enum nfs_opnum4 opnum;
         |              ^
   include/linux/nfs_xdr.h:405:2: error: unknown type name 'nfs4_stateid'
     405 |         nfs4_stateid stateid;
         |         ^
   include/linux/nfs_xdr.h:435:2: error: unknown type name 'nfs4_stateid'
     435 |         nfs4_stateid                    src_stateid;
         |         ^
   include/linux/nfs_xdr.h:436:2: error: unknown type name 'nfs4_stateid'
     436 |         nfs4_stateid                    dst_stateid;
         |         ^
   include/linux/nfs_xdr.h:461:4: error: unknown type name 'nfs4_stateid'
     461 |                         nfs4_stateid            stateid;
         |                         ^
   include/linux/nfs_xdr.h:487:4: error: unknown type name 'nfs4_verifier'
     487 |                         nfs4_verifier   verifier; /* EXCLUSIVE */
         |                         ^
   include/linux/nfs_xdr.h:489:3: error: unknown type name 'nfs4_stateid'
     489 |                 nfs4_stateid    delegation;             /* CLAIM_DELEGATE_CUR */
         |                 ^
>> include/linux/nfs_xdr.h:496:24: error: field has incomplete type 'enum open_claim_type4'
     496 |         enum open_claim_type4   claim;
         |                                 ^
   include/linux/nfs_xdr.h:496:7: note: forward declaration of 'enum open_claim_type4'
     496 |         enum open_claim_type4   claim;
         |              ^
>> include/linux/nfs_xdr.h:497:19: error: field has incomplete type 'enum createmode4'
     497 |         enum createmode4        createmode;
         |                                 ^
   include/linux/nfs_xdr.h:497:7: note: forward declaration of 'enum createmode4'
     497 |         enum createmode4        createmode;
         |              ^
   include/linux/nfs_xdr.h:505:2: error: unknown type name 'nfs4_stateid'
     505 |         nfs4_stateid            stateid;
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +159 include/linux/nfs_xdr.h

3132e49ecef9dab Jeff Layton          2016-08-10  138  
^1da177e4c3f415 Linus Torvalds       2005-04-16  139  /*
^1da177e4c3f415 Linus Torvalds       2005-04-16  140   * Info on the file system
^1da177e4c3f415 Linus Torvalds       2005-04-16  141   */
^1da177e4c3f415 Linus Torvalds       2005-04-16  142  struct nfs_fsinfo {
^1da177e4c3f415 Linus Torvalds       2005-04-16  143  	struct nfs_fattr	*fattr; /* Post-op attributes */
^1da177e4c3f415 Linus Torvalds       2005-04-16  144  	__u32			rtmax;	/* max.  read transfer size */
^1da177e4c3f415 Linus Torvalds       2005-04-16  145  	__u32			rtpref;	/* pref. read transfer size */
^1da177e4c3f415 Linus Torvalds       2005-04-16  146  	__u32			rtmult;	/* reads should be multiple of this */
^1da177e4c3f415 Linus Torvalds       2005-04-16  147  	__u32			wtmax;	/* max.  write transfer size */
^1da177e4c3f415 Linus Torvalds       2005-04-16  148  	__u32			wtpref;	/* pref. write transfer size */
^1da177e4c3f415 Linus Torvalds       2005-04-16  149  	__u32			wtmult;	/* writes should be multiple of this */
^1da177e4c3f415 Linus Torvalds       2005-04-16  150  	__u32			dtpref;	/* pref. readdir transfer size */
^1da177e4c3f415 Linus Torvalds       2005-04-16  151  	__u64			maxfilesize;
e86d5a02874c136 Trond Myklebust      2019-10-04  152  	struct timespec64	time_delta; /* server time granularity */
^1da177e4c3f415 Linus Torvalds       2005-04-16  153  	__u32			lease_time; /* in seconds */
ca440c383a58809 Jeff Layton          2016-09-15  154  	__u32			nlayouttypes; /* number of layouttypes */
3132e49ecef9dab Jeff Layton          2016-08-10  155  	__u32			layouttype[NFS_MAX_LAYOUT_TYPES]; /* supported pnfs layout driver */
dae100c2b1b9463 Fred Isaman          2011-07-30  156  	__u32			blksize; /* preferred pnfs io block size */
2a92ee92d454544 Peng Tao             2015-09-26  157  	__u32			clone_blksize; /* granularity of a CLONE operation */
7f08a3359a3c1e3 Trond Myklebust      2021-03-26  158  	enum nfs4_change_attr_type
7f08a3359a3c1e3 Trond Myklebust      2021-03-26 @159  				change_attr_type; /* Info about change attr */
b78ef845c35dbae Frank van der Linden 2020-06-23  160  	__u32			xattr_support; /* User xattrs supported */
^1da177e4c3f415 Linus Torvalds       2005-04-16  161  };
^1da177e4c3f415 Linus Torvalds       2005-04-16  162  

:::::: The code at line 159 was first introduced by commit
:::::: 7f08a3359a3c1e39c2a118fbbe583d8c8db14ace NFSv4: Add support for the NFSv4.2 "change_attr_type" attribute

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
