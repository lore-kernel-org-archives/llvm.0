Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244D29CA
	for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639246791; x=1670782791;
  h=date:from:cc:subject:message-id:mime-version;
  bh=josm3lV174bc781lDgMgSHyXP26aGs8xEO++n8og6RE=;
  b=C/8FNdrJCIt9dd0aY2POTqF2ir5K4xwmGZmJGoB3Qa01SFSsqn9YYzhh
   nCKjKxb5TbNbjg6QMyIkyQL7HGuUs27DiTKTeCYcyzj71K28w1LfOZFA1
   QgMQa+xJFdeBE+lqJD20n9glOSy/0klKKj+UHjxkCamPphe4deM8iU7w0
   TGmJTvxtr7EL21qkD1FSzucMVXi47ioUkVoKndZvM0xKqmDnkyfRYI6bV
   28q3uTUuFvF9C6Jj8FlrVw90Ix8vnD5fzJ5DEvZyMjFCd6YPSv6Nfc4GJ
   vgaZvcpAZKOtAm0Jan0b7PFSA+o/b7mSQhnS1VhRrwVyynpdGuiA70t+l
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="237284824"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; 
   d="scan'208";a="237284824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2021 10:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; 
   d="scan'208";a="462924153"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2021 10:19:49 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mw6yK-0004wx-Ky; Sat, 11 Dec 2021 18:19:48 +0000
Date: Sun, 12 Dec 2021 02:19:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-14: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202112120221.40vnlfzg-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

Hi Alexei,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: d71fa5c9763c24dd997a2fa4feb7a13a95bab42c bpf: Add kernel module with user mode driver that populates bpffs.
date:   1 year, 4 months ago
config: i386-randconfig-a016-20211210 (https://download.01.org/0day-ci/archive/20211212/202112120221.40vnlfzg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d71fa5c9763c24dd997a2fa4feb7a13a95bab42c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d71fa5c9763c24dd997a2fa4feb7a13a95bab42c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libelf.so when searching for -lelf
   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libelf.a when searching for -lelf
   /usr/bin/ld: cannot find -lelf
   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libelf.so when searching for -lelf
   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libz.so when searching for -lz
   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libz.a when searching for -lz
   /usr/bin/ld: cannot find -lz
   /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libz.so when searching for -lz
>> clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
