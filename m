Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213662C80
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644516261; x=1676052261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBMcBJC30i8kQ711MDeOXRz44FrwKyTzdCBbYbqpJcg=;
  b=AAaN1dDEew7ozyytdnPkjOaTS+Srr9alW0rqZVeFrzhAcQCPplg4YDqN
   tW5GVdn5wbnDjwr8t9u5OfpQCMzGJim8pknCo7PSeVqRU43q/lfOfY4zq
   L42hTqx6zhWucCBf29pTg62Sc8rvWfiWuorh0QpbIeDFsLb70SBP71L+8
   xF1yqc2vgTyvq29u6rj80WpGm6LFQ2pAcpjRATddtuPq/2+3iRuWT0iFm
   JmnYNnmtmD6pM80WmBAkeT3f1dzyVB8j8GoGpOb3YxSbG7+bYmULuMr0N
   aaQIF6w4KmrthkVQBCuM/Ynlz5PT3BNhRVJ2C8X27garpy6/puunz32F4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="312838420"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="312838420"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 10:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="586037739"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2022 10:04:02 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIDnV-0003Yl-Or; Thu, 10 Feb 2022 18:04:01 +0000
Date: Fri, 11 Feb 2022 02:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [csky-linux:riscv_compat_v6_svpbmt-v6 10/35]
 arch/riscv/kernel/cpufeature.c:185:6: warning: variable 'cpu_apply_feature'
 set but not used
Message-ID: <202202110127.FocCEukg-lkp@intel.com>
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
config: riscv-randconfig-c006-20220209 (https://download.01.org/0day-ci/archive/20220211/202202110127.FocCEukg-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

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
