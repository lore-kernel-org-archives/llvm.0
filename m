Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F51386
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645689017; x=1677225017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpLW7R98+Cpz8e2hnjgvLWtmjyX+7h4qs299daFjuQk=;
  b=ZqmcbHzD8C8ixVdo2frsqau+u2+ty0O7jx4UZHyHmz5YX8KecnGHCVH1
   WC8DMx+773Ycg1Tgk28JzWxXrcP62cx3s2nzeIMbVj4JAIrbQdMbWq35r
   0dwtAmw94cyRjyb1s/+aGg2l72ArfIr1WsFnmVU8/S1wjFDLKexYtKQXG
   YlCmcYbiZT20Ahf0h+8wx5VQ+Ir1L1uAz+8cfHdl+AcfpnScVQjbci4SV
   0r/EVv+pP2Cu3lMtsbVbcN/+gXpiXv2u9bRBH9afVtcHQrT7ds4+MW7Zy
   +z9ur5JRoh2vs90CRZTkU7AGboVy/dk2pBaelcPnxFzoN4PIv3xmVpgPm
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="235682224"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="235682224"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 23:50:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="574119625"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 23:50:15 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN8tC-0002rj-SX; Thu, 24 Feb 2022 07:50:14 +0000
Date: Thu, 24 Feb 2022 15:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6806/7915] ld.lld: error: undefined symbol:
 find_vma_intersection
Message-ID: <202202241512.jmoQhMEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: af49aeae1748b573a3794a6283210928a9fc8d0b [6806/7915] mm: Use maple tree operations for find_vma_intersection()
config: arm-randconfig-r036-20220223 (https://download.01.org/0day-ci/archive/20220224/202202241512.jmoQhMEv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af49aeae1748b573a3794a6283210928a9fc8d0b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout af49aeae1748b573a3794a6283210928a9fc8d0b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: find_vma_intersection
   >>> referenced by shm.c
   >>>               shm.o:(do_shmat) in archive ipc/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
