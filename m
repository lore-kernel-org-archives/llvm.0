Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84B35280;
	Tue, 19 Mar 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710852577; cv=none; b=EYgMCTHekf59JV3Kirz9eUX6SS+pypGayG+9AEhn5J7pf0+1H2AVJAoK94iYIE4256U3QjR7JSIqp3Q/Uc5TgsoB4cWKaFP/Dd0iVNMesFoCikthhUqZUAAr1X/e+kleFbMAqLDZzZe8FALLHUpHPO4z7nvVxpCmBTPa9IQjJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710852577; c=relaxed/simple;
	bh=E5KgeYOUhdRSJWkVczrt2vB018KJ5Rr2Czkl1bwgNjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iv0NshPAQZ1iq8gz8aTxzOgl0cbJNaT/XQAd0VdMZUmRjsu8NbylqjEb5waMjg8GakjIqfRxzKz3tlBx5O7xCWzLqUVtvCD+mE1adMUnS1pIT9fcMf3CsHmJMNwREZ+DGwbdizJLFpcYHeH3xqeZtUpjYdwzXp73wZiMzNKqHus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwTbWFGg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwTbWFGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710852575; x=1742388575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5KgeYOUhdRSJWkVczrt2vB018KJ5Rr2Czkl1bwgNjM=;
  b=lwTbWFGgFNQqOOvO9M7HRQNEYzaDqUyPjI9ZrAxFpK6vzspyQ2FVJY3k
   lNABj/bHNklXk9tHmiXKCMBjEBdDQUI2GQn+BsfEeGPg3uWSR7vL9n0q8
   290NrX+jjnuZ5tzzrT11ZrpU/cGmxQotHj1yXFY9NihC9kbbGZIDTypFL
   K2sVHEB2KEowCrFHP/iwVn6IGCSNJTDiudSSgxx5Jobl70E96JfVYe98C
   1rqRQJClUNRnaJeCJrygMo49NLQO+VZEtTpvHfTGD5Y/zxAQkVtpB996c
   pyKLF1ksUJ/Ehw75z4H7nLnc7a8jgVp9FH+uMOk2JH1hrQj1RumV6VkKT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5840498"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5840498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 05:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="13795768"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Mar 2024 05:49:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmYuJ-000HlH-0C;
	Tue, 19 Mar 2024 12:49:31 +0000
Date: Tue, 19 Mar 2024 20:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 10/25] fs/namei.c:4074:5: error: call to
 undeclared function 'ima_post_path_mknod'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403192038.Pa7wfVWQ-lkp@intel.com>
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
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240319/202403192038.Pa7wfVWQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403192038.Pa7wfVWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403192038.Pa7wfVWQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/namei.c:4074:5: error: call to undeclared function 'ima_post_path_mknod'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   ima_post_path_mknod(idmap, dentry);
                                   ^
   12 warnings and 1 error generated.


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
