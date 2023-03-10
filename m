Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7CDA81;
	Fri, 10 Mar 2023 22:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678488872; x=1710024872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WpwMKAttkk3o2agE3JQ5gkH7ITyKlK/aclbP5bfraU=;
  b=nZGbVpFFCnUQZ9Pm52JE2YpQTPH8ZK9VRYY7yWP32HPAWCnW6om/WcLF
   WqJDf0cVkrsMM7abEErisSBQMYVupS9b3xy8yiNvUwzLkssG5qT/o5KJp
   iXZw9FkaUBYAIx0KZbtXB6QlPEb5MFAarp+FoK9uSqWdcHXudQKaPVNzI
   A5JiUwY94sZSEBkLWq/GkDx0Q0XPngKKXFuVHAA/sRkBLd9JT6jW0AAK3
   2Nd64DjTH4aZ/osX/K8Zj5tLe8n1KfOlv5iBesLOlIcb4xqNnGk4HZIem
   +Nv+1OHHANfMyBvn5a++Ya9+NTinfzh5yuClU5Kl2ZUO7bonxJL/1P/uu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335542875"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="335542875"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 14:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788205769"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="788205769"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 14:54:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pald8-000491-1g;
	Fri, 10 Mar 2023 22:54:30 +0000
Date: Sat, 11 Mar 2023 06:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-3 2/5] ld.lld: error: undefined symbol:
 __static_call_return0
Message-ID: <202303110626.hGiRSrOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-3
head:   432e4844ba65840af4a24f5e3f561aead867f6e7
commit: 999f0b7f8056dcb51476a6515a8601c9d6374aa2 [2/5] static_call: Make NULL static calls return 0
config: arm-buildonly-randconfig-r004-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110626.hGiRSrOk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=999f0b7f8056dcb51476a6515a8601c9d6374aa2
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-3
        git checkout 999f0b7f8056dcb51476a6515a8601c9d6374aa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110626.hGiRSrOk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __static_call_return0
   >>> referenced by core.c
   >>>               kernel/events/core.o:(__SCK__perf_snapshot_branch_stack) in archive vmlinux.a
   >>> referenced by trusted_core.c
   >>>               security/keys/trusted-keys/trusted_core.o:(__SCK__trusted_key_init) in archive vmlinux.a
   >>> referenced by trusted_core.c
   >>>               security/keys/trusted-keys/trusted_core.o:(__SCK__trusted_key_seal) in archive vmlinux.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
