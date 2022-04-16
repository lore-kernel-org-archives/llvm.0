Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C917C9
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 01:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650073665; x=1681609665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnWW8RHrYAEi7ZmsFv26NaD1X/SNeXSnVLg9q3uTZX0=;
  b=EpENtPj/hy38NF9dAFM6zJWF+yWE6R8ZI9/SZhgSKgbZtAggzgwp/DDK
   LPQ4rH27vrpYSOTnYYR/hwBu3iFarBu86b4LIB+tr8HJpAJi1Dv5YbhZl
   367qZ/BV1xa54VlGDd0QjEIrBlKTV6GlbcS50YV5ItdHaU14wJz5F/KJK
   4WmT8GvNbUFWz6eypewlTVNJjBWut2k3U6d3mIv4oAWOw/FZopu8tZO9B
   GzjwK+h6qAe6Q9op9FpDuEO+az6jXwS2ZEX3hAu5NsyjI81DDhGutAzsA
   kD8ZotMEIKmvkaz9nPn0bII3uL4RTk/oV8zeaN5XVn+PXZ9T5OtOpClnQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="243841138"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="243841138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 18:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="701239795"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2022 18:47:43 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfXXK-0002e6-Mh;
	Sat, 16 Apr 2022 01:47:42 +0000
Date: Sat, 16 Apr 2022 09:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [bvanassche:scsi-gap-zone 8/8] ERROR: modpost: "__umoddi3"
 [drivers/scsi/scsi_debug.ko] undefined!
Message-ID: <202204160900.KLzxt1Xe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/bvanassche/linux scsi-gap-zone
head:   5531f96720bc0e475e669eb56b7094401c53f928
commit: 5531f96720bc0e475e669eb56b7094401c53f928 [8/8] scsi_debug: Add gap zone support
config: riscv-randconfig-r042-20220414 (https://download.01.org/0day-ci/archive/20220416/202204160900.KLzxt1Xe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/bvanassche/linux/commit/5531f96720bc0e475e669eb56b7094401c53f928
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-gap-zone
        git checkout 5531f96720bc0e475e669eb56b7094401c53f928
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/scsi/scsi_debug.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
