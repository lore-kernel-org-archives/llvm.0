Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA7229A5;
	Wed, 27 Sep 2023 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695796303; x=1727332303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXjAOdU7F0x2+ynpFyJoBW+IQJkv44IOZDx7yieN0CU=;
  b=kLi5aNUbfd3Rq9NE5n+q+Oc2LJ/lKFoX+bpiEkaC5HRfey+oBKTIyx4V
   v2y2H+lZc6RAjG8zv2i+prA8Gh/roT1+zR5DAvCjzH4VHQxiU8kE8sGi0
   aTya7BB6JX3CVmXf0PGKmLWjJWJR033tau7AtqMkX3l2KNa2vSm4o5f+2
   2DgN0IZ0n8ealzt/USmEANv1xQq6utIwEQkZDwXpSfdPIW4jv2ZfxkSz4
   F5jJqRijHUsKWYmYrg5hz91jygogq7yU4+rIEEXm/KWu6/QueKcdPXNC5
   SKozwh0HTFPUclKJlzTwDVKqvURhIGjuSNRiUwQiljR659yDhHNOd+Mq6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366804037"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="366804037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="417821"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2023 23:31:41 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlO5C-0003p8-14;
	Wed, 27 Sep 2023 06:31:38 +0000
Date: Wed, 27 Sep 2023 14:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 1/15]
 fs/ext2/inode.c:821:5: warning: no previous prototype for function
 'ext2_read_bh_lock'
Message-ID: <202309271442.JshNjGUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2_dir_buffer_cache_rfc_wip1
head:   3b878bc4805dd97f67ee17c6450059a4a7f2b261
commit: 47085f278819cf21a8b60c39a9a7d48714eb767c [1/15] ext2: add bh read apis
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230927/202309271442.JshNjGUc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271442.JshNjGUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271442.JshNjGUc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/inode.c:821:5: warning: no previous prototype for function 'ext2_read_bh_lock' [-Wmissing-prototypes]
   int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
       ^
   fs/ext2/inode.c:821:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
   ^
   static 
   1 warning generated.


vim +/ext2_read_bh_lock +821 fs/ext2/inode.c

   820	
 > 821	int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
   822	{
   823		lock_buffer(bh);
   824		return ext2_read_bh(bh, op_flags, NULL);
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
