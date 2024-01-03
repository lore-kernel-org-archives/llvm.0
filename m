Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAA1D525;
	Wed,  3 Jan 2024 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJE8q8ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704312638; x=1735848638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkgkorH10bDoNN7f1pRGPWal9omxB/Gr6HSpc8mlLlU=;
  b=TJE8q8iiQR3KqxjwU1t2E7rqxDO92uY9R0mbJwyr46PadgqoKSRe2oLh
   kgwM9QDp0Umgo2WTAJn+YtvBcfyfzjgWzNg46JtJE0qoJimzOMoXUb8M+
   p8i2uohGSa7ZQVXgEwXqw3FPMde/PpMBx3Q21DeWzp2BBH/gy+IScvISP
   Fe9KPE8NhlXqyBueyO+8XfFDhIHFmt8fLkeOpJoNO1zKAQmJTRpl9f26p
   +c0RWRQMIV/2l+odTc4J4kMdgWqssVmgZRyHBjzljxn3CUxKzpHEJCpDB
   mcYIfAxV+oVfo6t6EX6Ck2BErNsUWXgeZfStCqurUrqCANRN58EINlNSV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="15698014"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="15698014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 12:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="773229438"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="773229438"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Jan 2024 12:10:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL7ZH-000MWK-2d;
	Wed, 03 Jan 2024 20:10:23 +0000
Date: Thu, 4 Jan 2024 04:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 41/42] fs/ntfs3/fsntfs.c:1011:23:
 warning: unused variable 'bdev'
Message-ID: <202401040431.fnq6ljbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file
head:   81a0b5d317a5188e7e8aaf68adf070d44c7a3eea
commit: 6d26064a464a6f8ace90a2176a17bd6f853825e0 [41/42] [DRAFT] buffer: port block device access to files and get rid of bd_inode access
config: i386-buildonly-randconfig-002-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040431.fnq6ljbX-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040431.fnq6ljbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040431.fnq6ljbX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/fsntfs.c:1011:23: warning: unused variable 'bdev' [-Wunused-variable]
    1011 |         struct block_device *bdev = sb->s_bdev;
         |                              ^~~~
   fs/ntfs3/fsntfs.c:1041:23: warning: unused variable 'bdev' [-Wunused-variable]
    1041 |         struct block_device *bdev = sb->s_bdev;
         |                              ^~~~
   2 warnings generated.


vim +/bdev +1011 fs/ntfs3/fsntfs.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1008  
82cae269cfa953 Konstantin Komarov 2021-08-13  1009  int ntfs_sb_read(struct super_block *sb, u64 lbo, size_t bytes, void *buffer)
82cae269cfa953 Konstantin Komarov 2021-08-13  1010  {
82cae269cfa953 Konstantin Komarov 2021-08-13 @1011  	struct block_device *bdev = sb->s_bdev;
82cae269cfa953 Konstantin Komarov 2021-08-13  1012  	u32 blocksize = sb->s_blocksize;
82cae269cfa953 Konstantin Komarov 2021-08-13  1013  	u64 block = lbo >> sb->s_blocksize_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1014  	u32 off = lbo & (blocksize - 1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1015  	u32 op = blocksize - off;
82cae269cfa953 Konstantin Komarov 2021-08-13  1016  
82cae269cfa953 Konstantin Komarov 2021-08-13  1017  	for (; bytes; block += 1, off = 0, op = blocksize) {
6d26064a464a6f Christian Brauner  2024-01-02  1018  		struct buffer_head *bh = __bread(sb->s_f_bdev, block, blocksize);
82cae269cfa953 Konstantin Komarov 2021-08-13  1019  
82cae269cfa953 Konstantin Komarov 2021-08-13  1020  		if (!bh)
82cae269cfa953 Konstantin Komarov 2021-08-13  1021  			return -EIO;
82cae269cfa953 Konstantin Komarov 2021-08-13  1022  
82cae269cfa953 Konstantin Komarov 2021-08-13  1023  		if (op > bytes)
82cae269cfa953 Konstantin Komarov 2021-08-13  1024  			op = bytes;
82cae269cfa953 Konstantin Komarov 2021-08-13  1025  
82cae269cfa953 Konstantin Komarov 2021-08-13  1026  		memcpy(buffer, bh->b_data + off, op);
82cae269cfa953 Konstantin Komarov 2021-08-13  1027  
82cae269cfa953 Konstantin Komarov 2021-08-13  1028  		put_bh(bh);
82cae269cfa953 Konstantin Komarov 2021-08-13  1029  
82cae269cfa953 Konstantin Komarov 2021-08-13  1030  		bytes -= op;
82cae269cfa953 Konstantin Komarov 2021-08-13  1031  		buffer = Add2Ptr(buffer, op);
82cae269cfa953 Konstantin Komarov 2021-08-13  1032  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1033  
82cae269cfa953 Konstantin Komarov 2021-08-13  1034  	return 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1035  }
82cae269cfa953 Konstantin Komarov 2021-08-13  1036  

:::::: The code at line 1011 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initialization of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
