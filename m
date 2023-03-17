Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2782C9D;
	Fri, 17 Mar 2023 22:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679093664; x=1710629664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9tHgr8WD7PyHjW1Xho/mPO9QPYuMXRqFSApU2QZKDk=;
  b=CNqFV1Rrn0aLjKEIR5RLkCQt7wxpLSLqvuZH+UGuc0A8QDn+VATQ7lGm
   1cTEQ9bYNGpiPnfRuBlnobWupz6okrV7Tgqj6I2zYeyLE6g1y1NPiCk3A
   tt4AJyTfbr4dCdr9ormNB+igud51+PWKx3pCwlcP7hrIuQw2BKRFA/KMo
   pYY7mgxHVBA03kaDhCJApT++dYCA66wY3rWEvyRH6vShH2J26N7vSLrkh
   Vc9dxEyEtBMi5bLS8AjdxF24UOjSfzNP1UXy4H1rsE8AqkJzaCB2v7Clj
   I+J0duDrWOaLp8ECwhj80Cvc0RzSycC1DDD6FGC+rOfOBO+lgUr7zOTzt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340734701"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340734701"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 15:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823816673"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="823816673"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 15:54:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdIxp-0009dK-2i;
	Fri, 17 Mar 2023 22:54:21 +0000
Date: Sat, 18 Mar 2023 06:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-tucked-mounts 3/6] fs/namespace.c:674: warning:
 expecting prototype for lookup_mnt(). Prototype was for __lookup_mnt()
 instead
Message-ID: <202303180649.ITuFC5qM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-tucked-mounts
head:   fdc56c94378120a4df4fc4159aed109c405e27cd
commit: c2f168d4fdd7a0a9de3bb15624de05068bde646a [3/6] fs: fix __lookup_mnt() documentation
config: i386-randconfig-a011-20230313 (https://download.01.org/0day-ci/archive/20230318/202303180649.ITuFC5qM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=c2f168d4fdd7a0a9de3bb15624de05068bde646a
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-tucked-mounts
        git checkout c2f168d4fdd7a0a9de3bb15624de05068bde646a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180649.ITuFC5qM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:674: warning: expecting prototype for lookup_mnt(). Prototype was for __lookup_mnt() instead


vim +674 fs/namespace.c

48a066e72d970a Al Viro           2013-09-29  660  
c2f168d4fdd7a0 Christian Brauner 2023-03-14  661  /**
c2f168d4fdd7a0 Christian Brauner 2023-03-14  662   * lookup_mnt - find child mount
c2f168d4fdd7a0 Christian Brauner 2023-03-14  663   * @mnt:	parent mount
c2f168d4fdd7a0 Christian Brauner 2023-03-14  664   * @dentry:	mountpoint
c2f168d4fdd7a0 Christian Brauner 2023-03-14  665   *
c2f168d4fdd7a0 Christian Brauner 2023-03-14  666   * If @mnt has a child mount mounted @dentry find and return it. Note
c2f168d4fdd7a0 Christian Brauner 2023-03-14  667   * that the child-parent relationship per {mnt,dentry} pair is unique.
c2f168d4fdd7a0 Christian Brauner 2023-03-14  668   * In other words, there are now shadow mounts that have the same parent
c2f168d4fdd7a0 Christian Brauner 2023-03-14  669   * and are mounted at the same dentry.
c2f168d4fdd7a0 Christian Brauner 2023-03-14  670   *
c2f168d4fdd7a0 Christian Brauner 2023-03-14  671   * Return: The child of @mnt mounted @dentry or NULL if there is none.
^1da177e4c3f41 Linus Torvalds    2005-04-16  672   */
474279dc0f7745 Al Viro           2013-10-01  673  struct mount *__lookup_mnt(struct vfsmount *mnt, struct dentry *dentry)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @674  {
38129a13e6e71f Al Viro           2014-03-20  675  	struct hlist_head *head = m_hash(mnt, dentry);
474279dc0f7745 Al Viro           2013-10-01  676  	struct mount *p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  677  
38129a13e6e71f Al Viro           2014-03-20  678  	hlist_for_each_entry_rcu(p, head, mnt_hash)
474279dc0f7745 Al Viro           2013-10-01  679  		if (&p->mnt_parent->mnt == mnt && p->mnt_mountpoint == dentry)
474279dc0f7745 Al Viro           2013-10-01  680  			return p;
474279dc0f7745 Al Viro           2013-10-01  681  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  682  }
474279dc0f7745 Al Viro           2013-10-01  683  

:::::: The code at line 674 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
