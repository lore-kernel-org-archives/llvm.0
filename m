Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8868
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639556576; x=1671092576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oR+0SggQqeogjDaEzcrbVs73HRYE9buRrrUqMyQJwDU=;
  b=K/M9ftdGII9qOg3E5H58YidkoL4GEj/1uOM20rufNsLPW6gekdLXuvcQ
   WzwaNbbtwdpAGWgje5ZkkcHW9GDK/PTEzLIiqIf/KZAwLHoMKxI8uHI2+
   khYkj9Vrrvl5HCahG/k9sDhWYGxMu11Qf6two6+g7y9fe+rWJfg74Fzf6
   EDT6oaqMdZTFdGqoIyTH38UcjVegbVal/kyg5qabLgOQQf4ZHDhXzAIeH
   fNfwdDMP2naFgM9wX9P2gKVgrukI6uDvpNQgBFWEhzJQxqfn9DogDWYrn
   s5Mizos09CW9ccFij/OilmLKqZNUqSJr5xB0jFPqXiDP2LW23CoQrqSr7
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="263326067"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="263326067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 00:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614625549"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2021 00:22:53 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxPYq-0001Tz-Sh; Wed, 15 Dec 2021 08:22:52 +0000
Date: Wed, 15 Dec 2021 16:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>
Subject: drivers/gpu/drm/rockchip/cdn-dp-core.c:54:34: warning: unused
 variable 'cdn_dp_dt_ids'
Message-ID: <202112151637.BKx0hSTS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Robin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: b4ceb4a5359ed1c9ba4a20acf3a70d4bbead3248 iommu: Tidy up Kconfig for SoC IOMMUs
date:   1 year, 5 months ago
config: x86_64-buildonly-randconfig-r004-20211215 (https://download.01.org/0day-ci/archive/20211215/202112151637.BKx0hSTS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4ceb4a5359ed1c9ba4a20acf3a70d4bbead3248
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4ceb4a5359ed1c9ba4a20acf3a70d4bbead3248
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/rockchip/ kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/cdn-dp-core.c:54:34: warning: unused variable 'cdn_dp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id cdn_dp_dt_ids[] = {
                                    ^
   1 warning generated.


vim +/cdn_dp_dt_ids +54 drivers/gpu/drm/rockchip/cdn-dp-core.c

1a0f7ed3abe29c Chris Zhong 2017-02-05  53  
1a0f7ed3abe29c Chris Zhong 2017-02-05 @54  static const struct of_device_id cdn_dp_dt_ids[] = {
1a0f7ed3abe29c Chris Zhong 2017-02-05  55  	{ .compatible = "rockchip,rk3399-cdn-dp",
1a0f7ed3abe29c Chris Zhong 2017-02-05  56  		.data = (void *)&rk3399_cdn_dp },
1a0f7ed3abe29c Chris Zhong 2017-02-05  57  	{}
1a0f7ed3abe29c Chris Zhong 2017-02-05  58  };
1a0f7ed3abe29c Chris Zhong 2017-02-05  59  

:::::: The code at line 54 was first introduced by commit
:::::: 1a0f7ed3abe29cff8e652c69a8ad89aec2c40f00 drm/rockchip: cdn-dp: add cdn DP support for rk3399

:::::: TO: Chris Zhong <zyw@rock-chips.com>
:::::: CC: Mark Yao <mark.yao@rock-chips.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
