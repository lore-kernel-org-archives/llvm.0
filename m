Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82C7C;
	Wed,  8 Mar 2023 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678268504; x=1709804504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IblLpwxZIoJkhkBRlOiMaraXUkJJvz5IuZTuP/5Ke/M=;
  b=ayBTTHeiXkdNUDoqaVpYtmCbHVrSJAUoLdAfPl8BFbk94A4UjCqGhZe4
   S2ysEkx4pMfhaT8eDi+WWPEu3r5Q7ncQxmFw4u/YxAng565gRS9ONWlGr
   QjTAKQk+MQ3WhIvzQ/zhRwZdrDgG/1I1/9RNcbgP/Zefd+krrCiQqEyEG
   FdM1LJ2N7ztajQVYtMh8jH2M40mYZeL34dK1mVAMIZ9oJkc1kCsMERj69
   JIBMWSrjT8Shma0tNpta2TOVw3at7t9FmndhSZ42D1F5cH/ZP1R0sUk6f
   2aZX1Qh5c6SH6/xB6YslRuAoAzctGS/gHLyxomiXcFKCvYZLpFc2viez+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324423508"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="324423508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 01:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="851017754"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="851017754"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 01:41:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZqIn-00021T-0Z;
	Wed, 08 Mar 2023 09:41:41 +0000
Date: Wed, 8 Mar 2023 17:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 3083/9999] block/blk-iolatency.c:303:7:
 warning: variable 'changed' set but not used
Message-ID: <202303081732.fAIJixwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   5504146b2053f842426834d275002974109f39a6
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [3083/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-c004-20230305 (https://download.01.org/0day-ci/archive/20230308/202303081732.fAIJixwH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=69c122751164c3c343eea205fd5c3e1d5132f967
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 69c122751164c3c343eea205fd5c3e1d5132f967
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081732.fAIJixwH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-iolatency.c:303:7: warning: variable 'changed' set but not used [-Wunused-but-set-variable]
           bool changed = false;
                ^
>> block/blk-iolatency.c:758:24: warning: variable 'blkiolat' set but not used [-Wunused-but-set-variable]
           struct blk_iolatency *blkiolat;
                                 ^
   2 warnings generated.


vim +/changed +303 block/blk-iolatency.c

d70675121546c3 Josef Bacik 2018-07-03  292  
d70675121546c3 Josef Bacik 2018-07-03  293  /*
d70675121546c3 Josef Bacik 2018-07-03  294   * Change the queue depth of the iolatency_grp.  We add/subtract 1/16th of the
d70675121546c3 Josef Bacik 2018-07-03  295   * queue depth at a time so we don't get wild swings and hopefully dial in to
d70675121546c3 Josef Bacik 2018-07-03  296   * fairer distribution of the overall queue depth.
d70675121546c3 Josef Bacik 2018-07-03  297   */
d70675121546c3 Josef Bacik 2018-07-03  298  static void scale_change(struct iolatency_grp *iolat, bool up)
d70675121546c3 Josef Bacik 2018-07-03  299  {
d70675121546c3 Josef Bacik 2018-07-03  300  	unsigned long qd = blk_queue_depth(iolat->blkiolat->rqos.q);
d70675121546c3 Josef Bacik 2018-07-03  301  	unsigned long scale = scale_amount(qd, up);
d70675121546c3 Josef Bacik 2018-07-03  302  	unsigned long old = iolat->rq_depth.max_depth;
d70675121546c3 Josef Bacik 2018-07-03 @303  	bool changed = false;
d70675121546c3 Josef Bacik 2018-07-03  304  
d70675121546c3 Josef Bacik 2018-07-03  305  	if (old > qd)
d70675121546c3 Josef Bacik 2018-07-03  306  		old = qd;
d70675121546c3 Josef Bacik 2018-07-03  307  
d70675121546c3 Josef Bacik 2018-07-03  308  	if (up) {
d70675121546c3 Josef Bacik 2018-07-03  309  		if (old == 1 && blkcg_unuse_delay(lat_to_blkg(iolat)))
d70675121546c3 Josef Bacik 2018-07-03  310  			return;
d70675121546c3 Josef Bacik 2018-07-03  311  
d70675121546c3 Josef Bacik 2018-07-03  312  		if (old < qd) {
d70675121546c3 Josef Bacik 2018-07-03  313  			changed = true;
d70675121546c3 Josef Bacik 2018-07-03  314  			old += scale;
d70675121546c3 Josef Bacik 2018-07-03  315  			old = min(old, qd);
d70675121546c3 Josef Bacik 2018-07-03  316  			iolat->rq_depth.max_depth = old;
d70675121546c3 Josef Bacik 2018-07-03  317  			wake_up_all(&iolat->rq_wait.wait);
d70675121546c3 Josef Bacik 2018-07-03  318  		}
d70675121546c3 Josef Bacik 2018-07-03  319  	} else if (old > 1) {
d70675121546c3 Josef Bacik 2018-07-03  320  		old >>= 1;
d70675121546c3 Josef Bacik 2018-07-03  321  		changed = true;
d70675121546c3 Josef Bacik 2018-07-03  322  		iolat->rq_depth.max_depth = max(old, 1UL);
d70675121546c3 Josef Bacik 2018-07-03  323  	}
d70675121546c3 Josef Bacik 2018-07-03  324  }
d70675121546c3 Josef Bacik 2018-07-03  325  

:::::: The code at line 303 was first introduced by commit
:::::: d70675121546c35feaceebf7ed9caed8716640f3 block: introduce blk-iolatency io controller

:::::: TO: Josef Bacik <jbacik@fb.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
