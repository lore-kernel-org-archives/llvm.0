Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4019D33E9
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658403148; x=1689939148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SkKcGIFXIK+3NWeRuEJQChVrUdCr/Z/85AQPQFXkeC4=;
  b=ZVi0qa43s6KjlyILwRquiEudxS3++vLxQ3HmUabMziYgo6JSQCqv2dHF
   j5/OD3dQleh1Za1SRRUKIG6KN+bRLMy5HsZhuIFgUoYXup8UqAgnECc2j
   a7aptchIxHWDli5ZEg+u/WkQxra3w8xal61Xj0DLQ308JhxxjV4w44RbI
   MdFhnbKGa2i4D1pigd//ou5saghbZkA+ln/YmjjNyjE9EnfE8AuuMjRLI
   VQmIsv81hjQw+d78FvPIzLfpGmPYl3T4QvQdCMm6FNMs1Ki3drShtcT2W
   D+AAGbvEvFq0MRocwELk/4oSUY/v3bPJFLw1SHYGUPuvKAK9jIpktXohH
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="373321677"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="373321677"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 04:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="666254038"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2022 04:32:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oEUPp-00004Y-1t;
	Thu, 21 Jul 2022 11:32:25 +0000
Date: Thu, 21 Jul 2022 19:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v4 7/8] ext4: add lockdep annotation in fc commit path
Message-ID: <202207211939.USmNXA90-lkp@intel.com>
References: <20220721060246.1696852-8-harshadshirwadkar@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721060246.1696852-8-harshadshirwadkar@gmail.com>

Hi Harshad,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc7 next-20220720]
[cannot apply to tytso-ext4/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshad-Shirwadkar/Ext4-fast-commit-performance-patch-series/20220721-140558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 353f7988dd8413c47718f7ca79c030b6fb62cfe5
config: arm-s3c2410_defconfig (https://download.01.org/0day-ci/archive/20220721/202207211939.USmNXA90-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0c1b32717bcffcf8edf95294e98933bd4c1e76ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/c73e05fa5281c4efc453f2ff0a95830363f2a931
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Harshad-Shirwadkar/Ext4-fast-commit-performance-patch-series/20220721-140558
        git checkout c73e05fa5281c4efc453f2ff0a95830363f2a931
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ext4/fast_commit.c:205:10: error: no member named 'i_fc_commit_key' in 'struct ext4_inode_info'
                            &ei->i_fc_commit_key, 0);
                             ~~  ^
   include/linux/lockdep.h:370:29: note: expanded from macro 'lockdep_init_map'
                   do { (void)(name); (void)(key); } while (0)
                                             ^~~
   1 error generated.


vim +205 fs/ext4/fast_commit.c

   194	
   195	void ext4_fc_init_inode(struct inode *inode)
   196	{
   197		struct ext4_inode_info *ei = EXT4_I(inode);
   198	
   199		ext4_fc_reset_inode(inode);
   200		ext4_clear_inode_state(inode, EXT4_STATE_FC_COMMITTING);
   201		INIT_LIST_HEAD(&ei->i_fc_list);
   202		INIT_LIST_HEAD(&ei->i_fc_dilist);
   203		init_waitqueue_head(&ei->i_fc_wait);
   204		lockdep_init_map(&ei->i_fc_commit_map, "i_fc_commit",
 > 205				 &ei->i_fc_commit_key, 0);
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
