Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D320F5;
	Mon,  6 Mar 2023 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678081675; x=1709617675;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Yd0OrrqZ+iyzGQvZUKyADHqSdNpSnl+PtqMd31fTot4=;
  b=hvE9hmgVRXrIHyVLfIP8/BZlwYOsBs3HuJIbqyQ1kQmmCRQW/IjvsuA8
   Unnd0Qr3Ies8662QorWAey4sKU5g2G7dy/hzoitqeAoYK/q8ZE4hgUzWW
   TgBqhFlxZdBWyFp7+aTmA7+Lv0tVJhjzVs3YFU1WeG/9xFr9Q5wZQjFfC
   bhRvbBeRFfhu2rRRIZBH3vOLQaVKeZy+279ye2dKFyE8eFvQqsCPQtevf
   ZqIcnyqZVwYsF4VfCiq9JmFKYfxYudZE/Jfc7wJcdT0ej7pnrHILTyo/S
   njBu2xD6dwvWYNCo6yMdtcjcw0GL/6dmPEh484ZqbnnLypLI9cPstiA3a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="400299241"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="400299241"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="708526190"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="708526190"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Mar 2023 21:47:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ3hM-00004N-38;
	Mon, 06 Mar 2023 05:47:48 +0000
Date: Mon, 6 Mar 2023 13:47:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x2da:
 unreachable instruction
Message-ID: <202303061327.0kmi4mkJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 083bd7e54e8e2c1d169f21236873272cdf6f409a btrfs: move the printk and assert helpers to messages.c
date:   3 months ago
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061327.0kmi4mkJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=083bd7e54e8e2c1d169f21236873272cdf6f409a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 083bd7e54e8e2c1d169f21236873272cdf6f409a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061327.0kmi4mkJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x2da: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
