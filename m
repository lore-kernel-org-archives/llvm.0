Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51A63BD;
	Wed,  7 Jun 2023 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686122209; x=1717658209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQjxbfopK3aalJ8UOxlNnubfZpKYlMpMxa2Ide8xmQU=;
  b=KswyedIasptcWwHQfHaGwMkd4TkzqGCITBlJDuD05x+dYXOsqAaEYfGS
   LhraYAyhCfocamuytnIg80H5hHFhXYXCfQUc5+8r9xSu6rFlcJBgV4eof
   D0mVgYDAI+lf4NNonpR0KEryCgsqY2bkW6w54Z7oZoVGu0frRgz7+q6fG
   7BAsAOC1akLibAZOMKFGSmMr6LCZGgIocP69Kx8KEd8MuYqrP0L9SeGOd
   uMZH7N9g9H2DKuCBhuPGUVEpl98UCi1vmUFVYxtoScMdSDn8pBfCZRU1Z
   5gWj3ZvVZmhSAMi6QdbJ+9+hHYLfJiiTbHFAuej7ZWZnKbUvNrzA0XA7O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360233852"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="360233852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 00:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833551809"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="833551809"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Jun 2023 00:16:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6nPS-0006Ih-2K;
	Wed, 07 Jun 2023 07:16:46 +0000
Date: Wed, 7 Jun 2023 15:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Wedson Almeida Filho <wedsonaf@google.com>
Subject: [asahilinux:bits/210-gpu 62/225] error: aborting due to previous
 error
Message-ID: <202306071557.FVQshB33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   088cf4cc64f4e0eec3c9b99e36c9f5e9a86b1173
commit: 283f5cdb2f5d97f021b2d38baccd1c3f1b6362fa [62/225] rust: Add `name` argument to Module::init()
config: x86_64-randconfig-x061-20230606 (https://download.01.org/0day-ci/archive/20230607/202306071557.FVQshB33-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/283f5cdb2f5d97f021b2d38baccd1c3f1b6362fa
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 283f5cdb2f5d97f021b2d38baccd1c3f1b6362fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071557.FVQshB33-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: aborting due to previous error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
