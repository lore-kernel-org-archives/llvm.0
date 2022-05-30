Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9EA3234
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 20:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653943779; x=1685479779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLgUrwmBvYJzRs/dmjYgtmUxC/OOMG1qe2Oil/gEllQ=;
  b=K8iAVlxwjM0RSkI1jIl5MxmIxfkR9Dyeu5TDsPXdEIc9lx6FE5zTvPbt
   9JrnHpDvZGRCLAxlZ/Yi7t5vAEgPbGTTXX53rL1jezTBSIPWDAtFvbyFu
   pSDuPmNEn5WSi/w74VFKB9y/jAQHWLcgXKixZA1Bkhj4q19MlJjqAuMeU
   tMnAHY0hRD/y0m7oEjU5hrDW4FnK+ui3hf6RbMS1isnFAGQmsyAtaGKiL
   54S7Pb0fS7yfEZRmeKk3RyeE6e2D0KYPn10+9fNfxh6lZ3j83z6JXfjod
   HtTYitbYJ6c84V5E3b6jojCisJWDbmIM9bMIWEgzXKv4zwXrINAvzNnLO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="255561771"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="255561771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 13:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="611553038"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 May 2022 13:49:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvmKV-0001yy-PD;
	Mon, 30 May 2022 20:49:35 +0000
Date: Tue, 31 May 2022 04:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/cifs-netfs 32/41]
 fs/cifs/fscache.c:112:37: warning: incompatible integer to pointer
 conversion passing 'unsigned long' to parameter of type 'volatile unsigned
 long *'; take the address with &
Message-ID: <202205310411.hGi2pWAu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/cifs-netfs
head:   1fc71b6b30f6d2a981c163b77c9aee0aecaecb29
commit: ccc1acdfa787b5bf5c9c2b3f829b18f5a0bb0938 [32/41] mm, netfs, fscache: Stop read optimisation when folio removed from pagecache
config: x86_64-randconfig-a015-20220530 (https://download.01.org/0day-ci/archive/20220531/202205310411.hGi2pWAu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/ccc1acdfa787b5bf5c9c2b3f829b18f5a0bb0938
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/cifs-netfs
        git checkout ccc1acdfa787b5bf5c9c2b3f829b18f5a0bb0938
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/cifs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cifs/fscache.c:112:37: warning: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'volatile unsigned long *'; take the address with & [-Wint-conversion]
                   set_bit(AS_NOTIFY_REMOVING_FOLIO, inode->i_mapping->flags);
                                                     ^~~~~~~~~~~~~~~~~~~~~~~
                                                     &
   include/asm-generic/bitops/instrumented-atomic.h:26:70: note: passing argument to parameter 'addr' here
   static __always_inline void set_bit(long nr, volatile unsigned long *addr)
                                                                        ^
   1 warning generated.


vim +112 fs/cifs/fscache.c

    96	
    97	void cifs_fscache_get_inode_cookie(struct inode *inode)
    98	{
    99		struct cifs_fscache_inode_coherency_data cd;
   100		struct cifsInodeInfo *cifsi = CIFS_I(inode);
   101		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   102		struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
   103	
   104		cifs_fscache_fill_coherency(&cifsi->vfs_inode, &cd);
   105	
   106		cifsi->netfs_ctx.cache =
   107			fscache_acquire_cookie(tcon->fscache, 0,
   108					       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
   109					       &cd, sizeof(cd),
   110					       i_size_read(&cifsi->vfs_inode));
   111		if (cifsi->netfs_ctx.cache)
 > 112			set_bit(AS_NOTIFY_REMOVING_FOLIO, inode->i_mapping->flags);
   113	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
