Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9626030
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657839713; x=1689375713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mJqNYCiJiBV8r8JGqaPJTj3kunLJICcrBkX4in58acU=;
  b=H7WjDYVEDx8i1tIk/BJoC630cMNIL8Td7WY6RcTExlbaCm9jFFWmU5o+
   WvpShxIK2RPhDmlYye1EU0PrA4PbFV3++yoVT1utw7OVXpuoXDILsW0uI
   mRPC/+OtkVDlQBXc0T+ibcxLcwzrsbZW0BXyuKDembMX3icCl2LqBZgbC
   L3I5MCZOHAaZiYbJ3yCSTmhGWJ5LvccTmzjHj9chRe8HB14SmWMxk/Qde
   mFAqnhW0eFzHYCP2B0S8g9A6QZEm7joVZHCg8jMhSsCr1MtRnt4XWhMLF
   a5uKNDcp3IeI3XT3wswhBUd3ADadw5LHkdUw9SQDiIDTL8aWV6Y7Z4iZK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="347326866"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="347326866"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 16:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="571284457"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2022 16:01:50 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC7q9-0001FZ-GI;
	Thu, 14 Jul 2022 23:01:49 +0000
Date: Fri, 15 Jul 2022 07:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Theodore Ts'o <tytso@mit.edu>, Hugh Dickins <hughd@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH] mm/shmem: add support for FS_IOC_[SG]ETFLAGS for tmpfs
Message-ID: <202207150617.dHbSxB55-lkp@intel.com>
References: <20220713145234.2356641-1-tytso@mit.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713145234.2356641-1-tytso@mit.edu>

Hi Theodore,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Theodore-Ts-o/mm-shmem-add-support-for-FS_IOC_-SG-ETFLAGS-for-tmpfs/20220713-225257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r024-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150617.dHbSxB55-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2a3164ac6dafb6c7a3cd8a1002e89370eec359c1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Theodore-Ts-o/mm-shmem-add-support-for-FS_IOC_-SG-ETFLAGS-for-tmpfs/20220713-225257
        git checkout 2a3164ac6dafb6c7a3cd8a1002e89370eec359c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/shmem.c:1062:22: error: use of undeclared identifier 'EXT2_APPEND_FL'
           if (info->fsflags & EXT2_APPEND_FL)
                               ^
>> mm/shmem.c:1064:22: error: use of undeclared identifier 'EXT2_IMMUTABLE_FL'
           if (info->fsflags & EXT2_IMMUTABLE_FL)
                               ^
>> mm/shmem.c:1066:22: error: use of undeclared identifier 'EXT2_NODUMP_FL'
           if (info->fsflags & EXT2_NODUMP_FL)
                               ^
>> mm/shmem.c:2840:5: warning: no previous prototype for function 'shmem_fileattr_get' [-Wmissing-prototypes]
   int shmem_fileattr_get(struct dentry *dentry, struct fileattr *fa)
       ^
   mm/shmem.c:2840:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int shmem_fileattr_get(struct dentry *dentry, struct fileattr *fa)
   ^
   static 
>> mm/shmem.c:2851:5: warning: no previous prototype for function 'shmem_fileattr_set' [-Wmissing-prototypes]
   int shmem_fileattr_set(struct user_namespace *mnt_userns,
       ^
   mm/shmem.c:2851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int shmem_fileattr_set(struct user_namespace *mnt_userns,
   ^
   static 
   2 warnings and 3 errors generated.


vim +/EXT2_APPEND_FL +1062 mm/shmem.c

  1049	
  1050	static int shmem_getattr(struct user_namespace *mnt_userns,
  1051				 const struct path *path, struct kstat *stat,
  1052				 u32 request_mask, unsigned int query_flags)
  1053	{
  1054		struct inode *inode = path->dentry->d_inode;
  1055		struct shmem_inode_info *info = SHMEM_I(inode);
  1056	
  1057		if (info->alloced - info->swapped != inode->i_mapping->nrpages) {
  1058			spin_lock_irq(&info->lock);
  1059			shmem_recalc_inode(inode);
  1060			spin_unlock_irq(&info->lock);
  1061		}
> 1062		if (info->fsflags & EXT2_APPEND_FL)
  1063			stat->attributes |= STATX_ATTR_APPEND;
> 1064		if (info->fsflags & EXT2_IMMUTABLE_FL)
  1065			stat->attributes |= STATX_ATTR_IMMUTABLE;
> 1066		if (info->fsflags & EXT2_NODUMP_FL)
  1067			stat->attributes |= STATX_ATTR_NODUMP;
  1068		stat->attributes_mask |= (STATX_ATTR_APPEND |
  1069				STATX_ATTR_IMMUTABLE |
  1070				STATX_ATTR_NODUMP);
  1071		generic_fillattr(&init_user_ns, inode, stat);
  1072	
  1073		if (shmem_is_huge(NULL, inode, 0))
  1074			stat->blksize = HPAGE_PMD_SIZE;
  1075	
  1076		if (request_mask & STATX_BTIME) {
  1077			stat->result_mask |= STATX_BTIME;
  1078			stat->btime.tv_sec = info->i_crtime.tv_sec;
  1079			stat->btime.tv_nsec = info->i_crtime.tv_nsec;
  1080		}
  1081	
  1082		return 0;
  1083	}
  1084	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
