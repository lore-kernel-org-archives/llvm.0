Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1D33D2;
	Mon,  3 Apr 2023 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680521885; x=1712057885;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sIPlK0ktvxDOYFpCtLQ1sdCycj60hnMqvf4KsOtbLQk=;
  b=K5Kk08Grt/Jk2iB4aE9rEAv3ns181wMQVUiMBGgnStl3e28CJSv9Bycz
   RqBaEE8x/WS+9zzUxp0F/RIQEEUrLaogGh3KTX9lYQgvIMn4wc+wCykTP
   oXMLLte0ao8aZRejJXuXgOPC0UjN0qsnByDYUvLSI7eWs5G+h/10n4ozs
   a6lyY40VedM31JMMhCqMTMzAJlD5+ef/ZTvml3I5v3dJVSFzihBU0UMBY
   dB1yPkYlgoW9eC1gQ5PwgqDbYo3DHnlr4bVCrS8vfimT+TNZhPLhwmpnI
   iFp1l8yIf1c+EIwqpnVi9CrlrvdW70YPIsDbtPsyuOSKuYbVSlTYkj0mF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404627989"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="404627989"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 04:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="685927812"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="685927812"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 04:38:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjIVf-000OEt-1V;
	Mon, 03 Apr 2023 11:38:03 +0000
Date: Mon, 3 Apr 2023 19:37:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x34d:
 unreachable instruction
Message-ID: <202304031928.bRpddtNr-lkp@intel.com>
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

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
commit: 083bd7e54e8e2c1d169f21236873272cdf6f409a btrfs: move the printk and assert helpers to messages.c
date:   4 months ago
config: x86_64-randconfig-r035-20230403 (https://download.01.org/0day-ci/archive/20230403/202304031928.bRpddtNr-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304031928.bRpddtNr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x34d: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
