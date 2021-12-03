Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FF32C9D
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 11:36:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="234468458"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="234468458"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 03:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="678068707"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Dec 2021 03:36:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mt6rH-000HWc-QM; Fri, 03 Dec 2021 11:36:07 +0000
Date: Fri, 3 Dec 2021 19:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2396/5128] ERROR: modpost:
 "relay_file_operations" [drivers/net/wwan/iosm/iosm.ko] undefined!
Message-ID: <202112031954.jDI602Hn-lkp@intel.com>
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
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: 00ef32565b9bd03c63ed944bc27878fbbc1c4e0a [2396/5128] net: wwan: iosm: device trace collection using relayfs
config: i386-randconfig-r032-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031954.jDI602Hn-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=00ef32565b9bd03c63ed944bc27878fbbc1c4e0a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 00ef32565b9bd03c63ed944bc27878fbbc1c4e0a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "relay_file_operations" [drivers/net/wwan/iosm/iosm.ko] undefined!
>> ERROR: modpost: "relay_buf_full" [drivers/net/wwan/iosm/iosm.ko] undefined!
>> ERROR: modpost: "relay_flush" [drivers/net/wwan/iosm/iosm.ko] undefined!
>> ERROR: modpost: "relay_close" [drivers/net/wwan/iosm/iosm.ko] undefined!
>> ERROR: modpost: "relay_open" [drivers/net/wwan/iosm/iosm.ko] undefined!
>> ERROR: modpost: "relay_switch_subbuf" [drivers/net/wwan/iosm/iosm.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
