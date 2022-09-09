Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155253A4
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662745145; x=1694281145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2A8zxmn6dO/dpHBqa6VyKZ5SiyK6NYBe+KopCAzw1Lo=;
  b=OprFB492v7ffvlHSttfbqefgjXhtLjIXaoNmgpA+mPggkntB9DW+uAP2
   ND9xB7Ugqk1NWz4sWyjymypTSEs4Nu3xeiwxAoKdyabWay40sHXIAzMgJ
   V43QgRd8aOaQ6wvhKNW0PIbGZp/4MyvWcPD9DC7JhcuybpgLhCjxSqbQY
   iaMs8b7qb1l1QPrJWV9CpomR28gmF13U51r66MnWdQjHS4RjnxO4mgVfV
   B3noTkUyfsW+jjhUdmqGxoRcPJL3CvSQ4UQviC3GZYHSA8SaQnOGLTURq
   6uyjiq554roWXdHkBJTqIE5rz+PVfkcMyh70Ht797X9VDIiYCTE/4t0/W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277922788"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="277922788"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 10:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="683718411"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 10:38:49 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWhxp-0001XS-02;
	Fri, 09 Sep 2022 17:38:49 +0000
Date: Sat, 10 Sep 2022 01:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vfs-idmapping:fs.posix_acl.vfsuid 12/37] fs/cifs/cifsacl.c:1684:20:
 warning: variable 'pTcon' set but not used
Message-ID: <202209100159.gx43mPbM-lkp@intel.com>
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
commit: fa37058424f3ca8becc99200b11a3690537f134e [12/37] cifs: add ->get_dentry_acl() method
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220910/202209100159.gx43mPbM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=fa37058424f3ca8becc99200b11a3690537f134e
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping fs.posix_acl.vfsuid
        git checkout fa37058424f3ca8becc99200b11a3690537f134e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/cifs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cifs/cifsacl.c:1684:20: warning: variable 'pTcon' set but not used [-Wunused-but-set-variable]
           struct cifs_tcon *pTcon;
                             ^
   1 warning generated.


vim +/pTcon +1684 fs/cifs/cifsacl.c

  1674	
  1675	struct posix_acl *cifs_get_dentry_acl(struct user_namespace *mnt_userns,
  1676					      struct dentry *dentry, int type)
  1677	{
  1678		struct posix_acl *acl = NULL;
  1679		ssize_t rc = -EOPNOTSUPP;
  1680		unsigned int xid;
  1681		struct super_block *sb = dentry->d_sb;
  1682		struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
  1683		struct tcon_link *tlink;
> 1684		struct cifs_tcon *pTcon;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
