Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43C2F23
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643897236; x=1675433236;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HR7SB5DGxqkwWiH85+aMpuHVymu6Q5nUwZZRjs/KHqk=;
  b=kA3PD8UKpkmMmYzKNx7VRh3ZXkFowD8jD6x4bO0VXcxf/WqyVKl8gYEL
   SPKhoY5Axkh5QAtcukhYZ0PD7Opa+prXbTreVeWBC6B1wfr1p6ueONmnv
   ChmLLH3Kp/9pL47+GwxRPbGmLJ7p8z0pmqx09XKZMmAhd25x6VZmfLV+u
   16vFLi5seJSV64RuOucy3HHr2FI5mqPXHIbsg3x4cV9XvG9i4Xglj2kk6
   xGznpsOLAOhAqhufzofdLrU2G9/WOoPSNT4lJThX2vLybqqPb3clO/8mu
   EyJ00Uf0kr5IyoTFT1OF59FR9eOGj3yzPx99RlMv27eM6wTqya3KKQLb1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="272644742"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="272644742"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 06:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="676778849"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2022 06:07:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFclW-000WCr-VM; Thu, 03 Feb 2022 14:07:14 +0000
Date: Thu, 3 Feb 2022 22:06:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 2839/3941] ld.lld: error:
 init/built-in.a(main.o):(function run_init_process: .text+0x36): relocation
 R_RISCV_HI20 out of range: 529438 is not in [-524288, 524287]; references
 argv_init
Message-ID: <202202031843.jGKD9TfE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dan Carpenter <error27@gmail.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2d3d8c7643a56bfe2e808f97d5a4360d49f3b45b
commit: 90a3d22ff02b196d5884e111f39271a1d4ee8e3e [2839/3941] drm/i915/overlay: Prevent divide by zero bugs in scaling
config: riscv-buildonly-randconfig-r001-20220131 (https://download.01.org/0day-ci/archive/20220203/202202031843.jGKD9TfE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=90a3d22ff02b196d5884e111f39271a1d4ee8e3e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 90a3d22ff02b196d5884e111f39271a1d4ee8e3e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 2d3d8c7643a56bfe2e808f97d5a4360d49f3b45b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function run_init_process: .text+0x36): relocation R_RISCV_HI20 out of range: 529438 is not in [-524288, 524287]; references argv_init
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
