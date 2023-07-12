Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DC1F959;
	Wed, 12 Jul 2023 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689159835; x=1720695835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9shn0IUh/Hwp9v+cleDFBwdltuYhx4guPILDjwjwO4=;
  b=dZY/bRc6a+MUIHhKR6IX/1lgUtUknxkhABmTFSRfu++2ZPDuI6VmZSc/
   Z3CZP+ieTYYhW6+N1aOpKxNaQQhlayDTmFDwMiKnYZcnsxpYqFosabWJ4
   1g63XE4frBZ9XBg/9irO/mioZ0bBjwlY5+WrOPbXaig67Phy8Rv7UV4KN
   muo+8E7L2f/SonDzhhaoCssLOEQLTOfLVz7TxA5kj/OupgthJQOzPmnMZ
   TVPHj8sHjfznzsrh4jJpDjy4ggzT8qkWksXJQhdqF6oBybaTn39kuOvYY
   K//7kmoZ36lM6xvMewySw7fnYfBfSUYHePEr6J2fnEqcnAX2FPi9q4Swv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354768443"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="354768443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 04:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791592260"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="791592260"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 04:03:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJXdQ-0005dp-0Z;
	Wed, 12 Jul 2023 11:03:52 +0000
Date: Wed, 12 Jul 2023 19:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <github@ivan.computer>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/kernfs-fsid 1/1] fs/kernfs/mount.c:50:5: warning: no
 previous prototype for function 'kernfs_statfs'
Message-ID: <202307121858.XsJdxsj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/kernfs-fsid
head:   556d2ad5c816ebd4bc5144ef2cf82e2a5622b040
commit: 556d2ad5c816ebd4bc5144ef2cf82e2a5622b040 [1/1] kernfs: attach uuid for every kernfs and report it in fsid
config: arm-randconfig-r005-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121858.XsJdxsj7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121858.XsJdxsj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121858.XsJdxsj7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/mount.c:50:5: warning: no previous prototype for function 'kernfs_statfs' [-Wmissing-prototypes]
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         |     ^
   fs/kernfs/mount.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         | ^
         | static 
   1 warning generated.


vim +/kernfs_statfs +50 fs/kernfs/mount.c

    49	
  > 50	int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
    51	{
    52		simple_statfs(dentry, buf);
    53		buf->f_fsid = uuid_to_fsid(dentry->d_sb->s_uuid.b);
    54		return 0;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
