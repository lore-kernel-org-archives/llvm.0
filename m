Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335C29CA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639451164; x=1670987164;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kh6Z8nYsIfLv1aPsux0rIDe5N02rrHWe8ujRHJJA6Ss=;
  b=BC/APWTQHc8YCcDfVXzAbTbcOmySh41cd/Kvz+EIcOIgbwzN85VI9f3H
   uoyCx2n6QBhoM5Ujvwzm1nPyYfhLYnRyp7U2lwVMD4ux6i9RjEu12Znxh
   X0FcUgj0IoSrP6kiigJrTvEBc9x5OMtBWJweGPZmrM7oIU/tEQdQq9A1n
   Fc38336z2qAXqEkbaQ/YWDkuJSzI58g0iKJ33WOeSnvJsQXzXMh6vMvjV
   W1yKEWKPu7KsrvL5U316RKOLvLI484rN46YK7PLAeXzIWbo8Z4UrD84e8
   /8fbdk9W4tlWDWmJU4cU/2VRoaqehzW2nupRNYryG4H8DOWStHLbUbSHK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="218899807"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="218899807"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 19:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="464895594"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 19:06:03 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwy8g-0007LW-BV; Tue, 14 Dec 2021 03:06:02 +0000
Date: Tue, 14 Dec 2021 11:05:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: fs/btrfs/compression.o: warning: objtool:
 alloc_compressed_bio()+0x3af: unreachable instruction
Message-ID: <202112141143.euTMArlo-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: f472c28f2e883c3d2781ea6aaaca204e34e93b63 btrfs: determine stripe boundary at bio allocation time in btrfs_submit_compressed_read
date:   7 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211214/202112141143.euTMArlo-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f472c28f2e883c3d2781ea6aaaca204e34e93b63
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f472c28f2e883c3d2781ea6aaaca204e34e93b63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/btrfs/compression.o: warning: objtool: alloc_compressed_bio()+0x3af: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
