Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37D7C;
	Mon, 23 Jan 2023 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674476530; x=1706012530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLWT0oA22lJbZsciU17gqm210t0yQgW2iq4RMVP7j08=;
  b=aaksvFVAuVL5A9gc79XytMyBzbFWPJqXl5mCYT/oy7N5400CnzEvWuIl
   dD9sARuKihPvRNVKl3NUKZpJ0bWmopXamQVkokusUs/U2FfEswn9JXV2K
   j22dzp7jxaeXqceOH0C7wzNEgwbeBIfuKDX3flTuZSHu7zS9V0zZ9ACb0
   PojsaNbKdCrwRZBg6T6kfGirr+glQrRN66mj+yB/wykmcZglTuzk6kVJj
   nI3z751M7FLr3biO8AFVqz+tmqDWwJVW6WTq/TygbGfkKzFJJftj7hfNk
   uqXxYtIcSGMqHglVzYEQpvfZSY3jX+/IyGH/rPhoFF+1LYxI8NA7p7rhd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323718733"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="323718733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 04:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692117335"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692117335"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 04:22:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJvpt-0005dE-3B;
	Mon, 23 Jan 2023 12:22:05 +0000
Date: Mon, 23 Jan 2023 20:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: drivers/clk/clk-asm9260.c:258:17: warning: variable 'hw' set but not
 used
Message-ID: <202301232014.R6MwCVoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: f5290d8e4f0caa81a491448a27dd70e726095d07 clk: asm9260: use parent index to link the reference clock
date:   4 months ago
config: arm-randconfig-r046-20230122 (https://download.01.org/0day-ci/archive/20230123/202301232014.R6MwCVoq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5290d8e4f0caa81a491448a27dd70e726095d07
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f5290d8e4f0caa81a491448a27dd70e726095d07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-asm9260.c:258:17: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
           struct clk_hw *hw, *pll_hw;
                          ^
   1 warning generated.


vim +/hw +258 drivers/clk/clk-asm9260.c

   255	
   256	static void __init asm9260_acc_init(struct device_node *np)
   257	{
 > 258		struct clk_hw *hw, *pll_hw;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
