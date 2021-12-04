Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E92C9D
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 16:50:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="234642692"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="234642692"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 08:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="541930900"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2021 08:49:55 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtYEV-000JDJ-2a; Sat, 04 Dec 2021 16:49:55 +0000
Date: Sun, 5 Dec 2021 00:49:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/vfio/vfio.o: warning: objtool:
 vfio_iommu_group_notifier()+0x49f: unreachable instruction
Message-ID: <202112050000.Ugi0KRlZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   12119cfa1052d512a92524e90ebee85029a918f8
commit: 3af917713230c8a6c3431e60601f0c7ad72eceb6 vfio: refactor noiommu group creation
date:   9 weeks ago
config: x86_64-randconfig-a001-20211204 (https://download.01.org/0day-ci/archive/20211205/202112050000.Ugi0KRlZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3af917713230c8a6c3431e60601f0c7ad72eceb6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3af917713230c8a6c3431e60601f0c7ad72eceb6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio.o: warning: objtool: vfio_iommu_group_notifier()+0x49f: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
