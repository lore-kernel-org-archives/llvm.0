Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965E612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662759503; x=1694295503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmX1nkIl9g5EbZ4VqaIy45vcpqFgs0yn6b4pX+hcM3U=;
  b=Jl/GAxPCrdESBlUjqFu0rcVKy+1YvlZLUcEmQI459QGp8AbOUjQi2P1/
   hgZFc5cQLHat2fRg/dFpn4eKZBzHI4WggQaTLH8VVEId3CHA8ItDtXefa
   ybTuWosGbvmRNTR9HXfhPgItpLJaN06vP0Ccr+UvzIjCXg3cHXbFUP1xN
   Qt08FAF6De7AXKQJ7I0Zz39l9+7WXBZTdba5L8epdRrjNSk6sJYpaF8dD
   m54nlT0DrlZYlc1h0gSBJc9a1swGWzDVF9Gn6WIEY2zl60EvlkDF1wXaw
   Va94qKShKIt1k35hvWPqz/bXBalzYpYB8mZUWSzpz07TbqTbRGTmr+2TF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="323791631"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="323791631"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 14:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="592757183"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2022 14:38:13 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWlhQ-0001lX-0D;
	Fri, 09 Sep 2022 21:38:08 +0000
Date: Sat, 10 Sep 2022 05:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vfs-idmapping:fs.posix_acl.vfsuid 15/37] fs/9p/acl.h:29:1: error:
 expected identifier or '('
Message-ID: <202209100550.85zb3adU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git fs.posix_acl.vfsuid
head:   d37e11d9b40fc35810217121aa3205b7975fd4c6
commit: c45bf675834bb2d099f0a8375cadeb30f4d915e5 [15/37] 9p: add ->get_dentry_acl() method
config: arm-randconfig-r002-20220907 (https://download.01.org/0day-ci/archive/20220910/202209100550.85zb3adU-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=c45bf675834bb2d099f0a8375cadeb30f4d915e5
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping fs.posix_acl.vfsuid
        git checkout c45bf675834bb2d099f0a8375cadeb30f4d915e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/9p/vfs_super.c:31:
>> fs/9p/acl.h:29:1: error: expected identifier or '('
   v9fs_iop_get_dentry_acl(struct user_namespace *mnt_userns,
   ^
   fs/9p/acl.h:23:33: note: expanded from macro 'v9fs_iop_get_dentry_acl'
   #define v9fs_iop_get_dentry_acl NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   In file included from fs/9p/vfs_super.c:31:
>> fs/9p/acl.h:29:1: error: expected ')'
   fs/9p/acl.h:23:33: note: expanded from macro 'v9fs_iop_get_dentry_acl'
   #define v9fs_iop_get_dentry_acl NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   fs/9p/acl.h:29:1: note: to match this '('
   fs/9p/acl.h:23:33: note: expanded from macro 'v9fs_iop_get_dentry_acl'
   #define v9fs_iop_get_dentry_acl NULL
                                   ^
   include/linux/stddef.h:8:15: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                 ^
   In file included from fs/9p/vfs_super.c:31:
>> fs/9p/acl.h:29:1: error: expected ')'
   v9fs_iop_get_dentry_acl(struct user_namespace *mnt_userns,
   ^
   fs/9p/acl.h:23:33: note: expanded from macro 'v9fs_iop_get_dentry_acl'
   #define v9fs_iop_get_dentry_acl NULL
                                   ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                         ^
   fs/9p/acl.h:29:1: note: to match this '('
   fs/9p/acl.h:23:33: note: expanded from macro 'v9fs_iop_get_dentry_acl'
   #define v9fs_iop_get_dentry_acl NULL
                                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   3 errors generated.


vim +29 fs/9p/acl.h

     8	
     9	#ifdef CONFIG_9P_FS_POSIX_ACL
    10	int v9fs_get_acl(struct inode *inode, struct p9_fid *fid);
    11	struct posix_acl *v9fs_iop_get_acl(struct inode *inode, int type,
    12					   bool rcu);
    13	struct posix_acl *v9fs_iop_get_dentry_acl(struct user_namespace *mnt_userns,
    14						  struct dentry *dentry, int type);
    15	int v9fs_acl_chmod(struct inode *inode, struct p9_fid *fid);
    16	int v9fs_set_create_acl(struct inode *inode, struct p9_fid *fid,
    17				struct posix_acl *dacl, struct posix_acl *acl);
    18	int v9fs_acl_mode(struct inode *dir, umode_t *modep,
    19			  struct posix_acl **dpacl, struct posix_acl **pacl);
    20	void v9fs_put_acl(struct posix_acl *dacl, struct posix_acl *acl);
    21	#else
    22	#define v9fs_iop_get_acl	NULL
    23	#define v9fs_iop_get_dentry_acl NULL
    24	static inline int v9fs_get_acl(struct inode *inode, struct p9_fid *fid)
    25	{
    26		return 0;
    27	}
    28	static inline struct posix_acl *
  > 29	v9fs_iop_get_dentry_acl(struct user_namespace *mnt_userns,
    30				struct dentry *dentry, int type)
    31	{
    32		return NULL;
    33	}
    34	static inline int v9fs_acl_chmod(struct inode *inode, struct p9_fid *fid)
    35	{
    36		return 0;
    37	}
    38	static inline int v9fs_set_create_acl(struct inode *inode,
    39					      struct p9_fid *fid,
    40					      struct posix_acl *dacl,
    41					      struct posix_acl *acl)
    42	{
    43		return 0;
    44	}
    45	static inline void v9fs_put_acl(struct posix_acl *dacl,
    46					struct posix_acl *acl)
    47	{
    48	}
    49	static inline int v9fs_acl_mode(struct inode *dir, umode_t *modep,
    50					struct posix_acl **dpacl,
    51					struct posix_acl **pacl)
    52	{
    53		return 0;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
