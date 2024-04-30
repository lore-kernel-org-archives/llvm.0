Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C428617BB1E;
	Tue, 30 Apr 2024 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714503345; cv=none; b=gcNJ+drBDxPJFmp6be1k/796eAyZz0y0MaXXcdj+z13htQw3+Jz03EMsfLhJVTSoA2rksyI1HGJml4FhxkZIS0mX1fYf0cpmwVKaAjLb4TGuZNa1fe51Iswr4HD0dP1BGxYctH7sVt82qvdN3k4jIwNhZCkyVbRfI6g08/insUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714503345; c=relaxed/simple;
	bh=rqXJnM6JnL3qrSNhUeeBlwKenGdqOVtZFuaX+Jeddc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhdZsjAdCGQdBlXYHsH4p7cb+J+lJ/OmMNuv2CKBDuwkgKmfv/Vblm26/uWRr2APJqcRbH6GwhYASzTxB45CtD6/WXcaUj2JZEJ9Yea0FNVHM9PRfI7Mx8/lzLda9jRI8bBHSfO1+3zfV4IPn+NlIxnBC5O25YGM/JfOA3Tn87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea+dxyGq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea+dxyGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714503344; x=1746039344;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rqXJnM6JnL3qrSNhUeeBlwKenGdqOVtZFuaX+Jeddc4=;
  b=ea+dxyGqaMROBJfc3h9Fc4K7Pi3MeN9MVNkBUarOyxD6aiHxCGtCEBW3
   5XuDoZ2STTrTVTP+KUYbiqZTVXnSSsIoLdS6FsB9Jc+BsIMK5ReGUH+Fx
   CPZuSvnLPG4g2pgZ+HGeydEvbTE876AQYa5A1u9CJNwqtvZlWzwxeMAqX
   7AgEfAARiH7OpBcyBo0dMKaIYzGuwxX8jGWM69BGNNIgLCGjACh3DfhkJ
   5xYq6ibox0XCnXiNEXCDE8CKFL+gIugghJeaTpEkSL5B+81YxFlOQ1bhH
   eY6OgtJ6PrZjz5TiKmE0D6DVwiLVZq04gCorY4sUljFIlLbFn1iL9ci4f
   w==;
X-CSE-ConnectionGUID: sPzH0GqbSSqJHm6fULRAZw==
X-CSE-MsgGUID: hH9IksaRSsWd+LgXp7QVBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10768317"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10768317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 11:55:43 -0700
X-CSE-ConnectionGUID: 7kqDQiA2QZyZ2AqSeyxHuA==
X-CSE-MsgGUID: 79Y+ZvAzR4yoQmrLGnc2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="27051796"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2024 11:55:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1sde-0008TX-3B;
	Tue, 30 Apr 2024 18:55:38 +0000
Date: Wed, 1 May 2024 02:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.xattr 5/5] fs/xattr.c:838:39: warning: variable
 'lookup_flags' is uninitialized when used here
Message-ID: <202405010227.h8ewojO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.xattr
head:   0703b9aad555387113b9112cdc84469d12fda266
commit: 0703b9aad555387113b9112cdc84469d12fda266 [5/5] xattr: handle AT_EMPTY_PATH correctly
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405010227.h8ewojO3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010227.h8ewojO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010227.h8ewojO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xattr.c:15:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xattr.c:838:39: warning: variable 'lookup_flags' is uninitialized when used here [-Wuninitialized]
     838 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                                                     ^~~~~~~~~~~~
   fs/xattr.c:822:18: note: initialize the variable 'lookup_flags' to silence this warning
     822 |         int lookup_flags;
         |                         ^
         |                          = 0
   fs/xattr.c:955:39: warning: variable 'lookup_flags' is uninitialized when used here [-Wuninitialized]
     955 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                                                     ^~~~~~~~~~~~
   fs/xattr.c:939:18: note: initialize the variable 'lookup_flags' to silence this warning
     939 |         int lookup_flags;
         |                         ^
         |                          = 0
   3 warnings generated.


vim +/lookup_flags +838 fs/xattr.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  815  
71491cbe0205be Christian Göttsche 2024-04-26  816  static ssize_t do_getxattrat(int dfd, const char __user *pathname, unsigned int at_flags,
8cc431165d8fbd Eric Biggers       2014-10-12  817  			     const char __user *name, void __user *value,
71491cbe0205be Christian Göttsche 2024-04-26  818  			     size_t size)
^1da177e4c3f41 Linus Torvalds     2005-04-16  819  {
2d8f30380ab8c7 Al Viro            2008-07-22  820  	struct path path;
0703b9aad55538 Christian Brauner  2024-04-30  821  	ssize_t error = 0;
71491cbe0205be Christian Göttsche 2024-04-26  822  	int lookup_flags;
71491cbe0205be Christian Göttsche 2024-04-26  823  
71491cbe0205be Christian Göttsche 2024-04-26  824  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
71491cbe0205be Christian Göttsche 2024-04-26  825  		return -EINVAL;
71491cbe0205be Christian Göttsche 2024-04-26  826  
0703b9aad55538 Christian Brauner  2024-04-30  827  	if (at_flags & AT_EMPTY_PATH && vfs_empty_path(dfd, pathname)) {
0703b9aad55538 Christian Brauner  2024-04-30  828  		CLASS(fd, f)(dfd);
0703b9aad55538 Christian Brauner  2024-04-30  829  
0703b9aad55538 Christian Brauner  2024-04-30  830  		if (!f.file)
0703b9aad55538 Christian Brauner  2024-04-30  831  			return -EBADF;
0703b9aad55538 Christian Brauner  2024-04-30  832  
0703b9aad55538 Christian Brauner  2024-04-30  833  		path = f.file->f_path;
0703b9aad55538 Christian Brauner  2024-04-30  834  		audit_file(f.file);
0703b9aad55538 Christian Brauner  2024-04-30  835  		path_get(&path);
0703b9aad55538 Christian Brauner  2024-04-30  836  	} else {
60e66b48ca2081 Jeff Layton        2012-12-11  837  retry:
71491cbe0205be Christian Göttsche 2024-04-26 @838  		error = user_path_at(dfd, pathname, lookup_flags, &path);
^1da177e4c3f41 Linus Torvalds     2005-04-16  839  		if (error)
^1da177e4c3f41 Linus Torvalds     2005-04-16  840  			return error;
0703b9aad55538 Christian Brauner  2024-04-30  841  	}
5a6f52d20ce3cd Christian Brauner  2022-10-28  842  	error = getxattr(mnt_idmap(path.mnt), path.dentry, name, value, size);
2d8f30380ab8c7 Al Viro            2008-07-22  843  	path_put(&path);
60e66b48ca2081 Jeff Layton        2012-12-11  844  	if (retry_estale(error, lookup_flags)) {
60e66b48ca2081 Jeff Layton        2012-12-11  845  		lookup_flags |= LOOKUP_REVAL;
60e66b48ca2081 Jeff Layton        2012-12-11  846  		goto retry;
60e66b48ca2081 Jeff Layton        2012-12-11  847  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  848  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  849  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  850  

:::::: The code at line 838 was first introduced by commit
:::::: 71491cbe0205be53be1a044594698eb21c1c15f4 fs/xattr: add *at family syscalls

:::::: TO: Christian Göttsche <cgzones@googlemail.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
