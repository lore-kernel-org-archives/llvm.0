Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25867C;
	Mon, 24 Apr 2023 02:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682302700; x=1713838700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow2h3RLqFO9ghWOJ0Xc/Qwp95w/jsjMWBdQz34V0Vpc=;
  b=fDGuLCleEhKNZNAc+EquWWHAtTTlecoyY6+lf5nH2CVHW35QN+YqO/xI
   rosPP3ZFwl43V2RKHUEFPtBtg5BKd7rSJau9Rqv3YgHl7g+rS/8QIAhKN
   Mwy+Gl5ns8dUTym6PdTON8zoIxk5/Xn1Vx/WXzUgCQZvPG7Eq1LgR7B0A
   JLKee5z8TkuzJSDxZBMmTZqk6czjNc9KIyHa+hNHuSIHH+bE1euG1DzN3
   QNo5KetLXJtBgMBvs+Iwd9SYBruzi+vFr9eW6/NNNAryT4mMNiWyij39Z
   AUdF+4dNFO5z6AeT4eE4lIcSw/8DrtpHFNMlJj/2Lj72me72yl3MeQF5Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348251604"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="348251604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 19:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="939130739"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="939130739"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2023 19:18:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqllq-000iEW-11;
	Mon, 24 Apr 2023 02:17:38 +0000
Date: Mon, 24 Apr 2023 10:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: ld.lld: error: unknown argument '--ppc476-workaround'
Message-ID: <202304241058.bbuF6Fn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Randy,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   457391b0380335d5e9a5babdec90ac53928b23b4
commit: 5ba3747dbc9ade2d22a8f5bff3c928cb41d35030 regulator: bd71815: add select to fix build
date:   1 year, 11 months ago
config: powerpc-buildonly-randconfig-r001-20230423 (https://download.01.org/0day-ci/archive/20230424/202304241058.bbuF6Fn4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5ba3747dbc9ade2d22a8f5bff3c928cb41d35030
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5ba3747dbc9ade2d22a8f5bff3c928cb41d35030
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241058.bbuF6Fn4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown argument '--ppc476-workaround'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
