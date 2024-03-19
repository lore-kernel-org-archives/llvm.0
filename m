Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5283D1CD13;
	Tue, 19 Mar 2024 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848856; cv=none; b=V3MeJRVVi2uUSiDFv3K0R6i4L4rTdmok8wNqZuPv4mKDst6Fob7gwTqEL26dDrkjYqRm/7MZu//LqJaL9oyZFfzym/Bl7pxZq5CuX0X4HYdsMW5BqhP3jpR0Scck8Uik1Mhz+DQVMbd05JHZPiJJc0Cp1Jhq+xeDdHBX29/kYkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848856; c=relaxed/simple;
	bh=QTvyAXLiVBVjKSmenudzXYhi5rBp4Y6X93cyYGJgXks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6/4o9QnvW8NiK9ARTv2IQC5uX2bSNHgzH4HT9HYw0az3E1z3JVp+QuILaj6JfHbMfPAnAE0YAckuWxfcDCH0xmBu//nAT3eRn+xDjY1s5OWFnlgbqLltik0/A6GwYiCJhofQtj2LG4TsfE2izCK6OSrxsqYDVF44mBiwTOxhkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XY8hTOOB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY8hTOOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710848854; x=1742384854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTvyAXLiVBVjKSmenudzXYhi5rBp4Y6X93cyYGJgXks=;
  b=XY8hTOOBwGR8EadzchKICW//0Rj8PMwP08j93CAuSjbzW6KpvKjXKLrV
   u6kpWA5JiprIzVlPdHtsl1KmPzFZV6F7eR6ctpkYLmkD/UA9c153OgWF/
   VMO3GEQpL0/iShLGHSx9kVLl7CigUbBvbQCiz6Yfl2Bec5f8zuNXrFsen
   +yGY3GmBd0JTWsxPp8J1pvBaNRoYhaNp13fgWXx2eVlVWoo1YalsTxmRn
   //4X/9LqHX9gogQ2lLl3GqLquWeH8ZPHNq6KuvXTPz8FKgABGETqTR9sW
   L0toeb7WLh1bfnGXyU1SUrydQFExi8xzkMkaCN0JRUz6YNbJpBUv6wY8r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="28188712"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="28188712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 04:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="18356642"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2024 04:47:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmXwI-000Hjj-0Q;
	Tue, 19 Mar 2024 11:47:30 +0000
Date: Tue, 19 Mar 2024 19:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 10/25] fs/namei.c:4074:5: error: call to
 undeclared function 'ima_post_path_mknod'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403191958.Ijkf2znb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3509cb8bd63103f6f1a76089f0352fe85a9097ab
commit: f9eb21a3371bd06b4763c4757f2371e83241efb1 [10/25] vfs: make vfs_create break delegations on parent directory
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240319/202403191958.Ijkf2znb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191958.Ijkf2znb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191958.Ijkf2znb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/namei.c:4074:5: error: call to undeclared function 'ima_post_path_mknod'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4074 |                                 ima_post_path_mknod(idmap, dentry);
         |                                 ^
   13 warnings and 1 error generated.


vim +/ima_post_path_mknod +4074 fs/namei.c

  4043	
  4044	static int do_mknodat(int dfd, struct filename *name, umode_t mode,
  4045			unsigned int dev)
  4046	{
  4047		struct mnt_idmap *idmap;
  4048		struct dentry *dentry;
  4049		struct path path;
  4050		int error;
  4051		unsigned int lookup_flags = 0;
  4052		struct inode *delegated_inode = NULL;
  4053	
  4054		error = may_mknod(mode);
  4055		if (error)
  4056			goto out1;
  4057	retry:
  4058		dentry = filename_create(dfd, name, &path, lookup_flags);
  4059		error = PTR_ERR(dentry);
  4060		if (IS_ERR(dentry))
  4061			goto out1;
  4062	
  4063		error = security_path_mknod(&path, dentry,
  4064				mode_strip_umask(path.dentry->d_inode, mode), dev);
  4065		if (error)
  4066			goto out2;
  4067	
  4068		idmap = mnt_idmap(path.mnt);
  4069		switch (mode & S_IFMT) {
  4070			case 0: case S_IFREG:
  4071				error = vfs_create(idmap, path.dentry->d_inode,
  4072						   dentry, mode, true, &delegated_inode);
  4073				if (!error)
> 4074					ima_post_path_mknod(idmap, dentry);
  4075				break;
  4076			case S_IFCHR: case S_IFBLK:
  4077				error = vfs_mknod(idmap, path.dentry->d_inode,
  4078						  dentry, mode, new_decode_dev(dev));
  4079				break;
  4080			case S_IFIFO: case S_IFSOCK:
  4081				error = vfs_mknod(idmap, path.dentry->d_inode,
  4082						  dentry, mode, 0);
  4083				break;
  4084		}
  4085	
  4086		if (error)
  4087			goto out2;
  4088	
  4089		security_path_post_mknod(idmap, dentry);
  4090	out2:
  4091		done_path_create(&path, dentry);
  4092		if (delegated_inode) {
  4093			error = break_deleg_wait(&delegated_inode);
  4094			if (!error)
  4095				goto retry;
  4096		}
  4097		if (retry_estale(error, lookup_flags)) {
  4098			lookup_flags |= LOOKUP_REVAL;
  4099			goto retry;
  4100		}
  4101	out1:
  4102		putname(name);
  4103		return error;
  4104	}
  4105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
