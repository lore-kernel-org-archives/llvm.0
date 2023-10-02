Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2117F4;
	Mon,  2 Oct 2023 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696236097; x=1727772097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=89/zuk+nlrFfcmsyZpmlpjQk7HYvmNQ3kHl5W7neP3s=;
  b=PXxLM2Mo/G5UbyVa3wAX3ttROZCyvgK7dwLSOh/kGGeDJUfKJkTpe1tV
   OK2L7BrbiL2ZEfnI1k6ofIMRSiqsJKf8UDVgJjHjJJph4DmAsfdM/6Aj4
   kOD+Bp7OUvuiMgHzKGzjo1TeCtSc1gBOxk7Qz9siBXS+p3mXRIa1IEMEX
   j0G0x6zWfbWn4QuilF9/64OG/4lySzPk/I8VGoCgDOjsQVVKvAbvwWMy7
   VX4eRPlyDIisNRkpRYCE1qHJHjDuCWe8e0dGoQGmhAoVhCmi8nnwezvPK
   /FG/pBEsQLiAhyMKGJrw1x2ereEJ+S1665ubq9gnThK1sAjo4fFaLEhy5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="446758820"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="446758820"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 01:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="727199956"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="727199956"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 02 Oct 2023 01:41:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnEUd-0005tN-0e;
	Mon, 02 Oct 2023 08:41:31 +0000
Date: Mon, 2 Oct 2023 16:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: cem@kernel.org, linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hughd@google.com,
	brauner@kernel.org, jack@suse.cz
Subject: Re: [PATCH 3/3] tmpfs: Add project quota interface support for
 get/set attr
Message-ID: <202310021602.dvZVjyMh-lkp@intel.com>
References: <20230925130028.1244740-4-cem@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925130028.1244740-4-cem@kernel.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc4 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cem-kernel-org/tmpfs-add-project-ID-support/20230925-210238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230925130028.1244740-4-cem%40kernel.org
patch subject: [PATCH 3/3] tmpfs: Add project quota interface support for get/set attr
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20231002/202310021602.dvZVjyMh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021602.dvZVjyMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021602.dvZVjyMh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:3574:58: error: no member named 'i_projid' in 'struct shmem_inode_info'
    3574 |         fa->fsx_projid = (u32)from_kprojid(&init_user_ns, info->i_projid);
         |                                                           ~~~~  ^
   mm/shmem.c:3583:41: error: no member named 'i_projid' in 'struct shmem_inode_info'
    3583 |         if (projid_eq(kprojid, SHMEM_I(inode)->i_projid))
         |                                ~~~~~~~~~~~~~~  ^
   mm/shmem.c:3590:18: error: no member named 'i_projid' in 'struct shmem_inode_info'
    3590 |         SHMEM_I(inode)->i_projid = kprojid;
         |         ~~~~~~~~~~~~~~  ^
   3 errors generated.


vim +3574 mm/shmem.c

  3567	
  3568	static int shmem_fileattr_get(struct dentry *dentry, struct fileattr *fa)
  3569	{
  3570		struct shmem_inode_info *info = SHMEM_I(d_inode(dentry));
  3571	
  3572		fileattr_fill_flags(fa, info->fsflags & SHMEM_FL_USER_VISIBLE);
  3573	
> 3574		fa->fsx_projid = (u32)from_kprojid(&init_user_ns, info->i_projid);
  3575		return 0;
  3576	}
  3577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
