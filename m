Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5C168
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642041031; x=1673577031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llyDvRTelZCAnt1K0f0oxqdRLViW4Y9cQ/+Ftuh5YAE=;
  b=lo7l4mV2AuNc+p2Uym02MT8xMeeaykeuxbDGZ98gq5cxwxcmEUmH6xfu
   hQnqbCBkvrwVMhP9ZbZMnZPpOe8KPt1WrQ8HuNiMgkf01Ix4BX+a3JD4V
   cf17ZYy0KdftRIQGWPUEGkLkZ/uIuK8hsjwFAvRWP4Pj8dIVQIW54XrpF
   OhuSXV/UPnRelsKG5CwLyBlHfApENnqRVakuNrNo5XCtFgBHDFVbzvOJg
   0zYWmeugEAw6bNn6hu1VnF1c5DDYG10H3czeSCpwdnqzyd4YbxCZdk05x
   kgH4HWD7owOB7v5O2Sc/yGyJgTxQt/2+qt/LYqsPn4fhHj6zRI1fnQoNA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243706430"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="243706430"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 18:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="473064002"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jan 2022 18:30:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7psi-0006jt-Gf; Thu, 13 Jan 2022 02:30:28 +0000
Date: Thu, 13 Jan 2022 10:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:sa1100 50/57] ERROR: modpost: "ipaq_micro_tx_msg"
 [arch/arm/mach-sa1100/h3xxx-sleeve.ko] undefined!
Message-ID: <202201131035.r0YR2iwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm sa1100
head:   7c5e0e177553f8a9ef3424e59fb3ef69c6b71689
commit: e0903a11cbed3fcc17d26af1d2a9d7f842e60ac7 [50/57] ARM: sa1100/h3xxx: sleeve support
config: arm-shannon_defconfig (https://download.01.org/0day-ci/archive/20220113/202201131035.r0YR2iwn-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm sa1100
        git checkout e0903a11cbed3fcc17d26af1d2a9d7f842e60ac7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ipaq_micro_tx_msg" [arch/arm/mach-sa1100/h3xxx-sleeve.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
