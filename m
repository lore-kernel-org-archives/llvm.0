Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32017366;
	Sun, 28 May 2023 06:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685254620; x=1716790620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ck1F/EYbQ7XSH+rvtIluPIYwhJ8G6x/365FHCVQevsQ=;
  b=hVS7wrvFyRnEYdV4/3w44JLH7RnHtjzXJyaGrRZqWEv+vYsJJtxVLMmm
   CssOJPfqGUEyUqhYSHYhvVTKyH4ko+9AyDrC9Siy+3FVdm9w47Wiz+2MA
   dM/FZRcqTRmTpQ0O6zvtDL5UdcuATAp/mjhznl/fR6V6oehzjommYDGEI
   GlYxODwu5Ht59OWY3xWZ+tbXOkpA2JhvLsgNcr6llnCZoXnQPZPtJZjS7
   M7iQUMeZNFE2D8h0NKnnHpDHfsSYCfzARWqJ35Hv06SEuzbllTjTnK7l+
   i6lECC46Qn4G0q7na42jIYtowXUoWWMoJg2RK9jxSLcHLnhyLtqcVEirk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420247512"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420247512"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 23:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="699853190"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="699853190"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 May 2023 23:16:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q39i4-000KSs-0G;
	Sun, 28 May 2023 06:16:56 +0000
Date: Sun, 28 May 2023 14:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 228/229] warning: associated function
 `lock` is never used
Message-ID: <202305281418.SqRyhgHY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   d1b1887f265d507158eee935115bd5527c857074
commit: a2d99171005ce93995b3e5414002d888990c3758 [228/229] rust: sync: Add LockdepMap abstraction
config: x86_64-randconfig-a011-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281418.SqRyhgHY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a2d99171005ce93995b3e5414002d888990c3758
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout a2d99171005ce93995b3e5414002d888990c3758
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281418.SqRyhgHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `lock` is never used
   --> rust/kernel/sync/lockdep.rs:221:19
   |
   221 |     pub(crate) fn lock(&self) -> LockdepGuard<'_> {
   |                   ^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
