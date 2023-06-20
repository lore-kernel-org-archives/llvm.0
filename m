Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5882AB42;
	Tue, 20 Jun 2023 23:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687304326; x=1718840326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWX877ljS5TrdErB6dI12/acfC3iVAP8dfJ0jvQtyEQ=;
  b=jWm4fImNJ6iZwOdexU5WWu6mPs++I1DUIiLh6VYdNUXY7zNQQkTQARCC
   KTChx5L8cJH7m1czQAfYDid469BSFccCo+Y1xxVUyn9qQf7PwGGVbhBD/
   2ZIQ3Q0uX4uXYq7aQhGib7lhfY9YgfdJ2jhIJxcNq3xuEcAQTMo9FdP2i
   R1I64e64qubIkBVrsM/begCrrGvciXBbj+/p/6HbekMNWMB/j/jqeY5Sv
   CftIUTr/wryHgq9NWwIqT0dlzUgBwOKs+2V/1g2DFqzy57yF0ID+v3lGW
   zwvGddfJS7dqxICKQ5RHoo/ZeUT7Abx9hbGRzFEav7QuS8TgKYSsFbNJV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423678218"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="423678218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 16:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717399847"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="717399847"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 16:38:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBkvq-0006LE-2d;
	Tue, 20 Jun 2023 23:38:42 +0000
Date: Wed, 21 Jun 2023 07:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 36/9999] fs/gfs2/rgrp.c:994:12: warning: stack
 frame size (1056) exceeds limit (1024) in 'gfs2_ri_update'
Message-ID: <202306210722.cJWYeZkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r004-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210722.cJWYeZkQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210722.cJWYeZkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210722.cJWYeZkQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/rgrp.c:994:12: warning: stack frame size (1056) exceeds limit (1024) in 'gfs2_ri_update' [-Wframe-larger-than]
   static int gfs2_ri_update(struct gfs2_inode *ip)
              ^
   905/1056 (85.70%) spills, 151/1056 (14.30%) variables
   fs/gfs2/rgrp.c:2058:5: warning: stack frame size (1248) exceeds limit (1024) in 'gfs2_inplace_reserve' [-Wframe-larger-than]
   int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
       ^
   1204/1248 (96.47%) spills, 44/1248 (3.53%) variables
   2 warnings generated.
--
>> drivers/net/ethernet/intel/fm10k/fm10k_main.c:1413:12: warning: stack frame size (1360) exceeds limit (1024) in 'fm10k_poll' [-Wframe-larger-than]
   static int fm10k_poll(struct napi_struct *napi, int budget)
              ^
   1181/1360 (86.84%) spills, 179/1360 (13.16%) variables
   1 warning generated.


vim +/gfs2_ri_update +994 fs/gfs2/rgrp.c

0e27c18c30f685 Bob Peterson      2014-10-29   986  
6c53267f05dc66 Robert Peterson   2007-05-10   987  /**
6c53267f05dc66 Robert Peterson   2007-05-10   988   * gfs2_ri_update - Pull in a new resource index from the disk
6c53267f05dc66 Robert Peterson   2007-05-10   989   * @ip: pointer to the rindex inode
6c53267f05dc66 Robert Peterson   2007-05-10   990   *
6c53267f05dc66 Robert Peterson   2007-05-10   991   * Returns: 0 on successful update, error code otherwise
6c53267f05dc66 Robert Peterson   2007-05-10   992   */
6c53267f05dc66 Robert Peterson   2007-05-10   993  
8339ee543ece6e Steven Whitehouse 2011-08-31  @994  static int gfs2_ri_update(struct gfs2_inode *ip)
6c53267f05dc66 Robert Peterson   2007-05-10   995  {
6c53267f05dc66 Robert Peterson   2007-05-10   996  	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
6c53267f05dc66 Robert Peterson   2007-05-10   997  	int error;
6c53267f05dc66 Robert Peterson   2007-05-10   998  
8339ee543ece6e Steven Whitehouse 2011-08-31   999  	do {
4306629e1c0fd0 Andrew Price      2012-04-16  1000  		error = read_rindex_entry(ip);
8339ee543ece6e Steven Whitehouse 2011-08-31  1001  	} while (error == 0);
8339ee543ece6e Steven Whitehouse 2011-08-31  1002  
8339ee543ece6e Steven Whitehouse 2011-08-31  1003  	if (error < 0)
6c53267f05dc66 Robert Peterson   2007-05-10  1004  		return error;
b3b94faa5fe596 David Teigland    2006-01-16  1005  
778721510e8420 Bob Peterson      2020-11-24  1006  	if (RB_EMPTY_ROOT(&sdp->sd_rindex_tree)) {
778721510e8420 Bob Peterson      2020-11-24  1007  		fs_err(sdp, "no resource groups found in the file system.\n");
778721510e8420 Bob Peterson      2020-11-24  1008  		return -ENOENT;
778721510e8420 Bob Peterson      2020-11-24  1009  	}
0e27c18c30f685 Bob Peterson      2014-10-29  1010  	set_rgrp_preferences(sdp);
0e27c18c30f685 Bob Peterson      2014-10-29  1011  
cf45b752c9f239 Bob Peterson      2008-01-31  1012  	sdp->sd_rindex_uptodate = 1;
b3b94faa5fe596 David Teigland    2006-01-16  1013  	return 0;
6c53267f05dc66 Robert Peterson   2007-05-10  1014  }
b3b94faa5fe596 David Teigland    2006-01-16  1015  

:::::: The code at line 994 was first introduced by commit
:::::: 8339ee543ece6e2dcc1bbd97d5350163c198cf00 GFS2: Make resource groups "append only" during life of fs

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
