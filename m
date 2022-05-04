Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077612105
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651649584; x=1683185584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfgdqSk9odbLxeB6Wlsncoi63Xb5UE/LBNpGXNPnJOU=;
  b=mzmzwLNO0IMSVEk7dnEWMIjsiqNorNdjx6lFT3XZ3szor8omf2PPeSH0
   qUM09KcgwKsfEBgkPziXKBJ4W6LAi3igj0CCz5w19aYJCUEHxjBWBgi5o
   L2tZxldVEGkADpXFYMsqI1jYfB+W0RlOsD6tFwM2R552Q8HiW8YYIdlQQ
   6GXF8Pm3sgQkH6+lsq7MJQkONrq5W9z2iVSBYST2YbEIYTQPZsntuFkAJ
   3S3JUS57bTBWGRSRCh4Ikg+VBJWgY1hTgFPdwf03JykS8gk2Xw01qcae0
   KLliR8sKlPOr1GbLaXVOYMfMn3jr3nLA+xLg0P6e0QJ9/+hULW0hJAjGq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328231890"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="328231890"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 00:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="631845182"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 May 2022 00:32:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm9VI-000BB2-96;
	Wed, 04 May 2022 07:32:56 +0000
Date: Wed, 4 May 2022 15:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kees:for-next/kspp 12/12] fs/gfs2/meta_io.h:44:12: error: casting
 from randomized structure pointer type 'struct address_space *' to 'struct
 gfs2_glock *'
Message-ID: <202205041550.naKxwCBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   1fe35f29cf8220a5f9ab39ee3e5c722eb716b6fa
commit: 1fe35f29cf8220a5f9ab39ee3e5c722eb716b6fa [12/12] randstruct: Enable Clang support
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/archive/20220504/202205041550.naKxwCBj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=1fe35f29cf8220a5f9ab39ee3e5c722eb716b6fa
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
        git fetch --no-tags kees for-next/kspp
        git checkout 1fe35f29cf8220a5f9ab39ee3e5c722eb716b6fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/gfs2/acl.c:23:
>> fs/gfs2/meta_io.h:44:12: error: casting from randomized structure pointer type 'struct address_space *' to 'struct gfs2_glock *'
                   return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
                            ^
   1 error generated.


vim +44 fs/gfs2/meta_io.h

009d851837ab26 Steven Whitehouse 2009-12-08  39  
009d851837ab26 Steven Whitehouse 2009-12-08  40  static inline struct gfs2_sbd *gfs2_mapping2sbd(struct address_space *mapping)
009d851837ab26 Steven Whitehouse 2009-12-08  41  {
009d851837ab26 Steven Whitehouse 2009-12-08  42  	struct inode *inode = mapping->host;
009d851837ab26 Steven Whitehouse 2009-12-08  43  	if (mapping->a_ops == &gfs2_meta_aops)
15562c439d0a18 Bob Peterson      2015-03-16 @44  		return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
1b2ad41214c9bf Steven Whitehouse 2014-03-31  45  	else if (mapping->a_ops == &gfs2_rgrp_aops)
1b2ad41214c9bf Steven Whitehouse 2014-03-31  46  		return container_of(mapping, struct gfs2_sbd, sd_aspace);
009d851837ab26 Steven Whitehouse 2009-12-08  47  	else
009d851837ab26 Steven Whitehouse 2009-12-08  48  		return inode->i_sb->s_fs_info;
009d851837ab26 Steven Whitehouse 2009-12-08  49  }
b3b94faa5fe596 David Teigland    2006-01-16  50  

:::::: The code at line 44 was first introduced by commit
:::::: 15562c439d0a1850b71aa1c0d92d1f4fb9503c8d GFS2: Move glock superblock pointer to field gl_name

:::::: TO: Bob Peterson <rpeterso@redhat.com>
:::::: CC: Bob Peterson <rpeterso@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
