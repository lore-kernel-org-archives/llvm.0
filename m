Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9728FA
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653836088; x=1685372088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g42OSt55RshNZX376pV48g4FOU4+F/GIqEJhU5EeFCg=;
  b=cYY+WjILAPi4AUGZdW8L0u35PLnPEAA805f4zYR22oK0QBYeV818gZt+
   AkQS6EBJ9+8eiKUFrQHqZgXuxiMRWUm5RV/Rt1ShYSthpOwr5I5HRU/C7
   4IQk/ORRBMRyxILUCvqgzoisPVwRbuApVQN8X5o6XyJcV8rpwGENhsVw1
   McoXyhsoa8ZcWBPUACh765eaMF9YC7dQroq4y9xzBAr1dFPfdA0jgKAY8
   KD1d5UOrcgPRlRd7C4N94jzM82ds/q9M6x6sIWcyWyeyJvO9BxCwNuil6
   RJmOHI39B1LGcjAeCARUyh200cHNDaZzepr7zyoyhg62lybIeKtRlW1zI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="337848743"
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; 
   d="scan'208";a="337848743"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 07:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; 
   d="scan'208";a="632300781"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2022 07:54:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvKJZ-00015C-6f;
	Sun, 29 May 2022 14:54:45 +0000
Date: Sun, 29 May 2022 22:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Lee <ryan.lee.analog@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: ld.lld: error: assignment to symbol init_pg_end does not converge
Message-ID: <202205292206.HGk4JbY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   664a393a2663a0f62fc1b18157ccae33dcdbb8c8
commit: b58581136770569d2ee4300b10c7c0d76bb86250 ASoC: max98396: add amplifier driver
date:   5 weeks ago
config: arm64-randconfig-r011-20220529 (https://download.01.org/0day-ci/archive/20220529/202205292206.HGk4JbY2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b58581136770569d2ee4300b10c7c0d76bb86250
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b58581136770569d2ee4300b10c7c0d76bb86250
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol init_pg_end does not converge

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
