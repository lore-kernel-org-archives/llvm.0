Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF872F21
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644495343; x=1676031343;
  h=date:from:cc:subject:message-id:mime-version;
  bh=aaT//RpPPgxLvPAbRCP4vlDRT1gqtB5fslJkX2CE3YQ=;
  b=KlNIjiHOWl8i2x0TpAZAEdc5laaId9AEIHRYbQgpx19prvt7ubhUQgFb
   9RQas2jHc3WThWyXR7JFDnkWY8Rvjxkbo/2JnkcZzVXJRMHSLL0y2/UYi
   FFPwENJYQ+XaeaxI+PMefeLm8rQYi3RFAKksM/A4VqSC9NOU2XcomXnqW
   NpYEIH6U29y2NNtznfHBK1OoTMEreTm1Ftqk2Qw2HEpYBDaPMDY2LewIZ
   xg6/8YbqSsOPDbvJPJc8iJXbzy04yprYZJAvZydTSHxUjqrF+c5M6Vv/i
   G/JDfMBxCUDpeIT3l44SM6OuQ6aG2An/4CGVKmaoCqRhnwOWRspH5b9fK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249684252"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="249684252"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 04:15:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="629668767"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2022 04:15:41 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI8MP-0003B1-18; Thu, 10 Feb 2022 12:15:41 +0000
Date: Thu, 10 Feb 2022 20:14:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: init/built-in.a(do_mounts.o):(function name_to_dev_t:
 .text+0xb0): relocation R_RISCV_HI20 out of range: 527708 is not in
 [-524288, 524287]; references .LCPI3_0
Message-ID: <202202102053.fuJOQGtr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: f350ee95498a3fa65c37ed597d9c051c6b2b6974 perf evlist: No need to setup affinities when enabling events for pid targets
date:   3 weeks ago
config: riscv-randconfig-r031-20220210 (https://download.01.org/0day-ci/archive/20220210/202202102053.fuJOQGtr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f350ee95498a3fa65c37ed597d9c051c6b2b6974
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f350ee95498a3fa65c37ed597d9c051c6b2b6974
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(do_mounts.o):(function name_to_dev_t: .text+0xb0): relocation R_RISCV_HI20 out of range: 527708 is not in [-524288, 524287]; references .LCPI3_0
   >>> referenced by do_mounts.c
   >>> defined in init/built-in.a(do_mounts.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
