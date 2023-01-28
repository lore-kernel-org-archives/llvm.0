Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2E2570;
	Sat, 28 Jan 2023 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674888203; x=1706424203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oBybET5TIe42+qTaB2pc2pau0K0uHnjn6dkAhjip8Ec=;
  b=mxr9yIbtwA7vgcwsQO/8PJX/L2ZNUc6snWJheGXCZUeK6ZtUQcfgdArf
   3rQ8+4rV5Kr+i5VmOqJBQjS8UV6S5Hoq21CdTHdVQ8dzWH4L0k4EvdQwi
   8uEhMCVSJDSMTAFQiCZoW0nHXdaSr72rhXaXrA+OSauZj938XkiHLamMW
   BkaCqray3VP/4i7mwQtER1HiuvylDDi8Z4K0PrJUbg42adhu1fMABwhRQ
   /Ba9PGrOUGCpZ+hZ7VRfERGrvRf0LYIOaxkpdJAIE78Sc71JqvmVP99gE
   AkxxD4oUbVPS3KNNZ3L/xsSPUoNPdGmTM2GvDHLXrScNNwMWVhi2fEEgz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="413490579"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="413490579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 22:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="787441544"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="787441544"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2023 22:43:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLevn-0000Sl-2u;
	Sat, 28 Jan 2023 06:43:19 +0000
Date: Sat, 28 Jan 2023 14:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:for_next 41/74] fs/udf/partition.c:86:28: warning: variable
 'loc' is uninitialized when used here
