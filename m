Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F92C80
	for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640692622; x=1672228622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PT8JjOnZDC6PUEySNoOf/lmBXENrL+Itu2Y0zOdh/iE=;
  b=RMpyAdZd+w9yFKd4wBniTDz23PL/mdBQSwMxEwyY7IDw7r+toF8P8vj/
   ghqvYNJe3/22T/eGUQtpr9DLlRDty1BIpWgs6lcrCL8r3q+f2m3tDcK+A
   sYkE8gR2nZk6IAAQYAY7MI4APP9GvTkQFWHqIgdJZgulYMsuvR6Yj7SgD
   gy21aB2brWyFxAeEomHq/2t5K3pcZU/W8oqzeXnz4ZVsscZaFU9fYqzvq
   vPo5U+NfeS/GxffcPwT8Ov8XUA36Ge1dywTXoTCXHeChXtbgMjtpqOCE5
   XrwvMxwxIAk5Dp4EY1ISnFm/GK3V8tPL7YC6zdOxrthoqwfY+okNfYnoi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="228185965"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="228185965"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 03:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="554189310"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Dec 2021 03:57:01 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2B6C-0007Wz-SG; Tue, 28 Dec 2021 11:57:00 +0000
Date: Tue, 28 Dec 2021 19:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Wen Gu <guwen@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH net 2/2] net/smc: Resolve the race between SMC-R link
 access and clear
Message-ID: <202112281902.funtfcTC-lkp@intel.com>
References: <1640683240-62472-3-git-send-email-guwen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640683240-62472-3-git-send-email-guwen@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Wen,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Wen-Gu/net-smc-Fix-for-race-in-smc-link-group-termination/20211228-172133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 79b69a83705e621b258ac6d8ae6d3bfdb4b930aa
config: i386-randconfig-a012-20211228 (https://download.01.org/0day-ci/archive/20211228/202112281902.funtfcTC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/effcb39cf4a6a501f01235f3ba3420c8736ce18a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wen-Gu/net-smc-Fix-for-race-in-smc-link-group-termination/20211228-172133
        git checkout effcb39cf4a6a501f01235f3ba3420c8736ce18a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/smc/smc_core.c:1221:6: warning: no previous prototype for function '__smcr_link_clear' [-Wmissing-prototypes]
   void __smcr_link_clear(struct smc_link *lnk)
        ^
   net/smc/smc_core.c:1221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __smcr_link_clear(struct smc_link *lnk)
   ^
   static 
   1 warning generated.


vim +/__smcr_link_clear +1221 net/smc/smc_core.c

  1220	
> 1221	void __smcr_link_clear(struct smc_link *lnk)
  1222	{
  1223		smc_wr_free_link_mem(lnk);
  1224		smc_lgr_put(lnk->lgr);	/* lgr_hold in smcr_link_init() */
  1225		memset(lnk, 0, sizeof(struct smc_link));
  1226		lnk->state = SMC_LNK_UNUSED;
  1227	}
  1228	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
