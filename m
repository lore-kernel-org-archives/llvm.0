Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773747F
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653701613; x=1685237613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RROwHBf+WCrcn4WPD/lNxgRPUi+YpjuA0roqe73RFy0=;
  b=cuk5rwgtkdYzMk7RQM8rAoeSXwXUIMBBWDJJJZQCSnabgd1uyWQpC+mx
   Ku1Ebc22xSlXvuCwjQHydbiAb+seWJJUEGEe3Qqay3IAO6G/Gr2BeQh59
   DKSGTLT/qpmN2wIfMhOEG0VrdDevfhM4VNEW8WQn35kVZavDbGpEwMmCv
   G9t8fW2O57nC24gsRh1BKePdjPVlIKr5oEzPuWY65gez+/dn2g1McfH0K
   DTd7TtuelYSmPTON//dB9UCrYy6onAAH/p+01hT8oONO2r3/AjGYOxhtB
   pVjlRRiA+Auwn9HXDhzl/FcOzdHc6eYHnTig7mwPvKsLdx6zOwEJ4iKJD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="262229708"
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="262229708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 18:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="747324763"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2022 18:33:31 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nulKc-0005Ld-T9;
	Sat, 28 May 2022 01:33:30 +0000
Date: Sat, 28 May 2022 09:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v4 2/7] mm/demotion: Expose per node memory tier to
 sysfs
Message-ID: <202205280959.E5MRUz4H-lkp@intel.com>
References: <20220527122528.129445-3-aneesh.kumar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527122528.129445-3-aneesh.kumar@linux.ibm.com>

Hi "Aneesh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on v5.18]
[cannot apply to akpm-mm/mm-everything linus/master next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-demotion-Add-support-for-explicit-memory-tiers/20220527-212536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git b232b02bf3c205b13a26dcec08e53baddd8e59ed
config: riscv-randconfig-r001-20220526 (https://download.01.org/0day-ci/archive/20220528/202205280959.E5MRUz4H-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0d746ee496b4c0834aabaf0750bd74139d0ae681
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aneesh-Kumar-K-V/mm-demotion-Add-support-for-explicit-memory-tiers/20220527-212536
        git checkout 0d746ee496b4c0834aabaf0750bd74139d0ae681
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/migrate.c:2258:5: warning: no previous prototype for function '__node_set_memory_tier' [-Wmissing-prototypes]
   int __node_set_memory_tier(int node, int tier)
       ^
   mm/migrate.c:2258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __node_set_memory_tier(int node, int tier)
   ^
   static 
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/__node_set_memory_tier +2258 mm/migrate.c

  2257	
> 2258	int __node_set_memory_tier(int node, int tier)
  2259	{
  2260		int ret = 0;
  2261		/*
  2262		 * As register_memory_tier() for new tier can fail,
  2263		 * try it before modifying existing tier. register
  2264		 * tier makes tier visible in sysfs.
  2265		 */
  2266		if (!memory_tiers[tier]) {
  2267			ret = register_memory_tier(tier);
  2268			if (ret) {
  2269				goto out;
  2270			}
  2271		}
  2272	
  2273		node_set(node, memory_tiers[tier]->nodelist);
  2274	
  2275	out:
  2276		return ret;
  2277	}
  2278	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
