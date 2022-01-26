Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EB168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643169934; x=1674705934;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hp3zvlqmHKWiii4bMBl+TbJ8iaWcbKO1SBAesZrywV0=;
  b=kGkJ+kZskNkCdqpv3mPVzm8XZPXQZUYeW1p3XKiJT2tS1Cxo2mmobefG
   W7Lvq5a5gdNg28CAbJedffLtx5vXQralvApNtzVzlt7m+JbJRAguCLaOQ
   Rk19CqiHEc0I0RJng9XlrdYcdIaYjbrJUFjQw76cJxPSRtYpzaXzffOhc
   WpO0jngPdp4MlyCNo9pgLO6okv5oRIlA3dtf+af1wZ4Pmpzt2uLv/GrHg
   tdosGsu9RkhwRjeK4IiN3sGPGSDA8i9COUvx6aGGLHyZfu1RblkzBzZFo
   0N0YMcrbYQBQ+A6Rfp4N8feJXL898ViFi2bMfswYKEW9EZER6vh0qUSrh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="332831045"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
   d="scan'208";a="332831045"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 20:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
   d="scan'208";a="477361975"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 20:05:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCZYq-000Kll-0m; Wed, 26 Jan 2022 04:05:32 +0000
Date: Wed, 26 Jan 2022 12:05:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jens-wiklander-tee:rpc_arg-v1 4/4] clang-14: error: unknown
 argument: '-femit-struct-debug-detailed=any'
Message-ID: <202201261200.3WLYkr7V-lkp@intel.com>
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
TO: Jens Wiklander <jens.wiklander@linaro.org>

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee rpc_arg-v1
head:   1ed704dfc96e16f6d90406d5e0bfff30ff5d0fbc
commit: 1ed704dfc96e16f6d90406d5e0bfff30ff5d0fbc [4/4] optee: cache argument shared memory structs
config: hexagon-randconfig-r045-20220124 (https://download.01.org/0day-ci/archive/20220126/202201261200.3WLYkr7V-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add jens-wiklander-tee http://git.linaro.org/people/jens.wiklander/linux-tee
        git fetch --no-tags jens-wiklander-tee rpc_arg-v1
        git checkout 1ed704dfc96e16f6d90406d5e0bfff30ff5d0fbc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> clang-14: error: unknown argument: '-femit-struct-debug-detailed=any'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
