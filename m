Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993A631;
	Tue,  7 Mar 2023 05:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678167355; x=1709703355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hyTNpqM2b9GKOMTFjlkPMZk5a/OZvmwp1oPgWKdMH4=;
  b=CZ58xWYJjRGJuosxctv1HpirzWU+R5uQ7wTBRGTpFrJQmKvfxtcRP+jw
   fKv/GG6vb8muW3qXDy3k19X/4/XqNBMk8ILyq3hluw/xg4Y6fmx0jo3KL
   GmKwPXXt5gpgMIbtcjaghvfiOSoffPF6u/cBC7ZnMBKJFzMCbrk1Wr5uw
   0mzkuG//sCj+dSPQkqL+F9ZhFjI30hpPSN3u6+0tkkE6VGQWJqpYehYZp
   PdhAgb5eVWEB9gq/6JRzkVTLaX4aKEPjWqnLgA8cPd+AtftQaaEg4Gwe1
   5FhLJLZrvJZeLrFjWH3s0Bjad0a/SDKzdrlFu+gZhpxRSMu1/SFDyXHZM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335786354"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335786354"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653847090"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="653847090"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 21:35:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZPzL-0000zf-0e;
	Tue, 07 Mar 2023 05:35:51 +0000
Date: Tue, 7 Mar 2023 13:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.minix 3/4] ld.lld: error: duplicate
 symbol: dir_put_page
Message-ID: <202303071321.hh3RmMw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.minix
head:   39d0d7f9b65f1fe91c5ba6d375f1ddb0c34fe843
commit: b7176563af9725b556c512d0fee2dbd051839147 [3/4] minixfs: Use dir_put_page() in minix_unlink() and minix_rename()
config: i386-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071321.hh3RmMw8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b7176563af9725b556c512d0fee2dbd051839147
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.minix
        git checkout b7176563af9725b556c512d0fee2dbd051839147
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071321.hh3RmMw8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: dir_put_page
   >>> defined at dir.c:30 (fs/minix/dir.c:30)
   >>>            fs/minix/dir.o:(dir_put_page) in archive vmlinux.a
   >>> defined at dir.c:32 (fs/sysv/dir.c:32)
   >>>            fs/sysv/dir.o:(.text+0x200) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
