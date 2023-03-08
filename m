Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95510647;
	Wed,  8 Mar 2023 05:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678253799; x=1709789799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PU/5UgLhrOpJXpRDW5FLj7jSvg2KnF33Ge3DhHH6m8=;
  b=TMbt+9ff/IEoZvH2DHVYoRsW5UgCSQTpHyYJyOA8sa5DLNqsWNTJzMk0
   17bX6U3saChp6nA21Ho0KlmFqMiE2t8xhNMkCbXccz0z9rqf6TGCqPPcM
   BplFnLi9jPaDjZhP4BpYCoYpeaOiLrh/06JNqlObDE9ivybGKfwBmPekX
   DjSUGUf5uSTd+wwxq9uu+RtD2eLyBW3n2ar6HA7+gNC485sYRf3573wVD
   sZ4r3V/n5RKaV2yK9W7NGzL0cLzUI+tyLqnSDoht3qjTOTar1D3HFpUVc
   Xy8+Sm5eQ986hbVrEwBtaC5NpvWOkR6jGXs/PRNUUoC4rKD172MGFxGp+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334782031"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="334782031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 21:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745777385"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="745777385"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 21:36:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZmTc-0001uh-1P;
	Wed, 08 Mar 2023 05:36:36 +0000
Date: Wed, 8 Mar 2023 13:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1234/1915] security/security.c:3647: warning:
 expecting prototype for security_socket_create(). Prototype was for
 security_socket_post_create() instead
Message-ID: <202303081345.OAmwqAh7-lkp@intel.com>
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
commit: 6b6bbe8c02a1bc7ef7f0aa490a3601a16cd145fe [1234/1915] lsm: move the socket hook comments to security/security.c
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081345.OAmwqAh7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6b6bbe8c02a1bc7ef7f0aa490a3601a16cd145fe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6b6bbe8c02a1bc7ef7f0aa490a3601a16cd145fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081345.OAmwqAh7-lkp@intel.com/

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
>> security/security.c:3647: warning: expecting prototype for security_socket_create(). Prototype was for security_socket_post_create() instead
   security/security.c:3909: warning: Function parameter or member 'priority' not described in 'security_sk_alloc'
   security/security.c:3909: warning: Excess function parameter 'priotity' description in 'security_sk_alloc'
   security/security.c:3966: warning: Function parameter or member 'parent' not described in 'security_sock_graft'
   security/security.c:3966: warning: Excess function parameter 'sock' description in 'security_sock_graft'


vim +3647 security/security.c

20510f2f4e2dabb James Morris    2007-10-16  3626  
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3627  /**
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3628   * security_socket_create() - Initialize a newly created socket
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3629   * @sock: socket
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3630   * @family: protocol family
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3631   * @type: communications type
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3632   * @protocol: requested protocol
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3633   * @kern: set to 1 if a kernel socket is requested
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3634   *
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3635   * This hook allows a module to update or allocate a per-socket security
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3636   * structure. Note that the security field was not added directly to the socket
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3637   * structure, but rather, the socket security information is stored in the
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3638   * associated inode.  Typically, the inode alloc_security hook will allocate
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3639   * and attach security information to SOCK_INODE(sock)->i_security.  This hook
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3640   * may be used to update the SOCK_INODE(sock)->i_security field with additional
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3641   * information that wasn't available when the inode was allocated.
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3642   *
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3643   * Return: Returns 0 if permission is granted.
6b6bbe8c02a1bc7 Paul Moore      2023-02-12  3644   */
20510f2f4e2dabb James Morris    2007-10-16  3645  int security_socket_post_create(struct socket *sock, int family,
20510f2f4e2dabb James Morris    2007-10-16  3646  				int type, int protocol, int kern)
20510f2f4e2dabb James Morris    2007-10-16 @3647  {
f25fce3e8f1f15d Casey Schaufler 2015-05-02  3648  	return call_int_hook(socket_post_create, 0, sock, family, type,
20510f2f4e2dabb James Morris    2007-10-16  3649  						protocol, kern);
20510f2f4e2dabb James Morris    2007-10-16  3650  }
20510f2f4e2dabb James Morris    2007-10-16  3651  

:::::: The code at line 3647 was first introduced by commit
:::::: 20510f2f4e2dabb0ff6c13901807627ec9452f98 security: Convert LSM into a static interface

:::::: TO: James Morris <jmorris@namei.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
