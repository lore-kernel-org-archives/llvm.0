Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F71437E
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646733080; x=1678269080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlmCNHZmqi2xTGsMPLqUzT5KI1Uqz9BkkE5JlbyAb0Y=;
  b=F7+lOtadPAqpDnMruYLeKyJNlYI9g7xXYyWekuHSEv+hEQvhpXInkzee
   oogebw97/cZly+MaXPjX6djfk0s1MKHqgyUn+6/yFGTIYLFR/UZX0RjK9
   Sn4sikRihTOQRGExxR+d7wDbtsmaFlDHPG8n0WSnnVAuQETInCe500aP/
   XpYIG1mYJuX1WUJmWIhpa/szScHsLP+L5c+SJK9+sUmlNvMWqlyfoRLlB
   bX0mhvi6jeBrT+fSaWhsYk2YwAvNdfRAeUcTVQn/ycWu9JhPtr1HxdgTx
   xzW0BOXGa9R2p8Z1q+jfug3ORHKHHhBhQ0JWPr884DhpBGZa66MSRVwVl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="252215622"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="252215622"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 01:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="813817536"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2022 01:51:18 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRWUv-0001ED-RI; Tue, 08 Mar 2022 09:51:17 +0000
Date: Tue, 8 Mar 2022 17:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [amir73il:sb_iostats 5/12] include/linux/percpu_counter.h:122:15:
 error: assigning to 'struct percpu_counter' from incompatible type 's64'
 (aka 'long long')
Message-ID: <202203081704.MM74gs6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/amir73il/linux sb_iostats
head:   e0cfb03c7706e5f555c4c7568d5575b0c12ce1c0
commit: f459e7283ed5d3be5fe79aa7a49e45333dac08d0 [5/12] lib/percpu_counter: add helpers for arrays of counters
config: hexagon-randconfig-r041-20220307 (https://download.01.org/0day-ci/archive/20220308/202203081704.MM74gs6k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/f459e7283ed5d3be5fe79aa7a49e45333dac08d0
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il sb_iostats
        git checkout f459e7283ed5d3be5fe79aa7a49e45333dac08d0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/cred.h:17:
   In file included from include/linux/sched/user.h:7:
>> include/linux/percpu_counter.h:122:15: error: assigning to 'struct percpu_counter' from incompatible type 's64' (aka 'long long')
                   counters[i] = amount;
                               ^ ~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +122 include/linux/percpu_counter.h

   115	
   116	static inline int percpu_counters_init(struct percpu_counter counters[],
   117					       int num, s64 amount, gfp_t gfp)
   118	{
   119		int i;
   120	
   121		for (i = 0; i < num; i++)
 > 122			counters[i] = amount;
   123		return 0;
   124	}
   125	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
