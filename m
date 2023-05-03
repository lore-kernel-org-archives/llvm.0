Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6ABDF64;
	Wed,  3 May 2023 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683140791; x=1714676791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDgOlh2uzLj+um2IWqSZfoUAZz7UdFnBbt+SG8One88=;
  b=H0mXadU9qUPWo3S7o3PJYVBvYfFv1UOxWP7qSxRAR1yudE7e2h7dZpzD
   ruB2bQBSvOFjdzBe0pzr0p+AU/soYxdRIbip98d8baW33uyG79vjOtldN
   K9qpcugO/q7sC9PwTNHyJ38B3p1ZQsS3aG3L15tve0Ql9Hrj28Og5tXmu
   NB55gEHuwl/hQBWOvdfl0AbpcEgts8H2VJNWsS4HXP0lvf9IJNDgW3xHu
   kSEZis3DzQ7Wh8UeWKyAbkWMckmqoNJN2iVUVP7Bvr2I9Gzo3pEYyBJaz
   wYp+JX9gb8kJn9Vag/yf0l1sr/IPSiEp04rHtMOK45aOkmRX15eXlPKGa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435054804"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="435054804"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 12:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="690814631"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="690814631"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 May 2023 12:06:29 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puHo4-0002DE-1P;
	Wed, 03 May 2023 19:06:28 +0000
Date: Thu, 4 May 2023 03:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 6/6] fs/f2fs/super.c:2916:26: warning: variable
 'inode' is uninitialized when used here
Message-ID: <202305040319.EAx2MRsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   fd78b242ba1bbc77bdfb3d58a3cec054d3f18ed1
commit: fd78b242ba1bbc77bdfb3d58a3cec054d3f18ed1 [6/6] f2fs: fix potential deadlock due to unpaired node_write lock invoking
config: i386-randconfig-a013-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040319.EAx2MRsG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=fd78b242ba1bbc77bdfb3d58a3cec054d3f18ed1
        git remote add chao https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
        git fetch --no-tags chao dev-test
        git checkout fd78b242ba1bbc77bdfb3d58a3cec054d3f18ed1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040319.EAx2MRsG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:2916:26: warning: variable 'inode' is uninitialized when used here [-Wuninitialized]
           f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
                                   ^~~~~
   fs/f2fs/super.c:2903:21: note: initialize the variable 'inode' to silence this warning
           struct inode *inode;
                              ^
                               = NULL
   1 warning generated.


vim +/inode +2916 fs/f2fs/super.c

  2899	
  2900	static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
  2901								const struct path *path)
  2902	{
  2903		struct inode *inode;
  2904		int err;
  2905	
  2906		/* if quota sysfile exists, deny enabling quota with specific file */
  2907		if (f2fs_sb_has_quota_ino(F2FS_SB(sb))) {
  2908			f2fs_err(F2FS_SB(sb), "quota sysfile already exists");
  2909			return -EBUSY;
  2910		}
  2911	
  2912		err = f2fs_quota_sync(sb, type);
  2913		if (err)
  2914			return err;
  2915	
> 2916		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
  2917		filemap_invalidate_lock(inode->i_mapping);
  2918	
  2919		truncate_pagecache(inode, i_size_read(inode));
  2920	
  2921		if (get_dirty_pages(inode))
  2922			err = -EAGAIN;
  2923		else
  2924			err = dquot_quota_on(sb, type, format_id, path);
  2925	
  2926		filemap_invalidate_unlock(inode->i_mapping);
  2927		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
  2928		if (err)
  2929			return err;
  2930	
  2931		inode = d_inode(path->dentry);
  2932	
  2933		inode_lock(inode);
  2934		F2FS_I(inode)->i_flags |= F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
  2935		f2fs_set_inode_flags(inode);
  2936		inode_unlock(inode);
  2937		f2fs_mark_inode_dirty_sync(inode, false);
  2938		return 0;
  2939	}
  2940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
