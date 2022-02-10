Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29572C80
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644516844; x=1676052844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjWNlMS7wsBHr1pOlccUMjg3bQrDdW47IbfyLA88hpY=;
  b=Y4my8YzYYsmvYnBgdLfKqSAA8HZK8rb1Uu6fxaz0CbV8YT4N4nwhdsUJ
   sR6TI2ykDhYXZcqgPEWR7wzeJVN+EFz1dpa2e0kOVV/SEEK/B9aDiszG9
   jwk8wxQMUR1vWXHHVSnOjbqUnSQEX/mcUIaRWtgA8TG1Nq4yv84lwp7xs
   qIMX8xSMTaFgMachVkPg5OOZrsVTQV39zTRFoARiePoz8wxBDBpQLNPgb
   HGezNPhhnyNSprKse8RNby4XQmmnPp711t/lZbj2k4vI7mJNgwjePHTVK
   D/4azVNsPt5TjJQRcUaqoUCTbIJ/+85GkUAqW/M99i42mfsb4XFQ78VNa
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249765060"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="249765060"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 10:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="586040968"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2022 10:14:02 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIDxC-0003Zn-7o; Thu, 10 Feb 2022 18:14:02 +0000
Date: Fri, 11 Feb 2022 02:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [csky-linux:riscv_compat_v6_svpbmt-v6 10/35]
 arch/riscv/kernel/cpufeature.c:185:6: warning: variable 'cpu_apply_feature'
 set but not used
Message-ID: <202202110204.3m29JCRv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/c-sky/csky-linux riscv_compat_v6_svpbmt-v6
head:   54acb36c958fc990cc59889f79c8ddca7386c295
commit: 9a8cf89570e893738c501551591b03bd868c825c [10/35] riscv: add cpufeature handling via alternatives
config: riscv-randconfig-r042-20220208 (https://download.01.org/0day-ci/archive/20220211/202202110204.3m29JCRv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/c-sky/csky-linux/commit/9a8cf89570e893738c501551591b03bd868c825c
        git remote add csky-linux https://github.com/c-sky/csky-linux
        git fetch --no-tags csky-linux riscv_compat_v6_svpbmt-v6
        git checkout 9a8cf89570e893738c501551591b03bd868c825c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ arch/riscv/mm/ drivers/base/firmware_loader/ drivers/pci/ drivers/target/ fs/erofs/ fs/pstore/ kernel/ mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:185:6: warning: variable 'cpu_apply_feature' set but not used [-Wunused-but-set-variable]
           u32 cpu_apply_feature = 0;
               ^
   1 warning generated.


vim +/cpu_apply_feature +185 arch/riscv/kernel/cpufeature.c

   180	
   181	void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
   182					 unsigned int stage)
   183	{
   184		u32 cpu_req_feature = cpufeature_probe(stage);
 > 185		u32 cpu_apply_feature = 0;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
