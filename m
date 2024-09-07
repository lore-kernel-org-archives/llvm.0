Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51644CDEC;
	Sat,  7 Sep 2024 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725738272; cv=none; b=NBuewtF0CtpDUcRjrVQQ/AcKzPINv8O7+tSZTv49w5j0dswTB6190rdDoEdPpDEnBIUk+FoLz+28zVvLOzjDfNRBLN9ri5wcmizEkgGwMPlYzX1XNxjz6wh5UmI4DIzBuRI8G4cWX4wPz9RFjRyMONADdBKLPcMB07oxSuE5lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725738272; c=relaxed/simple;
	bh=uBytNWI3EuI+K2GSj7fC2ye4YpU36K6AfGChOBXPteQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKXiHaFIlGvYgNYZdxsvvXtN7hwsjH9VtlCrk3KfUi3TVWb3n9oEooRan7KL4CXc3tADxE7ZH+/z/dvBcUW3NypSzQJGRvXBlJ/dlNhNY2pXbH6jeJMmtbTKxnNEBAJEipy0j/WGfCsBusZ3dUBmw7GwLmFQ/KhjcUYr72TLIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZT5VXTR/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT5VXTR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725738271; x=1757274271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBytNWI3EuI+K2GSj7fC2ye4YpU36K6AfGChOBXPteQ=;
  b=ZT5VXTR/Qu3dSaI3mtTB14gHh0vTODKAP/LyNFk8syPQioHrQZZwGwsZ
   GT6X9QM5lnXrNYWyXq8fcmn8VYhC+VpNmmi5d6z3/qsaWRcCUO02BTyds
   u+dSd23FDXXKy2hFQz5m5yOQ3f5snGjJ0UlAGocFfeDJm/OKSuoM4HJpR
   ynW0rffw+1jY925IPNXbPDR6fskJHWTYIP/KABWRHhwhTTujM4o3/0JNu
   poY7P/CHnRJNbhdTFRPNkI0sfISX7oZ2eWahQoPsgShtcikG/0JoAPm0S
   nlJJc00ogHFTQ887OHwDFSJ14TGa/uKtrfCN4TTf+kUG1HfWscsUq/TIH
   Q==;
X-CSE-ConnectionGUID: q5BhRsV7Q2SEMRCXjyq5MA==
X-CSE-MsgGUID: BvlnzlQqRV+4t9zbfylnyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24667029"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24667029"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:44:30 -0700
X-CSE-ConnectionGUID: 0xSVWGX5Q9y/xbfSlufZEQ==
X-CSE-MsgGUID: fw1569beR5Kz15tVezRM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70377868"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 12:44:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1MA-000Cv2-26;
	Sat, 07 Sep 2024 19:44:26 +0000
Date: Sun, 8 Sep 2024 03:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 61/61] fs/ceph/file.c:1747:16: error:
 incompatible function pointer types initializing 'ssize_t (*)(struct kiocb
 *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)')
 with an expression of type 'int (struct inode *, struct writeback_control
 ...
Message-ID: <202409080302.b7kgz2Ba-lkp@intel.com>
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
commit: 6c59f154a1d493b31755ac17326124d804172fb2 [61/61] ceph: Use netfslib
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240908/202409080302.b7kgz2Ba-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080302.b7kgz2Ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080302.b7kgz2Ba-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/file.c:1746:15: error: use of undeclared identifier 'ceph_read_iter'; did you mean 'seq_read_iter'?
    1746 |         .read_iter = ceph_read_iter,
         |                      ^~~~~~~~~~~~~~
         |                      seq_read_iter
   include/linux/seq_file.h:110:9: note: 'seq_read_iter' declared here
     110 | ssize_t seq_read_iter(struct kiocb *iocb, struct iov_iter *iter);
         |         ^
   fs/ceph/file.c:1747:16: error: use of undeclared identifier 'ceph_write_iter'; did you mean 'ceph_write_inode'?
    1747 |         .write_iter = ceph_write_iter,
         |                       ^~~~~~~~~~~~~~~
         |                       ceph_write_inode
   fs/ceph/super.h:1251:12: note: 'ceph_write_inode' declared here
    1251 | extern int ceph_write_inode(struct inode *inode, struct writeback_control *wbc);
         |            ^
>> fs/ceph/file.c:1747:16: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'int (struct inode *, struct writeback_control *)' [-Wincompatible-function-pointer-types]
    1747 |         .write_iter = ceph_write_iter,
         |                       ^~~~~~~~~~~~~~~
   3 errors generated.


vim +1747 fs/ceph/file.c

64bf5ff58dff75 Dave Chinner 2019-06-05  1741  
124e68e7409909 Sage Weil    2009-10-06  1742  const struct file_operations ceph_file_fops = {
124e68e7409909 Sage Weil    2009-10-06  1743  	.open = ceph_open,
124e68e7409909 Sage Weil    2009-10-06  1744  	.release = ceph_release,
124e68e7409909 Sage Weil    2009-10-06  1745  	.llseek = ceph_llseek,
3644424dc63094 Al Viro      2014-04-02  1746  	.read_iter = ceph_read_iter,
4908b822b300d2 Al Viro      2014-04-03 @1747  	.write_iter = ceph_write_iter,

:::::: The code at line 1747 was first introduced by commit
:::::: 4908b822b300d2d7ad0341203181cfbd8a91092a ceph: switch to ->write_iter()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
