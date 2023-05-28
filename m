Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2432366;
	Sun, 28 May 2023 05:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685250116; x=1716786116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iwmfpl0l6gOY+ytl+TRnTq7ttKKn2a1ZMzNhYnKUssg=;
  b=egf6gJr8bA70U9dj3xNF5CH5+OVAZKxHEQV231KDPTl33kKNAe8/Gwli
   cri04G6+VK+3oXSQMub+YUGqdM4fDxVC4JnX3QYTVYe6t5BxrAYsxVn6y
   zPDnd+H1ei0kGtZQ+j8uT93aW9TVmBmobbsoqf67ggdJ1bl2OPQBJaPg8
   KPaOEW21V3ZSBDBflq3zVevQ3yX4vft7FGum9kTK37cWvBvHZQPELDOkQ
   fvu/HmELA37w21NdqL0U9anEj+P+vD/Mg+Q8Ir0DYJoujUvoW3YpeEp4c
   LG4QcA37nxK1QasKXykT/II45D/ZjuFMcQylvmF3/bpmK1NcRYgOW7vw1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353325467"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353325467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="849980892"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="849980892"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2023 22:01:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q38XS-000KRc-2K;
	Sun, 28 May 2023 05:01:54 +0000
Date: Sun, 28 May 2023 13:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 221/229] warning: associated function `new`
 is never used
Message-ID: <202305281259.8msG3HMA-lkp@intel.com>
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
commit: 06c5636b5ba2a411d36aeedc3339d4bafb7f5890 [221/229] rust: sync: Implement dynamic lockdep class creation
config: x86_64-randconfig-a011-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281259.8msG3HMA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/06c5636b5ba2a411d36aeedc3339d4bafb7f5890
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout 06c5636b5ba2a411d36aeedc3339d4bafb7f5890
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281259.8msG3HMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `new` is never used
   --> rust/kernel/sync/lockdep.rs:81:8
   |
   81 |     fn new(loc: &'static core::panic::Location<'static>) -> Self {
   |        ^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
