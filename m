Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D5182D4;
	Wed, 31 May 2023 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685559231; x=1717095231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tr3JTaVft0pHbebdvZ07bljzG0RHTMgjhWetGlCC7rw=;
  b=l+UoboKpyQbrznKH1WEXIKBbY/kGPSNnKoz28C2+C1S67SGBg/B7+yW6
   OPXv27H9zcgJyCCZPV6XX6SrebUIjw6zMBNt70SehEH5k/k2rKFCNewo2
   hkCtWYGCC1dSJxKfmi9/cN6GTO5omgxXVnDs2/2yavqjURBn0K+LMtxx6
   U4NSjVIDefEycV+4z9oL7cNrsCaVaLtJykQ6N7Gh4ukdSGtzsUX22cXwF
   DjS5x+oNaYjPGGSl5cER06llxl5ekbEu5cUWSTYGhHdUhjPCsqQSZxuVc
   0nkIXpPr8boh4U/SeVWAX3cDYnMUZfuXsLEdHcwbl1n8vfNHDsz2+5/jS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339923421"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="339923421"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 11:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684499364"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="684499364"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 May 2023 11:53:36 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Qwx-0001Xz-2R;
	Wed, 31 May 2023 18:53:35 +0000
Date: Thu, 1 Jun 2023 02:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6093/6126] include/linux/usb/typec_mux.h:77:1:
 error: expected identifier or '('
Message-ID: <202306010200.Q4gQCWVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4cee89031c80066ec461bb77b5e13a4f37d5fd2
commit: 8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499 [6093/6126] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
config: arm64-randconfig-r022-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010200.Q4gQCWVc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010200.Q4gQCWVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/qualcomm/phy-qcom-qmp-combo.c:23:
>> include/linux/usb/typec_mux.h:77:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +77 include/linux/usb/typec_mux.h

a37599ebfb656c Prashant Malani 2022-06-15  75  
3524fe31538c1a Heikki Krogerus 2023-05-26  76  static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode);
a37599ebfb656c Prashant Malani 2022-06-15 @77  {
a37599ebfb656c Prashant Malani 2022-06-15  78  	return NULL;
a37599ebfb656c Prashant Malani 2022-06-15  79  }
a37599ebfb656c Prashant Malani 2022-06-15  80  

:::::: The code at line 77 was first introduced by commit
:::::: a37599ebfb656c2af4ca119de556eba29b6926d6 usb: typec: mux: Add CONFIG guards for functions

:::::: TO: Prashant Malani <pmalani@chromium.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
