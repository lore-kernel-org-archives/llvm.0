Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1617A8462;
	Wed,  8 Mar 2023 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678296957; x=1709832957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOMowpisuT+Vu8Qd1JnOmOwSzbYzkLa2oKEzLeAm7eM=;
  b=VcdMtYuaE/lnmCjkGikFYKqPolPDHAHZwyZBaqCWg6xC/N2HkDw3skMs
   yObT0li1tzTVTdOtlrYE7xcYQ9vkstQcCP5pZxXLs5rIEE0N1AA7j6xqf
   2B/J0vTv/Q6w9L6TynieiNSgMUaL2/1eB3OAoDtTeLSZ3Jq6L7yhZ5e+U
   T1tdeprGfuVLFh11JCimxvTPf6VB6PSixbktbrCTAFNGe0VUZl6zmh0da
   iNZWxAQKeSpFpXUtqHyF+kDS0/FnnvrN451U0JVIzYXSh7+EODu9n6orF
   rk7r2iZhh26ud5zlSqKat1wiAc/hf+2D1T+I0rQmT1m00jzNY96GIE2e1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398802387"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="398802387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 09:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820315270"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820315270"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 09:35:54 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZxhh-0002Iz-2K;
	Wed, 08 Mar 2023 17:35:53 +0000
Date: Thu, 9 Mar 2023 01:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1239/1915] security/security.c:3566: warning:
 expecting prototype for security_sem_ctl(). Prototype was for
 security_sem_semctl() instead
Message-ID: <202303090143.xmmvxZYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: 43fad282187695e25c51425ee9f5f9f08fe5e15d [1239/1915] lsm: move the sysv hook comments to security/security.c
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230309/202303090143.xmmvxZYq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=43fad282187695e25c51425ee9f5f9f08fe5e15d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 43fad282187695e25c51425ee9f5f9f08fe5e15d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090143.xmmvxZYq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/security.c:1083: warning: Function parameter or member 'mnt_opts' not described in 'security_free_mnt_opts'
   security/security.c:1083: warning: Excess function parameter 'mnt_ops' description in 'security_free_mnt_opts'
   security/security.c:1101: warning: Function parameter or member 'mnt_opts' not described in 'security_sb_eat_lsm_opts'
   security/security.c:1101: warning: Excess function parameter 'mnt_ops' description in 'security_sb_eat_lsm_opts'
   security/security.c:1269: warning: Function parameter or member 'oldsb' not described in 'security_sb_clone_mnt_opts'
   security/security.c:1269: warning: Function parameter or member 'newsb' not described in 'security_sb_clone_mnt_opts'
   security/security.c:1269: warning: Excess function parameter 'olddb' description in 'security_sb_clone_mnt_opts'
   security/security.c:1269: warning: Excess function parameter 'newdb' description in 'security_sb_clone_mnt_opts'
   security/security.c:1760: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * security_inode_symlink() Check if creating a symbolic link is allowed
   security/security.c:1976: warning: Function parameter or member 'size' not described in 'security_inode_setxattr'
   security/security.c:2533: warning: Function parameter or member 'prot' not described in 'security_file_mprotect'
   security/security.c:2533: warning: Excess function parameter 'prog' description in 'security_file_mprotect'
   security/security.c:3267: warning: Function parameter or member 'flag' not described in 'security_ipc_permission'
   security/security.c:3267: warning: Excess function parameter 'flags' description in 'security_ipc_permission'
>> security/security.c:3566: warning: expecting prototype for security_sem_ctl(). Prototype was for security_sem_semctl() instead
   security/security.c:3838: warning: expecting prototype for security_socket_create(). Prototype was for security_socket_post_create() instead
   security/security.c:4100: warning: Function parameter or member 'priority' not described in 'security_sk_alloc'
   security/security.c:4100: warning: Excess function parameter 'priotity' description in 'security_sk_alloc'
   security/security.c:4157: warning: Function parameter or member 'parent' not described in 'security_sock_graft'
   security/security.c:4157: warning: Excess function parameter 'sock' description in 'security_sock_graft'
   security/security.c:4614: warning: Function parameter or member 'xp' not described in 'security_xfrm_state_pol_flow_match'
   security/security.c:4720: warning: Function parameter or member '_buffer' not described in 'security_key_getsecurity'
   security/security.c:4720: warning: Excess function parameter 'buffer' description in 'security_key_getsecurity'


vim +3566 security/security.c

20510f2f4e2dab James Morris      2007-10-16  3554  
43fad282187695 Paul Moore        2023-02-16  3555  /**
43fad282187695 Paul Moore        2023-02-16  3556   * security_sem_ctl() - Check if a sysv semaphore operation is allowed
43fad282187695 Paul Moore        2023-02-16  3557   * @sma: sysv ipc permission structure
43fad282187695 Paul Moore        2023-02-16  3558   * @cmd: operation
43fad282187695 Paul Moore        2023-02-16  3559   *
43fad282187695 Paul Moore        2023-02-16  3560   * Check permission when a semaphore operation specified by @cmd is to be
43fad282187695 Paul Moore        2023-02-16  3561   * performed on the semaphore.
43fad282187695 Paul Moore        2023-02-16  3562   *
43fad282187695 Paul Moore        2023-02-16  3563   * Return: Returns 0 if permission is granted.
43fad282187695 Paul Moore        2023-02-16  3564   */
aefad9593ec5ad Eric W. Biederman 2018-03-22  3565  int security_sem_semctl(struct kern_ipc_perm *sma, int cmd)
20510f2f4e2dab James Morris      2007-10-16 @3566  {
f25fce3e8f1f15 Casey Schaufler   2015-05-02  3567  	return call_int_hook(sem_semctl, 0, sma, cmd);
20510f2f4e2dab James Morris      2007-10-16  3568  }
20510f2f4e2dab James Morris      2007-10-16  3569  

:::::: The code at line 3566 was first introduced by commit
:::::: 20510f2f4e2dabb0ff6c13901807627ec9452f98 security: Convert LSM into a static interface

:::::: TO: James Morris <jmorris@namei.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
