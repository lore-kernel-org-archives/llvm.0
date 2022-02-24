Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFAED6
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 03:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645672261; x=1677208261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9EmUFqIg1GWaAbIjqrTM+RGEnJ987UvEwpJymzgaBoA=;
  b=LNWiYNvm1dT6GqOfiXYAl7PCKrhDuSGfrWdR1ssprYmu8Lr2eQKK0U7w
   NYsEoSxp/tap4F8uzHyFDJaKrwLKE5/U2c7YBIi/tWUiM87jUtAGHMAL+
   EhaNE8Uahn2XcvLdDX99w4UOwm0+2bhpoljew/ANTimOSkMqfKyZKAGnP
   vZezX3ylZLte+BzJb56/DotuKcXJAVEBsvu9whVk2V2hMUihBUElJtsCW
   8Djvr4eArPkh+jwUTXsxUkb9PF7I/7631yu91KUXBBi+vuDhiQM45RJzm
   Uv27N0BQDTndGfzDmvq77M+p8xJ791oa6oIofoJgBXtLzyXTnYHn9623P
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="315364559"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="315364559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 19:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="639564085"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Feb 2022 19:11:00 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN4Wx-0002A5-Ii; Thu, 24 Feb 2022 03:10:59 +0000
Date: Thu, 24 Feb 2022 11:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [trondmy-nfs-2.6:testing 42/44] ld.lld: error: undefined symbol:
 xxh32
Message-ID: <202202241119.1ZzPPbnV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   3882cc488a3048791d7f06393d3e7c55ba3eda6f
commit: 5d2f1b8a2961967f7712baaea33b6e83daf732f8 [42/44] NFS: Convert readdir page cache to use a cookie based index
config: arm-pcm027_defconfig (https://download.01.org/0day-ci/archive/20220224/202202241119.1ZzPPbnV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add trondmy-nfs-2.6 git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git
        git fetch --no-tags trondmy-nfs-2.6 testing
        git checkout 5d2f1b8a2961967f7712baaea33b6e83daf732f8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xxh32
   >>> referenced by dir.c
   >>>               nfs/dir.o:(nfs_readdir_page_get_locked) in archive fs/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
