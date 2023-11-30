Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3F58122;
	Thu, 30 Nov 2023 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkKmhJ1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701366266; x=1732902266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvH5VFX0m1gxBorXJAqbuyVq5YilEb/v7wojfNAD9c8=;
  b=gkKmhJ1ztI2noGwIAHwpuaGvfgx1l2RF6kN1s517rlEMCvL1xg5wuznT
   V8LUfvm747mZzcQ8/87RsuRL6VwwJd+Z5WtY5X45GuQbfHRJi9+Pd69uI
   xQ4SHquvPfW9nd32l1pZokPwz5ymWqBjdGSm7sSDI+M2qxsbvHK5ZzzYs
   jCvT2klcJ0gVuEMHvmYE9+pe6JO5LQlXYlxC/9I4d6AojDswQjhWDWBLC
   JqnY/9PN4H9kvitjtLCYcJm2HlNahKMqSBD7+rLwxBmW0t/fGU2IOH8Jk
   s1MreBhdlRX6tnrq0RJBtDZlDGPWpejIIemse0TAGuI3YJj69bhP2lOZI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="353893"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="353893"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 09:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016719392"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1016719392"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2023 09:44:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8l5K-0002TG-1y;
	Thu, 30 Nov 2023 17:44:22 +0000
Date: Fri, 1 Dec 2023 01:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 60/61] fs/9p/vfs_inode.c:379:2: error: call
 to undeclared function 'fscache_clear_inode_writeback'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202312010113.lL6Lpwt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   ed72c33e807046e9a09965dba2d3524f5bc90ae9
commit: 0455c3240d311ab544e4669de9392af791fb6ee1 [60/61] netfs: Move pinning-for-writeback from fscache to netfs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231201/202312010113.lL6Lpwt9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010113.lL6Lpwt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010113.lL6Lpwt9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/9p/vfs_inode.c:379:2: error: call to undeclared function 'fscache_clear_inode_writeback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
           ^
   fs/9p/vfs_inode.c:379:2: note: did you mean 'sb_clear_inode_writeback'?
   include/linux/writeback.h:381:6: note: 'sb_clear_inode_writeback' declared here
   void sb_clear_inode_writeback(struct inode *inode);
        ^
   1 error generated.
--
>> fs/9p/vfs_addr.c:300:9: error: call to undeclared function 'fscache_dirty_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return fscache_dirty_folio(mapping, folio, v9fs_inode_cookie(v9inode));
                  ^
   fs/9p/vfs_addr.c:300:9: note: did you mean 'filemap_dirty_folio'?
   include/linux/writeback.h:376:6: note: 'filemap_dirty_folio' declared here
   bool filemap_dirty_folio(struct address_space *mapping, struct folio *folio);
        ^
   1 error generated.


vim +/fscache_clear_inode_writeback +379 fs/9p/vfs_inode.c

2bad8471511ce5 Eric Van Hensbergen 2005-09-09  364  
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  365  /**
bc868036569e1d David Howells       2021-10-04  366   * v9fs_evict_inode - Remove an inode from the inode cache
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  367   * @inode: inode to release
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  368   *
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  369   */
b57922d97fd6f7 Al Viro             2010-06-07  370  void v9fs_evict_inode(struct inode *inode)
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  371  {
4eb3117888a923 Eric Van Hensbergen 2023-03-27  372  	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  373  	__le32 __maybe_unused version;
6b39f6d22fbf67 Aneesh Kumar K.V    2011-02-28  374  
4ad78628445d26 Al Viro             2015-12-08  375  	truncate_inode_pages_final(&inode->i_data);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  376  
4eb3117888a923 Eric Van Hensbergen 2023-03-27  377  #ifdef CONFIG_9P_FSCACHE
93c846143d8630 David Howells       2020-11-18  378  	version = cpu_to_le32(v9inode->qid.version);
93c846143d8630 David Howells       2020-11-18 @379  	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
93c846143d8630 David Howells       2020-11-18  380  				      &version);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  381  #endif
4eb3117888a923 Eric Van Hensbergen 2023-03-27  382  
dbd5768f87ff6f Jan Kara            2012-05-03  383  	clear_inode(inode);
4ad78628445d26 Al Viro             2015-12-08  384  	filemap_fdatawrite(&inode->i_data);
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  385  

:::::: The code at line 379 was first introduced by commit
:::::: 93c846143d8630d1fd465b69703b0f0021a543dc 9p: Copy local writes to the cache when writing to the server

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
