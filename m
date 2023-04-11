Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B78C0D;
	Tue, 11 Apr 2023 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681223295; x=1712759295;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ik4bwwhl/UG34RdorE82MUjuK2QnyqAVTc9iuFr8RAQ=;
  b=dHJd4sA7kaILj6eGv/DBzego3GIUAfzVRPNmkrHC23vWIYrLb85P2lXc
   N0HU3ZWHvcmOKplgkqK3WEY/Z58hTKugmJaLzV0tV5ViPn8KCBMnElEBa
   nY8bMSTii2Nxd2Ovkn6lQHgZ1zwdonlcHKQNEm5rz3PdevyL7fOj1w+KG
   C8Smfcgq6/EO/vjupf5XXW2aTVnxCsBcLHjpJlLXM4z3BA20RU3wgvV0m
   MQGmjd45wAPT5KA+FvZS4BilEs6rDCxkkKu/mR2WxZxr4vJxeAU9hoPwN
   Hm6mYARYvjgMsNnxgigaJIt2nCLSUjqRKnguHaLriHiBr0XdRaYgzh/Bd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345413720"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="345413720"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691168214"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="691168214"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Apr 2023 07:28:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmEyi-000WO9-36;
	Tue, 11 Apr 2023 14:28:12 +0000
Date: Tue, 11 Apr 2023 22:27:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 1909/9999] clang: error: assembler command
 failed with exit code 1 (use -v to see invocation)
Message-ID: <202304112254.0pP6ePg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Sasha Levin <sashal@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: 8f7806174fdbc90688a4159e07ec348f0a171572 [1909/9999] MIPS: Loongson64: Use _CACHE_UNCACHED instead of _CACHE_UNCACHED_ACCELERATED
config: mips-randconfig-r026-20230409 (https://download.01.org/0day-ci/archive/20230411/202304112254.0pP6ePg5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8f7806174fdbc90688a4159e07ec348f0a171572
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 8f7806174fdbc90688a4159e07ec348f0a171572
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112254.0pP6ePg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/cpu-probe-bcec4d.s: Assembler messages:
   /tmp/cpu-probe-bcec4d.s:1689: Error: Unable to parse register name $fp
>> clang: error: assembler command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