Message-ID: <202301281443.tFl6uieY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   085cf7b7e2ef7bdd88c8f2f56a17d756bd18f1a4
commit: 4215db46d5389066bba103f87d6fb4aa392ec849 [41/74] udf: Use udf_bread() in udf_get_pblock_virt15()
config: arm-randconfig-r024-20230126 (https://download.01.org/0day-ci/archive/20230128/202301281443.tFl6uieY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/commit/?id=4215db46d5389066bba103f87d6fb4aa392ec849
        git remote add jack-fs https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git
        git fetch --no-tags jack-fs for_next
        git checkout 4215db46d5389066bba103f87d6fb4aa392ec849
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/udf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/udf/partition.c:86:28: warning: variable 'loc' is uninitialized when used here [-Wuninitialized]
                             sb, block, partition, loc, index);
                                                   ^~~
   fs/udf/udfdecl.h:35:61: note: expanded from macro 'udf_debug'
           pr_debug("%s:%d:%s: " fmt, __FILE__, __LINE__, __func__, ##__VA_ARGS__)
                                                                      ^~~~~~~~~~~
   include/linux/printk.h:581:26: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:22: note: expanded from macro 'dynamic_pr_debug'
                              pr_fmt(fmt), ##__VA_ARGS__)
                                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   fs/udf/partition.c:52:14: note: initialize the variable 'loc' to silence this warning
           uint32_t loc;
                       ^
                        = 0
   1 warning generated.


vim +/loc +86 fs/udf/partition.c

^1da177e4c3f41 Linus Torvalds      2005-04-16   45  
cb00ea3528eb3c Cyrill Gorcunov     2007-07-19   46  uint32_t udf_get_pblock_virt15(struct super_block *sb, uint32_t block,
cb00ea3528eb3c Cyrill Gorcunov     2007-07-19   47  			       uint16_t partition, uint32_t offset)
^1da177e4c3f41 Linus Torvalds      2005-04-16   48  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   49  	struct buffer_head *bh = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16   50  	uint32_t newblock;
^1da177e4c3f41 Linus Torvalds      2005-04-16   51  	uint32_t index;
^1da177e4c3f41 Linus Torvalds      2005-04-16   52  	uint32_t loc;
6c79e987d629cb Marcin Slusarz      2008-02-08   53  	struct udf_sb_info *sbi = UDF_SB(sb);
6c79e987d629cb Marcin Slusarz      2008-02-08   54  	struct udf_part_map *map;
4b11111aba6c80 Marcin Slusarz      2008-02-08   55  	struct udf_virtual_data *vdata;
fa5e08156335d0 Jan Kara            2008-04-08   56  	struct udf_inode_info *iinfo = UDF_I(sbi->s_vat_inode);
4215db46d53890 Jan Kara            2023-01-18   57  	int err;
^1da177e4c3f41 Linus Torvalds      2005-04-16   58  
6c79e987d629cb Marcin Slusarz      2008-02-08   59  	map = &sbi->s_partmaps[partition];
4b11111aba6c80 Marcin Slusarz      2008-02-08   60  	vdata = &map->s_type_specific.s_virtual;
^1da177e4c3f41 Linus Torvalds      2005-04-16   61  
4b11111aba6c80 Marcin Slusarz      2008-02-08   62  	if (block > vdata->s_num_entries) {
fcbf7637e6647e Steve Magnani       2017-10-12   63  		udf_debug("Trying to access block beyond end of VAT (%u max %u)\n",
a983f368f8986c Joe Perches         2011-10-10   64  			  block, vdata->s_num_entries);
^1da177e4c3f41 Linus Torvalds      2005-04-16   65  		return 0xFFFFFFFF;
^1da177e4c3f41 Linus Torvalds      2005-04-16   66  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   67  
fa5e08156335d0 Jan Kara            2008-04-08   68  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB) {
382a2287bf9cd2 Jan Kara            2020-09-25   69  		loc = le32_to_cpu(((__le32 *)(iinfo->i_data +
47c9358a015199 Sebastian Manciulea 2008-04-14   70  			vdata->s_start_offset))[block]);
fa5e08156335d0 Jan Kara            2008-04-08   71  		goto translate;
fa5e08156335d0 Jan Kara            2008-04-08   72  	}
fa5e08156335d0 Jan Kara            2008-04-08   73  	index = (sb->s_blocksize - vdata->s_start_offset) / sizeof(uint32_t);
cb00ea3528eb3c Cyrill Gorcunov     2007-07-19   74  	if (block >= index) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   75  		block -= index;
^1da177e4c3f41 Linus Torvalds      2005-04-16   76  		newblock = 1 + (block / (sb->s_blocksize / sizeof(uint32_t)));
^1da177e4c3f41 Linus Torvalds      2005-04-16   77  		index = block % (sb->s_blocksize / sizeof(uint32_t));
cb00ea3528eb3c Cyrill Gorcunov     2007-07-19   78  	} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16   79  		newblock = 0;
4b11111aba6c80 Marcin Slusarz      2008-02-08   80  		index = vdata->s_start_offset / sizeof(uint32_t) + block;
^1da177e4c3f41 Linus Torvalds      2005-04-16   81  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   82  
4215db46d53890 Jan Kara            2023-01-18   83  	bh = udf_bread(sbi->s_vat_inode, newblock, 0, &err);
4b11111aba6c80 Marcin Slusarz      2008-02-08   84  	if (!bh) {
fcbf7637e6647e Steve Magnani       2017-10-12   85  		udf_debug("get_pblock(UDF_VIRTUAL_MAP:%p,%u,%u) VAT: %u[%u]\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16  @86  			  sb, block, partition, loc, index);
^1da177e4c3f41 Linus Torvalds      2005-04-16   87  		return 0xFFFFFFFF;
^1da177e4c3f41 Linus Torvalds      2005-04-16   88  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   89  
^1da177e4c3f41 Linus Torvalds      2005-04-16   90  	loc = le32_to_cpu(((__le32 *)bh->b_data)[index]);
^1da177e4c3f41 Linus Torvalds      2005-04-16   91  
3bf25cb40d899e Jan Kara            2007-05-08   92  	brelse(bh);
^1da177e4c3f41 Linus Torvalds      2005-04-16   93  
fa5e08156335d0 Jan Kara            2008-04-08   94  translate:
48d6d8ff7dca80 Marcin Slusarz      2008-02-08   95  	if (iinfo->i_location.partitionReferenceNum == partition) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   96  		udf_debug("recursive call to udf_get_pblock!\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16   97  		return 0xFFFFFFFF;
^1da177e4c3f41 Linus Torvalds      2005-04-16   98  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   99  
cb00ea3528eb3c Cyrill Gorcunov     2007-07-19  100  	return udf_get_pblock(sb, loc,
48d6d8ff7dca80 Marcin Slusarz      2008-02-08  101  			      iinfo->i_location.partitionReferenceNum,
28de7948a89676 Cyrill Gorcunov     2007-07-21  102  			      offset);
^1da177e4c3f41 Linus Torvalds      2005-04-16  103  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  104  

:::::: The code at line 86 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
