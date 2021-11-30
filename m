Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8768
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 16:17:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299642931"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="299642931"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 08:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="499830081"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2021 08:16:00 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1ms5nT-000DW2-Ji; Tue, 30 Nov 2021 16:15:59 +0000
Date: Wed, 1 Dec 2021 00:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Avramov <hakavlad@inbox.lv>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] mm/vmscan: add sysctl knobs for protecting the working
 set
Message-ID: <202112010030.e6d9vIAL-lkp@intel.com>
References: <20211130201652.2218636d@mail.inbox.lv>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130201652.2218636d@mail.inbox.lv>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alexey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on d58071a8a76d779eedab38033ae4c821c30295a5]

url:    https://github.com/0day-ci/linux/commits/Alexey-Avramov/mm-vmscan-add-sysctl-knobs-for-protecting-the-working-set/20211130-191905
base:   d58071a8a76d779eedab38033ae4c821c30295a5
config: hexagon-randconfig-r045-20211129 (https://download.01.org/0day-ci/archive/20211201/202112010030.e6d9vIAL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/54324d9a29319c86d63a3bb17d401c90f547f9c1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexey-Avramov/mm-vmscan-add-sysctl-knobs-for-protecting-the-working-set/20211130-191905
        git checkout 54324d9a29319c86d63a3bb17d401c90f547f9c1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/vmscan.c:183:54: error: use of undeclared identifier 'CONFIG_ANON_MIN_KBYTES'
   unsigned long sysctl_anon_min_kbytes __read_mostly = CONFIG_ANON_MIN_KBYTES;
                                                        ^
>> mm/vmscan.c:184:55: error: use of undeclared identifier 'CONFIG_CLEAN_LOW_KBYTES'
   unsigned long sysctl_clean_low_kbytes __read_mostly = CONFIG_CLEAN_LOW_KBYTES;
                                                         ^
>> mm/vmscan.c:185:55: error: use of undeclared identifier 'CONFIG_CLEAN_MIN_KBYTES'
   unsigned long sysctl_clean_min_kbytes __read_mostly = CONFIG_CLEAN_MIN_KBYTES;
                                                         ^
   3 errors generated.


vim +/CONFIG_ANON_MIN_KBYTES +183 mm/vmscan.c

   182	
 > 183	unsigned long sysctl_anon_min_kbytes __read_mostly = CONFIG_ANON_MIN_KBYTES;
 > 184	unsigned long sysctl_clean_low_kbytes __read_mostly = CONFIG_CLEAN_LOW_KBYTES;
 > 185	unsigned long sysctl_clean_min_kbytes __read_mostly = CONFIG_CLEAN_MIN_KBYTES;
   186	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
