Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC3168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639682602; x=1671218602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9UIs6DXdw/2p0SD8sm0w2yn59ctufkPEAeuZZ/z2LI=;
  b=SGG5iENDG8PgsH4AxDdPCtGHvNjJ5OJTpR3SDUZ7mHT/yXTm59FzmxjU
   dC1aRic3+1c6zwA/bi6NITFl0DGW7Z/y/xORsyG1dTH1bxzeEstLPVGYy
   8uF7elVlw5FY6ZY42FskYKl13H16AYL+UMvP57m3nc+4Vsyx3+1QKkZXC
   Y0yi1FMGY3jEaAVgEpNl/KiexkdTi21VuF7om4lC9OQTqCb+I3qHnSmqx
   XJmc3nO0ZYcP4pnOGb89srRjv1zlI0BeylVd9W2pfJhd7bBC3OfYfbUEs
   kaOLgk4ytGrU2l6vJ79GOZu3dPUz9RNGdgKDIa6kgreJKEIyt6TMoBrW+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="263744932"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="263744932"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 11:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="506429023"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 11:23:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxwLY-0003iS-4O; Thu, 16 Dec 2021 19:23:20 +0000
Date: Fri, 17 Dec 2021 03:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tero Kristo <tero.kristo@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [t-kristo-pm:usi-5.16-v5-bpf 16/19]
 ./usr/include/linux/bpf_hid.h:13:10: fatal error: 'linux/workqueue.h' file
 not found
Message-ID: <202112170310.bckZdCKh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/t-kristo/linux-pm usi-5.16-v5-bpf
head:   82a2c7cbd9682f2664179cd7e01647e46272c316
commit: 8ffc42bfd37f05ffa2c284b71a6c3bb5021fac8f [16/19] HID: bpf: add support for new workqueue triggering BPF call
config: x86_64-randconfig-a014-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170310.bckZdCKh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/t-kristo/linux-pm/commit/8ffc42bfd37f05ffa2c284b71a6c3bb5021fac8f
        git remote add t-kristo-pm https://github.com/t-kristo/linux-pm
        git fetch --no-tags t-kristo-pm usi-5.16-v5-bpf
        git checkout 8ffc42bfd37f05ffa2c284b71a6c3bb5021fac8f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/bpf_hid.h:13:10: fatal error: 'linux/workqueue.h' file not found
   #include <linux/workqueue.h>
            ^~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
